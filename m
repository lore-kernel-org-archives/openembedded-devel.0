Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 254E578687
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 12:39:58 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id u42so13947879qte.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 04:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=1HnzDL53RM53DWTV6KPMhPxek0n7yGm77Ca6u+XTDmo=;
	b=FcPxUGRWyE8gz2sLMGT4tLy0zND5s54EVy77sKnN1L6X1O0ASqwkyFwx5PlOhCnlMd
	pY9j6W+kVMeQIhhmL1274KhIcUTB2X4loEbZ6e085o1cBHfFePZQHoEPAQl1DK/24OuF
	KymqzFaJc+PCQo62/ExmmDSFb+ZhxxlEEHYanduqGAhQlODMumme9m62cmCZ3JJLe+L7
	0ru+SD2orOP+4qCrH9s1q0LIhYcTaJSlOl9SLlspchOd78DCRCabEDU6IwB3Kt7w90AZ
	P/apEbH0cxohSPjyFGsAipaIg4r3OZTiKcsAu4dOSgA1DzLNYyyk8t6CluIpAmjRWcdw
	brxg==
X-Gm-Message-State: AKwxytdRjfqHVOH3t6FpwMXHM7R9Aao63IFbJGKqbsbBdP4325SzoVNv
	wqbMthU7BQD+JkZCOdSH/mYkFA==
X-Google-Smtp-Source: ACJfBotXYUeHsKKaFnh/1v+RhhlFQyez4dhXmDY4XgJbW0xsd9DCLK7Z8XRbZr6JHYwRBsArAmOCPw==
X-Received: by 10.237.59.113 with SMTP id q46mr6882136qte.222.1516019999958;
	Mon, 15 Jan 2018 04:39:59 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a27sm6101822qkj.94.2018.01.15.04.39.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Jan 2018 04:39:59 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 15 Jan 2018 10:39:52 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jan 2018 10:39:45 -0200
Message-Id: <20180115123946.26327-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-python PATCH 1/2] python-pycrypto: Consolidate recipe code inside of .inc
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
X-List-Received-Date: Mon, 15 Jan 2018 12:39:59 -0000

This move the patches and installation tasks inside the .inc. This is
required for the addition of python3 version of the recipe, in next
patch.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
 - rebase on top of master-next

 meta-python/recipes-devtools/python/python-pycrypto.inc      | 6 +++++-
 meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb | 4 ----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-pycrypto.inc b/meta-python/recipes-devtools/python/python-pycrypto.inc
index fb2c17df1..232cdb711 100644
--- a/meta-python/recipes-devtools/python/python-pycrypto.inc
+++ b/meta-python/recipes-devtools/python/python-pycrypto.inc
@@ -3,12 +3,16 @@ HOMEPAGE = "http://www.pycrypto.org/"
 LICENSE = "PSFv2"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=35f354d199e8cb7667b059a23578e63d"
 
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-pycrypto:"
 
 DEPENDS += " gmp"
 
 inherit pypi autotools-brokensep
 
+SRC_URI += "file://cross-compiling.patch \
+            file://CVE-2013-7459.patch \
+           "
+
 SRC_URI[md5sum] = "55a61a054aa66812daf5161a0d5d7eda"
 SRC_URI[sha256sum] = "f2ce1e989b272cfcb677616763e0a2e7ec659effa67a88aa92b3a65528f60a3c"
 
diff --git a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
index 919f91ecb..e13db01b7 100644
--- a/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
+++ b/meta-python/recipes-devtools/python/python-pycrypto_2.6.1.bb
@@ -1,10 +1,6 @@
 inherit distutils
 require python-pycrypto.inc
 
-SRC_URI += "file://cross-compiling.patch \
-            file://CVE-2013-7459.patch \
-           "
-
 # We explicitly call distutils_do_install, since we want it to run, but
 # *don't* want the autotools install to run, since this package doesn't
 # provide a "make install" target.
-- 
2.15.1


