Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 852837904A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 20:43:34 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id c15-v6so22688498qtp.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2018 13:43:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=xOUhe54qctlzFOo395JAVSlLcnilXFkkbgpbHggqRRU=;
	b=ddoZiF/glSY4sOzkVgiOlGFyaMg5Gbb+d/H6m39cxNrOJOeqcnWPEY51nd65zE9sGH
	CyIZA58UvuNFTcLnuCr/jQX6h5vG9H4N0qzMZQHZCNDIccYX7u2sjR80McdYKywbtclh
	+xOcL2IQlgk4MzU8EK9aiBLDxhA3FIcwEw0vDeLGGPVkISKuAYr3y1zhEoC4XmSNssDg
	OcJej/IQfI9NeRrinc9/vbgVC27l/y0iqJZVRu0x7vM62ggcaZJt2XGaqZu2Qo3TDBCo
	8HMUDyphGDoh0WFtMDdP//1WuWKQDNhbq3MrxIOaItnyyfhCI06r2OtImRScQMqxeQsd
	pF8A==
X-Gm-Message-State: AOUpUlFkEs0iNjvobwbNKnYKwdnZfc9E/igRvrQVUJvKD7JY9/7Zyz4D
	NpTUa/9W5SPTaeKKYfGUQZ/RRxT3utw=
X-Google-Smtp-Source: AA+uWPxXPL4M0s9yHj4q2kThESDgQProiMSKXkZ2Sy1Ds52QMSsEsL/naJPDzPU02SVoL0u61zY1Mw==
X-Received: by 2002:a0c:a281:: with SMTP id
	g1-v6mr20720987qva.60.1534279414946; 
	Tue, 14 Aug 2018 13:43:34 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	n36-v6sm13594788qtb.39.2018.08.14.13.43.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 14 Aug 2018 13:43:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 14 Aug 2018 16:43:25 -0400
Message-Id: <1534279405-11588-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-lxml: update to version 4.2.4
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
X-List-Received-Date: Tue, 14 Aug 2018 20:43:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-lxml.inc                   | 4 ++--
 .../python/{python-lxml_4.2.3.bb => python-lxml_4.2.4.bb}             | 0
 .../python/{python3-lxml_4.2.3.bb => python3-lxml_4.2.4.bb}           | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-lxml_4.2.3.bb => python-lxml_4.2.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-lxml_4.2.3.bb => python3-lxml_4.2.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-lxml.inc b/meta-python/recipes-devtools/python/python-lxml.inc
index 09061ed..7f355a7 100644
--- a/meta-python/recipes-devtools/python/python-lxml.inc
+++ b/meta-python/recipes-devtools/python/python-lxml.inc
@@ -18,8 +18,8 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[md5sum] = "40331e46f6aa49fd0e7043d82e58a879"
-SRC_URI[sha256sum] = "622f7e40faef13d232fb52003661f2764ce6cdef3edb0a59af7c1559e4cc36d1"
+SRC_URI[md5sum] = "31239400ca4e130b69993bb3c14204b3"
+SRC_URI[sha256sum] = "e2afbe403090f5893e254958d02875e0732975e73c4c0cdd33c1f009a61963ca"
 
 DISTUTILS_BUILD_ARGS += " \
                      --with-xslt-config='pkg-config libxslt' \
diff --git a/meta-python/recipes-devtools/python/python-lxml_4.2.3.bb b/meta-python/recipes-devtools/python/python-lxml_4.2.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-lxml_4.2.3.bb
rename to meta-python/recipes-devtools/python/python-lxml_4.2.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb b/meta-python/recipes-devtools/python/python3-lxml_4.2.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-lxml_4.2.3.bb
rename to meta-python/recipes-devtools/python/python3-lxml_4.2.4.bb
-- 
2.7.4


