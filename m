Received: from [217.200.184.87] (helo=fepna06-svc.tim.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gremlin@gremlin.it>) id 1M7xw1-0003kB-QQ
	for openembedded-devel@openembedded.org; Sat, 23 May 2009 22:35:13 +0200
Received: from deunan.loc ([217.203.130.17]) by fepna06-svc.tim.it
	(InterMail vM.6.01.06.03 201-2131-130-104-20060516) with ESMTP
	id <20090523202722.JHUZ8052.fepna06-svc.tim.it@deunan.loc>
	for <openembedded-devel@openembedded.org>;
	Sat, 23 May 2009 22:27:22 +0200
Message-ID: <4A185B31.8050003@gremlin.it>
Date: Sat, 23 May 2009 22:23:13 +0200
From: Alessandro GARDICH <gremlin@gremlin.it>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
Subject: trouble with ext2 filesystem
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
X-List-Received-Date: Sat, 23 May 2009 20:35:14 -0000
Content-Type: multipart/mixed; boundary="------------010207040707000803090405"

--------------010207040707000803090405
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi all

I notice a problem of the generated filesystem

MACHINE = "qemux86"
DISTRO = "kaeilos"
IMAGE_FSTYPES = "ext2"
IMAGE_ROOTFS_SIZE = "102400"


building console-image I obtain a .ext2 filesystem with
Free blocks:              89357
Free inodes:              87

notice ... only 87 free inodes !!!

after my small and trial patch this is the result
Free blocks:              86302
Free inodes:              24527

maybe 4096 could be too small ... maybe 10k could be good, your choice.

At now I modify qemux86.conf cause usually EXTRA_IMAGECMD is in the 
machine config file, but to add hardware specific parameters (flash size 
  and erase size). I'm not sure if is the right place. Probably in the 
distro configuration could be better.

thanks in advance



-- 
  /------------------------------------------------\
|     Alessandro Gardich : gremlin#gremlin!it      |
  >------------------------------------------------<
|  I never saw a wild thing sorry for itself.      |
|  A small bird will drop frozen dead from a bough |
|  without ever having felt sorry for itself.      |
  \------------------------------------------------/

diff --git a/conf/machine/qemux86.conf b/conf/machine/qemux86.conf
index c251216..23436ce 100644
--- a/conf/machine/qemux86.conf
+++ b/conf/machine/qemux86.conf
@@ -16,3 +16,5 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-rp"
 
 GLIBC_ADDONS = "nptl"
 GLIBC_EXTRA_OECONF = "--with-tls"
+
+EXTRA_IMAGECMD_ext2 = "-i 4096"

--------------010207040707000803090405--
