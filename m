Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31115C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 09:56:45 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.46749.1720000597241074572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Jul 2024 02:56:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZeokcZzx;
 spf=pass (domain: mvista.com, ip: 209.85.128.169, mailfrom: vanusuri@mvista.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-64f4c11d2c9so24270907b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 02:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1720000596; x=1720605396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2UJeTRNJJd8XAHtMk0DpDktcpYZZ90lz0F2EVI1mGHU=;
        b=ZeokcZzxAIyBzK7srXfGQIR0Ov7AUP24DzAFLTdwYmnnHouPRGD0EGRK3vlq62HzFQ
         rrOmwPUdlwIvwVRnPFWl3zvGZHYE2BlylzLE2UENasDBO8TGHVbVlIer8glkyK+txQR5
         xNVcbaHAlt2Y+cEoUbKjwjCq2C1bcOQ3duVx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000596; x=1720605396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2UJeTRNJJd8XAHtMk0DpDktcpYZZ90lz0F2EVI1mGHU=;
        b=OISDHymojph/bv3zOwSFstKTL6NZA/ffC/fa6B4Dc3fNpjKIbs5l+qPbqXqFxuvqWV
         6ezX/nGHNb5pK3BKiDH7D5aJEBucZqMTNsSXeO54S+lH0i/k16rrUwAKOepnSll+iu3w
         0IxHhKcXafgOKdGSY4IzHCcutg/ltv+9VhFBMOHxmyg6IXwvI3PHC24KaeT/Rs/bFXFC
         Tmzui8KevlVQjr/0OwWgJdvWPYXxArKkiJSP1GrNdZaCk/N64rU8ak5Ca6mVynO/B5vx
         3VYRgV6mWqDjllgHtncnIg64qIS7B/2umFKW9TthQen6W8VEqLjrUETrFvcECth+alA1
         Vsdw==
X-Gm-Message-State: AOJu0Yz7TJ9c08yQajwC/PzCLvdgw8OIggfD0jbl6IIFgka8YOTU1wzZ
	JwG+W65si1autPu5ikLN2no2iNviQzih2/sGZwMGKI41CxkogBBtZ5sKA3zeuumabdKrqRyUMex
	M/rU=
X-Google-Smtp-Source: AGHT+IGO97rt4WLQG4EDkhgW3EY4WH/66BbCrZPx0Hy2EwzZplhWbWvQFpsLmP+1igddl5C4+spKZQ==
X-Received: by 2002:a0d:e653:0:b0:644:ffb2:5b19 with SMTP id 00721157ae682-64c71145db7mr126766087b3.9.1720000595988;
        Wed, 03 Jul 2024 02:56:35 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:882f:8929:c1d0:1b5c:2e54:8781])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a99d65cf3sm20695057b3.23.2024.07.03.02.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 02:56:35 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-oe][master][scarthgap][PATCH] krb5: upgrade 1.21.2 -> 1.21.3
Date: Wed,  3 Jul 2024 15:26:25 +0530
Message-Id: <20240703095625.59795-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jul 2024 09:56:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111224

From: Vijay Anusuri <vanusuri@mvista.com>

CVEs Fixed
CVE-2024-37370, CVE-2024-37371

Release Notes:
https://web.mit.edu/kerberos/krb5-1.21/krb5-1.21.3.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../krb5/{krb5_1.21.2.bb => krb5_1.21.3.bb}                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/krb5/{krb5_1.21.2.bb => krb5_1.21.3.bb} (97%)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
similarity index 97%
rename from meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb
rename to meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
index ed12fee94..c482472ff 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.21.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.21.3.bb
@@ -14,7 +14,7 @@ DESCRIPTION = "Kerberos is a system for authenticating users and services on a n
 HOMEPAGE = "http://web.mit.edu/Kerberos/"
 SECTION = "console/network"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=32cb3a99207053d9f5c1ef177c4d6e34"
+LIC_FILES_CHKSUM = "file://${S}/../NOTICE;md5=71c06694263581762668e88b7b77a1a5"
 
 inherit autotools-brokensep binconfig perlnative systemd update-rc.d pkgconfig
 
@@ -30,7 +30,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
            file://krb5-admin-server.service \
 "
 
-SRC_URI[sha256sum] = "9560941a9d843c0243a71b17a7ac6fe31c7cebb5bce3983db79e52ae7e850491"
+SRC_URI[sha256sum] = "b7a4cd5ead67fb08b980b21abd150ff7217e85ea320c9ed0c6dadd304840ad35"
 
 CVE_PRODUCT = "kerberos"
 CVE_VERSION = "5-${PV}"
-- 
2.25.1


