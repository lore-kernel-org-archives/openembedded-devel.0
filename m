Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 256BC7CED3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:22:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z3so48852030wru.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jan 2020 01:22:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rT9pG3nU7FOSRHQv8iRLVeFketeuWGcO77qpW4UzVzw=;
	b=r9uxkoIEl27tRE2qAnDWb7Vmhv7YKnIxXvZpZYYZ3M1WAVSZhZWAdnTeG7NNNW5H3C
	n418TGQe5uT4bZ5XR6ODL35eRVoBkKtH9P0cUfOziGj7Mt84MeOazDxu15XUjytIMX9P
	U8hxmViDezCpeHh8RMmeGblEtdX9Yj1E8xVwEvBWVH51T3IgMDBybs9bU3leV392+u9o
	nEP1La7IBZp+YhgwOQMletuht86y8qoCFjl2uNKGQQzeancEAOBVlJp1KN2qBYtDhBIg
	VPfwTZEAaFDX03U869rC8h6s00LOl9zIv/I6xn20+i6m7e8d+Z1ONHFQE/Lb+PYtwptW
	XJhA==
X-Gm-Message-State: APjAAAXLHjn2GUEO1DZfpm5gX0G102VhutNqa6QjmWYjOrnsH9nS0oiR
	rBInF5PAb82bXHa9bcPH6IP8B7ao
X-Google-Smtp-Source: APXvYqwprTmz5DKSKk45XoZtoUY2AQCfpXwdipTvnXXQa6sq0h7bBqAijRVHCjcgVdvDtSoMgvMsAg==
X-Received: by 2002:adf:e3c1:: with SMTP id k1mr98835974wrm.151.1578302550692; 
	Mon, 06 Jan 2020 01:22:30 -0800 (PST)
Received: from 1aq-andre.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	b67sm22519383wmc.38.2020.01.06.01.22.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 06 Jan 2020 01:22:30 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jan 2020 09:22:29 +0000
Message-Id: <20200106092229.13686-1-git@andred.net>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python3-jsonrpcserver: update to v4.1.0
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
X-List-Received-Date: Mon, 06 Jan 2020 09:22:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: André Draszik <git@andred.net>
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
2.23.0.rc1


