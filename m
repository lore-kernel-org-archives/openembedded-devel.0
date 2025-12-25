Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901BFE7AD50
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:51:50 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.137506.1766667104096187212
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:51:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GUCXEmDA;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fed090e5fso3111241f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:51:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766667102; x=1767271902; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+U7nRoc3NWxOtmHeEATr0LpiOGGPgijAZwWnOFWazq4=;
        b=GUCXEmDAw6pKXcZ8fc/Uu34kpWjYgO4iLXxOVVFT3PCj28wSzzPGg/cItu3Nt6l4HX
         CeCcpMRkUQUQICLNCNE+u3zyBZG8h1zCAR+htbZv21vnfYXs78ndu78P5uIDXC3ZKeKz
         34lasqMiIVxAdTZOq7NIem3JocnakwkNdv3X5fs/oK+YCr18mvyLSWuZIrV4TeMp/ixC
         3we/WH/vlky/YNmlobO0uTvzyJMZdktfNOmN1giLWWopspk0Y6b4LCtewGzGVVYGa5oW
         N6FQ8GcWsHNWPkKJbSAmE1CkOozQavqwVfkJks5F7zxViYvuXAzeFPiLYdQ/B7YHpCQz
         Nt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766667102; x=1767271902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+U7nRoc3NWxOtmHeEATr0LpiOGGPgijAZwWnOFWazq4=;
        b=iRDznYRok01oGx0yXDdYJby9YaJNz94qUxO/AUm47JYZzHGs782iF90pbftcosrZZe
         9srpTJfCiecwnm9Bd5U17U29QBNvJ64ffGUO3y1c8i2pxWBK2SA27/BzVtoJdfA83vBH
         Y1gYWyb0VJ0byYv+qSU1bE35RcDqadY4JaN0+N/Z55BD2Gu8XAC0/undzcLxEpmR5Iui
         MLypCM6xw8pTXw8eh0PFEmalhN/4NuCCc+EqUTSoxUNKgwzqIgUYzOlM8NakmuX/ZRFi
         tuhKngY5k14+iv80ESvyQSVdWUHkxGCO20pHK3xgriRoLQjXvNkwz8s+Ki6Er5d9tlAD
         6zkw==
X-Gm-Message-State: AOJu0Ywo3E14rqvcnbfnrlyN+CkuBfjx7Mafp5+NOIcp1qPkBvf4/lb6
	xjineJSmex2nhVvnUEnJ3f4b4mP0yjmuI8Ou3tKwiJ3wPHuWLZSpGf1Uf5YaLQ==
X-Gm-Gg: AY/fxX6f+j/9PpHEseOJfSW+lAr8T6cOJyWwOhFeRBp5vS/RSsNAj+1WVxTfoMdGKh6
	rmlwMwC6+I3lvJ9iHsi3yMi1aJw9BuyvF7QLdgR5COhCSCP42mibd3ZYbiApRW0C8hnkj0eczUH
	B1ORoAeLsNqNrlmuDUYUT7/CdaA5GDdspsiX2QfKtZULneJl6jsVwo/GwsQjxIqYy68Nsnb4MRT
	ezwHFoe63UgXH+amWGkj5jHMM9amtmaOipoi+Q+TxQonqGR3pNXqWjKSBLNqzU4h8DNkNI2tOw8
	q5MCQKHkOUItS4H7CDgDwuxsxw87lxV/UjeFgnFK/A+FtHtXw14xVdUxOuSlripgyMtTo+DlMoJ
	HEuF3mGwZQjgmDR+AYZMIys3ZdiYcVKXjeQn5yqvknwvHYr+bWvyVWBUFfcjCMFCP39uYeoYbHG
	XKebDvq8hz
X-Google-Smtp-Source: AGHT+IH44HoucVhpfuqnwOKGn8ajyRdKdt3f0XrwAJh4Mw6ZEhVssfK6guDp7ocjOJ7CMtmwThUmiQ==
X-Received: by 2002:a05:6000:250d:b0:430:f607:b526 with SMTP id ffacd0b85a97d-4324e50a53dmr21788768f8f.50.1766667101191;
        Thu, 25 Dec 2025 04:51:41 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm40219073f8f.20.2025.12.25.04.51.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:51:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 2/8] mpd: Update status for CVE-2020-7465 and CVE-2020-7466
Date: Thu, 25 Dec 2025 13:51:33 +0100
Message-ID: <20251225125139.2436941-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225125139.2436941-1-skandigraun@gmail.com>
References: <20251225125139.2436941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122915

From: Ninette Adhikari <ninette@thehoodiefirm.com>

The recipe used in the `meta-openembedded` is a different mpd package compared to the one which has the CVE issue.
Package used in `meta-embedded`: http://www.musicpd.org
Package with CVE issue: https://sourceforge.net/projects/mpd/
No action required.

Signed-off-by: Ninette Adhikari <ninette@thehoodiefirm.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3e3c25698124dd82163d966fa9d7e7e807cfecbe)

Adapted to Kirkstone (CVE_STATUS -> CVE_CHECK_IGNORE)

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
index 0b4e9e3df1..8b9e938f8d 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
@@ -99,3 +99,6 @@ USERADD_PARAM:${PN} = " \
     --home ${localstatedir}/lib/mpd \
     --groups audio \
     --user-group mpd"
+
+# cpe-incorrect: The recipe used in the meta-openembedded is a different mpd package compared to the one which has the CVE issue.
+CVE_CHECK_IGNORE += "CVE-2020-7465 CVE-2020-7466"

