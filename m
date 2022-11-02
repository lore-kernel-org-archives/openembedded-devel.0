Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E73C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 08:42:43 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.3911.1667378554071207752
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Nov 2022 01:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jervE42P;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: akuster808@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id f8so11261989qkg.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 01:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+cpsBVXgq5AmNNIWhc53W7KkYjAF60K3Lme/6GO554=;
        b=jervE42PwYAVfWAez9MIlE1/8gQRf5SGOba9yfj6cJy0A9+8W5K+MubQxBpomwCbgh
         ZstkVHKBb9A3YX7kTpuAeD9F61dOLbFi5m+uCpAeSldshtOxpS86KeAfucXf6867w5UB
         f9f2sw7hFOxn7Ju8npt7ZHM8GZzR+86Gh2BG00yt702cxSzkyj3FOe8iMra7p+y8iwfb
         GtC9nT0uTrXxMXVw2YQQXielf/BMLatVjzzqRn2F8/Ln2E6AIxD0jOHQZdVxmXAzpglg
         a52AoyrpxKSETbrqTXCQuhNT+SB3xeBQBahcxzZDXBpSia8kBQOrx8J2HX3umySdLGkc
         HHjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+cpsBVXgq5AmNNIWhc53W7KkYjAF60K3Lme/6GO554=;
        b=c51CerQougpWdrY2PmqoLU/nOHcG/iAib6WiPPxwS+fBskDb+4aPdRNKhgFiIxQHbn
         rJA6V85xxtnPcacfWk6sSTRg+Km6jV5LmQF34OUamnLt0icufVbFmROgcm0uMNyxV/ov
         Lz+Cbp+u0YMhVtQJe5DlTB0R85GGNeblt3aUcNIJVJfyxXeCOnBQWECurT53ij8RArxW
         LmzdDgoJSxTFzfWGkj58+2tgVsmY2XDNYR1MZaFyXp6yZpHKVSFlE81tR9YnEccAJ36G
         g7uKqz4N+fCMf9BgPER01db/Cmw+p2R8DyrcOYurgzBVDJnCEpV2rTNunaXupjPj71tZ
         CA8g==
X-Gm-Message-State: ACrzQf1wl0WVxvednuD64KFbPBbCxw0Ug0gGTImDe7WmwVblbG77WACB
	m3oSVlKZ76XNPK8tfJdHAYpRV6IyrBpFjQ==
X-Google-Smtp-Source: AMsMyM59MOrVTj9uvc59rprL+16Z0tXaLkOPgtwQAq3zf0AjuA3rmk9UpAIkReK6r7yBoJVE8erW3Q==
X-Received: by 2002:a37:5586:0:b0:6fa:39c4:2ca9 with SMTP id j128-20020a375586000000b006fa39c42ca9mr8397527qkb.247.1667378555055;
        Wed, 02 Nov 2022 01:42:35 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:8259:e903:8d8:7eb0])
        by smtp.gmail.com with ESMTPSA id t11-20020a05620a450b00b006fa2b1c3c1esm5631202qkp.58.2022.11.02.01.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:42:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Thoma <a.thoma@rational-online.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 4/5] Fix tigervnc crash due to missing xkbcomp rdepends
Date: Wed,  2 Nov 2022 04:42:26 -0400
Message-Id: <20221102084227.1210486-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102084227.1210486-1-akuster808@gmail.com>
References: <20221102084227.1210486-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 08:42:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99413

From: Alexander Thoma <a.thoma@rational-online.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 447de4d47ba2deba1af80201b91bb312f184fe0e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 5f404f2aa2..5cde7c9fb4 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.tigervnc.com/"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "x11/utils"
 DEPENDS = "xserver-xorg gnutls jpeg libxtst gettext-native fltk libpam"
-RDEPENDS:${PN} = "coreutils hicolor-icon-theme perl bash"
+RDEPENDS:${PN} = "coreutils hicolor-icon-theme perl bash xkbcomp"
 
 LIC_FILES_CHKSUM = "file://LICENCE.TXT;md5=75b02c2872421380bbd47781d2bd75d3"
 
-- 
2.25.1


