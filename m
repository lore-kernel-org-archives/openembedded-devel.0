Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EDFEC0461
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:20:07 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14351.1772529605012349698
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Mar 2026 01:20:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NPQecpd+;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82746ed8cdcso3370589b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 01:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529604; x=1773134404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtHkP0lej7h0CVz+ivPta5pN4jgzESQe4K0lrP2dYoQ=;
        b=NPQecpd+cHNXIBsMEhjz8CFz4pu5zUoxSW7v0r0DHEOvk0X/yhN7rvW7T1GZNXHF0l
         OkxmHW4Abm6zEXn4fhtItyPGVfjF/3ur+rmy6O+dIEtOAp0HMNOnP+V3VJVzlLdjsM1c
         xeDx57Tq/PD6STJDzBl37OLnAJZ1PIhNe0NVcAFjyVRmb5+txR7agoT+5ZEXaat9WyuK
         0mrSR5zvusYKGlvR6T0HiAzxhYn72hi2ePkYZ0x8AzTxT69hiB9MlWh/n3dfKV4c7tHK
         XU0jm7ItnqEwruFd2rF2qiNXybitq5nk6B6IuZ9TTOcQdcIwr09t0FvPxIGmP6QV25AL
         t6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529604; x=1773134404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VtHkP0lej7h0CVz+ivPta5pN4jgzESQe4K0lrP2dYoQ=;
        b=mFoj6KGMEoSEAOzSfw35hmRA/IdBki38XhSP0W4JFbdmsZj72e+qi11WiUUCgQMVC5
         4f0fDjihZ8TR38ymX811wofkIpwQu3hXfArLMYs7RAhr6RDSG7mrOPyd0L/cI0nTa6cb
         XipmaCMSVuktVUwfu6LQuTQe94xwc47w3jV2ohxmRD0hOC8C6XS73O7lp2uo9EbODC6W
         kChwQkwMGMku8bmQzourlBERsdxPsc8SJA7vLgkvFnx1jRuCuczVvb/Mk8jgTy5otu3K
         WZYKb6VXoOEGkxYpOIlZASQdJFn8ZTmpmc1ROnzmvI69AwOqDCSnilA+MJJF21O2zjH1
         r0jw==
X-Gm-Message-State: AOJu0Yx1YDYFD5ZRyP8TlGtFvGZ94NVn/Xv28nQJdHMkJxaG0CaEM2iO
	Vhr+8lUHqQXiMFabFCft+tqSD5fEVG2n9K66TWCXE0p5NVm3JK3zF6suV+lYvw==
X-Gm-Gg: ATEYQzz0JRa+cxC891ZihVlcYW8Bnyq2HxOXDFwXfq+Hr2XTIKBcO+uaiZbMEtUp7ZQ
	xkB2m+vq2OGPgQZ7D5smZ4t0x4RCTg3qcqcp7aKCErC5UbE7XNmGzurZpXLkFbb6mORmCZWEmvY
	TY+Q8bHcy1pC/TjP5EQb5TJjNZyJXkReoZ9WwjOChRG7P0cMkW6UTrKO5SwHWY/xpkZyF9aOsYy
	GXl+8AY6PY2g4tRT2vdsE6heDsBINzqPjd93KesugD8fgxtYyOa3AZuhvEdELocnXpl74CzBBlT
	asf49qurjVzdevOgCGzPF9bNP03ZrORGTXXy+f2SrmFWP9gcM4QAwEtlle9/F1nQl4+2YO+KR+4
	zbeB1kLVygt3/4RyAJj9ACYIfSpMW2HRW4kyovsb6HxtwNigZWbMPE8c/P2DhqkIT7/eEiJiYFE
	0rog3fPgBpDY2S7WG7Vufh1r6BBT1A7LAqBQ==
X-Received: by 2002:a05:6a00:2441:b0:827:2eff:a29e with SMTP id d2e1a72fcca58-8274da11ebdmr12374005b3a.34.1772529604212;
        Tue, 03 Mar 2026 01:20:04 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a05e831sm15677859b3a.58.2026.03.03.01.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:20:03 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][whinlatter][PATCH 2/3] python3-werkzeug: upgrade 3.1.5 -> 3.1.6
Date: Tue,  3 Mar 2026 22:19:40 +1300
Message-ID: <20260303091948.3532301-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303091948.3532301-1-ankur.tyagi85@gmail.com>
References: <20260303091948.3532301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Mar 2026 09:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124828

From: Gyorgy Sarvari <skandigraun@gmail.com>

Contains fix for CVE-2026-27199

Changelog: safe_join on Windows does not allow special devices names in multi-segment paths

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9cbc4befe55716bfcf60616cd695318a5477b32d)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-werkzeug_3.1.5.bb => python3-werkzeug_3.1.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.5.bb => python3-werkzeug_3.1.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
index b92711ea04..e0caea2d3a 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "6a548b0e88955dd07ccb25539d7d0cc97417ee9e179677d22c7041c8f078ce67"
+SRC_URI[sha256sum] = "210c6bede5a420a913956b4791a7f4d6843a43b6fcee4dfa08a65e93007d0d25"
 
 inherit pypi python_flit_core
 

