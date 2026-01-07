Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C012CF6C1D
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2384.1767778072842287985
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 01:27:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E2XMOf1O;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so18151755e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 01:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767778071; x=1768382871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V8Ot5Fjfd3UWPf3ylkiV/oCXvcNlZLRsV9zilQY3sdI=;
        b=E2XMOf1Oz86W1GjCoAwXBeqBF038CFfRxn2ZBtHUNPKF5aqz7em1K1YiLemvAfWgCi
         AWQ4s5iSEY7wo+gQBjuaSBzt9kDRN10c/HFrl8DInuvQ4BoJAXH6s+EAmRWgpTYEbjRl
         R2TuXlUthIaO4ML4ddsbbiKT33xTeT7JdfLYIkWDEsJ4nyOx07GJdB9dpN4z89D8+YZD
         gv2feMQW1TXtE1uqz/sVhECZa5iSJFC7pxh6+43c+BKwIGcpjJCjox4whpZYqUh41wv+
         PCvj9O4gTi0zWzyiyUjLjRBL+ZaTcttGuFUAMSvYvom/B5HL3qGq2nd5FjEIQjEPAmCp
         zM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767778071; x=1768382871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V8Ot5Fjfd3UWPf3ylkiV/oCXvcNlZLRsV9zilQY3sdI=;
        b=bVt1AOETUAKzSneJ3pK2wWbCQfsWI5QlgNwgqYZiyjCy33VBZNd56R/wG9GerGTpb4
         7Ty1vijNa/nTW4gW2wO84QSyxq+H3kzDM5Al7WwvsE+XWYL7XFd1R5IF0tJjKA47cxbX
         BkE5mwl0krmFeKSNlQubDsUhhBrcyuiYAAqVFY+UNQtk8gMIsR9jvDsjy96E6kMigVVM
         nzka5ZFAjTB+0oxToBcUkkty0wc1BfWHkKHkBO+n82ipRPO4Fahtdl+uzVE1dnhxo7fY
         oep114+gW3XLO+0zGainiFPUmJIGqB0ncSFZXvKD0Vo/BGf0tsZuJpkecValMGuYtuBY
         cyjA==
X-Gm-Message-State: AOJu0YxVOwBCvLF4/B/QLmAEWIxnG43oWIE+koScJHwHech4t7Qapp7g
	BxCaInJq3Y4mIzXh9fA/NLWHsJzWeYde94lDuTLsg0NdpzmkzUhcbYU3RSCh0Q==
X-Gm-Gg: AY/fxX7vgEJw5pVtU7OswBVIvnvGYUFEnNRe6TSGic14Eo1/eSt2C/kuPWR5GiSnv9j
	NsPMQSzra7nwAh7evneQ4g6VAPCOozduXDsXu8YHJEJkkD3J1i3KbSsOAiMwe2qIkzE5sM4Lkb7
	bNnkNSZrfDsfhd62lk0lOekyBHf3sWst8icif5YECytQpEleeo4TPfJmUiiT+m0Gbh9pu7chcNT
	wsycjotbkCCs9AjgOS72wgf58TlM8qK5E2Ge52ynuWNVSOaH+9TUPCIWfv0VyAzeR2xQpY8dTfj
	UlbC3zwsesvv6+Pfc5YWcbuG5ImeATX5bJMz9Wq/t3Cbq3NbA4VonNY4fcGd9LgcQo0dRGORFkZ
	Kmz4s420qWwbBQHTicYJqq1JD0Bp3ra2IJr8reaBUnlNRAXnyrydpj90OdfB84tH3dQLIokEfl1
	mxy9pUPC3t
X-Google-Smtp-Source: AGHT+IECzAaED0129Z1ohgTEI/vJwyE6t0Fj+2nQ8UVMC9wiQEzeWVc8eFmBqjx4XZAJjDOAF9ttpA==
X-Received: by 2002:a05:600c:4ed4:b0:471:14f5:126f with SMTP id 5b1f17b1804b1-47d84b41181mr20422775e9.33.1767778071141;
        Wed, 07 Jan 2026 01:27:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8719d057sm7236255e9.16.2026.01.07.01.27.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 01:27:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH 2/5] python3-werkzeug: ignore CVE-2024-49766 and CVE-2025-66221
Date: Wed,  7 Jan 2026 10:27:45 +0100
Message-ID: <20260107092748.1930960-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107092748.1930960-1-skandigraun@gmail.com>
References: <20260107092748.1930960-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 09:27:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123185

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-49766
https://nvd.nist.gov/vuln/detail/CVE-2025-66221

Both vulnerabilities affect Windows only - ignore them.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
index 5529686aac..f795da80a3 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.1.1.bb
@@ -43,3 +43,6 @@ RDEPENDS:${PN} += " \
     ${PYTHON_PN}-misc \
     ${PYTHON_PN}-profile \
 "
+
+# Windows-only vulnerabilities
+CVE_CHECK_IGNORE = "CVE-2024-49766 CVE-2025-66221"

