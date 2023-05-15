Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECA2C77B75
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 11:36:32 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.85911.1684150589471698252
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 04:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=BflDdO9D;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30626f4d74aso8211978f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684150588; x=1686742588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SozDs2nldn8ncxMRIVYzwN2vI3cIOL6jouGFTTfsEKE=;
        b=BflDdO9DY7qupvpnedIjJGQSqlQ+eEWRCoBZtNgSYW0Z6ib542QVAallvgua35Q4BF
         IkcRkDTY9bO+8naGH+Jb9EdoxJfAE4tmK+6YfuJaiHc2TH9wzUfNkWQ10DAlUpWgGC2a
         n01Jd+R8e/jJ24RGT8pLbqaK5Lz95iBYpnaddPCxrb2Xs6JFjtuLk8Q+P7LyaWwPwo1L
         JLSqW4FEL8zFZrP7PCNbx6xNVn3odFsqtscwVhl6VfVNWlG/0PIE+vCN2Pep3+DKMs23
         Gq13WU3xpPmmeLmsnSDdZpGnTkA00t5n2D8VgXYILvJUwiRm4QmRsCS3Q9LvN5PfVJIH
         oNug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684150588; x=1686742588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SozDs2nldn8ncxMRIVYzwN2vI3cIOL6jouGFTTfsEKE=;
        b=Fzk6mkg5XRiozsQTN2GV8muBkYVQRodL56fPdfAEerZfLGV/l+xFQa8kzPVDGrfysq
         7YKLCbQnRyWf3MwxXJZbTH+2hKOLD9w+UOg/Z8tGIeoTOZvXeJWCqXsfRItG67Y1VzB/
         Xt5aKEQffKry4/woreMQfgZ9TG4q21voYyUy/w2QAL17n/euZH3B2H0lltGvHmWR0VKN
         wv7/4MHA0nuAbqtgsFYJ6nvfBo3NDIbw3rNQrJrNdTI0pAF6/wfx1w8GgrYJ9Eme020/
         kYfV32gDkaTXWVYXCJpj7zi6wsD1Yl1aTQZ0iCrZrz/28dAa3MiNn03losql8c+ECgqr
         A/Fg==
X-Gm-Message-State: AC+VfDyqxYm23DTmy2/y5oJIw7UMLMRGNFoHdbADvnfKNDwu5DBm384j
	4KyFP12HK6EResoiIKBJRgzQuSWT9i8=
X-Google-Smtp-Source: ACHHUZ6DANYxRPkXRokIfDWT0jlkGqGL74JBPOxXsYSv1QbomhHHSUGkfjudCBeahAXRwJiyaMMcdw==
X-Received: by 2002:adf:facc:0:b0:306:30e8:eb34 with SMTP id a12-20020adffacc000000b0030630e8eb34mr25406713wrs.48.1684150587502;
        Mon, 15 May 2023 04:36:27 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d558e000000b003079f2c2de7sm20725139wrv.112.2023.05.15.04.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 04:36:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/4] libpeas: add gobject-introspection-data to REQUIRED_DISTRO_FEATURES
Date: Mon, 15 May 2023 13:36:18 +0200
Message-Id: <20230515113620.42510-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515113620.42510-1-Martin.Jansa@gmail.com>
References: <20230515113620.42510-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 May 2023 11:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102600

* do_configure fails without it:
  http://errors.yoctoproject.org/Errors/Details/704193/

* there is "introspection" meson option, but the search
  for gobject-introspection-1.0 doesn't respect it (nor use "required: false")

  introspection_dep = dependency('gobject-introspection-1.0', version: introspection_req)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
index 1282e93634..f5b088240f 100644
--- a/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
+++ b/meta-oe/recipes-gnome/libpeas/libpeas_1.36.0.bb
@@ -11,6 +11,7 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gobject-introspection gtk-doc gtk-icon-cache features_check
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
 SRC_URI[archive.sha256sum] = "297cb9c2cccd8e8617623d1a3e8415b4530b8e5a893e3527bbfd1edd13237b4c"
 
-- 
2.40.1


