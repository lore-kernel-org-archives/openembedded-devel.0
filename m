Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.13129.1589110147605111982
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2020 04:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iAMzezLc;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id l11so1321364wru.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2020 04:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=wbt4TzKr20ES/sdwCpugcaoO4gof7IbiDXONgh/ftys=;
        b=iAMzezLckxxnDQKiIlDAoLo0f53NG+IGMSEXMQYmQbZc/O6r5E9t9SzYSPVIW4yqrV
         SUH0kNe0OdB72k85lhc4gYX6GPIMWPVANIugqXbWS7uHEqQJ5Q6HfaKftUtkBwGtL0XB
         07ocCBGAQyKbdMS4OiUfCQoz393qhuql3vQ6NUa9onz4FAa8VMUohno6npsTRB/qew48
         qhGR9+TfxVr8Md1HUSW+XA5jGO+KvGzAIsE3bVvyZf3WOItkiBDXKd7fl5HBvN9k51+q
         y3XPfVzqOBeju55IZAkRFu5LavN6Qc/HuRt9sPwL+Gz33JUETnbYA7/TVrxBctwZzB3T
         qBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wbt4TzKr20ES/sdwCpugcaoO4gof7IbiDXONgh/ftys=;
        b=Qn0Kl4bV15/urZ2BNoN7E/hUSGSai0NqH7NGysSjj9hYD0Mtd2cgfizkddT6awP0cu
         9Q2rK5vZrL3u6ucF/M9zQjKnuYhJd/RTSMrmg1cXybPX1A5a4Zh8OGg2LTln7O1OLE/k
         pu9aBr+K6uEsVPmbF3WpJh/9gmXZBRBlxPOnPaky9iMt0UIJd82LxseQV4UugMYCwZ6V
         f8aTSarA4JPcSTNS63B7ANXvtTmMkI8zlbeOwP5wYWPeuSAjfeQR8e2Y0Pn9AQLOG0Qt
         oQ1whXa7Pb3oljBwkdqvp5OTFfs+YwhMyp27LidgvK/KYJ/e/uFRIaJuxLWTt2BXIfbt
         ORuQ==
X-Gm-Message-State: AGi0Pua0OvEQtqGXIwK4md9MxNTgdKZxreVHTyUtyv1PE1UiSQrnTNE2
	VrOCmhUqYSiBPFDlvAHQz10yc5Du
X-Google-Smtp-Source: APiQypL2nC+LMVLmOCyl6NoUPqwrqMnbXCWLCwWmLUi/mvJ3sigaYwu3MUuUZtb9HolhNWDso/XZsQ==
X-Received: by 2002:adf:f40a:: with SMTP id g10mr13914242wro.117.1589110145999;
        Sun, 10 May 2020 04:29:05 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F085F042F904D54ECAC10E7.dip0.t-ipconnect.de. [2003:f0:7f08:5f04:2f90:4d54:ecac:10e7])
        by smtp.gmail.com with ESMTPSA id k5sm11733319wrx.16.2020.05.10.04.29.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2020 04:29:05 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] qpdf: upgrade 9.1.0 -> 10.0.1
Date: Sun, 10 May 2020 13:28:50 +0200
Message-Id: <20200510112851.31218-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200510112851.31218-1-schnitzeltony@gmail.com>
References: <20200510112851.31218-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-printing/qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-printing/qpdf/{qpdf_9.1.0.bb => qpdf_10.0.1.bb} (85%)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
similarity index 85%
rename from meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb
rename to meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
index 44a5fea84..f04e437d3 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_9.1.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_10.0.1.bb
@@ -7,8 +7,8 @@ DEPENDS = "libpcre zlib libjpeg-turbo"
 SRC_URI = "${SOURCEFORGE_MIRROR}/qpdf/qpdf-${PV}.tar.gz"
 
 LIC_FILES_CHKSUM = "file://Artistic-2.0;md5=7806296b9fae874361e6fb10072b7ee3"
-SRC_URI[md5sum] = "090d03ab179c281233f8240ade179d54"
-SRC_URI[sha256sum] = "3abbbb7907f2e750336b9c97e67b6e806aca91ab537402ec080656d63940ed79"
+SRC_URI[md5sum] = "eb7fb7c6cd5d3036bf4f7a5e3f44d995"
+SRC_URI[sha256sum] = "5d2277c738188b7f4e3f01a6db7f2937ed6df54671f1fba834cd3d7ff865827b"
 
 inherit autotools-brokensep gettext
 
-- 
2.21.1

