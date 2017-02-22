Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 35B2E73155
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 17:25:16 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n13so1252652qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 09:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TsaY9C4zrEpJzVHwlgDQ/Lqh0ViW++eysFpX9aGgcDo=;
	b=oSaGfE6czddgvKPbKnuyHZeTG2v0Jb6wa9ee0By/TJqJUgsQ91BghwYBeV4Cg3q2iV
	jYyh+b61my28FX/+OZomzCI4iB0HS8XVsvS1HVPfAgGSOTnr9y3gypdufAOf+W2Ebdci
	du0QqRAykENWBFjwFBtt1q9McbLF7RVWEvswU1i2ealWvXegLo3Ebv+D/TNAcIyCOUv7
	N8jMUd1jhzIapX4svrH93tHYvQLbZX6vEfLJSJvpjpBGlDSvW6fXgI4A6vjq2tg27tGy
	SIez3sYbyje8wsR8xDtHYa9ncY4rI/vbZU/mvfGTFk96ypJ8rUNLcR09lME1ZN25XgyS
	ebnQ==
X-Gm-Message-State: AMke39mGkMwDAfqBrTMq6L+OKPUFGA8mWWDsAWNn+T3Voy7EKpjqEEu+B2FwH+ZNuSCG1w==
X-Received: by 10.200.42.227 with SMTP id c32mr31049088qta.70.1487784317882;
	Wed, 22 Feb 2017 09:25:17 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id u43sm703405qtc.11.2017.02.22.09.25.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 09:25:17 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 12:24:54 -0500
Message-Id: <1487784294-28547-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487784294-28547-1-git-send-email-derek@asterius.io>
References: <1487784294-28547-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography-vectors: update to version 1.7.2
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
X-List-Received-Date: Wed, 22 Feb 2017 17:25:17 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...yptography-vectors_1.6.bb => python-cryptography-vectors_1.7.2.bb} | 0
 ...ptography-vectors_1.6.bb => python3-cryptography-vectors_1.7.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_1.6.bb => python-cryptography-vectors_1.7.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_1.6.bb => python3-cryptography-vectors_1.7.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index fc10cb2..aa35f74 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -7,8 +7,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "d7d53f061366394267be444fa84cfe89"
-SRC_URI[sha256sum] = "01ccb07c95d128a70732f274bd16af479bcc344e43cac745d2b9ec4ab71ff675"
+SRC_URI[md5sum] = "c3f2a66d71a0413879d4dd001c56de95"
+SRC_URI[sha256sum] = "4be4eee8a11deee5c2f00e389b49de8ce2642130282d1cd0adffb2f7dbe0acdc"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_1.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_1.6.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_1.7.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.7.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_1.6.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_1.7.2.bb
-- 
2.7.4


