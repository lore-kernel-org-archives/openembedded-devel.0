Return-Path: <aleksandar.nikolic010@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 414C7CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 05:05:21 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13409.1791176711970728124
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Oct 2026 22:05:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OnJ6I8uv;
 spf=pass (domain: gmail.com, ip: 74.125.225.140, mailfrom: aleksandar.nikolic010@gmail.com)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1722c37c9so3280965e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Oct 2026 22:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791176710; x=1791781510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wgNFzWabtDdGlvNSpnDa6JidUA9aNK7qtw/QGMU497k=;
        b=OnJ6I8uvEAyTYeAQ5ksqC9ykgSkvmDqUMCoredUU/WViBR8XLjPHd6bH8uYP3lsa+7
         jzIu0e4yUyOvQzYGK4WMaixFFRGapFRpUATsX7x2gu+5KQwUKKuDa23ZoxsOsVqTmrfF
         d2ob2mD92sm+c2PbK1zklLuvSf83yTGduCXk0xPHiaYGw16X2LFw1SDUrrrKCtkMbhET
         3WV8DmlmsCpfpbS082+1tMXtvmFYXs/+zulTeW59b93rsMSik7UiK21u4bLSXoocxUKN
         cm07BTP2gBZR3mrIALtS43tYL/kFsPV3tByiFHbBRbFACCaXIZ62rljED8q29SYvg9Zy
         3tLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791176710; x=1791781510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wgNFzWabtDdGlvNSpnDa6JidUA9aNK7qtw/QGMU497k=;
        b=ehdfruCwIuXh7ZjDdafPLdVS1bGEwsrd1tfbEdhqzF5b7ZqU35gQXZTaEEcSMpFu9F
         w0iBjHUoKv5g/WgkKXibJmFXG24lXIY1/3RnWBmEPHXZXrVvlt90Vy2Eow4CZyFQRRUD
         bapE2DdPuteX2jM+RsuGlaginKXayAPiYC6CmaZ92eAg2Oc5cScCoOJKqUIq4c54aPnC
         ddmyYDh74ymI8CdQy/yz+OFyqAXMAQQEPuPF4PnQ/D2ZzfMHNgsLBXMV3+FoX9VF/ENG
         fsNuaBfOWtadMu8rGAFPryRN2lRoaQQ8mocVhDUp2x4FDAvA5CLYntkNCKizfI+niHKi
         4kcg==
X-Gm-Message-State: AFuF++k1bmClaawk4IASdHMVivSRWu7RL/JU25+BwvFVZXx/8XFPon7O
	jdMZ8/DENQwwlGL8cdLjN3n9s3jX7ktdgu7nau4yZIBnnmJ9ah9qVtXimMiXZKnM
X-Gm-Gg: AYBFou0ijidGt577Xw5LMZwEWhBg1WWLQxaUPAy4pLRFoQ4IJ98ZLB65dB4N6a11yqK
	zVCvlmAOSN378BDWCIol+/Wiu9/DTJmsRQ6JUcWqT40R7vuH/9Eki7SDZ+aNHpy4XMDDItRRt3o
	RQJNotugsRS80F0e0sNgwRr4sGdqaKQDhKm0U/E/I6oc1liFuo+corqvXmgSTLR3Y4H69BeLXAa
	gBgaCd+07lhy2KmWqwAZ2VoihlS/g0oevr4r0qp2sUZ8HdM7i87iRBC6vRJP0vT1fvltbo9leB4
	rqZ03Egi4hpCbla2+FE34uGVPU/tXqgHQ30TE4ux7LAJKJB/AH3e0uwX+H+GytmiRDIHhhfMhlF
	CNTVIwkKxcU4uXRjoSe+QVZ9grihDzNC0KgsyWTJ1ZGK2he2wWzWTdoMfYbZn0n0rCQEAS365Tg
	D37XJJTKZ9idfn7KOfnxPlFv15yRlxgOFaF+EcqkimVrJpDUV+077hhG7iYT9ND4IgsH1qhQ/aW
	jE6brppiUH8G0cBXDn7EA==
X-Received: by 2002:a05:600c:1f8c:b0:4a1:6e89:f275 with SMTP id 5b1f17b1804b1-4a16e89f4d7mr56199805e9.18.1791176709822;
        Sun, 04 Oct 2026 22:05:09 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810d:61f:4100:438c:b3f0:35ae:d67f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0a6e894a4sm277685035e9.5.2026.10.04.22.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 22:05:09 -0700 (PDT)
From: Aleksandar Nikolic <aleksandar.nikolic010@gmail.com>
X-Google-Original-From: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
To: openembedded-devel@lists.openembedded.org
Cc: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
Subject: [meta-networking] mosquitto: Add missing 'mosquitto' static group id
Date: Mon,  5 Oct 2026 07:05:06 +0200
Message-ID: <20261005050507.1616567-1-aleksandar.nikolic22@pm.me>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2026 05:05:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130623

The mosquitto user gets added to the mosquitto group in the
recipe [1], so make sure the mosquitto static group id exists
and that the mosquitto user is a part of it.

[1] https://git.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/mosquitto/mosquitto_2.1.2.bb#n94

Signed-off-by: Aleksandar Nikolic <aleksandar.nikolic22@pm.me>
---
 meta-networking/files/static-group-meta-networking  | 1 +
 meta-networking/files/static-passwd-meta-networking | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/files/static-group-meta-networking b/meta-networking/files/static-group-meta-networking
index dbdc7a5b9b..6c28c8c4b7 100644
--- a/meta-networking/files/static-group-meta-networking
+++ b/meta-networking/files/static-group-meta-networking
@@ -13,3 +13,4 @@ lldpd:x:642:
 opensaf:x:643:
 radiusd:x:651:
 ntp:x:653:
+mosquitto:x:657:
diff --git a/meta-networking/files/static-passwd-meta-networking b/meta-networking/files/static-passwd-meta-networking
index bca257bb27..20ad644b3a 100644
--- a/meta-networking/files/static-passwd-meta-networking
+++ b/meta-networking/files/static-passwd-meta-networking
@@ -16,4 +16,4 @@ ntp:x:653:ntp::/:/bin/nologin
 nm-fortisslvpn:x:654:nogroup::/:/bin/nologin
 nm-openvpn:x:655:nogroup::/:/bin/nologin
 squid:x:656:nogroup::/:/bin/nologin
-mosquitto:x:657:nogroup::/:/bin/nologin
+mosquitto:x:657:mosquitto::/:/bin/nologin
-- 
2.47.3


