Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E402C36019
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:37 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.3843.1743454892493373070
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=idPbVrEX;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac2963dc379so780418766b.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454891; x=1744059691; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5aQfGEz3fsYZr3UfR0XrX19zriS/36TsDNWeQ/ipE4U=;
        b=idPbVrEXptEGcejhStmUG5eaRDLyS1wBDxdfqtUB9YtS7r4v08uENnvTgnVGpJc5nv
         FbpO3ZJQ2mLN+G6g6REp+QTyl1HJ3LQ1D/vuXRkLz1EJIeFm7AyzDx9wUfJoxroLPw9v
         BfDxQYWN1eQHbEP55nBI7kFzjYr1YIkvJJ+IwiM1HvLUCjHVZ8PMTs/QgEpLR/8g0DuZ
         c2dF8PfzeuZqWu3uwszd1PmzyW33o0JA4jbSjPRt34tGM97fbaF/HR2areZozQI8xDZ6
         oxrbIJHLJgsa3zOsyfQ/JHvWXm89oG+8+6SjPAw7Dbok9vfXd6OxFfIaRg2c3cKRyU9j
         RGCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454891; x=1744059691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5aQfGEz3fsYZr3UfR0XrX19zriS/36TsDNWeQ/ipE4U=;
        b=gcJPe/TMQ22xvAvdEqI4vucjhof/Z8Nx9FBgkEb9IOuQBiRrJYiRPTnUL8roqiRntL
         Pt6sI/aB/HNt1STc6dT3WqdcszblkCwNM5Ldipt9a7r3zFiKE5KiOLLGFPjlVFr/ebT/
         nvzFJ2Y5Xl6X7R3dbIMNa/bl7EIZLFfl0uQjgS6ZMOKqbTiQlkjdMHdWq8dpK9kr9wST
         QjaNiLoAV/jYILR1UWtIOEg00R4PRiOhxZhSVRSYof/qs3rV0ycOZUCRS6QFGS8CSk0U
         ZdX8e23kpUseIj6sjylsXN+hunekW1YcyyTjQRVbXEIqiFkp77vbalIMGU35N5z/XoCv
         PmKA==
X-Gm-Message-State: AOJu0Yy67clzvnD5ryylAHMeK7yJWqubOeEuOmBbemieWU7N8dC5Ltt1
	zQXgCgW91Dw4nzvI9L5nmBa5k4M24DTC+ANrY4vSBOuL7YPBZg3FQ+q5MCgb
X-Gm-Gg: ASbGncu25wuM4xnTPHnHN7iLuITlaMzdIlOJqVaUWHmNSs0h9J31XwpFF4OAgfnMFUD
	YlgyUFjghB8QT+4E3YnOxJ6FizuviqtRy5BP6ceDcP5RmSL0MXsFCRCH6giNTZHz2SBtOQ/m+hG
	vdyI7HUnn9aXTZ3EUKaM+ueJWAgPxiHGf+RagX4Y7HY9maevom+R6348BRVcwzqrz6eT4gOoOTq
	eyLFP7SWatxaMfQfkZU8WIqB/26WgWDC8NcRWot+LJBZJNfKKp32/4cmiXCd2IoM1Hf7Bp/lOh5
	+OP/Ic+dkcR6f9mjNUkzxkym8o49hZA10IdTz3WUaV3OKJ8=
X-Google-Smtp-Source: AGHT+IGoRfVC+CHy9jh0heDyHQsWzJ80bsiD8sebN6S+RzBcB1sBuUiHr7G6EponN4fR00rLBVN7UA==
X-Received: by 2002:a17:907:7e8f:b0:ac3:2368:9a12 with SMTP id a640c23a62f3a-ac738a1f76bmr993817466b.27.1743454890689;
        Mon, 31 Mar 2025 14:01:30 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ac71922bf43sm669354766b.6.2025.03.31.14.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:29 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][scarthgap][PATCH 17/21] fetchmail: Fix buildpaths warning.
Date: Mon, 31 Mar 2025 23:00:57 +0200
Message-ID: <20250331210101.3460858-17-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116453

From: Wang Mingyu <wangmy@fujitsu.com>

WARNING: fetchmail-6.4.38-r0 do_package_qa: QA Issue: File /usr/bin/fetchmail in package fetchmail contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
index 587a479497..6cde94b202 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.38.bb
@@ -18,8 +18,11 @@ inherit autotools gettext pkgconfig python3-dir python3native
 
 EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix}"
 
+INSANE_SKIP:${PN} = "already-stripped"
+
 do_install:append() {
     sed -i 's,${RECIPE_SYSROOT_NATIVE},,g' ${D}${bindir}/fetchmailconf
+    sed -i 's,${RECIPE_SYSROOT},,g' ${D}${bindir}/fetchmail
 }
 
 PACKAGES =+ "fetchmail-python"

