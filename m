Return-Path: <fathi.boudra@linaro.org>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE2C71AB8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Mar 2017 05:36:27 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id u132so26436777wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Mar 2017 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=G4UedcHMbwlTox34YlK1n9q9o2GPPq9UBriCXPXrHBM=;
	b=HrVCzUuL8M/tD3N/aTr/Qqpr8+l2u//AHyMnoCtLeF8P6KJGMupmqPrjrgAjrP6xFU
	zktIA00MRpahLMGaQeonL3c9bzd8p+FoKjRN0p2d/Mvw03fPfMYPAwnP4yZPyLYAE0Zy
	NGrdp0wKizzxQgKk/DOxZPbIejdcLs+CYUtwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G4UedcHMbwlTox34YlK1n9q9o2GPPq9UBriCXPXrHBM=;
	b=lDE960PRHcbQYu5GvSgKfZB9D9rwdE7dNS26DEx5Jv3qCK3Rvfo7iQOZDj4QBPEDkS
	TPxsqEh26JY3mENzQccZJKu85cY9yQqb4JU7NRGoO+Duw5D7EjBkD9DPwlry49cAWpp3
	/6Ph4g7bmaIBFHmqKMgjkZCpVPTSIYCfD+ouLFZET2X5yiStmoc/5VETzvPWkp+nn6jp
	o4stYKJh4q/W+YVvd5Gd9P+hhdoA3IooZetssyqsVVBoWZh/paq0BiSATO6bqTBYwyjQ
	x1VDPEwJSyzBJags9VIMcZQp+nu9FqqlIfPMSmUD/jyV2E8dIWqjew1Q2eDyvfvGKQON
	W/iw==
X-Gm-Message-State: AFeK/H3OmoKxhNyuZ8J0azeXQHIhkvJwzTHYXUKEgYTyYB1sfWOSGU6QqhAnaCv8GfLdA1Gv
X-Received: by 10.25.18.95 with SMTP id h92mr9501456lfi.63.1490160987904;
	Tue, 21 Mar 2017 22:36:27 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-16.elisa-laajakaista.fi.
	[91.156.68.16])
	by smtp.gmail.com with ESMTPSA id a16sm110730lfk.24.2017.03.21.22.36.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Mar 2017 22:36:26 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Mar 2017 07:36:28 +0200
Message-Id: <20170322053628.26273-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.11.0
Cc: koen@dominion.thruhere.net
Subject: [meta-oe][PATCH] fwts: upgrade to 17.03.00 release
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
X-List-Received-Date: Wed, 22 Mar 2017 05:36:32 -0000

Update PV and SRCREV to match 17.03.00 release

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 meta-oe/recipes-test/fwts/fwts_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-test/fwts/fwts_git.bb b/meta-oe/recipes-test/fwts/fwts_git.bb
index 6df6cfd52..4c4ae66d6 100644
--- a/meta-oe/recipes-test/fwts/fwts_git.bb
+++ b/meta-oe/recipes-test/fwts/fwts_git.bb
@@ -5,9 +5,9 @@ HOMEPAGE = "https://wiki.ubuntu.com/Kernel/Reference/fwts"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://src/main.c;beginline=1;endline=16;md5=31da590f3e9f3bd34dcdb9e4db568519"
 
-PV = "17.02.00"
+PV = "17.03.00"
 
-SRCREV = "b5a7b3c478f9438343ee63ad0cd93610161515c5"
+SRCREV = "e3e9d1442b4cc70f5b30199f584cec8e25aeaad4"
 SRC_URI = "git://kernel.ubuntu.com/hwe/fwts.git \
            file://0001-ignore-constant-logical-operand-warning-with-clang.patch \
            "
-- 
2.11.0


