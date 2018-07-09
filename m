Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 32E5D71BB9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 18:44:35 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id a5-v6so1711889qtp.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 11:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JFVO68gvCqEwcs+l7p+MulQJZhhz39k6pGVubv2jw0Y=;
	b=OfkZFQVTF9tIDcJ18kUIRVLrg/jN7Mh5p71CRfFDOqP0JqbuS9yi47GV+w0yMzcJ3Y
	2c3BSaZOWj7FDHKC/8MJaqXgp093+7RqDG1jN04+fKTTuF283RhBYpS6NLgfrXGqxfa1
	IO9O806CeplrgApRHzk+Z0T5jmAyLbJtvg58jCUDygbrRtp2oVKGXWAL/fqJxHjcSrsT
	y/8A5ExCRVe1QneiljV6BEgwfTevWIRhYQnKeAQksRoR1g1mf7tIebjGk1yoY28al1gm
	TE0h7jf76+PtYjKK3NgZ9zG55SjT2b5+oq2wKQJuSH8DLQlil1ifHuVsXC3+oOsU7n/M
	SAsw==
X-Gm-Message-State: APt69E1UmfhBZMTPdzkR6Zp1zOxErWvqPQHprpC6e3fwrZ+5FtwemZXN
	Q9nVViEdi954+HpK7K1hT2oNMyLu
X-Google-Smtp-Source: AAOMgpfwu7FSb2ELxRiMS+V2OJcIyUCeFh7SMWU9iBCwsoS+84wVjlqb2UQAehIILgdTUvc/dTj3Gg==
X-Received: by 2002:aed:3aa4:: with SMTP id
	o33-v6mr20321353qte.19.1531161875744; 
	Mon, 09 Jul 2018 11:44:35 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	t1-v6sm631096qkf.16.2018.07.09.11.44.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 11:44:35 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 14:44:29 -0400
Message-Id: <1531161869-19365-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-bitarray: update to version 0.8.3
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
X-List-Received-Date: Mon, 09 Jul 2018 18:44:35 -0000

License-Update: LICENSE was removed and only PKG-INFO remains in this release.  Update the checksum

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-bitarray.inc             | 6 +++---
 .../python/{python-bitarray_0.8.1.bb => python-bitarray_0.8.3.bb}   | 0
 .../python/{python3-bitarray_0.8.1.bb => python3-bitarray_0.8.3.bb} | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-bitarray_0.8.1.bb => python-bitarray_0.8.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-bitarray_0.8.1.bb => python3-bitarray_0.8.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-bitarray.inc b/meta-python/recipes-devtools/python/python-bitarray.inc
index 38a22f6..480f048 100644
--- a/meta-python/recipes-devtools/python/python-bitarray.inc
+++ b/meta-python/recipes-devtools/python/python-bitarray.inc
@@ -1,10 +1,10 @@
 SUMMARY = "A high-level Python efficient arrays of booleans -- C extension"
 HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3ba469353f9f2a244b2075902351e37d"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=f4ce1ae80a385140f0ddb2bcef410b06"
 
-SRC_URI[md5sum] = "3825184f54f4d93508a28031b4c65d3b"
-SRC_URI[sha256sum] = "7da501356e48a83c61f479393681c1bc4b94e5a34ace7e08cb29e7dd9290ab18"
+SRC_URI[md5sum] = "f3131ac2a277f3b70dbb6132ca8f8889"
+SRC_URI[sha256sum] = "050cd30b810ddb3aa941e7ddfbe0d8065e793012d0a88cb5739ec23624b9895e"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb b/meta-python/recipes-devtools/python/python-bitarray_0.8.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-bitarray_0.8.1.bb
rename to meta-python/recipes-devtools/python/python-bitarray_0.8.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-bitarray_0.8.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_0.8.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-bitarray_0.8.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_0.8.3.bb
-- 
2.7.4


