Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FCBC43217
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 10:52:52 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.39418.1666003962680703530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 03:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=CHHDR2gj;
 spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ymJkMsXs9colGo9EI85yk2ZOLslrN79TYtVa742/zno=; b=CHHDR2gjDJ68NPqsGHLqVb8JrM
	l7J2wflSgzwvcGPSItl5SRtBevkJXEdVF6rVK54zUKgJZvQornPWS+h3wykGVVu1qSpZO+ogJezlv
	kLUoEqagH+XLOEGUPYFTAnk+OkbgVMV1YKT/AodnIabBFHsPgUYBaY3BlSwQyt62765ODyU32YF2h
	VsbK4pt7KI26yNnpDpcdtFb9TZO4GdiO11q3TmlV+qMsAQa2BDdft/BmXZKUcZhyQ4Lo5Jz+pkpOe
	wUM69aZANieC4r7fRNfdJvoFrKpxEzKBr4gRxLr9W1O/Ahj7ICcydNK1iTby8oC91mv4/zpLuTUcN
	xJWmiIpg==;
Received: from lan.nucleusys.com ([92.247.61.126]:55420 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1okNjx-00021z-Pt;
	Mon, 17 Oct 2022 13:52:42 +0300
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-distro: Upgrade 1.7.0 -> 1.8.0
Date: Mon, 17 Oct 2022 13:52:26 +0300
Message-Id: <20221017105226.3623929-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221017105226.3623929-1-leon.anavi@konsulko.com>
References: <20221017105226.3623929-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 10:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99192

Upgrade to release 1.8.0:

- Replace setup.py with build
- Lowered LinuxDistribution._distro_release_info method complexity
- Added official support for Buildroot distribution
- Added official support for Guix distribution
- Added support for /etc/debian_version
- Fixed a typography in CONTRIBUTING.md
- Improved README.md "Usage" code block

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-distro_1.7.0.bb => python3-distro_1.8.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-distro_1.7.0.bb => python3-distro_1.8.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-distro_1.7.0.bb b/meta-python/recipes-devtools/python/python3-distro_1.8.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-distro_1.7.0.bb
rename to meta-python/recipes-devtools/python/python3-distro_1.8.0.bb
index f069234d1..f7616e473 100644
--- a/meta-python/recipes-devtools/python/python3-distro_1.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-distro_1.8.0.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=d2794c0df5b907fdace235a619d80314"
 
 PYPI_PACKAGE = "distro"
 
-SRC_URI[sha256sum] = "151aeccf60c216402932b52e40ee477a939f8d58898927378a02abbe852c1c39"
+SRC_URI[sha256sum] = "02e111d1dc6a50abb8eed6bf31c3e48ed8b0830d1ea2a1b78c61765c2513fdd8"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} = "\
 	${PYTHON_PN}-core \
-- 
2.30.2


