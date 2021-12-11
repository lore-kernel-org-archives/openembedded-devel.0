Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31257C433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 18:58:11 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.25280.1639249089859525839
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=L/CtQ4Ti;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.54, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f54.google.com with SMTP id k37so23860091lfv.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 10:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=014mOH6DJ9L5nkVeXiR55FhUCerIigj2Ff7tXCkkHpQ=;
        b=L/CtQ4TidoVPUMRPCKMNPa9RV3UZ90Br5RmbXgy9VXbVSbGIs5PrsnVfPXTFLova6j
         v5tUa/2VKp7b9z7obB0TYCw20Ps3dBf3oVBlf89zoy7JtwLGoVtdFeG8Qq/v8b82u8oo
         OvMzJZhu4lnzFkwwe1JSCzMOglP0BTGSzci10rNNmMKMZVmtnMHMOrBioBB2sJbdeJ1A
         nQclbyUbqkimI38tDxRFzHbV+mz+0zA9lMUxbtKJIvgifjKQE+ESmUizJsBzTLjrSGUd
         N2rdbXqp8Fzaq0vYggbPwADBhYKa1PM+Ikz/t0H+HhckqhKS8vk55KdgziStjcE5s4c+
         f+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=014mOH6DJ9L5nkVeXiR55FhUCerIigj2Ff7tXCkkHpQ=;
        b=HCr2uG1q3YKfATWuaDQp1z37w/3NARWwNxx/iECaw8eMUDm8+9cXz1pQfrBZkrD/oA
         8VgIAIwwVaWaZmlPvXhZkSKAM0yMJ0SuzqsI7ijG3TIQ3EYjUNXopAHTDVnZH9BJu/kH
         RTt65g2hYRvl1WRsdfKF6/CFJGP6Gf5TGnXHLbDfR56rUBVw/W2wyhXpibsGehH2Q3ok
         h54Sk5Jz3u/1v7Ts9HJSDBVznFclhExYJnDRQ2wlw73puAoiQPfJuSTmlPrcsDrUI/wn
         5QHhRcsqpp5Z5vcTD4yC3DxgSs2sn+nQDUO71wWCgmYXve6dzAdfbfrJJ8K5ETGmzEh6
         2luA==
X-Gm-Message-State: AOAM530iD0/qXoDRqVqR6M+hhx+TsOUCuqtN/C2iIcb2k3PDME96zAGF
	FapcPpKj3QO0u32DOZILEoaxR7uEnceLqQIa
X-Google-Smtp-Source: 
 ABdhPJwaavtNkkSG1x5+8tyBBb60vlKomSjvhxe8FNbfOR166A3RXyO1syxF+WmIg/cKRsusmR1zEQ==
X-Received: by 2002:a05:6512:1109:: with SMTP id
 l9mr18834809lfg.181.1639249087930;
        Sat, 11 Dec 2021 10:58:07 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 br7sm728827lfb.243.2021.12.11.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 10:58:07 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pymetno: update to 0.9.0
Date: Sat, 11 Dec 2021 19:58:06 +0100
Message-Id: <20211211185806.2545811-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 18:58:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94290

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pymetno_0.7.0.bb => python3-pymetno_0.9.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymetno_0.7.0.bb => python3-pymetno_0.9.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
rename to meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
index 20f40d98b..02e8935f0 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.9.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
 
 SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
-SRCREV = "15f1e887aaaba3bf243cc8f88eb761e0ad85c355"
+SRCREV = "3b18971fb882deaaebb9aa511627c5fc6fb97526"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.25.1


