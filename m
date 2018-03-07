Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6249478694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:43 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 17so457417pfw.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wAkWLlEInAZFDNqC/mpVOXcwXsbqnbJX1G6xkdndLgs=;
	b=CCXhMxxvOLtqrrZ+bUHjEi85u1yESmCyKB2ZLc44oKabEFf2rV0IgF9mHup4MTYKSq
	9aZbgNQxZG1Bh6q7QT9men5QLgQTS+zT09xgJcHkUGNq1u1F+rcHQTsUfM5pO0ZN+jQ8
	++t7mXta14b5bYhee8sg2rGYUt6giSmMvKaFi9DwFOnWz8Qz31Thd6qS9fFYHCz/hkQy
	4Ag8wc1W5mPNHDNZU5NZhc4P9p5F8ybjZ07BtuKW2dWUKrU9QJVRiusTLRZsBMDEoq6U
	gU5GWl32fmCO9h7uvJss8ZiWrAHkGAFAQsssKf1yB9p10u8LxsPa3pgsZm2c0+NgY83D
	kWAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wAkWLlEInAZFDNqC/mpVOXcwXsbqnbJX1G6xkdndLgs=;
	b=Yk7vAg5K4/FY8y3ZDaJYApukTuMCVSI9r1GmxVqnUrwvp2zQYYIWfuUfyB96Rxh2qE
	TvkqFWt1qbedHacLGxxMI9XNw4KapjHk0l3TXYtE0BPyU21/PLmNE/crwSn6N0QyQ61N
	S0gw4qLe00+uj7irx+r9HEINwmMFzLOOpVv6pruQ/yOTfOBwf8h+FUrIXYlNZJpCefj2
	s49PDKY2CQcMmO5weQIKTjQkvdLli2/fT3vA64lyz3YvFuiryaBgNnENvsURW7m7K206
	IyaB2MxCM+PvBr88L7RmuWwHJf5xCijrC49OPgk4OsHd0pNTKCXERIjnMxWc8FYdMJcW
	AFCA==
X-Gm-Message-State: APf1xPCWWARFeo+4ZCuaDta2Yyv/4xaDh/yzyl4QBRK69cjkIyMuCIs5
	DVMNJ4bgHOAgwh9hACcY2pX0Tg==
X-Google-Smtp-Source: AG47ELsic8HUrmnKG5y0b464ZuVH+JAsPf3cyjbHFjEy3NBdpO6F8LBIxsGCf1XIELaERHjO4zjfwg==
X-Received: by 10.98.70.89 with SMTP id t86mr21369288pfa.215.1520395424814;
	Tue, 06 Mar 2018 20:03:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:19 -0800
Message-Id: <1520395408-19266-16-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 16/25] gtkperf: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:43 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
index 2db9190..4094513 100644
--- a/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
+++ b/meta-oe/recipes-graphics/gtkperf/gtkperf_0.40.bb
@@ -16,7 +16,9 @@ DEPENDS = "gtk+"
 
 S = "${WORKDIR}/${BPN}"
 
-inherit autotools binconfig pkgconfig gettext
+inherit distro_features_check autotools binconfig pkgconfig gettext
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_configure_prepend () {
     rm -f ${S}/m4/init.m4
-- 
2.7.4


