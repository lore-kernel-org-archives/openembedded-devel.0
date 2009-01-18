Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LOPDX-0001cX-Je
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 05:24:59 +0100
Received: from gandalf.denix.org ([71.255.246.155]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KDN00FWSFY07ID1@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Sat,
	17 Jan 2009 22:18:06 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 657FD6B83B5; Sat,
	17 Jan 2009 23:18:00 -0500 (EST)
Date: Sat, 17 Jan 2009 23:18:00 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <20090115155159.GB15943@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090118041800.GA852@denix.org>
MIME-version: 1.0
References: <20090115061418.GA13352@denix.org>
	<20090115073709.GB7020@gmail.com> <20090115155159.GB15943@denix.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [RFC] Fix udev pulling in libvolume-id-dev
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Jan 2009 04:24:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 15, 2009 at 10:51:59AM -0500, Denys Dmytriyenko wrote:
> On Wed, Jan 14, 2009 at 11:37:10PM -0800, Khem Raj wrote:
> > On (15/01/09 01:14), Denys Dmytriyenko wrote:
> > > I was debugging the strange behavior of one of my boxes pulling in libc6-dev 
> > > into the filesystem image and it happened to be because udev pulled in 
> > > libvolume-id-dev instead of libvolume-id0... It worked as expected on the 
> > > other box, though.
> > > 
> > > Several people on IRC have seen this lingering bug before, but no fix was 
> > > available. Koen mentioned it got fixed for him by rebuilding udev...
> > > 
> > > After some investigation I found out that both libvolume-id packages (-dev and 
> > > regular) are registered to provide libvolume_id.so.0 and the one appearing 
> > 
> > I think -dev provides libvolume_id.so and libvolume-id provides
> > libvolume-id.so.* they are different. Our shlib handler should be able
> > to figure that out. I still wonder what caused it to pull libc-dev
> > though.
> 
> The shlib handler from the package.bbclass examines every package by running 
> objdump and looking for SONAME/NEEDED sections of all the executables and 
> lib*.so files. So, the real .so library from libvolume-id gets identified as 
> a provider for libvolume_id.so.0, which is correct. Then libvolume-id-dev 
> gets examined, and it does not provide any shlibs. But since it has a symlink, 
> which points to a real host .so, objdump picks up its SONAME and -dev gets 
> also identified as a provider of libvolume_id.so.0, which is wrong.
> 
> Since most of other libraries with -dev split have either relative symlinks 
> (../..) or pointing to the same directory, they never get into this issue, 
> becuase when -dev is examined, the symlink is broken, as -dev gets installed 
> into a separate directory.
> 
> That's the reason for my patch to package.bbclass to skip symlinks when 
> running objdump.
> 
> libc-dev gets pulled in by libvolume-id-dev, for some reason, according to:
> libvolume_id_dev -> libc6_dev [style=dotted];
> 
> > > last in os.walk() gets pulled in by udev. The order of files provided by 
> > > os.walk() depends on parallel builds and phase of the Moon.
> > > 
> > > libvolume-id-dev does not provide the actual .so library, but it contains a 
> > > symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host one!) 
> > > instead of ../../lib/ one...
> > > 
> > > The first patch attached fixes this in udev and should be a no brainer. Unless 
> > > someone objects, I'll push it in in a day or two.
> > 
> > Seems like we need this to work in a sysrooted env. 
> 
> With the patch to package.bbclass it can be left as is.
> 
> > > Since I was debugging the code which actually does this shlib magic in 
> > > package.bbclass, I thought it might be useful to prevent this kind of issues 
> > > in the future by skipping symlinks while looking for SONAME/NEEDED in the 
> > > objdump - please see the second patch attached and provide feedback.
> > 
> > But we need to process symlinks to find out package that contains target so that we can create
> > dependency on the package that contains target like in this case we need
> > to create dependency on libvolume-id for libvolume-id-dev because the
> > symlink points to a file provided by libvolume-id
> 
> I'm not sure where this dependency gets built, but I believe it is not done by 
> the package_do_shlibs() code from package.bbclass I'm referring to. This code 
> populates ${STAGING_DIR_HOST}/shlibs, listing .so each pkg provides.
> 
> I guess we need more Core devs to look into this issue to verify the safety of 
> this patch.

Otavio was using patched package.bbclass (as mentioned above) for a few days 
and found it working fine and fixing udev issue for him.

Khem, please let me know if you still disagree with the proposed fix. Or if 
anybody else has any objections, please speak up. Otherwise I'd like to check 
in the fix for the package.bbclass in a day or two. Thanks.

-- 
Denys


