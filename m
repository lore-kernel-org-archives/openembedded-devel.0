Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.343.1632168388709870292
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 13:06:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dCUdFdOi;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: geoffhp@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id lb1-20020a17090b4a4100b001993f863df2so808276pjb.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Sep 2021 13:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SDgAvLNbhVtNRfA8mZFcEe/QP1268rn+5vO2VJlvAUE=;
        b=dCUdFdOiFseQJVZxTbIs27fYZR+j9jtaGLvp4ZYLkBtcNo29EdMorlBp/MY/WCrUY/
         +NuQfkd6ykD5Nz6IpWntP0+G0Xr+Y4MgJO9euvdHZ5EGEu44s8lVY3e23maFcbmxWK+e
         ckAOff8J9FGguvYKpUGG15++/QBKaQzmPq4G14DfAcqnqsJjQyF7GLdoGrWAGcb2oSnT
         EKPfRHnCHF65CHgIthMLjYK72Pe5yJABNaPDnQPplULWjOKF4Bsa2ONX2Y+7Ay291mRu
         I2PON+t+aihNezLssjFP/reUDsW7R7FPoFldDVcim+mrDGhjsLOVvnZ4AOXNM4DpUKLZ
         qylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SDgAvLNbhVtNRfA8mZFcEe/QP1268rn+5vO2VJlvAUE=;
        b=FYoD52iLzUpd3VERalZQa9umJTRnjsAZmR8+aJNrVdPNot5PQUdxb+1OuOMz8nBmLT
         2yRqwdjReWerOgVcy1yZ+POsT1Vr9Gpj1q1+Uo4avF0snlFqpelex6B9KNZ8pAUfYqYg
         a0zBZmN3jnPE38tNVRe16WqYWr90KbwOomMFL5+pi5DyOaT5z5OLvz5bOaLT8n0PJVc7
         GaSG5A2qFzWYdDnp02zHHB+4C1B6fjhKuU8RmiGBNkmTdy5DGt4SJkM4dBTXWEUXevuk
         Hr+hPfFoAENm0rWVFtVrNpuznGJe/sI2blxIRu2Nd3v380vA7p+y8OJFGi7ANAAQl3lR
         PHbA==
X-Gm-Message-State: AOAM532mMW91bTl9XNCINJFCH4N8N95MSnEEy4cNDjkls17cHXKUIiUj
	zsuxu/alIdmkiKJQBMl60GgTHy3ESVc=
X-Google-Smtp-Source: ABdhPJxvryNwqI6RTCkxhdZt85/BkfVUPf5Flu0ii2PemZYBcFK7MgUAiRXqjoweJ6CVBu4FDV6jNQ==
X-Received: by 2002:a17:902:c10a:b0:132:580a:90b4 with SMTP id 10-20020a170902c10a00b00132580a90b4mr3472821pli.7.1632168387942;
        Mon, 20 Sep 2021 13:06:27 -0700 (PDT)
Return-Path: <geoffhp@gmail.com>
Received: from localhost.localdomain (cpe-107-185-48-203.socal.res.rr.com. [107.185.48.203])
        by smtp.gmail.com with ESMTPSA id f127sm15372201pfa.25.2021.09.20.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 13:06:27 -0700 (PDT)
From: "Geoff Parker" <geoffhp@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Geoff Parker <geoffrey.parker@arthrex.com>
Subject: [meta=java][PATCH] layer.conf: Mark as compatible with honister
Date: Mon, 20 Sep 2021 13:06:07 -0700
Message-Id: <20210920200607.929739-1-geoffhp@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geoff Parker <geoffrey.parker@arthrex.com>

Signed-off-by: Geoff Parker <geoffrey.parker@arthrex.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 7ef116d..7791178 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth hardknott"
+LAYERSERIES_COMPAT_meta-java = "dunfell gatesgarth hardknott honister"
 LAYERDEPENDS_meta-java += "openembedded-layer"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.30.2

