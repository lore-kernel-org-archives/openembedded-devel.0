Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48878C5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 11:17:05 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27586.1786360612172523408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 04:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=mBBg3+L/;
 spf=pass (domain: konsulko.com, ip: 209.85.221.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f7854678cso1155712f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 04:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1786360610; x=1786965410; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8vfPdTwmiM1qmVtL00+ZIupexqm1LouWdLrJRgPaU4g=;
        b=mBBg3+L/XzIJL+HQXEHrFeGJdLxsz/Z5F5Blnhg767tifjkCKweZAr9dRFRHOYor6E
         YYynYJ0FxID+d/kqchFh3URNvo96sPcwFXsTK/l/JaRcRUyTzHH4tXJKsExh4ugsqNxt
         qBaNa3uSq30hqzRdmyP9GRxGtmdLp2kHiNt1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786360610; x=1786965410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8vfPdTwmiM1qmVtL00+ZIupexqm1LouWdLrJRgPaU4g=;
        b=ITh6+zIPG41O3agm7uFE5fd/GnuhX6EUGg7KNxHdqXkWM+lwKLlbjFAqkapc7esrcN
         Q4qvoMaGwMzrOZrmgzxUhqT5UGUXMwh+uJA2wanNwsewXU+lwVWUtugoPBrzFIxwcEE1
         7LhrkG73/VI0mbzF+IZ8vkWbKQsr/eUHnW72r75ll1azEWjWtJHE9EodNehuEwLy4xgJ
         ykArbJGCzxIdFEd2iub46DfnhAeE2X4fkKeIyHGfXHULNLqfmjAsCGvsRmsVADdwTFk7
         EO/Su5Iq8+O06z6QI9WfBou51zPom0HD5xLPuAoxkLDC0u3Rds+kJxlXKJjOEEwhPTUT
         D34Q==
X-Gm-Message-State: AOJu0YwOuo8xkA3SeiHHHjwqBqRCs9K0bKXpn8R7dMSnVu6bWnNq10UY
	AWSe3KKXinznxMId/s/mEC/kcG00GU4SNA2QAFGYeDUzDfV2rwpX+HrPDvqmOOYeQaXeMkhp7we
	i1OvB
X-Gm-Gg: AR+sD12WyMTltp8cKvBaK/HWC7g+lEaQ/ZsCdJRLyj3UPwnJ/uOXGpzTWAtSXsP1t/N
	4X35JnbbhXe+IS/p5geIrFgPOnkJgmLMZF862IxsKYv6ST1sl04cSxDkbYPtkRY6K7XvFc3D+8n
	XwpomReaDKPtvkTTBLECkVc3FCqdbSljdj+N784QmnDNAYg0ffx3KeM7a5hWFfWOt4OYCmOoWP5
	EK8O0dbuSlY/W40sIgAXe+l6LlVz0pIW47qeXDjpEGIrl4NRrXKHbwy+aSSWuUvNKhPB6MLnsMp
	R4ND/D7YTJrQ3g7Jlyk5gOYnn0d4xU8sTA0i2F/8+Eo4cb19IcWCv2MyA23K1yENv1GolZzEPf/
	iPHLUTcNJj2wnPR3PRYyxz6xq26x23L/9iF0+XVF8NoNMQEiuIPXNR6D/E5Gfhj084qElXVmhjq
	seN3/yeWoEapHYfCsKuFkX2EyTHeYlXXQ3Lm9NE0xbUmet2xx+cCodkTzU1vHgNHxNq2cA5wQzU
	4KVsBpA/SNXG+M4yopIms4lWmIwlbTfLjGd9gUFk5ndF3rIx8ynsDM06uXo9h6/ShsFQuU422oe
	+CdAUX+7TLlukQ==
X-Received: by 2002:a5d:64e7:0:b0:47f:96e3:530e with SMTP id ffacd0b85a97d-48130ea1e03mr27790679f8f.8.1786360610198;
        Mon, 10 Aug 2026 04:16:50 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4800220727bsm35271853f8f.33.2026.08.10.04.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 04:16:49 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/3] ramspeed: Upgrade LICENSE syntax
Date: Mon, 10 Aug 2026 14:16:44 +0300
Message-ID: <20260810111645.1136923-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810111645.1136923-1-leon.anavi@konsulko.com>
References: <20260810111645.1136923-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 11:17:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128879

Upgrade LICENSE syntax. Fixes:

WARNING: ramspeed: LICENSE is using an old syntax and should be
upgraded to: "LicenseRef-Alasir"

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb b/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
index ce5dcdb276..71c2827c51 100644
--- a/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
+++ b/meta-oe/recipes-benchmark/ramspeed/ramspeed_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Cache and memory benchmarking tool"
 DESCRIPTION = "RAMspeed is a micro-benchmark for measuring cache and memory bandwidth"
 HOMEPAGE = "https://github.com/cruvolo/ramspeed"
-LICENSE = "Alasir"
+LICENSE = "LicenseRef-Alasir"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=92cffec6695a20eab8d0e4770f4e9353"
 
 SRC_URI = "git://github.com/cruvolo/ramspeed.git;protocol=https;branch=master"
@@ -16,4 +16,4 @@ do_compile() {
 do_install() {
     install -d ${D}${bindir}
     install -m 0755 ramspeed ${D}${bindir}/
-}
\ No newline at end of file
+}
-- 
2.47.3


