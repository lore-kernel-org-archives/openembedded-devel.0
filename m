Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560EDC5DF6D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 05:37:21 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.837.1787117838538382839
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 22:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DFp7QsCB;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so1084294a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 22:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787117838; x=1787722638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CH31iATUsjuc4i7vMlWWEdNWLRkyN/QSC1vsjJrxt9E=;
        b=DFp7QsCBeSMrjYp426XlaoaHlqm5SWeVZT0qs8yV4TVcVcp9mOC/nKFm3xytgubS1Q
         PKJ3JXwrQdzxpNw5gc8vuxgBdZIo0WgzcM083lvk/hA8uwP5ntyVzdN4BHUDQzeXiD83
         YhpfCIdyitMLu0Ty3tHwO5+ywN6yzFJbR/jvlDlzu4HU7UNCRCIT2+v927fTAdSgTIFL
         84eWjSit/5YuW42Qb7zNZ84ZZ6UjWELHrGL6CB+4ndnNi/UxCIBAWzVpaYuKB+Rdoe0P
         qaiJcxKfqEKNcA7XoP7fcLSoJhlU0jn/SHeSnbVIt6w1OSauo/JHG6xhT41KRt751N3r
         b/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117838; x=1787722638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CH31iATUsjuc4i7vMlWWEdNWLRkyN/QSC1vsjJrxt9E=;
        b=hSA6NUpsRj/YrI3ltPGgileKV/tWcxGhdRR9htoH9EGtSQExdvr6GyDkjHdbZZKq3M
         L0pyZ2ZJW85aTPW3DqJ94wGMu5K6C9APMtbGEslGFYY2XWeYtJBVi2aTqmNc5Y1t3UQ6
         i39dIz19PJA3trSP79nHmGFUIze31gzWJx4miKlQIr2IAA8QdwMsNTcWQcK0JotJsBRb
         YsjDxBtY8sXtqU0/Y1zDAPo8Bg+g/s0l0pUsaKNY68Tl5OOQyT4oMoRu0ZniToZq/kx3
         rer9jCSy8WHJxuXz/CbB3Dn9waSC09CUfuMnyCWdQpwkomxWNvO9b5Y6qkd3p82fNqf2
         KXlw==
X-Gm-Message-State: AOJu0Yzu2NKWjbODJNzpw2hoyIAURGOhnzudA1bRTbi/l7rtLnbu4uzQ
	XEong7GydeRIXk0Vz3rNUBP8NxLlpm/pJNYcMQvIDzKmHhM6706TIUH5IlXwuS8F
X-Gm-Gg: AR+sD10TGohh6MEUQsKJpfMMQrWK3zHQD4zpk70F4ehvw1d6NNJYE2tcsG6SbWS/Kt1
	4ApzoSNxsybpLiaMigUgit+FQ9QiyGnd05N518BLbjBINHjn2H8gkIVzaYYtmrolUzexsldEVdo
	VCBd2hk/XmVxfQzMbClb6Ks+PWkaL5fZr/Ve5SBiKfWgaAxk0o25YJRM/nR6Id1bBvycBwmUUAM
	b39/VEYUdQYFAQP+vX5ZWGHzLjGDtf7SNrBOa4qswdJ0PIyK2zcskooNalF7MxdcMtmNXbCl+YO
	0keJlhfU38LuZ+/TdpbTgbfcAq+yrd3lyDb6ZTiA28MJ5IYfu6QB/xxjMs5GwBwRcygjTnoii9D
	SqNxkukV3YQvyuyI9iGK0ozM3zl2E7tCDF6b/TG0xCZ8yH7Yo74YfVRyH8lt04Kxw240fRpiP1z
	BWcWR5q8Nrd2w3klEUg9wpWzmDW+Gqzj2SPxMAndCgTl5cdKsIWV5hfpxCO6m3HYsQT2tCIACRK
	pnkps0etdg+
X-Received: by 2002:a17:90b:1e49:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-39580f6c037mr3989328a91.10.1787117837874;
        Tue, 18 Aug 2026 22:37:17 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm2830814c88.15.2026.08.18.22.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 22:37:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 17/25] wireshark: upgrade 4.6.7 -> 4.6.8
Date: Wed, 19 Aug 2026 17:36:21 +1200
Message-ID: <20260819053629.391864-17-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
References: <20260819053629.391864-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 05:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129261

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.6.8.html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wireshark/{wireshark_4.6.7.bb => wireshark_4.6.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.7.bb => wireshark_4.6.8.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.6.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.6.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
index 7eacd4d3db..dd839f081a 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.6.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.6.8.bb
@@ -31,7 +31,7 @@ SRC_URI:append:class-native = " file://0001-don-t-look-for-iconv.h-for-native-bu
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "242929b8c10ba89a8d3bcad7ff2eba8effb648d30f48e270d2e5e6ff94d88613"
+SRC_URI[sha256sum] = "c0f1ccf217bc0d3b51a9c03ea178b0f7df682e475da26a2d21cd4a1bdd9579d0"
 
 PE = "1"
 

