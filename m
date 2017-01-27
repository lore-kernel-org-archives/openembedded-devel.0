Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 73DF7606A8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 10:11:38 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id j18so57198209ioe.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jan 2017 02:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=fH9Zqq6Vog9YQ0lfNzR6ywJcjYfVe3C/DpqGqQwRnWo=;
	b=MMUpqmGKNSlk72zlkmDb/L5GMEW00Rqchjd7eF7Q3JCgebkPzcl7/1AwWd42dvWhD+
	5kHkB64PkP11/XQRkmsUFm8EjhP8Y0FnyKJH1zcU3IoM6GX3JN3CGKjo+8fH/cryfPv0
	Nd5s4b/4W4rMQyGrKufjAAegeOiMICDpT94WeHqLOwVtbwqf1UEklvbkJIz5Zgdv9+Tp
	15dF0ekxnn2tme1APClkFvSOtmufSEvyW1/rb3Cx/lRhls6FYjUsHRFMKOWaSv9pT96D
	FCTcrnHr5CXU5I2edA2vAANxfVWBRDgJ3WWXJNSuW8DV5+TkcHoKjju1CBZfsPgbX3VB
	UGZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fH9Zqq6Vog9YQ0lfNzR6ywJcjYfVe3C/DpqGqQwRnWo=;
	b=WM7RQejwESbpTHcpROYuq+gFewjetiMCRz+lBgmBtAMkaYGlT+ZOwns9Wamw5WaJlZ
	oCg4SUGPdmz+QvsBNSnWYCjfUlYsCtlzo68Fl2wrmbjHLLZN89yrS4KqYybNLec/qkWs
	M1OTQygVz090pEYA9AXoU8kkypHdpvtALje7R2BdpH5qCa7JmWgLdqQLUeBzHqhKBtiJ
	/Pdcq78JDgXH0cQBt9rwSOxFfiNR874q4vMEd8uzqy5lzvzZ9OjzUueNtaq6WhxpzYIz
	o7hZ6zkZHMWoNdAUCWyFt7J8AKWBJBBVU/hxNwwCgXIBJfYjvvb6s5SMM6RINL5/bbKy
	O0nw==
X-Gm-Message-State: AIkVDXIEZVnWMJllKHCCa+55CdYiL2SBiJDa0TTkpUbFW0quWkJ92xPC1bbMedW5HjCsrXj5
X-Received: by 10.107.162.194 with SMTP id l185mr7300270ioe.184.1485511898265; 
	Fri, 27 Jan 2017 02:11:38 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8DB2E.dip0.t-ipconnect.de.
	[93.232.219.46])
	by smtp.gmail.com with ESMTPSA id y71sm1172175itb.1.2017.01.27.02.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Jan 2017 02:11:37 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 27 Jan 2017 11:11:20 +0100
Message-Id: <cover.c0833b943acf2f997b54ea7a5284afcdeaf3b924.1485511836.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-oe][PATCH 0/2] multipath: fix build and update
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
X-List-Received-Date: Fri, 27 Jan 2017 10:11:40 -0000

I recently started using kpartx from multipath-tools. The build failed
for me when linking shared objects as executables. Changing the order
of compiler parameter avoids that (first patch).

I have a problem where "kpartx -d" does not do anything, so I wanted
to try out the latest upstream. Unfortunately, that has the same
issue. 0.5.0 is fairly old, so it may be worthwhile to update the
recipe just for the sake of it.

However, beware that I have done absolutely no testing of anything
besides kpartx! But as the recipe didn't even build, it's probably
currently unused and further testing can be done once someone starts
using it again.

If you disagree, then please at least merge the compile fix.

Patrick Ohly (2):
  multipath-tools: fix building of shared objects
  multipath-tools: update to 0.6.4

 meta-oe/recipes-support/multipath-tools/files/0001-multipathd.service-Error-fix.patch           | 10 +++++-----
 meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper-kpartx.patch              | 25 ++++++++++++++++---------
 meta-oe/recipes-support/multipath-tools/files/always-use-libdevmapper.patch                     | 53 +++++++++++++++++++++++++++++++++--------------------
 meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch             | 31 +++++++++++++++++++++++++++++++
 meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch       | 30 ------------------------------
 meta-oe/recipes-support/multipath-tools/files/makefile_inc.patch                                | 38 +++++++++++++++++++++++++++++---------
 meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch | 55 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb                                  | 33 ++++++++-------------------------
 8 files changed, 177 insertions(+), 98 deletions(-)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/checkers-disable-libcheckrbd.so.patch
 delete mode 100644 meta-oe/recipes-support/multipath-tools/files/do-not-link-libmpathpersist-to-TMPDIR.patch
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/shared-libs-avoid-linking-.so-as-executable.patch

base-commit: fa65be9ba7943a68b988b5e1a3a37cda7ac74c37
-- 
git-series 0.9.1

