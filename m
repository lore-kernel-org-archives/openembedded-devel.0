Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2F454601D4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 14:17:54 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id i8so1724967qtj.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2018 07:17:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pI33yYAeh1tdDvrCuH7N3Bx6dRGdJu/HK3qgBgNK3B8=;
	b=NfzrEdzM7a91wCqBgwDiKuvgmJxo0Siqk+zbIfXwzEiH81ebvmHrGsf7AySS/kfSc6
	HJ7iAt50Qb42+1QmE9hpH4EX87IVQKPizS85ZasnjnoUwBa29VcPErx7PmiOavqD+mrC
	oTxXLXmH5+iMae4JTb6RDh3fx8g/crLfi+St7Enfl4rE5bhywTjzuPnWVyVj0IHMN5pJ
	iIGUe8iz99zmcD21HbL9pf1VrZq9qKHoJzIDjII+iZNk/kiG07nPyngeocQ8Rjisd6C3
	QG/0pgUbRvVRy4A/a0NkxXv5VoYUjbizep96xAXFDY0AYtJUaBqtcIToMF8cB6xzPqFt
	Ml7A==
X-Gm-Message-State: AElRT7HX4YQAmdoJ03Ua34t0f9wNh8mexMrewkfR/tQY/6zFP3PExESr
	GwR2r0pbLF/i6e4oM34bo74mmzGv
X-Google-Smtp-Source: AG47ELtCLpD+bXSq7f84n0Jewt6QiZfIKimpCVh55OK9n9Pzg0Sg85rlF/4957UsZdMxxDweioEc2w==
X-Received: by 10.200.51.215 with SMTP id d23mr24080770qtb.338.1521555475628; 
	Tue, 20 Mar 2018 07:17:55 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	x31sm1320826qtc.55.2018.03.20.07.17.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 20 Mar 2018 07:17:54 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Mar 2018 10:17:47 -0400
Message-Id: <1521555467-29480-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-astroid: add logging to RDEPENDS
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
X-List-Received-Date: Tue, 20 Mar 2018 14:17:55 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-astroid.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-astroid.inc b/meta-python/recipes-devtools/python/python-astroid.inc
index 593a09c..2c9d409 100644
--- a/meta-python/recipes-devtools/python/python-astroid.inc
+++ b/meta-python/recipes-devtools/python/python-astroid.inc
@@ -19,6 +19,7 @@ FILES_${PN}-tests += " \
 RDEPENDS_${PN}_class-target += "\
     ${PYTHON_PN}-distutils \
     ${PYTHON_PN}-lazy-object-proxy \
+    ${PYTHON_PN}-logging \
     ${PYTHON_PN}-six \
     ${PYTHON_PN}-wrapt \
     ${PYTHON_PN}-setuptools \
-- 
2.7.4


