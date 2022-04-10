Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD27EC38A04
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.21321.1649623404412049050
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=YtkpyIr/;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.45, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f45.google.com with SMTP id p10so23309898lfa.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uoi2V0BkWy/nUthNuzF1ECOWuB9AJyBkGArdvTuG7aA=;
        b=YtkpyIr/k8WsQ6VgvX00rw/WvVnDPhS5uTRdCfgIq1qGewKiLS1DjnclFyXTrAD0i4
         N9MWKSCE7bPN9WC784lYPRTpcCqdSF4JD4iIKPOzdd9nJz8LTgNs37uOduFI/Tx6kN5Y
         dp/Sf2DCraya0O4jhV4fsjiQraGELnPjSexo9l1YI2fJ0FcwzMhrgIewbNycxmTagVKW
         DDXTs2lb+EpTIUp86dDC0Xwqn0XQSCnTjuRmVXv+uQC6TGvlIn6LqsRjDYHexuy61w0K
         BR8E3rwsjHAkX0J/2eQAl+aI0XCvGO/Nq5wWPQIvlJLNd5GsY2C9uJxmxpLL2i6yt7SZ
         8USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Uoi2V0BkWy/nUthNuzF1ECOWuB9AJyBkGArdvTuG7aA=;
        b=rc/szoeHksSbzZu1xC+fCiaqQ4rwgYwJzfiAkHdmdOLlqjAx7wv+XDyPrIgKlzt5Ky
         6Uxp1sgGClkw7JxioXEJjLJUSyopErIPIfc1wvgPRhn9PgvKvgvYExg60NyHoEWvt8Z9
         fm/y4CTLJaQVdxxjshcS3VwTzYGhydt2WDdPxA/iuvdz5vDM/whiis5/1vXKLNyqlcGx
         KpHFxweVNyS2diM1k1EG/gzTfxwPricS5FO+CnbB8nmfcE5ivtPEK/q1k9+vcpz0pyf9
         pgV1OuUcVbYaxPcS8vz/Wey/0sHN+j2s7toZWvKZirRQ9c25a+H8icahXVDQOiW8B3Ef
         4iAg==
X-Gm-Message-State: AOAM530ii0OGHHySswmX0u/FQ37leHg+Ng80AZRn6cFaOCBtOOsPfLh8
	25TltM65Vu7T71qDAcQId8q71CtP5I9GkCm1
X-Google-Smtp-Source: 
 ABdhPJwBRcCLvzUWNCGsntLEs7+zm3uMwrbCTw78TQNkatER3SWrJXFnKysIkx9PrPNruLEi1N+6gg==
X-Received: by 2002:a05:6512:15a4:b0:46b:91a2:87ab with SMTP id
 bp36-20020a05651215a400b0046b91a287abmr5753071lfb.423.1649623402322;
        Sun, 10 Apr 2022 13:43:22 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 d9-20020a193849000000b0046ba6e7648asm71485lfj.193.2022.04.10.13.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:43:21 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-grpcio-tools: update to 1.45.0
Date: Sun, 10 Apr 2022 22:43:20 +0200
Message-Id: <20220410204320.4046438-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96525

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...n3-grpcio-tools_1.44.0.bb => python3-grpcio-tools_1.45.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.44.0.bb => python3-grpcio-tools_1.45.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.44.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.44.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
index 1b219fc95..1e919dd3a 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.45.0.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 DEPENDS += "${PYTHON_PN}-grpcio"
 
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
-SRC_URI[sha256sum] = "be37f458ea510c9a8f1caabbc2b258d12e55d189a567f5edcace90f27dc0efbf"
+SRC_URI[sha256sum] = "a016cfc21e0d91b3b036d3d4f968d1fdea865dfa03524cb1fbeca84719fd45a2"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-grpcio"
 
-- 
2.25.1


