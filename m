Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9096171CBD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 13:44:49 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id k31so35888qta.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Oct 2017 06:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xCVUZwmhAUZX7tvw8yyfBv+Khuo1++3UqTa0YvI49oE=;
	b=ZAi+hGxkXWJ4a5/894ZZCl2qxmGx0+2KPzKBain1GvQfYFlTlU/f8JAnuxsSiXyz/b
	8ESDI99XG9EL0IAUA65c1SX5N8E4G7CK9fkKl5xJtUo9Z7ch+9hiJsiE+1LWserSPz9j
	iNPQP0DIEdGhq59fGPpU/vks4S0TtxTfJUBD0mlLJWeyw1iqoXNFb6MriOzMVXsMZ0Ho
	w1n/qi6nHHwBobgOr2Yb9DHoAIw8v6PcBATHIHQHTh8Oh8EYYwBiUQH+/31HTq4hIgxG
	5kLq6xiuDYbIgB58j2j70VGAQ/azircB/eArzS2MEwurd+ZVsXEkTRHn6XYEqvlfb0TI
	y8mg==
X-Gm-Message-State: AMCzsaVIkgsugjAzaQzlUdkMHMAEYpRGPVny21VG8fFpoGXWhIWbW6if
	9o841QuLKl3Ij4GNsB7r7sNvr5HM
X-Google-Smtp-Source: ABhQp+TnhQ5qZFD/vtesULq0lTxuU0W1YqbtZd6NiuzRNfbIBkf+JMrHLlQl5tEzzd8WMY0/3K8niA==
X-Received: by 10.200.43.146 with SMTP id m18mr28333201qtm.99.1508939090571;
	Wed, 25 Oct 2017 06:44:50 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	m39sm1975815qtk.30.2017.10.25.06.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Oct 2017 06:44:50 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Oct 2017 09:44:42 -0400
Message-Id: <1508939082-13107-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1508939082-13107-1-git-send-email-derek@asterius.io>
References: <1508939082-13107-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography-vectors: update to version 2.1.2
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
X-List-Received-Date: Wed, 25 Oct 2017 13:44:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...tography-vectors_2.0.3.bb => python-cryptography-vectors_2.1.2.bb} | 0
 ...ography-vectors_2.0.3.bb => python3-cryptography-vectors_2.1.2.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_2.0.3.bb => python-cryptography-vectors_2.1.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_2.0.3.bb => python3-cryptography-vectors_2.1.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index e9e4019..66b689e 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -8,8 +8,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "1db4c09062a3a8e1e2d1f5e3e4d752d7"
-SRC_URI[sha256sum] = "beb831aa73663a224f4d7520483ed02da544533bb03b26ec07a5f9a0dd0941e1"
+SRC_URI[md5sum] = "54d482b0783fcda5fdd261dc0f1f84a4"
+SRC_URI[sha256sum] = "1d3829bdb7b7822cee85a829fe2e0d2455d69e242186705ef1a9d4d1ab6337df"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_2.0.3.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_2.0.3.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.1.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.0.3.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.1.2.bb
-- 
2.7.4


