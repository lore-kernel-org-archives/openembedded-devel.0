Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 551C878883
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:49 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id z14so5709187pfe.10
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l7VVJLqO6W1c/erUU76tsZcdacO3XTv6DRyeP9xRXh8=;
	b=U0TlRUBmFKCR7qbVrTFEyz4WN8BtabrMnd8cBfgGsscb016ly8pHsh/r+GfQbnEDil
	k1J5o52QEl3UqS+hz/WEXigzSmDuxbYhe5W9b+2E2oMyv4OhshIx3Gl4PkRlGHfy0lv5
	9aJS/NE85l35xDu/gtWaXv39zufScMRVxYscvlQ3ltPuDXUy4N0wgxDgbxG9rEK0GvkD
	SEq61v9AGA2cwhgk3lmVA7gBMpqmB27fu+QiWXVhIHall+wlXMSnA9vh3P2wIYOoC1pO
	zS7gy/VVgpvWIBr5hfVHHa9cWOBot3EU9xRXZrgui67rBLNBM+OjNxCqgsiPuzJb0JWm
	0qzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l7VVJLqO6W1c/erUU76tsZcdacO3XTv6DRyeP9xRXh8=;
	b=XLEtFNeZxWu7bqLG9ink8tZE+hhb4yAh+25wJWOGq7HAF2s8sBVAg2upufKJ4XpDdy
	BFwZNE8pBmfpqt/kUGajmVidMbpT/mqbbyRpVRUZ2PyJCi5otRwTNNiUxDDNJ92lbCCz
	+XfuqRpmwFVUr8+b4YCpy1GCe9yF/YfROVlgrHwcy+JssikOqIe/jHH8JVGFMfxEeEDV
	gJCGq/JhPAd9j37TF8SrQ8MpuAskRlhiUZZp6gVadQUj93s2mCqZHeLx8GmgfCsopJ1F
	+TdcQefkt0J7hSkRzVkWPAyjjg7Mo2BtFW+2OuEPDDuEs5NTjZmQ/Yhv44b90BiOE4Bg
	WHPQ==
X-Gm-Message-State: APf1xPB4w+rNLCIrI5+rfpN6OmIpe3ciXfyzNI6Zy1zR5Xq0+6WcmBqb
	zJ5x6AqTMPKqjzECDKgS9F7OBg==
X-Google-Smtp-Source: AH8x224PiJU6lrmeIJVuUKhkbd3s4xsitklQvVSkFYm7r5wNOzgPSQ82KNk8xekf3uhjihlfR/W/Rw==
X-Received: by 10.98.48.2 with SMTP id w2mr8398260pfw.162.1519594430731;
	Sun, 25 Feb 2018 13:33:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:50 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:12 -0800
Message-Id: <1519594406-24490-22-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 22/36] engine-pkcs11: move to recipes-crypto
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:49 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../engine-pkcs11/engine-pkcs11_0.2.2.bb                                  | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-support => recipes-crypto}/engine-pkcs11/engine-pkcs11_0.2.2.bb (100%)

diff --git a/meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb b/meta-oe/recipes-crypto/engine-pkcs11/engine-pkcs11_0.2.2.bb
similarity index 100%
rename from meta-oe/recipes-support/engine-pkcs11/engine-pkcs11_0.2.2.bb
rename to meta-oe/recipes-crypto/engine-pkcs11/engine-pkcs11_0.2.2.bb
-- 
2.7.4


