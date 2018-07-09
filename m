Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 579F2600BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Jul 2018 18:32:10 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id u21-v6so10223644qku.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2018 11:32:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ePB+izvaIdXHJnliLzKkN1+I9CoPknOHqg/oEj46O0g=;
	b=ZP/lhcfrU6zXlLSDXvtMTprFK9lhMsT4O6t0U+HQiAZSgRC+hpSQ7SjeN2fM0C8LPG
	hFIAfO/WYvra5lOsSQ8S071X3So4+tGdAGRPfZWgPcl3QmegcN++tIw7V64Q9A2r2u5S
	LbYsltZekwxrRwTkTjHShGfBzRZLTH/91n7/ICER7kBl57csjn0P70kWbisdGEiD18Ky
	IIMcjuP+HKI8aY4whlmSg4KhU0eH4t8me4D+w9bSeBIyfwpYOqxp5UDg6u7eZvLdtKzO
	R6mSAKQCrPhAzePhIoPexPiKGK/1gvsydLkmf4BZjz9YRpPE4khjL4Idv+4aRRdf8GT2
	Tcdw==
X-Gm-Message-State: AOUpUlGKfTbDlkbaXXbBPRN2AA0mq0v4X4nnkkvwD3SUdrIGHJBcmoHs
	MVRB553BQ63uNPbLIIZyNvmsmmKB
X-Google-Smtp-Source: AAOMgpeh+xgvx7SqM+6ONXAaA7sKc2TpQiECOr+sZUjPXv76Ajn4MUiaPERX+HUbVY4UUpPsFEZp8Q==
X-Received: by 2002:a37:12d2:: with SMTP id
	79-v6mr4628402qks.299.1531161130913; 
	Mon, 09 Jul 2018 11:32:10 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	t11-v6sm12400391qkt.28.2018.07.09.11.32.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Jul 2018 11:32:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Jul 2018 14:32:04 -0400
Message-Id: <1531161124-17869-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-monotonic: update to version 1.5
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
X-List-Received-Date: Mon, 09 Jul 2018 18:32:10 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-monotonic_1.4.bb => python-monotonic_1.5.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-monotonic_1.4.bb => python-monotonic_1.5.bb} (67%)

diff --git a/meta-python/recipes-devtools/python/python-monotonic_1.4.bb b/meta-python/recipes-devtools/python/python-monotonic_1.5.bb
similarity index 67%
rename from meta-python/recipes-devtools/python/python-monotonic_1.4.bb
rename to meta-python/recipes-devtools/python/python-monotonic_1.5.bb
index 4c5d8ae..01e7b1c 100644
--- a/meta-python/recipes-devtools/python/python-monotonic_1.4.bb
+++ b/meta-python/recipes-devtools/python/python-monotonic_1.5.bb
@@ -2,8 +2,8 @@ SUMMARY = "An implementation of time.monotonic() for Python 2.0 through 3.2"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
-SRC_URI[md5sum] = "29302cd6b1013b3ab0d1ed78e20d22f2"
-SRC_URI[sha256sum] = "a02611d5b518cd4051bf22d21bd0ae55b3a03f2d2993a19b6c90d9d168691f84"
+SRC_URI[md5sum] = "9f81cb0e5966479754453dea2b6822f4"
+SRC_URI[sha256sum] = "23953d55076df038541e648a53676fb24980f7a1be290cdda21300b3bc21dfb0"
 
 inherit pypi setuptools
 
-- 
2.7.4


