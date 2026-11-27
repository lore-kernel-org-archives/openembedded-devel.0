Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10254.1795752996202054695
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=y1LKAvVm;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so12590666c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752996; x=1796357796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZGG12QC2FfXEBMXCcvUHeJFQQFHUgBn9M3QCOgXkac=;
        b=y1LKAvVmpLjJSF+ZnC4cxQtdLs2k7B7QIwAzlvBc1zNzn9PkBWl3X/iazsV8aFQY6K
         bjKhzT1Ptuk5CWpbyJ1PKEU9sGuAkKVFSisnAs2FMt8O6be1j0tcQIjpUOxg0DtsW7JT
         OdZjp4L+4FRGP/r6Y9tdyAzGHl0EhHG69jg7WBNHGtuXcpOvlBTwBGTzJowLkqpjALuM
         LeDyx0aqMmrXoQ+7ECUSNW41Yx91Yk9eNOWwL+5q4VeEpTpvXrh0JYBHPMT3XiqhbRQN
         pyXeUxwyncp5cj0JnKnf0mcRq1ISGfAjCDtEmCY0RsYtgs/3bThlRKBliDgqtpiKBXod
         jAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752996; x=1796357796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZGG12QC2FfXEBMXCcvUHeJFQQFHUgBn9M3QCOgXkac=;
        b=gEOtdkqmaLwS4lIz2rbl8vDSdjMnpZm+bbTTOcSyE29eDGI+E6GEmxGdd7pNHvBCiT
         Z3Z2oyi6tYfPIGmU9YmBwl9H7n9VSKlvgjt8/OrnbPq+SECSnIWhhnKFFn5rV29VZkEw
         Kc02ZGK7RDs/jzqeDhCIsQ5K4wzxGUzHqg5SsaoBm6IO8AfT+OvCDH5lyQtMCBmVGqtb
         hUr2hIjZyEkPS9HgfG6+s629IMIHngj7Myht4Ta1SOPx3RyhyiizuSR/KoemhdgoYJKO
         XSrzXE8eNWEitFwjN4ymQ/Lwh/w8yTma5Qk8FeYQbl6yArZjumXyzAXFqzdjB+18QVHP
         oUOw==
X-Gm-Message-State: APuU4Z9lFw51I8gnoEWfLuraw+6gBGBzTEQl2y9obLtVh9b1xcBDQgY1
	zt5gQYXpg7qBQQOxWWi6Xk2BRXjJTPokqvRlq6b+j+lZ203kgGcHmTbBzSFK6Dkb
X-Gm-Gg: AZFdTZfr1RuCnb+BBFDPYkUHW2cEQ2G9KpGViHS47ClOU8aZjdIfIJyPutbU2+gP6Ri
	btd866VzKLj4Qd4ETcrBRTbyqh+gNutynS6UJE2/b85iQYcARNB/6bodPW0kHOJ8Jj9qFz4Fhyr
	wdsB1i+Y6v/5Zbbq/BppXcVQdi3s/74RseZynx2sdtW1UFUKi84SxRWSNM0GycNbsgVh9Fg3jor
	aVxNiMhsdWfZLF8JkH2bZuPDlF8vNOpvH3NMA2fS58B0O1dX4aNniY5ArSivplnuyBsH2MVQ5Ya
	JYZ4VoE+ar034gUv/eqDJUUPYh4/SDwhFsPIdmzAF+DN9W/BXz6Ll7r+Bce61lTO1/yd/I4aX4q
	Xwz/hOJ3mPuDyK43+kMteQOGnma9ocg6pz0nSJEoZu5pjjKoDmix5QXurOtvtVik9X9zxnM+tmE
	KoKmIngBTPBUBqj1rN6c56z2TlwassKMlf8Z0RkGhxVZBCVmH4YBGrQypiQrVLybuuMN7ueoNjN
	vpBX3N7WaLBs1TVCVNZz4JHQbxkRKtH85Ln4LPxO6bIMXClcteOkBSfvT1kWLqlzCeMZlMgak94
	y6+uCnzIQnt5W2ZAb2Xn6GONAhyrnnUe6bRV6dSui+fuHF+/Py+RedTnt2g8GxrWzyVKabyjYa3
	SdCee0BXlyxKOzbeJcQ3pFYcChkeGrUvSCMDyTXWmBpA5rYLbe4BXEZlPb3WVmAZs+IXz32lSnv
	dbTFTGzrby4ZDDj0QlYosvexYNgZQ0SgRbAMbyyqKOX2qDS/ZxiXjytU/bKJaisccKQE0sjK3mO
	07xg91Ey6gaFSy1p14sNp/OYPjaW/dbjkVaWez7BLsQUZ0PFDLSD2O0zkKJteiY0cY8BJF5zV2e
	VmdWP3k9Vkkj/sNUBuehysV5/A==
X-Received: by 2002:a05:701a:cc86:20b0:1b5:87b6:2906 with SMTP id a92af1059eb24-1b587b62983mr7388910c88.13.1795752995484;
        Thu, 26 Nov 2026 20:16:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:35 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 16/32] python3-reportlab: upgrade 5.1.1 -> 5.1.2
Date: Thu, 26 Nov 2026 20:15:58 -0800
Message-ID: <20261127041614.1775064-17-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133235
Content-Type: text/plain; charset="utf-8"

5.1.2 syncs with rlextra and has no other documented changes.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{python3-reportlab_5.1.1.bb => python3-reportlab_5.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-reportlab_5.1.1.bb => python3-reportlab_5.1.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-reportlab_5.1.1.bb b/meta-python/recipes-devtools/python/python3-reportlab_5.1.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-reportlab_5.1.1.bb
rename to meta-python/recipes-devtools/python/python3-reportlab_5.1.2.bb
index 27bbfee1b6..1aac4c2b1d 100644
--- a/meta-python/recipes-devtools/python/python3-reportlab_5.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-reportlab_5.1.2.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "An Open Source Python library for generating PDFs and graphics."
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cf24392f451ff6710fca1e96cefa0424"
 
-SRC_URI[sha256sum] = "4bc6d7e5a961cabd320850637fa469c81dd9d6e32d0fe4191446086c6ea9a8d3"
+SRC_URI[sha256sum] = "2d2785281fc435e39fb33eee7f8c10b10ffee626dad9de360310390aacaf2f38"
 
 CVE_PRODUCT = "reportlab"
 CVE_STATUS[CVE-2020-28463] = "fixed-version: has been fixed since 3.5.55"
