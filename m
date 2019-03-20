Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id E6F1A7CE6B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2019 13:07:39 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id p1so2665213wrs.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2019 06:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=UKbrEsIpxpC2SKvz2ucC9pYw9AxenfbpTo7+heo4geY=;
	b=BQl+HqmoAEKqqUOKvdPRTge35Y1QUdpV6TzLjNnaeXGTp55nsYa6sOQQL4e0U4k2QI
	9TlgYv6gp347ccJ2znU3phSclp4rRUoMZ0V0UX0E3z+WHFQzsYr0y7MFyI1usB6Z3w4k
	Qye3h3/Ny5UzlNniz98n//5SwX6QIeaU/F3gyCncSyt+gTE4Uw72fCJQliNZsCSCIQWx
	uqQfo9+IxR3qd+bVt5gBodtwerUEVmwXda01cUTwIZ0jIZyx9hTOUDRa3+sO3a1w4M+E
	pD5RQ/FqEJT75+BZW44FjQepe5SYEkXA1QGPqHzeQL4BW38s8V2hSF/cGYISfBIk+R4c
	p0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=UKbrEsIpxpC2SKvz2ucC9pYw9AxenfbpTo7+heo4geY=;
	b=ZnIKVp1iyDiEbV85HpVq8oqplTUCY/HBWLr8Qbl+RakNV03JXp602+ozBVZJFkwoR0
	w69yBoa+24TKuqXVWud1UiYY52LOB42TdZRWJNk9XUPaET23FLOMU+nQz1QaS3lZTzok
	hThN5+gqwcolmlDnb0eMo1xKz4JG6sOeu5GPXcb6jHieFoH21+2iQiHVaVveO5Kvenhl
	2E64wYBf8kMcnqFk2ll/s2LdsTaqVazjtzQaBiukFVAH1BuyS+9YZaxqDrLLxSTAjR9K
	pWoIOeK4s8t3ToTmdNmN1CdsUwZL1UO/c3/rBqHOzPYn07DEyzv7cPXrjki+0aRa8tpF
	Z+eg==
X-Gm-Message-State: APjAAAXYRT6aoBQaNDeDB8Cb/nIeutdoZ5s/ldw3qK92+eZC5JZ2hg+z
	tOWS9wMyvZPFyrJEfg6is5RVWG9NEEk=
X-Google-Smtp-Source: APXvYqzwxYwGz42Kgl3MOXgVlUbLpxIRiHQDQhnRwOov/kaahexz9PocMksruz7wZwPDlRnNcxsmPw==
X-Received: by 2002:a5d:458f:: with SMTP id p15mr7586570wrq.188.1553087260058; 
	Wed, 20 Mar 2019 06:07:40 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id u12sm2425754wrt.2.2019.03.20.06.07.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Mar 2019 06:07:39 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Mar 2019 13:07:34 +0000
Message-Id: <20190320130735.16859-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-python][PATCH 1/2] python3-pylyrics: add recipe
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
X-List-Received-Date: Wed, 20 Mar 2019 13:07:40 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/python/python3-pylyrics_1.1.0.bb        | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
new file mode 100644
index 0000000000..207751c451
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylyrics_1.1.0.bb
@@ -0,0 +1,12 @@
+SUMMARY = "Pythonic Implementation of lyrics.wikia.com"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://setup.py;beginline=14;endline=14;md5=95d480cd6f8471abaeae21bd0ed277ba"
+
+SRC_URI[md5sum] = "1f3c997edeba149a8fb2b861cbad89c3"
+SRC_URI[sha256sum] = "c5f36e8ef0ed3b487a9242ce34c19f9684e418a5bbffd5d367dc1d1604b4cd0b"
+
+PYPI_PACKAGE = "PyLyrics"
+PYPI_PACKAGE_EXT = "zip"
+
+inherit pypi setuptools3
\ No newline at end of file
-- 
2.11.0


