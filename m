Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id AAE70600E3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 22:36:54 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id n189so7273961qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 15:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wFa7tmlg7YHi996HtIVzk/4OV/65M0hfAvkdCX/nw3g=;
	b=AKRbJcRwLTIct0h7E8iTyO8TzrN/aNKV2x6/JpuwarghaL1HD0AJ/xwX8w+yqnyr6n
	BsjdVw9yGVpan3V2ZCq5ZX6VgIg+4fpltH8+dHhvFDGDfA3zBELl61AY+B0PmQEG2Z1w
	422FMTElA+Eh7P30bpfFq1apKZXxHgOXe2N+o/TXts+Y8XENQ6DxPorLB8sFb0AQsLjD
	Fs256wnat+/nGEfCj3hAavmHFvtJ1BGkjZ5EX2zbk7DEBPpJ3W4zrI0LOEBhGnOxIO5Y
	UVv1fQCUuxhVGm9lE6rjL3B/zI1xDDgZxL4+shG7RsZPcrBhGSSgPtYDilFO7EbLYJWW
	kp9w==
X-Gm-Message-State: AA6/9RlUkG545PN9n1HGEW68cSHkFPrgB40UJH2/4Q6SkMYREOm6BvrexmkDzMj7Yt5jPg==
X-Received: by 10.55.125.68 with SMTP id y65mr8771263qkc.319.1476398215554;
	Thu, 13 Oct 2016 15:36:55 -0700 (PDT)
Received: from sparta.ny.asterius.io (ool-457cd903.dyn.optonline.net.
	[69.124.217.3]) by smtp.gmail.com with ESMTPSA id
	t34sm2391556qtc.28.2016.10.13.15.36.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Oct 2016 15:36:55 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 18:36:48 -0400
Message-Id: <1476398208-24220-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytest: update to version 3.0.1
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
X-List-Received-Date: Thu, 13 Oct 2016 22:36:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytest.inc                 | 4 ++--
 .../python/{python-pytest_2.9.1.bb => python-pytest_3.0.1.bb}         | 0
 .../python/{python3-pytest_2.9.1.bb => python3-pytest_3.0.1.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytest_2.9.1.bb => python-pytest_3.0.1.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytest_2.9.1.bb => python3-pytest_3.0.1.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytest.inc b/meta-python/recipes-devtools/python/python-pytest.inc
index 4877358..454939e 100644
--- a/meta-python/recipes-devtools/python/python-pytest.inc
+++ b/meta-python/recipes-devtools/python/python-pytest.inc
@@ -2,8 +2,8 @@ SUMMARY = "Simple powerful teting with python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d8a5609608d9a5a180705b0fa298ae01"
 
-SRC_URI[md5sum] = "05165740ea50928e4e971378630163ec"
-SRC_URI[sha256sum] = "0d48d27a127644fbe7c8158157e08b35f8255045d4476df694b91eb3a8147e65"
+SRC_URI[md5sum] = "6e736a6d7bc854b25d44a60bcba5f2f9"
+SRC_URI[sha256sum] = "e82bc0596ee96b2287c08705cfcb6898db1fe4b5c87db3b6823f1fdd77fb3ff1"
 
 RDEPENDS_${PN} = " \
     ${PYTHON_PN}-argparse \
diff --git a/meta-python/recipes-devtools/python/python-pytest_2.9.1.bb b/meta-python/recipes-devtools/python/python-pytest_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytest_2.9.1.bb
rename to meta-python/recipes-devtools/python/python-pytest_3.0.1.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytest_2.9.1.bb b/meta-python/recipes-devtools/python/python3-pytest_3.0.1.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytest_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pytest_3.0.1.bb
-- 
2.7.4


