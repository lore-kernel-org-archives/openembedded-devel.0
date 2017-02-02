Return-Path: <andreas.kling@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 66B9071D86
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 13:49:18 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id c85so4253026wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RxM+MGDht/LEJXymI4KnTd7n4/GqIGazFHlzjMiwSsU=;
	b=TtZVCP+8kk56iQsJkYt8yvJxXPtjgvSTzIVR+7rgCkbP5nfdixNG3OzX3TFu1uOzG+
	mdB0Ltn2ZzXo7KO8bT3lN11VveOf2G7ln8XqhoKXM49IVlaC4jiS3w9kR+fO708AEp8C
	/rmClvCxw+APA+TA+FY4a5m76vcx/0e/fSQ3b7OM4sW4oc4fl3bk/UMeD+0RCML1XQt8
	yLwgc8+BcT0L6VA/gt3UPiurbdv0zVmKSTlSfJJFwhfpN2RvhYKdzRGJK4K4rWEeGRb1
	RohDK9HLxsgR+tsmX6eCP9rjdQ2c2IBVTkiL6FlGqcRJv60nNwqJQxs6JygQ3sHrou3A
	Cfbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RxM+MGDht/LEJXymI4KnTd7n4/GqIGazFHlzjMiwSsU=;
	b=swqyHzsjrdk34sIsgg7Lickt/7f1Uq/lCeDSxxTmjsr/WLSxE71EwCiKMChQHXw/oW
	v81qcFizEpraPLzhrdMnOOyWrOgw2LspQL248TlFbvqwB2QKIYAi9t7dRVXXaz8RuT/5
	DalD5ZvEVyWHAqdqu5wO0C3Ria1KfyBXX7PTiWbRgSSkBlD82tWklNLra6ANDmF9DQhb
	Kl5O85SIkKKdacXrfAYM6lUkX6ekyFRdciXIahQgWM1n5QlrGZ7wzqPUHF7h3aXM4TUx
	hOo7rl+QpBhaJmmv8DjcntnMI8EAhyR0DaFxOvtjUxqMe74CMnk5UfXwTDr7pQeIyyA8
	r6Dg==
X-Gm-Message-State: AIkVDXKxQPtOCpxR0j6vZuypUrdOZAsjLfAbPn9+zVsMa9Mlvps9cwYzhTiVhrDCyefVaw==
X-Received: by 10.28.62.144 with SMTP id l138mr7428670wma.50.1486043359132;
	Thu, 02 Feb 2017 05:49:19 -0800 (PST)
Received: from nb-lx-hgc-001.peiker-cee.de
	(business-176-094-229-202.static.arcor-ip.net. [176.94.229.202])
	by smtp.gmail.com with ESMTPSA id
	b51sm40106703wrd.39.2017.02.02.05.49.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 05:49:18 -0800 (PST)
From: andreas.kling@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Feb 2017 14:49:11 +0100
Message-Id: <20170202134911.23234-2-andreas.kling@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170202134911.23234-1-andreas.kling@gmail.com>
References: <20170202134911.23234-1-andreas.kling@gmail.com>
Cc: Andy Kling <andreas.kling@peiker-cee.de>
Subject: [meta-python][PATCH 2/2] m2crypto: depend on typing
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
X-List-Received-Date: Thu, 02 Feb 2017 13:49:19 -0000

From: Andy Kling <andreas.kling@peiker-cee.de>

  m2crypto requires typing since 0.24.0-38-g8bbd0ec
---
 meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
index 5a9594f07..ca462229e 100644
--- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
+++ b/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
@@ -12,7 +12,7 @@ SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
 PYPI_PACKAGE = "M2Crypto"
 inherit pypi setuptools siteinfo
 
-DEPENDS += "openssl swig-native"
+DEPENDS += "openssl swig-native python-typing"
 
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
-- 
2.11.0


