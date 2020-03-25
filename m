Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.10581.1585141344855107363
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2020 06:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UKsZTbPI;
 spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id c81so2362724wmd.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2020 06:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=53O2X4IZwyADbiVYC5MqMMPDZOAkvN8mJlGObducKO4=;
        b=UKsZTbPIrj/sUjer1JTRBkbF/8SU5M+NB4ZCB5+ZwRN04BRyC0KuXSUjktr5U+1xZC
         mjbyj0hwUYYkGfu4PuRuY6WcVDuoknDIoRwNxKIw3Ntfows0OqlRf5EadvES1oU8KYI3
         neNY5Ifc6NOerLH4DifYhCkEoqPDLj8WKQyZKUXIIhEsQ/2KVkFUJi64OzH3UXUEGJ4z
         Kql27S6eMA5UO3yEDCraeYHf1ihl92zYBlF4SQW+GPbvf4xcJ5wHS4uUXeFuMRbmzUD/
         Vi81xtm4sKMjvubpweWDO7K3Z7I8UJXRjAXoKswOV6LupqmdyjUHMZlrgrRIwC4WkVB2
         ZN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=53O2X4IZwyADbiVYC5MqMMPDZOAkvN8mJlGObducKO4=;
        b=LnhfGk16EzYtL+0tD0HCXp2cZEyC11mxHdQv1aXCG77smNlDltrpjUYvr8159oNL3N
         vY4pdg8W5u+MiHtq6pebJKeT9vbP2WdLoE6BZkWX13abVV5eHTrl8I1LDCgp9ioIqrh2
         /WbXm2O9oYSoA8076Adnnurh36lpRb+4uhfJf4tnclf6wByaQ2shArTvzOxfEwyNvrq5
         xXU4HTBexckbtHmmreyGFTLNmabfNAoz51mpu7LJaGD2QmCEFR7q3QfrrGNmV0RGab1X
         vd5Q+YL9yogI3RcIwGMhSRVBQ4vfK9IWA4qx8YdoF3ESvUPbeTDJRdSyNDwIOFjozh3h
         y1+g==
X-Gm-Message-State: ANhLgQ0iaSj+hn8OlM+33J8g8K7JcP4hYPPldcHAgZjpfEnISALeLSl3
	DYqRXMS3Pg412oQiAsNdSltXOjZu
X-Google-Smtp-Source: ADFU+vubTB9AVWG7MWxCuy04cjMOf94sTwinlXgDYiE+4sngwsZYJfPTPi4YVLP+egYlSsrDSj8YcQ==
X-Received: by 2002:a7b:c8cc:: with SMTP id f12mr3376113wml.172.1585141343142;
        Wed, 25 Mar 2020 06:02:23 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w81sm9181826wmg.19.2020.03.25.06.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 06:02:21 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT for dunfell
Date: Wed, 25 Mar 2020 14:02:19 +0100
Message-Id: <20200325130219.25151-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 395954c..b25c9ef 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -14,6 +14,6 @@ LAYERVERSION_meta-python2 = "1"
 
 LAYERDEPENDS_meta-python2 = "core openembedded-layer"
 
-LAYERSERIES_COMPAT_meta-python2 = "thud warrior zeus"
+LAYERSERIES_COMPAT_meta-python2 = "dunfell"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
-- 
2.20.1

