Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB362CD98C7
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:21:17 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.80821.1781014871141630508
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:21:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZlvO5X8c;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304c520fe9aso9186221eec.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014870; x=1781619670; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFdT4ZS8IxuXp156zGhAGWyShbIUvKNIGdtAJ6kpO0Q=;
        b=ZlvO5X8c6KPIFLJIABHqSy34x4RkXshmi8fMpjC6iJSgp4A36ZH23rrbAJh97bKPky
         L0C5cKMB5+9tYMkqSjSOD2+t+reGtJW2F3xceXc53aPqD1kVDjvi9QTcMYg0+7l1qNby
         AIOYuuI9G23Qe+cFiwRJaF+s+iZZLymxeYpXVKgeL14qC1gSR0C+Ybj6y4QgU9EiWJXL
         rRgApjMaAgefkTL6eocC+HT3V6QU7y/5HfJvASU/uxM+Jw3b3of8Sq5bh/XqAbbQag4w
         jcWP/8CjsngmI5lM4aA3mbYnsrp/bGS30iI97u7nOyFx0uQCKwz+YJZ8sg6uZdSUO7FH
         bMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014870; x=1781619670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aFdT4ZS8IxuXp156zGhAGWyShbIUvKNIGdtAJ6kpO0Q=;
        b=BZW4gUbuhMCKAPdIRPjKlM1jsChXXYD8EVMIDeakTjY55/44kCCXQ1Rj6Q2Bw0/pgD
         oFbe19ILGW2CztvxB0ijQNq9MuOYNraBIipFn+M0BFoFLy5tbsu86kCtC0s56eXNX+08
         xKiwGUNWAj+1XtP5xz1qaWgdMbrHisxiuCttTnUF+YPNUE/6ey63qpn/XuTEQzBfzKhi
         RkZxjfnm5CcGtgaExseE4e/Q2POLd+gh1rYOKYbNd0v8HYb/B//Yv35U1KC+PLMH92jH
         xVqTKXZTje9ylwo9oRNQylmk7QzVjAgGMxTGo0XSjT/OEre3v++l4o+tRQds/nyd/bKx
         G1dQ==
X-Gm-Message-State: AOJu0YyRa2rxW2TdlcfdNTqiHRO/W4satxFuLVlEbhPZXLZ8kAQBSvWl
	Q3CZPy4nXeKZ3k48DGwBzUK91TSK5mOGYRRTJ+ksljPQcVsp+0b3bzLRGyaPmNI+yD2xKA==
X-Gm-Gg: Acq92OF49uDkh5b/x7OoZdKwxpPM1zVyUOlFvzBUo7PUoRKq20nqoqMBtHbo6vEW/xv
	hg8cUKshaUmDJGj7kjVDRzMMCl0+f9m4xAjD42W4DKtqp0HvjcLBAqVSLpTe9os5oD8a+IFltez
	DbGwRUQ0PsNqHqahsNy6eVHwiJ89EuiGkdSckihvO92Y4CEf5HTmIB8vh0/zVfzvN4F9yIUG/N4
	1Bqe/Qp23JQkS6H4NTwwN1CydW3xvTpIz5L+mMrYCX0CQ5MlYTz5uaaNUdDJpOpEz20iCsxpKcO
	ZzpSy2tg5Lq8s3Mv8NS8U+GzYwa1XBvCkXZQRl4Ps3BnsSjudO+MVTYx8cnICWVxvOqe7IJ1YkC
	iag08PBSn0v0ltwe/mgPjf6KWlFrZQtOA9NTKHE8mEm81GEntov4LrH3MZ4pmaMcP1v5bb0BfvF
	H6FWLBSFtgnpN0JIy8pC/KWhDehGWlEdsAVxccgCvPtazrxUgL2vT8AzKrox3ACh1ed2lm3OE36
	aNbKfsiED8OwlDLYem+LIGzibYguLh5V8/us/gjOIc6LHsoUOFSgbrxxPRu2bfU/0ZbeYvL5GsC
	b7YkES7r3FM5bgringwCFFnOB9GOZdNFq9jgKyr1sr2ipKGzdRI=
X-Received: by 2002:a05:7301:1010:b0:304:c651:bdfe with SMTP id 5a478bee46e88-3077b753011mr13655771eec.17.1781014870331;
        Tue, 09 Jun 2026 07:21:10 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm27099386eec.23.2026.06.09.07.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:21:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 02/11] font-adobe-100dpi: upgrade 1.0.3 -> 1.0.4
Date: Tue,  9 Jun 2026 07:20:56 -0700
Message-ID: <20260609142105.1439225-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
References: <20260609142105.1439225-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127489

Upstream now ships the release as .tar.xz (no .tar.bz2), so set
SRC_URI_EXT accordingly. The COPYING license checksum is unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...font-adobe-100dpi_1.0.3.bb => font-adobe-100dpi_1.0.4.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/xorg-font/{font-adobe-100dpi_1.0.3.bb => font-adobe-100dpi_1.0.4.bb} (83%)

diff --git a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.4.bb
similarity index 83%
rename from meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
rename to meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.4.bb
index 52d5892c15..7c145c43b8 100644
--- a/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.3.bb
+++ b/meta-oe/recipes-graphics/xorg-font/font-adobe-100dpi_1.0.4.bb
@@ -10,10 +10,11 @@ DEPENDS = "util-macros-native font-util-native bdftopcf-native font-util"
 RDEPENDS:${PN} = "encodings font-util"
 RDEPENDS:${PN}:class-native = "font-util-native"

-UPSTREAM_CHECK_REGEX = "font\-adobe\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.gz"
+UPSTREAM_CHECK_REGEX = "font\-adobe\-100dpi\-(?P<pver>\d+(\.\d+)+).tar.xz"

 inherit features_check
 # depends on bdftopcf-native -> virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"

-SRC_URI[sha256sum] = "b2c08433eab5cb202470aa9f779efefce8d9cab2534f34f3aa4a31d05671c054"
+SRC_URI_EXT = "xz"
+SRC_URI[sha256sum] = "b67aff445e056328d53f9732d39884f55dd8d303fc25af3dbba33a8ba35a9ccf"

