Return-Path: <david.bagonyi@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93B70C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 10:31:04 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web12.22025.1664965858192767591
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=by66zvwN;
 spf=pass (domain: gmail.com, ip: 209.85.128.54,
 mailfrom: david.bagonyi@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id
 ay7-20020a05600c1e0700b003b49861bf48so1828043wmb.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Oct 2022 03:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDoxQcowySb5yxSAVbpagx3GgyNxVMokliUTxl1T+n4=;
        b=by66zvwNC47073Hv7d3QoCoLj84TvOtDJGUFogqNBS6VTKZBLovYhsu+YBMgsuziCI
         CjGxpTw5s+/igmr8Xp/b/24JP4OubjInVeSeX6hjv8fRbJ5LBdQtLWa15bZ3B6f0sHsl
         dlCtw3Ty3Qv/iPX3nWcbxsDnM4OppzFLZlfrTkBy6ymwYvnn6gbB0+sSl7oZANY5jata
         ytitNDNWrKa8cBiyD85D1gFTHXk5GKthKNfhJPN+f7u8hQdmmzjfKF0wvwRRw7h/jA+k
         BJLdeyxuaqnNUfuWYafiY3EgYX/Z826uwxoKg7xAK/LyRMocEbl0U0RlhJ0NDzavMCeB
         1odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kDoxQcowySb5yxSAVbpagx3GgyNxVMokliUTxl1T+n4=;
        b=seGVh29bvQUZ0aE4tY3gVdRuCun4b1j9al229j3Xha5XtVqNDW3iPRzt5rkuQQtiPL
         RE0k6hd2i0pMcSsP00RkY2JwZuKfsV6Is5rXDgZ17Yq7DiE6yuqVoMlB6qan45P1yOj+
         Fr4XuMAhqEsIVIkIYDBrw6pcuZHwOejgzjXCvLbjVGeFX2MJSkKjB6nzM8wB1WUgAYlF
         BtH7jPiLaAvWUtaBNxnHLD0oA15knRC3UPby+y3ABQHjT1dc/yQRRq0nfftHJ2Uu+gmz
         MAUt+bxN/rEJKingrFGAyDFQs8pHL3FmSqGDEDiFt0RqjPqln88kuSTXZyhy5BTcvg7c
         D/Nw==
X-Gm-Message-State: ACrzQf0raqvS1KrgrJxJmfxwFSUCEC2kpmN0/AuCyntsMzMc+5wa0z3E
	PX2L5rbnqeM4S1zWEjw4/qB5LTIYapA=
X-Google-Smtp-Source: 
 AMsMyM6J5kan3LQleZFGYdHcDEhqbEVMxitPr+KO+03iE/8kl8CpEkreVBKdkVi+nWpLIJ61UysEzg==
X-Received: by 2002:a05:600c:a05:b0:3b9:cecc:9846 with SMTP id
 z5-20020a05600c0a0500b003b9cecc9846mr2793846wmp.3.1664965855988;
        Wed, 05 Oct 2022 03:30:55 -0700 (PDT)
Received: from ip-172-31-10-113.eu-west-1.compute.internal
 (ec2-52-211-148-236.eu-west-1.compute.amazonaws.com. [52.211.148.236])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a5d5148000000b0022e04bfa661sm13457867wrt.59.2022.10.05.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 03:30:55 -0700 (PDT)
From: David Bagonyi <david.bagonyi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: David Bagonyi <david.bagonyi@gmail.com>
Subject: [PATCH] gpgme: Allow setuptools3-base to be excluded from the inherit
 list
Date: Wed,  5 Oct 2022 10:28:55 +0000
Message-Id: <20221005102855.12807-1-david.bagonyi@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Oct 2022 10:31:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99072

Inheriting setuptools3-base adds a runtime dependency on Python.

This change makes inheriting setuptools3-base optional. If one does not
want a runtime dependency on Python, they can remove python from LANGUAGES.

Signed-off-by: David Bagonyi <david.bagonyi@gmail.com>
---
 meta/recipes-support/gpgme/gpgme_1.18.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/gpgme/gpgme_1.18.0.bb b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
index ca9c6cab14..af5b176363 100644
--- a/meta/recipes-support/gpgme/gpgme_1.18.0.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.18.0.bb
@@ -50,6 +50,7 @@ LANGUAGES ?= "${DEFAULT_LANGUAGES} python"
 
 PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
 PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native python3targetconfig', '', d)}"
+PYTHON_INHERIT .= "${@bb.utils.contains('LANGUAGES', 'python', 'setuptools3-base', '', d)}"
 
 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \
@@ -59,7 +60,7 @@ EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-lang-python-test \
 '
 
-inherit autotools texinfo binconfig-disabled pkgconfig setuptools3-base ${PYTHON_INHERIT} multilib_header
+inherit autotools texinfo binconfig-disabled pkgconfig ${PYTHON_INHERIT} multilib_header
 
 export PKG_CONFIG='pkg-config'
 
-- 
2.17.1


