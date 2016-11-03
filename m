Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9B87D71985
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 08:20:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n85so4135858pfi.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 01:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9AfF+5tbDmc3Ci+LiQ7yRnr7KZt1dC1+pK/yqbXVoyg=;
	b=qULMQY0uuAIUs8mLXNx0qgUbjrMn2lo71uGdM96oSXkenAP29iZeHgDxgSWA5UlGCC
	vaWLbiH56ZFXespKySknMy8l7JqdazQiwlvpNHW9bBnbzmYG1VVyF65LM6/xvAjpc/nb
	KDdsOhwNKycQdwigeLVtrfSoEBBuftvSYXDGEe3ZA924xffvlcUE6204SPYV9JH/YTyX
	0Gtbuo4S/cW6qPMCrKtwrXn/5eFb4D0HHF2MerWlgcu3EyXiRsnB7SrQzZa3nOXtqiUB
	j1aZQMQvnVCh4y97rma4Ni1lFOlsXPaNu8YdBkLaWc0G5zIhLpN6zWcpZyIFJHsqJsck
	rEEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9AfF+5tbDmc3Ci+LiQ7yRnr7KZt1dC1+pK/yqbXVoyg=;
	b=j/jJ/1DZ1+2LriQm2QO4qPXcGyHhBGP8Lm9sVFTacOzgzh4umq4zkP57SbKnscGd0z
	8qtRAO02SZTc5QMUDpyvLDePwxlQJV1GlLPxyinAsSn6wshqmWjzz3yFmVcJlOSh8uYt
	VCUrDhKnf57ZHasJ2i9sxQFmDcDk6SA5zBQiJAU85I7XC8RGOnBROmvh9AZ8u4kFyV4M
	APzKiyYF49kE3epN4Ks/rZq5R3C/lmiWoTWAU7GhqHjqKoDoaXiRdVzjX49891iXBVdG
	TxQ9/R88dAqnBG/wkxRroJNhg2oswG2Ip5WhLUMw9weQAru+UVs8QuN7+sftic6UT6wj
	JdDA==
X-Gm-Message-State: ABUngvfsza++XxRJ3VHxDAb5DTraDAHkoi9xTvn4X/LfQn3KKp1YxY4+3AXeMjANPiWsEA==
X-Received: by 10.98.73.203 with SMTP id r72mr14844841pfi.4.1478161247079;
	Thu, 03 Nov 2016 01:20:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	y2sm10386225pfk.54.2016.11.03.01.20.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Nov 2016 01:20:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Nov 2016 01:20:34 -0700
Message-Id: <20161103082038.6331-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161103082038.6331-1-raj.khem@gmail.com>
References: <20161103082038.6331-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/7] libplist: Remove rpaths surgically
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
X-List-Received-Date: Thu, 03 Nov 2016 08:20:45 -0000

Fixes QA errors like below

  /usr/lib/python2.7/site-packages/plist/__init__.py
  /usr/lib/python2.7/site-packages/plist/_plist.so
  /usr/lib/python2.7/site-packages/plist/plist.py
Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
libplist: 3 installed and not shipped files. [installed-vs-shipped]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
index 10d40fb..ae9351b 100644
--- a/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
+++ b/meta-oe/recipes-extended/libimobiledevice/libplist_1.8.bb
@@ -16,8 +16,14 @@ SRC_URI = "http://www.libimobiledevice.org/downloads/libplist-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "2a9e0258847d50f9760dc3ece25f4dc6"
 SRC_URI[sha256sum] = "a418da3880308199b74766deef2a760a9b169b81a868a6a9032f7614e20500ec"
 
-PACKAGES =+ "${PN}-utils ${PN}++"
+do_install_append () {
+        chrpath -d ${D}${libdir}/python*/site-packages/plist/_plist.so
+}
+
+PACKAGES =+ "${PN}-utils ${PN}++ ${PN}-python"
 FILES_${PN} = "${libdir}/libplist${SOLIBS}"
 FILES_${PN}++ = "${libdir}/libplist++${SOLIBS}"
 FILES_${PN}-utils = "${bindir}/*"
+FILES_${PN}-python = "${libdir}/python*/site-packages/*"
+
 
-- 
2.10.2


