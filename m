Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id E069876E4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Feb 2016 19:22:07 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id o185so54316862pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Feb 2016 11:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=zeGOZIAXCoh9dNg/lqX3bqQQk+1+/PfLEaHa7xLYDc0=;
	b=iGECiAdCeQfNzse7Jx9NLKyKhC71bvLCzJxVulkMue/ACBrElsRN6+apd1DPwMBqV2
	OKWXSnszh8weTIDlKURQ5DYEZIuaucLoDFGqylr/GpfDDpSWUyqyQTx/QnAW2u94eBpd
	7bcr+qvC/sUTtJGW9G3TAKgWDx6EJyvre+n0AmnGxQZ+puA0gIf/kQivLGKis4hM7/j3
	HKNRJG7fyRqh60nAgrWq3HSPBC0HRDvZoe5RniZieIQMesSLgVp9Q6njVihvFVEStTIc
	h/u/T3cxjDHe7bTaAhDBwAOtHFUA1i19AbF+rk96ncLmxVsjdIzGP6qRjioXRXLL/zdN
	yPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=zeGOZIAXCoh9dNg/lqX3bqQQk+1+/PfLEaHa7xLYDc0=;
	b=Cs704jG8GCK0BjZkqeOf9bew5KQ0XQc6MmrXGgkuzmmWv5uA6BG/rgapBnpN4/3Pu5
	h3GS3XS/eprzICu00WiHx03Vg82grIpqcpMKzgPj2NurXtiVh5OS1b1oHilcnwOY6EaW
	WypxPe54nQM6Sbo+AV4fog4rgO7ydX8ZF/T/7lQRxvCqTG4xyaVuFTQlTnEzLJq67qiy
	eY6zO25bp065jzqTSFCj0jw6G7CiMN5UwosbyAuNmavbW3lCHHiXyUB6hc5ZJDn7UHvb
	5OZe2RZxcsJvJM2knnVWEb2BSv4IKCC6BZD3Nv+LHYr3JrczMtSdLO71niHZXM2OOHmb
	XvXQ==
X-Gm-Message-State: AG10YOQYbsxkX2xNyYSbSYh5/0pjHs86u4WGMe6c/v2+dxoNCb3pZXOzzZV5BO802gMcmQ==
X-Received: by 10.66.102.8 with SMTP id fk8mr13497753pab.24.1454613728094;
	Thu, 04 Feb 2016 11:22:08 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	q136sm18915409pfq.66.2016.02.04.11.22.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 11:22:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org, TicoTimo@gmail.com,
	paul.eggleton@linux.intel.com
Date: Thu,  4 Feb 2016 11:22:03 -0800
Message-Id: <1454613723-22027-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-python][PATCH] python-django: update package to 1.8.9
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
X-List-Received-Date: Thu, 04 Feb 2016 19:22:08 -0000

Update to a LTS version which might EOL in April 2018

The following security fixes are included;
CVE-2015-8213
CVE-2015-5964
CVE-2015-5963
CVE-2015-5145
CVE-2015-5144
CVE-2015-5143
CVE-2015-3982
CVE-2015-2317
CVE-2015-2316
CVE-2015-2241

LIC_FILES_CHKSUM changed do to:
https://github.com/django/django/commit/1dae4ac1778f04805c0ed62c8debb13b281ba02b
* Removed trailing whitespace.
* Added newline to EOF if missing.
* Removed blank lines at EOF.
* Removed some stray tabs.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../python/{python-django_1.6.10.bb => python-django_1.8.8.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python-django_1.6.10.bb => python-django_1.8.8.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python-django_1.6.10.bb b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python-django_1.6.10.bb
rename to meta-python/recipes-devtools/python/python-django_1.8.8.bb
index a7ca803..5e4c435 100644
--- a/meta-python/recipes-devtools/python/python-django_1.6.10.bb
+++ b/meta-python/recipes-devtools/python/python-django_1.8.8.bb
@@ -2,18 +2,18 @@ SUMMARY = "A high-level Python Web framework"
 HOMEPAGE = "http://www.djangoproject.com/"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=fa8608154dcdd4029ae653131d4b7365"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f09eb47206614a4954c51db8a94840fa"
 
 SRCNAME = "Django"
 
 SRC_URI = "https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "d7123f14ac19ae001be02ed841937b91"
-SRC_URI[sha256sum] = "54eb59ce785401c7d1fdeed245efce597e90f811d6a20f6b5c6931c0049d63a6"
+SRC_URI[md5sum] = "08ecf83b7e9d064ed7e3981ddc3a8a15"
+SRC_URI[sha256sum] = "8255242fa0d9e0bf331259a6bdb81364933acbe8863291661558ffdb2fc9ed70"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-inherit distutils
+inherit setuptools
 
 FILES_${PN} += "${datadir}/django"
 
-- 
2.3.5


