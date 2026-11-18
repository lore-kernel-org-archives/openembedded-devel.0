Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10966.1795003163483080621
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:59:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DUUxWRiZ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so12096115e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795003162; x=1795607962; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MoFQp7s1jO+ugq+dchAT1GDqgixiDdW1BJzNMIj31+k=;
        b=DUUxWRiZ5F7wAjoK2M93kH5qVpLLBD9NQuaPOZisyvY+XBw/sbrwcaeBJgscLtrpNc
         cUbfQshg64eB58YjEy+/1yMlpffTMUumlsraw5ikkg/o1BaPMPunJOdqc2tjfacKZnpG
         6MoKB+3AfOOtoy7m0cnOsWgIE62712vJyw2AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003162; x=1795607962;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MoFQp7s1jO+ugq+dchAT1GDqgixiDdW1BJzNMIj31+k=;
        b=oFlhr3VfTfcd4kk7uhfJZZJ1gFyAOAEEsm8HTbtiQ97cErK48IAS7bkg7NBvqBWaHh
         s+8Z7ZHLQjrj4lEBxF3+j8QCCbOWwbQ/sMZn1rYjgKdPeXwhtBRk9eIcZxtb7oadbAZn
         NkasR+xIMvcqHupuFb6Al4a+Oyyg/7v/9AKZklGrNjQZrhwg6tTaisPZZcUjDoZNUUos
         EkYjzBUdEuqewciPVWIg/z/UQpX7Amb6mPRhYPFGc7RFujw94i25gCUSw2VT/6u0+3I0
         mQzd7M8rftaEIoMItb1xZ4HcTjePljDJv84R+rrYGEsDOBKzUEAH/zDuGHXOJ14qLq4F
         58Gg==
X-Gm-Message-State: APuU4Z9MgkahOeH3qO+Q2ddvDxMFjjLHMmzZpFEtZ0OUFTOJehOtG42w
	Kd6GB6bmm+apsMzdGtlV/gJOlURiyPLSBCYmZe4ZBUStl3cKYb3+71SDu77umJwopJKkZD9Xhh+
	GTEr2
X-Gm-Gg: AYBFou1uMYvcimBTO5UVDt++ZEqgg+V9r0mTba+itQFnILh7ImOq0MOll8YEPwt0wxK
	qhg2EIZwRO+t+B0fSVbjUKchTOGCREwxKcZRecnACRdmdvasaESVQTjtEFICheZj36bauiPL/xl
	5PCnwprZXonNe0aunHP0lotKYHNs9VTgwA2a/Ap/kgFEJ/OlY5StaEasp5noHahA01zfVhvLBDV
	tXiOIIrCp9BurP1IRe0VHe+cp2PR89wp8SUjMR1C4O5N2tT4GsVyWeWsOSTD59KJfzcc6F/zO4k
	JuODijpD5m3/wa0VVIUMIxpm2EB8pgkzpKVvfXo5G08aDOxeaUG3O6oIkTvNuH9JlCGFQ4Jfryn
	+RrmrKX+satrzYiVpUWjLWHTthysxwzmBstvCYRv1pD46w8BbmDQl+IT/+GR5dQqMeu0xCGQXrS
	VPbvIW7ZfLyqVupYjWcBmJLlOfkcpr0FrLhIDMZrvqFuPNNmdZ0Nx9/fX8LRnk0e7EEWrOcfcmS
	2hSqqZjmZbHcVXLuvjNLaO8H3Tn+FyP1Rf/r3ZYud2IiKopi9/9qluOlXyJq+AKIuH3HyGwWJHI
	z98OT7X55VKJlEbGKI30UOH6KtFt5lUAM9oROHEPM42zYQ/I5dC7FyggeLqmM6qZw47eNALLAk2
	uw2tHcfWhS9IPz+rFZQxAQCBlMB7a+FBBvF+lr2eHRbi6MHeG4GDspFRzqz01ZeUERd4ri0g4HS
	IR
X-Received: by 2002:a05:600c:1c1f:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb7da28927mr50372015e9.26.1795003161863;
        Wed, 18 Nov 2026 03:59:21 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b979bsm61328365e9.11.2026.11.18.03.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:59:21 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-multimedia][PATCH 2/3] mimic: Fix HOMEPAGE
Date: Wed, 18 Nov 2026 13:59:12 +0200
Message-ID: <20261118115918.905269-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118115918.905269-1-leon.anavi@konsulko.com>
References: <20261118115918.905269-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132649
Content-Type: text/plain; charset="utf-8"

Replace the value of variable HOMEPAGE from mimic.mycroft.ai to
the GitHub URL because mimic.mycroft.ai redirects to
community.openconversational.ai.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
index c2ba6cc58f..2158bfb2ae 100644
--- a/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
+++ b/meta-multimedia/recipes-multimedia/mimic/mimic_1.3.0.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "A fast lightweight Text-to-speech engine"
 DESCRIPTION = "Mimic is a fast, lightweight Text-to-speech engine developed by Mycroft A.I. and VocaliD, based on Carnegie Mellon University’s Flite (Festival-Lite) software. Mimic takes in text and reads it out loud to create a high quality voice."
-HOMEPAGE = "https://mimic.mycroft.ai/"
+HOMEPAGE = "https://github.com/MycroftAI/mimic1"
 SECTION = "multimedia"
 
 # "Mimic is available under permissive BSD-like licenses"
-- 
2.47.3

