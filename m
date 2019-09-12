Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
	[209.85.167.46])
	by mail.openembedded.org (Postfix) with ESMTP id BF3B57E21C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 21:42:35 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id w67so20535992lff.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Sep 2019 14:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=b/W/Yh8Ht4ruQ+Hho/5UgbNzhFhZNC36MuOcq5gqKdk=;
	b=xsFN49sjOljEKAf5KUYWnEt4Po/oRFhyGqL6TDgpEeet74WxICCuwK7XGi/zeiXk6H
	CgYhOAPmBB5wc3l1ZstDS7wxdUOQxIoKb//IO96tZdQRWgAsyW/ZhBuhRlo7dp0weecn
	U2jUyMa6n1DfMA83iqzk+Y3A40DxySuVFyu8gCB9bBq4ZIxjLdI0BJTU0S5mEq1c9lKY
	/aQhxb/tNJYMITXzktses80kwt5tXecpRKCSLkw7GvNX5y3CQBTp4AmPNcygsEErPtcD
	9bhArnuBbmbSeN3vfzXZr1YpBL28978qmrAUXQAXTncaSrnPDAhiNKzSqrUw+G9Zwsge
	etmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b/W/Yh8Ht4ruQ+Hho/5UgbNzhFhZNC36MuOcq5gqKdk=;
	b=DWR0q2K88lJwSNr26BQnUA0bta8FiQLh3sInYukZWAEib37phJ2uExUA/Lg85r4yAN
	RGPOF8zru1ReXYqDDtdbm++UP+GVTO1Y2mi6yiZQgwHm1MM+ABHBMQ1gVpp2iPNnwmI9
	eU9sN/02g7wQ8qcLPeLt7kLOYAKKWB8zekqPsb3eBsbX+dV1aDaNPPVP/JCqfO/966Ci
	2ySnR5ibgNHE9B3tojKeWRqCDM45lBitAR/wM7aUKunQx+hnrM2MirpMR+DEdq0+y7yV
	Zh+Ns0f4aYNXaY8363TvBIQEPod71WxHpS4oz8HC85iHHX1uzLtB+bJduNlUkjj5DuUI
	JbfQ==
X-Gm-Message-State: APjAAAXb+MjQBTT8/9BIZ4R1qY36kfVg52Aj4gqO8qkc6zaZhCwhkqMp
	rm56EUJS578Jr0kKdPh+P96ilLnBfsQ=
X-Google-Smtp-Source: APXvYqwCQQRGCJsKxKv95qD+0a6+x+Er5fkSEvX2SfrcsgcXxTj+XMs4Mj3eO8sOaQl9ffJ0rbSctQ==
X-Received: by 2002:a19:7413:: with SMTP id v19mr28712850lfe.176.1568324556377;
	Thu, 12 Sep 2019 14:42:36 -0700 (PDT)
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se.
	[213.89.0.115])
	by smtp.gmail.com with ESMTPSA id 77sm5971237ljj.84.2019.09.12.14.42.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 14:42:35 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Sep 2019 23:42:34 +0200
Message-Id: <20190912214234.27769-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-oe] libburn: update to 1.5.0
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
X-List-Received-Date: Thu, 12 Sep 2019 21:42:37 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../libburn/{libburn_1.4.0.bb => libburn_1.5.0.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libburn/{libburn_1.4.0.bb => libburn_1.5.0.bb} (68%)

diff --git a/meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb b/meta-oe/recipes-multimedia/libburn/libburn_1.5.0.bb
similarity index 68%
rename from meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb
rename to meta-oe/recipes-multimedia/libburn/libburn_1.5.0.bb
index 91fe69338..612000e67 100644
--- a/meta-oe/recipes-multimedia/libburn/libburn_1.4.0.bb
+++ b/meta-oe/recipes-multimedia/libburn/libburn_1.5.0.bb
@@ -5,7 +5,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 
 SRC_URI = "http://files.libburnia-project.org/releases/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "82ff94bb04e78eac9b12c7546f005d6f"
-SRC_URI[sha256sum] = "6c975abae4ae1f80e47fc5d1e235f85157f73e954c84627a5ef85d8b1b95ae94"
+SRC_URI[md5sum] = "b32edefdd9a978edc65aacddfe7c588a"
+SRC_URI[sha256sum] = "582b12c236c1365211946f2fe3c254976af37bbec244051f7742a98ded9be2bd"
 
 inherit autotools pkgconfig
-- 
2.17.1


