Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id A7D7B7809C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:23:12 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id x77so7263801qka.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NHZQaJK8dOfTMsdHDOF+L9Iqytw5Rw3vVbkRaiiwsEo=;
	b=oWebCJIzc4Usj9B3HkreYZaxLPk5W0upgUXh4V2JhPjXzvC74+JNLsOoACgXnGelDg
	/V4veWhBDT/ZGap9Nk0WhAWcvz2xUBwrqtDXlf84hTHTHpis1v+upsFOBfkxMnOd0rnX
	M2ir4X/75hh8zM9iLxxEyn4WH9WLQIYTgFc4JBbwyzvevAjozSt8PnB6TOBZx80N3875
	2zvftnv9IOq9+aLbzr0IXL9XD12hYdaQEe5hYwdwfxI45tP8Pz9nwLstUtoo3lBH0Fol
	dgwFD5sXcsc8yEPfParFPjo42350DUIpJBseGu/obFYv0K7d7S71eZVzHkdejTglp0ti
	3hJA==
X-Gm-Message-State: AHYfb5iiwL9Cp+xN5SZJsDCfyb/y7ujYJ7udNhec48VHM/vSgV7HLStG
	R9eVBPsTN1T0RzCGAcs=
X-Received: by 10.55.122.68 with SMTP id v65mr12183468qkc.225.1502328193291;
	Wed, 09 Aug 2017 18:23:13 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id d5sm3004778qtg.63.2017.08.09.18.23.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:23:12 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:23:07 -0400
Message-Id: <1502328187-3969-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pymongo: update to version 3.5.0
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
X-List-Received-Date: Thu, 10 Aug 2017 01:23:12 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pymongo.inc                | 4 ++--
 .../python/{python-pymongo_3.4.0.bb => python-pymongo_3.5.0.bb}       | 0
 .../python/{python3-pymongo_3.4.0.bb => python3-pymongo_3.5.0.bb}     | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pymongo_3.4.0.bb => python-pymongo_3.5.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_3.4.0.bb => python3-pymongo_3.5.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
index e709a36..6795213 100644
--- a/meta-python/recipes-devtools/python/python-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -8,8 +8,8 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
 
-SRC_URI[md5sum] = "aa77f88e51e281c9f328cea701bb6f3e"
-SRC_URI[sha256sum] = "d359349c6c9ff9f482805f89e66e476846317dc7b1eea979d7da9c0857ee2721"
+SRC_URI[md5sum] = "717188415cb9071355a80b3c520370ff"
+SRC_URI[sha256sum] = "8137381e217038bc4b7d113c9d0d1133d8081d39008b5a4f11bf129b1520c1b0"
 
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.4.0.bb b/meta-python/recipes-devtools/python/python-pymongo_3.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pymongo_3.4.0.bb
rename to meta-python/recipes-devtools/python/python-pymongo_3.5.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.4.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.5.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pymongo_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_3.5.0.bb
-- 
2.7.4


