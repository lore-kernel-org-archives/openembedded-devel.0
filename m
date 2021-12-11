Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B7DC433F5
	for <webhook@archiver.kernel.org>; Sat, 11 Dec 2021 19:07:36 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web08.25503.1639249654976178254
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 11:07:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=vjXanTKT;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.178, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f178.google.com with SMTP id b19so16405589ljr.12
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Dec 2021 11:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HZZH3BNHsQoPJyn51AGywTY3VxZuyvnnStR7H6f8hus=;
        b=vjXanTKT3R3Zarmnqzj+FtBq5GS4wtbk7Fc9v8nllFKHQheVlDDreiCHoVzux/CrTc
         6XSUrSKnOvitLTlI6rYdnRMvrvwqPKgESBUkMDUFYN2kumBINSpsOIbTxxUo/jA7b683
         +t49sej6QyXxR3LfE1j4yFfaZra5RJsOQiVfMXY6Qu6hTN/BXByne6UuLXlNGqorobgd
         0Gvg51k9QrSyHdLCK8kVUrSXtS7AH+1OKUem5unVGZiGUtY6BQizoCYrF+MHO4HFTtAz
         6AqCWRdDG/8icNw1K/Y2Cthrisf2WF1dqUBtdKh1BEzrorMQTP4AV1UNjSkR9TAnZkG7
         B+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HZZH3BNHsQoPJyn51AGywTY3VxZuyvnnStR7H6f8hus=;
        b=grOMcLVO4aI0PGyBhEN1uauLqYWHX2y+GxMv0sCu7d5/p31Dz2EK0UoqNOEZUUKOsJ
         OA81Un+1XJ61fFgZSggRs9kHCRYgf3w+Q2GpwbP+7tm/28wvTWwESBl9FAoSxOmgGj2E
         vFrHeZRHfev661NoXEVPV8Gtlu3JtiZcE+a7l7wfr1HLHCURP5uT+1v4wdybL5sj/Ll1
         kuEW6uxBOQORNOFzQsyRkzy3Nheqo1/z9kcElG9eCAElznk7IFKxyTMAJP5TUT7P+F4f
         7ps0un+Fwt7KkxxnE0ChJoerrJm6Es9Kvl1gEKerYX+Okx8nTZ/Z0IWJJQKZelR/HUmV
         auQQ==
X-Gm-Message-State: AOAM532KJrJzBkq17RteStq8apZVqv428+Bv6887boNJcQoMkXR9Vmtg
	AQNfeEUm6Z3o3MwEfkbrgOCp57CD7tFDBRln
X-Google-Smtp-Source: 
 ABdhPJwOZTqkDbrqWxQ3k7vvJU7stc8cVq5iGeasxxfijJv5qBcgIGTh0kQteTjcq+9Cf7WgtJbWHQ==
X-Received: by 2002:a2e:5712:: with SMTP id
 l18mr18970975ljb.268.1639249652772;
        Sat, 11 Dec 2021 11:07:32 -0800 (PST)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 b5sm731919lff.278.2021.12.11.11.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:07:32 -0800 (PST)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-wtforms: update to 3.0.0
Date: Sat, 11 Dec 2021 20:07:29 +0100
Message-Id: <20211211190729.2552895-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Dec 2021 19:07:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94296

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-wtforms_2.3.3.bb => python3-wtforms_3.0.0.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-wtforms_2.3.3.bb => python3-wtforms_3.0.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb b/meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
rename to meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb
index 6a9e46440..b63be8203 100644
--- a/meta-python/recipes-devtools/python/python3-wtforms_2.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-wtforms_3.0.0.bb
@@ -4,13 +4,16 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=53dbfa56f61b90215a9f8f0d527c043d"
 
-SRC_URI[md5sum] = "2b6ea167a71c6becf20f0934417fd06c"
-SRC_URI[sha256sum] = "81195de0ac94fbc8368abbaf9197b88c4f3ffd6c2719b5bf5fc9da744f3d829c"
+SRC_URI[sha256sum] = "4abfbaa1d529a1d0ac927d44af8dbb9833afd910e56448a103f1893b0b176886"
 
 PYPI_PACKAGE = "WTForms"
 
 inherit pypi setuptools3
 
+DEPENDS += "\
+    ${PYTHON_PN}-pip-native \
+    "
+
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-netserver \
     ${PYTHON_PN}-numbers \
-- 
2.25.1


