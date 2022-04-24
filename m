Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28F9C47082
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:11 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.13950.1650769811202870441
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mhnUP2gC;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id a15so11718187pfv.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=derKOZKQRFIOOyOR83RT98ddZQNhk1wQafq9UdHV3x4=;
        b=mhnUP2gC44B/Prrf0dNtZy5nN8q9HwJq4We0SWLAZ0xznyCc9pAkeHs0g//pEyESPY
         V9TztmyUWZP7bvsDzFsKD38AAQTVWxG1a75gF1tTv2X34p/t7v9+rer1nRsglvjITg1V
         LUbF2iItRzlLvrYFwklTqSnFmQI0wa9tyw/Op+N9sX3BUspInQqmx2/wlEPqmOOQWZUz
         ISPIzV/D9FVcVzKMc82rl0qXNZW6Vyc0HgwNp+3Sjs1nOxY+SVrJwrPC63V72gi2XM0q
         K0KAMiMsh6y4g/riL+XrgpVf/SC/ourlEvIyPYsm7EWe6lhFth0bDnyiBdYCSog2cgpq
         AsRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=derKOZKQRFIOOyOR83RT98ddZQNhk1wQafq9UdHV3x4=;
        b=lhvN/BC39ug4SA5kTHt964cZ2kqkP5CooFP+XUUC4Pk/82l5Lb9OyegCGHdmkmwZTY
         PodWNux9JsaHp2EzUIcGqZi4GuTCzB+i++/p2zkdKzoZmShYc50LBu1FJZbMFfHPSvFb
         Oy4+KT2ZQZq9ByuAcewo2aDHcw14wkARE64SmglbxPtXbq506jD5m/yUzP6OF53T3We1
         RGbQrVxgGRYjC95FdYNChMaAHKRI8z7X0HgGJH+1Xor0DNRBL+g/kkdb4IIsgN6skYR9
         vMhu5C6Bi93bArFYvqQaEvxLZ8MeL1JQMrQJi7SC7cU8mef3DfFCKM4fpFKy2GiQuPBp
         Auug==
X-Gm-Message-State: AOAM532gB1uFbCcocIWsvHdxvNOqkEcb8E04Tledkl946mSMPX+xz5f/
	iui5ShoQg3s7heZZhflzaAc3B0NmYaLGbQ==
X-Google-Smtp-Source: 
 ABdhPJwVdcWIb9LF2/9DyONN2BGrOaNGUaouT2qtepzB0WMjUa6ENiwJuqBmvxlXkuEhJGVMKMLQAQ==
X-Received: by 2002:a63:6886:0:b0:3aa:9204:d1eb with SMTP id
 d128-20020a636886000000b003aa9204d1ebmr10036015pgc.63.1650769810456;
        Sat, 23 Apr 2022 20:10:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 q13-20020a17090a2e0d00b001cd4989feebsm10630987pjd.55.2022.04.23.20.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Apr 2022 20:10:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 05/12] tomoyo-tools: Define SBINDIR
Date: Sat, 23 Apr 2022 20:09:57 -0700
Message-Id: <20220424031004.3209576-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220424031004.3209576-1-raj.khem@gmail.com>
References: <20220424031004.3209576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96742

default SBINDIR is hardcoded to /sbin which does not work when using
usrmerge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
index a1c4cc9eb9..d9f09d1744 100644
--- a/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
+++ b/meta-oe/recipes-security/tomoyo-tools/tomoyo-tools_2.5.0.bb
@@ -26,5 +26,5 @@ do_compile () {
 }
 
 do_install() {
-    oe_runmake install INSTALLDIR=${D}
+    oe_runmake install SBINDIR=${base_sbindir} INSTALLDIR=${D}
 }
-- 
2.36.0


