Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2EEC6FA8B
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:24 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.11135.1662276920502447038
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hbuPv2tG;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 o2-20020a17090a9f8200b0020025a22208so2180012pjp.2
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=18hUwbuEHhn3RcXqTgiNSzpD8AilqAOdm6o4IQ0jUCE=;
        b=hbuPv2tGiiAKckCObPwbOld5hb/L9IH9ibsS0JelQ5NbSwqVIvbrIPpc5Mrq1qdkpx
         7plGmAU0Sovit2V+HWyao4BNUG4wPg0Fx2lKpSJ7FeoP4E9JsWHg7hGYo/FsBL5TSq4a
         4bbjwtF5/EiP4s5Y8cPo0tQRBaFxbPzUZ2thh1NJQnsp9GaB5/zru0DxOjF9fOPV2rU6
         oVQR4eUhuLQEHIB2OYTtONRgCDX1XvRxImw66H/nwNlw/8noeRyU0pl9GeCL2T18MwKU
         dji8Hk3v0schgpNYHxlNFOH42nhGNVyqSuaYrwl3ZfRTHbT4PYV3SX2DiQ8C2vpkWvcR
         kx2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=18hUwbuEHhn3RcXqTgiNSzpD8AilqAOdm6o4IQ0jUCE=;
        b=iEDcpCL6sz+vG0IjqJNRKZkLv6g57PnMEoeWNaqy9rzYRPQ62mGAcSAq4VqoeFDxTM
         kFvg9+QHnXKhwewyO1O67PBIxStnEBwJN8BT3IsvooPnaaYhcr7q7zfgPD5IH1TJSWPs
         3iFG4FWkxlySxpq8vuLa7DGG6JA6OjzE00SvGmGNzyHcl6K7si9jgp1jeKk2/wdNvDyO
         z2yMGNOcgFd56YiW4TT4RVZsSxtuLGPdFoqk980rASTP4w3dUXCYUYpru2wEPHyhmPm9
         kZ3x5wgwDrPVGnq03VOxXoEs29qkC5WDbzs6uuZpOLsHHJLJ/p9ZQHGhXfkM0xmkTquW
         UKlQ==
X-Gm-Message-State: ACgBeo120dK8mSR51/a9//Oq+Jacc8bkmkH/Ok77oVKY6EFkCQB5eFYC
	LWTTnASvvQxMmNSRKh4P6Vhdxnu3nNxMiw==
X-Google-Smtp-Source: 
 AA6agR4EJ1Tb4PvA/ZQ3sdIc8NZxm28VBqg8bBPTIW+iq+aFHsrrGaPsAZis+rs3r/E8Pq2qSgDStg==
X-Received: by 2002:a17:902:f684:b0:172:d54d:6f9e with SMTP id
 l4-20020a170902f68400b00172d54d6f9emr43638647plg.174.1662276919680;
        Sun, 04 Sep 2022 00:35:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:35:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 58/63] nlohmann-fifo: Disable cpp11 shuffle with
 clang/libc++
Date: Sun,  4 Sep 2022 00:34:12 -0700
Message-Id: <20220904073417.3251865-58-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98652

it does not compile with clang15 based libc++

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
index 5a130ebda4..b5d05d40e5 100644
--- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -20,6 +20,9 @@ RDEPENDS:${PN}-dev = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
+# See https://github.com/SOCI/soci/issues/984
+CXXFLAGS:append:toolchain-clang:runtime-llvm = " -DCATCH_CONFIG_CPP11_NO_SHUFFLE"
+
 do_install() {
     install -d ${D}${includedir}
     install -m 0644 ${S}/src/fifo_map.hpp ${D}${includedir} 
-- 
2.37.3


