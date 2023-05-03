Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D034C7EE21
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 17:24:11 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.26202.1683134644158756162
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 10:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TKn04WEj;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f19ab994ccso56680795e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683134642; x=1685726642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHO65dUebySbJGGVKSP2ByuOSoq9b8tMZkMCE9rax1E=;
        b=TKn04WEjuYsDgLycuQfpOl2jwGTEz+ax43dZCKmIdmdlKkNIOuXOVCGqGTxBV5B93K
         lkYb/IIK9i+tK4PX4jHb5p4An/qcifIKPZhHb7HcrMUqoeU6PSLEQap/yCBzkEG6KroN
         T3e47sASUJjaxPKMJTjDacDBIZdfXYobC39UGZeLRz1MoWxXNSKQr5ER4Z73o9YPnjHy
         9DR8XEe7JOQo7OVznSOJai2IA9dI5qYqIWJ7vrhuAbua2jvwBRCzjnQptOG8kQcEfaMK
         g+GGVriljEnZgRqVvac710zePyX0xebW6qhbuQ94rgybP7wUZ7UPVm2NFurxaOSw08vr
         vMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134642; x=1685726642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHO65dUebySbJGGVKSP2ByuOSoq9b8tMZkMCE9rax1E=;
        b=BPSobvc4+WmZJ8kt7XDkGJ1UUo+pHLLjrOA6Pk2P+V3HQLLUORWHT6wzX+MdveouW4
         r7vlqU0FEr4fzHDFQg8rP29ipnu/EyWiMJMfV7mn4eZJma1AIqnhmGEMytQrxCsb9zMf
         uH0uP1F8tWJh2MJKBAoDamsO+i9OKsGqkNo7/x0RRPO0GvncTs11lAvrq4SWjNLeX6QM
         Gihn2MDpJSQ0NFKanPlbxA6OaBc7QdTBAqR6mmNPmbpCMYdYQXVGOwga2aXwBFexaOye
         nBiKaAx82V86uDVQxIrwCgYtv4KiUxOAUl5FfKzQIKZ1jJWPKlJaBkKp9Z3wZbVBt6jX
         8e9Q==
X-Gm-Message-State: AC+VfDynEa3IYc8oEhUJJ9GpA/sHMJa8FE3KrJA/2/L/qQFTrqgwT5Jm
	iakD98LWziqtOKHnWUEyqVG/jrbr9qk=
X-Google-Smtp-Source: ACHHUZ5H8DRpTLSi7rCIJlxd3GSGlR5b72v+KGkoOHQ4tVni96Ro49kmovgPKo9aOYyR/5yWvHVDUQ==
X-Received: by 2002:a05:600c:2285:b0:3f2:4f33:4897 with SMTP id 5-20020a05600c228500b003f24f334897mr15506699wmf.28.1683134642560;
        Wed, 03 May 2023 10:24:02 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f8-20020a5d4dc8000000b002f9e04459desm34277384wru.109.2023.05.03.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:24:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 4/7] appstream: fix build without gobject-introspection-data
Date: Wed,  3 May 2023 19:23:51 +0200
Message-Id: <20230503172354.1439352-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
References: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102294

* there is a meson option to disable introspection, it's just called 'gir'
  fix GIR_MESON_OPTION to resolve:
  http://errors.yoctoproject.org/Errors/Details/702780/
  Run-time dependency gobject-introspection-1.0 found: NO (tried pkgconfig)
  ../AppStream-0.16.1/meson.build:173:4: ERROR: Dependency "gobject-introspection-1.0" not found, tried pkgconfig

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/appstream/appstream_0.16.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/appstream/appstream_0.16.1.bb b/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
index 50d8cdb4c2..b8cecec41f 100644
--- a/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
+++ b/meta-oe/recipes-support/appstream/appstream_0.16.1.bb
@@ -21,7 +21,7 @@ DEPENDS = " \
 
 inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
 
-GIR_MESON_OPTION = ""
+GIR_MESON_OPTION = "gir"
 
 SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz"
 SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch"
-- 
2.40.1


