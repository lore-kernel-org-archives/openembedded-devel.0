Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6D0ED7809C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:31:57 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id c15so7510948qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=j3jnvqEXQtdXNRnSJwLpsSjSxlP+4EANSROKRqr8rBA=;
	b=bfkECa6AUa/Ee+uYbL+4ZkhDk6KRJ3XPZtf9EQ2pAwbBiNVEN1ZxtkeTKpfNNUhgln
	p8gex2VNqDNFyErhQD/SsmTpAbxpplICWgXiOUTU4lS7BPcFKHmP9dW9cVipBmwnwctr
	QJGrrM57bVHIBHbQGnGodPI2Qdl5YvhfmAY2Dvq2oEXwBevmpy04AIi8ourukAY+xICk
	+vGzPCreJJrmSRbQXIDJ+i4rxZzX4JedX9/24jcu0FcwN83v62qEl6BkgVSklmaJQK4E
	Ah4bVkeR06qSsLyfsQn4dK+F7sJOycqL99XSx8Dd2jB3HzuIm4Mx1XmUnB2xD1/ueUCb
	r/gg==
X-Gm-Message-State: AHYfb5hOJrGsmg2hFWQOvMmhpCQxwjpHhQaOR4dQflXYj1CdBsgnn52i
	c0p7/WbXMy0Y5m0maeM=
X-Received: by 10.200.56.175 with SMTP id f44mr13684469qtc.315.1502328718662; 
	Wed, 09 Aug 2017 18:31:58 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	i15sm3003987qta.61.2017.08.09.18.31.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:31:57 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:31:50 -0400
Message-Id: <1502328710-7923-2-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502328710-7923-1-git-send-email-derek@asterius.io>
References: <1502328710-7923-1-git-send-email-derek@asterius.io>
Subject: [meta-python][PATCH 2/2] python-cryptography: update to version 2.0.3
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
X-List-Received-Date: Thu, 10 Aug 2017 01:31:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography.inc           | 4 ++--
 .../{python-cryptography_1.9.bb => python-cryptography_2.0.3.bb}      | 0
 .../{python3-cryptography_1.9.bb => python3-cryptography_2.0.3.bb}    | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-cryptography_1.9.bb => python-cryptography_2.0.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-cryptography_1.9.bb => python3-cryptography_2.0.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 9a74e8e..212e649 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -9,8 +9,8 @@ DEPENDS += " \
     ${PYTHON_PN}-six \
 "
 
-SRC_URI[md5sum] = "1529f12fb403c9a0045277cb73df766c"
-SRC_URI[sha256sum] = "5518337022718029e367d982642f3e3523541e098ad671672a90b82474c84882"
+SRC_URI[md5sum] = "24cbdab3fda22be31dd3aef2808f5d2f"
+SRC_URI[sha256sum] = "d04bb2425086c3fe86f7bc48915290b13e798497839fbb18ab7f6dffcf98cc3a"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-cffi \
diff --git a/meta-python/recipes-devtools/python/python-cryptography_1.9.bb b/meta-python/recipes-devtools/python/python-cryptography_2.0.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-cryptography_1.9.bb
rename to meta-python/recipes-devtools/python/python-cryptography_2.0.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-cryptography_1.9.bb b/meta-python/recipes-devtools/python/python3-cryptography_2.0.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-cryptography_1.9.bb
rename to meta-python/recipes-devtools/python/python3-cryptography_2.0.3.bb
-- 
2.7.4


