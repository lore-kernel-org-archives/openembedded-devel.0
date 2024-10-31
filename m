Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D11D767C3
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 13:41:37 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web11.12751.1730382095364730345
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 06:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OLjuY5Rb;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a9a26a5d6bfso138969966b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 06:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730382094; x=1730986894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa8DdZb+SaywavqcaYVkplNaDZJcm4NIh7oUmLVVPCM=;
        b=OLjuY5Rbr4yYlsJ6LklXiGY9ecWgdaVDcadz0uImeE5QwCFxJSecjilZuD5ons6ysv
         GdHN0GIpqCk7Oa1cEZOs01uYS5ZBAaZHgFxT8UF1FFg/lpOwM3nMriLzw0BLD0nGb2Nw
         6uWJKbGHvdnMq9qDmAtISut6o4Cm8lKu1qTgHe2k49dc0IlWTpgx0FXs2ZhdkXnPJeVG
         pp24nN79crU+JSGUkbFnmIxm6wWXmWJjVBYuEhIKJb34Y5ctLe3KfjTOaHq/4s2qtuO+
         fujcNrdAAcX2o2M+AKeBXqWXDVDHLHd/eQXEvT5N7c7LS2R/vUdZvPGSUffTpiIiVsER
         oMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730382094; x=1730986894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sa8DdZb+SaywavqcaYVkplNaDZJcm4NIh7oUmLVVPCM=;
        b=QU2/laH4bWK8vNAW792DzESQg9ZeyOw/JaWqxBENt7D+p8+6pjK1Opnp1IPfXbp4fM
         bSnHIBhVUv/OtVVF1GY37Jr5YV4tUNm/stWpX2N8hqQqJQzyes1AIYjiQ6WJJ4EkdYCJ
         T23CbuLipiIfIIJcLJ/m2uDJIX3p7cZPvWM/hjD9TudwJopqOiGI1SGwXx5pdY+iwce0
         40vAxz/Zhzo1tHhTtxPYQONypei4VpgxIa/h64LpZsdgELQ+fhHykkDfXHP/cUMDO7Se
         2c+Kc/sqZDrGchg73iSB78MzXq70WvZmmQk7Q05gMCY206AWcAyNBoK/I6kfRInmOs1x
         vgtA==
X-Gm-Message-State: AOJu0YzbINf2jEfDU14Zb0wXDqbdAG4+y8p3sgy+nmebKaNNNTm1qYYY
	GuR7vPfRu7Ubzyb2g+dX6GTwWy/XGvZGi6m90gP8nMLMtDvKkTh8NEs3tQ==
X-Google-Smtp-Source: AGHT+IFnhUEJnz7nev07W3rhtLG/EEZ6YUhfX7OkN6YUkoUqndhwimwIrfXlfOu+GTTiXxn67fkEAQ==
X-Received: by 2002:a17:907:7d92:b0:a99:ebbb:1307 with SMTP id a640c23a62f3a-a9de6195af9mr1886367866b.59.1730382093606;
        Thu, 31 Oct 2024 06:41:33 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564c5405sm70860066b.79.2024.10.31.06.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 06:41:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [master-next][meta-oe][PATCH 10/11] python3-flask-sijax: fold .inc file into .bb
Date: Thu, 31 Oct 2024 14:41:13 +0100
Message-ID: <20241031134114.2791747-10-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031134114.2791747-1-martin.jansa@gmail.com>
References: <20241031134114.2791747-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 13:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113367

* python2 is long dead, kill .inc file as well

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../python/python-flask-sijax.inc               | 12 ------------
 .../python/python3-flask-sijax_0.4.1.bb         | 17 +++++++++++++++--
 2 files changed, 15 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-flask-sijax.inc

diff --git a/meta-python/recipes-devtools/python/python-flask-sijax.inc b/meta-python/recipes-devtools/python/python-flask-sijax.inc
deleted file mode 100644
index 239c843fce..0000000000
--- a/meta-python/recipes-devtools/python/python-flask-sijax.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "An extension for the Flask microframework that adds Sijax support."
-HOMEPAGE = "https://github.com/spantaleev/flask-sijax"
-LICENSE = "BSD-3-Clause"
-
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=266adc7b911b7c84b837bf77196e1ba6"
-
-PYPI_PACKAGE = "Flask-Sijax"
-RDEPENDS:${PN} += " \
-    python3-flask \
-    python3-sijax \
-    python3-werkzeug \
-"
diff --git a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
index e9a65c4aef..d518a1877f 100644
--- a/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-sijax_0.4.1.bb
@@ -1,4 +1,17 @@
+DESCRIPTION = "An extension for the Flask microframework that adds Sijax support."
+HOMEPAGE = "https://github.com/spantaleev/flask-sijax"
+LICENSE = "BSD-3-Clause"
+
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=266adc7b911b7c84b837bf77196e1ba6"
+
+SRC_URI[sha256sum] = "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
+
+PYPI_PACKAGE = "Flask-Sijax"
+
 inherit pypi setuptools3
-require python-flask-sijax.inc
 
-SRC_URI[sha256sum] = "fb2bf2d4f75408185102195055d75549fee8d9c9e954dca2427186925cdc429f"
\ No newline at end of file
+RDEPENDS:${PN} += " \
+    python3-flask \
+    python3-sijax \
+    python3-werkzeug \
+"
-- 
2.47.0


