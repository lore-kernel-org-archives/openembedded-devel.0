Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 819DF76BD7
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 23:44:32 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so54572154wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Nov 2015 15:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=cFzwam7sVV0wbz1lDYbCYoLir5wwjk+lPKxMvxi8d7k=;
	b=FgV5ChfAJ1Arj+updP3dYuj+zzY/rfIODpOaAU4rHRaz+w7dXG1dH48qp8LMWLcYEm
	xtPrPV9lXctXY274tmll8A2QL3LjTQkL/CBOLD8gwUsVvtomDkCPO5eZ7BCZw30G5o9l
	YD9YDlHtU5a0JNR5+P0hZ57WUcm2ehTcQKAcXI0zd9fr4v4hXZoi98navJXUzK470jra
	Uu1MeglMH/+jwiHgjrZqUOPE7MYeV3ff6UEoCx1VPG0D31ml94CWThON7KF931Mn9fst
	ofq9XmV9nhDtNI4P4P2UGqgPJKl1mEX3UUWiwJjUAEXlrLKVz2Hwc6gtsD3jeRCUd0tf
	5TJQ==
X-Received: by 10.28.51.78 with SMTP id z75mr6034966wmz.51.1446680672639;
	Wed, 04 Nov 2015 15:44:32 -0800 (PST)
Received: from localhost.localdomain (p5B0A127D.dip0.t-ipconnect.de.
	[91.10.18.125]) by smtp.googlemail.com with ESMTPSA id
	184sm5390014wmk.10.2015.11.04.15.44.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Nov 2015 15:44:31 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Nov 2015 00:43:58 +0100
Message-Id: <1446680640-31722-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
References: <1446680640-31722-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 16/18] luajit: drop a note for build machine requirements
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
X-List-Received-Date: Wed, 04 Nov 2015 23:44:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/luajit/luajit_2.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.1.bb b/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
index ba439d0..5cee532 100644
--- a/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
+++ b/meta-oe/recipes-devtools/luajit/luajit_2.1.bb
@@ -24,6 +24,16 @@ EXTRA_OEMAKE = 'CROSS=${HOST_PREFIX} \
                 TARGET_CFLAGS="${TOOLCHAIN_OPTIONS} ${HOST_CC_ARCH}" \
                 TARGET_LDFLAGS="${TOOLCHAIN_OPTIONS}" \
                 TARGET_SHLDFLAGS="${TOOLCHAIN_OPTIONS}" TARGET_STRIP="/bin/echo"'
+
+# Important note: On the build machine bit compatible glibc-dev and libgcc must
+# be installed. E.g if the target architecture has 32 bit (see '-m32' below),
+# 32 bit versions of glibc-dev/libgcc (e.g glibc-devel.i686 / libgcc.i686 on
+# fedora) are required.
+#
+# Otherwise the following error occurs:
+# | /usr/include/gnu/stubs.h:7:27: fatal error: gnu/stubs-32.h: No such file or directory
+# |  # include <gnu/stubs-32.h>
+
 EXTRA_OEMAKE_append_powerpc = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_x86 = ' HOST_CC="${BUILD_CC} -m32"'
 EXTRA_OEMAKE_append_x86-64 = ' HOST_CC="${BUILD_CC}"'
-- 
2.1.0


