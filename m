Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web08.97.1614809715133982775
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 14:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fBq80gVv;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id e6so17416890pgk.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Mar 2021 14:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+l9QuGbQ/yH/7YAYbjxsr5zM47SEma9sv/Wnr5e/3E=;
        b=fBq80gVvbpVkZ+qe9Uq0YjgQuUAjdQBiNcrKEBKJwN85Wf/Si1XCEXHEHeukDj+T9m
         UA93R+O2L6xRxh8o6smX6wyazMCwEV0kWt/ELe3nVHpfJDT1Tw2uro+79tgP+1p593PE
         oCdsUpzmTTDud1VNumXL4EPjxcl+FkCufMKLoT+/IYgNXUE5hvwRfZnxBGdPffVzPAv/
         xZdb4dduiwLip2QPSi+vrl7Qovb+myUD5IVVwFLT/sLglOrGOnMZRlRWK2a50irUwHQU
         mU4uGeG55pc5x6mL6SwaYb7u1V5Fw3jIKo7RjAwAWPweRenHLU8AYp5a+SdQzWtdDOyV
         VuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o+l9QuGbQ/yH/7YAYbjxsr5zM47SEma9sv/Wnr5e/3E=;
        b=e/8ujPloV3qV8kUp4Ifftapd0L7hBVmcLe7hnv0eB+ynVirxGnVvaD0/7WGSWSL5YJ
         5mLYV9gyxZ3ED2uyLDh0E/OzfP2ujEjr+KvDK5Pm4aQB49Nwlu4xVHMnGvhPuHKH/5cH
         NfSgf0zk8GBTUsBxqbepCZPCgJCMp4urBLat8hy1+egy1LrHhgODEBVGH+54zDdb2pJ1
         2y/bYteEM1Vc4uLv2wfDCj2uBHiCf7kyotRw3EglCzYaonzUhrhBKhaFAopmnoUXq5Yz
         N16wgfB1yaflcWA4+F56L1ZKHhh557Msdo6g3jkFtJeg3gXxF1vj5to4uMPYx77tABgv
         AAPg==
X-Gm-Message-State: AOAM533NL/KXS7sz4YH9Kx99mjOzeeHffw0MhV9Q+1d3oSUh4nN06kbo
	W/FTEBeYu8eFsW/QMw1HY9b9c43EdemBCg==
X-Google-Smtp-Source: ABdhPJy0LoNCzoIeWeEB26Fzbhm4YQeD0ZmZ3PfoUNhB0U2lEBf1vM3k6tRHBKEJBLOezdJtwXKtDg==
X-Received: by 2002:a63:455d:: with SMTP id u29mr941122pgk.286.1614809714352;
        Wed, 03 Mar 2021 14:15:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id z22sm25582464pfa.41.2021.03.03.14.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:15:13 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libyui-ncurses: Disable Werror
Date: Wed,  3 Mar 2021 14:15:11 -0800
Message-Id: <20210303221511.2920839-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are new warnings seen with new clang 12 and gcc11
lets disable the warnings-as-errors for now

src/NCPopupTextEntry.cc:76:74: error: 'void operator delete(void*, std::size_t)' called on pointer returned from a mismatched allocation function [-Werror=mismatched-new-delete]
|    76 |                                                       NCInputField::PLAIN);
|       |                                                                          ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
index 5efbb44901..bcc8b64328 100644
--- a/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
+++ b/meta-oe/recipes-graphics/libyui/libyui-ncurses_4.0.0.bb
@@ -19,8 +19,7 @@ DEPENDS += "boost libyui ncurses"
 
 BBCLASSEXTEND = "nativesdk"
 
-EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO"
-EXTRA_OECMAKE_append_toolchain-clang = " -DENABLE_WERROR=OFF"
+EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=RELWITHDEBINFO -DENABLE_WERROR=OFF"
 
 do_configure_prepend () {
     cd ${S}
-- 
2.30.1

