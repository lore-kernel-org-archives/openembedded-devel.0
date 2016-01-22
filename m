Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BC2DA77058
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:31:00 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l65so477577wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=bKdniNSExhsriiIaYMUNQgKR9wXX0RAKEQWIhaQX24c=;
	b=yM+zvtfz6c1/hh3ogAaQBTlkFmtvWOUNVxRd2xsPG6P7qtHOa9sUZtgHKVDPsNySfg
	QeJCKf5Q7FPS6uHRZr3NY5vM13gVf3OwyyBiG7EJ4n5PoTRVIQ9UvSlN42hV+Q0RWALT
	n+aojwYPIC5+b4EdUb2k1c6maR7xsCRh601kW2Powc6yQ+EnodfTapdGdCiu4jqE8FCG
	tcXvVyBdBCGFNGOU5FSc1Y6dxF/QCBJcY/m6WEc6weoNb+nrQI1lfjp+zF12AZ1bgGhD
	qhirnzNPTIkTKROozPv07ehIjGlENfMZAs16LhYC4tAg/fdBqddBKxeC27zdxHBFFEh8
	2BlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=bKdniNSExhsriiIaYMUNQgKR9wXX0RAKEQWIhaQX24c=;
	b=LtlyayIq2Fx0mPYefskDjDXIGODxq5IOL7hkQdhtnIZtIhDCKAY8hs2A+kTJqB8Bgn
	7XsjxklXw7HcYvOPcvLD9uId+vNetV2Xm1q0X+nPCdnw6IymGGFUwPr5wL7fvt8at7wm
	BDqyVELItvGH3kxJ6Wb8gs/gExlPIQe/ekIxeTaXg7bmP3eSf3evjEt8uYhBo+7Epb66
	UzRb9Qn6s2n0AqehcWjrjWlAFxBPMmv/KFPmWkoUYFZPHBlep4GmBEOS9vavcuzLTDHe
	ChzvWdAp+KNSfGvFQFm3HfyaakKVVxC6l/G0doalTbGqGLjuZTVmNNN2/B78CCTIZu11
	khZg==
X-Gm-Message-State: AG10YOSdX6i7MyAnf5vABlGZf4Y3RLwLPAcp5WqKWSRsEcxdYlI6ULYEt/h9/DfBe3NFjA==
X-Received: by 10.194.77.137 with SMTP id s9mr5418393wjw.171.1453505461386;
	Fri, 22 Jan 2016 15:31:01 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.31.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:31:00 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:19 +0100
Message-Id: <e60822e0d7c13e4fb8589cc17d654e463173daad.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 17/21] python(3)-xlrd: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:31:00 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-xlrd.inc       | 10 ++++++++++
 meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb |  2 ++
 3 files changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-xlrd.inc
 create mode 100644 meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb

diff --git a/meta-python/recipes-devtools/python/python-xlrd.inc b/meta-python/recipes-devtools/python/python-xlrd.inc
new file mode 100644
index 0000000..3c0d26d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xlrd.inc
@@ -0,0 +1,10 @@
+SUMMARY = "Library for developers to extract data from Microsoft Excel (tm) spreadsheet files"
+DESCRIPTION = "Extract data from Excel spreadsheets (.xls and .xlsx,\
+ versions 2.0 onwards) on any platform. Pure Python (2.6, 2.7, 3.2+). \
+Strong support for Excel dates. Unicode-aware."
+HOMEPAGE = "http://www.python-excel.org/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://xlrd/licences.py;md5=b59dace5cc1db604c4219100b0422811"
+
+SRC_URI[md5sum] = "911839f534d29fe04525ef8cd88fe865"
+SRC_URI[sha256sum] = "8e8d3359f39541a6ff937f4030db54864836a06e42988c452db5b6b86d29ea72"
diff --git a/meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb b/meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb
new file mode 100644
index 0000000..16eeac3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-xlrd_0.9.4.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-xlrd.inc
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb b/meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb
new file mode 100644
index 0000000..407346f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-xlrd_0.9.4.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-xlrd.inc
-- 
1.9.1


