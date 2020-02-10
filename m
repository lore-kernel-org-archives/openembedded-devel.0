Return-Path: <straka.derek@gmail.com>
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
	[209.85.210.43])
	by mail.openembedded.org (Postfix) with ESMTP id A503F60EE7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 01:11:03 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id r27so4743305otc.8
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 17:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jyo50qP+szpcjk3HbjMGl2Imku9fPZN+ms5uxERpw7c=;
	b=lsubVdzD6cu9a8RRjbOTgUOGHUtqW+QTX2ac9u1HnFLxvpM4NJcgLvsxrL1r0OlPTZ
	5tP3DZTHNnGBvQKs6JcalCAkROMJcZXbll73T/Px1PIBFZE1qpF16W+1+jY/LxRMC8D6
	7EKxA9Af6lAfGu8HIF18cW4xTxWxP8qP6xubG7esxlHdSKkEbXO3dvFQT8BVzfbItJtC
	lE/30DhEX4FKUKaMLyAxlt8t7Ti9PAHxwYQitpRthKfssPe3qmbM2Z0jVdsSjB7iXh2K
	/sFxm3j5s3hh/aMx81A9xaQifi9lBWBoJ1x6M9iI/dbqir4PJbyvX8onB+S83eMFjbSa
	17ug==
X-Gm-Message-State: APjAAAUwnJ1xtfNLz620jLmy8FyDBUKtq0Rj2OLYnjE0hQNaxO/VOisJ
	Laa1TGXWHbh45DsznBml05aXEE5CwmA=
X-Google-Smtp-Source: APXvYqwlAAuB4sbwYBHy19h+tmVSitK6lvjzpUB8Obs8Xv+NEh9w+CSabBUs9hcDVhF6ul2XkZER5A==
X-Received: by 2002:a9d:518b:: with SMTP id y11mr7978447otg.349.1581297064324; 
	Sun, 09 Feb 2020 17:11:04 -0800 (PST)
Received: from sparta.lan1 (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
	by smtp.gmail.com with ESMTPSA id
	c21sm3448996oiy.11.2020.02.09.17.11.03
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 17:11:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 20:10:47 -0500
Message-Id: <20200210011047.18827-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200210011047.18827-1-derek@asterius.io>
References: <20200210011047.18827-1-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python3-babel: upgrade to version 2.8.0
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
X-List-Received-Date: Mon, 10 Feb 2020 01:11:03 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-babel_2.7.0.bb => python3-babel_2.8.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-babel_2.7.0.bb => python3-babel_2.8.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-babel_2.7.0.bb b/meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-babel_2.7.0.bb
rename to meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
index 45ff948736..c69098b226 100644
--- a/meta-python/recipes-devtools/python/python3-babel_2.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-babel_2.8.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=942469df9305abb1c59e95f778310384"
 
-SRC_URI[md5sum] = "83c158b7dae9135750a7cf204e6e2eea"
-SRC_URI[sha256sum] = "e86135ae101e31e2c8ec20a4e0c5220f4eed12487d5cf3f78be7e98d3a57fc28"
+SRC_URI[md5sum] = "6fad9772e75421969ddb41975483abdf"
+SRC_URI[sha256sum] = "1aac2ae2d0d8ea368fa90906567f5c08463d98ade155c0c4bfedd6a0f7160e38"
 
 PYPI_PACKAGE = "Babel"
 
-- 
2.17.1


