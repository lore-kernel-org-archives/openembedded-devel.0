Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1C310A62DE
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:12:21 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49220.1774534340393926228
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HYi9XAp2;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43b8e8e7432so876616f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 07:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774534338; x=1775139138; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjp4NjiSAkuwpRGyecde1/mi0jhSg3WY2+9qb9X7FNE=;
        b=HYi9XAp2ThFHl1eoCWAF5mcz/nhbyu82XAFO9D5n7wtuUkylQ+HRnZ5rT4tZtJtoOS
         14g+sTeHhjMDoAsxf5E/eUy+H6H5AuCve4pbILJns8mzfsS1XNwaCtuhtKTMpvD2YrSV
         BWyX/0VxHqsVEMU8Rc6pmigI6ErZv/r9MqKTOPSj7JvO6NZFUTKZ6s+0tkH3xqKPmQcI
         ptBbUT7DN9ezjdfyKrMDnPZOHfkCRSxSs1RKrra4KsuFhAgTtZKsB2ZbAGWKJ49OUciu
         eIkTVqnTmlmod7wXyTxaQuwBRqxbkkEfKHNxRfNtnAOiNwqFMs9DosA3MmrL8wxAYIHz
         0K3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774534338; x=1775139138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pjp4NjiSAkuwpRGyecde1/mi0jhSg3WY2+9qb9X7FNE=;
        b=cBTWwbdWP5Gbv+8SylgpZq0/u/isZrDCgT2DAuP2cGLrHqzo1EsXrcj4stiM+C0os9
         jL5TqxT9CFi9jSTH/ajMjYRdw7bKwQW4zdkjLhH+Fa1zRYCE40T7cgXaWxgCE2Nm+gn3
         wSl43cRmRCCf4ce5DUcItRqUgiF4GJYX/G/wmR/H8O/La1dakNFlqHVjaF271MuWHgHx
         ppCjSEJ7mIFiBotHZXtjy22icAt+2Yp7YD3CUYQ4TSJGVUXd/prnF18NE1t9l0m99eTI
         qsdiN/U2FhnRh5zh8lY39fNoVj4nDqiEXYX+FUePzAuLu2bgUaluMyF42cdEQDeY6QEy
         1VMw==
X-Gm-Message-State: AOJu0YzTLdxf9K+N11uD0R5fhKZUnPnOBHspBWgMoGPM+Xf9MF2WOwV3
	tRidEgsKur43w6kx/0iLy1gBt/3mj1vPwKYZwNWYtQtRdX21/fsndvOKWtBURw==
X-Gm-Gg: ATEYQzz0eqtKPHnjfHQlu4vA9aXs3VE5L/VolgknsvzXcAdJPPbfhb0lbOg+CbfqNjo
	EJDuu0qs81T4dWiJlyHciWLEBlEiAKj8nGoVJ+DIj9v1q2nXb2vz+xQSKlsbC2k/GrEm+smR0jj
	f0x4lK8P5jL5gH7O86cyJYf6QKoAGKNk651ZFp9C9kYdI4AU6Z0Ggw5B2a25/PUMMWjFvY4Qnhc
	uTtElymvkXywwfCRXFrK2ufswg2gEDggxJL4bUNTKFjVZI6ZqdO54A/aTMzVynOc3FGQiBn6Knl
	dffLfx578GtKD/uuKnOAjy3WNGUimfS+S1M6365e9cA9xNWyxmqXyF6nUi7Kw8qaMa44v5p8RQg
	BN7kPxkF1WZCycbYjP/5I3ujVJMngd1+vZvTZIykkbUtcb1ArIz64VfnNfifWRlA9wzAsSEWFdh
	ygWw4qhgDlbBXPxG5JVh9SFVqK
X-Received: by 2002:a05:6000:2409:b0:43b:9946:378c with SMTP id ffacd0b85a97d-43b994637e5mr2015919f8f.39.1774534338407;
        Thu, 26 Mar 2026 07:12:18 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919df903sm8609609f8f.30.2026.03.26.07.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:12:17 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 01/12] python3: Add warning comment before PACKAGECONFIG[freethreading]
Date: Thu, 26 Mar 2026 15:12:01 +0100
Message-ID: <20260326141213.2081121-2-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326141213.2081121-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326141213.2081121-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 14:12:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125723

The warning comment is really needed. While Python 3.14 supports
free-threading officially, the ecosystem around it does not yet.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/python/python3_3.14.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7a1ad1e386..c23605f59c 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -112,7 +112,14 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
 PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+
+# Some LLVM/CLANG subprojects (e.g. lldb) and many Python modules
+# do not build when free-threading is enabled. Also, the support
+# for free-threading in many Python modules is not yet production level,
+# although they may build fine.
+# This is highly experimental. Do not enable it!
 PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
+
 PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
 PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
 # Use profile guided optimisation by running PyBench inside qemu-user
-- 
2.53.0


