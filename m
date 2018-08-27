Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 54C3D79322
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 11:08:00 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id y139-v6so7647120wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Aug 2018 04:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ho4DKgyRzgqiU/tGW6BGdqxqqMvw6EOzquJwo3QL6pc=;
	b=GquKy1otfS2sbR9Jo8YSCnZm1E0x/yHBXMDbaXqKWmaJ9JUdE9sLhGxWWeMAr36K9e
	4/ywhrN2fNTHn9RCLxBV477SmlmM7ISjOKRZTWsN+Cihqtq9hLwIh1c4B93Rs/UkFtqc
	omwl3OvwJ9ySp+Tna2c1xeH3XZrwsu6O6V94dXIyCaxKl5kV/7fRKWNjQ593JhUnzFYy
	Oqs3qLQ5LhIE49ywm0rRZQu+kny/g0SjI65+cXMdw2ej4hXcftD26SQAU8By0Bl2ZGFN
	83CxpOgdTOB5TRmsGO9l/nEvzlUYz5SsrYwLg3qILbh6+JofZ+4+1W1BIbNi99ZiuE2r
	h42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=Ho4DKgyRzgqiU/tGW6BGdqxqqMvw6EOzquJwo3QL6pc=;
	b=o9hkR/tqTmvFQm1hqjJqC+Ic5hd7yHFcWo0b+FDLz97ohu5RFX6VzhjMOyzWYYpSF7
	8UE4HWZFCqeDzZ4JzX8O/LdB+XRkoJMAZVojo/vjLxwC775KZk6hRnRvHO2stwErWKhJ
	671sleKKD5RTk9lDpeW/ASGW+gZkCyLQ5kmzHwXhatJuqkDsNQcsFD6RgFbPnGP/UV6a
	jLA/czNd4ry9fe3CotW+JhXGXp27Rp8ayNnZPxJd5XXTgfAvkKgFVSOHnbh0OBAulIOv
	a5i2ByMdJpbQqGEiOypuJ0DP1bCiS8T59J8YKDGQO9d0UBbXkxg2ETFTQwtmnxphg3An
	O4pQ==
X-Gm-Message-State: APzg51DBvTC+yejJ1qjrTDSb7DkF96rAU5Jwht4F71SAFteAfArM8ISV
	yR3qiB9GU7VkLCHWkFoa+/nR4cYN
X-Google-Smtp-Source: ANB0VdaleRAgx4n/1SxiXRIv6Lo7RDmpJ2rT7oj2f/rJ6Sj+/FmKCBvoQqHNhyYTMPd6f7yL0hH0Bw==
X-Received: by 2002:a1c:aa0c:: with SMTP id
	t12-v6mr5114974wme.109.1535368080757; 
	Mon, 27 Aug 2018 04:08:00 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	a11-v6sm19243016wrr.81.2018.08.27.04.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Aug 2018 04:07:59 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Aug 2018 13:07:34 +0200
Message-Id: <20180827110735.6396-5-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180827110735.6396-1-sno@netbsd.org>
References: <20180827110735.6396-1-sno@netbsd.org>
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [meta-python][PATCH 5/6] python{, 3}-intervals: add recipes for python2/3
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
X-List-Received-Date: Mon, 27 Aug 2018 11:08:00 -0000

Add recipe for interval arithmetic for python supporting python2
as well as python3 infrastructure of Yocto.

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 .../recipes-devtools/python/python-intervals.inc  | 15 +++++++++++++++
 .../python/python-intervals_1.5.4.bb              |  2 ++
 .../python/python3-intervals_1.5.4.bb             |  2 ++
 3 files changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-intervals.inc
 create mode 100644 meta-python/recipes-devtools/python/python-intervals_1.5.4.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-intervals_1.5.4.bb

diff --git a/meta-python/recipes-devtools/python/python-intervals.inc b/meta-python/recipes-devtools/python/python-intervals.inc
new file mode 100644
index 000000000..1ecca3524
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-intervals.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "Interval arithmetic for Python"
+HOMEPAGE = "https://github.com/AlexandreDecan/python-intervals"
+SECTION = "devel/python"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
+
+PYPI_PACKAGE := "python-intervals"
+
+inherit pypi
+
+SRC_URI[md5sum] = "a35dd44269fdb134bf19cfd80cb2c120"
+SRC_URI[sha256sum] = "a8a15b7c2fadb8465310f44aa96e384828b35a29de38ac74738cd665924cb8ac"
+
+BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python-intervals_1.5.4.bb b/meta-python/recipes-devtools/python/python-intervals_1.5.4.bb
new file mode 100644
index 000000000..3c2a33bbc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-intervals_1.5.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools
+require python-intervals.inc
diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.5.4.bb b/meta-python/recipes-devtools/python/python3-intervals_1.5.4.bb
new file mode 100644
index 000000000..8cbe1090f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.5.4.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-intervals.inc
-- 
2.17.1


