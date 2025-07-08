Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F18FC83F10
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 10:52:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.15557.1751971919191612851
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jul 2025 03:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k2tlKBJz;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a588da60dfso2802614f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751971917; x=1752576717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Le0eWy2KTxjy1neIZUbJSznAv6V9HyofgxgA38obeyk=;
        b=k2tlKBJzp2qGQn6zT1XSiG3NyEvBuXDLY0THJHCqBgYOTIKDx/k3+uXA/GGJu5JY4G
         XAGLk9Bh+kOpg2HFu+NPlCSC0QhSQzldxNlBRmwxyik1J92eNvdjxXBQKa8VDQwyrEQM
         abRcurAdoU9wPKNyyY2ZqAvwH/aNaWL0CNwgrTJ5kiLnW+x7MrTtD5jfT7LsgbYwOtAi
         0VcyKHxLEUMvgnECf6Hw2d7NJwIJ77p+IpKpefkm0GiF7D2XAC8haQfKkYBWKpZsIfrD
         xq/YxBty/43kVxG9fRjVsPOKxHd7dFBQLMLUoR1lqJBac0kN4oltzzwAwpIlqFIBDipL
         lItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751971917; x=1752576717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Le0eWy2KTxjy1neIZUbJSznAv6V9HyofgxgA38obeyk=;
        b=sXk3kpvDeXit4avumvUW3QEEcptRt98SrZlkP7VqyRa59MHn//E6lIM9mpuaZk9V2g
         PH9CDogzqy4Ku2QJOqNFvAZhb6xtBUmK32QiFMBmCLCvAy7BWuuIl8N3O1M226Z0/twS
         UoK2OCtHtUqP/Fg+LeixzqCzsbh5I1lr0omDVfyYlLcVZg3Z3McZKtIat5v8nkFz5od9
         AflAzUzw4bsg/wMCym+CiqvDS6NoJMxYjw/ZSkc+p2gENb3Vhqb9o1GLHl9M+3k6q1er
         ow5Ds1J8JidwqC3DWPSo1m/Y8djhMVilZvxGz4oFJ2NR6rCO3hd7BGnWruQMrjZA4/TK
         TfXA==
X-Gm-Message-State: AOJu0Yz4UIJ69v0A7aXcn0ZovOq8FM5ebKe/WtbknQWneaIAwyMK+mCR
	NHCpKTUQz+aJfZMSknrFYXlZagrM50FYQ0p0glCSiN43Da7btPlevagOatCi4w==
X-Gm-Gg: ASbGncsMrjwBc4vNk8J3WSR6+Ks/+FXFROfQhDPX8VjiRBP1nCXeg2NfiEf49+TiJ1R
	G0j5tD6g50AQ1DqhucaHfLDZfu+2vCJSLyf5hMHr5rvgujWYHdHEggI+QWNiLZg9e0QVFqFW1Tj
	bhYdb05OwFX55b+s7QG/FfLuI2NWgPn9OeokMkjSKUKvmDWWYR5/Jk2HKU8slOHvjPmVPq4dHfu
	eQdKYN4feESntcgBHGDdrhaFu+w62uzzrtsywscNaJdHpRGEtKLwsaTcshpFZ/mxYT3OJafEQK6
	k85HjJ3pACyWSIb0I839lbM3/dLYOSNQTyA3O43Ff11NjCpDMyKF+aS5Yih3PjmNMcZX5w2A42k
	=
X-Google-Smtp-Source: AGHT+IGxmuAEdDLSG+pYIaZ/aSQ0QDG9jFlVYYuJxlcdDTadKQ44pyo3Y4vCOp1gCDL3yLA6OMuk1w==
X-Received: by 2002:a5d:5f55:0:b0:3a4:f52d:8b05 with SMTP id ffacd0b85a97d-3b4964df03fmr15441452f8f.35.1751971917318;
        Tue, 08 Jul 2025 03:51:57 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454cdc4671bsm10651005e9.3.2025.07.08.03.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 03:51:56 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] xmlsec1: fix build with gnutls or openssl PACKAGECONFIG not enabled
Date: Tue,  8 Jul 2025 12:51:54 +0200
Message-ID: <20250708105155.478279-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708105155.478279-1-martin.jansa@gmail.com>
References: <20250708105155.478279-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Jul 2025 10:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118308

From: Martin Jansa <martin.jansa@gmail.com>

the .pc files might not be installed based on the PACKAGECONFIG
value

fixes:
https://git.openembedded.org/meta-openembedded/commit/?id=cce20b5124e28ee55adf03fe062084f38d065580
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
index 0f4ae205b1..3e97bde86c 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
@@ -59,7 +59,7 @@ do_install:append() {
         ${libdir}/xmlsec1Conf.sh \
         ${libdir}/pkgconfig/xmlsec1-openssl.pc \
         ${libdir}/pkgconfig/xmlsec1-gnutls.pc; do
-        sed -i -e "s@${RECIPE_SYSROOT}@@g" ${D}$i
+        [ -f ${D}$i ] && sed -i -e "s@${RECIPE_SYSROOT}@@g" ${D}$i || true
     done
 }
 

