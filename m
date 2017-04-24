Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id D7A4C71D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:26 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id x188so13076284itb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zMANIstmrrXFmdg17AgGAlzNaU0VmVsh12vuCQhS84E=;
	b=bKUXv/dY7Qe4Y9cEuMIb8WmiUStSqhmZFD5QxtkE9TNx8z1yDVrz4u2Pxq1vYJCkKl
	0iic2K/MdvKkNSREDSQcNtExR6WIeUDhKzFtt8p7bGNie+R5/cAL3hw1lD39cd/Fobkj
	9G9Q8ADYOR49SlMxJN0YhLFGbwIDSWctqz20aqFN6DRSLFcb4kvcLxDwUinpMfr761c+
	itS2EgqypbZFUOJtF3QkK93CjoOthTQ7fhGokkEoE3+tYN836HibhjrRjO15sjbV1uqU
	/aUfSSdm108G9IS97NpqO3QCvOY+VfQr7BO3pwdOeaLzOYgW4EnnkT9v2V6dsmo4n3P9
	CrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zMANIstmrrXFmdg17AgGAlzNaU0VmVsh12vuCQhS84E=;
	b=OKPLwVaIzyT6+AFOa4gs17cLq+dxKJx1MbgeN0SYC3GPJwvd3cR/7VzuztAKVwOPdJ
	/pIvHLb4F16jeg83hCyo9U3cpR928VcJT/iqSHYE2xHX2Keww0RifzCM+eXY+Wq9wtEh
	i45b6A489XFjULlDXmkaYV/qlgdrFQxEBhdw1PfSViXTCRpV1S1wv5pR+eXNX5qKj8EO
	FH1Xfa40SNG4COTGYYz8089nk/LYB2icVodGYthhsN+QdFQkxKsaLjeaqlA1XSIMSf5s
	eIrZf3B0EaYgZP1URHnyZvR6QLIkheXxVzlnITKwiWUr+j6P2s12UfR3G8zKIPXyHc/r
	lANA==
X-Gm-Message-State: AN3rC/77EQAy51mtiDwQfDCMoAS3gDR84zuvqSVPF/AfIq+MdvyGkg4k
	vec/6V2P96SyQA==
X-Received: by 10.84.129.4 with SMTP id 4mr30758997plb.37.1493011288072;
	Sun, 23 Apr 2017 22:21:28 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:51 -0700
Message-Id: <20170424052058.4952-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 10/17] memcached: Upgrade to 1.4.36
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../memcached/memcached/redundant_comparison.patch          | 13 -------------
 .../memcached/{memcached_1.4.33.bb => memcached_1.4.36.bb}  |  8 ++++----
 2 files changed, 4 insertions(+), 17 deletions(-)
 delete mode 100644 meta-networking/recipes-support/memcached/memcached/redundant_comparison.patch
 rename meta-networking/recipes-support/memcached/{memcached_1.4.33.bb => memcached_1.4.36.bb} (87%)

diff --git a/meta-networking/recipes-support/memcached/memcached/redundant_comparison.patch b/meta-networking/recipes-support/memcached/memcached/redundant_comparison.patch
deleted file mode 100644
index ed86ffae4..000000000
--- a/meta-networking/recipes-support/memcached/memcached/redundant_comparison.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: memcached-1.4.33/items.c
-===================================================================
---- memcached-1.4.33.orig/items.c
-+++ memcached-1.4.33/items.c
-@@ -148,7 +148,7 @@ item *do_item_alloc(char *key, const siz
-     uint8_t nsuffix;
-     item *it = NULL;
-     char suffix[40];
--    if (nbytes < 2 || nkey < 0)
-+    if (nbytes < 2)
-         return 0;
- 
-     size_t ntotal = item_make_header(nkey + 1, flags, nbytes, suffix, &nsuffix);
diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.33.bb b/meta-networking/recipes-support/memcached/memcached_1.4.36.bb
similarity index 87%
rename from meta-networking/recipes-support/memcached/memcached_1.4.33.bb
rename to meta-networking/recipes-support/memcached/memcached_1.4.36.bb
index da9a693ac..48c3c9ee2 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.4.33.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.36.bb
@@ -20,10 +20,10 @@ RDEPENDS_${PN} += "perl perl-module-posix perl-module-autoloader \
     "
 
 SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
-           file://redundant_comparison.patch \
-           file://memcached-add-hugetlbfs-check.patch"
-SRC_URI[md5sum] = "2d7f6476283cd36e21e521d901d37a8f"
-SRC_URI[sha256sum] = "83726c8d68258c56712373072abb25a449c257398075a39ec0867fd8ba69771d"
+           file://memcached-add-hugetlbfs-check.patch \
+           "
+SRC_URI[md5sum] = "1e028fbab7288911fcaa5ed2a21817fe"
+SRC_URI[sha256sum] = "773b6bb20bf80223ca6a15d75f570fbab346ad11ec98595e5af5e33f54bd82d8"
 
 # set the same COMPATIBLE_HOST as libhugetlbfs
 COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'
-- 
2.12.2


