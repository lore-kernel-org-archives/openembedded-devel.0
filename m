Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7936.1793057212693288668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 16:26:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=JyKGoWax;
 spf=pass (domain: gmail.com, ip: 74.125.82.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so6107862c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 16:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793057212; x=1793662012; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3tz63MKEgKN5h5AfWWan188SrnfTNyoFNm4mocir+HU=;
        b=JyKGoWax1sGox08v1MbSwjkASMz3LxV66KRyTZ64YwESzw5dcHho2/Pz5PI8akmXT7
         zYBG65BdRkb6GwPo/Uc9iNS1sLXu/rrnlo6iWIo+DfMELkLgfEebyC1k1PrQaSwbF9PG
         AHUxHVZ+KVvaejAK9Iv/9yMLyq9vGeDlM5fgkt4f+lp0LNPkkAlURewUGzaUjwTfWAsd
         s4zRV/eAYJVJqy/mPFH2x9C8d9buI6dSl5WtdzlgvYPtdCxzosxlp2YfwBXjy6mVHHqk
         AUfSX0GW+B+AWTcRyfzHoDy9A6De4wemHcu20+fzWp4EDjxRCgsXS5zJu8PeXXO14AR+
         ylrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793057212; x=1793662012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3tz63MKEgKN5h5AfWWan188SrnfTNyoFNm4mocir+HU=;
        b=q9Z+pW9jJJgWjekvzezuArOBxf3x/SbTMNdqSXd5NYrAFb1zW6MMfXrz9FChVct/DO
         22kwSQj5I4c/ekDns4GMeOakCa3YuGxvUqZkuqAPJDfNSujUC3Q9AZoOQkY7nBu2Phhl
         4ITO47O3RTqjlRmyjiJo95c3P0AY/n9kCqqG/91ltRXmE0tcEFcQj4vmpfXAbzyi56dc
         SC1SyLCfHTUOuwOprwo1AjWftp8jPEGuKF142QyOmVgsDEIcIliwHGldWdIJBj2wPdaF
         Nwk8g98yhIFOsxOu8OswCGA8ft34+q7Mt5T+Qzrv97S1bLXxqyCe2WS8fZiCoiz1VYn0
         uIHQ==
X-Gm-Message-State: AFq9FYLMeYU20hLQVjvaB+WHoSajM9mQrcvPb3IqMXsHXL4ENtLq72Xh
	3GnC/shaqa11HEOiMuWyEn2oU3k+6enAd/81NHJA2+fXciqqUE2xg+WhnVWSww==
X-Gm-Gg: AYBFou0MbF+GzpaPo3txeB+3S8LrlxBYyH/qhsVplypJfaZTh5J7HnkI/HdvRD9aktJ
	5WqCJXjpAFsztaLvYDXzND3rt2UK1o85u9qcPKIqf6hqSKIb8mqBSEstLadUuca1s4p+qi6C7st
	xHMYuOssc5xgUROFdKEDZ9alWeAH6ZdhVVJPwiKckj9VsYTnXk3VS3gBREdp9hz6YwSq/hOrsEC
	ZOrPTBpCNJ5zthanHkSIU5Mihfr3TkrYqdnEB7NjwPuSuQYkWrKdTs9xo7i2oMsJFIHFJkTkfNI
	BcxdgmhAQ4dK3CEd491GlfNlcB4uVtWRzU7QSov3iLc3W92vO53PdZkl3Bj1a/EvG3MMSsVh3sy
	fSXlFUPkFXRTGjheW/WMgg5W1/jys4Ou7Yb18PI7+pt/QYS/nsHeXwqO38X3L+ttRIE3L+jfUDy
	Q73gg4y8lUzp6neMa0XnCPUyGyyySiEU8HqsdsAWaaI2MDc5i5XW8kTsz7Q5ll3g6SJHnL9YMzk
	nqWlb4hiudU1YHhi/EYxd5jkQhaJKo0ye+VhosB2LVVJ4ixUs0ECUDPNtBIUdiVJYk32eV25viu
	1Z+toRT96P5z
X-Received: by 2002:a05:7022:f519:b0:143:2968:564c with SMTP id a92af1059eb24-1993552f012mr10549709c88.26.1793057212001;
        Mon, 26 Oct 2026 16:26:52 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0e8d700sm32234982c88.10.2026.10.26.16.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 16:26:51 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 10/13] c-periphery: upgrade 2.5.0 -> 2.5.1
Date: Tue, 27 Oct 2026 12:26:22 +1300
Message-ID: <20261026232625.1275411-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
References: <20261026232625.1275411-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 23:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131450
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/vsergeev/c-periphery/blob/v2.5.1/CHANGELOG.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../c-periphery/{c-periphery_2.5.0.bb => c-periphery_2.5.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-periphery/{c-periphery_2.5.0.bb => c-periphery_2.5.1.bb} (91%)

diff --git a/meta-oe/recipes-support/c-periphery/c-periphery_2.5.0.bb b/meta-oe/recipes-support/c-periphery/c-periphery_2.5.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-periphery/c-periphery_2.5.0.bb
rename to meta-oe/recipes-support/c-periphery/c-periphery_2.5.1.bb
index 0851463d7d..529ca3f3e5 100644
--- a/meta-oe/recipes-support/c-periphery/c-periphery_2.5.0.bb
+++ b/meta-oe/recipes-support/c-periphery/c-periphery_2.5.1.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e88456d0a60de4c71ff4d787c212f253"
 
 SRC_URI = "git://github.com/vsergeev/c-periphery;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "76c4edd4b5c43a597fd37c618ed32dbc2a27ec40"
+SRCREV = "f4c9a7f644b2cd53a1e6d19585e59e852416d4b0"
 
 
 inherit cmake
