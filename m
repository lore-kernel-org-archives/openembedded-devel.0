Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36079.1793161575977929750
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=LWeapkxM;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso240008a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161575; x=1793766375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uCALeqgmEZs/AjQm6TdkycJoCCdzjvHnY9QjOJo46z4=;
        b=LWeapkxMfKbZ1Rj0ty+tZNkNjJ84h7dJc89qhaDv6fPD9vfQyn7Hpn1KicUxY5i+VB
         y0ZXGlhIBVdTuAJBJ9HfuLE9ucM+KD/uVqW/eCRV2k41GAkQUa9zqZnY43axlXuayaZO
         EhoDsnT0j8f9pwaeI8XsbRVZIqw+7C9NmEJ1OtGd+ROpC6qTOVXWDzoSzVmiC0opPbw7
         ojRjlwu6TWC4KC0G6cZ541upOIRtMBQLqqm050nQDbzGFGw3xJWO1ol5rjTey5MS4cfT
         M72Ze5WPfCa9OffDcUbzqG4dH+1vfWCPOtTny1xwtt79kXhI7osn0N6IbASPY3O7tgCO
         KvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161575; x=1793766375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uCALeqgmEZs/AjQm6TdkycJoCCdzjvHnY9QjOJo46z4=;
        b=edhX6pWU3lY2j/VoYOILZ5OHKVuri+HdeVAIwKt5r44mJ6Jfe8bldJznnEiNLSpXNw
         nSu3RBX8qdc5h3O38yNYIwmMX/Hb02uR0F589TW17xQUEjE/899FzDEFuhOE/PFm5tUZ
         kaNG0QPW77YosVfLcsSCzMInEoQgQ6TAtz4BDODHv1kGkj985HWiztwWRUsPrtAfD4ET
         2Aou1cWgIwauc9ih4iFGfMyCjtbG58zfPmwNEMnf6umILPwEIII89/sPopk+NGdQXcwg
         fgUjBcTMRPdBEpwOFYHJHDOafrCQ1ddnmCSNzad2XEDYqQzdM4PKa4KgtrrjyLSMRgH5
         rr6Q==
X-Gm-Message-State: AFq9FYLzgJaCy4S6hQxNRKhjLXxmy2dBW58iMAh+ANiNK0yZhjwF87d2
	LUqJgRDLAp9rf7g6JqiwNCpcQ04Iu79u8mbxlkUT/2r6KhEru6T9bjIbx4ePmw==
X-Gm-Gg: AYBFou2lOMunqnTT+/RfrItD3EAJhOVRd2An+zcJOUKwUAjaEIAexbZXQISctdR9oyh
	Zeh/f8p3EMt0OPVw8FJsGBe4lC9QIlUOd2fIq20LnZlhGtPRz5gw4jxAYjK6seWibW2iyNc46Uq
	iVjuPSrxoROGFn0ZkYiLM+um3uvGIKasLH8ZgHoA/ne8KK4Bhb3qCoBjerP4e0SURJ6eWqJ+rmQ
	k6MoiUr8PMgeWGb4T7uUATgGamE4yKTitm9O0wbqfOjCOF7oiBAG2cDZMzrQkGxNU64IEIyG0JH
	mn9hUAiBUjuYJae/iby/MNM3CzmLDSgk370Fp7EGbe7zZS6zr6lFDq5trpmQpacpLBpm7VgMpqS
	h2V+FvzJ7Xgaj+RTA/yMtMM8IAlp8KfKTYlC42QdphGWHSb32G9oAMLYW9OagT9mGe5Y3tJH16I
	nXe3zYKEWDVVe+h5TABJOCjWp7L6t3Fk8qH+Z6DZkJp+xITzUh2xboo28R3tw/QpIGotR9ekAQ2
	IVoFEM7VLXTOeentBjNT4gZzkCck0k4tcbPAmAX3ECtYvnT+rZnDOOh7kLbTjLXIRodcJp4rE5R
	wNz9hBZwz9q/02gxhOKXAFNF7x21aFF2nWwVpsWHezBhiyqEVIeNJkr4dU/RLQ==
X-Received: by 2002:a17:90b:2887:b0:3ac:9d14:feb1 with SMTP id 98e67ed59e1d1-3ae580e0f64mr874078a91.43.1793161575336;
        Tue, 27 Oct 2026 21:26:15 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:15 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [blacksail][PATCH 51/60] brotli: upgrade 1.2.0 -> 1.2.1
Date: Wed, 28 Oct 2026 17:23:49 +1300
Message-ID: <82e99aebb4f2f98533d5905e6d6fba66ca41144e.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131603
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
