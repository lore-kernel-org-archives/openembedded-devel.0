Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5FC5A745A7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:49:51 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id f18-v6so6081088qtp.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9l37ptYP915XPvu3cHJ0SxSDkKPOiIkQK1FW8gJHzVc=;
	b=bImKGWDc4PfnZ3ywFnrBsLh5cpTKGX1eysD0Y10Ecaa+EH6zSAPbnAdCHPHzZyjan2
	t+vuzWRbds6zQb7DY07EImG3M9bTFkpygtWPRy/7agj94QIbYw9Gti4/gkgOnXChLvBF
	+lwayQVdAn51l+t8OXwt/NUNDpY/HiAPfnHksDABZdH4q416VINSqaOUOzcDTDbu+epk
	X1GyRSpfSl0VJ4p8cdafIpSpb0rZLmbqZ8JObtjB2wIgOjvG/Stq8LyKspm0obnpoFen
	sJzas/XJgl+NcxQk2qguqw/L5oxyhts+vE2VEsTt7iHWq82ZK76EC7KmMsqaAE+2e+CC
	3VSQ==
X-Gm-Message-State: AOUpUlEHah01dIhkMwMTWQYY6anbH5zxEYvEfilzJVDnpbY/EemmIVAH
	yqXwHvSknJQ3ElgRXKTuhFNXpXqhDfQ=
X-Google-Smtp-Source: AAOMgpf2jMvtxh4OprtGfzBSHWWPRKqQFHFfYR6VHIQvBOalL1nGw5SOC81iyBGsSAtj09njGhkIZQ==
X-Received: by 2002:ac8:24b9:: with SMTP id
	s54-v6mr7545700qts.18.1532717391795; 
	Fri, 27 Jul 2018 11:49:51 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.61.164])
	by smtp.gmail.com with ESMTPSA id
	p14-v6sm2725477qtn.81.2018.07.27.11.49.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jul 2018 11:49:51 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jul 2018 14:49:34 -0400
Message-Id: <1532717374-16527-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-pyasn1: update to version 0.4.4
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
X-List-Received-Date: Fri, 27 Jul 2018 18:49:51 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-pyasn1.inc                | 5 ++---
 .../python/{python-pyasn1_0.4.3.bb => python-pyasn1_0.4.4.bb}        | 0
 .../python/{python3-pyasn1_0.4.3.bb => python3-pyasn1_0.4.4.bb}      | 0
 3 files changed, 2 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-pyasn1_0.4.3.bb => python-pyasn1_0.4.4.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-pyasn1_0.4.3.bb => python3-pyasn1_0.4.4.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-pyasn1.inc b/meta-python/recipes-devtools/python/python-pyasn1.inc
index 614b6d4..ab34d25 100644
--- a/meta-python/recipes-devtools/python/python-pyasn1.inc
+++ b/meta-python/recipes-devtools/python/python-pyasn1.inc
@@ -3,9 +3,8 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=815ac3f9ca693006349094b358ab3155"
 
-
-SRC_URI[sha256sum] = "fb81622d8f3509f0026b0683fe90fea27be7284d3826a5f2edf97f69151ab0fc"
-SRC_URI[md5sum] = "311fff5b2a1303a8cdc334c8867a06f4"
+SRC_URI[md5sum] = "0d182b71e1f72fe147d7957bc90be7f2"
+SRC_URI[sha256sum] = "f58f2a3d12fd754aa123e9fa74fb7345333000a035f3921dbdaa08597aa53137"
 
 RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-pyasn1_0.4.3.bb b/meta-python/recipes-devtools/python/python-pyasn1_0.4.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-pyasn1_0.4.3.bb
rename to meta-python/recipes-devtools/python/python-pyasn1_0.4.4.bb
diff --git a/meta-python/recipes-devtools/python/python3-pyasn1_0.4.3.bb b/meta-python/recipes-devtools/python/python3-pyasn1_0.4.4.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-pyasn1_0.4.3.bb
rename to meta-python/recipes-devtools/python/python3-pyasn1_0.4.4.bb
-- 
2.7.4


