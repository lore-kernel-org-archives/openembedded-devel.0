Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 631DF757C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jun 2015 07:19:40 +0000 (UTC)
Received: by pdjm12 with SMTP id m12so1257493pdj.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2015 00:19:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uYuKq7oJAyGyTnycRdkiTWaHJbUK/Gln8wHIfgJo/RM=;
	b=EtwQtAM+YYVpgtxA9iRdoladyCUXk9/gu9cA2iV1Cz5j4btXyQCCGr+QeqknlV5/Ri
	jyTPF/Y6xijnhpDOzfp+nqo8ogG7tWbnBXhCPg0wvMEdhxxLSqL/KDluxNtfuQn4VCpL
	kuGhf9gPrvOnRi2Iw8j7C5zRoIa/dVsYwB7jAiyf7+6En665Ij7z9ecA4SiLzMpqUmJ0
	C+z7A2CeavkX2EZtyVasmD/IrHnba3eaUkXuEux/qPzh+7256rKtl6m0LGDeLuCokp8u
	uuSb63wo+1JDysHkDX6xFL4orsHrEPoMNv4NeAVz0lHROjlYrhZv0Wpb0r6u558zwGrE
	6hPg==
X-Gm-Message-State: ALoCoQlRDakRaXFjr+glo9J288AzwC1dnvVzab+rSGUGRU0t/NwSoVA/v70TIRPlrCcpD7Mp0Bbs
X-Received: by 10.66.145.74 with SMTP id ss10mr57805053pab.28.1433315981864;
	Wed, 03 Jun 2015 00:19:41 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id v5sm19939609pdo.29.2015.06.03.00.19.39
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jun 2015 00:19:41 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2015 12:49:29 +0530
Message-Id: <1433315969-8449-1-git-send-email-naresh.bhat@linaro.org>
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
X-List-Received-Date: Wed, 03 Jun 2015 07:19:43 -0000

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
index 0000000..73ba9b3
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
+RDEPENDS_${PN} = "tk"
+REQUIRED_DISTRO_FEATURES = "x11"
+
+inherit autotools-brokensep pkgconfig
+
+do_configure_prepend () {
+    touch NEWS
+}
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


