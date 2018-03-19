Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5E93178923
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 12:15:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id y6so17649211qtm.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 05:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M1vbr4Bta50ND3GLkS9NW75bKgG5IE+5Z/T1/P4i/eI=;
	b=KkHbqkrFM9gCq2sBFAMB54tIp+2qycbOxD4t9ZrVv5CYHAsKlUClHhUl0z+GjWmLm5
	qtPnCQzNmJ3ChfGBS/vn7WMA/eCyC+lLt/oPXIvyPfjd0sypMdkXcKykbO8QuqBkJBGW
	DcuUY2JZPH5pklrgAzMeVy0FZpJrw3EZGUpeV0evbonxp89mGSHHkBkYlnBnvhSyf44K
	XjvERGPMpO5s7oLDj1YGDaUY58AlM8R/IC9ymSooPSHKjs7X6FhBoBBKj5B1U1WQk2wO
	omy4PHtoOWdWIwg7Mw52eToND4+1D34UvAjScnsTLDyL5j06mrnsT6aJrjZXbVndCuCb
	wAzA==
X-Gm-Message-State: AElRT7F3SVo3PjDmoW69lIu9zdykzNtQCSG5APGfZyw9EmA8tUWK+tsQ
	RgfpnY28hQgDz5PV9NhyvVI20qcH
X-Google-Smtp-Source: AG47ELtjHM3RcALfavtVv8/yVbTRtMChBKsjHGnMg79hNdWx6X8jzHgyVrRmPuIpH0JdPYZqEgoThw==
X-Received: by 10.237.44.100 with SMTP id f91mr18142592qtd.80.1521461723029;
	Mon, 19 Mar 2018 05:15:23 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	e21sm10440377qta.4.2018.03.19.05.15.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Mar 2018 05:15:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Mar 2018 08:15:16 -0400
Message-Id: <1521461716-2625-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-thrift: update to version 0.11.0
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
X-List-Received-Date: Mon, 19 Mar 2018 12:15:22 -0000

License-Update: Checksum change based on release still covered by Apache-2.0

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../{python-thrift_0.10.0.bb => python-thrift_0.11.0.bb}          | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename meta-python/recipes-connectivity/python-thrift/{python-thrift_0.10.0.bb => python-thrift_0.11.0.bb} (50%)

diff --git a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.10.0.bb b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb
similarity index 50%
rename from meta-python/recipes-connectivity/python-thrift/python-thrift_0.10.0.bb
rename to meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb
index e6f61bd..8047ec7 100644
--- a/meta-python/recipes-connectivity/python-thrift/python-thrift_0.10.0.bb
+++ b/meta-python/recipes-connectivity/python-thrift/python-thrift_0.11.0.bb
@@ -1,11 +1,9 @@
 SUMMARY = "Python bindings for the Apache Thrift RPC system"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=26a2009ddcb7c4162f8bafd5ef73c670"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e3641ae1a26cf5c12a3a71bd3030ab0e"
 
-SRC_URI[md5sum] = "76bb768a210257dd203923110042e560"
-SRC_URI[sha256sum] = "b7f6c09155321169af03f9fb20dc15a4a0c7481e7c334a5ba8f7f0d864633209"
-
-PYPI_PACKAGE_EXT = "zip"
+SRC_URI[md5sum] = "36165d5c80e6b101dbe9fcf7ef524d51"
+SRC_URI[sha256sum] = "7d59ac4fdcb2c58037ebd4a9da5f9a49e3e034bf75b3f26d9fe48ba3d8806e6b"
 
 inherit pypi setuptools
 
-- 
2.7.4


