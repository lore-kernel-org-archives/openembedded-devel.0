Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F1B2C433F5
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 10:04:36 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web12.10812.1642500275033916303
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 02:04:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=Nxj9Z9oN;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 79.124.30.14, mailfrom: leon.anavi@konsulko.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=anavi.org;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=TjYLAT7A7o6VVUTt3Pit/ceTTwLJlM763mgP0LBcaZQ=; b=Nxj9Z9oN1qbi/PEsG5/0KnW50M
	gATlLTBfalNJBcFsCBbju4OhoK3lGy0MEvX7sFf8JanjQd79GcLIdBHTlzLp68OV7yzFso+dVEV2q
	JREyMvX8HdeWT6/4rHBtjsehlcPvldaN7+0//AAy/lTLPt90YPfp4lN8tY2sLNDQpOn/f7YcK9BmR
	Vbez+ThIczkhk6hYyWxCcKeFHKbMtIudYW1ePhq03585NRPK49c4k3F3qPmvqMUQIYwZOOCNZSPZy
	7GvAKlt+kuSjshWJgkBIhTCUZ25Xk4y1/+ht5xDhw54DfCrRKWfkghQXjyNdNmmvg5ipoTOzdwRhe
	gi1pcqHA==;
Received: from lan.nucleusys.com ([92.247.61.126]:60642 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1n9lMD-00071P-S2; Tue, 18 Jan 2022 12:04:33 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-fasteners: Upgrade 0.16.3 -> 0.17.2
Date: Tue, 18 Jan 2022 12:04:21 +0200
Message-Id: <20220118100422.461016-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118100422.461016-1-leon.anavi@konsulko.com>
References: <20220118100422.461016-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.superhosting.bg
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.superhosting.bg: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.superhosting.bg: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 10:04:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94912

Upgrade to release 0.17.2:

- Remove unecessary setuptools pin
- Switch to the modern python package build infrastructure
- Remove support for python 3.5 and earlier, including 2.7
- Add support for python 3.9 and 3.10
- Fix a conflict with django lock
- Add __version__ and __all__ attributes
- Fix a failure to parse README as utf-8
- Move from nosetest to pytest and cleanup testing infrastructure

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...asteners_0.16.3.bb => python3-fasteners_0.17.2.bb} | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-fasteners_0.16.3.bb => python3-fasteners_0.17.2.bb} (50%)

diff --git a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb b/meta-python/recipes-devtools/python/python3-fasteners_0.17.2.bb
similarity index 50%
rename from meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
rename to meta-python/recipes-devtools/python/python3-fasteners_0.17.2.bb
index 26549c151..5e847497a 100644
--- a/meta-python/recipes-devtools/python/python3-fasteners_0.16.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fasteners_0.17.2.bb
@@ -3,11 +3,16 @@ HOMEPAGE = "https://github.com/harlowja/fasteners"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4476c4be31402271e101d9a4a3430d52"
 
-SRC_URI[sha256sum] = "b1ab4e5adfbc28681ce44b3024421c4f567e705cc3963c732bf1cba3348307de"
+SRC_URI[sha256sum] = "2aceacb2bd618ce8526676f7a3e84ea25d0165ef10abb574a45b4a9c07292d2e"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += "\
-    ${PYTHON_PN}-logging \
-    ${PYTHON_PN}-fcntl \
+	${PYTHON_PN}-logging \
+	${PYTHON_PN}-fcntl \
 "
+
+do_compile:prepend() {
+	echo "from setuptools import setup" > ${S}/setup.py
+	echo "setup()" >> ${S}/setup.py
+}
-- 
2.30.2


