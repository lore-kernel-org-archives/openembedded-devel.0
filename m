Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id AA5707567B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jun 2015 14:48:46 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so63450098igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jun 2015 07:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HHoT66VASIBeBZ1cXAcZSk/cKALYaS7FIlK1TKUy5pM=;
	b=nOl7WF/8+Mzvd6QCjnDfjf67vbipnMt7abtvph2X1Qd7MnwCODIxyR1i3kR57+5m5A
	NtqrvU/ZJz0BZdv/hmanglKIa+gu+EK3/X0UOnllVHh/onkGzYgpIX1Thzz7kmB3IvQU
	2lrIi5TTu/tjNmT40berC0bS9apmx8QzuX6rYiPjGH1ZoeepR1vh0L4eK9QMCwfICSN6
	xuz+dplx5JhtPco4hSthFfg/z2FG/HETxEVkYyuC6m4FlBVjJ+unxid+q6lINmQusp+z
	5RhWFQZcVZXFgEvUpVFQVqLUBCA7XcEZRmSyXfwR8pxN91T+dIS4kG+bccRN7QGuJ3sn
	Kx8w==
X-Gm-Message-State: ALoCoQnvQQZ9tFnxFlIQ9OsXWMRbI5I2Zw02WDoOtpV3SJFkJuy+zZE8JLjfiUj+7/Qq/eLFqHAW
X-Received: by 10.43.56.146 with SMTP id wc18mr29584308icb.24.1433170127220;
	Mon, 01 Jun 2015 07:48:47 -0700 (PDT)
Received: from Latitude-E6430.domain.name (64.2.3.194.ptr.us.xo.net.
	[64.2.3.194]) by mx.google.com with ESMTPSA id
	f15sm10530275iof.36.2015.06.01.07.48.43
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Jun 2015 07:48:46 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Jun 2015 20:18:09 +0530
Message-Id: <1433170089-9030-1-git-send-email-naresh.bhat@linaro.org>
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
X-List-Received-Date: Mon, 01 Jun 2015 14:48:47 -0000

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
 .../recipes-utils/xorriso/xorriso_1.4.0.bb         |   30 ++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
new file mode 100644
index 0000000..2f81f0d
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
@@ -0,0 +1,30 @@
+DESCRIPTIONS = "xorriso copies file objects from POSIX compliant filesystems \
+into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise \
+manipulation of such filesystems"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+# with, without, depends, rdepends
+#
+PACKAGECONFIG ??= "acl attr zlib bzip2 readline"
+PACKAGECONFIG[acl] = "--enable-libacl,--disable-libacl,acl,"
+PACKAGECONFIG[attr] = "--enable-xattr,--disable-xattr,attr,"
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib,"
+PACKAGECONFIG[bzip2] = "--enable-libbz2,--disable-libbz2,bzip2,"
+PACKAGECONFIG[readline] = "--enable-libreadline,--disable-libreadline,readline,"
+
+RDEPENDS_${PN} = "tk"
+
+inherit autotools-brokensep pkgconfig
+
+SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
+
+do_configure_prepend () {
+    touch NEWS
+}
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa"
+SRC_URI[sha256sum] = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56"
-- 
1.7.9.5


