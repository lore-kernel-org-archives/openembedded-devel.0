Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8F68B7D5BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Apr 2019 19:12:45 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id a6so6681969lfl.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2019 12:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XYrWXUb4EEm/ChVO6XknFsm346PM6dlsQ9yPonI3BiI=;
	b=RcPKOV3AquW24/+yiNLAx8WmPZ+Fb6FqKiSz7yBUpiBfyALmMzy6tmhyHbebPg4/Iy
	Ks1fUIschFEtJ4mdgkMSZU0fJ9Xezc6bGgqHylIO5hRwiDbyxElZJqzm/4EbfxoUPlot
	rKS1/IzPWiDp7u/wyTXVBA1GAnKMRG5EQ5GYS6CC8LTYnKiaWt+cheeWVq63ml/xGuFx
	EHRyZUU9J4jVHcDLVgqp7NJkACeqOGopoASc+kS0wfjM0mhlCbhcQJNQbq6sBwMgfjiQ
	CXNuU7QV0ZdwHXZvfhaqj0R9oTuNplDIL5rwSSGcOXvhVcVX+BWqpH8vNLbwmm83Yfcp
	jFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XYrWXUb4EEm/ChVO6XknFsm346PM6dlsQ9yPonI3BiI=;
	b=Y7C4pyfuqec0MQiV+umbal8e1J/Dn2UxTsWyifOaT1AdIx/mv+RO6zw42RAXx1Voo/
	Z8HWmWDI9zyQeiFeo95O3eddonQFO3AhjQpWizl2EU7x6D0Leglx1Gckkx8V+68uD6fB
	72UzfM0pas5vV3/oYqCMTgaz/4GhjnO/5yU4Wm9+6ez/gWzNvBk2mXKwqYHx2IAtZZ8+
	5YJwLb/PuDcMEB5PkApmXS+gQvEWjtr3mf+IW+ncdnL77lz0tOUbNQaFy/hB3/2oQy55
	tswhX3wnL8HEL58wWUPZ2iirwmMYVfxVL2TYZPPeIA7gMeMZuOH9BnK8yr6yEK+zUUbH
	axAA==
X-Gm-Message-State: APjAAAW2hU6Bk6CL38IEhGZPWk4FT55pZU85aJaPVTWMfCfRRcGKlF5O
	MHQRHYTCMHzFA5y9vK13ZJjzK8QTlHM=
X-Google-Smtp-Source: APXvYqztV7LF8oHSL+D51jZNg+PvimytVJcVsWB4IQcjdGDergEkAQHBxfnLML7E0YVxJhrcEKKcOA==
X-Received: by 2002:ac2:5629:: with SMTP id b9mr7069372lff.100.1554577965922; 
	Sat, 06 Apr 2019 12:12:45 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	k25sm5473433ljc.14.2019.04.06.12.12.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 06 Apr 2019 12:12:45 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Apr 2019 21:12:40 +0200
Message-Id: <20190406191240.6842-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nuttcp: update to 7.3.3
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
X-List-Received-Date: Sat, 06 Apr 2019 19:12:46 -0000

License md5sum changed due to modified copyright years.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nuttcp/{nuttcp_7.2.1.bb => nuttcp_7.3.3.bb}          | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)
 rename meta-networking/recipes-support/nuttcp/{nuttcp_7.2.1.bb => nuttcp_7.3.3.bb} (69%)

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb b/meta-networking/recipes-support/nuttcp/nuttcp_7.3.3.bb
similarity index 69%
rename from meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
rename to meta-networking/recipes-support/nuttcp/nuttcp_7.3.3.bb
index 9430add48..ec4067806 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_7.2.1.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_7.3.3.bb
@@ -1,6 +1,3 @@
-# Copyright (C) 2013 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
 SUMMARY = "network performance measurement tool"
 DESCRIPTION = "nuttcp is a network performance measurement tool intended for use by network \
 and system managers. Its most basic usage is to determine the raw TCP (or UDP) \
@@ -11,11 +8,11 @@ number of bytes."
 HOMEPAGE = "http://www.nuttcp.net/Welcome%20Page.html"
 LICENSE = "GPL-2.0"
 SECTION = "net"
-LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=ae7045c3c3616092e07d87f04ba0d960"
+LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=c55daba5a5a869a123c3565de07d15a6"
 
 SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c"
-SRC_URI[md5sum] = "1ebf4a08bad2a295a8155f02995e8754"
-SRC_URI[sha256sum] = "c6e33810ccce67260f8d5d627f60e429d44f532365c58ed5673d035e2a59c4db"
+SRC_URI[md5sum] = "dfbff3c38fb0cbdc474ca6d13539d425"
+SRC_URI[sha256sum] = "d68e291a72375d76f301d54aa945727c95e78090aa6783a4844764e632e98a4a"
 
 S = "${WORKDIR}"
 
-- 
2.17.1


