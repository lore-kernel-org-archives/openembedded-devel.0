Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id D535175562
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 16:08:27 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s11-v6so15203180wra.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jul 2018 09:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=tj1S3cPcrfeZ6zA3Is/0Cf/DE7iaedRVu41ZW8cztac=;
	b=z0GhKrM2rnd5By+dqUGUCfVwyisNiCHxPaiT8kwYiSKwO9b76nWGXupql/zPMeV72H
	C4AAT4q8beKGTd6G6+E+z5CIt9GZVL2DTEmx6yvtl9+7LhNI7EnEdbilnPB6yOEolzW/
	uUoNDZ/xU/nVEDnhkkBpySqEsI1hPROiqqHv1pEOywqeNiR0d5pegqqdDhBnLQ/U7Y9o
	nDJ9DabzqfOfRNIM2QDTELiOWo+7jDlCLBDq0skMyQ8hBwEvfE2fgdRB9FHv/XGh7D1i
	TfHzWhQ8cRSkGNBbRbQTQQnFFGtmNqEmFAXfxSW+iEpgnY2kzz7NrQci72KVXlc2AWlN
	t78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=tj1S3cPcrfeZ6zA3Is/0Cf/DE7iaedRVu41ZW8cztac=;
	b=sgidyU5agwsgrHlkjZSZfv3fAfmGAu/9iQm5cIhoeADFwTlwvZ+jj2vC/zYwCtCvqB
	8ofNnfpaX0mvRwLhfPBJVj/QdQSYg7Pphtr0hUDQ/K8lBbJxvApEGZ2Kp+eUIrvC9JrO
	ZcyfzrMuLsjvPh5/lBmqENze7K0/IQFfBLF8haI7UWg3Ztsd+uXd712THKplpCHSl7kA
	dZPXF4YMS0lOOA+1ecoAky5K2ETnCKQ0PPeK4eU1WvF4UlLXj+b6Ep+AdVb+L++rWi1R
	RvnJ6hXXppOWT0BoZyxBHvWf9ig+shBLZ6rklatIfWxjl3gPW32taDxxkuXNajDMMK2X
	D3Cw==
X-Gm-Message-State: APt69E2vBa+/XOWrWf7oMQVrHUmfN5C4/tQBty6m6uSMftdEZdrW+ojA
	fiOIEib8OxwYY2zqMSkw+mHvBvhl
X-Google-Smtp-Source: AAOMgpfPvlNrP+PhgF2HvqSG37uKMpHTf5kgI+Ej7w/WY8TrdQQBTUcO+8GWszmniKUzYg+t8PJcHw==
X-Received: by 2002:adf:f188:: with SMTP id
	h8-v6mr19651503wro.214.1531238908161; 
	Tue, 10 Jul 2018 09:08:28 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	g17-v6sm3943968wmd.25.2018.07.10.09.08.27
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Jul 2018 09:08:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 10 Jul 2018 17:08:25 +0100
Message-Id: <20180710160825.28407-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH][meta-python] python-stevedore: add Py2 and Py3 recipes for stevedore
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
X-List-Received-Date: Tue, 10 Jul 2018 16:08:28 -0000

Based on a recipe from meta-openstack, but with the rmargparse class removed
(which doesn't appear to be needed anymore) and Python 3 support added.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-python/recipes-devtools/python/python-stevedore.inc    | 13 +++++++++++++
 .../recipes-devtools/python/python-stevedore_1.28.0.bb      |  2 ++
 .../recipes-devtools/python/python3-stevedore_1.28.0.bb     |  2 ++
 3 files changed, 17 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-stevedore.inc
 create mode 100644 meta-python/recipes-devtools/python/python-stevedore_1.28.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-stevedore_1.28.0.bb

diff --git a/meta-python/recipes-devtools/python/python-stevedore.inc b/meta-python/recipes-devtools/python/python-stevedore.inc
new file mode 100644
index 0000000000..b23fb4c8c5
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-stevedore.inc
@@ -0,0 +1,13 @@
+DESCRIPTION = "Manage dynamic plugins for Python applications"
+HOMEPAGE = "https://github.com/dreamhost/stevedore"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI[md5sum] = "b736a71431a2ff5831bbff4a6ccec0c1"
+SRC_URI[sha256sum] = "f1c7518e7b160336040fee272174f1f7b29a46febb3632502a8f2055f973d60b"
+
+inherit pypi
+
+RDEPENDS_${PN} += "${PYTHON_PN}-pbr ${PYTHON_PN}-six"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-stevedore_1.28.0.bb b/meta-python/recipes-devtools/python/python-stevedore_1.28.0.bb
new file mode 100644
index 0000000000..70a00c1315
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-stevedore_1.28.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-stevedore.inc
diff --git a/meta-python/recipes-devtools/python/python3-stevedore_1.28.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_1.28.0.bb
new file mode 100644
index 0000000000..3f557f2cbf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-stevedore_1.28.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-stevedore.inc
-- 
2.11.0


