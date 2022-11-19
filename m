Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C43AC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 15:58:37 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.23270.1668873491973601070
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Nov 2022 07:58:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lLSsCpcq;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id d18so1822429qvs.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8UBAkj4QoqM8Hsx1bqWl87xG69fKFO3tPAsHQIPnJds=;
        b=lLSsCpcqEca3cAbqYwj8AztPC/ByHTxjgpQu3YQxJDPAcp2EXL0F23Z1iTO5mAnUBP
         lSUACxG6rORKVJ8h9wJrIir+3CF7EWfdxxdgK7IrQJmL3YFM+afVDDhxhvdVRWLrEjXk
         0NPWPmOKGIr5KMvNrxRW8v5rT4MW9uvEtqqlaTQChvwIL7aWN1dCiPBPvOIGMtOdL5Ew
         1EeSwfvixNr0jJ1lSXjZMnvUhY8j8kjaLib5VNUpJdJITkEkbeFGudaNnIlbTCGbJ6S0
         u5+wsJg6OEWlN92YB/XVydSZGsGjU7b9GEgAB33QXg6KoxnD6NWuagLAz+lDAbrPQqsB
         eaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8UBAkj4QoqM8Hsx1bqWl87xG69fKFO3tPAsHQIPnJds=;
        b=v0J6SQToLpwvKqe7RATQKKoWpejBCgbVbxjf0Zz5ILc+2zXXQH2DrUH72zHx0mh6wS
         ZL+XDNJMoYou8Wnu9FX0PshrncZPna6eQ/Pnte3kkHTNF3cSx0Py1wKofEehzIor0tO3
         sUVD7Pa2h9KbRFTmeImvcceDCZEKWGPpDqvrleGIbGJeFp4QJHssXMtDerkmmawuhFNg
         stKz7wsdB4hiIbxwMThwCPyDyrnTL64066LowIccGIoLV4XCEDWw5BC1+bHSN5TSeKNV
         Cg30MfvI3kfQE1hi+hRAQmlb9WVq13Iufkw6xCfU9+meUwA7lWU2JB8mAeXJAXobDZJB
         XbqA==
X-Gm-Message-State: ANoB5pmBnB+ffaesH1uQQ5VNTEcL4XFBYJ+4jvzcSq4lO7ghdhE31Y7c
	G0UQ3A6spE5oRFk+oF6SIWAiwcPJRSXw6g==
X-Google-Smtp-Source: AA0mqf4Eav+h14E7p4UvbUVuoo6quRdhbWaw6XTkCS9aPwHLH2RnByX5PVA1IzqTnYymUH+equo4jA==
X-Received: by 2002:a05:6214:a61:b0:4bb:746b:b643 with SMTP id ef1-20020a0562140a6100b004bb746bb643mr1590145qvb.19.1668873516163;
        Sat, 19 Nov 2022 07:58:36 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8dbe:f48d:8b1a:1569])
        by smtp.gmail.com with ESMTPSA id c7-20020a05620a268700b006fb112f512csm4821314qkp.74.2022.11.19.07.58.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 07:58:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 22/35] python3-sqlalchemy: upgrade 1.4.41 -> 1.4.42
Date: Sat, 19 Nov 2022 10:57:46 -0500
Message-Id: <5dec8c3f39d7ba43077cf83f10ba6676583cabac.1668873377.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668873377.git.akuster808@gmail.com>
References: <cover.1668873377.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 15:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99661

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit c6ef4d9828344fefb5010ac6b4de170808ef1640)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...ython3-sqlalchemy_1.4.41.bb => python3-sqlalchemy_1.4.42.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.41.bb => python3-sqlalchemy_1.4.42.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb
index 5b93458792..6999554b81 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.41.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.42.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "0292f70d1797e3c54e862e6f30ae474014648bc9c723e14a2fda730adb0a9791"
+SRC_URI[sha256sum] = "177e41914c476ed1e1b77fd05966ea88c094053e17a85303c4ce007f88eff363"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


