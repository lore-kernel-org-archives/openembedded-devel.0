Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id AACF172312
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 10:07:32 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id bs8so14861775wib.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Nov 2014 02:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J0b40Zg91pHtDaUZZJ0S3oYiG42sRHXeS/wad1swP4k=;
	b=oyjSj5K5JL9zWO9VOHKTmgRugQineYNOKLL+sm5tiTq9awDol3b1vvvDTxhYwVstTF
	T0bhygjkymgDtjyp49dH5EZBfziQMXDOl1wN97Loh3K6S37WZm5BVkTuj4NbY6Yydo2N
	xHHfEoNptjaa1J+mjJ8OsqaOWxxzq5zhBB2F/0LxiEndZFnnb6wko0S8gsHH7Ob3vLZk
	Z4BccXkAy3pGlw9BQ80j5MEqx7DiweyHl2cIta7d8GS7mfc1Og5AlbpqL8R88qlO2Td4
	j4DkKiEQpfCqdNIWFcsRHmbhlTWcgyE7JYQjLeskCEPN249jXUgQcQXw4Q73arTIJbVe
	GJEw==
X-Received: by 10.180.76.201 with SMTP id m9mr39414666wiw.52.1416996452065;
	Wed, 26 Nov 2014 02:07:32 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dc8sm6607877wib.7.2014.11.26.02.07.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Nov 2014 02:07:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Nov 2014 11:07:31 +0100
Message-Id: <1416996451-2740-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.1.3
Subject: [meta-oe][meta-systemd][PATCH] cronie: rename .bbappend to match all versions
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
X-List-Received-Date: Wed, 26 Nov 2014 10:07:36 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../cronie/{cronie_1.4.11.bbappend => cronie_%.bbappend}                 | 1 -
 1 file changed, 1 deletion(-)
 rename meta-systemd/oe-core/recipes-extended/cronie/{cronie_1.4.11.bbappend => cronie_%.bbappend} (99%)

diff --git a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend b/meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend
similarity index 99%
rename from meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend
rename to meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend
index 181b878..f006b3f 100644
--- a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/cronie/cronie_%.bbappend
@@ -1,4 +1,3 @@
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
-
-- 
2.1.3


