Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 598386E672
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:02:47 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id w6so4964134qkb.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 05:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OpY2bO1W2Qs0I6VpWkvUEsdPK+PSROh2sTqA+uH8OeE=;
	b=gF1RRhrHWpwQYM/jYpTTvETmjAU69kfRWiUoE5e5U569OQ9BjeQ6ANPYFBjKh8sJFi
	1b3OTXWha9+f13htbisRVwK/WS47uSKqsTz1QDHcgT0KcB9gZau/n6otKVmEOgiKVytn
	5Eew0HfnkAZOJH7av0ovTvknX/XDX9Y6GD3V+9irqEAffP4/FU/3g1LqBQT1X3kzmaxG
	B0ce1HEw3oJt4co42+Ftyi40R9e0Do59RsxOQRsWqICyVWZbxs4f9KdH80gpqUQUEL9F
	s2RNA2gIXATm1hqkYR90DYdAqn3EBW8Zbp9gjAqAzfmE1YgjtEtnyZdsJDqvApv9EhOI
	Hv6g==
X-Gm-Message-State: AElRT7F10gt4tHK2KCIYjYY9KvJD+2Q9K48EEmk8C6XPMhT9BCQ/Es/a
	Wx/uzZ87vGUhStIRRTPuSZPc1eHE
X-Google-Smtp-Source: AG47ELsn6f4AjGsQvkgzhIGWgSKxhP3Tua9evnJqKXqzhmq2g9nxFrxF3ODizMGGBPg0cGIPlHgRww==
X-Received: by 10.55.22.207 with SMTP id 76mr15139342qkw.305.1521460967960;
	Mon, 19 Mar 2018 05:02:47 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	f17sm1735586qtk.21.2018.03.19.05.02.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Mar 2018 05:02:47 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 08:02:43 -0400
Message-Id: <1521460963-30813-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyjwt: update to version 1.6.1
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
X-List-Received-Date: Mon, 19 Mar 2018 12:02:48 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyjwt.inc                  | 4 ++--
 .../python/{python-pyjwt_1.6.0.bb => python-pyjwt_1.6.1.bb}           | 0
 .../python/{python3-pyjwt_1.6.0.bb => python3-pyjwt_1.6.1.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyjwt_1.6.0.bb => python-pyjwt_1.6.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_1.6.0.bb => python3-pyjwt_1.6.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyjwt.inc b/meta-python/recipes-devtools/python/python-pyjwt.inc
index baecc39..9f9282e 100644
--- a/meta-python/recipes-devtools/python/python-pyjwt.inc
+++ b/meta-python/recipes-devtools/python/python-pyjwt.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=68626705a7b513ca8d5f44a3e200ed0c"
 
-SRC_URI[md5sum] = "3c3762c88b210763a311a5db06aa7d6f"
-SRC_URI[sha256sum] = "9c3016e4a292151c5396e25cc0c28c4e1cdf13fa19118eb84f500f9670e3f628"
+SRC_URI[md5sum] = "f7dbe0d62f2087a7605946aeeca02541"
+SRC_URI[sha256sum] = "dacba5786fe3bf1a0ae8673874e29f9ac497860955c501289c63b15d3daae63a"
 
 PYPI_PACKAGE = "PyJWT"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-pyjwt_1.6.0.bb b/meta-python/recipes-devtools/python/python-pyjwt_1.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyjwt_1.6.0.bb
rename to meta-python/recipes-devtools/python/python-pyjwt_1.6.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_1.6.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_1.6.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyjwt_1.6.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_1.6.1.bb
-- 
2.7.4


