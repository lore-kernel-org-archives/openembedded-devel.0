Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id B7CA7782AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:15:20 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id n64so1611490wrb.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Sep 2017 05:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=SouHiGYL/b0MZdIsFAHmCeDYwqJeRfT1VYdal77HZa0=;
	b=KQthNxOLUZyifxn0PoZ5WEUDHbCqV/GxihHFxYSGH4uF4WhedwMh/8RQJW/c3xH6Ta
	tTq+607cx4C4KXyJ9csy6O+2zgYmcJd7wt00b2vn8CxddcCXxBwWORzDDgwGM7mCk/6S
	psclEDhXAH4fULYw+HoFvSB8FteB7b+ulbgkOlWNhn6UaZ8btNYMbI7HIgvwcYAzvmjM
	avyeOsiXkWN2iy1KhuUI6Yanr4QAjORWrMWBw6vUYyGtNxQg56UhwL8aMoYWbtdDbSwA
	CreqnBIkMHurTL+sMIcxaCDrHeDPncjoNrh04wRrZ86YPXrMslivMWHuDEF5YGBamXYC
	re8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SouHiGYL/b0MZdIsFAHmCeDYwqJeRfT1VYdal77HZa0=;
	b=B+en8EusOwuq+DgsIQMRME6JLxwCD3QYjZpEkCmJkMUQDVW4Rl0UWR1H/zylSPr9bP
	M0Dqizh+vQrTTeghb78Mtf6DCFN99yW0GblHq2abXaY1F7W8RSJx5G0NHSj6W/ep/lrm
	PAXfRv4HKpgvolhA/eeV6dQv4U6jA5jr9fL7Lp46+N2RElXDekoJyCozowzt5oV4n61L
	6U2ryaAa/q+hPyXZA5MBDv/hD1d+ggIaVQPotJoL8rTwGKNokelVuLibOFeFXPwvdSdX
	8JiseYID4WYGEpgV8Hujp0ZCSqj0Bj+9H4ESM5Ynp3c6Z5mfib6hoz7yJmGqDoZUtR3M
	yKgg==
X-Gm-Message-State: AHPjjUiRW+5RXV0to1/4//QnY6K6HG9a/QIpSKlMY20n5Kf6Xwk3qfeP
	PlVE5d2u9XaZCy2d
X-Google-Smtp-Source: ADKCNb7ZUJT6Yn8llwQGpPI+UsJ6XlelS8LxkUuhS73RJmQpkIiCVbiQ+D2scaBu1nrVGDhVhoFUWA==
X-Received: by 10.223.176.132 with SMTP id i4mr17901774wra.13.1505391321305;
	Thu, 14 Sep 2017 05:15:21 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id d5sm1804003wma.22.2017.09.14.05.15.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Sep 2017 05:15:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Sep 2017 14:17:40 +0200
Message-Id: <20170914121740.22996-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-browser][PATCH] chromium: hide textrel QA issues which are there for ages
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
X-List-Received-Date: Thu, 14 Sep 2017 12:15:20 -0000

* nobody wants to fix them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 34dd2e8..ad3d50d 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -103,6 +103,8 @@ FILES_${PN}-dbg += "${bindir}/${BPN}/.debug/ ${libdir}/${BPN}/.debug/ ${libdir}/
 
 PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
 
-INSANE_SKIP_${PN} = "ldflags"
+# chromium-54.0.2810.2: ELF binary 'i586-oe-linux/chromium/54.0.2810.2-r0/packages-split/chromium/usr/bin/chromium/chrome' has relocations in .text [textrel]
+# chromium-wayland-53.0.2785.143: ELF binary 'i586-oe-linux/chromium-wayland/53.0.2785.143-r0/packages-split/chromium-wayland/usr/bin/chromium/chrome' has relocations in .text [textrel]
+INSANE_SKIP_${PN} = "ldflags textrel"
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-- 
2.14.1


