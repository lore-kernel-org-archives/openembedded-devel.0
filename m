Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 705AC78473
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 17:52:05 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v137so17268547qkb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Nov 2017 09:52:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fXbfJe8g92pTNgXwXqSjC1FeCeX5W2/CINCauK8+6KY=;
	b=bS+RKQ/ysSosrZ+HSmJ7SGjN+KKmd7Qt7YhrgdK1Mkpp5OUFUdBpJfuxqP8Ler3Aep
	X+Wud04gX1BM3Q/kATBAacTUK/yNq6sF9AyPYjc6fRyxhpnRlt0/+F3A2pc1Ac9uunpr
	B7NSgV8p7jdXo/VjmcaQ0GH3dZstonE3gnoGZTokcqQ402yquLdOmkTFzEpFHsBtrojq
	7DBoedUOiqSx+Vd6KoGdZj8gd3QyGBfME8QO5q+6+V3iHlPgtv5C7/1+vnXxhs0gwkab
	T9P+TXPxlFCGbYEuAHKGgCjZXFYjCGFFKfw67Xs1MRqgSP3DzNn5j+1E7SC7JijUUSL+
	tyJQ==
X-Gm-Message-State: AJaThX5cBH+eyYi8FEr+DpOVWAGqOwQcfPcTnm9cN38IuaqGTeZNRekF
	XCSJh/eIe8r5NsSNKLNSZMV5lSYM
X-Google-Smtp-Source: AGs4zMbjulDjG5Mvoz1mcp2UrS2gz72dN10igFvTivDMxqNMi4gf7WQHgvTX4q6f820uGVnu+M3NNg==
X-Received: by 10.55.92.195 with SMTP id q186mr9628661qkb.154.1510509126229;
	Sun, 12 Nov 2017 09:52:06 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	k126sm9496614qkc.69.2017.11.12.09.52.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Nov 2017 09:52:05 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 12 Nov 2017 12:52:00 -0500
Message-Id: <1510509120-18437-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-monotonic: update to version 1.4
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
X-List-Received-Date: Sun, 12 Nov 2017 17:52:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-monotonic_1.3.bb => python-monotonic_1.4.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-monotonic_1.3.bb => python-monotonic_1.4.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-monotonic_1.3.bb b/meta-python/recipes-devtools/python/python-monotonic_1.4.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-monotonic_1.3.bb
rename to meta-python/recipes-devtools/python/python-monotonic_1.4.bb
index ee91d18..4c5d8ae 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_1.3.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_1.4.bb
@@ -2,8 +2,8 @@ SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "34351251d1a67667a25cd7673d2e44bf"
-SRC_URI[sha256sum] = "2b469e2d7dd403f7f7f79227fe5ad551ee1e76f8bb300ae935209884b93c7c1b"
+SRC_URI[md5sum] = "29302cd6b1013b3ab0d1ed78e20d22f2"
+SRC_URI[sha256sum] = "a02611d5b518cd4051bf22d21bd0ae55b3a03f2d2993a19b6c90d9d168691f84"
 
 inherit pypi setuptools
 
-- 
2.7.4


