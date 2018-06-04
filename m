Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8465260685
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 11:26:14 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w7-v6so391454pfn.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2018 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Sf82Q75OyMsDHYZRXrPIuyL/5PA4ACQnhckvx/nXaQI=;
	b=NZTUUS1YxjDDzOt4qY25JHk5AFFFyGuhLsKCPm2hAC2Hih77tKs2BdDwizgh9LCc34
	joDOYCE/5l/tVKmX48GtFGN+V0Gicu4vJCsgXa81YJpS4wPWsmqW9ycCs/e7XCW/TSwT
	IQsYeJFrOqfsqrDS17bIcXNM2R8Fdi+4vyo/hAQ2UuBrTlo36N3Pl5uABhVoDXSJTfHD
	9N/ocsvjkTgznYYjeoRFw9HFhwCuwL97E1cDHP/Psmx8IlFHZcppUS0hKclnY6WYYlrt
	wiBqanPHs2EY3GHMx7qE28SCN5e5Dua7Ct+fKf0bc5FcFvxwzR2UPxzk4TSWqMxdH2mF
	qPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Sf82Q75OyMsDHYZRXrPIuyL/5PA4ACQnhckvx/nXaQI=;
	b=jUdNdwBGe9TRQh3fp8B2jFs1BqC3utpmFewnZHxXEDIiUeiy0FWmvyWxaHyKcjk5/e
	sCffq/DeseSPTS+wFNZ2Fv/VfQOIEW74ffaSjZ3eIUKfeIbMGL+Pg8k/UssN7XERuDWS
	S28cO4BPnyf/ejjtVOGdFx5cdIIoMYRHbMy0T0iUsI0n99q2L0WgO6CwO76kxFGL8bJQ
	qLXYC392D4Wq6vCEjU0WDZUnOS1TSQgwZ3yOurFWFBTaHPaxWkAsdzfdhm/aVFpaMT0X
	lWp2t3aENl9WFxLsqVcUNTDeXSJ2RipQjATanCaWqe1iUt35k7ni5EO0xEfVcSp1pGo0
	xqAw==
X-Gm-Message-State: APt69E3ts3GX+ypyWPlHpAGBOZ81yGOazXEJrcadq0Fi88UkdJNSMZ32
	tecQZfyWmnKkmPAPvnT4WfxOl1OU
X-Google-Smtp-Source: ADUXVKK4YPU+gBA/ykyn2Ds89Yy4uIPr0Wpb7T9S2kx0BH59fgNnRa2A398tlJzS99lrbSVrfWLuHg==
X-Received: by 2002:a62:ba13:: with SMTP id
	k19-v6mr6398543pff.245.1528111575547; 
	Mon, 04 Jun 2018 04:26:15 -0700 (PDT)
Received: from jkrishnanjanappa-desktop.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	x17-v6sm4233314pgv.15.2018.06.04.04.26.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jun 2018 04:26:15 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Jun 2018 16:56:09 +0530
Message-Id: <1528111569-11006-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][morty][PATCH] python-cryptography: Add python-pytz in RDEPENDS to fix ptest failures
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
X-List-Received-Date: Mon, 04 Jun 2018 11:26:14 -0000

It fixes below test failure:
-- snip --
ImportError while importing test module '/usr/lib64/python-cryptography/ptest/tests/test_x509.py'.
Hint: make sure your test modules/packages have valid Python names.
Traceback:
tests/test_x509.py:17: in <module>
    import pytz
E   ImportError: No module named pytz
-- snip --

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta-python/recipes-devtools/python/python-cryptography.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-cryptography.inc b/meta-python/recipes-devtools/python/python-cryptography.inc
index 4be7907..13d2ba8 100644
--- a/meta-python/recipes-devtools/python/python-cryptography.inc
+++ b/meta-python/recipes-devtools/python/python-cryptography.inc
@@ -39,6 +39,7 @@ RDEPENDS_${PN}-ptest += " \
     ${PYTHON_PN}-iso8601 \
     ${PYTHON_PN}-pretend \
     ${PYTHON_PN}-pytest \
+    ${PYTHON_PN}-pytz \
 "
 
 inherit ptest
-- 
2.7.4


