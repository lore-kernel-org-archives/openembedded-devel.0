Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 140E47FCDE
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 11:28:25 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j42so24997995wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Jan 2020 03:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lmXro9Wi3EmdAGA1a0icPmREydSVNQZeKU+CRpwv9oI=;
	b=l7LbN4wy1mphkxns9pVQglnlc+toOK1aBCftp6dXRWDv9y7ikkEaDetS569vZ8f9ia
	oEfvgf7n/cYyrjWSg5AaepYMj2Yytpao1pHgG3zPn2bgF8jv9VhsXpBTJxN8KHaA8RqW
	nt6MwGbFhzRn/gG7FDWPPftsKjHWQJtKMHLipya0rst23mxA9bcj9KSz4RbphSrOmECB
	mcrPE5zknCkUHp0v6DX8EAfWrZMS1eoKQxTL3WCisEg9CRd/I0bR9sNCoHB9//pd+Ajp
	uoljSrBYDwoqPXZ110TGeojtClm9+Y8ozwj1ZYpRavJNHZJ4/NNWD5IyxVFiZ3/5pMKd
	2QUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lmXro9Wi3EmdAGA1a0icPmREydSVNQZeKU+CRpwv9oI=;
	b=TN8Yqabv7byV6qHpAYOu5Vh9n/Pb5udAzAR41Ld7dzX/6T+aNTSRVTQ2A273nd0iCT
	w0rjKN96JqgrbHN7vUvxuNps+TxhDC5H3DK/siJrczTVcSt+FsrbRK9CpM+0I+bcQouA
	ojYd/XFPEyAKTNyCfNIwk3TTHbIKr6/uDjsWiUezaJCI55p0K8iBTDpiVIxT0a7Saret
	V7cTNj9fulgQ7PrKD7p+bzU6zX7r7M2RghMYknBwQKo/YdG7Qhq5MesvDWtuXHhBCez/
	6nAQTCoyJ1x4xww4BAAGyWlmQJ889NRv4qPHdXr9RodREsceoVVud93UGKeKpjBDJhL1
	vZ3w==
X-Gm-Message-State: APjAAAWFmpq/heWKHH81m5KxdMNbLogTb8YnMbrJlec+e9fzCPb64+OI
	PIppCOxljCd8AoRJRucnsIrYqKz51IQ=
X-Google-Smtp-Source: APXvYqw4OGMueVn7EcsTpafdrtXNHiSNyCgqd3kFiej/B/w3Z/cPuz+Yg6H3QM7NbF3PhtaxzomTeQ==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr7895458wrm.131.1579346905740; 
	Sat, 18 Jan 2020 03:28:25 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F3CA15804DD3CACFED9DBE9.dip0.t-ipconnect.de.
	[2003:f0:7f3c:a158:4dd:3cac:fed9:dbe9])
	by smtp.gmail.com with ESMTPSA id
	b15sm2965720wmj.13.2020.01.18.03.28.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 18 Jan 2020 03:28:25 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Jan 2020 12:27:56 +0100
Message-Id: <20200118112757.5287-23-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200118112757.5287-1-schnitzeltony@gmail.com>
References: <20200118112757.5287-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 22/23] gimp: add mime-xdg to inherit
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
X-List-Received-Date: Sat, 18 Jan 2020 11:28:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
index 024534508..718f8998c 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
@@ -25,7 +25,7 @@ DEPENDS = " \
 "
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', d)}"
 
-inherit features_check gnomebase gtk-icon-cache gtk-doc
+inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


