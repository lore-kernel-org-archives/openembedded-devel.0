Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 78D967723B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 16:18:25 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so213311wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Dec 2016 08:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=7cIYQdEWPaAAvEJwn0zXN3UomK1xupYEs3O/a0a6IpU=;
	b=hEUJgUpXN1pW/C0OqjZBqiTsW2UCxSlOROGMniPz6/2JZUewO4/cc3X5lF/B+b3qFR
	pgebP38GqUloYK9OKbcOleqcxpTn1u+om0479pZYHsy/dSYGtfAWJ0nR94RKK4r/GEO5
	5gdIE+T5BxXht0XlorOf+mG3sSIHvZUyVG5AobggMaCQEkOJITYj/WTmtKg7nv3/Kv+x
	WuY/yFYF4n6tGqTyXyEtR6NYexKpnPWVIHoxx2aElp7/qGhgXumLlcjxUwujEzKZqV98
	sZEcpaELjfR9qpIfQ60Jrmbkw1yhjcPF3YX08ZSVJvvmTvsNmP+uAcltF6XqIfct7zcc
	qSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7cIYQdEWPaAAvEJwn0zXN3UomK1xupYEs3O/a0a6IpU=;
	b=Dj5rS7P9wn3KKEHOSZKu2uvPp2F1CKN/Tzxee2uvuDa4vV+uckgkPIR69AAbvtbcnS
	sH0mZ63mIpOMw+5stfQjdFsoxN5VGfwkQEYzGZ+HH/oiBm67KTdeUTPXhLGRYeVMMxXZ
	xTOk9UkZL1B3UieSdegcys+969qCyqykmiIDqMisSxPGdJP24nzQoJ0CdcmlaSglLHC0
	JbQmELlsFah+ZU0a6s8HF960g4O4o0HfOY1zrB16IpQwPi8LsM3NSR5yOGv8Q0kKE9J9
	k/r2zJhV2M3KJcPV72dVvXDirHTPAiisNEFgs+15cbE2RNnDj/3cbc+jBMaA28LWcEYY
	tJWQ==
X-Gm-Message-State: AKaTC03rfNdhFXuBYzWbaeVZF7ud85u+Wfla/rLWmozPoI2Lqllhbg7uRTDstQFa0k18yw==
X-Received: by 10.28.144.70 with SMTP id s67mr7664814wmd.138.1481732306022;
	Wed, 14 Dec 2016 08:18:26 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by smtp.gmail.com with ESMTPSA id
	ba10sm67884295wjb.32.2016.12.14.08.18.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Dec 2016 08:18:25 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 14 Dec 2016 17:17:43 +0100
Message-Id: <1481732263-17049-1-git-send-email-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.5.5
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [meta-oe][PATCH] tinymembench: fix QA warning for GNU_HASH
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
X-List-Received-Date: Wed, 14 Dec 2016 16:18:25 -0000

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
index 38e71be..5968d82 100644
--- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
+++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
@@ -13,6 +13,8 @@ SRC_URI = "git://github.com/ssvb/tinymembench.git"
 
 S = "${WORKDIR}/git"
 
+TARGET_CC_ARCH += "${LDFLAGS}"
+
 do_install() {
     install -d ${D}${bindir}
     install -m755 tinymembench ${D}${bindir}/
-- 
2.5.5


