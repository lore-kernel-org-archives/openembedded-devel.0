Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3E04772002
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Feb 2017 17:51:27 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id s58so5897022qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Feb 2017 09:51:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aImPgAagwr//xpu2r6Q20eYzVqdgts2WUE/XVLdYjF8=;
	b=TkwH+IZUsykK5Hup44337Oj2XNYS+lYaScYlu1XltXqQbTT8qxYUzBFZyGjC1zo8gZ
	aGZ2DalD0pjjolaoHdVM8mTlzqTlcTOi1pzAHdQRSJTbEVZp/4ZK43lIVFLWIUfXRvsr
	CvCcGpV8ofC3iIlr3/TLjnG3Qjy3tguEBcaYAxET3/qZa4QnWBGLdgzYZwjdkf6pe4ng
	vix039oGXnwfGYRkeoiWMzT0A2dh1Hk2Qd7EEX2IBeSgrcm9yCwc8l9hgS1st1OW232Y
	uqmNSC/UjoQuKzv842DpUGXWRKolrzN4Ae7xVKk1EOmyem9dIDEkKmcN3Ox4XetBADDf
	3qxA==
X-Gm-Message-State: AIkVDXJ2WsPg1oBEGj6Mj7anRihZZnHcfa3R0Z5fgTW8hpx8N1HC1XSrtt5iwURpLkZx+g==
X-Received: by 10.237.57.201 with SMTP id m67mr14677614qte.181.1486144288254; 
	Fri, 03 Feb 2017 09:51:28 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	v187sm7867764qkd.20.2017.02.03.09.51.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Feb 2017 09:51:27 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 12:51:15 -0500
Message-Id: <1486144277-7201-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH 1/3] python-cryptography-vectors: add to the DEPENDS rather than replace
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
X-List-Received-Date: Fri, 03 Feb 2017 17:51:28 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-cryptography-vectors.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
index 6af37ed..fc10cb2 100644
--- a/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography-vectors.inc
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 | BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3617db4fb6fae01f1d253ab91511e4"
 
-DEPENDS = " \
+DEPENDS += " \
     ${PYTHON_PN}-cryptography \
 "
 
-- 
2.7.4


