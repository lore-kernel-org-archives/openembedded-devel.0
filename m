Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7A5BE75279
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 19:19:05 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id y20-v6so8795516qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jun 2018 12:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=au2uUy+Q+MmTQFb+q4HAhbrH1Z7NHisedMYeE6haumA=;
	b=iXJVawM5Gm8sb3l9SUhb9Dv1p9X/FL09bQoyOjKL4GlbknyvxXSKsPkzJTXz9nBZq0
	huAqO9vf9L18twwK2KEGMQuwMDLvscNxjK1wwZNv+3Zf+D91Z1UBfQaJWkEQlle2/5g3
	qAlvOcZS4VimeHSpAG/WmuCpKFI9hxL4cNxblKuv4w3mUuP5uJcPs/LbzaCpjpX11Eqi
	KENyg8UOab1phWhoHvwUf2l6V2C0xIHCBbznbwj5AvyYIMC71Pb1lNDRL3pSJJ9X/iUf
	iXgCgQSBBvv5etIjy03RivxgQLcv+Ry3nFEe973Wu7dnEg6lfF9wTsPF9OlD11aBt7Pu
	7kGw==
X-Gm-Message-State: APt69E3rHIJdmPSCFEscQ//kKjhQSiMji4kUdirDX4p1Ma1P1cgi0Mnp
	s/t39WgAmc1Qp/LCO9y2F9eZaZX2
X-Google-Smtp-Source: AAOMgpd9KEVoJl5KwGz+Zb8cu1ISSoB4Q0Fr8vnenoXrM8HWQrGKcO8hieOqIHURskJxUMyVA1FQUw==
X-Received: by 2002:ac8:8af:: with SMTP id
	v44-v6mr15319596qth.33.1530299941313; 
	Fri, 29 Jun 2018 12:19:01 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	n17-v6sm571010qtc.34.2018.06.29.12.19.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jun 2018 12:19:00 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jun 2018 15:18:43 -0400
Message-Id: <1530299923-7473-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pytz: update to version 2018.5
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
X-List-Received-Date: Fri, 29 Jun 2018 19:19:05 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pytz.inc                   | 4 ++--
 .../python/{python-pytz_2018.4.bb => python-pytz_2018.5.bb}           | 0
 .../python/{python3-pytz_2018.4.bb => python3-pytz_2018.5.bb}         | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2018.4.bb => python-pytz_2018.5.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pytz_2018.4.bb => python3-pytz_2018.5.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pytz.inc b/meta-python/recipes-devtools/python/python-pytz.inc
index 519487f..aedffe1 100644
--- a/meta-python/recipes-devtools/python/python-pytz.inc
+++ b/meta-python/recipes-devtools/python/python-pytz.inc
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4878a915709225bceab739bdc2a18e8d"
 
 inherit pypi
 
-SRC_URI[md5sum] = "f054437920c895dd14a4509fabafe029"
-SRC_URI[sha256sum] = "c06425302f2cf668f1bba7a0a03f3c1d34d4ebeef2c72003da308b3947c7f749"
+SRC_URI[md5sum] = "45409cbfa3927bdd2f3ee914dd5b1060"
+SRC_URI[sha256sum] = "ffb9ef1de172603304d9d2819af6f5ece76f2e85ec10692a524dd876e72bf277"
 
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-datetime \
diff --git a/meta-python/recipes-devtools/python/python-pytz_2018.4.bb b/meta-python/recipes-devtools/python/python-pytz_2018.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pytz_2018.4.bb
rename to meta-python/recipes-devtools/python/python-pytz_2018.5.bb
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2018.4.bb b/meta-python/recipes-devtools/python/python3-pytz_2018.5.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pytz_2018.4.bb
rename to meta-python/recipes-devtools/python/python3-pytz_2018.5.bb
-- 
2.7.4


