Received: from [217.200.184.87] (helo=fepna12-svc.tim.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1M8Va9-0000Uh-F1
	for openembedded-devel@openembedded.org; Mon, 25 May 2009 10:31:04 +0200
Received: from deunan.loc ([217.203.151.193]) by fep04-svc.tim.it
	(InterMail vM.6.01.06.03 201-2131-130-104-20060516) with ESMTP
	id <20090524073058.GCTR21239.fep04-svc.tim.it@deunan.loc>
	for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 09:30:58 +0200
Message-ID: <4A18F6B7.8060708@gremlin.it>
Date: Sun, 24 May 2009 09:26:47 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <4A185B31.8050003@gremlin.it>
	<1243111410.4226.109.camel@lenovo.internal.reciva.com>
In-Reply-To: <1243111410.4226.109.camel@lenovo.internal.reciva.com>
Subject: Re: trouble with ext2 filesystem
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
X-List-Received-Date: Mon, 25 May 2009 08:31:29 -0000
Content-Type: multipart/mixed; boundary="------------060600050109020906010802"

--------------060600050109020906010802
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Phil Blundell wrote:
> On Sat, 2009-05-23 at 22:23 +0200, Alessandro GARDICH wrote:
>> At now I modify qemux86.conf cause usually EXTRA_IMAGECMD is in the 
>> machine config file, but to add hardware specific parameters (flash size 
>>   and erase size). I'm not sure if is the right place. Probably in the 
>> distro configuration could be better.
> 
> The distro config probably is the right place for this.  After all, the
> number of inodes you need depends primarily on the number of files that
> you're going to ship in the rootfs, and that in turn is primarily
> influenced by the DISTRO's policies rather than by any inherent aspect
> of the MACHINE.
> 
> The other uses of EXTRA_IMAGECMD that I guess you're thinking of are
> mostly to do with jffs2 parameters, which are rather different in that
> they're determined by the specifics of the hardware in use and hence do
> go with the MACHINE rather than the DISTRO.
> 
> p.
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

true, reform the patch for kaeilos.conf



-- 
  /------------------------------------------------\
|     Alessandro Gardich : gremlin#gremlin!it      |
  >------------------------------------------------<
|  I never saw a wild thing sorry for itself.      |
|  A small bird will drop frozen dead from a bough |
|  without ever having felt sorry for itself.      |
  \------------------------------------------------/

diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
index 718239b..94387e3 100644
--- a/conf/distro/kaeilos.conf
+++ b/conf/distro/kaeilos.conf
@@ -42,6 +42,8 @@ DISTRO_TYPE ?= "debug"
 # Also, it appears that no locales fit in 16Mb for now. "C" locale rules!
 IMAGE_LINGUAS = '${@base_less_or_equal("ROOT_FLASH_SIZE", "16", "", "en-us", d)}'
 
+# increase inode/block ratio for ext2 filesystem 
+EXTRA_IMAGECMD_ext2 = "-i 4096"
 
 # set feed path variables
 FEED_BASEPATH = "feeds/2008/${ANGSTROM_PKG_FORMAT}/${LIBC}/"

--------------060600050109020906010802--
