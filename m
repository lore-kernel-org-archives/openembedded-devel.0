Return-Path: <nick83ola@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id BB99A7F813
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:39:43 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l17so3711574wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T299BiKxgIWY3eLOH5wcSNUy7QhGCef+xCvGun61W44=;
	b=ehat1K/zawIWYQ31o1zil2LpMGkBKJB1c1B9Z5zPd0TbWzPPI2GWWfnIts02EmGF0S
	RtgxmeTWHp8djfRuZkrBcmWVQdb5I6tj1jqM9g5VFbW23E8gAZlT1woKZaeE7ZtikGds
	dMo0mwbM5v9jQJxaUenUoNHLD/cXiDEAdlzDE29/4Y7Ps/936n4LrTuvsOUMvboaSjS/
	76+xa4eKifxIrlbarZpLQN031nETuBBe35YY3ETZHBMht8tmkByGejx7p738RS2KytJR
	eMgObDC9Lf3cVpdbociH8XBKYblWapdvBGa2SM7XO7NQ18RY94uXQPBl87fmwMHdtOus
	3D9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T299BiKxgIWY3eLOH5wcSNUy7QhGCef+xCvGun61W44=;
	b=U/hpw3TvRNRTiYX9nU7Ac9TL6Njocti/w42kTKzpi+aR0yEICCOAeUVl17wqj9k5Xr
	Yvk3mP2HZpPHzDV0D3PG74paPZrIDD8/OdjDl9RAYuxqY83jueyA92sbE8hEk7kqxM1e
	bQeP1qTkU5Zic49JYnFn/h5mzo0P5cEEZrCWkc4+oo44KrJKBB8k3e2PbjNPg4Rby0gS
	Ib+0uNK6XjCHStysEKKImwSjKt060XrOVHsgU9L6EkdLYApqyzTtFLcPGNkKV2xIAvXL
	4jddMcv/LJkwaY6UNQvHjpyi/VyXmZ7Q7uQMOy99xZUoSQQTgo8dGTsje/Jwage2FXfH
	kYzQ==
X-Gm-Message-State: APjAAAWMq7qY6lgcuS2hyCXxJLxFNzykmvjNBSjoVTfJZcCQNEkttWua
	O6q3XnojtLf9V2iNc8Ub9y5U6SOTYrQ=
X-Google-Smtp-Source: APXvYqyWxEvRNH+wui+jJsEp0Xa5Ej9WV5yd46bkvGf78RZf1CnNAl6M5BeARWpPu5P5Nlq2mtlKCw==
X-Received: by 2002:a1c:5415:: with SMTP id i21mr6676578wmb.120.1574177984132; 
	Tue, 19 Nov 2019 07:39:44 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	a26sm3461285wmm.14.2019.11.19.07.39.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 19 Nov 2019 07:39:43 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 15:39:26 +0000
Message-Id: <20191119153925.2089-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-configparser: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Tue, 19 Nov 2019 15:39:44 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 meta-python/recipes-devtools/python/python-configparser.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-configparser.inc b/meta-python/recipes-devtools/python/python-configparser.inc
index a1fb6cd29..8ecfe221d 100644
--- a/meta-python/recipes-devtools/python/python-configparser.inc
+++ b/meta-python/recipes-devtools/python/python-configparser.inc
@@ -9,3 +9,5 @@ SRC_URI[md5sum] = "bc1558ed941cb1acb80ff650726d5af8"
 SRC_URI[sha256sum] = "bc37850f0cc42a1725a796ef7d92690651bf1af37d744cc63161dac62cabee17"
 
 inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
2.20.1


