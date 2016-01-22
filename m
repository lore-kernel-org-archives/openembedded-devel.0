Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B568175A31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 23:30:57 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u188so518691wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jan 2016 15:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=SVLpsUkSz7tf5BTmLAT5IiKT1C6M+rUAi5PYA7bne8k=;
	b=a2qeGzq+j1fyQvNKbyFT5YR/9MRJIwC70RDKVWO+4vhPk1ahXwUfshePwsW/fvopnS
	TYhjbDEnGiKJ/Q0Snpxvo1yQ6tYtc2o1XvWjSr3SH2iyYbUVXlMUrRypMpadjcBuQCHp
	w73uPG6vk5DrryZoNUNTmSrpflZKDMwdPAv2Iiem6gcmLUatwA3sTha6DqcJSNtPb+eN
	12mg2q5mtZK7DM3uqBJpWmijJ/TwyqenMcslA5A0y/13ef9p0sk3/RvCFahISAm3DMVY
	g41ts1ppgbUW6Cp2+lllr7p36Sowolqk8gNyb9mzvYztZw5qqlSvlIVhMQGnCdgt9hwg
	zpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=SVLpsUkSz7tf5BTmLAT5IiKT1C6M+rUAi5PYA7bne8k=;
	b=ephir/+/nuePdWlQNcZiv5+IX+0n2Y64aSPDj1Z4OC+bagd5sfdOKCz3Fq1KQobBaP
	wS1r1HyLadCsnBpAMnKvBgzzdawp6pGNxW5Awhm/tvOT0C/32hT7pjXc1iquTz/GQs1/
	yUKHaolrlSUJMXmcGH3Z2I1VmVmtbUS5WbPKg2HWVTVWOKTuUkrzJQ/EAy98bWnCOfMJ
	71UtLpY5uaYCpE6Nk7NSQQFLOZcuNocMAWvptJpnMTHjI8eY1n2Fzzo6Rw9drSiCoTGg
	BcmnOYGRyRlV+v7R9/nFeN/NpPn1VesGDIHakgvlo373tpcegr2b5gLxS4mZuQas4s5G
	hKWQ==
X-Gm-Message-State: AG10YOR/aFXdz106NRJcdn9JkDigVoJMh+eyJKa6zOFuz+y9+sIoiZpVZ4vGC8rHTodWPQ==
X-Received: by 10.28.144.10 with SMTP id s10mr5787723wmd.97.1453505458384;
	Fri, 22 Jan 2016 15:30:58 -0800 (PST)
Received: from ubuntu.ebenfeld.local
	(ip-109-90-30-143.hsi11.unitymediagroup.de. [109.90.30.143])
	by smtp.gmail.com with ESMTPSA id
	ka4sm7882127wjc.47.2016.01.22.15.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 22 Jan 2016 15:30:57 -0800 (PST)
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 23 Jan 2016 00:30:16 +0100
Message-Id: <10f3a4710ecab187c108c4cf8847666850aa94dd.1453504827.git.sven.ebenfeld@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
In-Reply-To: <cover.1453504827.git.sven.ebenfeld@gmail.com>
References: <cover.1453504827.git.sven.ebenfeld@gmail.com>
Cc: paul.eggleton@linux.intel.com
Subject: [meta-python][PATCH 14/21] python(3)-pymongo: add recipes
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
X-List-Received-Date: Fri, 22 Jan 2016 23:30:57 -0000

Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
---
 meta-python/recipes-devtools/python/python-pymongo.inc     | 12 ++++++++++++
 meta-python/recipes-devtools/python/python-pymongo_3.2.bb  |  2 ++
 meta-python/recipes-devtools/python/python3-pymongo_3.2.bb |  2 ++
 3 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-pymongo.inc
 create mode 100644 meta-python/recipes-devtools/python/python-pymongo_3.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-pymongo_3.2.bb

diff --git a/meta-python/recipes-devtools/python/python-pymongo.inc b/meta-python/recipes-devtools/python/python-pymongo.inc
new file mode 100644
index 0000000..5cdd5bd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pymongo.inc
@@ -0,0 +1,12 @@
+SUMMARY = "Python driver for MongoDB <http://www.mongodb.org>"
+DESCRIPTION = "\
+The PyMongo distribution contains tools for interacting with MongoDB \
+database from Python. The bson package is an implementation of the BSON \
+format for Python. The pymongo package is a native Python driver for \
+MongoDB. The gridfs package is a gridfs implementation on top of pymongo."
+HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=2a944942e1496af1886903d274dedb13"
+
+SRC_URI[md5sum] = "463b4d325d8fb4070c04f15391b457bf"
+SRC_URI[sha256sum] = "f50a5380b45a83c5ea1e673ff19363d3cfd5850f7620536e51341d26eb2ae979"
diff --git a/meta-python/recipes-devtools/python/python-pymongo_3.2.bb b/meta-python/recipes-devtools/python/python-pymongo_3.2.bb
new file mode 100644
index 0000000..4038898
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-pymongo_3.2.bb
@@ -0,0 +1,2 @@
+inherit pypi
+require python-pymongo.inc
diff --git a/meta-python/recipes-devtools/python/python3-pymongo_3.2.bb b/meta-python/recipes-devtools/python/python3-pymongo_3.2.bb
new file mode 100644
index 0000000..d2cfd55
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pymongo_3.2.bb
@@ -0,0 +1,2 @@
+inherit pypi3
+require python-pymongo.inc
-- 
1.9.1


