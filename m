Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6ED936BCF6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 17:41:09 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VGubE-0002X8-M7 for openembedded-devel@lists.openembedded.org;
	Tue, 03 Sep 2013 19:41:08 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 19:41:08 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 19:41:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 03 Sep 2013 19:41:12 +0200
Message-ID: <l056v3$pjp$1@ger.gmane.org>
References: <1377819594-27497-1-git-send-email-andrea.adami@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
In-Reply-To: <1377819594-27497-1-git-send-email-andrea.adami@gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: [meta-filesystems][PATCH] cramfs: remove, we use mkfs.cramfs from util-linux
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2013 17:41:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-08-13 01:39, Andrea Adami schreef:
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>


> --- .../recipes-filesystems/cramfs/cramfs_1.1.bb       | 29
> ---------------------- 1 file changed, 29 deletions(-) delete mode 100644
> meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
> 
> diff --git a/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb
> b/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb deleted file
> mode 100644 index 0bca0e1..0000000 ---
> a/meta-filesystems/recipes-filesystems/cramfs/cramfs_1.1.bb +++
> /dev/null @@ -1,29 +0,0 @@ -DESCRIPTION = "Builds cramfs filesystems for
> embedded systems" -LICENSE = "GPLv2" -LIC_FILES_CHKSUM =
> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833" -DEPENDS = "zlib" 
> - -PE = "1" - -SRC_URI =
> "http://sourceforge.net/projects/cramfs/files/cramfs/1.1/${BPN}-${PV}.tar.gz"
>
> 
- -
> -SRC_URI[md5sum] = "d3912b9f7bf745fbfea68f6a9b9de30f" -SRC_URI[sha256sum]
> = "133caca2c4e7c64106555154ee0ff693f5cf5beb9421ce2eb86baee997d22368" - 
> -EXTRA_OEMAKE = "\ -    'CC=${CC}' \ -    'CFLAGS=${CFLAGS}' \ -
> 'LDFLAGS=${LDFLAGS}' \ -" - -do_compile_prepend() { -    ln -sf
> GNUmakefile Makefile -} - -do_install() { -    install -d ${D}${bindir} -
> install mkcramfs ${D}${bindir} -    install cramfsck ${D}${bindir} -} - 
> -BBCLASSEXTEND = "native"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSJh84MkyGM64RGpERAs7AAJ9ceR1ppWyopNzCingmWLRgy066YwCbBJz7
Fa5PcIAU6K/+bjJVOQBT16Y=
=SMq9
-----END PGP SIGNATURE-----


