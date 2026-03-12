Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE89106ACE2
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 19:25:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1064.1773343510227975626
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 12:25:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gcBDBTTc;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c56e822eso1407948f8f.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 12:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773343508; x=1773948308; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4W5zUfo/SYgo7wxNvCD2S6uOIbNQyBUUAwBeHnMHydM=;
        b=gcBDBTTcBOoGf+JXFFre036IqQJyVAkXw6pQ/cewqKskDfXnEGaDoBrhaFYQpQhymj
         /EclxERwLqdNxw1I1+wl7h4PLHQww93Fnz0jG2jKCN5RN4dAYB6zN61VsPDZnyKcZ8eW
         KMSOY1MuelMXQplHple6+hzUwqAF5TCii3PjymHRAdjjBaQV1G955oRo6W9CRo8R5yJs
         tuCcbP93wRsVqtGMX2sL6laoXc1+RXIrkS5GvW8N/Jhf4F1MB1xK0HWTJSYlAOzWDNeX
         /3x3SgpmZtcAA7cWQZhcaMNreYfqTDw/4hYSYAb3PzxiWDl2a5wnQaPETC/YJvKIsB+X
         +x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773343508; x=1773948308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4W5zUfo/SYgo7wxNvCD2S6uOIbNQyBUUAwBeHnMHydM=;
        b=BhmXHTmPri0eTu0fx+ckH+GyuGjcieds+9EzWU1m2U/+6e3pJn7OE8SGETKOOOv0lR
         EgsbuD5Qt8MzGxnzQhI3QdRjsm/8kKXvPN6hKz6vXuXHWrOPg2M/COIa/EdPv6kx3Cz+
         BWLZp4G/W79W2hkICceMrVgiym4mJxiFRamTP2+YphpbCrUjQY1c77tpD2ugn3A6cGqo
         vmvuMIQ5EnX8mT61XpD6wIKopME67KkpA6bwFAGC7A3rsdHsFNXxT2lHaqyu3RwRvD4Y
         3dFE4dfhCERjkoqyUKFi1apLZN7X9nTtk8wgK8210pCdYatS7gwUzHgzxBmhwc/PWXC4
         W7og==
X-Gm-Message-State: AOJu0YxZ3TtRh7rtExXzE1ZojLjSpMy6rrG+ZEABU010LtplV6uYIejn
	s96OzBRN6WoKjo0DQCkEMpEA0n6lYFaKMpXTpQESxzcZR9E94FUzAUc5VoYq/w==
X-Gm-Gg: ATEYQzziYnh9H4WjcoSE/cl+pQ4hPxNGAKoYPWDPNkSQP418utjmE55pYWBZuy9v9Q5
	PCZZQYeTnglxd9YmlthnxBJ0JtLt1ZOoBe56nsXjFCzMp/ZCiDx0SJLT9UtxNw8w0DobNnLZFzZ
	afOSxp4cowEIssIPFSxttDZD3K124kulldDHfD7A4HShmamEAaL5aoFQg9dtNNzTbh79Py56Nj4
	j2DOarpTqBHRS3gRGH9x87/kwAWYyn0H15lmnUiw9wHr8DDROpEIhwQ4UTKDDY37pgCnXFBB5TJ
	70exIc5842bK+4PnRb/ayPPiXPlwcJcaR2PAyjDMRenVMF5o0TJ4MiTChBrcq8jxtl0zXUbC+tQ
	ckJqDjecG31pxSuS7eoT0mdkxyfrt2sHXBWpDszZvNLW1chIysB7RvRnM3wdyYVFvpjrs6VKTi0
	iiJ2QdlcV9wqD5ryPra01n
X-Received: by 2002:a5d:5e01:0:b0:439:be67:a034 with SMTP id ffacd0b85a97d-43a04dc0c3fmr1576742f8f.47.1773343508343;
        Thu, 12 Mar 2026 12:25:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bd9csm10824780f8f.21.2026.03.12.12.25.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:25:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][whinlatter][PATCH] hiawatha: fix SRC_URI
Date: Thu, 12 Mar 2026 20:25:07 +0100
Message-ID: <20260312192507.2744535-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 19:25:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125174

The tarball was moved to a new folder on the source server.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
index 4e7e5fa31d..dfa99c3d90 100644
--- a/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
+++ b/meta-webserver/recipes-httpd/hiawatha/hiawatha_11.7.bb
@@ -6,7 +6,7 @@ DEPENDS = "libxml2 libxslt virtual/crypt"
 
 SECTION = "net"
 
-SRC_URI = "https://hiawatha.leisink.net/files/hiawatha-${PV}.tar.gz \
+SRC_URI = "https://hiawatha.leisink.net/files/download/hiawatha-11/hiawatha-${PV}.tar.gz \
            file://0001-Add-__attribute__-nonstring-to-remove-unterminated-s.patch;patchdir=mbedtls \
            file://0002-Replace-__attribute__-nonstring-with-macro-MBEDTLS_A.patch;patchdir=mbedtls \
            file://define-MBEDTLS_ATTRIBUTE_UNTERMINATED_STRING.patch;patchdir=mbedtls \

