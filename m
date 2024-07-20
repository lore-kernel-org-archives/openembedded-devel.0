Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA01C3DA49
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 05:28:02 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.1210.1721453277211996337
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Jul 2024 22:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RkFK2F17;
 spf=pass (domain: mvista.com, ip: 209.85.128.182, mailfrom: sdoshi@mvista.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-654cf0a069eso26614417b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 19 Jul 2024 22:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1721453276; x=1722058076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsfgTYWgziqHF6gwRgC0uhEKcvyAVDkK8iTghkt0aZ0=;
        b=RkFK2F179NAjQbwpx4q5HMB1uu+pGN9+4jItG03+xCYSq6vJLevTzIO2+uEU0XlJDW
         TfaTAxPb/zobPWdWsQvWOBnSwyxbZr0mpPK+gx+8ELGu2swJoO62X75pZH2cfMcy0VIw
         0RHguRkmGfGsP5DXqx+w/IWvjUsJ3VdLdEWf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721453276; x=1722058076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsfgTYWgziqHF6gwRgC0uhEKcvyAVDkK8iTghkt0aZ0=;
        b=R2OLMSi8NxVvuOv8ntF/GnbOwz/Gp1ASNYK77bB3wR/LOSEE5mV7bb18LM+hKUlGBX
         Bwz0tqGRopp1ule8j3rGVeHXXUVZ3oblL2gcxRBNrLGfUllHr70Yg0jPoxmvqrE78VRj
         l1OFMuHUNKXb9CDOSBECc/xd9FzF6zJqXJRR4zzgVbRihKgxP2FYpCsQbdgEcUBWMxf8
         7ZdgWzVhGeXO9oMEIv6Ac7kY+oLqheCx3AJgHmNayNA6ax7OjE6C5bg2GjPIavdRSvuJ
         SZ3ulvdRLYUZRXcY5fxZuoRCxVaw94jS05OZjOAf4k7Ay2BoDmbK7pbxN8hrwiyq3pE9
         Dp+A==
X-Gm-Message-State: AOJu0YxP4xRjcYF8CE/VoRptdlmnMfxu15VF5Bvm5euKYKJHHl9ciK1g
	sq0Wu/a0OYDYqKu0TMD/l7bHPrgWT8CvHyt53Ebey5dxb8hh0lFuTurKGyHP9BbfYQgYRTp6xS0
	F
X-Google-Smtp-Source: AGHT+IGR2Z2adWVdqZMYbe1QCkE/yK/rLNYGdLzVtka7AL+1N3fqxp6DMCrpKQe6bDAUjKr2JjIvaw==
X-Received: by 2002:a05:690c:428a:b0:652:453a:bb1e with SMTP id 00721157ae682-66adae5d423mr4637547b3.41.1721453275625;
        Fri, 19 Jul 2024 22:27:55 -0700 (PDT)
Received: from siddharth-latitude-3420.mvista.com ([157.32.44.199])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-66951f72896sm8363417b3.17.2024.07.19.22.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 22:27:55 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-oe][master][scarthgap][kirkstone][PATCH] apache2: Upgrade 2.4.60 -> 2.4.62
Date: Sat, 20 Jul 2024 10:57:44 +0530
Message-Id: <20240720052744.58098-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Jul 2024 05:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111420

From: Siddharth Doshi <sdoshi@mvista.com>

CVE's Fixed by upgrade:
CVE-2024-39884 httpd: source code disclosure with handlers configured via AddType
CVE-2024-40725 httpd: source code disclosure with handlers configured via AddType

Other Changes between 2.4.60 -> 2.4.62
======================================
https://github.com/apache/httpd/blob/2.4.62/CHANGES

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../apache2/{apache2_2.4.60.bb => apache2_2.4.62.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.60.bb => apache2_2.4.62.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index ab19ff1dc..cefdf89d6 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.60.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "7b1ec7ec5635da7cb01550513215a90f8b2f52bb7c90cf3e97ede936d3e55b0f"
+SRC_URI[sha256sum] = "674188e7bf44ced82da8db522da946849e22080d73d16c93f7f4df89e25729ec"
 
 S = "${WORKDIR}/httpd-${PV}"
 
-- 
2.34.1


