Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA47DC433EF
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 19:06:01 +0000 (UTC)
Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.230.1636743961126977382
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Nov 2021 11:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 spf.securedserverspace.com}: parse error
 for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded
 (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from lan.nucleusys.com ([92.247.61.126]:53236
 helo=lootbox.konsulko.bg)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mlbs4-0006tw-B2; Fri, 12 Nov 2021 21:05:57 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-coverage: Upgrade 6.1.1 -> 6.1.2
Date: Fri, 12 Nov 2021 21:05:47 +0200
Message-Id: <20211112190547.4560-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211112190547.4560-1-leon.anavi@konsulko.com>
References: <20211112190547.4560-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id:
 leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Nov 2021 19:06:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93923

Upgrade to release 6.1.2:

- Python 3.11 is supported (tested with 3.11.0a2). One still-open
  issue has to do with exits through with-statements.
- Fix: When remapping file paths through the [paths] setting while
  combining, the [run] relative_files setting was ignored,
  resulting in absolute paths for remapped file names. This is now
  fixed.
- Fix: Complex conditionals over excluded lines could have
  incorrectly reported a missing branch. This is now fixed.
- Fix: More exceptions are now handled when trying to parse source
  files for reporting. Problems that used to terminate coverage.py
  can now be handled with [report] ignore_errors. This helps with
  plugins failing to read files.
- Fix: Removed another vestige of jQuery from the source tarball.
- Fix: Added a default value for a new-to-6.x argument of an
  internal class. This unsupported class is being used by
  coveralls. Although I'd rather not "fix" unsupported interfaces,
  it's actually nicer with a default value.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_6.1.1.bb => python3-coverage_6.1.2.bb} | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_6.1.1.bb => python3-coverage_6.1.2.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_6.1.1.bb b/meta-python/recipes-devtools/python/python3-coverage_6.1.2.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-coverage_6.1.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_6.1.2.bb
index a99fca2cb..c456800c5 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_6.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_6.1.2.bb
@@ -3,7 +3,10 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "b8e4f15b672c9156c1154249a9c5746e86ac9ae9edc3799ee3afebc323d9d9e0"
+SRC_URI[sha256sum] = "d9a635114b88c0ab462e0355472d00a180a5fbfd8511e7f18e4ac32652e7d972"
 
 inherit pypi setuptools3
 
+RDEPENDS:${PN} += " \
+	${PYTHON_PN}-sqlite3 \
+"
-- 
2.20.1


