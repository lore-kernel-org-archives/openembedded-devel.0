Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14650.1793092845188362710
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 02:20:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DM3oDXxI;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a215e64962so30505575e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793092843; x=1793697643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jyYDA/TAqfh2/L5pjG/mjqZ8A4zwNvwe+Hqxn0DA4n4=;
        b=DM3oDXxIoVqs/MUQK8el690G/jNGOzW2I73eBtv2gr9BcAN9/AuRoTfqP0VTnciKoT
         11+sFlOgfbvZ2deZb7gMhL6UxA9ZQoQBTvFNiLKVg4cTKenP0v61bGw4l5giwkA99CnJ
         61sjNXRPTF3skyyUAi+rUIJmRITDPaQ1hPCWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092843; x=1793697643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jyYDA/TAqfh2/L5pjG/mjqZ8A4zwNvwe+Hqxn0DA4n4=;
        b=jl8owDUyTQMzzwlaSNIm0/VrNGPWC4SQ55JIXa2KJGKGxEFWNggwZeuy4gT5NasVxx
         MWkwpTnq0VOyP6fwowwjNv/UX9eskahQzVjUbwSg50KbMmU/SzVpRUCz/iWaKYJbTdB9
         +MpBaSvzE4t8VqWMfu60FnF8TPzoKuJiisPhhOTJSjlwbpLqXiQ8K8+cYt+ZRa9BqMVr
         F/6yJA0RgJr8Jk3l256x55/F8NM2XnT86FKak9kiYCRKkHhisIq8jVT3FpzLAnWmds+d
         BnMx+USI8ywQ/qhalG/7ZB0XgKeQjYxvDyx9IawqVNTS3OkLZ092KUNk49Mqwh6MIoWJ
         BixQ==
X-Gm-Message-State: AFq9FYKlepKrQg8gTHTQPFlRR6n5tqCdiMSGRph3G8djXvm9GjCuqODo
	tjReFm8JF5XD3eCa7xg4vhbAkdV40KW6AAnUfkBcG7DeZJEbEZQzpt9itbL/T9kYCfajU8iB4PO
	5evJP
X-Gm-Gg: AYBFou20nJ7QCjAC9XxEg1Kxk9OjZBteXPGcdf/5+bcWRiXQXLFpPvUbJw01mJegGli
	cR6h1J6K5lv52XF2EEb4PYC0wlJ5eUhE+/BGzFCIlbqQNqsUPISMHELVtaEmsFJQdO0Dja6/ndy
	OTDUg+UnQIIBpxEI60zyFBn8qUxNkf6GoX/AKt2CPfCp0RVU2A0DSqtOvTB9Ka8Bg4zwUhLXve3
	eD1/hiy0OFRmTFCLhBOU6qduXOm0/839OLGhGdcdIdfElWu5M2ynO3w9f86Sk1HDK17aMTlUOpS
	ikkbbmGLK+v5yi6A/f0zKKKIylaWBoBLzxAnt4TJNmn3zE9K1gE3VDkIJPuZ6yfD1TLscmepaBD
	oDk8cym8Bsjm/vJV1IcljinzDErJqbTBXfImbHFlKTotEJoImwl5SEefDf0bJm82UQtgwFUEERf
	XfCtXIOTuDNLcBHGUPc9CA6j1O6/L0be1SkwmhxZQe3xiBSUBiYGH6+FQ6Yc78+I7xhg77v6rnx
	JU7BhFEBr0tcCxUIcXroWYiJ+YTK59RNze8Y42f/C6PWCNL7TWSHWP7etJd9qZca+TD0OHQeUsJ
	M+ZvT8DFP3rQhVm381Qi2RGUe4cq+ldmvfBUxKk2gVGhX4ojdWW62dfyyEXHqSa+BA==
X-Received: by 2002:a05:600c:3d8d:b0:4a1:f377:5c75 with SMTP id 5b1f17b1804b1-4a35acc2edbmr149858805e9.33.1793092843565;
        Tue, 27 Oct 2026 02:20:43 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm660086505e9.1.2026.10.27.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:20:42 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 11/61] python3-parse: Upgrade 1.22.3 -> 1.22.4
Date: Tue, 27 Oct 2026 11:19:38 +0200
Message-ID: <20261027092028.782979-11-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027092028.782979-1-leon.anavi@konsulko.com>
References: <20261027092028.782979-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:20:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131475
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.22.4:

- Account for the capture groups %z adds to the generated pattern
- Reject out-of-range timezone minutes
- Document the extra_types conversion mapping
- Fix case-sensitive am/pm and Zulu conversion under
  case-insensitive matching
- Resolve year-less strftime formats against the current year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-parse_1.22.3.bb => python3-parse_1.22.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parse_1.22.3.bb => python3-parse_1.22.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-parse_1.22.3.bb b/meta-python/recipes-devtools/python/python3-parse_1.22.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-parse_1.22.3.bb
rename to meta-python/recipes-devtools/python/python3-parse_1.22.4.bb
index 430a4538a9..0f65b09678 100644
--- a/meta-python/recipes-devtools/python/python3-parse_1.22.3.bb
+++ b/meta-python/recipes-devtools/python/python3-parse_1.22.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/r1chardj0n3s/parse"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8ab458ad281b60e6f1b39b3feafbfc05"
 
-SRC_URI[sha256sum] = "7e79bb39c72c3bf1613510fd5cdffe5baa9a7873892bef1d4566f1672c8a42f4"
+SRC_URI[sha256sum] = "706d458feed5a81b02768d3156e8070baf6cee7d150a3a3c0cd43101a875c3b5"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.47.3

