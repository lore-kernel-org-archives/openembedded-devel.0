Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id E96F076104
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Nov 2015 12:22:49 +0000 (UTC)
Received: by wmec201 with SMTP id c201so37947967wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Nov 2015 04:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=txnZuixidxHxlKySIT187cbdiDkZA9EvEmOZSwLvMuM=;
	b=FG5lslE4dXAYih5MkwC8YSNQNi5rp6ZZWXQON4b/jDbSbAApt6mFDdBIt3s8NKP3Yq
	XL9lqBzL+WVHk729NaBqVYkIER97Vm5Az9bgTVZ1fiZYO5ExDHRT9kXBltBLRmix0ZL8
	FLHyLHvqb33cSqhBJ/sjEMyVsFlG5nCjas3ygi1x45lCvT20b1hVWTf84dLBoIHPHyEv
	pg6C8RyRYFLzYE0ugX3I0FjzQ8vqXRnwVkQiqAnHoDiWhIoNgjmkgit9CntyYjn7cSy6
	njImAzp/ZlQWrr2g7/K5ChyEZkEd0mQu5Ma2IKXeEofO7d4KdGC24nSdE3b+eRQdx/xW
	0sdQ==
X-Received: by 10.28.213.212 with SMTP id m203mr15310068wmg.33.1446898969442; 
	Sat, 07 Nov 2015 04:22:49 -0800 (PST)
Received: from Saturn.local.all (212-41-102-22.adsl.solnet.ch. [212.41.102.22])
	by smtp.gmail.com with ESMTPSA id ly4sm4899190wjb.4.2015.11.07.04.22.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 07 Nov 2015 04:22:48 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  7 Nov 2015 13:20:24 +0100
Message-Id: <1446898829-21243-1-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [meta-browser][PATCH v2 0/5] chromium/cef3: fix gcc build errors
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
X-List-Received-Date: Sat, 07 Nov 2015 12:22:50 -0000

v2:
Review Zoltan Kuscsik:
- prefer #pragma silencing of error over code refactoring
- add link to upstream discussion

Review Martin Jansa:
- port fixes to cef3 also

Max Krummenacher (5):
  chromium: fix gcc5 compile issues
  cef3_280796.bb: change indent to 4 spaces
  cef3: fix gcc5 compile issues
  cef3: fix build of x86-64
  cef3: fix build with gcc 4.9.4

 ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 39 ++++++++++++++++++++
 ...-image_util.cc-disable-warning-from-gcc-5.patch | 40 ++++++++++++++++++++
 ...-test.h-disable-warning-unused-definition.patch | 43 ++++++++++++++++++++++
 ...ithmetic.h-put-parentheses-to-silence-war.patch | 39 ++++++++++++++++++++
 recipes-browser/chromium/cef3_280796.bb            | 33 ++++++++++++-----
 ...0001-bignum.cc-disable-warning-from-gcc-5.patch | 39 ++++++++++++++++++++
 ...-image_util.cc-disable-warning-from-gcc-5.patch | 40 ++++++++++++++++++++
 recipes-browser/chromium/chromium_40.0.2214.91.bb  |  3 ++
 8 files changed, 266 insertions(+), 10 deletions(-)
 create mode 100644 recipes-browser/chromium/cef3/0001-bignum.cc-disable-warning-from-gcc-5.patch
 create mode 100644 recipes-browser/chromium/cef3/0002-image_util.cc-disable-warning-from-gcc-5.patch
 create mode 100644 recipes-browser/chromium/cef3/0003-gtest-typed-test.h-disable-warning-unused-definition.patch
 create mode 100644 recipes-browser/chromium/cef3/0004-SaturatedArithmetic.h-put-parentheses-to-silence-war.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0001-bignum.cc-disable-warning-from-gcc-5.patch
 create mode 100644 recipes-browser/chromium/chromium/chromium-40/0002-image_util.cc-disable-warning-from-gcc-5.patch

-- 
1.8.4.5


