Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2518.1794961606894990102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=mjqU83uN;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-381d542bc29so871052eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961606; x=1795566406; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/hUJpIarX67mowszfRlzmwlF0Mq89BGPVC6NQvguHYY=;
        b=mjqU83uNj3MZ9oqG+/4kAib/HfdAGDCrkwLnAoZVD8pm0HNudyTnFPoeH90rBtxvd/
         rQkDVrkvkkSYXE+5ZgrqdSFqW9LUBnqeNKGZF9+y+kQXc2KJBTcPPlUOoN1Dyu64hDMm
         +YK+mYbnOJVYIfmeCm6F+WIXUstVxUfJE+Qs/sJedIzRfY89BWwCfH0iloyAuDgZPn0g
         9kYYMbgcNQxIHDS1lWG14URE55ZNkSkjeokZTA95MQaKg2dvFsLFI1cpl34Or4HYEMo+
         WTaoh0GRqC4gN2UXV579EYtVfumgk1QM0G9SfV1uyL4rLoQZBMFkPWGCsGgCaBVZnoQu
         TeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961606; x=1795566406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hUJpIarX67mowszfRlzmwlF0Mq89BGPVC6NQvguHYY=;
        b=Ek/cNf72srxKAv4406qtcqW/nIUB0XpP1ZcVWHuEPQbXSnY1rWjzqWhsaSM9VOUep+
         or8Xckm+ni/OTpBetWBtBQu/wDEY9auVZeH4dFiUMMFxuEMN1XVQlN/duhazv3uRUyjs
         WOSUYzv9F+AmFlQnahqdp/0hEfAduejX5spBvlBCF0sA/pjtNVv9utoiQgkLpycrzKzz
         OgkU8QWsm0+tLlXMC1fKVVTxMXiWm+1TAGYr659CCrTpKU05zJ3UH4Z8ujdIms0wD7s6
         victDXu422diJDM3/N5XULglx5xVqOM/+17AUL2QE2KJz+DATH7FzBHArjWPLxvOxeFM
         kpyg==
X-Gm-Message-State: APuU4Z85TI2cNx4nSml0dJzCBomBU0nfOfS1KngBEHBa6kV/sg2PEqaJ
	uyDXO7AZ8YPrNSLDhjDfxiSPt0QHysA1WPXDQjnqWdL/BbOiJnvdgekFlGd70E3p
X-Gm-Gg: AZFdTZcEB8AXvwF94TQNtHn4YQvhB/DY9KFuLOrCL56k7S47yYX+OyYHw88KKRRwOJk
	yYu5kZ6XBYkVBJ/HNB0CE7FotQeYIjsUn9UUgY7ORj/TKYmG3y65ZT8NjxpZGwNYyFJU3SdtARL
	I6bkXltCIjYIyJmI1UFUfgSL295mEvGYwvK0cmS5z8wQhAsWOYAYpPT6JQrfrQ1pF29MC1FsTh+
	9qwtbFYEtUpRQFH5pj3Fb5fHPcYtyJnd3FtPDSvLFPOZIQJqan5lFhuZ1pDETjz+cK3etJtED+/
	JRSMXN1b1QxRfrBHMp+NlXvHZLufjszPXTyExUjXqCivKz5776Dt5G46CFx7n+jrj1X5mvZ9b5g
	fNFpkYzsVjbV+Fg74t/m+HHgFmdMGTISNViZ6AGDcYaI1hXSvJanvEpuvJpGovS/ise15y1cUEh
	1uYGdV1iuLp63Uj24V4i/7ki0Nan/BfSq/d6J+/QKkni1PYvWr68m2O9NrCZX3m+ljoY4hA32xw
	S3YPjlDSwKNo/8O5eTL7ftNLFEhczcyfQYRObeJphDyGt+/0gpl6FkB4rSg/OfGNQ8sjFu1Ta9b
	vkINM1aXEJ7/nnj3/cBFfWwxg/HH0xd8Iq8rsxE0/1Q1At88+HRBTFMKa0jRcXtAtPdUPuMUGDq
	xGCkvEne8m8X/2irmomx4J/f7YjExLcrzSu+bJhbMURhKDT9aOF+sTLIn3jX7C+eksDL24LzS/P
	1xVAaL6mdfF21XS2JLKppwmBJ7OBn9ZX9CA3RVDy0MEOinWhJ2kZ22wdwt2u7gEngIJnZbtRMMs
	GdgZQOOTrE2hhgC7mZD9o8MxXhVbEGIkfq4YeQMz0CzzeQ63Z42pXaSIPCJZL5Sy/UHdBqQ29dS
	phME
X-Received: by 2002:a05:693c:88d7:20b0:36e:aa5c:7851 with SMTP id 5a478bee46e88-3828141dd08mr975975eec.27.1794961606123;
        Tue, 17 Nov 2026 16:26:46 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 01/14] ledmon: Fix LICENSE
Date: Tue, 17 Nov 2026 16:26:29 -0800
Message-ID: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:26:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132602
Content-Type: text/plain; charset="utf-8"

The library sources in src/lib are SPDX-tagged LGPL-2.1-or-later and
the ledmon/ledctl daemons are GPL-2.0-only; COPYING.LIB is the LGPL-2.1
text, not LGPL-2.0. Also track the GPL-2.0 COPYING file.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
index 13783a1e9d..a4d27eec55 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
@@ -5,8 +5,9 @@ DESCRIPTION = "The utilities are designed primarily to be used on storage server
 "
 HOMEPAGE = "https://github.com/intel/ledmon"
 
-LICENSE = "LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "autoconf-archive-native sg3-utils udev pciutils"
 
