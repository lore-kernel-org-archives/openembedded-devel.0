Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3268C3DA7D
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 17:09:42 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.18632.1672938579664149178
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Jan 2023 09:09:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MJVCs55Z;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id ay2-20020a05600c1e0200b003d22e3e796dso1859004wmb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gPqKffXQ1L1Xu/HLv/kLOKssImAGhQ929pZxz9znouc=;
        b=MJVCs55Zp95BRdMgecOAlC6MJfFIZ5/uW4BsrOhVD1rgYT0gIq3PMG9IqBzoHmK+al
         qOiuTz28utsTen4G/2u2aol+xneAh0JVp4GRYWZ5zXTcQPAFnWVa2nRh0whiZerD/3TV
         YaDRk9ZLvd0LB8a0asDhTPetKmQLJ6/sXldZcsQ/3pBLN5SJD4i4X7WrZHTvFEvPvphW
         D+Zs6Bbn4l2DYoIFiYjk4c2Hyll6vQtaF4qtDiZwfj/DlXgaeCMzE4OYWR40zjUrOtdw
         zdj1PhdGSiCzeGeKRNVWpF/kdlS9uzU1/48sR0SfA677zldKCJJRGKCKozB6Sz9h32a6
         MFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gPqKffXQ1L1Xu/HLv/kLOKssImAGhQ929pZxz9znouc=;
        b=uzdm/X6r5yttKQGns4bruYzTKfpek1uxgOP607OAmMhpVTrfcLTeEgFRulY4DI1T0H
         M0lJLrZWR8IDuaBtDaDalkpfsCP+hfgqUI+HhPyKf+M3uyZCmN4dc7GYUTqLyZqBRqA4
         4bfkjVaE/7B669gjSTM/+69/Rw5HmLudE6hEluqUVIa9WWjYhLGgGqUR1Ft+RuntOo0D
         Ovf0C8AY5g4f5TCAyZ9bR7IQwOeNWLy8p6/DDW/xQktSJSn0VBcoaY8pZdgQnCfclyn2
         c1JXTFLMaX9f7wNoxfflMxRmrSgYzM7wnzuDnk2VovxgWe5k03974xXnOuFQv9yD+hFG
         KEog==
X-Gm-Message-State: AFqh2kpT81c1BsRr3M7ckOzzAYVcGf2mG66+tQ3ONrlIOnUip2CYvNl9
	u3TSs5BO0QSO+tNzyaaBS0xgsEe1Y3s=
X-Google-Smtp-Source: AMrXdXuYZW4xgokLl1gg4ZB2TFZCKmxXYF2XGDew83DhLTG1Hlz4GBpzGstG9N4/5+FYzLTDYZptAw==
X-Received: by 2002:a7b:c3c6:0:b0:3d2:3376:6f37 with SMTP id t6-20020a7bc3c6000000b003d233766f37mr36319374wmj.10.1672938577739;
        Thu, 05 Jan 2023 09:09:37 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id e27-20020adf9bdb000000b00272c0767b4asm37090980wrc.109.2023.01.05.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:09:37 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH 1/2] usbguard: Remove pegtl from DEPENDS
Date: Thu,  5 Jan 2023 17:09:28 +0000
Message-Id: <20230105170929.12088-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 17:09:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100418

Using `DEPENDS = "pegtl"` with `--with-bundled-pegtl` doesn't make
sense, so drop the DEPENDS.

Also add github-releases checking for newer versions.

Drop redundant setting of `S` to the default.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb b/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
index 8df78ec81799..2e0934931de2 100644
--- a/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
+++ b/meta-oe/recipes-security/usbguard/usbguard_1.1.1.bb
@@ -16,11 +16,11 @@ SRC_URI = "https://github.com/USBGuard/usbguard/releases/download/${BPN}-${PV}/$
 
 SRC_URI[sha256sum] = "460ebfb4ffc5609739a202a3a1d9fda1c30de033b634845b8baa136352bfb432"
 
-inherit autotools-brokensep bash-completion pkgconfig systemd
+inherit autotools-brokensep bash-completion pkgconfig systemd github-releases
 
-DEPENDS = "glib-2.0-native libcap-ng libqb libxml2-native libxslt-native pegtl protobuf protobuf-native xmlto-native"
+DEPENDS = "glib-2.0-native libcap-ng libqb libxml2-native libxslt-native protobuf protobuf-native xmlto-native"
 
-S = "${WORKDIR}/${BPN}-${PV}"
+UPSTREAM_CHECK_REGEX = "releases/tag/usbguard-(?P<pver>\d+(\.\d+)+)"
 
 EXTRA_OECONF += "\
     --with-bundled-catch \
-- 
2.39.0


