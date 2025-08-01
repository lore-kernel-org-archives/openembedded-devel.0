Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BE7CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 11:02:33 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web10.7264.1755583015618003582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Aug 2025 22:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCjmdTat;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: pratikmanvar09@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-53b1740154dso3457980e0c.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Aug 2025 22:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755583014; x=1756187814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r/K5k9RF+h67xPl/CyfbDuSgELgK/EITCycwmL4sbSM=;
        b=BCjmdTatNClIkS+S6l7w9IBIVUxtBKv1/8TP8zqaC33znBgXTb3jFiIZIEjLak/Jtq
         KKuAqYVoN4+CRom2ZjA5tPsB+r1UihN8glyiKnuwv+o2UBBECY+X6+wzRiWC4ivNmWsU
         bRe6op3JyrVfFfqbj/xu4qqeXFxLUvn+rNdnwUuCGsXiS90Eq4Jg0PP5jY7EA4OPOd5w
         5+xV/hwePqjcNDjDcGd2K/XvjYJF9KZ4mieBQviQzAwGSHX8T+Zsv/OepAq1cUgoHVUK
         en0wdCAvKR20Fy2U5W6Q9Pyd762p8KUxT/RUCK2zwC7EQiPZjp3ujEKPym/riWjomcax
         /VlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755583014; x=1756187814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/K5k9RF+h67xPl/CyfbDuSgELgK/EITCycwmL4sbSM=;
        b=ZH5W9A80ujkqXr1xifbZfeQT5gumu8Xt51N+HtbRspDdD8sSt6iFryhV3++MDQp/6g
         JekLArtu7tNLLN34G9C+71H835tTKP8nCghBa+t5FGxnlg3jmfhMrUJz64I/cINjnUNn
         CVRaZkaKMthiRxJyaVFP1pBpKCr4qGu3DabJ8wSl+TGdLfz/7DbAe/R9RU4q7u5XcFDg
         ZPZ203imhSBh5rEns82V200FiNMkYMj3AL7vitzg+Pej40BaVhLK7LQs0mgsa8xeia6L
         8az3St9CuxUrG07zMLvtHuoHDMpBdyjdat1m4icnBa17RXBl913OlV1RzOMm5tTTmfU5
         mJ0g==
X-Gm-Message-State: AOJu0Yy3wHIEwaSHIyrbKyW/o9b/0r87yQuu1oAy4g3HHX78d6IHvLkc
	9RrH3zX2pNJlra3fHRKqu9gNWooS9neNl89YqEujixY+qzivaw58YY75xN4Cew==
X-Gm-Gg: ASbGncvLBFH8ULj3POXC9wuoPIZ3aXmAu2UjKs3i/6/1KzWMXTDvmHM+6iTNnPXHdNZ
	GmGIdAwkGGfEzHoa+YxAuWXoZuc1IUsGT269n6lnm1q+m29j2FTZrce4dknbBgk0BcMsi04u5q0
	pnSXxNC6kLxkTU0785Iz9WNdSucsvGlVxQUuyhYcTuVBnTXWokwxo51FOiFqGAgnsY2ClP3SPbJ
	kGTzO55Ik3DmtSiayq5BxIvj8cRkM4Fs10nu7uZovgfs6PUM2Mi9JQ8EiEAElZbBe9vbC51ED5g
	puFxOG2zoAeXOg+QwvsjpybgsAUEFrw9bNSP/xrcnRa/Bt3GCjvCwvEtsoQBKNtwP6uoQIjQLbS
	3F9A37B6sAKvR/OWlbgxVP5VEJ+7wkpAROK+phrM=
X-Google-Smtp-Source: AGHT+IG7uv4wp6pWIOpz2u1xInfa4mEzf+dSSPO0SLQbvAXRzUYOV3K06+fCqJKtGl+21g/VSRaezg==
X-Received: by 2002:a05:6a21:6d9c:b0:243:78a:82d0 with SMTP id adf61e73a8af0-2430db1a50amr1489951637.29.1755582545874;
        Mon, 18 Aug 2025 22:49:05 -0700 (PDT)
Received: from bsp.intra.ifm ([137.59.64.99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d5246e2sm1350565b3a.82.2025.08.18.22.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 22:49:05 -0700 (PDT)
From: Pratik Manvar <pratikmanvar09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pratik Manvar <pratik.manvar@ifm.com>,
	Florian Glaser <florian.glaser@ifm.com>
Subject: [meta-networking][scarthgap][PATCH] mbedtls: remove tag from SRC_URI to avoid fetcher conflict
Date: Fri,  1 Aug 2025 18:21:13 +0530
Message-ID: <20250801125113.3324-1-pratikmanvar09@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 11:02:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119001

From: Pratik Manvar <pratik.manvar@ifm.com>

This fixes a fetcher error caused by conflicting SRCREV & tag values,
even when they point to the same commit.

Error logs:
| # ERROR: ExpansionError during parsing meta-openembedded/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
| # bb.data_smart.ExpansionError: Failure expanding variable fetcher_hashes_dummyfunc[vardepvalue], expression was ${@bb.fetch.get_hashvalue(d)} which triggered exception FetchError: Fetcher failure: Conflicting revisions (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4 from the url) found, please specify one valid value
| # The variable dependency chain for the failure is: fetcher_hashes_dummyfunc[vardepvalue]

Signed-off-by: Florian Glaser <florian.glaser@ifm.com>
Signed-off-by: Pratik Manvar <pratik.manvar@ifm.com>
---
 meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
index 88b50a406b..a0dc6a689a 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=379d5819937a6c2f1ef1630d341e026d"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6;tag=v${PV} \
+SRC_URI = "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=https;branch=mbedtls-3.6 \
            file://run-ptest \
            "
 
-- 
2.25.1


