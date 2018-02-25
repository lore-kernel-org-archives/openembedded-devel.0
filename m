Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 334AE7884F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 21:33:42 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id j20so2282845pfi.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Feb 2018 13:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Y7ouvCv/Bn5HbvrMSMrYnKA4RWbWT8t/IqMHzl79e8U=;
	b=Q6y68M39VWm7hy8iGPFJgeXxCJBjLN4Av89E4WIEI1NWzBHplbfrgup6XWlF7b0dmD
	Y2KDdij31hiTSnh1/VBudgK4PwXNrNHkpfT5zOmNYBFGVW6UzKY8/QIG2AzgvMRKoQbL
	mWGME+zbZGBYQO4RQZ7TzWpt+Vt563Z7RNTXBrmdGPpLL5GHJlDJT00W1D9DiO+lb6RI
	O3XW2s4i1eIR1KJ4sxGSB+u9gLQwV7C1qakFv2L7Y/UfpDacOE42cKWLxuOHatCLzkiL
	+J8PjAx/VtZ4Rk5M8zVucEICPGCyVMzUySBrqlE9RPIqnj31CU0y/uiMAoHnY+pXyIIz
	DyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y7ouvCv/Bn5HbvrMSMrYnKA4RWbWT8t/IqMHzl79e8U=;
	b=idd3WyS43AwAkWINuChLqjIW5B8zDfs4BpQx29FoLrJF+rvQV++dTmHUYXD7ldhPzm
	t9G2HyNOGyc8gsMUHHO53m1hj9oG6HhrL6JfMgZDiHJ+f9x6EtuHvunIWWDA7yUNyZ3/
	R1wscVv4FgBaFOEpc3LNkMYuB0aSj5o6U3vxIrMAdb++WUqN3x0c+c3d393nXtduVs+3
	6yxeBsopu9F2PxBhoduzxkWlivosjsBtmF3ae/rFUoGO0L/LAFyoGOigRIPXv3hAB+Dd
	L8t5T1GwS7L9C5UWTWmkuw7WWDBKarxOxKydidOzvCAd/WynpvCkZbZ99qF+R/pLKdxi
	5FZg==
X-Gm-Message-State: APf1xPCpjHDFF0NqhWiMbqyTZoNBReEqpinSf9dcxIKp+3UpZqOS6yo+
	gaxvP/7F35SgmBGcu7MDo92T+w==
X-Google-Smtp-Source: AH8x225aCQHVKY3ZDPMt47XH9trpwWnySVQCXAEXOO8wX4J0uFVoDcM3zG4iiRPqvCgilSJhzX0NNA==
X-Received: by 10.101.78.200 with SMTP id w8mr6806591pgq.43.1519594424280;
	Sun, 25 Feb 2018 13:33:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:ad95:2a34:2e02:2fdf])
	by smtp.gmail.com with ESMTPSA id
	64sm12014600pgj.39.2018.02.25.13.33.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 25 Feb 2018 13:33:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Feb 2018 13:33:06 -0800
Message-Id: <1519594406-24490-16-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
References: <1519594406-24490-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 16/36] cppunit: move to recipes-test
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
X-List-Received-Date: Sun, 25 Feb 2018 21:33:43 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/{recipes-devtools => recipes-test}/cppunit/cppunit_1.13.2.bb      | 0
 .../files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/{recipes-devtools => recipes-test}/cppunit/cppunit_1.13.2.bb (100%)
 rename meta-oe/{recipes-devtools => recipes-test}/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch (100%)

diff --git a/meta-oe/recipes-devtools/cppunit/cppunit_1.13.2.bb b/meta-oe/recipes-test/cppunit/cppunit_1.13.2.bb
similarity index 100%
rename from meta-oe/recipes-devtools/cppunit/cppunit_1.13.2.bb
rename to meta-oe/recipes-test/cppunit/cppunit_1.13.2.bb
diff --git a/meta-oe/recipes-devtools/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch b/meta-oe/recipes-test/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
similarity index 100%
rename from meta-oe/recipes-devtools/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
rename to meta-oe/recipes-test/cppunit/files/0001-doc-Makefile.am-do-not-preserve-file-flags-when-copy.patch
-- 
2.7.4


