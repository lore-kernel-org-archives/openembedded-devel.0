Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id AF93372FC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 00:16:07 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n127so2785824qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 16:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TsaY9C4zrEpJzVHwlgDQ/Lqh0ViW++eysFpX9aGgcDo=;
	b=S3nKyXhwtCqPVzIr8fKx0yJLrQXNTYq0lc6DKh+zXeg8aZt2zDnPUTp1+UFqgM/qCZ
	hBLAY42TBdjtIFDE+zjM4EtqdCu6zzjLISu1R4z9QuDncOBlI27G0ij0kfTeFqHPAmyw
	/AUpYem67tv5pOOThYyFmDNLt2jSy5QuPBezeVPUnXFTGrP0Sejh6pfrRfaeMAJf37V2
	XYBoV/7wHfw7JkIvF6FV0vkq00LYq+xOd8R5gzukvFRID53AUmgGqR6S+jgciwNdYMgG
	nLqYZjDTUoTo16StfonBs9xPo9KzM4okZEGBP6VOl8/OREiy+tErknrjTC0yiLW5pB7E
	k75A==
X-Gm-Message-State: AMke39nv2KnG50jlsZCYYk2fjP+jcpOe0ZdjLrXffCkMR94Y+2er+j+wvLRygGKMVN6KWg==
X-Received: by 10.55.71.149 with SMTP id u143mr12502574qka.81.1487808968981;
	Wed, 22 Feb 2017 16:16:08 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224])
	by smtp.gmail.com with ESMTPSA id q64sm1731069qtd.2.2017.02.22.16.16.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 16:16:08 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Feb 2017 19:15:59 -0500
Message-Id: <1487808959-26234-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCHv2] python-cryptography-vectors: update to version 1.7.2
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
X-List-Received-Date: Thu, 23 Feb 2017 00:16:07 -0000

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


