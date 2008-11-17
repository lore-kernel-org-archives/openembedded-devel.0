Received: from [206.46.173.3] (helo=vms173003pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1L1xO6-0004zh-VL
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Nov 2008 07:15:10 +0100
Received: from gandalf.denix.org ([71.255.226.167]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0KAG003V2RX0J1KA@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	17 Nov 2008 00:12:37 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CBF3B6B83B5; Mon,
	17 Nov 2008 01:12:35 -0500 (EST)
Date: Mon, 17 Nov 2008 01:12:35 -0500
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <59e7e6f90811162118o68610184x6103071ebed9405d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081117061235.GA2741@denix.org>
MIME-version: 1.0
References: <59e7e6f90811161949k4020d983kf32263237b20bf9b@mail.gmail.com>
	<59e7e6f90811162118o68610184x6103071ebed9405d@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: libgcrypt tries to link with host libc
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
X-List-Received-Date: Mon, 17 Nov 2008 06:15:19 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Nov 16, 2008 at 11:18:49PM -0600, Mike Turquette wrote:
> Hi all,
> 
> I'm attempting to write an external-csl-toolchain_2007q3-51 recipe for
> Poky.  This uses Poky's POKYMODE mechanism which is why I've copied
> the poky list on this email, however I think my error isn't
> necessarily Poky-specific as it has wider applications for anyone
> using an external toolchain.
> 
> Attached is external-csl-toolchain_2007q3-51.bb.  It is basically a
> clone of Poky's external-csl-toolchain_2006q3-27.bb except that
> do_stage adds more stuff.  ${STAGING_DIR_TARGET}${base_libdir} does
> have libc.so.6 in it but libtool doesn't seem to be picking it up and
> instead tries (and fails) to link against my host /lib/libc.so.6,
> which seems like a Very Bad Thing to me.
> 
> Why can't libtool find and use the libc I have in staging?  What do
> the normal compiled toolchains provide that I am not?  Also, does
> binconfig.bbclass know the difference between *-native packages and
> cross-compiled ones?  I know prebuilt toolchains aren't all the rage
> with OE devs, but some customers refuse to use toolchains built from
> source :(

Mike,

I'm sorry I'm not that familiar with Poky and the way it works with external 
toolchains. But after numerous fixes (many of which are commited to OE .dev 
branch) and several lines of additional configuration in my local.conf, I was 
able to use pre-built binary CodeSourcery 2007q3 toolchain, as well as 
MontaVista Pro 5, by using the standard meta/external-toolchain.bb recipe.

-- 
Denys


