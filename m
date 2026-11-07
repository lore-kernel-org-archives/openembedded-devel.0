Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6450.1794046340156449961
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Nov 2026 02:12:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=WzYhfd02;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2761c69fbso45057c88.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 02:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046339; x=1794651139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbKqu4kXNIBVhMLIV79dubEVhckNATU/qL/utO16jtY=;
        b=WzYhfd02vfHtlLZKe1skrJ5+GWQ0DoEVQUyiOxkGjBfxOZ8i75xEaz4W1jcjPezY60
         1pICZAEcRYkaDgOqDROEIYr9YcDSNKtMr7q7fzwjEnTn0f3rhYcbe1akn9esfFnx29i1
         6CvYQjoeMPu2/03b2pY7jd6BTVWbTrm54NdfSpJk0GqjWbKFXsG/tQhhe1vpoGwINtdg
         ODAQveNsn48vFIERcRufW608765bXHK8Zr8HNlxOOY+R7V4604BnKNo64MJ4VLnVJEHz
         uP39I1UrMun0q5hjneocouQ160lPyC9oHU8JjnCgOqKfIBSoeEewMh0uPZgedowatWS8
         R+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046339; x=1794651139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbKqu4kXNIBVhMLIV79dubEVhckNATU/qL/utO16jtY=;
        b=feJouqESxSeH+W+P5lJgSjixKpZE4DtmCN/kOfC/m4THUjkuGyr3i6IJxalkVzBG9j
         OQfZgZ09BIIVhQ20ulMMw/Q77mMulutGM/FVYoHrJc3CuNJ75KaFvd4mymGTackzm04W
         Tr5t76k9gj0Psq7xQLqDgK8pNtUacLCsBT8gwVYIRYl1NQZn6sAiTdbXCB3dXganYAQc
         AUt5EEM18rx1/b0RFRvkVuLqtme5nY2yNqhpWhHKWcmZhrdaNEsoVjv6SAgJzmthQvkq
         CxTNhrX8HJadhkAAmdDh/3vtnefLxrP+Rs4y6QnrK7st6qz2dlMSYzBKijkNE+AID+Gf
         FPTw==
X-Gm-Message-State: APuU4Z82uCcXJzmZsG23mMDAKLxVqyfIWzT1tAq9CeF22/2sEXpjs/0X
	kfJ4TCFstufeVVapSgjD3ZK4AaE2F0PHNH2NO5Z/4jI7pxlI/dkWtwKPv4GHGA==
X-Gm-Gg: AYBFou2qkhEKB19bspPFcOY/HsoDY9YyZ2zZjkUPZTi/wOmOI8YzXdhwxxCSeozEcYV
	Y7vrOjiNixVbGHjUZ2l8e5p88PwCPGCTpjLSWBzTyUrWObdVQgGP4HIVcebOEvq7N7R0xB5Biaj
	YLErTK8bOTuKPlIRyKrC171gpcWq4UVN4uw39zc9AUEBd4ms7JM4XAnHY5g6bogxWyA27mBprdc
	a3c98SfPOCHP9qufOIy9MTc6u7RM49e4ZAxnqlB3VYJf7jC3nADHdbCuppHJ/2AnGaYwkFEpLZl
	uHNeA15Dyk78g1KXAGnl4WuJV4IIqzBDIkiJzC+iWimac/f8x4Vt5HUR2/FXW7Y02cwozJMHs2z
	3z/6TZnfSH82qILZkcpxuXCnk/krc/0JBSsci/1EtHi7hJ6pttlmPn+5fjoLzfRemImtXad1Zzw
	O0VY/YiiR2BUXedks0e4O7CouVDZPxK8ONUFMQ864mLbXXX4SGMnYnJ/4OIi3uyRyHcIV+ZiRn+
	X2WxiEOu5ifCNnJAFk7vVzGADHRUjTpkegLwy1tJoKYA8MMXsL7edxqeno4TrQGF2tPIi2uvPLt
	KT3MzfNpYjLWqn3kR6w3SBzKklRuxys1xDGpraBtJqYB9JiV+vJwMUhXBqvftA==
X-Received: by 2002:a05:7022:3f0e:b0:1a7:78a3:bda8 with SMTP id a92af1059eb24-1b25d334fb2mr6701102c88.27.1794046339454;
        Sat, 07 Nov 2026 02:12:19 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm22856467c88.5.2026.11.07.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 02:12:19 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 10/11] cglm: upgrade 0.9.6 -> 0.9.7
Date: Sat,  7 Nov 2026 23:11:53 +1300
Message-ID: <20261107101154.2992152-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
References: <20261107101154.2992152-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 07 Nov 2026 10:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131984
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/recp/cglm/releases/tag/v0.9.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-graphics/cglm/{cglm_0.9.6.bb => cglm_0.9.7.bb}  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/cglm/{cglm_0.9.6.bb => cglm_0.9.7.bb} (91%)

diff --git a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb b/meta-oe/recipes-graphics/cglm/cglm_0.9.7.bb
similarity index 91%
rename from meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
rename to meta-oe/recipes-graphics/cglm/cglm_0.9.7.bb
index b2673f1e9b..0d590cd55c 100644
--- a/meta-oe/recipes-graphics/cglm/cglm_0.9.6.bb
+++ b/meta-oe/recipes-graphics/cglm/cglm_0.9.7.bb
@@ -8,9 +8,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8dc95c4110ba741c43832734b51b7de7"
 
-SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https"
-# Tag v0.9.6
-SRCREV = "144d1e7c29b3b0c6dede7917a0476cc95248559c"
+SRC_URI = "git://github.com/recp/cglm;branch=master;protocol=https;tag=v${PV}"
+
+SRCREV = "888aca08d5bdf38e873ec23d6cac42d7f23a669c"
 
 
 PACKAGECONFIG[build_tests] = "-Dbuild_tests=true,-Dbuild_tests=false,"
