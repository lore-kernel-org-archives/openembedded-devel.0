Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 7B8656B2CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 11:24:36 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so942553eak.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Aug 2013 04:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IDMjrEV98lxu4ts9W0lMbZEWfpTWNMZZ9FAZ/H8rJmg=;
	b=SC1Fq5ItSji+mKrMGYX/ntIm1wsd+XAI50yHEwKKWODzaBDm4P0aPOeGiZqTLBokjs
	KZVPjcm3Qj0XYZuMTP3LeTaR7iYUbvIiHdTM4nicwvcA42TMtyLEMubg4Og/NzxZxYKd
	Gql0JLkSm61bYonsgW5giXV1TtkxvAf1+1lwU64pCo+WfmHdmaHqalwmNNqYrSNb/iDB
	wfg6G4HS+XHQIP0jHYhnwvho/FjMw/CU3/t8qb7aUEr0ZIf/nP0m50yNU3bMJCddBKIX
	Qn9nQmnGT72QFJyJRqcSY4bXDCvRhRMjs3j1MPIdyHRe27CUFTx4scLhWwPyct587WhE
	KrqQ==
X-Received: by 10.15.82.3 with SMTP id z3mr32818eey.90.1376652276200;
	Fri, 16 Aug 2013 04:24:36 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	bq1sm1970772eeb.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 16 Aug 2013 04:24:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Aug 2013 13:25:34 +0200
Message-Id: <1376652334-20918-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-systemd][PATCH] cronie: rename bbappend to match new version from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2013 11:24:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../cronie/{cronie_1.4.9.bbappend => cronie_1.4.11.bbappend}            | 2 --
 1 file changed, 2 deletions(-)
 rename meta-systemd/oe-core/recipes-extended/cronie/{cronie_1.4.9.bbappend => cronie_1.4.11.bbappend} (93%)

diff --git a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend
similarity index 93%
rename from meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
rename to meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend
index 210c025..8f45f3e 100644
--- a/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.9.bbappend
+++ b/meta-systemd/oe-core/recipes-extended/cronie/cronie_1.4.11.bbappend
@@ -1,8 +1,6 @@
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 4}"
-
 inherit systemd
 
 RPROVIDES_${PN} += "${PN}-systemd"
-- 
1.8.3.2


