Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD60D5CC89
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 09:09:44 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18143.1765876180811838784
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 01:09:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=StcshjHy;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47118259fd8so43623045e9.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 01:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765876179; x=1766480979; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ljX1zfpVW3H7X6ScoBkYaNwHs6lQmfAvm05iyWFlEoA=;
        b=StcshjHyam36q7Bzaf8v7Mg2ghk7+cTMqlkbjBLVctEQ69vt7H2JfC7AE+qBxx5LCO
         D4S+khopjp0uG+qJU4tE2WVpRlyPJPNVNSdhkccp2LwSmZV0WfHZTgcDrpRilPQULYoL
         ToeB6m1VlPSzs1+HwOWtl5v1j9SBGYZxBt4hMV0JZDD1eBfSgVOQDJsDI5e7abmTSini
         vy9piQl1rCWnIk55x9UehFFuvwgpjZ1JAuy8CxBdlRySk9jvkSBv1GFPTlH820R1ddZ7
         hA3UM3waWg7VWpS3ftXuzLl808Dm+7xuvWSDiLf022Lh5+9/k/KOleR8Ne20eunf/xeG
         5zpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765876179; x=1766480979;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ljX1zfpVW3H7X6ScoBkYaNwHs6lQmfAvm05iyWFlEoA=;
        b=a6zjL+gEzLZFvy2bJr3+hlyYtrumuZ7WL3WER+P8Zgh52XjJQAdsVcCGl0Ee2i7e49
         UyuExIaAZZYEINGAecT7Ftxl4CHMjQNl4UrMV8ZiAxV5hjJn406y1y6PGfwWJam8LXPn
         SA/AvRGCWrBvGdcUfMctk1ic6HtDjvb6bKmgjK1Q7BLGJjOrrP2En5CFi6nk3OnYc9DU
         yK+dF6M9EmI18sK3VxzPdLBdgl3EytIDeF33Q19O16LAVpAutzXC5tjMjCIUW7znkgfp
         jjYmKONG2TXd9iBGioeJopjNLWyK/chKGZD5K0vJ+F0xfKz8WY+9fzlBRiVXNMmfcAmv
         k1iw==
X-Gm-Message-State: AOJu0Yz4+PN0SSnsYv7gSMnm4MBnaqncDhocK3KFXvd0661Y9Y7D/LHs
	a5ev3xyDNsQ7rKFKsoDYfgfgOfFp5cdDJiP0TsaXQpOqtd5TGasUHSinyfxBWg==
X-Gm-Gg: AY/fxX5GNVKZLB/+/UrNSazGT69WssuAuRD3J/kOqfVlomRZCM6kuE+DtSxrxZKhX17
	2gGTkiNn1OWSkrnZoYbwAoUIYt97ybMagRLUHUHBSLriipgIfDwqqqK3cdDTgfvzCq8q1uRzrtf
	T9Vpec2yJ2ywOdBaM6for5kCyRohmTHBx8OoO4GTMzMFko5/1VaRop7ag50783s3obeG0Grqw3Q
	Vuh/S+LHUu3mfu7+cASlIhdy/naYHv+Aca9FrC83ysYYP65vlSs26i3nDTdyklRmyyxR0bsQpAk
	kx1SyIuS7aXdLqTMRlRmg+yObpRIX7+pD/UyqQT6Zbc03fTZi2WqFDDTbssWhhpJ/VcmyVh9c86
	pgtbkQnYn4cbTvJ1ZTmMaM/tFWFNlt+HKh05NRDZTgAMUwhbv+D+CqO1mxn81H0Y4LD1KC3CtYd
	S8LVP4A1GTjZ0me8dVvK4=
X-Google-Smtp-Source: AGHT+IHaTCRNiUU3+4CNihvlBSwjUp39GyfHSAjcB1sQUtYcUyM3225byn0XbxAvP7IKcDMgUlBpSg==
X-Received: by 2002:a05:6000:2909:b0:42b:3b55:8929 with SMTP id ffacd0b85a97d-42fb44bb495mr14233312f8f.19.1765876178937;
        Tue, 16 Dec 2025 01:09:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430fb078e56sm13435480f8f.21.2025.12.16.01.09.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 01:09:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] openvpn: upgrade 2.6.16 -> 2.6.17
Date: Tue, 16 Dec 2025 10:09:37 +0100
Message-ID: <20251216090937.1426703-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 09:09:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122690

Changelog:
- Windows/interactive service: fix erroneous exit on error that could
  be used by a local Windows users to achieve a local denial-of-service
  (CVE-2025-13751)
- Windows/interactive service: improve service pipe robustness against
  file access races (uuid) and access by unauthorized processes (ACL).
  upgrade bundled build instruction (vcpkg and patch) for pkcs11-helper
  to 1.31, fixing a parser bug

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../openvpn/{openvpn_2.6.16.bb => openvpn_2.6.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.16.bb => openvpn_2.6.17.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
index 88f564313f..c454a93276 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4"
+SRC_URI[sha256sum] = "4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 

