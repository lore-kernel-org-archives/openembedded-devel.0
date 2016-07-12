Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id 35F3E70101
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 00:58:54 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id i12so59888ywa.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 17:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WwMOXTOmZrwjt3yGM+ovlsFuXXGRJRcZyEHNZsnUN7o=;
	b=kMWYDwGVJkdtJ8jxo7Mtoe8NUgc/cxzswNyz7vV/1BY8L7zQu2P3qIP+xh63Zh7XIB
	IcgySjG3W6iPBL5xddj+rXQ+oYdHW2pBTj2j2uhRsr3A8K4TT2QRnIdXQh8ZRGZ5d2LL
	6fEMqzU9WkBr1BC2o0wb9kPH6cEj5sg/PCkzPk4ZO6PxgrVI6hQ2tkrEkHLg0qTV2pYY
	8F1OfQYKHTQn6DIj8kIi3FMSay7riiqMEBNdEyn4CA+MiJ29h61nT+687Tx9kPrtuex3
	r2S8svXTOq7flIdzRxaWUDY4WWf/4u7KM8gFC0K7lvW+jCZRbwaEl30UJ6zERbwKLlFs
	zbJw==
X-Gm-Message-State: ALyK8tIm4z4vuUfycpBKmI//4ssZBijAG2MWUaKQirwVQz1dm2Bf9g1a5KMj3s7YdsT1uw==
X-Received: by 10.37.119.195 with SMTP id s186mr14598370ybc.173.1468285135392; 
	Mon, 11 Jul 2016 17:58:55 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id k5sm5272971ywd.50.2016.07.11.17.58.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jul 2016 17:58:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jul 2016 20:58:44 -0400
Message-Id: <1468285124-28876-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-pyephem: add RDEPENDS to package
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
X-List-Received-Date: Tue, 12 Jul 2016 00:58:56 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
index 2e97013..e28ce6c 100644
--- a/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
+++ b/meta-python/recipes-extended/python-pyephem/python-pyephem_3.7.6.0.bb
@@ -11,3 +11,7 @@ PYPI_PACKAGE = "ephem"
 
 inherit pypi setuptools
 
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-math \
+    "
-- 
1.9.1


