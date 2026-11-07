Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6380.1794046342246985281
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=kPL8mG7z;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso2373487eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046341; x=1794651141; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iAaIWZ8yhchJYN44RMfqHFh3tRVPTqo2DM9pOryS864=;
        b=kPL8mG7zqTYQRvYnSU4aF8f+S8tCDeMSIVq6T1qfTdLtBIfOqbducd8mAh7jwD/yib
         PPqGPb0aYPtGg50yCZPmk44lh3nOk7H8YEJK2DlFP5LXuoGnDkTfgyFjGS3oa3xMTq//
         e/wQ4UWgaVep47poNq4ZJ6c9ZzeiuKhdEYHQo7c6t177glwvbGmJjiTYCT97cwdrQ8RJ
         RzViJVY+FxHXODalsJ4FI7CsxymzkpUMvV2e5Ix1h7rFku3l6Rp0kCxr5ewe+1rZz/P9
         tuidnkfnZPh5S+UJrSmBsnq1TVjoR37ukK7g/TeZXMaHdHNInJkl+vcBVasR56u6jttw
         yHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046341; x=1794651141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iAaIWZ8yhchJYN44RMfqHFh3tRVPTqo2DM9pOryS864=;
        b=RMg9LW3KK9EgC0EBf2Ef0Mk6OeZ3FyuwhRVQpOub0BIoYWEpqbE0IkwnPWh+7b/S1i
         LLy/SeupzdNNA4nlSIBVIR3bfYP2SVRo91oGEreRr6XKHftlazkqDjpCE8jKf2FmkVYM
         I3XbSRGQ1uXfI5o9Wg6YosgwW6dL8aUdjedUbLa7CDaZQxo1QONevfp8AvEgqyvvhcHG
         rxkKl7BDNGVl/axPx0BcQ0Sqp3H+Mg0MBDyzY5fUSxiNuLSxRgc9O7ajm1YwMX9nOig3
         6MOpNMKtbHFC3sXtofJjaeJfc3+8VOObJtNXtbflNZ+5Zh3d4McU7y+v/4jedFn1R5/b
         gPhQ==
X-Gm-Message-State: APuU4Z9K5gZJlkgb85gymZFr9Ao+biL5IjaC0OZdgnafHZvB0jYk9ukc
	C9UOaSlYzlqL77nQ5d/9j/Hxrrt4JL4HggsuFxP0H9GnqkpRmkVRbU9dXdeS2g==
X-Gm-Gg: AYBFou21iF7okF0FsqFT47kuOolW/+5udecjHSUXkt4w7+8EnqfPUOS/vBv8M5oaCVf
	UMiAkcUbLKFSnKaKNPyjCtRbb7szo8zmrKfGqouP/dZCNFsODfv7V5mhjrm+Ujq8K8K7H6WICXx
	z9B7OPVMusmIlYWL+Nkh/UYtiw65VJeGb6VQBPMn5kkGEAV2Zex4Tn5i8Vt+pwnXYS/q5v5GDlW
	g0rTB8YrY+PThzNoR8gM+v3nJdyEY4YYc3sTlZtWguCyXRmhDz17q7AuYOt7EJcDk3mSQbqAUfQ
	rT/25CQhvXci+lfMghvHCihtk4kygIq4/aX1OsGXzfQmbMQD6Ivf1zwru1h0N5ORrwg6nInNZbc
	0hulVKn83Xqg5rKoD/CRxXTQAdNFEhIYougWh8n8U9rF+HFtXQa2OCdNffilhNFFiBc1eAVG6Hv
	u+Cuh3frQUSaGinUkSMYg6QH6QTYhB66zKsL8/EvW9SZ96MHisL84f1ekzz6Wdbry2jj4DuH32l
	kghfttxRrO09YnLXHKdc/ZIlArxkGsiuedvZWEwrn5iSXdPJsmC2xrgJ6+tXiTwL1ss6QW6B+MM
	0ABewDY9QizfL6m9hOljbl4eqY3MyYBGZemIhdkzhAJ9dnnKCjP+M2758sDdng==
X-Received: by 2002:a05:701b:21db:b0:181:5cac:8f27 with SMTP id a92af1059eb24-1b25d34ab7bmr6646497c88.35.1794046341434;
        Sat, 07 Nov 2026 02:12:21 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:21 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 11/11] c-periphery: upgrade 2.5.1 -> 2.5.2
Date: Sat,  7 Nov 2026 23:11:54 +1300
Message-ID: <20261107101154.2992152-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131985
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/vsergeev/c-periphery/blob/v2.5.2/CHANGELOG.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../c-periphery/{c-periphery_2.5.1.bb => c-periphery_2.5.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.5.1.bb => c-periphery_2.5.2.bb} (91%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.5.1.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.5.2.bb
similarity index 91%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.5.1.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.5.2.bb
index 529ca3f3e5..034109c667 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.5.1.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.5.2.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e88456d0a60de4c71ff4d787c212f253"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "f4c9a7f644b2cd53a1e6d19585e59e852416d4b0"
+SRCREV = "e7ed35f5736215550414ce14c8b4dfb31bdefa6d"
 
 
 inherit cmake
