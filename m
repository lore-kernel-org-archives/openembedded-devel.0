Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id B4ADE7E2A8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 21:10:57 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id n22so1134lfe.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 14:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Buv4ZAqHcDAZT7uDsqG24qBksrGY8/KBGuwphTZ6ZOg=;
	b=P8ciUc5x1r+am1HPjh+BFi5hnVJMXPfTpP8QLMd+8K67pCbzmbgxiWRi/8H5yY8Xnn
	Pek0nOtNcewTy8zzbzT8qjtexU60SciS5QhlN3uJg2dgujYeMipSf3vToniUCN6rehS3
	6HEcO8wS6eLRS61NkJYHvxwVoKmzDqGIlwTytLGeoPJF5bg5zxl3EdEKiSXpxkqWVEok
	QAkIGze67RgCRAhSmm5OQ5aeVEEglQRjUC+LokmhsrMhR7rzw3uvGyzd5LfNKSHtMBKC
	HTFIQbXtfk7kw9W74LtZyt4LRuA2Br5NwKOZsCMaUJGJeh7aUe4LHDE48ycNXoBLHy0k
	Qo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Buv4ZAqHcDAZT7uDsqG24qBksrGY8/KBGuwphTZ6ZOg=;
	b=FrxNEXt+QxmWZdOo6gjCBMOHWUk3JZdakE0NwDHNFLbhe6gC4Odas2jU5dxwBnVoKZ
	EJNH4urLxj2Q2dbNZprcJ2rwFGKpgbk5oQdkEXGAr4mO40PWQFna59fZqJ1IFvwnS4vc
	KGmvKnBkc7AY01tbYQayL2b63S9fI7ArvBjLrL/j/PZ+CgqwidXHrJ3OkTKq3RBMBkqN
	ZQxB9EtY0iidUCLUHhKLr/L3pPvx/Pt8Jal9pEToNQ4r5SQCu5NHt+lFpka8S6fELgSg
	7EiCyl0ZNcZ+/d4Sd4wD+9SrhmSYkazfi8BXn7cdhRkbEEpmwSGWT8cAAx6wLjD0BfEO
	9r5A==
X-Gm-Message-State: APjAAAWIyNCTTLzwz5jVsRSOfX+0KBhHcQPy1IKZAwAVpjIaF4ixnahG
	yg9iep6ZjpdfYlgYNEfSUelMeimoQJU=
X-Google-Smtp-Source: APXvYqywgonREyOexMoi/27xoNvQSV0xP64t0E/rsnGJvY1732RdbljOqQLlSr5ltPBViYGFdY2QXQ==
X-Received: by 2002:a19:1dc3:: with SMTP id
	d186mr40470523lfd.101.1558473058191; 
	Tue, 21 May 2019 14:10:58 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id 13sm4787371ljc.71.2019.05.21.14.10.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 May 2019 14:10:57 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 May 2019 23:10:54 +0200
Message-Id: <20190521211054.16218-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] mtr: update to 0.92
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
X-List-Received-Date: Tue, 21 May 2019 21:10:58 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../recipes-support/mtr/{mtr_0.87.bb => mtr_0.92.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/mtr/{mtr_0.87.bb => mtr_0.92.bb} (94%)

diff --git a/meta-networking/recipes-support/mtr/mtr_0.87.bb b/meta-networking/recipes-support/mtr/mtr_0.92.bb
similarity index 94%
rename from meta-networking/recipes-support/mtr/mtr_0.87.bb
rename to meta-networking/recipes-support/mtr/mtr_0.92.bb
index 9d3275e2d..2bc7d9787 100644
--- a/meta-networking/recipes-support/mtr/mtr_0.87.bb
+++ b/meta-networking/recipes-support/mtr/mtr_0.92.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 PV .= "+git${SRCPV}"
 
-SRCREV = "e6d0a7e93129e8023654ebf58dfa8135d1b1af56"
+SRCREV = "6cddfc6e8f0e20af4af218b545f83d43b3f9a387"
 SRC_URI = "git://github.com/traviscross/mtr"
 
 S = "${WORKDIR}/git"
-- 
2.17.1


