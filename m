Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6BF78972
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 14:16:19 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id f10so1809980pgs.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 07:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=i18pj3a8XF7M9jw8+RY0IA8BZ3of/vbggd6M/qIk5eA=;
	b=RB+ugJbt4NU40wlQd8WufqmC61VVnSAR0Z+D28jUlyA3sdFEq0hk+/1vp1zv3YjpcG
	zCtRTEM9aFvkxUGcTIjRx2nseD7Cm+5QZmH2g4iOA/vbaoxTYZ/rFe2t8+E/T6lNhYOn
	0Hci+qVL9H3zR8N1VHjbuX4/0qituJAaR+/KCRu3CyN8Ij7GBqdLpuShqG0xjY8wBM/e
	OPtQkMFlVzW3qRRb2dZDpAEOSZTK7pHySGTbwbrZ+chvSrTSGhorryv++oBntQ/XNJ2i
	yQv0K/A5QIv9GBk+XkWN3tXIeS/1XWUuX63WwK1+9nQ/RzB3v+L6MLfH6rpdXJll5Y1U
	YBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i18pj3a8XF7M9jw8+RY0IA8BZ3of/vbggd6M/qIk5eA=;
	b=RHc6svzJ/21jZ2VMDzdNYE4QeU2jYquWg/aByvgJ4b9QXJs1GzOMNS6KCGTY1NvcTu
	hcBNpNRwvZUqddnpp/9bQlnpMLNDU90fob9mIvCUefrqq74UvI5Y0QqRhPo/K63/gBHm
	R75XRQ9YvZZjaWREksSL8tUGUWsJVcvekBY3Ljlzlu1yof/Z+sQsJPwhKo/UiATaPiFL
	WUxUrz6M56RAY/EtmKC8dljZDgupxTAbC9kc/7CVC9OUgjkoHWZAXR/ibkmAu16UlQ4y
	hwS6aUoSSO3AuiMNzGf3pw0My0dtJD7aHm9NFLKqZxC8hGqxVE54HT10/VyUMqekec+w
	gX5Q==
X-Gm-Message-State: AElRT7Fq1H2SUIURNt043e1dR5YBjfQ8BGE6a4hQGyRMj3RZUAa8bBmZ
	/Jlyk5NVqLCtBHSwxD7WCO4=
X-Google-Smtp-Source: AG47ELvGRXA9/8rj5VZOvMLpLG/n3ZOgA6PPLwc98Ob+k+rRqN81B05bFdtjIFu7994ttLtcisnzNw==
X-Received: by 10.99.186.14 with SMTP id k14mr15336517pgf.43.1521641780644;
	Wed, 21 Mar 2018 07:16:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	v18sm8138907pgb.23.2018.03.21.07.16.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Mar 2018 07:16:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 07:16:15 -0700
Message-Id: <1521641775-2171-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
References: <1521641775-2171-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 4/4] flashrom: update SRC_URI
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2018 14:16:19 -0000

fixes
ERROR: flashrom-1.0-r0 do_fetch: Fetcher failure for URL: 'http://download.flashrom.org/releases/flashrom-1.0.tar.bz2'. Unable to fetch URL from any source.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
index 6f5c037..9eac876 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://flashrom.org"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "pciutils libusb libusb-compat"
 
-SRC_URI = "http://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
+SRC_URI = "https://download.flashrom.org/releases/flashrom-${PV}.tar.bz2 \
            file://sst26.patch \
            file://0001-platform-Add-riscv-to-known-platforms.patch \
            "
-- 
2.7.4


