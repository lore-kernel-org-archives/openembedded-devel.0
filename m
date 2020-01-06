Return-Path: <nick83ola@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 9D3C67F89D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 15:47:46 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id j42so50098333wrj.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 07:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9tdQ0VhRQhtkW/yQbLSbhRxari1O2AfAXAGAaRAQfcg=;
	b=NqZYdV89fo/iRB2pQqpV18EktBBjhvo1ygXVFgfzfvvsoDUmjOzBaxZCrzsaX+lYlX
	ZA0ZOlxcyVXxY5npCv48cRJy+I9WN3qPXXj8QMvG6iV6Z7ZWQ7l3SjEumpk/nimwNzJl
	6Nk1uSbAkwSx9AE+n4re4BiL7Vn6/+rOYqNIGt70gbWgeYqwt6xXd9XQgT6jnwHMA3Wx
	5q48mINf8Bb6NvkXrnQMG3qxZpdTkbt/KbjVNgqM65pMcJ1nOYwyceTMqBvJs/nLY9oW
	o/Al6XEIiLPvfjM8YXDqRZoMrZKK2GAdw8dvn6BxIzrqWqP5Bzf/u7ku0X07UlkoyflM
	6RaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=9tdQ0VhRQhtkW/yQbLSbhRxari1O2AfAXAGAaRAQfcg=;
	b=hfeVGf3Df0ddGNxVD4eSDkgskjF/DWYOxEImjJElcrH632rTso7yscRHXbvxHhwM4n
	eTdlLeIww5vvDmVdKa19CNAfxc/BGmZtg+SDfIdC/fcT3pr12lvlwyP4D3f0EZnEY1J0
	eK9U4kNJ5bnFHq72B/79452motEsf+18DLI4dPPp3A0PgHp7EwEt9MhjESidO98k+uEN
	JnmIczwKqBX3PChy3xjU0Da/88dDpKpFk8wbDYLbJKYK3+BwAEW173feBvQurGWK/5/c
	CbWiuZyAofWar9+1bbchMNtp6jyWya93nOESk/CEmzAzQeCh5UHO1TorEz9qtYixpORP
	LcZQ==
X-Gm-Message-State: APjAAAWFcjZKLD4r7DDTi8Ia3RKyC7KMbyN/5o/gaHkk1wI3fpjMCaig
	pzt6G82l9Tic0TTCKdNGAOjWuZHRQB0=
X-Google-Smtp-Source: APXvYqyORr0eWn8gaQWXBJqJUL0R3pAFK5Oym5TePXCB8nmW9GE9Z2Pcyh8ngK9wbRAiTwb1aag1Sw==
X-Received: by 2002:adf:e984:: with SMTP id h4mr101418950wrm.275.1578325666912;
	Mon, 06 Jan 2020 07:47:46 -0800 (PST)
Received: from nick-bbestie.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id c4sm23192715wml.7.2020.01.06.07.47.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 07:47:46 -0800 (PST)
From: Nicola Lunghi <nick83ola@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 15:47:19 +0000
Message-Id: <20200106154718.6095-1-nick83ola@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-jsonrpcserver: update to 4.1.0
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
X-List-Received-Date: Mon, 06 Jan 2020 15:47:46 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
---
 ...-jsonrpcserver_4.0.5.bb => python3-jsonrpcserver_4.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcserver_4.0.5.bb => python3-jsonrpcserver_4.1.0.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
index bf9eb0a1c..c0b06b316 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.0.5.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcserver_4.1.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/bcb/jsonrpcserver"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c89120516900f96f4c60d35fdc4c3f15"
 
-SRC_URI[md5sum] = "d41e9f6b310cb29b0d8f213ff9d57567"
-SRC_URI[sha256sum] = "240c517f49b0fdd3bfa428c9a7cc581126a0c43eca60d29762da124017d9d9f4"
+SRC_URI[md5sum] = "c1cc652bdeb04b8ce3ad962fbab34daf"
+SRC_URI[sha256sum] = "3a35c0ef21174ca98f995f99688cebadda97053785833fbb31ec862d6b157f6d"
 
 inherit pypi setuptools3
 
-- 
2.20.1


