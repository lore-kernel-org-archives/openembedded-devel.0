Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 010A9782E4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 08:49:21 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id v20so11472605lfa.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jun 2017 01:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=htWJ0lFZ+AMATMdkF24IKuErvL6YU0gB/ZkNqqmIZT0=;
	b=mBQxbPPYEIEnQWt5bVPY7mGHRvuJURgd7HhTjNp7znvGOFEFvfNoQL+SkPs7YQNzHv
	+o9U831Q017P9Zmwi1bsMvlY1PZ59PrF1LerePTpGBpMkSAwiF6cTDGbZZTcH9MpPOrv
	KPLV+jfbFux17ckHxXfH1Hee4mr2XeiPKSStwQgSQVLUNkg6A5Ffeb5IcDwGEAB6dHfp
	Qvbh+DyEgtLfCB1KzB2jcV7KtP/NTZV8ZbRFxmc6gwqDhIlWsnNtDeIX3t1hlEfOIx4w
	1hpHWqMvrhKGBsylvJ98cFWmfYHvsu0ce4wnlFSNJJiEDgyLejNYLlOt7Jm0UwkMO5Sr
	uEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=htWJ0lFZ+AMATMdkF24IKuErvL6YU0gB/ZkNqqmIZT0=;
	b=kZSRkqiNSjaxCF62dylkRwemPq4KvzO9Xvt6Z/wZCJoZSI7biO20hS3i+Z00f7KVKC
	DKcHCi6YWddOVBCwb0zcGnJIELbHBZrMb4rhRxEUI9UHjeeCxiejQb36SozikiFZfaKZ
	kngafdrt0nXzlXIuAWgPfl41eStahmyN4iKzVDUjiTZBpb4OzqIqO0HgtQx7zsEepVOn
	hzg0HFAjFYW0emtwJrlSi6UVVibc7tqFZoSjyaHvCoSBbtGyxHeIZq4cflwPsTpkRvXd
	aSfkjj972CtQehg4Dz7W6orwU/fz+onk9MUx0pfrR7TUrLyWn+pPH50a0q0VGmelk+aD
	jhSQ==
X-Gm-Message-State: AKS2vOyxw2NF8IfRcIvWOOeIpdyAbQMoQXboMMV3tTVIXX6qzvyiPOYT
	6p+wMbUNKYBOO2vC
X-Received: by 10.80.147.26 with SMTP id m26mr1310601eda.146.1497343762071;
	Tue, 13 Jun 2017 01:49:22 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.46]) by smtp.gmail.com with ESMTPSA id
	w12sm5224409edd.21.2017.06.13.01.49.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Jun 2017 01:49:20 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jun 2017 10:49:13 +0200
Message-Id: <1497343753-4793-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH V2] dos2unix: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jun 2017 08:49:22 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The Dos2unix package includes utilities dos2unix and unix2dos to
convert plain text files in DOS or Mac format to Unix format and
vice versa.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb

diff --git a/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb b/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
new file mode 100644
index 0000000..abf7d1c
--- /dev/null
+++ b/meta-oe/recipes-support/dos2unix/dos2unix_7.3.4.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Convert text file line endings between CRLF and LF"
+DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
+unix2dos to convert plain text files in DOS or Mac format to Unix \
+format and vice versa."
+HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
+SECTION = "support"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f3f"
+
+SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
+
+# Release 7.3.4
+SRCREV = "8381ba4e1c4cd5ce98ebd9c24726d51cb203cde0"
+
+S = "${WORKDIR}/git/dos2unix"
+
+inherit gettext perlnative
+
+# The dos2unix NLS relies on po4a-native, while po4a recipe is
+# provided by meta-perl layer, so make it optional here, you
+# need have meta-perl in bblayers.conf before enabling nls in
+# PACKAGECONFIG.
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[nls] = "ENABLE_NLS=1,ENABLE_NLS=,po4a-native"
+
+EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS} LDFLAGS_USER='${LDFLAGS}'"
+EXTRA_OEMAKE_class-native = "ENABLE_NLS="
+
+do_install () {
+    oe_runmake DESTDIR="${D}${base_prefix}" install
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


