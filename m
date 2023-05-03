Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4025AC7EE29
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 17:24:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.26201.1683134642865359545
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fCGgAiJX;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-2fddb442d47so5167125f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 10:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683134641; x=1685726641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdPgmCfy1GsYYrPPzT+kkKWReAwWItEV1BJf6fo+R0g=;
        b=fCGgAiJXweesbwrM/AOgIC7t27AHmRHzyliAYzPGGkzZrhL6YVgfLWLLiul78ZBKW/
         lo+pPsHgO+6TQIfDnhKN9LabWrQCoMehT4QfHn0Fo44w4U86jVBUxNr8/Iiyq4krwuBJ
         F6q1HaxymIWeGUZqMRvag8Lw0/+iyw4v+XJl590S9mx2yh5QcAzPCdB0/sMoUOpKR/yT
         ELnquKtq/odFbnMHD2/Ut2uHHh1bLuiPcZnp7SBsbtIO5TmXqQBKiFNXBH/oD0TrZ13/
         r8oxZCWqyUKRhTdrL9HS6TzSozEKqdEOxeL/eEjtJezshvp3A8H8fhmNHUqOwKv1LFph
         o4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134641; x=1685726641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YdPgmCfy1GsYYrPPzT+kkKWReAwWItEV1BJf6fo+R0g=;
        b=UelRt1Vt4nGM4+D4iKHX6nU+sWyRrfnf8ni4jGupvsnsXZCVPub+qxwx9leuYUjcTn
         /9NWk/9c2pReKs16tmiBqEulXduhTUXzx1+XsFojRSIyVbMUIcJGtNOuhN9iGls7vFDw
         cyXxfHEaIqjQx0UscrSAYHlsbDxyI2sUJkys9OuaFs+RmzPD2RxC01EDjcrPNy4nNt8h
         YG+PjfiPJ8dAEdDyhclTZhP2qggg0dNe283SC661IeWFbrgl27zVegZV0SgEH0gT3zvM
         QmT6GCYP1rsdWcMDHkZMKQKFjFH2v++vE1Jy+8ZJrp091oPV9lRj15S5NyQTYvydwEJn
         mLhA==
X-Gm-Message-State: AC+VfDy4bfBht5YpXlWGozVui5yd2kl2gepd4nITj/OwA+JD6BjCLDlp
	AfRmcYdEHGNLEI0OOUGsxB29XHhtYPw=
X-Google-Smtp-Source: ACHHUZ7DDSPkyMWvP63/JL3pk3+nEPr6C1ItNoEc9+A8NMi34H033YoU06CuG1yjjEoNvpLD1BFoyw==
X-Received: by 2002:a05:6000:1363:b0:306:2cf5:79dc with SMTP id q3-20020a056000136300b003062cf579dcmr615708wrz.35.1683134641112;
        Wed, 03 May 2023 10:24:01 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id k10-20020a5d428a000000b00306337e5464sm6496945wrq.44.2023.05.03.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:24:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/7] libxmlb: add missing dependency on glib-2.0 and xz
Date: Wed,  3 May 2023 19:23:49 +0200
Message-Id: <20230503172354.1439352-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
References: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102292

* without gobject-introspection-data in DISTRO_FEATURES it fails with:

  http://errors.yoctoproject.org/Errors/Details/702774/
  Run-time dependency gio-2.0 found: NO (tried pkgconfig)
  ../git/meson.build:119:0: ERROR: Dependency gio-2.0 not found, tried pkgconfig

  and http://errors.yoctoproject.org/Errors/Details/702777/
  Run-time dependency liblzma found: NO (tried pkgconfig)
  ../git/meson.build:121:0: ERROR: Dependency liblzma not found, tried pkgconfig

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
index 3366b7e7f9..61abd07fda 100644
--- a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.3.10.bb
@@ -8,6 +8,8 @@ SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
 SRCREV = "a6cac6a715d57c393bbddee4d0381ad943341af9"
 S = "${WORKDIR}/git"
 
+DEPENDS = "glib-2.0 xz"
+
 inherit gobject-introspection gtk-doc meson ptest-gnome lib_package
 
 PACKAGECONFIG ??= "\
-- 
2.40.1


