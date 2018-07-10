Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id BFB44747F3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 20:45:24 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f1-v6so19582546qti.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 13:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ICRLgAPBCjLMHIiG75q2+7nXJ4+gxutkA05N+VWA9OU=;
	b=l+YT23W+iR9ws8rEbazciGm4xkM9PdYYkWMxC8q6n4Xff61OAQ/8VjzYnFbsxFvZzQ
	M4i6OYwtm+JAVvYJBdogclgCVmA0dzDoW1epCvfeCzRgTaUOQkG2mcw9qJjkD4sRIonR
	AVAGjEyfq9C24eL3dtZggeWrmSAayCYchELZVkwFUJs7mcYa2ufpTO/jSNa5FgUpZkMN
	/xrXiPEqbegVvBNBpOhrFzI11PvqNvuAKtl4PCn/VAgxMUlYAy9PxvylyeOrwwA/mO0L
	7sbGRS/RiIjkOo1Bz7gMarjyl31200ko7si8OxsHjLnImV8NLioOCOoy3AJE9tjFah0P
	2p4Q==
X-Gm-Message-State: AOUpUlGt3+Joa+vQzuYOWh3qj1IwN63gfhaTjFjJx5uNPHeQZtNYknO/
	xq+4HmLG4ruvZyv3u+Hwee0PjIOb
X-Google-Smtp-Source: AAOMgpd7oJyCdoky8ME2J4rjTos28XO7iLNhtj9R1aEj++hEdrlUDoIFYj6vOW84D16YBmbCuRHszA==
X-Received: by 2002:a0c:d44a:: with SMTP id
	r10-v6mr15192229qvh.248.1531255525241; 
	Tue, 10 Jul 2018 13:45:25 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	m67-v6sm11599452qkb.92.2018.07.10.13.45.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Jul 2018 13:45:24 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 16:45:16 -0400
Message-Id: <1531255516-11316-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-flask: update to version 1.0.2
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
X-List-Received-Date: Tue, 10 Jul 2018 20:45:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

License-Update: Copyright authors changed along with formatting of the license.

License terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask.inc                | 6 +++---
 .../python/{python-flask_0.12.2.bb => python-flask_1.0.2.bb}        | 0
 .../python/{python3-flask_0.12.2.bb => python3-flask_1.0.2.bb}      | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-flask_0.12.2.bb => python-flask_1.0.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-flask_0.12.2.bb => python3-flask_1.0.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-flask.inc b/meta-python/recipes-devtools/python/python-flask.inc
index ecf5619..66ad1a6 100644
--- a/meta-python/recipes-devtools/python/python-flask.inc
+++ b/meta-python/recipes-devtools/python/python-flask.inc
@@ -4,10 +4,10 @@ Flask is a microframework for Python based on Werkzeug, Jinja 2 and good \
 intentions. And before you ask: It’s BSD licensed!"
 HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=19866b76b054ab30c270c0eb9d7e43d7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c011883ac26229b8ba3084f55c7664c6"
 
-SRC_URI[md5sum] = "97278dfdafda98ba7902e890b0289177"
-SRC_URI[sha256sum] = "49f44461237b69ecd901cc7ce66feea0319b9158743dd27a2899962ab214dac1"
+SRC_URI[md5sum] = "824f0f20aae1f44c9c7dc4054adb7969"
+SRC_URI[sha256sum] = "2271c0070dbcb5275fad4a82e29f23ab92682dc45f9dfbc22c02ba9b9322ce48"
 
 CLEANBROKEN = "1"
 
diff --git a/meta-python/recipes-devtools/python/python-flask_0.12.2.bb b/meta-python/recipes-devtools/python/python-flask_1.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-flask_0.12.2.bb
rename to meta-python/recipes-devtools/python/python-flask_1.0.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-flask_0.12.2.bb b/meta-python/recipes-devtools/python/python3-flask_1.0.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-flask_0.12.2.bb
rename to meta-python/recipes-devtools/python/python3-flask_1.0.2.bb
-- 
2.7.4


