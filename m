Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id E3EFF75463
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:41:48 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id m13-v6so18304940qth.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 06:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=oAgTZ2Q6evuognGDDJbdxWy3lXWsL6ojdI82Q3HvJvY=;
	b=Uf38NQ8Wf+TomlcOgFQlvKwBAC2sxB5rQpbAZl6ZNrHIfzWSdPtBUu0qZTVgI5+Ej9
	q3DK7oUFXJB66iufppyK7+edbXFMYdraxSdQO1tp4HBJ19H/StDfqe1JZVjKTrRii6Mv
	UU4UO5pGnvuka3KlXNaDnh63hgFStCDg4oObug0yJL8qD2VYQ98YpmSz0JJ9eQmblvZ3
	ufz2eLIOM+fit0IfUZ0ho9I3nHn8DGghgSXFPcGtDd37mmPFzlg7+As7K83JWNkVX9ph
	7aLZtxGoQV3oH6izvC5B752IsEhP85jZGBUFF7K0+xd0SHoLnx292mgquDQ/0y7MiRqf
	cAcQ==
X-Gm-Message-State: APt69E2cknmcpBLwsqBay2Y5jfcYchAKtNVi1ABIKQ/GBG7dSQKEg6ln
	aRfi1RL+VJyM9U7dfQoNiypYy/fr
X-Google-Smtp-Source: AAOMgpd0dF6ziqJaaMrriPgMdL96PoolUH/comTsPT97hMAT35ZhRRQwpFNholbs4TzElv0PTaEWhw==
X-Received: by 2002:aed:2457:: with SMTP id
	s23-v6mr23245119qtc.366.1531230109422; 
	Tue, 10 Jul 2018 06:41:49 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	w79-v6sm14896775qkw.35.2018.07.10.06.41.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 06:41:48 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 09:41:37 -0400
Message-Id: <1531230097-15796-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pandas: update to version 0.23.3
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
X-List-Received-Date: Tue, 10 Jul 2018 13:41:49 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pandas.inc                 | 4 ++--
 .../python/{python-pandas_0.23.1.bb => python-pandas_0.23.3.bb}       | 0
 .../python/{python3-pandas_0.23.1.bb => python3-pandas_0.23.3.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pandas_0.23.1.bb => python-pandas_0.23.3.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pandas_0.23.1.bb => python3-pandas_0.23.3.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pandas.inc b/meta-python/recipes-devtools/python/python-pandas.inc
index 9b8e4dc..8b4914f 100644
--- a/meta-python/recipes-devtools/python/python-pandas.inc
+++ b/meta-python/recipes-devtools/python/python-pandas.inc
@@ -6,8 +6,8 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=ee0470f2de336c370a71c2f8d5e81c11"
 
-SRC_URI[md5sum] = "95554bdc5991831030055dc26393554f"
-SRC_URI[sha256sum] = "50b52af2af2e15f4aeb2fe196da073a8c131fa02e433e105d95ce40016df5690"
+SRC_URI[md5sum] = "ed532e0cdc2aebe190f01e2ae84162f6"
+SRC_URI[sha256sum] = "9cd3614b4e31a0889388ff1bd19ae857ad52658b33f776065793c293a29cf612"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-pandas_0.23.1.bb b/meta-python/recipes-devtools/python/python-pandas_0.23.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pandas_0.23.1.bb
rename to meta-python/recipes-devtools/python/python-pandas_0.23.3.bb
diff --git a/meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb b/meta-python/recipes-devtools/python/python3-pandas_0.23.3.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pandas_0.23.1.bb
rename to meta-python/recipes-devtools/python/python3-pandas_0.23.3.bb
-- 
2.7.4


