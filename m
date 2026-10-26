Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39576.1793009953100556818
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NNhCzSQj;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06b436dffso1320707b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009952; x=1793614752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uCALeqgmEZs/AjQm6TdkycJoCCdzjvHnY9QjOJo46z4=;
        b=NNhCzSQj5LlxEpVZNSKFMO5SGV52/IL7DgXdhreExsC+f+7rsrmaDJcTqZbwU96PiL
         PsOaUdbF6ywxzvM/gFmoX8m/L4mTlFQ3gP9dOWBeZtEWUBVQF75CU1YfY77XKRlFE7oA
         LOa18dJ72vKl9tIDB+cflKNJRLPUVtXquSm8bm1a6fnCoxPHf0ZaRLih8W2gtoodqqWg
         oGupXu4w2mMLD04hNO8xvSgQ/iFfh0BFUL9NyTjPUWTK078phCtLFnq3/wHKxlPT6OGb
         sYnddtp7uKny61+Sq9PE4mSISVlNAvP95qpzAZpOarsS6A/m9PQ2JFU3M8ZMRLWHRn+T
         uIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009952; x=1793614752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uCALeqgmEZs/AjQm6TdkycJoCCdzjvHnY9QjOJo46z4=;
        b=yKXyd4gUhrQQryUy74UoUtdvqeXyl07DxO07wSpH6geM5Igva2lwndsqimP23wRBYR
         QqxQ/9d3LG7RqKgyNojE6SCGoq+dTKZ0bhDIxnc1jCjQ7HDlYZOGyErcCvcgPIpucagN
         x9s969ymCwLmTSBrqClyFe/hMJpLMQhz665VNsjt/wl32iIPyMeuKiCnS/f3q7DNxd5t
         YQ88b9VVjSt4OJasCX6u6eJRNOqkLESlBI4AbBIsSLf1ie584WW6ho8QMkv4IC93yjuz
         O/vGHS2knHj5GXEaMncSKQQ/pRduvbNIbyyI+QaoV3CrH+ZJRH3+MuqAYDYwtzz8g7D+
         KS2g==
X-Gm-Message-State: AFq9FYK2Kptg5+xNzudSRWkTQgCJo0iIgVidqiwfu4HfFdc7+koNBazC
	Ciao/MqsC19HuBkrpGSdtIKhS47pls5wSIlRUYtcL5kx3b6b7jYTx680ix8mLw==
X-Gm-Gg: AYBFou3BxsA1fVtnhsKTAxTa8uztGRxYbF52ml17Y32MWEQZuF/pf1vzCd9a86RN7HR
	NZvE7OOulT50G4cp+FTpUrbeBWLlffNsSyOuxmhq9HiIcJByntnGUL4qnOBTlFIGKt31yhFf5ry
	wUepJ9FFlfEpwo7UCxX5x+zzN1BfkOBfkq96PYUIeSGEJqSTdfNBwKDRbisWMvGja5X4BIUUR33
	+pHFiEbFs6mZdIe4cgJGPIY4WKfZLgeigrS6fBTPoJIDaqhEESp4n9IWz7QY8DyDh+Meq9nTMa4
	2mtPCdI+dSiJmA64MjbbAnLSS822+Mip6wUP4c7JoSZJ+geiUXyqQp0n/13hWQ1XqRlQTNervIY
	DrvoWBCVx3eua5JR713yYfLNZrQOo95Gku/Y+JOd8S1HpBYdKyzQDLDoSbdIRtAsvs1RPKAO5qX
	YuLg1Hd88NJJLbCsa91f1DuxRSPxMNvUssmAB6UHQph6Q/XCMbG6I1m4DsR96/84Spvb63sgrFW
	3sJZXr7ddUFRxD8YfD9r9c+YooZ0olOyazN1O7NINFw6wzWU/kpwgbEVdVEMe5SJOK6AvaLLSqg
	UqBwPQLZRI9nBaO6QW/wvET9CQtouqk=
X-Received: by 2002:a05:6a20:d28e:b0:3e2:1787:da07 with SMTP id adf61e73a8af0-3e7cd4b9c74mr4393864637.56.1793009952428;
        Mon, 26 Oct 2026 03:19:12 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:12 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][blacksail][PATCH 4/10] brotli: upgrade 1.2.0 -> 1.2.1
Date: Mon, 26 Oct 2026 23:18:44 +1300
Message-ID: <20261026101850.1470035-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131426
Content-Type: text/plain; charset="utf-8"

From: Jason Schonberg <schonm@gmail.com>

This is a security release

CVE-2026-111497: out-of-bounds write permits remote code execution

Changelog: https://github.com/google/brotli/releases/tag/v1.2.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit b5d66bf60d7664e5fa15dfabcfdb7986ea83d386)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb} (79%)

diff --git a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
similarity index 79%
rename from meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
rename to meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
index 84495a3236..dca16cb79b 100644
--- a/meta-oe/recipes-extended/brotli/brotli_1.2.0.bb
+++ b/meta-oe/recipes-extended/brotli/brotli_1.2.1.bb
@@ -6,8 +6,8 @@ BUGTRACKER = "https://github.com/google/brotli/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=941ee9cd1609382f946352712a319b4b"
 
-SRC_URI = "git://github.com/google/brotli.git;branch=master;protocol=https"
-SRCREV = "028fb5a23661f123017c060daa546b55cf4bde29"
+SRC_URI = "git://github.com/google/brotli.git;branch=v${@oe.utils.trim_version('${PV}')};protocol=https;tag=v${PV}"
+SRCREV = "db24a98aed38a16de78cc05ca15cdd8dc2a0d92d"
 
 
 inherit cmake lib_package
