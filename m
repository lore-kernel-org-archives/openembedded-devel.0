Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.13046.1586703822395294647
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Apr 2020 08:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=O3qw1bYL;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id A831F60386;
	Sun, 12 Apr 2020 17:03:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586703819;
	bh=TDOthMdc8YXV7ky7wKzGY+dOo/px7p4ylpQra2ExzOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O3qw1bYLFZcDbPZ5X3tRPngejF3+9qdPb4bB/RtJHfGMRLQKhB1oe4XEH57DuCBo+
	 lUQ1YWTTcTVxxUXfyXHhkfnV1dj/uS7IESSQFyY4rDB3RikNERV2xud6FQq1UIKH+I
	 NrC1TGsgrk49IlFm+rMfyhHLqplrb0qK0mMa2HHhBELUQuSKHtNNXfZy3IslGZO/0a
	 4xWJpP9Q/ozqXLMTcCKHimUdYMeFiH4PZmI+dmcQ82q1+HjVAjEe4bCeorhFOWyiqj
	 FWp6F0MI4SRKn6DGPyPt9zLO3d3UMqyPrwWW2cIZQSjI3onNIii5AZ10H5DcUKWszz
	 NonkRfvsU1njw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-python][PATCH 2/5] python3-waitress: upgrade 1.4.2 -> 1.4.3
Date: Sun, 12 Apr 2020 17:03:31 +0200
Message-Id: <1586703814-15536-2-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>
References: <1586703814-15536-1-git-send-email-pjtexier@koncepto.io>

This is a security release:

 - In Waitress version 1.4.2 a new regular expression was added to validate the
   headers that Waitress receives to make sure that it matches RFC7230.
   Unfortunately the regular expression was written in a way that with invalid
   input it leads to catastrophic backtracking which allows for a Denial of
   Service and CPU usage going to a 100%.

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 .../python/{python3-waitress_1.4.2.bb => python3-waitress_1.4.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-waitress_1.4.2.bb => python3-waitress_1.4.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb b/meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
index 257993f..8ac3e92 100644
--- a/meta-python/recipes-devtools/python/python3-waitress_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-waitress_1.4.3.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 LICENSE = "ZPL-2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=78ccb3640dc841e1baecb3e27a6966b2"
 
-SRC_URI[md5sum] = "fdeed7ec32bbba011e90801208378c89"
-SRC_URI[sha256sum] = "67a60a376f0eb335ed88967c42b73983a58d66a2a72eb9009a42725f7453b142"
+SRC_URI[md5sum] = "4bffad7009d3824ae61ea6c0696e45f6"
+SRC_URI[sha256sum] = "045b3efc3d97c93362173ab1dfc159b52cfa22b46c3334ffc805dbdbf0e4309e"
 
 inherit setuptools3 pypi
-- 
2.7.4

