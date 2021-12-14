Return-Path: <hughsient@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 452EDC433F5
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 14:41:39 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.26502.1639492898376566965
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 06:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=doZJzoWs;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: hughsient@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id q3so32743776wru.5
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 06:41:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Glkz4IAut3ePNEaWUYp0NSrUi0j7P0iJTfCNjwpWlw8=;
        b=doZJzoWsFolTqUPv3WtNJ68DaGy8Wz1vk29BzSrexX4/V5OgHTDqHl9LQxv1t9tACX
         7U9NQosiFx6V1XAavPmJHroNWxAK7JeUhDmCjQ1kC2X9MFffJGfFeg7pQ+2rMYAKAwJF
         m2j1u7N+t0mgEGScWMDNaYLUSArkCh+IIwGqe/AQRFMfBqnAAbLBYw/ZMDg0QMMfhsy1
         OmYgIFqk/mBrRj9SPrHOBwNbWC9opOsssJ1wXh33Vmyk6vI3p3oQ42JgJi0eqVLGMd1W
         V3YwmIaUETQP28SWloO0Gpqf/kTYu0/tp6syyBHWcV32gkU/10e3JQsQHtBpys723+Au
         ouhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Glkz4IAut3ePNEaWUYp0NSrUi0j7P0iJTfCNjwpWlw8=;
        b=vp5PlJgEbgzaL9QHTr/2e8oF7PfB13nDCOp9PwdgHaz4oFXyUDCu2zABUBbuMNhgPc
         BYdR49obg2yOqz0fEoigG3CoNws+g/0btexjIsmMIteyRKnHvWflRjYke668H53oKfu+
         C+jypali4MInVlJpTLlF3/+X5rTuKSyt3roWukz+Bzxoho/W7zSFjwyeVhxOM9fYlns1
         YjG2WeFpWC25GY78FLT3MDhg2vUaHR2+wblqsA/iJDI9YIc5Kd7eX4z57mrykD3VL1M2
         hhNVXLleExnXUH3eUBHVswjCLepm0Kwubm7m4O/wW76FGb78ZUBrF4iKeahQbPJE+EYC
         whfQ==
X-Gm-Message-State: AOAM5311ev6QduL4mBYSfDbZE3ZHbw8b1oB3DPgzP7Lao7DAjNHpqDHb
	LX8SIwA4K843BuSFuCTIR31cGvuyubw=
X-Google-Smtp-Source: 
 ABdhPJyWukqUXoqZ/TqTdfeIT41twI3N9ZsUn/+Be4A41IalXNMbuzmh2UAB3rBzRxGBmDOIIA8dFA==
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr6311510wrs.263.1639492896502;
        Tue, 14 Dec 2021 06:41:36 -0800 (PST)
Received: from fedora.Hitronhub.home ([62.31.71.236])
        by smtp.gmail.com with ESMTPSA id
 f19sm2831657wmq.34.2021.12.14.06.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 06:41:36 -0800 (PST)
From: Richard Hughes <hughsient@gmail.com>
X-Google-Original-From: Richard Hughes <richard@hughsie.com>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Hughes <richard@hughsie.com>
Subject: [PATCH 2/4] libxmlb: Update to 0.3.6
Date: Tue, 14 Dec 2021 14:41:04 +0000
Message-Id: <20211214144106.2492080-2-richard@hughsie.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214144106.2492080-1-richard@hughsie.com>
References: <20211214144106.2492080-1-richard@hughsie.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 14:41:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94356

Bugfixes:
 - Ensure _IS_TOKENIZED is set if tokens are added manually
 - Ensure we never add too many tokens to the silo

Signed-off-by: Richard Hughes <richard@hughsie.com>
---
 .../libxmlb/{libxmlb_0.3.3.bb => libxmlb_0.3.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-gnome/libxmlb/{libxmlb_0.3.3.bb => libxmlb_0.3.6.bb} (91%)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.6.bb
similarity index 91%
rename from meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb
rename to meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.6.bb
index 9b3a343b8..585c49019 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.3.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.6.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
 SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
            file://run-ptest \
            "
-SRCREV = "5108556a17bb1c2863c2ca5df088143ea65474a3"
+SRCREV = "89276ffa4407a8d684e95675990fa864793a7586"
 S = "${WORKDIR}/git"
 
 inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
-- 
2.33.1


