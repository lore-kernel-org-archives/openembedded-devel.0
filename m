Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B76EC9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:43 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35334.1790506241944491769
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C1tj6N3q;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87fd84c0bfeso733261b3a.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506241; x=1791111041; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtjIOFLNNOoDQn28v/ks2E5E1tLnhscuKDMFZKBaFN0=;
        b=C1tj6N3qiucBGfQd1qi5G7W03cr74zpQNtASXkpvhP86Rwn7JnY8fEfmGj4wrJJLAi
         gVibybnBKiBGoxWkw0+w4CVonypFiMehCjrS7gFNWDxKn6rQQsDyGMYnw7CbALnB4mzf
         SW50HV+BvQpAvvrpoxiT7FTjMoUL6wFIo6JlfCo9uB3rIiOGhpO+cOMk9kcrTmFphHc4
         e6Ktijk2U4BYURx/sgfazE39ozG3BM2I9TZsY3b/n5Wujzk4IbpQy7tRdNJ6y0R2wmFl
         1InjQ32NDIOZSfudQn4N7Eci9o7BZM8L3wW3YxPwghXqgaKG8IGRdplPjRKlDmlvr8wE
         FEiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506241; x=1791111041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LtjIOFLNNOoDQn28v/ks2E5E1tLnhscuKDMFZKBaFN0=;
        b=OwRwZBEzRgSSOiqkHTPd1YrilIWtPJHFTxD4R9VBBzGc6rAUAPNL6YA4gJzlO9KEm2
         roPp13BSwdvWkgRBaM6zIWyHd7mmItsm9tmp2BF/V6rW6mbhjHOeuHZcUADMBFMVB2ST
         kiaya/kO8w4eZElk0lML+gxw3J8rgp1/Nke93tPpbqR2DgiBKFZOhVGz5StnB4hHbE8R
         h94gxqZ9lrVA2LC2rA/WfkvGCQVt2OesJjvanFvD1MrEEA+C7wklP9auURL9UjvRPBp7
         i0g/Isu/QR6WMbajLO5xsZ/hCfE53/ekuQjohNhKc7uBh3ufVDenNkYQUzgu3bWFcr8l
         XD8Q==
X-Gm-Message-State: AFuF++n4VW1jA8Dj20Nim8xP7jqKKkBJcCTliqJ5teWF/94IJIBOiA0/
	ehUcC7XKlschjO+aFYf0o8sbp1BxfL9mg8T9mNbJcS+/SpWqbjJKTOM0Oxg0AQ==
X-Gm-Gg: AYBFou0ypA9lm59WO2QVH2xkgx35Lmq2FqgG9tioLNX3RdOyMGAJnsM1K/vK4r+4ybM
	gFA5ajO1kPL14AKkqFc+odWZTYljHkrT2PfGnrrR56QFK52qLGaWqvZcOziAzsRWY58glt3jyoo
	lUdl2WmxjHMn1VKmkqmY5tmcXD6iFfRLCdWQLz2lAkg9tE43/opTTuDJmyBfx4gz+S8z5ggpICX
	Ssub4ms70tFWp4siSQA9K8ogFPLpS1XT5HYfiJUVihUo4Qi2YNjuJXCy8wuFI9tS03ziue2lwl4
	qPTfqkhnzcpC0IEZABfOeBPHEOtHyWb8Oo62IoX/ezTm+4LoJxrmaWm/KokHS1kbe/dbAZetmqG
	LuZpUXQPUTmtMIIYPfJPitSDIVOcCqiiBK9mZ+t0tPxwYKtYiyCCSflwOwKFJHJkjPh0PH/6hJk
	TwyNNPfIX0yXi3OTyYyL169DWvT141JRAEfm3Q8I+QYE/dEC3yOC8O5jMYq1oMIY3alNQ+zmtKB
	CuBCrSACIRoKwS06kFBHT0=
X-Received: by 2002:a05:6a00:ad8a:b0:82f:38df:681c with SMTP id d2e1a72fcca58-87e98788fa9mr7699525b3a.6.1790506241290;
        Sun, 27 Sep 2026 03:50:41 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:40 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 12/35] znc: upgrade 1.10.2 -> 1.10.3
Date: Sun, 27 Sep 2026 23:49:39 +1300
Message-ID: <20260927105002.1832451-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130346

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/znc/znc/blob/znc-1.10.3/ChangeLog.md

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-irc/znc/{znc_1.10.2.bb => znc_1.10.3.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-irc/znc/{znc_1.10.2.bb => znc_1.10.3.bb} (94%)

diff --git a/meta-networking/recipes-irc/znc/znc_1.10.2.bb b/meta-networking/recipes-irc/znc/znc_1.10.3.bb
similarity index 94%
rename from meta-networking/recipes-irc/znc/znc_1.10.2.bb
rename to meta-networking/recipes-irc/znc/znc_1.10.3.bb
index 31984742d8..019c3103f7 100644
--- a/meta-networking/recipes-irc/znc/znc_1.10.2.bb
+++ b/meta-networking/recipes-irc/znc/znc_1.10.3.bb
@@ -8,7 +8,7 @@ SRC_URI = "gitsm://github.com/znc/znc.git;branch=master;protocol=https;tag=${BP}
            file://0001-Fix-build-error-with-OpenSSL-4.patch \
            "
 
-SRCREV = "59af2206c62724eec0d8c43d3c1c0b70610ca1d9"
+SRCREV = "6bd91573cebd1e4ee954ebd4eb6db5b654e0e412"
 
 inherit cmake pkgconfig
 

