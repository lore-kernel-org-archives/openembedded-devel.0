Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id E0C4A6B7E7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 07:19:07 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so183094eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Aug 2013 00:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=kb4nhZ82DkeKaVH/t2yAVH8WiZ8A2Vpfv1gGaPIZQVk=;
	b=MGqE1CQKruWsoP+SOztcmc3TFYHZPw3BttIE7NBkeR4vWf7wSyEBoj+tgH7WCu2kJz
	tN1FXXplnZVU0vrEbHDS56U3IYNWsUfddmcpVdI5z7CW3g9i21i0Zw03aBzy9CMZQ3fC
	2xO3R/09urCUUiLl9R/jjyaaeRgQXBqYf2Jefy3zzZVUpLwmCOjSK1mMbzyypmyq3fb6
	XHq7bJaFwTGlWGGvb3EF1kIOXQzw0awYEN4pGnhnKwPw64IuPlpEBZQ+g3Mjh93I4SG1
	uhQvEi2WfSWMbNyulxDFTrAg2KPT5Qj34Kp2vUUlL+ZwSH3kRiI3XOlGFx4uc7LfaUES
	Lf4Q==
X-Received: by 10.14.223.1 with SMTP id u1mr20817919eep.10.1376551148373;
	Thu, 15 Aug 2013 00:19:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm74951170eev.14.2013.08.15.00.19.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 15 Aug 2013 00:19:08 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Aug 2013 09:18:52 +0200
Message-Id: <ca642ab4307d575f8ba30d19206e8da94ffabce6.1376551135.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1376551134.git.Martin.Jansa@gmail.com>
References: <cover.1376551134.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][dylan][PATCH 12/60] cpufrequtils: inherit gettext
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
X-List-Received-Date: Thu, 15 Aug 2013 07:19:08 -0000

* build without gettext-native fails with:
  | Building ccdv
  | /bin/sh: 1: xgettext: not found

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
index bd631af..e74fa44 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -1,5 +1,7 @@
 DESCRIPTION = "To make access to the Linux kernel cpufreq subsystem easier for users and cpufreq userspace tools, a cpufrequtils package was created"
 
+inherit gettext
+
 DEPENDS = "libtool-cross"
 
 LICENSE = "GPLv2"
-- 
1.8.3.2


