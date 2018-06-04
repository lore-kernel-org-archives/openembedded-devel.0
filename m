Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8772074B83
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:39:42 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id a12-v6so1613403pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aHk0R1n8i38t+F5A57svOXaardzozqCfYZvQ3MyoBuE=;
	b=RJxtkmOWOdktccfrg4fVyB+ouby3As0dh+g7QVSfcRVdWTmPvSXoJKfAQigbQ+2ApD
	OEBl68Sk7FkBOejVAJl34a/1KLGvmve4pdngEKEWPI6Pnj8OmW9nQnrJrSTd7scdtnNZ
	HHm9jIWQXghZSut1unfRu71xaSFw8/8O+hGPTZ3c1WIK+KFffgKcI2Zj/HjKX9QmmeB+
	BJWzDJ+wGGXzLCJZv8oTIvNJFEEEELBkvoqOE93tLPkWNgX7ROWhvk1NsA5i8baBox99
	QLWGT+v1VgywJ+c84xFl6y9rG4rLGKXvEPm/F6rmPnbomajMTFhWEtDt29mi9/QSKZLm
	AlIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aHk0R1n8i38t+F5A57svOXaardzozqCfYZvQ3MyoBuE=;
	b=N5B2GSrT8PlUVfRQxH/xRxeSry1DFUW27bXrISI5O6aMoJzfzVEsG8wDuwz8thX3A+
	HpaloeAxcxaC07ODXq5Ecw+HqvQabrGGghL7Zy362FJGjJpc5MQ/jzTpQaHY8d0gV8Qj
	ZwXrSBqp8At5rJl74YonCOF60psbQlChDw0auzHmz3binT+ffHt6Z8/RuVpBm4nmUb64
	x7RRnrG6NJnqIL0wSexH/gz4j8e/HuaA59mgmIdDyQ+zPjJxXED1FlwN1cTLiFBWzRfP
	ASDtDiddnBxtx5RknbPmKmZvWylexBLhMvJyknvAdfgnCV0dCR1oNelYfDV5maBGjEpJ
	SiCw==
X-Gm-Message-State: ALKqPwcHq43U5E5ZD9/WhjrOBsogJG4UUt2S0EUCofkxzPAGeuQ/C80x
	6T+QRj0uBiGTui0zLq2y8GA=
X-Google-Smtp-Source: ADUXVKJgNvNFNv/0ijUQFQlkZjJrE6p0wj8/RK83CjGf1i/2E+YioU0rrvoU4kZnK6OSdp1gayUOGA==
X-Received: by 2002:a62:d508:: with SMTP id
	d8-v6mr14319781pfg.128.1528079983604; 
	Sun, 03 Jun 2018 19:39:43 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm12069697pfk.42.2018.06.03.19.39.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:39:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:39:31 -0700
Message-Id: <14ab9699e9b8e596c69bd5c6758f47bff3e8e033.1528079821.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528079821.git.akuster808@gmail.com>
References: <cover.1528079821.git.akuster808@gmail.com>
Subject: [PATCH 1/6] opencv: fix runtime dependencies.
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
X-List-Received-Date: Mon, 04 Jun 2018 02:39:42 -0000

From: Ismo Puustinen <ismo.puustinen@intel.com>

The newly split "libopencv-ts" package is empty (and thus not created),
because all ts files are installed in the development package. So, do
not add a runtime dependency to libopencv-ts.

Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.2.bb b/meta-oe/recipes-support/opencv/opencv_3.2.bb
index 535c761..fc62e99 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.2.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.2.bb
@@ -126,7 +126,7 @@ python populate_packages_prepend () {
 
     metapkg =  pn
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
-    blacklist = [ metapkg ]
+    blacklist = [ metapkg, "libopencv-ts" ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
-- 
2.7.4


