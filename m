Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id F1BF479C59
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 10:00:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id r63-v6so11081020wma.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Oct 2018 03:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Ih7Xv/Hhu3zMN5NGi2AQwpbFebtB+RdiJFdhv0d2/Bk=;
	b=XBJoGli69hsiO+7IHYptcTVDRZyd1s1fZDCaIwOqordpurca0FmlNL0F8ffyowqeeo
	ADAPnsE4TEfpspswkIRHBjslbmm3B29ICZSJOL4147SfOTehoDiHGogCRE8Y/iJg/CiQ
	BLJr0tqgoipdhdRBzZZKtYpeM7u+Isy5AnlRFo9FpnB09x/6J1NzOtTEGJK16bl+l0Kd
	KhrAWLFhl8v11CSBrvQRaT1OJVanyF/cXP01OnVuPtShT+9/VwyTLbDnZdoACFkk3rdl
	UOeTkNcTeTtQA4/nHPVzGPZHGbIj75s2lqNymhPqzu3I/lLAtir+m8G2MXmeU4lJWnQs
	Em4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ih7Xv/Hhu3zMN5NGi2AQwpbFebtB+RdiJFdhv0d2/Bk=;
	b=FYY8gRvowFQZ0+2wzY1U+W9dLQQ0i/YfM8P4H/sz4Ae2vfsm06d4+ATLHnkrY96baj
	C/t9ljNOIGnSeJcXKQYvPb2gyQKdyvhhrgILbKTKpt9pZ660GqPhnDCGO1/23ITo1opK
	je1UwS1+W+dKw4rm8haTP4OOmB1d0Ud8CmsNI/tJMijkSTnmKYPJ6oWA8XrLZzPVx5Rm
	nRfzjfihuyPyDGgibC7KiADsukqPsMtBeA6vWs3ahpLR4yfIiS4fdgZW+5lYo0cGKRKA
	+Pk83hqjGBIOXRrJDYPEwHawZclAgZmnuFBWVclFAme0ch3a+u4Bny6ENOxg1iNx19ZE
	qeWw==
X-Gm-Message-State: AGRZ1gJN4aKArKd7Ytq9SR9QKsCvYoy/8lYxY/66MR5E1V7xoIkn+DEe
	M/KdXtz/6IoLOhhcxMkhmEPhOLwm
X-Google-Smtp-Source: AJdET5ejuKYmN5Rzi2f/otI3QYOtujqUYjG3moZHyIYzu8fsy95O9WOwxggrcQh18mOLgp9kOtPS+Q==
X-Received: by 2002:a1c:c40a:: with SMTP id
	u10-v6mr1157136wmf.30.1540893629933; 
	Tue, 30 Oct 2018 03:00:29 -0700 (PDT)
Received: from localhost.localdomain ([80.215.105.146])
	by smtp.gmail.com with ESMTPSA id
	12-v6sm19195538wms.11.2018.10.30.03.00.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Oct 2018 03:00:29 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Oct 2018 11:00:20 +0100
Message-Id: <1540893620-3600-1-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe][PATCH] lcov: Fix perl module dependencies
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
X-List-Received-Date: Tue, 30 Oct 2018 10:00:30 -0000

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 meta-oe/recipes-support/lcov/lcov_1.11.bb | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.11.bb b/meta-oe/recipes-support/lcov/lcov_1.11.bb
index 2f9ac33..56a018b 100644
--- a/meta-oe/recipes-support/lcov/lcov_1.11.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.11.bb
@@ -14,6 +14,31 @@ RDEPENDS_${PN} += " \
     perl-module-filehandle \
     perl-module-getopt-std \
     perl-module-digest-sha \
+    perl-module-constant \
+    perl-module-cwd \
+    perl-module-errno \
+    perl-module-file-basename \
+    perl-module-file-find \
+    perl-module-file-path \
+    perl-module-file-spec \
+    perl-module-file-spec-functions \
+    perl-module-file-spec-unix \
+    perl-module-file-temp \
+    perl-module-getopt-long \
+    perl-module-list-util \
+    perl-module-mro \
+    perl-module-overload \
+    perl-module-overloading \
+    perl-module-overload-numbers \
+    perl-module-parent \
+    perl-module-pod-usage \
+    perl-module-posix \
+    perl-module-re \
+    perl-module-safe \
+    perl-module-scalar-util \
+    perl-module-term-cap \
+    perl-module-text-parsewords \
+    perl-module-tie-hash \
 "
 
 SRC_URI = "http://downloads.sourceforge.net/ltp/${BP}.tar.gz"
-- 
2.7.4


