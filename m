Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF9873236
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2015 09:17:08 +0000 (UTC)
Received: by pacrp13 with SMTP id rp13so4687925pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 May 2015 02:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6KZ/15pTBu3giV3LlSlqexr6GDNg119ZR8gzPR9BuT8=;
	b=ZkayeHcLC3lQlZhSaN4fhxKlRB8Rygy/EdUAYEtv78Z1h9bqS/GAk14/m1Mdgx1LY7
	8ViLZLPwRF+OSbQXVcSFUMv/NlsJuzwH7ByF+ItHO+1FzVDce5qOHN0rHvRRu6IFVh7l
	P8tiv0U6XjUHt2HtEBnl5SCk2mNViGma8KWd+BtSdhWlEgqvlzEXLKmItAgLYV+yMCNW
	dWf4yqWIfR//+UClVFt9JMegnGmGEtIOxhZZU5GGay73gw27s8iT8Tb/eL84kj2aejEA
	FKy5EV5dQbjEBNh+bWrMaLKNlXkD00SmogWwT0vOnk2WCqauIZGslKajXQG3cNoH1u6H
	YHdw==
X-Gm-Message-State: ALoCoQk5OqxIMGmfBnRhufdI0fe4ZD9Me2w3HJ14/oGAhoM90f+GlOSgQbt121/d/Kep+nPxPZe4
X-Received: by 10.70.42.13 with SMTP id j13mr13446621pdl.90.1432891029288;
	Fri, 29 May 2015 02:17:09 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id fd9sm4924474pab.16.2015.05.29.02.17.07
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 29 May 2015 02:17:08 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 May 2015 14:46:57 +0530
Message-Id: <1432891017-8483-1-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
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
X-List-Received-Date: Fri, 29 May 2015 09:17:08 -0000

Add xorriso v1.4.0 based on the discussions
http://patchwork.openembedded.org/patch/91143/
http://lists.openembedded.org/pipermail/openembedded-devel/2015-April/100981.html

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
Signed-off-by: Gaurang Shastri <gshastri@juniper.net>
---
 .../recipes-utils/xorriso/xorriso_1.4.0.bb         |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb

diff --git a/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
new file mode 100644
index 0000000..1ae325b
--- /dev/null
+++ b/meta-filesystems/recipes-utils/xorriso/xorriso_1.4.0.bb
@@ -0,0 +1,34 @@
+DESCRIPTIONS = "xorriso copies file objects from POSIX compliant filesystems into Rock Ridge enhanced ISO 9660 filesystems and allows session-wise manipulation of such filesystems"
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
+inherit autotools
+
+SRC_URI = "http://www.gnu.org/software/${BPN}/${BPN}-${PV}.tar.gz"
+
+do_configure () {
+    touch NEWS
+    libtoolize --force
+    aclocal
+    autoheader
+    automake --force-missing --add-missing
+    autoconf
+    oe_runconf
+}
+
+BBCLASSEXTEND = "native"
+
+SRC_URI[md5sum] = "ec79fd2736b8da76e7a870e27cadf6fa"
+SRC_URI[sha256sum] = "0bd1e085015b28c24f57697d6def2fe84517967dc417554c0c3ccf1685ed0e56"
-- 
1.7.9.5


