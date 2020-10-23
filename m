Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
 by mx.groups.io with SMTP id smtpd.web12.1766.1603481628466222123
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2020 12:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l2mYIPXR;
 spf=pass (domain: gmail.com, ip: 209.85.166.46, mailfrom: paulohefagundes@gmail.com)
Received: by mail-io1-f46.google.com with SMTP id q25so3196135ioh.4
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2020 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OiYr/XOnME2F60Wl6kJChxdT2TH0WQ7J1ObkNvv82ww=;
        b=l2mYIPXRWP+0xlOaZWo98z9z++dHBI95rB8+LCC2ZYMluo5B3nOsF4XWA085Sqysg5
         W0GeRQ+xU4/9JKUMh+TEJNCV7Zt/eBI79L2fHxikNisEuFzwRExiZNSze8qPsUZmQRXR
         QA3ckHXStjBqfmCdUBQNLYXgZQQy5bptCwcSUGS7VyEiJSVE4IRuHFo49KvdCb6tLspO
         casMJoD2e5mnhs4/IvHn0hQ839nM3YUhhVP4LdKWDDFkB4KGCfA+tD+GbpagHBdDpfor
         J9U3N/uHBJ4C/UHmkS3x9FUkxh71tMJa34YrMBoC9h5P/tUYWE162wBpIiUqH/JSet3A
         E2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OiYr/XOnME2F60Wl6kJChxdT2TH0WQ7J1ObkNvv82ww=;
        b=A2X64HrLQNwQE38DTt5X86JOkJ1YKdfho/mfD2picrk0PXvGyxpDHB5w4hLF7KJTHD
         YLLiLlNo1Q3RQapC+tdMG0q8EByao4UKPYA6ReudXKvyPBdPOguyG3td/ZhfA3Apceqq
         mF7o3LQV/NNtaTNyiZG5zixrka8sedEDiaX+chBcbubETGz9ZNpthRETkjwhNfq3SJ9R
         jW6lWhLdYxXGwhKwkEShmARj9jD7CKLyE3H+1Sr6hi12SCcGJtQQ0wATWavOE3aQemb9
         x9QF/RzXUN4ELtxhlJlbCSHokr+x8m/vf+jnKpfAtm+fkTQ9LmfymxVGCT7bNR63LwVX
         4vqA==
X-Gm-Message-State: AOAM530Pw4F46R/gHfMELitrgOiDMHYpInRlyIl5v0HfrDhvnZjv4c5t
	jmSCR+N9JIhm4rryYgIwxhcHWTAb/nY=
X-Google-Smtp-Source: ABdhPJxJykIAoAgjiVficooRhiwX9zxR4ozfs1OmNQrcpiS02HenDIaZxoKJBS6MPpINmCoTwrD1PA==
X-Received: by 2002:a6b:4a0d:: with SMTP id w13mr2144189iob.104.1603481627708;
        Fri, 23 Oct 2020 12:33:47 -0700 (PDT)
Return-Path: <paulohefagundes@gmail.com>
Received: from paulo-pc.og.opengear.com (c-174-52-8-24.hsd1.ut.comcast.net. [174.52.8.24])
        by smtp.gmail.com with ESMTPSA id b9sm1258716ilq.51.2020.10.23.12.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 12:33:46 -0700 (PDT)
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Paulo Fagundes <paulohefagundes@gmail.com>
Subject: [meta-oe][PATCH] redis-plus-plus: upgrade 1.1.2 -> 1.2.1
Date: Fri, 23 Oct 2020 13:33:37 -0600
Message-Id: <20201023193337.10829-1-paulohefagundes@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

---
 .../{redis-plus-plus_1.1.2.bb => redis-plus-plus_1.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.1.2.bb => redis-plus-plus_1.2.1.bb} (89%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb
similarity index 89%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb
index e23733b0f8..4059fd47e8 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.1.2.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.1.bb
@@ -7,7 +7,7 @@ RDEPENDS_${PN} += "hiredis"
 
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-SRCREV = "b08b36a9a91de00636e583307610f49af7876f50"
+SRCREV = "a9f9c301f8de1c181e6d45c573b5d1fe7b8200b1"
 SRC_URI = "git://github.com/sewenew/redis-plus-plus"
 
 S = "${WORKDIR}/git"
-- 
2.29.0

