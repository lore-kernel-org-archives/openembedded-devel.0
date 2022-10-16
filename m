Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F533C4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 20:17:18 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.33769.1665951434066426954
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Oct 2022 13:17:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j3U2yDqQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id z97so13396406ede.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 13:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4g2p5lkzaVSbi+9yeSMT9FALkY87Xi+YQd9Yhk+/Hk=;
        b=j3U2yDqQRemvcgAvzHxi3nwKfCrE+LtCCm9GKhEAESM8icgqdH0ExbqPV/DRUF7RXf
         pFtgJrWz2cv2jq+Kjip+IAm/ffdpBsMjKD+JscLSjNYhlk3U2crBPDKIsoULjX9/Jk18
         glGBj8J4G1GdgbNUqq8ueiQgvfmvS8xUwXUv9hXLZAkTcVR2p9rCHO9gWhMvV9FB/4Xr
         AEGPJ89+IzB7z+hF+tmJrbGG4HfDiXoAEe1Js0RQMRL+mJt8RfoSbg1400yrzVrgz+az
         tAKia9pPAzMFVrIJtSo1yUfSOWsVUujelwNevuC9/YPl949Y7CwfdL1pRUvsXy6+XBCB
         st6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4g2p5lkzaVSbi+9yeSMT9FALkY87Xi+YQd9Yhk+/Hk=;
        b=pzQV9gKx4WcGk6rA0wLy8hjTYAnlmgzlNiAE/0BPcabOWBCWQ7coNLx4dlo1xgnQcU
         b7JtkV3YMOX5jYQO4f7STfiHMWjPGkIOSX/5xmE5f4BPBLXm47YL6TBOBuYTLacjCTfi
         eSugtmCxhW7c4bRAJq7AcCsx2XzF5v7HW0OBHD9emzBU6Phal4nVrDAh365CR1tRwE+t
         f4gwxBjvv416Z4KWKfgl1RlCraxCzlquCXZqzLeWg25ez+D76Zonr8+Hc4q2KeQl0KH+
         W9QSrmxJw0gvbtpwlieEsbepWXY+Z9w78OletTHj1V8iR7Bjuj2RaYFDegIGz8aFr2F2
         O0/g==
X-Gm-Message-State: ACrzQf2d0AlqJL7U9uUer0nM3W81Pz+4Q7DVs4I4y/M93f0p0suTEj6X
	3rY+LHxKp0HKhi+un5myq1zWLbmhbWI=
X-Google-Smtp-Source: AMsMyM5x8XxQwxsl7ZZKySPRXNpDjz9wVmYkXUaJaLe+b9hb/nknS3DOn9DUpSjtnJ5IfKA1RgTTXw==
X-Received: by 2002:a05:6402:1205:b0:458:c1b2:e428 with SMTP id c5-20020a056402120500b00458c1b2e428mr7263258edw.94.1665951432129;
        Sun, 16 Oct 2022 13:17:12 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id ti5-20020a170907c20500b0078d8c1eee44sm4950672ejc.158.2022.10.16.13.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Oct 2022 13:17:11 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-networking][PATCH 1/3] conntrack-tools: Upgrade 1.4.6 -> 1.4.7
Date: Sun, 16 Oct 2022 21:16:57 +0100
Message-Id: <20221016201659.14759-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Oct 2022 20:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99180

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 .../{conntrack-tools_1.4.6.bb => conntrack-tools_1.4.7.bb}   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-filter/conntrack-tools/{conntrack-tools_1.4.6.bb => conntrack-tools_1.4.7.bb} (90%)

diff --git a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
similarity index 90%
rename from meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
rename to meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
index 8f57e823b88e..7d8ce9f80aa7 100644
--- a/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.6.bb
+++ b/meta-networking/recipes-filter/conntrack-tools/conntrack-tools_1.4.7.bb
@@ -8,12 +8,11 @@ DEPENDS = "libnfnetlink libnetfilter-conntrack libnetfilter-cttimeout \
 
 EXTRA_OECONF += "LIBS=-ltirpc CPPFLAGS=-I${STAGING_INCDIR}/tirpc"
 
-SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2;name=tar \
+SRC_URI = "http://www.netfilter.org/projects/conntrack-tools/files/conntrack-tools-${PV}.tar.bz2 \
     file://conntrack-failover \
     file://init \
 "
-SRC_URI[tar.md5sum] = "a9dc7567921213007def78ad72313109"
-SRC_URI[tar.sha256sum] = "590859cc848245dbfd9c6487761dd303b3a1771e007f4f42213063ca56205d5f"
+SRC_URI[sha256sum] = "099debcf57e81690ced57f516b493588a73518f48c14d656f823b29b4fc24b5d"
 
 inherit autotools update-rc.d pkgconfig
 
-- 
2.35.1


