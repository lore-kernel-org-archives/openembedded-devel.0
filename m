Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 68CE078207
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 12:54:09 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id v104so71115935wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Mx3jJKTM/5Yty5vWI/ZLKYtzSTKgzsKkEXl3RIm5+fk=;
	b=SU+FhiMH5CGoDPHs5DNfk9MNcn06G40yJe4OSE8RPiNzN6hHaWXd+zFM3V4UX7+sJI
	isZm8MWHouYrXZXE9nNR6N6Gen1ebmD3QuGdDb246zh/8b05AUw6LDssPC1Z+klgBWFX
	ohTQaP8g3tUG2eAWLGUCHtm0JOdIQJQ6E0zD1Y07Lx78lLHoCeDTMhjDZUvzKRKZVTw+
	pd4UwnaTutmUJEX/D/4qD7D2lAUhi9IxAa0ybMarnWkZqwD+T6KOWfDCBBieNHWMra/L
	PaMumAQVyRCr0Zbk0J+fkZuwWdCSOXHRgJi31ga0fNht9SqK8LFhoDz2Ml5K9zSH6FZH
	HqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Mx3jJKTM/5Yty5vWI/ZLKYtzSTKgzsKkEXl3RIm5+fk=;
	b=U20mrCMWBeItsf6PFmCjPnvL2Rn20BlsF6vi0iqViXI+EBph1Tk4HL+c6NMNX3byl9
	/5NJ0it6wxwDkgQnEDmIs+0jDY28q/gdaGlP+SfbUEMeuvX6fVAfWzFei283G0Jdbg7g
	b4cECIV0GdPlLdM5alCZcb3XbjYfaYwiXiSp6UWj1OGu1/yiOTmTyCKxEvWgIao6z0N6
	9qLD4U7Rjh3WuD1nXCJDUYpsdqq916+/P1KtnEdnCnFlKouM7adbMVGoqORP0hI5APCT
	jAeoX3U+YUJRq7TvZktm6ejsdtbnHFjgKzCyOnQvYS6h5CBbALQYtqenwV7MjT6Ih4aS
	EtqA==
X-Gm-Message-State: AODbwcAFouJ0z4sC8B4EPe5yJm/LrrnCJ23FT47ETYLSF7pTKrXKznMZ
	Er+HQcqPSL7jLWSAqqk=
X-Received: by 10.80.164.89 with SMTP id v25mr31027515edb.49.1497185649968;
	Sun, 11 Jun 2017 05:54:09 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.46]) by smtp.gmail.com with ESMTPSA id
	j29sm3650235eda.26.2017.06.11.05.54.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Jun 2017 05:54:09 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Jun 2017 14:54:02 +0200
Message-Id: <1497185642-1678-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [meta-oe] [PATCH] dos2unix: add recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 12:54:09 -0000

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
index 0000000..f3d5173
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
+EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS}"
+EXTRA_OEMAKE_class-native = "ENABLE_NLS="
+
+do_install () {
+    oe_runmake DESTDIR="${D}${base_prefix}" install
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


