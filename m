Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7098.1793601084130442478
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Nov 2026 22:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BxaAVwng;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6768403e9bbso2207684d50.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Nov 2026 22:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793601083; x=1794205883; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZSRDIPnpGHgQrx71r/AJJlTrL/fODy9jLkLh9cDOz1w=;
        b=BxaAVwngJi1EAbOkhH0Iesg0LSvbiAJiK02usFiNFbdv08ebTjMTkrtgN8dSOekLly
         xWx1dpdEkn60DHZ9k74ZUjIMYuZUhJmj2ynFBXct+8vQfXoLj4IJ1IIrhmXnAOiBab+P
         sSpK1l0UqWD5KTpttEtRvId+z92ZVeehAJEexiwZnII2Ahzjc2l5biOWThSXx7XxwDw4
         ctXwTN44YoOw9VRkDgNHSz9/yuT7tBgwl+4jD8eAT0zv7xefPKXc4p94sbLaRZe3cMtv
         mJaPWBBbflpp5C4KRD/VVshahVbfL8O0aC30JwiSzm8wwVCJNCBnnUMn58hIsV8HdVDr
         VIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793601083; x=1794205883;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZSRDIPnpGHgQrx71r/AJJlTrL/fODy9jLkLh9cDOz1w=;
        b=0/YztfJeS6LOiIPLb0SU83z65/HKRmCGISQ042PUsAAJjIzulGDjXVMFASRiB0U+I7
         OeGVcNrfJCfYiSs6Ap4CKlD7tLwXMZ+78tHQOYA/iPyBd/wdicvaVXjvhxwpsr/utliv
         PMseUxtw2M9N1X/IcTMnrlOb30aj7sSJujptfrQTlh7zwv2TwtQK5KalSzyZdoueqxJ1
         r8EnXciNuIxGQKXIkAwfOG3IfzKE7S55tSE8JI6HzyWFPdtSf72Xy8TUqkXKXotxVdL+
         fO1lYNLE3+uu0UWDup85qlpO72kNIthdIhh/PUs+Gb87wg3p7KJXGf2VWJN/d/06N7BO
         XJtw==
X-Gm-Message-State: APuU4Z/qVJI8NcINxpmV9mc8cuQSm1Ma50Fpyicvsjbfcl07EE9+GtQK
	CB4Y3hS8Xx/idbK3cywgXzvN7Svzqsx7taMTGofiG7xk48fqc3xkr+oAxOl3S0mN
X-Gm-Gg: AYBFou3TVwn0ztpRO48ahdD4Srz2yY24bxFWe3PtLBNwj0aGhwCATSoA/6rIPEW+jeY
	zdESQXfEN1pSMtKVEHQuwEgoC2Jwm1/OCwfA05DNxw+igAzFObefCCJlJprxtHGOrocouzikXOX
	DrhwsHLvdv4vLVGeO8Y6CwTjh55iAl6BprYumTAXALKWaNgqFDOGXQwJeYJUHmvJAJ4S235NWTp
	5miyFRm2ONGMN8aMfPQvy3mt6dmS5ojpBkN9hpiPO+s3X3RZ/GsCK1JAw3pIYT8FzdeZHSALnVY
	c0/fVjEHL02CCazCgQCXfsnIkoKK6ebNIEcwtnwZZIHTMSa53fnREOBsFmwDla6a947gGYtKyXI
	tl+pPmXbFEI19waa7yg7BAkytdJmYJtJzpF13rzJcXfFlLz5uwaSkAfADRSJLiWgomu8XABbc9V
	ZKqjk5cr3zXhdjmiyCnI9vaRcCEW01U0FOWcP3FADOfa55AX0gCxKOQdEvxVR0NaarL6dI9VO3K
	Mv3ZiPQtYkFdVp8aiXqndKvFrIlTrVNyZFIX6/0iO1duHpALTXciW/8mi7GRK44Yc+8pnKR53BO
	M2/JchPVdAxID71x6NqWqdCrVkG1s8y4yToa9DTEgW+dfLB9Wd7sKIPQzK3+BYQeXWQaehtXVXK
	Q1pbA/C+EGoStXw+O5lvq1MqwvjghJWAKB7CnkhFvbfrNdd7MRU195lBok5Nvf4pJzpyoXX3knQ
	==
X-Received: by 2002:a05:690e:43c6:b0:677:adc8:b1ea with SMTP id 956f58d0204a3-67ba5010450mr5130364d50.75.1793601082810;
        Sun, 01 Nov 2026 22:31:22 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf148ed8sm4576968d50.3.2026.11.01.22.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:31:22 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] cockpit: upgrade 366 -> 366.1
Date: Mon,  2 Nov 2026 01:31:04 -0500
Message-ID: <20261102063104.469354-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 06:31:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131738
Content-Type: text/plain; charset="utf-8"

This is a security release.

Fixes for CVE-2026-91147, CVE-2026-91149, CVE-2026-76235, CVE-2026-91148

Changelog: https://github.com/cockpit-project/cockpit/releases/tag/366.1

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../cockpit/{cockpit_366.bb => cockpit_366.1.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-webadmin/cockpit/{cockpit_366.bb => cockpit_366.1.bb} (98%)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
similarity index 98%
rename from meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb
rename to meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
index b8d12d5ea1..e12cabcd98 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_366.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_366.1.bb
@@ -9,7 +9,7 @@ SRC_URI += " \
     file://0001-Warn-not-error-if-xsltproc-is-not-found.patch \
     file://cockpit.pam \
     "
-SRC_URI[sha256sum] = "bf0a8c37eca303282a85777e049fce67fe2002743fabfb3e85f9de24855b099a"
+SRC_URI[sha256sum] = "514723bdac652ec1fb55d0288ae775799e784708f34a5db66b9d8984c4ac4735"
 
 UPSTREAM_CHECK_URI = "https://github.com/cockpit-project/cockpit/tags"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)*)"
-- 
2.43.0

