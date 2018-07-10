Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0040A60720
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 20:15:10 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id b66-v6so12290197qkj.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LN34vxC98AdxNFyUqLtsywkEk39C07Y1FGsXT+aRIhU=;
	b=QdgKdW1xZBUfLNhuTZK77cLiUKyVcfnGv2ib6lCJbqlrIH/twkTJBMzTayifkwmZtv
	8Bg4VbQSgsePfGObRieE1yMBRqYkBuoWkN7wniB8k0Jf5+lrT/tBKf5iGii+0Jm8B1R3
	vpMUimEmN5yY9GmgnAZp3ghtWsz3mQELu1e5wah0dTvFaa7AaYdH/RpkdfA+Zlc3K7wO
	Nj+lLj9VU40uQaKav94JgWzwD7lp3MCbZr3yI8xhTSL7Y/wZ9NP72pDmwzcDEUMXsEZO
	lkmpATdYJVy8+t8K3z6CUzSGxfbkoLmEwAQJuNOu7n7yN+WbYDkwmWwVcjzgI6A9I0F7
	3Q+w==
X-Gm-Message-State: APt69E2jNv9YN6l+ijWUX9EDVtFHqfss9yniZ8sg6tO9IB/oZ/S9b4Hu
	YvS2zgUMI7YNSXROV97vQW0hOU8b
X-Google-Smtp-Source: AAOMgperICnArdybjyIUfCQE/D/Hgzy6iBgi4dEoYgzKC09BPHFsDhoP1v1EE5A050nQvQcqX1MaOA==
X-Received: by 2002:a37:4454:: with SMTP id
	r81-v6mr21175633qka.417.1531253711232; 
	Tue, 10 Jul 2018 13:15:11 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	w79-v6sm15760758qkw.35.2018.07.10.13.15.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 13:15:10 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:15:01 -0400
Message-Id: <1531253701-25075-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-setuptools-scm: update to version 2.1.0
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
X-List-Received-Date: Tue, 10 Jul 2018 20:15:11 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-setuptools-scm.inc         | 4 ++--
 ...python-setuptools-scm_1.15.7.bb => python-setuptools-scm_2.1.0.bb} | 0
 ...thon3-setuptools-scm_1.15.7.bb => python3-setuptools-scm_2.1.0.bb} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-setuptools-scm_1.15.7.bb => python-setuptools-scm_2.1.0.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-setuptools-scm_1.15.7.bb => python3-setuptools-scm_2.1.0.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
index eb66580..98883ec 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
@@ -2,8 +2,8 @@ SUMMARY = "the blessed package to manage your versions by scm tags"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
 
-SRC_URI[md5sum] = "1b55f9cedde4a33ab5d286c5f30e86db"
-SRC_URI[sha256sum] = "e163e8a12d2121f77575773cfc2b5988275dc1f1d2541fdf780127c29dbbea9c"
+SRC_URI[md5sum] = "cfec5d2dbbd0a85c40066f79035b5878"
+SRC_URI[sha256sum] = "a767141fecdab1c0b3c8e4c788ac912d7c94a0d6c452d40777ba84f918316379"
 
 PYPI_PACKAGE = "setuptools_scm"
 inherit pypi
diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_2.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-setuptools-scm_1.15.7.bb
rename to meta-python/recipes-devtools/python/python-setuptools-scm_2.1.0.bb
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.7.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_2.1.0.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-setuptools-scm_1.15.7.bb
rename to meta-python/recipes-devtools/python/python3-setuptools-scm_2.1.0.bb
-- 
2.7.4


