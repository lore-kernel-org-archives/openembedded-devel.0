Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6916A780A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Aug 2017 01:04:46 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c15so7468444qta.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Aug 2017 18:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=imt1VMdcw5CS10T/7QIQS7QktDmKWPu/qYBBLxaGjRA=;
	b=S/acbOrBaiFgnAQrNUPkmpvxaaSK+szGUbZn9dlX/LUnHysvqd8MCCKSiC6ls5ncsA
	p59zUfmslPvrJ83lZE4IOSDGWugnvOupcxjAfICDOuoAFd8bB217dxGGdnuG6Wx/w7a2
	+qGeQc3m/1u+n+FafVy0/QyblhsAZkgNXlwY1BQP5xgdNiyLaPhXPLtvGMABqgH/F2TQ
	6Dt7/suxvm6dKwdHseSxDf24lmEGZfN3P966kVrmw3ArWmu1PkB46xm/3EBnN6KW5q08
	j03eOjhW6kTIV5OhwHYxnvaPEtErDHfDM5EkwM/g0zePQLDUhT152MCkrzpEhTAFu3cA
	H1/w==
X-Gm-Message-State: AHYfb5i0u3gv9RUmP3FJ0ge7L5WhsMFwRo2aViqDLhOGPvoRvPk0gcZS
	iAFCxn1tO3iKRnDNhvo=
X-Received: by 10.200.44.170 with SMTP id 39mr13618125qtw.160.1502327087411;
	Wed, 09 Aug 2017 18:04:47 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-108-30-199-218.nycmny.fios.verizon.net. [108.30.199.218])
	by smtp.gmail.com with ESMTPSA id
	l67sm3261981qkh.34.2017.08.09.18.04.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Aug 2017 18:04:46 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Aug 2017 21:04:41 -0400
Message-Id: <1502327081-32015-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-decorator: update to version 4.1.2
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
X-List-Received-Date: Thu, 10 Aug 2017 01:04:46 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-decorator.inc              | 4 ++--
 .../python/{python-decorator_4.0.11.bb => python-decorator_4.1.2.bb}  | 0
 .../{python3-decorator_4.0.11.bb => python3-decorator_4.1.2.bb}       | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-decorator_4.0.11.bb => python-decorator_4.1.2.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-decorator_4.0.11.bb => python3-decorator_4.1.2.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-decorator.inc b/meta-python/recipes-devtools/python/python-decorator.inc
index aeae231..859f972 100644
--- a/meta-python/recipes-devtools/python/python-decorator.inc
+++ b/meta-python/recipes-devtools/python/python-decorator.inc
@@ -9,8 +9,8 @@ decorator, just because you can."
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=893f896413826096ce5270c700a498fd"
 
-SRC_URI[md5sum] = "73644c8f0bd4983d1b6a34b49adec0ae"
-SRC_URI[sha256sum] = "953d6bf082b100f43229cf547f4f97f97e970f5ad645ee7601d55ff87afdfe76"
+SRC_URI[md5sum] = "a0f7f4fe00ae2dde93494d90c192cf8c"
+SRC_URI[sha256sum] = "7cb64d38cb8002971710c8899fbdfb859a23a364b7c99dab19d1f719c2ba16b5"
 
 inherit pypi
 
diff --git a/meta-python/recipes-devtools/python/python-decorator_4.0.11.bb b/meta-python/recipes-devtools/python/python-decorator_4.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-decorator_4.0.11.bb
rename to meta-python/recipes-devtools/python/python-decorator_4.1.2.bb
diff --git a/meta-python/recipes-devtools/python/python3-decorator_4.0.11.bb b/meta-python/recipes-devtools/python/python3-decorator_4.1.2.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-decorator_4.0.11.bb
rename to meta-python/recipes-devtools/python/python3-decorator_4.1.2.bb
-- 
2.7.4


