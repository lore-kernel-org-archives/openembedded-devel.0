Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECD3C54754
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 16:04:36 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.17152.1747411475525140868
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 09:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m9MWZdRM;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso2322515b3a.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 09:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747411475; x=1748016275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFCi7e494IMGBqRonFoq+3epT40c0RBaM+7QUpq8pXQ=;
        b=m9MWZdRMjyNciW0fTEFv32mT4yCccJF8BMEJ1nxU/enr8MfSg5XlsN/nTrvfOepKfB
         01xy1uinZviIi/+sMCdYvrTqZlXHLgg08tJZgPvPuF8Qzty/68dO47peEukMVq4aVMkZ
         MwTW6KVl1BiurO1dgLAOjWWZlrb31uaKqhbOkiUM8aPsppdYSrtGRKqvr3+wh+6w/35/
         CQYMls4K4o1PQcTzUcir0YanDd+rpgpXODFNQZIZcx3kKzK8poOgKYZDH/Mrapu+P+cW
         F/F+MUJHywqhwY/S868iJlhfFP7i7usl9uydALkFuaUUNApTdRDVmJw5nd8cbePdF2bL
         oXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747411475; x=1748016275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFCi7e494IMGBqRonFoq+3epT40c0RBaM+7QUpq8pXQ=;
        b=CfOSIQJEH5TGY3W3ibdLBe9y4RNO8CSvhhElefTQHdSohuIAXo9GR5xkZk2B1NrFt0
         IaEQzDPIiaUfOOMPvkcneg5pTS3UX3v705s9hJ6NVfuNzoBlVAbN0I/iH9nKyrdRAKA2
         QP0sKPxxgeXh9sGv0i5LM1en43zCEVhJeKoJ9wsQz/QPUve2PmFr1EZC9cUsY4RlVAUt
         BdNGptqz9XzrndsiYT1YZQvz4/wyQIUv4Pkfx/oR6Zgy/GqvbeFYd/BNmKk6mY7vnoxv
         8ESME0XMBKt5eM8ipdpB4YToE6NFlr1nxX+FLgfRwd+uOJqjj/oZfeMYHMqaKFiOPLpO
         McfQ==
X-Gm-Message-State: AOJu0Yyg6N3C5o1+pkiEXppKpjY6wvfKLLlWWkqdMQ/JDSPZ/U+/N8U8
	CEnki+eFDnZOFCWISqbLeCkM52hQ87syLdoUCWeYkEf9FpM8psoIau0JnGHF4SLf
X-Gm-Gg: ASbGncvMDcwZufIALpLfzLyPQeeg92LNF+iF28GDvtN1Z0q35OP3tAiSR11Y5wX7Drh
	J2BI1G9N4nfnbJlG8mE5wbAD77ZFObYGlwKpEc8V2NJrVzCCbwn6SUWzqd2vRvYF3ygAcUr9wwo
	1LvIxlR7IdZiZk+YaalITBZPBqj16m+WkFNh5PThLUWYN3yCYtDyULtA42JMi3sL0i2qkSfKYfW
	cSk1Q3Q42KzEdEWpfC3PneVxrZ+tvpMka2Ff/cLdwqcci+OU4yA1RUP9ccN6LAKpeJAR+PuSo3Y
	kYvCHxvws/3RGj9AFJ+ncT5yanXcoyz3dwX5KArXKoduq2ugl7jT+w==
X-Google-Smtp-Source: AGHT+IFN/9R1jkqwOw8+NDzE2+Rv8GgEATvEo3DlBsrBnBxKvpqIGtxI1of8Li3F2S5otDHGXPNmTw==
X-Received: by 2002:a05:6a00:4b10:b0:736:3c6a:be02 with SMTP id d2e1a72fcca58-742a97eb61emr4897053b3a.11.1747411474463;
        Fri, 16 May 2025 09:04:34 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b9a0sm1749877b3a.108.2025.05.16.09.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:04:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] osinfo-db-tools: Migrat to using libsoup3
Date: Fri, 16 May 2025 09:04:29 -0700
Message-ID: <20250516160429.1391450-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250516160429.1391450-1-raj.khem@gmail.com>
References: <20250516160429.1391450-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 16:04:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117432

Disable Werror, it gets enabled when build is done from git checkouts
perhaps assuming its a developer build, but thats not the case for OE

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
index 4434a851e7..11de5e404b 100644
--- a/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
+++ b/meta-oe/recipes-support/libosinfo/osinfo-db-tools_1.12.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://libosinfo.org"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-DEPENDS = "glib-2.0 json-glib libarchive libsoup-2.4"
+DEPENDS = "glib-2.0 json-glib libarchive libsoup"
 
 SRC_URI = "git://gitlab.com/libosinfo/osinfo-db-tools.git;branch=main;protocol=https \
            "
@@ -14,4 +14,8 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
+do_configure:prepend () {
+    sed -i 's/-Werror//' ${S}/meson.build
+}
+
 BBCLASSEXTEND = "native"

