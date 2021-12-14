Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DABC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 13:35:11 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.25638.1639488909836903141
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:35:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=BNk0CsOs;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.169, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f169.google.com with SMTP id k23so28371410lje.1
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 05:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5sCVDq1vdb6MOPfA3zPLrejeb4Vy5UVjTKNv9qIwa1g=;
        b=BNk0CsOsRm+pgn2OtueuD93wG7tkS6pAj914MiY5GY0LbPgv+PXFZSy+FIGQ04WURP
         kobebBW2Wf7ZoJUlHI7maCZUdmxrB1/W5BUs3Ujv9lJku46sJmN2D3op37hCYov1cDuV
         dQ3oJEWI2KDXe1/j/8nFWNgB7thA7w48uBBurLbt134SUu7lfoO1kZybNEQ18NQSQt80
         il1F9Jmsc/QrMsljl1fDEEEq+2yK6AlCb2wBuLR5r6u8p43lK1kJ/Nm3XRY9DnrxZdl7
         h/f/v8Ti4ouw79q9V+rcSZOyMI0ViMe6zXDuebvJ+mYu+Qj6I2KummO1QVLq/9IkiTDh
         cV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5sCVDq1vdb6MOPfA3zPLrejeb4Vy5UVjTKNv9qIwa1g=;
        b=qcuLc7JK0zVK0p8IuV/isy/EkXg/8PFaZCM6WZur0Xmpp12rtv93SgWzk+NRl2Hc2I
         tIaD8sm5TlwpciIQFlwegdGTIS7T7c8dPM29MXZOZSTw3ZjFNED7HKMCV4TxhhXnGQjv
         CTuZjHiUmwzYliD0H9T2zSJNzff/UM1VoiQeFSQJo515SZJ69Y2hiPAp2ccbCihIkhbu
         yGk3a4h+hZhG7VHi0bEOMf4cI+N6os7RVnyDyjLasaYJXIcfZtImG6rPQymAtULxU/Br
         AqFwJlAccroO/XW3K1A7QbS00/+UBAkNF+BdGfkUxo/LpSJekrB8b1TCH+Z+mYn/R9M2
         GYvQ==
X-Gm-Message-State: AOAM532/cYSw5u/1TZAmDev3YMfgY4u8ZOq/26NB902j8Xh+4kDuRzgN
	H3OCMNQ+dpcGEW6wVNPR+/UPcP8OUZtntPoq
X-Google-Smtp-Source: 
 ABdhPJzZIElMOfoKi+ALSgcX4e41q128H1X4p9J5llmB5j4x+qxL2JRXWhOLVRlY6o14gTe2+wGs6g==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr5037486ljn.336.1639488907854;
        Tue, 14 Dec 2021 05:35:07 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 g14sm1825689lfv.138.2021.12.14.05.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 05:35:07 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-gevent: update to 21.12.0
Date: Tue, 14 Dec 2021 14:35:04 +0100
Message-Id: <20211214133504.1175488-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 13:35:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94353

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-gevent_21.8.0.bb => python3-gevent_21.12.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_21.8.0.bb => python3-gevent_21.12.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb b/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
rename to meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
index 7bdf126de..9efeec4d9 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.12.0.bb
@@ -11,7 +11,7 @@ RDEPENDS:${PN} = "${PYTHON_PN}-greenlet \
 		  ${PYTHON_PN}-pprint \
 		 "
 
-SRC_URI[sha256sum] = "43e93e1a4738c922a2416baf33f0afb0a20b22d3dba886720bc037cd02a98575"
+SRC_URI[sha256sum] = "f48b64578c367b91fa793bf8eaaaf4995cb93c8bc45860e473bf868070ad094e"
 
 inherit pypi setuptools3
 
-- 
2.25.1


