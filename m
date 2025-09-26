Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2982ECAC5BC
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:32 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.18525.1758896371296004518
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BtZxUFk9;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61a8c134533so4056520a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896369; x=1759501169; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/sL35Q9E8YSWOkXHXcSnSyiWIrrEbRKdITnSjaa8iXs=;
        b=BtZxUFk9Gi5s48Br2m4UjeAbCS+JKXD1EL0phxzPS4IKo3QQvgkLojlTVJxFZ1NQni
         9fpGtNDaOGTiINieJQUlFQfaZ5t/5ZbCb9073yMhwzAQlRNcYiiZNeULPWJrM/FSPVRB
         L8ANz0T2xHQMBYfKcNZ6N02Vd5yN8EeIBQq1o2gWG1oAQOSjgfK4vdQ4g+USZ+I9GA0N
         1Q0p1KvzBpW7ChiszNAbRw+3/EXqpwW7xRWv24x2wKi1CZSL3FY8j8PKxo1T3Pwo7pOn
         G3yQlMQ4p3qhiqcTf80/UWPYVgV8oQRRw9kisIU3pUUSei639YajL2ZN7/HHnav+jW4L
         cI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896369; x=1759501169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sL35Q9E8YSWOkXHXcSnSyiWIrrEbRKdITnSjaa8iXs=;
        b=It7yNn4SZRUJEZAq+HQ7rN0RiBKxRcUuknLKwoC2jzjrasu6h0E6kVdlbLrzl6Jrkh
         yg/kdEejf43c+Lf+IZ9mCHbr7P2qSSHqWb9bCBvWIRV1NYimyX5ALv5v/yEwpB2I2yFZ
         VjCgUFW/NLwOxo8ofJb3Ck0rr3FaO4FbFEUrtYv0zIfSeqyygdAkOUhxHLBOwVBhTLVx
         FQXE1etISLCiRgfAe5kpA/FDBKIfgTEcUZa/6xRzxnWly572ys5BjUWsVzlukrPzY01o
         kpL9MVan0b3nIvzYcCYi94j1iZGIrt+zX8gG9TExiCFgH2jOl9ZD8FZupyavkNM7p0qX
         sJtQ==
X-Gm-Message-State: AOJu0YymCb4kctpNmLA8jHgU0WQhu52D6b0HivMMnuLgF10Sibi0yXDb
	U/yCwCknAg4YiE+aM/yOnXuQK3NqTpknD16a1AqQ08ZdCf9SzWiLd/drzyQw7Q==
X-Gm-Gg: ASbGncs5AEP1pGIi7neMx4jnya1Fk3sUp51YaP8rjGdxtXu+KhtoBWBHsUsRZLy0wFj
	HUaFs9mCilOkSflkOiGOHTz9zirTorSlFnHhBLDQpd6D79Kr787IsVZm6OzclFjnzb2bZ0Qg67H
	CYJeggAslOCEKssn7t/iEdF6sW4sIE01MTKeNBuemJfdnqQOQTSUvKpn4K6yWit5HD6AHd/HxUp
	rkudspMsCxY5oJFus/GPLsgrtWHsoVXQjl5ogt2Jy20K4mM+sKelFml7p++Fdx4fqHS5CtKXX3B
	XFzPiFl0rLiuhlO8MOVPemk2SdNmTVwVkNYTiHrA6IPsRvX2WovUYx7O5DBvd1cCcp88yE7XQG1
	ZWgioORbXqr44U+0DdRKa
X-Google-Smtp-Source: AGHT+IGpD4JJMzHHopJ3ubOpxeod8fn4UXHkel7gmLbwcWmu6kRyYBB6GspyVKq5D8s4/THcFE/g8Q==
X-Received: by 2002:a05:6402:23d4:b0:632:7c38:b9d8 with SMTP id 4fb4d7f45d1cf-6349fa930ffmr6196745a12.30.1758896369476;
        Fri, 26 Sep 2025 07:19:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 08/20] libnftnl: upgrade 1.2.1 -> 1.2.2
Date: Fri, 26 Sep 2025 16:19:07 +0200
Message-ID: <20250926141919.2010846-9-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119917

From: wangmy <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6d997c52c5643c5d92cc6bdf77beae7ae3b300e9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libnftnl/{libnftnl_1.2.1.bb => libnftnl_1.2.2.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.1.bb => libnftnl_1.2.2.bb} (96%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
similarity index 96%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
index 44479638f1..3eca92dcec 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.1.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=79808397c3355f163c012616125c9e26"
 SECTION = "libs"
 DEPENDS = "libmnl"
 
-SRCREV = "09456c720e9c00eecc08e41ac6b7c291b3821ee5"
+SRCREV = "f6575131e60ab10f131ea3ff36f69af2b6c3f614"
 SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-avoid-naming-local-function-as-one-of-printf-family.patch \
            file://0001-configure.ac-Add-serial-tests.patch \

