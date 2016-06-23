Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id BA6E66FFAB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 16:02:34 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id a186so16573885qkf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 09:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UhWVaGHr/uq0ac6yMszy4NbaOlgT8ll3XzQnmXMqyH8=;
	b=FDxjkRNpjOi1jgAD6hbc2JVMfs/2/0Ra69ZxbVbvnV0RT9JTYDmpifQjbt0NX/UJ/T
	qgGFsl0925wIbbNvpe6Qulg7jBqVDG5hEUJKyukxQV+EmRaX2fuH/QnviWKwYRTvqGZ+
	tcJBIISJPWZ4eHXJmGchslkGDZZcSv21ktW+fTO92D3GjLVHNUfN9ibHYVtZ/nYy1KxQ
	zW8+lOma2U3HRTBII1JhoHT5UvIxRCu6Ihe+V6gHwJpUCd5jud55PQianwxZqbYLpJpS
	BxaikyNcl71zLaaFdY4Gi3UBLarS8NI+wxDJC4yfw4C6Mtpdp95Omrbo2355iPIpmRr3
	UB5g==
X-Gm-Message-State: ALyK8tKuySWJgboAUhRM7RbXpG6q9Nc3f5hcJwkbMhfAIyb04hbSWQubAiDXZ55hlxWCRw==
X-Received: by 10.200.55.37 with SMTP id o34mr46339697qtb.70.1466697754883;
	Thu, 23 Jun 2016 09:02:34 -0700 (PDT)
Received: from lnx-desktop.star.lab (c-73-172-178-168.hsd1.md.comcast.net.
	[73.172.178.168])
	by smtp.gmail.com with ESMTPSA id i37sm304474qti.42.2016.06.23.09.02.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 23 Jun 2016 09:02:34 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Jun 2016 12:02:27 -0400
Message-Id: <1466697747-10078-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-python][PATCH] python-pyro4: update recipe to use the pypi class
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
X-List-Received-Date: Thu, 23 Jun 2016 16:02:35 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-connectivity/python-pyro4/python-pyro4_4.39.bb     | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
index 45b793d..5b4ca7b 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python-pyro4_4.39.bb
@@ -1,16 +1,10 @@
 SUMMARY = "Python Remote Objects"
-HOMEPAGE = "https://pypi.python.org/pypi/Pyro4/"
-SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b48b62dd270c4691fabaa85be3236030"
 
-SRCNAME = "Pyro4"
-
-SRC_URI = "https://pypi.python.org/packages/source/P/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
-
 SRC_URI[md5sum] = "75ed5cd142803b0a8d587dc8b6bb51ed"
 SRC_URI[sha256sum] = "39c6ca7f86b0f0bebfeada687a5a8b99f66470a52b0f815195ae63c683266f24"
 
-S = "${WORKDIR}/${SRCNAME}-${PV}"
+PYPI_PACKAGE = "Pyro4"
 
-inherit setuptools
+inherit pypi setuptools
-- 
1.9.1


