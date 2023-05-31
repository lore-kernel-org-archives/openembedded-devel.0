Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40A32C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.9106.1685521519209150550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=nUcq/24h;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.167.52, mailfrom: brgl@bgdev.pl)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-4f3b4ed6fdeso5927128e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521517; x=1688113517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbVS99cxoKF1kxRsDgKR8fmubnIcytgvawzZpQuJhI8=;
        b=nUcq/24h4DOzgXQKGl0YWys4n8HKQgdQnhKIOHJLhwTM6A9BPd9RBHsgW1ZKn/XG7/
         YzSudcFCogmDALmPk82JHstwl8y+XyracafHTVtvc3/Wou55hpRkEa3EcIK8E+PYvDDZ
         /E7ytoYfus8T741urSoHFXb1E6JSIiVP+I1mkp+lZ4tw6Xmkn8fRmOn6et/bhNypxt42
         XFgw8pknqc59sgrWoD0qPpF+mQI1jfvA8vQREYOHpix+R/dN7nSJjQjzVo45hAfLk5eh
         hPORSfMrzho9RjA56B7L3qpcc/NGcDIwE6/v9y10KKnkzptNy9DXDZPt1UZ+x2y1Igvx
         0n9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521517; x=1688113517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbVS99cxoKF1kxRsDgKR8fmubnIcytgvawzZpQuJhI8=;
        b=QDdzY85EZaq1cN0+94gC0dZPhGvN3n73jg0XMav0vnwdXmDShvw0TbljE7F6WYZQdy
         7mAtrn5ogx8fIIGbIVoHf03XdxOL7GMOwOkE1zcCxIFS9P9WE3hzjZpvIW+VslxSkM2D
         hNWJhUsPGbxwMdmbg4MTet/tflwYazRZBLw/X2DhlGLqqseVj1KkzczL69AIV931gLWl
         Jmx+2jsLTeFtQVQ09ZCFMFATeCP5WU4p/5XPwBWcaTV6Xt7IDYiF35zuFNUD+Fx579/s
         /QBhnpX0FKXy3kU2ToiKU7ipEHCF9W9+JeOGv6B1PksaVHml6kw3EXhTBBbe89uMTNit
         Ca0Q==
X-Gm-Message-State: AC+VfDwupSG7Q6wYiGBGs+83QJ7F2ijFb3gGmLnWNOo/1FgYlRyiUHrj
	DaQH9dgqWlO6Az7ufqMrY0a1Ug==
X-Google-Smtp-Source: ACHHUZ55+bvcO5Ueu8VLvTlXR4Q7fLDbICkXAjoU1SsTUGhXkpZl54Befd1I+txsuWxHq+Yr7Fflww==
X-Received: by 2002:ac2:43d9:0:b0:4f3:b520:e0af with SMTP id u25-20020ac243d9000000b004f3b520e0afmr2369906lfl.13.1685521517359;
        Wed, 31 May 2023 01:25:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 010/149] python3-ldap: don't use PYTHON_PN
Date: Wed, 31 May 2023 10:22:18 +0200
Message-Id: <20230531082437.10646-11-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102937

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We no longer support python2. Drop PYTHON_PN and use python3 explicitly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 .../recipes-networking/python/python3-ldap_3.4.3.bb       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
index f2c0d2ee1..2091f63a9 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
@@ -22,8 +22,8 @@ do_configure:prepend() {
 }
 
 RDEPENDS:${PN} = " \
-    ${PYTHON_PN}-pprint \
-    ${PYTHON_PN}-threading \
-    ${PYTHON_PN}-pyasn1 \
-    ${PYTHON_PN}-pyasn1-modules \
+    python3-pprint \
+    python3-pyasn1 \
+    python3-pyasn1-modules \
+    python3-threading \
 "
-- 
2.39.2


