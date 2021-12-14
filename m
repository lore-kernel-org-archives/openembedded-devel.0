Return-Path: <hughsient@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3400CC433EF
	for <webhook@archiver.kernel.org>; Tue, 14 Dec 2021 14:41:41 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.26503.1639492900176267635
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 06:41:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UD8yCe9v;
 spf=pass (domain: gmail.com, ip: 209.85.221.41,
 mailfrom: hughsient@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id j9so629974wrc.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Dec 2021 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1J+gRCD6KaMRyICgCSgmnmaYtbmVtGzR1kQ1Iduy5kI=;
        b=UD8yCe9vokLu0qsEkfj0KdwUw5s9FYf8yFE8ZOSTcZR465t80gAVUZLJPZMHdiDoI8
         mOpmCxEtHnXWfyBJMlT4NdE/6khrmFDcBy14Ss7GqQT4nTKv5wBtQEjGNjqCPWzG+WVs
         SCvAfomrDKQU4Rt9zISPyji95N3sNTKJr8YJoWqSxhFF9Ew+FnwKMYqvSBKDDrkzuRPT
         bGugU++ItRZA8aT3ElaoTuFkDoK0hnyG24DsYQrVQReaupCOwley4ncA1HozW7wndYV5
         v+hfZaPndWHBAsSyJu/En+nuQ93Hb3KSLHknj8TtljI8ygjlhUGWrZ6NW5Gs728lWAGD
         BiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1J+gRCD6KaMRyICgCSgmnmaYtbmVtGzR1kQ1Iduy5kI=;
        b=KYFTLWZO3Jjxq0giz4WcoIorArbvsNETS2MMDAGoj+ghUpJZgs9/UwV4J5bcdThXtd
         k02xjm4nayrty2EMO7plkQX6F85mVIServ6jRBRK3oWIRzREizssSlzWymQphrGF83qu
         TJUs7aD+fEByAR2lH1+aMWo0haGcSBOJTbxwnnNkZoENbV9MEyi9z8QvKrJTCtPolnIK
         RYgPPJH4NuMtnMN1nyGHkLhcG/+sO2QOHXIGeTlqmN8mdJlpC/Fgq8JuDakVSyNw72dA
         Rr9Aui8rAp4ZodpzyyZ+tPxSPk4ZGuBOIa/aE9/2vlcGuTKLPVlZJcmsiAo0QzkMx5af
         JOKw==
X-Gm-Message-State: AOAM53209sRpv7U7RVniRwJKlc6ZvF5sCgCQ1EWC1IX1939KyWG2OgxZ
	lsDK0xl4OAGNfMIMwUZncT9CFe9mREw=
X-Google-Smtp-Source: 
 ABdhPJyiU79vg7lJ/3gO4J/N5udfbaIRSFH96o/yxJ2V+YwwugbByVY/bifmomiDFa/vNbSmsz7ITg==
X-Received: by 2002:adf:f7d2:: with SMTP id a18mr6159887wrq.354.1639492898590;
        Tue, 14 Dec 2021 06:41:38 -0800 (PST)
Received: from fedora.Hitronhub.home ([62.31.71.236])
        by smtp.gmail.com with ESMTPSA id
 f19sm2831657wmq.34.2021.12.14.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 06:41:38 -0800 (PST)
From: Richard Hughes <hughsient@gmail.com>
X-Google-Original-From: Richard Hughes <richard@hughsie.com>
To: openembedded-devel@lists.openembedded.org
Cc: Richard Hughes <richard@hughsie.com>
Subject: [PATCH 3/4] libgusb: Update to 0.3.9
Date: Tue, 14 Dec 2021 14:41:05 +0000
Message-Id: <20211214144106.2492080-3-richard@hughsie.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214144106.2492080-1-richard@hughsie.com>
References: <20211214144106.2492080-1-richard@hughsie.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Dec 2021 14:41:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94357

Bugfixes:
 - Fix hotplug after threaded device removal

Also, inherit lib_package so the binary isn't installed by default.

Signed-off-by: Richard Hughes <richard@hughsie.com>
---
 .../libgusb/{libgusb_0.3.8.bb => libgusb_0.3.9.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libgusb/{libgusb_0.3.8.bb => libgusb_0.3.9.bb} (77%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb
similarity index 77%
rename from meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb
index 51e734904..dad5b8a23 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_0.3.8.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.9.bb
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "glib-2.0 libusb"
 
-inherit meson gobject-introspection gtk-doc gettext vala
+inherit meson gobject-introspection gtk-doc gettext vala lib_package
 
 PACKAGECONFIG ??= "${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'vapi', '', d)}"
 PACKAGECONFIG[vapi] = "-Dvapi=true,-Dvapi=false"
 
 SRC_URI = "git://github.com/hughsie/libgusb.git;branch=main;protocol=https"
-SRCREV = "db9edbd8b45662d551194a0985173732f8f557a5"
+SRCREV = "582f33178a986e74543de8ced087865009f8fef0"
 S = "${WORKDIR}/git"
-- 
2.33.1


