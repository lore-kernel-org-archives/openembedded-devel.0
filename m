Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6AA1C6C459
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2018 18:51:30 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id w7so10958601pgp.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Nov 2018 10:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=ZdZyhJwk77bcij6rd3l040+LWedXeR0RJao3zb94yUA=;
	b=OTty6d6sQei1gPnQHHjd8vOc4mk7hp7vaMwStHJspCnWIa9Q7HNwKCM/ZvOjv50ss0
	rqOLI2BN0eRbVuQMt767L495T3ZDjQ7xazSU1+RS8uJ13txcUAh8HZu25j66wBa2NuPs
	/OaBHtasDALIJpz5SrDqPtRVHBgyYXlPlThpNFpZ5BoM3g/8n+wYacuDWZqz9RxYNkYR
	sEaAFK4tAJCzY6L7nLJyyDrfQGuxFp4lF8k8Ie+sYBAAx537HQkfkOzUMy2wOjv+CFNw
	zb72GpELOaR5WaHXA5X9m8jgk8FU6OIyXNMJIJeyLwlbo/IT219Tr9cDMrxHvQMc48in
	QVAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ZdZyhJwk77bcij6rd3l040+LWedXeR0RJao3zb94yUA=;
	b=YENU/3EcYOhRThHZLSR1rB2R+tcnimAHZl20uZ2CHNQz3J0hc4PwzOvKGCVK60huG+
	sNgJdnBbW5afbKojLNP+uUoSj1Uhv7/Sr4Hc5kKtsAQsgrTH0/e8QY16By0IhLInEnAl
	rPeak2tCeUhb6Isq75fUJ/Kirpg31wc+DgdNgQ+pPHdcGwhn2l9ALSzWXz/6/EP0jyEi
	98T1FOAlSHs68vF5mBzJzFRGY2tNkl05DfMKTfu+XsmQD3TK+vrOv9orrhXbvUKtgN8o
	YaehukDDRypJvBfXw2byYrtxcA956UySu4xmTKYiE8C29EJQrFsBxCyGrz9mqOEqfsWB
	EJxA==
X-Gm-Message-State: AGRZ1gLxLdn8ST6WhNGfcVcBfvnkUYG6nZ4FCb/JPIsHGWyxARAu+Mkj
	/158vQ9Lw2uf7DGwsih3P7PNsPgb
X-Google-Smtp-Source: AJdET5dXb1YucrPfNwJ3DZLz0bs5IL/Ht/ZrWA31PARTQUzfnjrvLQLHhQ1XE2JbaqdqFxHvYklzQg==
X-Received: by 2002:a63:6dc8:: with SMTP id
	i191mr10640513pgc.215.1542394291099; 
	Fri, 16 Nov 2018 10:51:31 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:f00c:90a9:e13c:6a53])
	by smtp.gmail.com with ESMTPSA id
	n189-v6sm36154056pfn.163.2018.11.16.10.51.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Nov 2018 10:51:30 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Nov 2018 10:51:28 -0800
Message-Id: <1542394288-28443-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][thud][meta-oe][PATCH] opensc: 0.18.0 version fix fetch error
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
X-List-Received-Date: Fri, 16 Nov 2018 18:51:30 -0000

ERROR: opensc-0.18.0-r0 do_fetch: Fetcher failure for URL: 'http://ftp.debian.org/debian/pool/main/o/opensc/opensc_0.18.0.orig.tar.gz'. Unable to fetch URL from any source.

This version is no longer hosted on the main debian URL so
use the archive URL

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opensc/opensc_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opensc/opensc_0.18.0.bb b/meta-oe/recipes-support/opensc/opensc_0.18.0.bb
index c389e0b..45c931e 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.18.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.18.0.bb
@@ -9,7 +9,7 @@ eID cards have also been confirmed to work."
 HOMEPAGE = "http://www.opensc-project.org/opensc/"
 SECTION = "System Environment/Libraries"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/o/${BPN}/${BPN}_${PV}.orig.tar.gz \
+SRC_URI = "https://snapshot.debian.org/archive/debian/20180521T101428Z/pool/main/o/opensc/opensc_0.18.0.orig.tar.gz \
            file://0001-Fixed-gcc-8-compilation-errors-1353.patch \
           "
 
-- 
2.7.4


