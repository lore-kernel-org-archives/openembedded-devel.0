Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 587C7757A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 09:24:47 +0000 (UTC)
Received: by payr10 with SMTP id r10so3440074pay.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 02:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DpkktL158wmXrCGHWGBNsDqpwqZT/gcsm498cvsJRzw=;
	b=E8sF7IvoOnmu5HYP96E3VdcgrslmA299BDnQwuJLbFhuxcUI9nUIavFW1/o3R8aoPC
	gjPpFQU75DT/6D3s3qWraQWZELnCab70R/B980aFbUqTPZPiYg/ok3xYmTMqjQq1Pfx1
	m6XRw1X2V8UnAaqQSSNFKtbaojQFCiAiQ8tGIiohOn8Ra+zB0cSGuaT7tY9FIsPqFqN1
	BdS3jDDMuEjRYPQ027TyTjSQftE2HInlo0fkhnJlhEFmw6kA6kax6ugMIPOqWDEVgjON
	jS37kOTZQfpcqKBPeleCOIo0S9ck0JFAXTp65gYbsAvp4TrGkhD/tKtp4goV9ZVf4J5g
	i/kg==
X-Gm-Message-State: ALoCoQlJ++7QN4Fn9BBJbv5r9dXnPezutUNMy5uYktvCJ1TiL5kUtwvRb6IaVGnF7gPf4N1TXPAJ
X-Received: by 10.68.201.138 with SMTP id ka10mr20712559pbc.6.1433323489077;
	Wed, 03 Jun 2015 02:24:49 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id x2sm128076pda.31.2015.06.03.02.24.46
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 02:24:48 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2015 14:54:32 +0530
Message-Id: <1433323472-24022-1-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
Cc: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Subject: [meta-filesystems][PATCH] xorriso: Add xorriso v1.4.0
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
X-List-Received-Date: Wed, 03 Jun 2015 09:24:48 -0000

Add xorriso v1.4.0 based on the discussions
http://patchwork.openembedded.org/patch/91143/
http://lists.openembedded.org/pipermail/openembedded-devel/2015-April/100981.html
We have tested this package with
Montavista CGE product - http://www.mvista.com/ and
luvOS distribution - https://01.org/linux-uefi-validation build.
Inherit the pkgconfig to avoid the below error,
..
...
| disabled use of O_DIRECT with input of -as cdrskin
| luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
configure: line 14352: syntax error near unexpected token `LIBCDIO,'
| luv-yocto/build/tmp/work/aarch64-oe-linux/xorriso/1.4.0-r0/xorriso-1.4.0/
configure: line 14352: `    PKG_CHECK_MODULES(LIBCDIO, libcdio >= $LIBCDIO_REQUIRED)'
...
....

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
---
 .../recipes-utils/xorriso/xorriso_1.4.0.bb         |   29 ++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
new file mode 100644
index 0000000..8b181ca
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "xorriso copies file objects from POSIX compliant filesystems \
+into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise \
+manipulation of such filesystems"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa"
+SRC_URI[sha256sum] = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56"
+
+PACKAGECONFIG ??= "acl attr zlib bzip2 readline"
+PACKAGECONFIG[acl] = "--enable-libacl,--disable-libacl,acl,"
+PACKAGECONFIG[attr] = "--enable-xattr,--disable-xattr,attr,"
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
+PACKAGECONFIG[bzip2] = "--enable-libbz2,--disable-libbz2,bzip2,"
+PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline,"
+
+inherit autotools-brokensep pkgconfig
+
+do_configure_prepend () {
+    touch NEWS
+}
+
+RDEPENDS_${PN} = "tk"
+REQUIRED_DISTRO_FEATURES = "x11"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


