Return-Path: <straka.derek@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id 58B8E6FF97
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 13:05:21 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id c67so8515156qgc.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Mar 2016 06:05:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=lRkq9k0sxChNH0BWz/sQbJzGl6nljHE36pU9g4I72qU=;
	b=WiWwrBmQS0l7RJcNvOHGZSEAA6xpnxv/Lo+yYBbnm/zw5v8o6yWFvtWgkyR7zzpOon
	sxSPSeq2PcZkt+ErxnoJ1D+RwSK++2/hgJyG8nEFGJVdTSSRfiY1RmjUyWV3TE2Jhmvi
	9EDAiVmhrR+6+e3D7+e91qiuW4kT78KTvuOevhEEZkW8cGuqftWEKYiKWs6V6QAzrzqM
	1VN+OW9IiQ4VJ5GISNFs0h61yVNnuGdedVvRkOwyQivyJPrRyBOOcv9BklNMGr0HdaQs
	1QycYtWY/dzyDjKUcBWEw53YcOkoDqB8KcO9Ofsz+h4/R3VqGN9TvTGZ/h3m1Dc6dpMk
	MUEw==
X-Gm-Message-State: AD7BkJIYEAVC/7Z9BMl/o49GLh/4ZipdWHBNRUqcPH9jDSfkdtEuhoH1ZZB3c5pftPbeCA==
X-Received: by 10.140.156.138 with SMTP id c132mr24885007qhc.96.1458997522116; 
	Sat, 26 Mar 2016 06:05:22 -0700 (PDT)
Received: from build-slave.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x6sm7678649qka.16.2016.03.26.06.05.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 26 Mar 2016 06:05:21 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Mar 2016 09:04:42 -0400
Message-Id: <033649d114a2a57f79806282948035db46d67eb5.1458997082.git.derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
In-Reply-To: <cover.1458997082.git.derek@asterius.io>
References: <cover.1458997082.git.derek@asterius.io>
Subject: [meta-python][PATCH 22/30] python-pyflakes: update to 1.1.0
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
X-List-Received-Date: Sat, 26 Mar 2016 13:05:21 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pyflakes_1.0.0.bb => python-pyflakes_1.1.0.bb}   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyflakes_1.0.0.bb => python-pyflakes_1.1.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python-pyflakes_1.0.0.bb b/meta-python/recipes-devtools/python/python-pyflakes_1.1.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python-pyflakes_1.0.0.bb
rename to meta-python/recipes-devtools/python/python-pyflakes_1.1.0.bb
index c319af8..ae7d471 100644
--- a/meta-python/recipes-devtools/python/python-pyflakes_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python-pyflakes_1.1.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "passive checker of Python programs"
 HOMEPAGE = "https://github.com/dreamhost/cliff"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://README.rst;md5=0f2ba771f63ad51756f4fb10e827220e"
+LIC_FILES_CHKSUM = "file://README.rst;md5=fe719d45f4c604c6e2c86872b6e9485f"
 
-SRC_URI[md5sum] = "914621d4c9546248419b435dd358eb6a"
-SRC_URI[sha256sum] = "f39e33a4c03beead8774f005bd3ecf0c3f2f264fa0201de965fce0aff1d34263"
+SRC_URI[md5sum] = "e0bf854cd5abd4527e149692925b82eb"
+SRC_URI[sha256sum] = "e5f959931987e2be178781554b485d52342ec9f1b43f891d2dad07a691c7a89a"
 
 inherit pypi setuptools
 
-- 
1.9.1


