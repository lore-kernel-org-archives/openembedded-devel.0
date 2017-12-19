Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1B23B600EB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 16:15:07 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id f2so24792777qtj.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Dec 2017 08:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=63ENS20PdlkGEDtLf9AVNYxFeKPoulWblKgJERI3SYU=;
	b=PpJr4CvrmZ0iO6I+4dHWPk7ZXw0YADt0KHsyHZMLv0SxLYbWlnsf2xYbcANko8rsRY
	9hZtJklyfVFX8afsO/CsJCGBF7t73I2vbBturOHlKQ2oPqwpOCwlTu7jU+N2oKznT5zh
	6hJ73b4rS62+IRr3zag37vpNe7LyKHorA3pxKeEMyCHaPNab2nm+nUnmVp7exFK6yfW2
	QdHopkiqRc2U1+dlvN9CfETCJ6Lrs+gsdBtl/s6UEafx5c/ukgFi6Ty1LCfTHMsJIB7a
	SMa9VNxk7K8MhN12Kn98VmgUeCYswAR87mqCtgf1atEBouBz/91XiYOcOOkR0rbr/rPn
	yrxQ==
X-Gm-Message-State: AKGB3mLgoeHTNyfgskUzrLWkCEuZY9BWkVmUsETW1Tc05OMLK9n6Vw7W
	E5koWRe9U3txvVuDgVn1ANyxFEN3
X-Google-Smtp-Source: ACJfBosuKEnotTSGS/krYQ1s4d6e7MqEb60NGsygR8swjeCb6HGd2hf7dQEDAQ6mOS5U3yrVUF+KKw==
X-Received: by 10.200.8.11 with SMTP id u11mr5917095qth.315.1513700108176;
	Tue, 19 Dec 2017 08:15:08 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b47sm10004058qtb.89.2017.12.19.08.15.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Dec 2017 08:15:07 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Dec 2017 11:15:00 -0500
Message-Id: <1513700100-1658-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513700100-1658-1-git-send-email-derek@asterius.io>
References: <1513700100-1658-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography-vectors: update to version 2.1.4
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
X-List-Received-Date: Tue, 19 Dec 2017 16:15:07 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...tography-vectors_2.1.3.bb => python-cryptography-vectors_2.1.4.bb} | 0
 ...ography-vectors_2.1.3.bb => python3-cryptography-vectors_2.1.4.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.1.3.bb => python-cryptography-vectors_2.1.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.1.3.bb => python3-cryptography-vectors_2.1.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 922ef5a..00bb87b 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "32e8bd5d5f6a9329a6753dabc8db1e5b"
-SRC_URI[sha256sum] = "2de4957fdfd567d69e179d6e9ecf54a085387c953e20abf97a35a5c313aa3053"
+SRC_URI[md5sum] = "ef115b870cc8d8b9f0f4189b512bc170"
+SRC_URI[sha256sum] = "78c4b4f3f84853ea5d038e2f53d355229dd8119fe9cf949c3e497c85c760a5ca"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.3.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.3.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.3.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.4.bb
-- 
2.7.4


