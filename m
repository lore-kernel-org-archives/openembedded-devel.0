Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14669.1793092881896565649
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:21:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=oglvO+B6;
 spf=pass (domain: konsulko.com, ip: 209.85.128.44, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso20886655e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092880; x=1793697680; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mm2JSS6LAebvqmXZDveVyYl7JRs7TzU2qQPwShs0MoI=;
        b=oglvO+B6DSn0N+NVQiD1dJWMROH5r70q3M1Ctqz9ndnJ6yDM8tLBvqbNsxxglj3X6z
         E81Rs8vjnKPEyygFixzPdZ4+H+pw7VI9o830YuVdzzEmgqFeH53PVoZlzmyUYx8p6/Fy
         6pwL+3Rt1YYbOXpqnlp1Z109qZydszT+vpURI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092880; x=1793697680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mm2JSS6LAebvqmXZDveVyYl7JRs7TzU2qQPwShs0MoI=;
        b=kpuC+Tv9rGXw6+M6kOVj608yTUqf75Jf0iSKYttlGR2Kpi8r4AuCpcXk7ZCGjBuXg6
         +N1A6gwe4L8IHEHYWT456lYaxP75SyScbeGdZ6y2LN8NGKIvvWkhXiRK1zx5t02shFAe
         TynAP7G5uR+Wn41OKLV5FBnyiUTUPvey+9muTpzRUZZB8BL9XO3hSq3J/ImOVUEwbNYL
         Us5Z1EsLNMMXSka/4LF5xvWg5OAlKj34ZC3HUr2UaDdqDKTTQ1JYnAXqbHzZywLDTseW
         FXVtQdhy2dOisQ+NrUiw/26bZHbC2OU0cDXRk4YmkQN37xQSfgP9TwBJjW98F1L07UAn
         TQHw==
X-Gm-Message-State: AFq9FYLrg06EChaDxOcYzPul5aIVHch10L+4D7+bWnGcQU7bHFsaiUql
	jUDQS0b8MzYzeuAqpnVCPVR1e2Dmm5xRmhLZycWgX3k1PDDM0AorwrzNbU0Oey+w4Ezpw9OHtYb
	hhJ8G
X-Gm-Gg: AYBFou19/d6pjdalfwRmeIQ9BLd+4z0rGOSEfrdc0cv4p2zyN3gReacZW6Er5BP9vKZ
	RgNWdtLqWQQFpMjzq4saxY0RXpktL/msfK6BH4/eHaCnXhGWkcQMWqrUUrMl/hMJgOzXhYcvQ0o
	6qYh90/no/tHG1mBwDkplrKRlyZdKQs+CpOjxsv+pN4F47bCx9zDRdieHQyIweaeYnt1y4pSnlT
	hpdifw8wSdVhDOIBXaKDFPtBC9T0lFaeup5tS5Jf7pahrHnbhTrHTA2J/xsayqyYAgOMEn7BohC
	uSy8qMQra7vgcRIA7LQFEUUtTSv7pKKhWy16P4d9bQd3L1ogMFbrSL6OJUkodQnyrncUmmTuIto
	MShkD8HtUb8OE9m5/LqrlArtnSNuZFJoWk9eozktHIiBARVZLCju3SJ0G7w6oY63hZFwZ6xNve9
	zaByFiSnGQBQiJF23OFULzVRxedCfTw3Mi3HyD0R64nYoobheVoT6FuMzYWn5es8SC2GdlysKfh
	xlUAuYPbfi8+rr1gtDjhbdyT8JgvM4h9q/WqBE6pkdKsv1KV8mERxk4QwKYT+rORoWPWJfOnt+C
	E0PpW3+5VqkFfaC0a5zbzA+jI7v6wIURYERjeYyWxjhOBlbuHaO6wHb1Aqjd8BNVFHK6fMWiPTi
	WdBip
X-Received: by 2002:a05:600c:190b:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4a50d0b6418mr136477245e9.33.1793092880243;
        Tue, 27 Oct 2026 02:21:20 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:21:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 41/61] python3-snagboot: Upgrade 2.6.1 -> 3.0.1
Date: Tue, 27 Oct 2026 11:20:08 +0200
Message-ID: <20261027092028.782979-41-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:21:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131505
Content-Type: text/plain; charset="utf-8"

Upgrade to release 3.0.1:

- Provides a fix for a typo in Linux udev rules.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-snagboot_2.6.1.bb => python3-snagboot_3.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snagboot_2.6.1.bb => python3-snagboot_3.0.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb b/meta-python/recipes-devtools/python/python3-snagboot_3.0.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb
rename to meta-python/recipes-devtools/python/python3-snagboot_3.0.1.bb
index dba63705bb..2e86094d4e 100644
--- a/meta-python/recipes-devtools/python/python3-snagboot_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-snagboot_3.0.1.bb
@@ -3,7 +3,7 @@ SUMMARY = "Snagboot intends to be an open-source replacement vendor-specific too
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI[sha256sum] = "9800562936d21972a212e8e7c6f0f79eff8faf7f1bfb534675875bd06666f28c"
+SRC_URI[sha256sum] = "280003da631bb47434d1d5428e713524d6cf8a5ee049ebc5990363af3721dd05"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.3

