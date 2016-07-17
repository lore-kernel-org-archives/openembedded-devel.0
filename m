Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id F30A76FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 12:52:22 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id p126so4644055qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jul 2016 05:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VgtNRsD5Su+EqlFE/C/xeF5EDcm6debR0yOKmF8WTz8=;
	b=kT0M7VMewCsLEuN/t7EBUZZgM74i9RpQSPrHs9QFabd01gpzsahZCXPX6fLl3Z9iSN
	9SHhKlhVletlSZssIRMQ7/OMq44EdAVpQRCVCeN/5yRKhs2FjXUpZitHap3zM+JAQl5Y
	UbOWRIku8ZubNbpCeHU9cD7FfZZb2GQKvSt15buzGpIEx5axNGgLFvoKWZbkCWNiqxFf
	t4zWiyYCTyrxO/MYouDLdFx55NxQc2QUpsfFpWj7Ov76l65hKccI6Mwtb9+ag3iVObnI
	mysV8PEt1o4k2jvBVweYLXujs3YHTqU8ZAW5XcVttNbyZZrqbTFajB2x1W8WoXhZXstJ
	A4gg==
X-Gm-Message-State: ALyK8tLkHnwVTSNFEfZzjavLyLgFU6Kn8WqXB0iFTuZSKaChRWjzXGrS0qlSpdSxd/LOUA==
X-Received: by 10.55.126.7 with SMTP id z7mr36004611qkc.172.1468759943022;
	Sun, 17 Jul 2016 05:52:23 -0700 (PDT)
Received: from lnx-desktop.minotaur.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id x42sm423018qtc.29.2016.07.17.05.52.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jul 2016 05:52:22 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Jul 2016 08:52:12 -0400
Message-Id: <1468759932-11044-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-flask-navigation: update package RDEPENDS
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
X-List-Received-Date: Sun, 17 Jul 2016 12:52:23 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb b/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
index 8ff6abc..b2dc96e 100644
--- a/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
+++ b/meta-python/recipes-devtools/python/python-flask-navigation_0.2.0.bb
@@ -9,4 +9,7 @@ PYPI_PACKAGE = "Flask-Navigation"
 
 inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-blinker"
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-blinker \
+    ${PYTHON_PN}-flask \
+    "
-- 
1.9.1


