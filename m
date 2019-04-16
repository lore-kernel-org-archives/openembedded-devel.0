Return-Path: <paolo.valente@linaro.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id E7C8B7D6C5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 08:43:15 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id k11so25813937wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Apr 2019 01:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PInmZZGNzRiQrqEW8LFcJGDz/Kwq91jCV5jebGMvQJU=;
	b=Yc3MG0jNab+qqK46MUI9udtcfkSfIANKZW6Axe6b/zu6ZNj7jw5ABF+osrhxvlNzWd
	mM9QDYtzzXR5rTtM4FZ6hTfpX2Ndxv8+djD7EAFpRnfzU3Obn35B6+Z0Zlu4wUYV0wN0
	0ADw9KZh7jw0hq6rfvgGZhiFZwCUB+ohC6HJEp5M0+ugl8RPYm45t+5w9bkUC07VP8Ad
	xvbyeQhzz/0l4t+FLL8xGywLOTAQKiQdJ7eRECeviZN0fafN7jC1EjWoac1Vh4wZVsOI
	q7+UhfBp/WCk5LbgWK4PRbjGV1kqqBZbmsh44e+1ZZap+IWWbBfgGNvunSVHbEYkujdt
	l20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PInmZZGNzRiQrqEW8LFcJGDz/Kwq91jCV5jebGMvQJU=;
	b=qV48Iuy1dYy9T87cd2jDK7UiMFJAu5Iee4az14CSOlVBrsEpNojwlJejQ4wflCnh22
	QweLVm9Osm/lChxGdofn1CpsFufG5sebEod+AXxpKMnA6RteMIZZQJeE/3U095hVaX0D
	z920r2N2yPIYhx8yCElUdUSxSLfL8rNVd+Mf3re/axzbB1vTNVpGzl8uQ75uM0mL7I9W
	KtpiDgfBUFuh4M9ax1mfuU7tfX+IBI1y8LLpn3NRz2bKWR4uLot9yHQX5Migal3yxVm2
	y8VKp6q2Xv1MLlkXwE6plQfFJC56dtoMpFAy1I53Q+p6I662jEBk03bGItmAbWpcVCQ5
	iEWw==
X-Gm-Message-State: APjAAAUGQJqHMQ+WDgripNSlkhbL1lWCr27Fx/EF4lc3kCvntpMXf6IJ
	opigUGdSbn6trUy2zDFUsMGDXlkDWEcT3A==
X-Google-Smtp-Source: APXvYqx2XIGE1Wx3+aEzP6nnVoN0jFELPfkwO/zo0jQgbOCqTzdSx8jHUvkepidSFnwAj56PqnVTMw==
X-Received: by 2002:a5d:5401:: with SMTP id g1mr49491567wrv.70.1555404196236; 
	Tue, 16 Apr 2019 01:43:16 -0700 (PDT)
Received: from localhost.localdomain (146-241-108-11.dyn.eolo.it.
	[146.241.108.11]) by smtp.gmail.com with ESMTPSA id
	r9sm17240638wmh.38.2019.04.16.01.43.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 01:43:15 -0700 (PDT)
From: Paolo Valente <paolo.valente@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 16 Apr 2019 10:43:02 +0200
Message-Id: <20190416084302.6825-1-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH V2] s-suite: push SRCREV to version 3.2
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
X-List-Received-Date: Tue, 16 Apr 2019 08:43:16 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 meta-oe/recipes-benchmark/s-suite/s-suite_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
index 47d21d36c..706a55e11 100644
--- a/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
+++ b/meta-oe/recipes-benchmark/s-suite/s-suite_git.bb
@@ -2,8 +2,8 @@ SUMMARY = "Small collection of benchmarks for storage I/O"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b529aaa6a0c50f15d29f89609b5c22f3"
 
-SRCREV = "d05006865f68829fa7603bdb92bd51649f5ba1b6"
-PV = "0.0+git${SRCPV}"
+SRCREV = "262227ec9de4be1ab41d9918d32ceb773089f1dd"
+PV = "3.2+git${SRCPV}"
 SRC_URI = "git://github.com/Algodev-github/S.git;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


