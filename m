Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id F147C78C31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 16:45:43 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id e19-v6so2203498qtp.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jul 2018 09:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=FYC8VkI4iDp4DYxhZjuna3/IqkB4vrjtvHisPHJZVR8=;
	b=sZQQr9G+nVMPW/ciOc68vKfzropZEWMRTGtygZXR5N0WFsbY0PI6DdJ/nBVbA5biLy
	XzKvSRxgDYtTWYHZQAaNp5TtCQ8Y3IeHhFwqbqezaVQqEEGC2NJtmj74miEGfrLZizKr
	KSDuuJF/n3nr6bkB+NWQp3iYjQr2rF4qjc2p/OCbyH7pxYGS7yoWu18cmDVmXGXtYInO
	o4Pw560CGi0EYy6bc6CMPAcsx1VVKFPReJwhSGTgrncB5bY8YvirYb3mk8CDQ7//lrWZ
	MdLY+nOVeCIkIb+Yur55ISTjVq2h3/g19CRPRk95aox8ztZ9rWeVT1UOqdk+bvowGRM3
	H3gg==
X-Gm-Message-State: AOUpUlFujfZCzutqQh3FAjqPGtEn/DMCEr7l1x5ud6fxsfGPJqPPWA1e
	4n/w0UgYdvmH1dEbWjIoTdQf7aV7
X-Google-Smtp-Source: AAOMgpdtS4LK2M04w5tNHOJAB2ZdZJ7U5LmGnrnOjrrkjYlkW/AvPRlT5wSnCmpzNbpXadZ8hLRpXA==
X-Received: by 2002:a0c:d90a:: with SMTP id
	p10-v6mr2397643qvj.171.1532623544420; 
	Thu, 26 Jul 2018 09:45:44 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	x41-v6sm1430282qtj.71.2018.07.26.09.45.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Jul 2018 09:45:43 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Jul 2018 12:45:17 -0400
Message-Id: <1532623517-2123-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-dateutil: add dependency on setuptools-scm-native
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
X-List-Received-Date: Thu, 26 Jul 2018 16:45:44 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-dateutil.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-dateutil.inc b/meta-python/recipes-devtools/python/python-dateutil.inc
index d96d84f..03a2edb 100644
--- a/meta-python/recipes-devtools/python/python-dateutil.inc
+++ b/meta-python/recipes-devtools/python/python-dateutil.inc
@@ -13,6 +13,8 @@ inherit pypi
 PACKAGES =+ "${PN}-zoneinfo"
 FILES_${PN}-zoneinfo = "${libdir}/${PYTHON_DIR}/site-packages/dateutil/zoneinfo"
 
+DEPENDS += "python-setuptools-scm-native"
+
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
-- 
2.7.4


