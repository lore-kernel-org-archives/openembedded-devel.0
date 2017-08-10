Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 763927809C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:31:56 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c15so7510924qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YRADQORPpMd8XcAqqwOYvN1e4/uyCP8cP6U4AnDd1bM=;
	b=ub8kjdO8OX5JOoSOwsxesXuGq7DaI4i/6GvIx0n2Gyp8GIm+2wVQwXiYOd3GaZ9731
	EW43Oa/ZsD/0MoSu6Q4Dy2ZEAwMNZGOhsWdw9JjuZQY0gYkaPnG2NxO3o7H8bHRECNmm
	n9a5l3ETIKzOTLYF+HF1qjjm02XNuAGFgEGydq8OKr3tkHqO78z5IPdhxoeiOddF/av2
	2hHbhUJ4Yv+tEiCIQVB/s7iD5eiGDrg1hcYH6hyiVUBnDq7II4TgvWszj3qGpHA0k04d
	NIucIPdt60QmGJuUcdTahweZe2SJs5HMywTftYi2O2N8eqHw0jgj8uQ+sqLy3jEv6lbp
	cdyA==
X-Gm-Message-State: AHYfb5hcfNHQcAYOP/54hcbclK6O0byKZ/m3hfkFHXsKZgCUNg9n5qfJ
	gu0+HpWrlN2PfnljIQU=
X-Received: by 10.237.34.47 with SMTP id n44mr12887556qtc.263.1502328717352;
	Wed, 09 Aug 2017 18:31:57 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	i15sm3003987qta.61.2017.08.09.18.31.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:31:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:31:49 -0400
Message-Id: <1502328710-7923-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/2] python-cryptography-vectors: update to version 2.0.3
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
X-List-Received-Date: Thu, 10 Aug 2017 01:31:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc   | 4 ++--
 ...yptography-vectors_1.9.bb => python-cryptography-vectors_2.0.3.bb} | 0
 ...ptography-vectors_1.9.bb => python3-cryptography-vectors_2.0.3.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography-vectors_1.9.bb => python-cryptography-vectors_2.0.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography-vectors_1.9.bb => python3-cryptography-vectors_2.0.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 1aa7dfa..02b510a 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -7,8 +7,8 @@ DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-SRC_URI[md5sum] = "85630ca5c06573ef21ec0e7d6f9ba142"
-SRC_URI[sha256sum] = "bbf767727ad1b9d4cb684fb2b36db4cc78bd420fa6999e7e6ca1aab8c30d78f3"
+SRC_URI[md5sum] = "1db4c09062a3a8e1e2d1f5e3e4d752d7"
+SRC_URI[sha256sum] = "beb831aa73663a224f4d7520483ed02da544533bb03b26ec07a5f9a0dd0941e1"
 
 PYPI_PACKAGE = "cryptography_vectors"
 
diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors_1.9.bb b/meta-python/recipes-devtools/python/python-cryptography-vectors_2.0.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography-vectors_1.9.bb
rename to meta-python/recipes-devtools/python/python-cryptography-vectors_2.0.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography-vectors_1.9.bb b/meta-python/recipes-devtools/python/python3-cryptography-vectors_2.0.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography-vectors_1.9.bb
rename to meta-python/recipes-devtools/python/python3-cryptography-vectors_2.0.3.bb
-- 
2.7.4


