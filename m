Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33847C25B6E
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 09:14:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.3050.1698398052211470260
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 02:14:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OPdAlfbZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-32d849cc152so1269141f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 02:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698398050; x=1699002850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q90M4/fMfyX9O12p7FzaHhZiccycvRAyoXWKqs2hU8=;
        b=OPdAlfbZ1eLizJOfB7fDylRkvIdy/+Dm2i0TEFNvWVs/CGgf5Dt4PT5XxuwHt53zdi
         gS1cMrpnUW203TX2/wcLMyyB5QPSKYFj1OP0Htq1sTUKU13f/FQku2B6FLw2coCnbht+
         yPbB8PWa0nINPX+iEJQL/T8tbApBdaIlJYKU434IFkA6z3DdJdoeOuBsGBbHl0I2nL7D
         sghFyUxFZyohzcGTl322/zGY2HQUtXT5m+Dohm9zcmJk2WY9ar3FNgu91zNo/jsa48OI
         1ddJIowk37xJzkgMhyO8nUV/j51eXKJzjNON4ZjRCSOX5JHbf9FyjYTShJ4cteL4gq37
         rrVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698398050; x=1699002850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Q90M4/fMfyX9O12p7FzaHhZiccycvRAyoXWKqs2hU8=;
        b=JmgQdYeVifgBo6mP20HuUhVcX3aHYGNUOkKz+Ys7bRcPACv6S5VTsYgAErLjTongEe
         A2FoDLB6UjDQjFqd7NeTBBcNrPGUJXIwsK616cNrHhfpiKrINwid8uCwIhq373QI/VF8
         XZRJM69Es8gFRkAQ7oX+sBLN+6+V4t0FiZaisCsLbTpFpVmBXtA51OEYbhTI8ERJp2wJ
         s1bSkDRk7DUKGxbCI65w44Fu/tj6UXeHNMW0Eb5DG3hxrbzXrOxBwR571qiZ+pUbWG4n
         u3RR85cwbLlkQT7V53Ij2J3xpOn1bYtPL3lftlzQyRbvMzmDwNTUtSy4Ty+uNOe5dEb+
         VydA==
X-Gm-Message-State: AOJu0YxeJCEuSAGNiX/ApJy4pke85x9EzrcAa94VRO8LuL/Ff0VMNIij
	aFThWLmH5W14IIy0pHFKN/pXHeMHx3E19A==
X-Google-Smtp-Source: AGHT+IF4CtFzetwkhQ7fJl3rptUiOrSx0QRIgtMlOL+9h2jQ40iITclY/yXN17noHoyIYagdFLPDkA==
X-Received: by 2002:a5d:4110:0:b0:32d:9b3d:d61 with SMTP id l16-20020a5d4110000000b0032d9b3d0d61mr1471378wrp.10.1698398050160;
        Fri, 27 Oct 2023 02:14:10 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d6185000000b0032da40fd7bdsm1332855wru.24.2023.10.27.02.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 02:14:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH 3/4] ostree: add ed25519-openssl
Date: Fri, 27 Oct 2023 10:13:52 +0100
Message-ID: <20231027091353.1700511-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027091353.1700511-1-jose.quaresma@foundries.io>
References: <20231027091353.1700511-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 09:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105773

Upstream reference:
https://github.com/ostreedev/ostree/commit/7b85adfbbd97054e4b14ca4365c11fbadf97c70c

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 meta-oe/recipes-extended/ostree/ostree_2023.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.6.bb b/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
index 264440d23..e1172a579 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
@@ -73,6 +73,7 @@ PACKAGECONFIG[builtin-grub2-mkconfig] = "--with-builtin-grub2-mkconfig, --withou
 PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
 PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
 PACKAGECONFIG[ed25519-libsodium] = "--with-ed25519-libsodium, --without-ed25519-libsodium, libsodium"
+PACKAGECONFIG[ed25519-openssl] = "--with-openssl, --without-openssl, openssl"
 PACKAGECONFIG[gjs] = "ac_cv_path_GJS=${bindir}/gjs"
 PACKAGECONFIG[glib] = "--with-crypto=glib, , , , , gnutls openssl"
 PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls, , , glib openssl"
-- 
2.42.0


