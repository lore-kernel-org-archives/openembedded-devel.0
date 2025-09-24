Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85916CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 18:57:40 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.22464.1758740256786523529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 11:57:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VUJ7XQoJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b28e1b87aa7so24558366b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 11:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758740255; x=1759345055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RgszPQV3OmQvcIHfJOSdWoQuo6xiRF9uudzGhKatG7s=;
        b=VUJ7XQoJAl0MFteMVHynMnzjKHWgAgz66pwfdn2kHa6aVdIDXcWi8NV+f8ZKWJRwQO
         NlMXrd6ZNs+q9OdeigyWhlhUSAWPbhNIckKX8m21IY2SoLGWNLObugMCJcXZYYCzvnjb
         50vkzJwV+sF3jgKbuq3F8cwNEPPB4eQY07bCPSUip6jympcAL840l9heQEY4cXooA3CR
         VuZoto/2m/VCtVMaVekDEMTJrPz/RJmDxAd5M9uge3woU5LdkCY2wq1HJpb+BaZAvFi6
         gMgwUQmcy576vvN6ZZ+k18/j/M3MNWgUjQt/LusZUTUmUbNG80TmeWU0XuDfL+iQK6cq
         PWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758740255; x=1759345055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RgszPQV3OmQvcIHfJOSdWoQuo6xiRF9uudzGhKatG7s=;
        b=LM2sngRDyBQy0kJqSKFiekI2XlIj+s5jPhJmkQ+7SUzLdgz1sxodH7d2tk3NoLFf8E
         rQ4ACPlY4BZ1ExstQ50YAZaiZCCduxexjcQ0EyQBRlwSlMdRb3ugJ32lZND0HMSy8GQm
         XSieQd8Jc5MEeci1sc6od24A7y0yLaaUKnT92M2fcPxKlDu5E2elt18koUipn+b5JCXa
         ylHJoGVmTxPfPbRTXu/V1IegO6K1iYFTCbialT2eZ68wZxoJaDcK9g9/ozGMsKK7tA+T
         NprNUT7XWPw2p6HyoESh+SpI8AdoFtTDmfFGyOLUAbkAMeG7oDyHLTxfh3DGxtsw9EHD
         DO4w==
X-Gm-Message-State: AOJu0YyaRi1ZWTe+Z4CdWTEIVs5IST4bmX+SX7mWwkq0+R3W2xJhFoY7
	/oZ4TGtkOC9k+qlx15kAEau6vmYuEIL1CF3qGeKmWCv+aJCw8DRh/5phbDezXA==
X-Gm-Gg: ASbGnctRKVGECK4YgRvoUyTDfF3TlIoL3v8ltdqrJM6wMRbjAJbb69mxX1KjlUHfivs
	OGokh8gJQ6gZsZsUQqdg2JgJ2Zwyyvwb9RSIbWWH3Qu71ZpYvNOLsfumAv23eQFg6nz5HT0jKkt
	ZC2Ngvlbi7pitkBTZADv0FEVoi855HH0zC14wW4zX51sKe0OAw4lDaO6xFA9Dhi1Lv6Zp6t8eKo
	MpUBlEajQoIznLvt1kMEaQGQTYqLl7oFv0ruT7EhvyH3llqgl2516SLg/LkXv/a5hwUiSe69cN6
	ZgThp84PuFNMQjejk7QBKEkxzyctpDaJ5trcXZE2h8I3BvnOb3TzcnLAfIIw5y9czRS7kUN9n6g
	fZW8+LflcDRepLH+C9PUK
X-Google-Smtp-Source: AGHT+IEkCriCFEZ58m9V+Dpfeu1IYb/0wor6cxLnb9OjXfz+XmFVNW2aZT11L8nfjT3jX/rhOwiExw==
X-Received: by 2002:a17:907:3faa:b0:b30:673:b2d1 with SMTP id a640c23a62f3a-b34bf664162mr87705266b.53.1758740254985;
        Wed, 24 Sep 2025 11:57:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b26847b9f37sm1239520066b.18.2025.09.24.11.57.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 11:57:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] arno-iptables-firewall: upgrade 2.1.2 -> 2.1.2a
Date: Wed, 24 Sep 2025 20:57:33 +0200
Message-ID: <20250924185733.11620-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 18:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119831

Changelog:
- dig wrapper function was broken since 2.1.2
- No longer send nslookup/dig stderr to /dev/null

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...les-firewall_2.1.2.bb => arno-iptables-firewall_2.1.2a.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.1.2.bb => arno-iptables-firewall_2.1.2a.bb} (95%)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
similarity index 95%
rename from meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
rename to meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
index 20ba132fd0..e7c25ef266 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
-SRCREV = "c8dfd85b9e8e453e279525f30c1e3184c092f036"
-SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https"
+SRCREV = "4651194df5f985ebfc989da0a20d62b9baecf314"
+SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https;tag=${PV}"
 
 
 inherit systemd

