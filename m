Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C60C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 11:51:43 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.6430.1666785097821731343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Oct 2022 04:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=iRc6c7s+;
 spf=softfail (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=KaiN5w1TNVTNZJaqNRHlXgjOka6C5sfLc4bsOVc3i8k=; b=iRc6c7s+w72OqeXJAn7NDzWfHp
	TqLgPSuBX6hqkaOfQwx+RAfQDt4eEgrsZL3RbXczi/lTmgck166ilgcsX5POAxeAI6jgCJOk/8B51
	SGU7Ioh4pxQYnn0By2/R9PCM+9M8bsmteZUmiBiX7fCwBiRz29tn+HxM5iYztAnBUFqdPfQGULaWr
	YLyeCcDCUyGmZb7b1ESAFY2CaXmCrPDXwqrV/3OWes0I6d/hq60yWuNnFgLVoeRA/dLw7SR19eFde
	o3dJ2ssPau32B9ICq6apUoOoBwXxUMpeA3z5hTyQRUQ1hJ1cmTCftsBZ2plxHZX0uc+wOifrulYaU
	uGi/3LtQ==;
Received: from lan.nucleusys.com ([92.247.61.126]:60144 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1onexZ-0002xU-6w;
	Wed, 26 Oct 2022 14:51:37 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-colorama: Upgrade 0.4.5 -> 0.4.6
Date: Wed, 26 Oct 2022 14:51:23 +0300
Message-Id: <20221026115124.289505-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221026115124.289505-1-leon.anavi@konsulko.com>
References: <20221026115124.289505-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Oct 2022 11:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99312

Upgrade to release 0.4.6:

- Add alternative to 'init()', called 'just_fix_windows_console'.
  This fixes many longstanding problems with 'init', such as
  working incorrectly on modern Windows terminals, and wonkiness
  when init gets called multiple times. The intention is that it
  just makes all Windows terminals treat ANSI the same way as other
  terminals do.
- Support Windows 10's ANSI/VT console. This didn't exist when
  Colorama was created, and avoiding us causing havok there is long
  overdue.
- Internal overhaul of package metadata declaration, which
  abolishes our use of the now heavily discouraged setuptools (and
  hence setup.py, setup.cfg and MANIFEST.in), in favor of hatchling
  (and hence pyproject.toml). This includes dropping support
  Python3.5 and 3.6, which are EOL, and were already dropped from
  setuptools, so this should not affect our users.
- Attention to detail award to LqdBcnAtWork for a spelling fix in
  demo06

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-colorama_0.4.5.bb => python3-colorama_0.4.6.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorama_0.4.5.bb => python3-colorama_0.4.6.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-colorama_0.4.5.bb b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-colorama_0.4.5.bb
rename to meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
index 122ae5399..52e1e68b1 100644
--- a/meta-python/recipes-devtools/python/python3-colorama_0.4.5.bb
+++ b/meta-python/recipes-devtools/python/python3-colorama_0.4.6.bb
@@ -3,8 +3,12 @@ HOMEPAGE = "https://github.com/tartley/colorama"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b4936429a56a652b84c5c01280dcaa26"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "e6c6b4334fc50988a639d9b98aa429a0b57da6e17b9a44f0451f930b6967b7a4"
+SRC_URI[sha256sum] = "08695f5cb7ed6e0531a20572697297273c47b8cae5a63ffc6d6ed5c201be6e44"
+
+DEPENDS += " \
+	${PYTHON_PN}-hatchling-native \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.30.2


