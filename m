Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id E26EA60667
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 13:44:30 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id u62so18211633ywe.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2016 06:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v5BVDLwpW6hXh1JLPFsMVTQvmBHtBizaiQes3brg9Do=;
	b=ccy4DO+1w0eYvhGnw/pCG1LsZb9LT1b9GwqZJTRqhGoa4vn0xy+rKJKSoeJ7BUpSoN
	gS5WnwCZ9b/HpU4S5TTfo4U2HRRsMO8+3WWYZ2f114fjr1yscvxTe5uoXXmOCmb5222l
	zzaw4AVMNAtCANKn5GZ8gpp/9jzJndgZNRI5ERiBfDkbOmi+3wKeNrymEUFwwvoDuOyG
	CdxQYV7GnYp1z1RWxOyggTAm+MjUyR7oc77b/p9n1iHU7GRm0A4tfkCcKL81SS5ei8w3
	8OiSGnLCAgAjSS8Rl1kb87/hVybbSI9Ga+cN8cSrDScntkijTqEsMBwu7lUM4aKrtjFK
	5nww==
X-Gm-Message-State: ALyK8tJxH3NYB0B1WFCZzbVrdGRyU0Uj9lNdSllfqgPXvUd1OPqe6h4IG7EpcYmEanu0PA==
X-Received: by 10.129.154.206 with SMTP id r197mr1823157ywg.119.1463838271410; 
	Sat, 21 May 2016 06:44:31 -0700 (PDT)
Received: from localhost.localdomain ([104.129.204.116])
	by smtp.gmail.com with ESMTPSA id
	z17sm3831683ywz.56.2016.05.21.06.44.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 21 May 2016 06:44:30 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 May 2016 09:44:23 -0400
Message-Id: <1463838263-19331-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pytz: update to version 2016.4
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
X-List-Received-Date: Sat, 21 May 2016 13:44:33 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python-pytz_2016.3.bb => python-pytz_2016.4.bb}        | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pytz_2016.3.bb => python-pytz_2016.4.bb} (55%)

diff --git a/meta-python/recipes-devtools/python/python-pytz_2016.3.bb b/meta-python/recipes-devtools/python/python-pytz_2016.4.bb
similarity index 55%
rename from meta-python/recipes-devtools/python/python-pytz_2016.3.bb
rename to meta-python/recipes-devtools/python/python-pytz_2016.4.bb
index da4e2d6..4c30f9c 100644
--- a/meta-python/recipes-devtools/python/python-pytz_2016.3.bb
+++ b/meta-python/recipes-devtools/python/python-pytz_2016.4.bb
@@ -3,12 +3,13 @@ HOMEPAGE = " http://pythonhosted.org/pytz"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=22b38951eb857cf285a4560a914b7cd6"
 
+SRC_URI[md5sum] = "a3316cf3842ed0375ba5931914239d97"
+SRC_URI[sha256sum] = "c823de61ff40d1996fe087cec343e0503881ca641b897e0f9b86c7683a0bfee1"
+PYPI_PACKAGE_HASH = "ad305ab2298c902ac92fdf649cc07d1b7d491a241c5cac8be84dd84464db7d8b"
+
 inherit pypi setuptools
 
 RDEPENDS_${PN} = "\
     python-core \
     python-datetime \
 "
-
-SRC_URI[md5sum] = "abae92c3301b27bd8a9f56b14f52cb29"
-SRC_URI[sha256sum] = "3449da19051655d4c0bb5c37191331748bcad15804d81676a88451ef299370a8"
-- 
1.9.1


