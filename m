Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F03BE6ADD1
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 00:03:59 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.38787.1732320232582384867
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Nov 2024 16:03:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HMDWyzsX;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e38938a55e7so2583368276.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 22 Nov 2024 16:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732320231; x=1732925031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vgjos1SZXRulIwqLqXOT6kpsYqHb8iUQq2Q6p9LS4Uc=;
        b=HMDWyzsX87yGgqhVwRPRnbQTa0nKXKAQCdTxfoT2qMEdtQTMMz0Jh/83WjZ7VLMNnK
         LcnXPBsu763/zQg52jhgKd37aZ/kpGwhJRiX73qYCaCyR4rqglE1rfQ4NPfZagk9ab58
         fYvdRnF30mmyrcujyFB7YAH936J7FGqppc07D6snvDsp6CRELREEX42AnqK9huNdve5x
         8c7t5+UgwpMfNpxhztPkew6ZzY1Wp23cPUwE00fjlO33FTP4v1TkLVZZzIn8liLPl46i
         /Ucd+AxJPNSAT+PkAnrMCeUXJnGOD92xeTBpzgzzkj2W2gXktnibGZpxlmlLnewRSvn4
         Z/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732320231; x=1732925031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vgjos1SZXRulIwqLqXOT6kpsYqHb8iUQq2Q6p9LS4Uc=;
        b=Y7Ok3Qr7Hj6mJh1lgzETz9R6iLGDozLc14VYc+Mkhfg6nn8Fl+QKNbKZRoFDiZWo5x
         b9gH4O/dL64BcbWhJqus6EyzI9DmQXnJCjecGf55gB8ixCN9EpmzuOAKsRpUFW9cj/6p
         B1EvOqmQAT4sAi+7wYPXdUk4/gV/TkcMWj7LtiABZaXgq4ftZ8WQa5C9jVf4hfeMCBzU
         VE9HJQ/VfaXa6uOoRGTCkEbbY4LbMYSKGJ4gs9Mez78uI4cBSyd7DUDcDFuXixlFHoVr
         YWkYYtR9WxMlzAkE1ZRj+u0X2jHOWG/XRwSIoR+qhFsl15u53n/Y162kuEJR3BXKSVh3
         WpIw==
X-Gm-Message-State: AOJu0Yy9ydTmhZ8KELOML6S/2MrkJBzOJYC+QYohGAZD39VwuTn6ZwRQ
	USJxTXM7BQULePk1JIpXG/d1wWrKdF4lJz2Gg0DtkgXzRQvtdTLMBBKLA7LN
X-Gm-Gg: ASbGncvvU3taxS9O359KCmugwS/i5GfhkWfQJohPwwbjo/ISFLTMs70I2nnuHvRtyNe
	uJgMIRYXGrPpdnOIADOluAOHX/1D5TbCdggML74OKNTkOqw7dkF2L2g6BDNdzDCig3oMUpBvkny
	THUCKnPBvt/sms17C5fytJl2rPizCu6YgAeaUAuAK3XPLItBSaGtsvadeX5a537T4lLUHSpPoA+
	tPQNTARR2ZXSDiDntCZG4O8/3klRITiT+0FjrTXsxFtCJ1+x7tKSd5H
X-Google-Smtp-Source: AGHT+IH6Pp5lZSAhwx65WNGhixkWZTjN3fBJAQa5QiVDtGW8edAKVM3kkLIuczapwTf3ifU3ne8Wbw==
X-Received: by 2002:a05:6902:140b:b0:e35:dede:fe02 with SMTP id 3f1490d57ef6-e38f8bf5ae0mr5426237276.44.1732320231076;
        Fri, 22 Nov 2024 16:03:51 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e38f6319e12sm888256276.38.2024.11.22.16.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 16:03:50 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 4/6] xfce4-session: Upgrade 4.18.3 -> 4.18.4
Date: Fri, 22 Nov 2024 19:02:28 -0500
Message-ID: <20241123000230.1479075-4-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241123000230.1479075-1-schonm@gmail.com>
References: <20241123000230.1479075-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 00:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114013

Changelog: https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.18.4

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-session_4.18.3.bb => xfce4-session_4.18.4.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.18.3.bb => xfce4-session_4.18.4.bb} (87%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.3.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.4.bb
similarity index 87%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.3.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.4.bb
index 8151c6e36..701582078 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.18.4.bb
@@ -8,7 +8,7 @@ DEPENDS = "libwnck3 libsm libxfce4ui virtual/libx11"
 inherit xfce update-alternatives features_check
 
 SRC_URI += "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] = "382f93e096ec6493098719cab8cc31b93ad9bb469c0715c0c5117d75fe7394ec"
+SRC_URI[sha256sum] = "9a9c5074c7338b881a5259d3b643619bf84901360c03478e1a697938ece06516"
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
@@ -25,6 +25,7 @@ FILES:${PN} += " \
     ${datadir}/xsessions \
     ${datadir}/themes/Default/balou/* \
     ${datadir}/polkit-1 \
+    ${datadir}/xdg-desktop-portal/xfce-portals.conf \
 "
 
 RDEPENDS:${PN} = " \
-- 
2.43.0


