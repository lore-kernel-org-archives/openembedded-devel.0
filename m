Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1Tyhfy-0001GJ-Sv
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Jan 2013 12:42:33 +0100
Received: from mail240-tx2-R.bigfish.com (10.9.14.243) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.23; Fri, 25 Jan 2013 10:11:00 +0000
Received: from mail240-tx2 (localhost [127.0.0.1])	by
	mail240-tx2-R.bigfish.com (Postfix) with ESMTP id 0890D320164	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 10:11:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1ee6h1de0h1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1155h)
Received: from mail240-tx2 (localhost.localdomain [127.0.0.1]) by mail240-tx2
	(MessageSwitch) id 1359108657937650_30419;
	Fri, 25 Jan 2013 10:10:57 +0000 (UTC)
Received: from TX2EHSMHS025.bigfish.com (unknown [10.9.14.243])	by
	mail240-tx2.bigfish.com (Postfix) with ESMTP id D8B6642004B	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2013 10:10:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS025.bigfish.com
	(10.9.99.125) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 25 Jan 2013 10:10:56 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 25 Jan 2013 10:10:55 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r0PAAprn015229;
	Fri, 25 Jan 2013 03:10:53 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 25 Jan 2013 18:10:50 +0800
Message-ID: <1359108650-32596-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B29882@freescale.com, b28405@freescale.com,
	Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: [meta-oe/meta-webserver] apache2: fix the race issue of parallel installation
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
X-List-Received-Date: Fri, 25 Jan 2013 11:42:33 -0000
Content-Type: text/plain

fix following race issue when do parallel install
| mkdir: cannot create directory `/home/mypc/workspace/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl_networking-linux/apache2/2.4.3-r1/image/usr/share/apache2': File exists
...
| mkdir: cannot create directory `/home/mypc/workspace/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl_networking-linux/apache2/2.4.3-r1/image/usr/share/apache2': File exists
| make[1]: *** [install-man] Error 1
| make[1]: *** Waiting for unfinished jobs....

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 .../recipes-httpd/apache2/apache2_2.4.3.bb         |    3 ++-
 ...httpd-2.4.3-fix-race-issue-of-dir-install.patch |   21 ++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-dir-install.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
index 9179bca..a221e1d 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.3.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://httpd.apache.org/"
 DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
 SECTION = "net"
 LICENSE = "Apache-2.0"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://server-makefile.patch \
@@ -16,6 +16,7 @@ SRC_URI = "http://www.apache.org/dist/httpd/httpd-${PV}.tar.bz2 \
            file://apache-configure_perlbin.patch \
            file://replace-lynx-to-curl-in-apachectl-script.patch \
            file://apache-ssl-ltmain-rpath.patch \
+           file://httpd-2.4.3-fix-race-issue-of-dir-install.patch \
            file://init"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=eff226ae95d0516d6210ed77dfdf2dcc"
diff --git a/meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-dir-install.patch b/meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-dir-install.patch
new file mode 100644
index 0000000..b948753
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/files/httpd-2.4.3-fix-race-issue-of-dir-install.patch
@@ -0,0 +1,21 @@
+Upstream-Status: Pending
+
+fix following race issue when do parallel install
+| mkdir: cannot create directory `/home/mypc/workspace/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl_networking-linux/apache2/2.4.3-r1/image/usr/share/apache2': File exists
+...
+| mkdir: cannot create directory `/home/mypc/workspace/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl_networking-linux/apache2/2.4.3-r1/image/usr/share/apache2': File exists
+| make[1]: *** [install-man] Error 1
+| make[1]: *** Waiting for unfinished jobs....
+
+-Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
+--- httpd-2.4.3/build/mkdir.sh.orig	2013-01-25 03:47:21.565255420 -0600
++++ httpd-2.4.3/build/mkdir.sh	2013-01-25 03:46:17.833051230 -0600
+@@ -39,7 +39,7 @@
+         esac
+         if test ! -d "$pathcomp"; then
+             echo "mkdir $pathcomp" 1>&2
+-            mkdir "$pathcomp" || errstatus=$?
++            mkdir -p "$pathcomp" || errstatus=$?
+         fi
+         pathcomp="$pathcomp/"
+     done
-- 
1.7.9.7




