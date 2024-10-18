Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F23D3E1BD
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:48:42 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.29962.1729278807733048111
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:13:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IUdhh8B0;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e34339d41bso22712437b3.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 12:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278807; x=1729883607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkeHrWkQjumu+xEz3gDB/Usy0W5H0TVvfrTC2lGoVvY=;
        b=IUdhh8B065+bAt2PY1FOXLZUulZP5xS6+2GrJCqmirjFmWMD5vESafbVHgbOxxiWVt
         dnmXYEOSbtf/jghRK6fCiWZRV3fQzqh9zaIH3GPnDvfKw7bU88KM/xLLz9p1vJs2OD6r
         TPqwb2aNOj1QQvquqHBp1GhQjQKSDz2SlrfRBktDtGEfMoFr488bdf/zsk3676YGsfrD
         t7UvtX/iYyVN4R1hmx22+4kz108wdbdvhDcXHDqFqYi6+oV7a07lUZA8xTYcRcXQk4xL
         W5mkd7s+e/a75NRXdL/0jKEV2Grsu0ROnAa0xhOzG+iRLWRznyvhDnVF2QIn6HJ2Czo/
         qFCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278807; x=1729883607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkeHrWkQjumu+xEz3gDB/Usy0W5H0TVvfrTC2lGoVvY=;
        b=EF6TXfTNobclaenzEyybwWcR9WPgiWx+GH5tAvfxDVRwiOkg583pBweHVmR2wKHzHy
         EfBvV/KZGyCsq7fUuJfIFyDrHJKQmNVCbF5oxf8NV3fzTBq1fDgzTPAqB6hrequgYrdW
         R52P7Gu5CXKhWIRcKEMSVTmuK4a6sP6n+sJqeiKS+NHZvO+8d9URVt7YK2XZ+U18P0lF
         AgPaWwIsGgkMAL5gMu9sB0pSMnBMp3JS51Xyf7gY6WieVOPo8GJH8m+7fTjDpo0WJpGT
         8Fk2viyXRZbQIr4fD9fZTe1gfaeI9WbHNvsA8yzhqRvaaOidKF5Z+uEq215ez+huFBCt
         cZUQ==
X-Gm-Message-State: AOJu0YwjxCtaFBj9hrUcqyr4D7J97jjsjTW0gatIKzyRHQL5BtMxLSsR
	0bDLBZ6QPY+TlZt5emTqzqAkcbamuyLWRVW4n70vYnZIGbqQh4OVPg7elg==
X-Google-Smtp-Source: AGHT+IHuDQw+rpFtOogjbbcp8IGFJU5Gx8SvWTJlu2Zu2INtNSjWm8yDvOqVhNnJBY5pJcCBdCAzlw==
X-Received: by 2002:a05:690c:4d04:b0:6e3:1837:4860 with SMTP id 00721157ae682-6e5bfc22a98mr37966017b3.13.1729278806251;
        Fri, 18 Oct 2024 12:13:26 -0700 (PDT)
Received: from localhost.localdomain ([67.7.85.114])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e5c00df1d2sm4280517b3.31.2024.10.18.12.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:13:26 -0700 (PDT)
From: "J. S." <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-python][PATCH 24/68] python3-flask-uploads: Drop unnecessary SRC_URI md5sum
Date: Fri, 18 Oct 2024 15:06:11 -0400
Message-ID: <20241018191101.25184-25-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241018191101.25184-1-schonm@gmail.com>
References: <20241018191101.25184-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 18 Oct 2024 19:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113011

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/python/python3-flask-uploads_0.2.1.bb       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
index 9ac321dec..a51ead3c8 100644
--- a/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-flask-uploads_0.2.1.bb
@@ -2,7 +2,6 @@ DESCRIPTION = "Flexible and efficient upload handling for Flask"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b712ac634b39469660c9bdfb8d03421c"
 
-SRC_URI[md5sum] = "e5eee34aa92b64a4d22847672b3858a1"
 SRC_URI[sha256sum] = "53ecbd6033667d50ae02b63adebbaa33c7fc56c09e5293025810cf9d841ecb02"
 
 PYPI_PACKAGE = "Flask-Uploads"
-- 
2.43.0


