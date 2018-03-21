Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id E856E78968
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 17:26:09 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 9-v6so3531418ple.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 10:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=9VwgefuI3Up8wKdO4LhXs07/R4TkRKozd7OatJNnSIY=;
	b=WP/TzgWE0sFOx1cjtsuITPyPfyjtRK8wfXSAdQ1LTr6mcSNRGr/9zysXwECBxFmyfn
	pebRS2f7xtP6Whns6ipz+cla1nEt577GPIOyxaOUanTh9xmMREIxvdKeDYvl3Zrg8QCg
	5mAQkfmlLD3W/jDW+j9cW2FH4FUmh1U6x2VY8GbfMRTFhdXIlp9hqmrixU0081GMm8pj
	vj4i8Db+4HLT1gfOdNmalpbsCUow9f5bBcx0mJve2a7HHFTx/z2w7gBNp8O10VTPKOuG
	l6HpVpIKOmQi34gJFPzd2mEXNfWf8tUsHtol6avSs9V856Si2PRh0NSEfKJhHRUmaYdP
	SDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=9VwgefuI3Up8wKdO4LhXs07/R4TkRKozd7OatJNnSIY=;
	b=acKAzDUHlE4FZ2vdcaq/ZuMzW2B58snZBanJ5ugup8/CPm6jc/F72v93bhk/gxl3R6
	qf8My6wDwh6dSxdzwOSMlm98fyaujqOEDmO/uyWot67VT00lMRwK9eGKS4lbZ+BVBDvv
	0v/FGVFTn6DOVWuaQLZvwZXYKUH61sQ1pIxgJ7Sw0c0YeMdZGQ0JJXWYz33BQd1/TYOq
	UyK57EnjgSxlyg32NaD9L8f630iTAIOkHkRE91es6pI+kovA/3CqG9p8QUNAxGb+VDk3
	XkuYjJzbZplI8lH0ehXRxYyIn6wG7s7LMAs8EZaty44kxcpPbUajcV79vdDUrO7DkpXu
	v0bw==
X-Gm-Message-State: AElRT7Ek3tlJ3gl8QKwWoPa5f4doU89KcFVGJaRTO5NHqVJgF9a6HJfS
	JA8NhovBKKZuj3Eh8L65n3Tiww==
X-Google-Smtp-Source: AG47ELuvhHzZacFSfLgEb7AB0FWE3lZJX5iiE4N0OGuPx65rDSk2A6A55ywtViG5il3T3oqaU+HQ2Q==
X-Received: by 2002:a17:902:7185:: with SMTP id
	b5-v6mr21469239pll.221.1521653170723; 
	Wed, 21 Mar 2018 10:26:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:a1c1:eb3f:f249:aed1])
	by smtp.gmail.com with ESMTPSA id
	w24sm9595664pfl.14.2018.03.21.10.26.09
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 21 Mar 2018 10:26:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Mar 2018 10:26:08 -0700
Message-Id: <1521653168-15297-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][v2][PATCH] libxml++2: remove X11 distro check
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
X-List-Received-Date: Wed, 21 Mar 2018 17:26:10 -0000

looks like its not needed.

V2]
remove distro_features_check

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-core/libxml/libxml++_2.40.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
index c3d647c..c001c18 100644
--- a/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
+++ b/meta-oe/recipes-core/libxml/libxml++_2.40.1.bb
@@ -16,9 +16,7 @@ SRC_URI[sha256sum] = "4ad4abdd3258874f61c2e2a41d08e9930677976d303653cd1670d3e9f3
 
 DEPENDS = "libxml2 glibmm"
 
-inherit distro_features_check autotools pkgconfig ptest
-
-REQUIRED_DISTRO_FEATURES = "x11"
+inherit autotools pkgconfig ptest
 
 do_compile_ptest() {
   oe_runmake -C examples buildtest
-- 
2.7.4


