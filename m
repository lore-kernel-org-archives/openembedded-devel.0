Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC4B60DAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 15:33:31 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VtJ7q-0005yF-9i for openembedded-devel@lists.openembedded.org;
	Wed, 18 Dec 2013 16:33:30 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:33:30 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2013 16:33:30 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 18 Dec 2013 16:33:24 +0100
Message-ID: <l8sf7j$ksk$1@ger.gmane.org>
References: <1387380021-20465-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
In-Reply-To: <1387380021-20465-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.6
Subject: Re: [meta-networking][PATCH] inetutils: fix compile error when PATH_PROCNET_DEV is undefined
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
X-List-Received-Date: Wed, 18 Dec 2013 15:33:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Eric Bénard schreef op 18-12-13 16:20:
> patch taken from : 
> http://repository.timesys.com/buildsources/i/inetutils/inetutils-1.9/inetutils-1.9-PATH_PROCNET_DEV.patch

Put
> 
that in the patch itself please and also add an Upstream-Status tag.

> 
> Signed-off-by: Eric Bénard <eric@eukrea.com> --- 
> .../inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch   | 14
> ++++++++++++++ .../recipes-connectivity/inetutils/inetutils_1.9.1.bb
> |  1 + 2 files changed, 15 insertions(+) create mode 100644
> meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch
>
>  diff --git
> a/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch
> b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch
>
> 
new file mode 100644
> index 0000000..54733be --- /dev/null +++
> b/meta-networking/recipes-connectivity/inetutils/inetutils-1.9.1/inetutils-1.9-PATH_PROCNET_DEV.patch
>
> 
@@ -0,0 +1,14 @@
> +diff -Naur inetutils-1.9.orig/ifconfig/system/linux.c
> inetutils-1.9/ifconfig/system/linux.c +---
> inetutils-1.9.orig/ifconfig/system/linux.c	2012-01-04 16:31:36.000000000
> -0500 ++++ inetutils-1.9/ifconfig/system/linux.c	2012-01-04
> 16:40:53.000000000 -0500 +@@ -49,6 +49,10 @@ + #include "../ifconfig.h" +
>  + ++#ifndef PATH_PROCNET_DEV ++  #define PATH_PROCNET_DEV
> "/proc/net/dev" ++#endif ++ + /* ARPHRD stuff.  */ + + static void diff
> --git a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb
> b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb index
> d12ad39..97fc6a1 100644 ---
> a/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb +++
> b/meta-networking/recipes-connectivity/inetutils/inetutils_1.9.1.bb @@
> -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/inetutils/inetutils-${PV}.tar.gz
> \ file://rsh.xinetd.inetutils \ file://telnet.xinetd.inetutils \ 
> file://tftpd.xinetd.inetutils \ +
> file://inetutils-1.9-PATH_PROCNET_DEV.patch \ "
> 
> SRC_URI[md5sum] = "944f7196a2b3dba2d400e9088576000c"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSscBEMkyGM64RGpERAjjTAJ49RWAG1QHY+6fBcrK/NrxvnfYT8ACbBn1O
W8nFexfgdpBRidfeDadBvrU=
=meB2
-----END PGP SIGNATURE-----


