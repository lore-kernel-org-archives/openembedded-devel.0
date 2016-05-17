Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 840637325A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 16:10:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g132so2346792pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 09:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zEipgP/eomL1Qw3hCD5pk8WFMhQfMSpLSQkkkDrMuls=;
	b=o2CA4UjPOgkuU5dxcOFXeo21CYnVoBywn6Sfp8oErg5wGk/XQO+ImodH4zdpiNVSPO
	b4W9Uyl8rVM/NuQcdgbK1gS/LRqUm5D3eYEyEQ2fT2tKPhNsrPfVjxVuYg7Cu0tizupM
	qiVmlwIWkfkOCMvwAoY3LV8ibr37GcVjepKwB5g84bYUQc7B6Sl3R8zrdn/2qCiSF0rL
	LDSfe0dBUk63RU9Fyeah1NALaWxP6IKqGRuq8BSbsD3KW2fnLOFiuGtJYueVgcThi3Z3
	taPBkrjNEJeRoG52exjUhp7l908U5zgi8AxP5nmuPAKHRjWXrNRZupE9UhMPTd3Uy4pX
	Rekw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zEipgP/eomL1Qw3hCD5pk8WFMhQfMSpLSQkkkDrMuls=;
	b=mRwyL40+RqVotqOxC1yiRLiKfy4xnfYIpRjB+UhWqpNhL6CQEQnPh3HIBN/rTUrUmV
	Hpr+edPrvFcaX9Esxxl4ilwa5hZeAh8IFYREL0aKyM5yTMRwbYaCGStSarpIDmb+zECj
	/6wErHLFk3BWx7sXhgTY5Y9e64QCLqYKoPGQq0bWlVnLDEEloBtGtlnHVsD+SGzRnCXg
	O+a/CevSReOE43mkLXKwRCi0f0ehj0UrG8V5Pdm+SzN1payq+n0XkoHn5rY4EopxQVzD
	MewQpx9b2rzZGGWtfgDlzrVCUYAk1ZdlOQ4HPGWg7wcEnuMxqUE9WEEOJ/4Ekt+vJ0gL
	lypA==
X-Gm-Message-State: AOPr4FU1kVdILzlHA4kQ/zKqzUFXa8EPRVgKPSGqGgoLq/GxhyJd4LmvnP5rJGPftLhzoA==
X-Received: by 10.98.18.11 with SMTP id a11mr3294210pfj.102.1463501426067;
	Tue, 17 May 2016 09:10:26 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm5868665pab.30.2016.05.17.09.10.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 09:10:24 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 09:10:15 -0700
Message-Id: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1463501350.git.chris_larson@mentor.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 1/6] mg: stop relying on make -e
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
X-List-Received-Date: Tue, 17 May 2016 16:10:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

Relying on 'make -e' isn't ideal, as it's less implicit behavior, relies on
variable exports, and hides the variables being used from someone reading the
recipe.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-support/mg/mg_20110905.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mg/mg_20110905.bb b/meta-oe/recipes-support/mg/mg_20110905.bb
index e924bbd..95aeb62 100644
--- a/meta-oe/recipes-support/mg/mg_20110905.bb
+++ b/meta-oe/recipes-support/mg/mg_20110905.bb
@@ -11,7 +11,17 @@ SRC_URI = "http://homepage.boetes.org/software/mg/mg-${PV}.tar.gz \
 SRC_URI[md5sum] = "2de35316fa8ebafe6003efaae70b723e"
 SRC_URI[sha256sum] = "1cd37d7e6a3eecc890a5718c38b8f38495057ba93856762a756ccee2f9618229"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
+# CFLAGS isn't in EXTRA_OEMAKE, as the makefile picks it up via ?=
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'LDFLAGS=${LDFLAGS}' \
+    \
+    'prefix=${prefix}' \
+    'bindir=${bindir}' \
+    'libdir=${libdir}' \
+    'includedir=${includedir}' \
+    'mandir=${mandir}' \
+"
 
 do_configure () {
     sed -i Makefile.in -e 's,^prefix=.*,prefix=${prefix},'
-- 
2.8.0


