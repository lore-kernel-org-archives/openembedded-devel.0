Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1LNUnW-0003Kn-U0
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 17:10:23 +0100
Received: from gandalf.denix.org ([71.255.246.155]) by vms173007.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KDI004AFSAWFSQ0@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	15 Jan 2009 09:57:02 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 17CE16B83B5; Thu,
	15 Jan 2009 10:58:23 -0500 (EST)
Date: Thu, 15 Jan 2009 10:58:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <gkmmn6$pmf$1@ger.gmane.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090115155823.GC15943@denix.org>
MIME-version: 1.0
References: <20090115061418.GA13352@denix.org> <gkmmn6$pmf$1@ger.gmane.org>
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
X-List-Received-Date: Thu, 15 Jan 2009 16:10:24 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jan 15, 2009 at 07:56:37AM +0100, Koen Kooi wrote:
> On 15-01-09 07:14, Denys Dmytriyenko wrote:
>
>> libvolume-id-dev does not provide the actual .so library, but it contains 
>> a
>> symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host one!)
>> instead of ../../lib/ one...
>
> That's the intended behaviours, since installing the packages will have it 
> point to ${libdir}/libvolume.so.0 on your device. I'm not sure if we want 
> to patch every package to use relative symlinks.

So far, all other packages I looked at, have relative or same-dir symlinks in 
corresponding -dev (libc, libpng, jpeg, gnutls etc)
Since -dev gets run through shlib magic outside of the main package with 
the actual .so, relative or same-dir symlinks are broken, leading to a normal 
behavior :)

>> The first patch attached fixes this in udev and should be a no brainer. 
>> Unless
>> someone objects, I'll push it in in a day or two.
>>
>> Since I was debugging the code which actually does this shlib magic in
>> package.bbclass, I thought it might be useful to prevent this kind of 
>> issues
>> in the future by skipping symlinks while looking for SONAME/NEEDED in the
>> objdump - please see the second patch attached and provide feedback.
>
> The change to package.bbclass looks OK to me, if that gets applied we can 
> leave out the udev patch.

That's the goal :)

-- 
Denys


