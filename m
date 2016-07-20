Return-Path: <patrick.ohly@intel.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 87E77606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 09:48:17 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id r9so40681639ywg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 02:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6+ZALCV0NfY1gXE25NRLFFm6z0cxDuvsSpdD0ERunhU=;
	b=ns+C8Vd7oP2lwmSn4kEBJSS2rL6aVxZv3bR0zIpXGtpZQRwmkpurhTGyAppGXCCrQt
	EElqkEHaVhM5G4m9sJUJoJziTbTPSAqRHIa6H+a0VBwK6ZctbvV48w/p8zSTvdSv24xa
	lnMJP1iO4DPen1EotS9qHdqbjMZYF9P8no/Htqro8X9YFoUcUDPqXLGc+mFwgQGcrDeq
	wUGElzT+hMM+JkZopACQSxxqPLbot75DvdnXr8l4oRHXKSsyLH4iDyfDyBQC3d9I9IJJ
	JQpz0XfHIXWMLNHn1RXqqD2o0XAW8T+3Gu0IbVcSv9U7WVEEDelh2MI4jacpB/RAnuZG
	SF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6+ZALCV0NfY1gXE25NRLFFm6z0cxDuvsSpdD0ERunhU=;
	b=f2E3Ay7P9maJfGIyc7mZg3N0OpQhtHIqGkAscxhmNFiHY+4jhoIHOu4Z69cdTMdXIV
	u3OFEKxkGnK1oakei7atyoSAPcjTEli3HpBgFii8ViApcYQA0iWhD+xqg0L+06AEBtSD
	KpqKmsjapmMesqFc9jo6wfEYStK8HXZCDpvHPoyoWdF3vXqc0Y9k61PmGP4RV5EuBcEL
	KiWEvKCAx5I4BWaOBS3GCthIy8BZ/irZqb2Wu2sEggaJN2StZyxKhVbUM3pUaMZt8b9O
	yqzotesrW/iZrBvgG2jxPFxeo6kUjUIy11mjBGHcrxqzSsMrVNqiCFxK8dn+Atq5nvaB
	cRjA==
X-Gm-Message-State: ALyK8tJn7dTPsHUTMnXCG0rLWiFRnGKv0XrBCqzU/2HaO2MZP5bf8/fpC75DRkLb5rPURAa+
X-Received: by 10.37.27.66 with SMTP id b63mr28618902ybb.109.1469008097612;
	Wed, 20 Jul 2016 02:48:17 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A57E84.dip0.t-ipconnect.de.
	[87.165.126.132]) by smtp.gmail.com with ESMTPSA id
	j124sm700072ywg.49.2016.07.20.02.48.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 02:48:17 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 11:48:08 +0200
Message-Id: <1469008088-11976-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <loom.20160719T113248-200@post.gmane.org>
References: <loom.20160719T113248-200@post.gmane.org>
Cc: Patrick Ohly <patrick.ohly@intel.com>
Subject: [meta-java][PATCH] openjdk-8: fix compiler detection
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
X-List-Received-Date: Wed, 20 Jul 2016 09:48:18 -0000

When GCC is at version 4 or 5, parsing the recipe fails with:

ERROR: ExpansionError during parsing
.../ostro-os/meta-java/recipes-core/openjdk/openjdk-8_72b05.bb
...
bb.data_smart.ExpansionError: Failure expanding variable CFLAGS,
expression was  -O2 -pipe -g -feliminate-unused-debug-types
-fdebug-prefix-map=.../ostro-os/build/tmp-glibc/work/corei7-64-ostro-
linux/openjdk-8/72b05-r0=/usr/src/debug/openjdk-8/72b05-r0
-fdebug-prefix-map=.../ostro-os/build/tmp-glibc/sysroots/x86_64-linux=
-fdebug-prefix-map=.../ostro-os/build/tmp-glibc/sysroots/intel-corei7-64=
 -fstack-protector-strong -D_FORTIFY_SOURCE=2
${ <at> version_specific_cflags(d)} -Wno-error=deprecated-declarations which
triggered exception TypeError: can only join an iterable

That's because FLAGS_GCC<version> may be unset, thus leading to
d.getVar() returning None and ''.join(extraflags) failing.

The join() is also redundant: extraflags already is a string. It
happened to work because Python treats a string as sequence of
single-character strings, and thus ''.join() re-created the original
string.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 089f907..7ad802a 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -271,10 +271,8 @@ def version_specific_cflags(d):
         # doesn't work anyway.
         version = d.getVar('GCCVERSION', expand=True)[0]
 
-    if int(version) >= 4:
-        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True)
-
-    return ''.join(extraflags)
+    extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
+    return extraflags
 
 CFLAGS_append = " ${@version_specific_cflags(d)}"
 CXXFLAGS_append = " ${@version_specific_cflags(d)}"
-- 
2.1.4


