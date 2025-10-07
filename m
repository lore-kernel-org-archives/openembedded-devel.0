Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CD9CCA476
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 18:06:06 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.25967.1759860362207637736
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Oct 2025 11:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QN8ihLn4;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b456d2dc440so1049873066b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 11:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759860360; x=1760465160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QfQduxZ5QwVorjUm5whQkmBz7HZ/61EDNl8OlmDpEvk=;
        b=QN8ihLn4TJTbh9IvrzEHzWlJzG+eNWww4kfqWbWn9vBJjTgL0LWEC611wThyesoqBa
         OrzaGjYAh9sQ5j+iwr2fW8k+TDNU2BnalIJEgdSgkLTS6HW2191xFvnq4va5gg34i0Qj
         Dw6DcnpyDJMi7gujD3eB0HcjJ4oHjU5HInzOZhWkneMdZaKAt4/hDWYT/XHI1OvNKJ43
         Z3iZMAEDfVVTqL40zMAmQ04H9ZueAheEMHs5Vu4A9ugHh0TnP0+YTcQA3SV6Yr1jdcS/
         9mqunqgVA73EaJcj8gGvfqYbT6t+xYUMGCYInvPXaCZ1oa/dT24+lplhbA+OqiCikW+9
         NbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759860360; x=1760465160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QfQduxZ5QwVorjUm5whQkmBz7HZ/61EDNl8OlmDpEvk=;
        b=M1Ef7HAa/mzCR1Kf8haVIUFnHr4BIXcPRoJU5+REbsQD9SWvL731HnZoCx0/LSpQBM
         ra//yTyNF6h6pvn22mKCx4syIc80CrNUIYU/hb5lM40XOtVO7n8Emx+tChVjxVcmBvcX
         pm6ko6Iibzje7JkybKAYDLA2tZB8SBgZDMSGovVT7nzMonX1ud+LXpIUM/aZeLxwT4YL
         Tjtw7GNx9VWPbPK9nWvMEigObAcCQ79nTSLQ0LZb38jwaS665SIbrulCiRs0GZorU629
         zdYEXLtbT0Ve//f/f882NBWQ5r6JY0Gx+yK3A1kGPrA6936OQLpjaxitXZbuifi2VBIA
         atKA==
X-Gm-Message-State: AOJu0YyR9zpf8ZGBqSb1eP4xnCBjdLvznESIcZpzdLNSQei+nmMubBan
	zt5NFtJOkL5X8AhIeboSKdTPYKJb4NXET6KM6fL7OiOcZfAd7G8CQ8ZCDjSIJA==
X-Gm-Gg: ASbGncuJtjG1nVeLhMup2wIxXnR4Lyd0WJITB2xchvJvpjXSmt6kKjJFO0XVBHpXc5y
	OM8eQFcMjgUkib9fX4j0dm/4qKtjrZ+2soEl+893bkc+T/HYMQmo2fjAhe3LNQ+hjPKmrY/RYHF
	1QTE4dVSShPQUMTJNRAaoW7Gr1phei3RYECiMrj5MhoK/pDniXqmqFrcp8xK8DRw1zeAidOW3Kv
	IboJXVciqH/nvuMteydiXum8oS/TaICftpfP2rJg3v49d34T99WD7vKUewNDdRgVixPTzicU6G9
	O0BlzpA9izmqrGLMd6L1AmjFLmEhq4JJ218wBo9PwfdNZOH58l1Ytm4gUSOFg6bM6tABQgbcBW4
	ALEtvNdRlNs50u3LtPTlHOdi5VGygY71F0u33AJ8EgYp3
X-Google-Smtp-Source: AGHT+IGJunwvtOTc2E20gJedSVsNlYh0C3rxrAKRN8CcYQBxx22ltb/MQg+DeO9QAluhIy6mH+1oXw==
X-Received: by 2002:a17:907:2d0d:b0:b3d:6fff:9a0e with SMTP id a640c23a62f3a-b50ac2d792bmr68630366b.53.1759860359917;
        Tue, 07 Oct 2025 11:05:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b48652a9ea1sm1441076766b.16.2025.10.07.11.05.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:05:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcupsfilters: upgrade 2.0.0 -> 2.1.1
Date: Tue,  7 Oct 2025 20:05:58 +0200
Message-ID: <20251007180558.97431-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Oct 2025 18:06:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120343

This contains a fix for CVE-2024-47076

Changelog: https://github.com/OpenPrinting/libcupsfilters/blob/2.1.1/CHANGES.md

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...t-false-instead-of-throw-from-c-17-onward.patch | 14 +++++++-------
 ...upsfilters_2.0.0.bb => libcupsfilters_2.1.1.bb} |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-printing/cups/{libcupsfilters_2.0.0.bb => libcupsfilters_2.1.1.bb} (86%)

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch b/meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch
index 72bbf10a14..0e0eb731a5 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch
@@ -9,7 +9,7 @@ throw(whatever) with noexcept(false).
 
 [1] https://www.open-std.org/jtc1/sc22/wg21/docs/papers/2016/p0003r5.html
 
-Upstream-Status: Submitted [https://github.com/OpenPrinting/cups-filters/pull/505]
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups-filters/commit/2076627d33477212f21352ad39e9d305adb63af3]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  filter/pdftoraster.cxx | 4 ++++
@@ -17,11 +17,15 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 diff --git a/cupsfilters/pdftoraster.cxx b/cupsfilters/pdftoraster.cxx
 index e8af184fb..e91e22459 100755
-@@ -2198,7 +2198,11 @@
+@@ -2199,11 +2199,11 @@
  // For compatibility with g++ >= 4.7 compilers _GLIBCXX_THROW
  // should be used as a guard, otherwise use traditional definition
  #ifndef _GLIBCXX_THROW
--#define _GLIBCXX_THROW throw
+-#  if __cplusplus >= 201103L
+-#    define _GLIBCXX_THROW(_EXC)
+-#  else
+-#    define _GLIBCXX_THROW(_EXC) throw(_EXC)
+-#  endif
 +#if __cplusplus < 201703L
 +#define _GLIBCXX_THROW throw
 +#else
@@ -30,7 +34,3 @@ index e8af184fb..e91e22459 100755
  #endif
  
  void * operator new(size_t size) _GLIBCXX_THROW (std::bad_alloc)
-
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
similarity index 86%
rename from meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
rename to meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
index 7f7174d940..51d8c4f18b 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
@@ -9,7 +9,7 @@ SRC_URI = " \
 	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
 	file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
 "
-SRC_URI[sha256sum] = "542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e36ac34aa0d9aa601"
+SRC_URI[sha256sum] = "6c303e36cfde05a6c88fb940c62b6a18e7cdbfb91f077733ebc98f104925ce36"
 
 inherit autotools gettext pkgconfig github-releases
 

