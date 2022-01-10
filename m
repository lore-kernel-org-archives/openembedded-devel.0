Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41F73C433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 08:39:41 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.29300.1641803967136127674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 00:39:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=AfPihrDX;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.52,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f52.google.com with SMTP id c66so8156385wma.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jan 2022 00:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cCJZDbyy763+CGmeg3D+toQiQmvQ5knKsc/CEYNaUg4=;
        b=AfPihrDXLuQuy+5t2wR+0Weidiv3Cg/2FFRmL6XFtag+6Tm4JzlmLbyz/8n56b/76T
         +ccwM695qDotZAiKvp1bkEniFETjO0CY7w8no25FHs87WYQw/yiFNKx3O4Hh7Y2ifS4d
         FNvSG4LwEeF3LmJ/lO4waAeGO/+4Hkued8cBesSUvH06priPFQbPnqieJU3g8IzTHu0k
         0GigNtJMx2u9x4BQbI2iBzBdHVjfYXc16EqAgAje0iJQTVyJ7dnnoSzrMmghtW2irkVJ
         hHjyiKzW/iqRrBO+aWbnPoWr3rs59AXAIKz9xU48C+tFsqM36am6fgZj70CFSET/BKo7
         /uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cCJZDbyy763+CGmeg3D+toQiQmvQ5knKsc/CEYNaUg4=;
        b=W39D6D5q4gn3UD8n70cYZIcjIvuHwRFs/ujdzmhEk/HdFGyqoKOGsvEMfZBZz1Y6lA
         916rn5VuM8c09DS/+1E8VLBEtNVPcaN7z49xCkE2Xwj07okTKuq15oCUCiS7+NMPJ+Sz
         w93DRueSO3jnrYr6i9rSs1QSfQyWS5WCjRilw8kEoZaCREOFHOFlNefruCng4uBb+esu
         6QuUfNrqjiH/VSEcNz/n2laDM7OibReymEz7u4x1nKg4Uz4szBfCQMdV3MWyaD/Ubsiw
         X67LYa7MNT7Z/cwOsrVQCdxe2v4bOLWqfExdDQcJovttYH1YL8WimirfJw2+8jqK+FTN
         UFSQ==
X-Gm-Message-State: AOAM533sc+Cl8ll04kxY5Tl5y1H5MvYEO8Yj+iy564lH2Q0amzDhihzz
	uZqD8yJf/rec3Tr7p0gimAMxtg==
X-Google-Smtp-Source: 
 ABdhPJwDUVLCzeYWJq2Ply8tStR1tAJhnXReB9lE4X6t2qpp1MERy40DJw7002zisCNhz0dO1c/PCQ==
X-Received: by 2002:a05:600c:34ca:: with SMTP id
 d10mr21374691wmq.133.1641803965588;
        Mon, 10 Jan 2022 00:39:25 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id
 b2sm6453437wrd.35.2022.01.10.00.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 00:39:25 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [meta-oe][PATCH v2] cmatrix: new package
Date: Mon, 10 Jan 2022 09:39:24 +0100
Message-Id: <20220110083924.278374-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jan 2022 08:39:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94711

This adds the recipe for cmatrix: a tool for displaying The Matrix like
codes in terminal.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
v1 -> v2:
- package files in /usr/lib/kdb/ too

 meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb

diff --git a/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
new file mode 100644
index 000000000..39cdaea1a
--- /dev/null
+++ b/meta-oe/recipes-extended/cmatrix/cmatrix_2.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Terminal based 'The Matrix' screen implementation"
+AUTHOR = "Abishek V Ashok"
+
+LICENSE = "GPL-3.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+SRC_URI = "git://github.com/abishekvashok/cmatrix.git;branch=stable;protocol=https"
+SRCREV = "adfdf1656f23e5ab3b52c7d7edf91249a4477e8d"
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+DEPENDS += "ncurses"
+
+FILES:${PN} += "${datadir}/* ${libdir}/kbd/*"
-- 
2.25.1


