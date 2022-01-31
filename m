Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3432FC433EF
	for <webhook@archiver.kernel.org>; Mon, 31 Jan 2022 11:39:57 +0000 (UTC)
Received: from voyager.superhosting.bg (voyager.superhosting.bg
 [79.124.30.14])
 by mx.groups.io with SMTP id smtpd.web08.30800.1643629195481277397
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Jan 2022 03:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@anavi.org header.s=default header.b=a+EfTHVl;
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
	bh=ds66XrcJi1jWZUzS5VdHLGwDOMYB8qr2aFMi4FVRVA4=; b=a+EfTHVlv2ePX059HOxqCn6Q1M
	ixSeC5T18Lztb1KOik8P9YuzfN4ksjABLZRfYyW9DE2ley+81UC8E6f7WS6YIb5qqCBBfjPojw+Fh
	YedwsoJNaBUae35DT1VVCm8USVlE2SXkltaDTeunMlrxzvNsFpIhUrCLiIVxgv845fgOlsW3/ZCWK
	Mb9wq/IBUqCV/sZVbBR9IRAfpsvDmIWcYFiMr9dxvCs0Pre3d1G8+s9vG5F9xhHMrd4skxg+KzIkh
	S71/OCgvP9e/Asd6VJUtZRGTPiPd1iubm2YZq3FdvuXSyXbLwsqwRa4M5nm+w5LCoGj0nqPQpr5l0
	U7PnRXFg==;
Received: from lan.nucleusys.com ([92.247.61.126]:32774 helo=tone.k.g)
	by voyager.superhosting.bg with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1nEV33-000ATm-0t; Mon, 31 Jan 2022 13:39:53 +0200
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-coverage: Upgrade 6.2 -> 6.3
Date: Mon, 31 Jan 2022 13:39:42 +0200
Message-Id: <20220131113942.2417929-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220131113942.2417929-1-leon.anavi@konsulko.com>
References: <20220131113942.2417929-1-leon.anavi@konsulko.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jan 2022 11:39:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95182

Upgrade to release 6.3:

- Added the lcov command to generate reports in LCOV format.
- the coverage data file can now be specified on the command line
  with the --data-file option in any command that reads or writes
  data. This is in addition to the existing COVERAGE_FILE
  environment variable.
- coverage measurement data will now be written when a SIGTERM
  signal is received by the process. This includes
  Process.terminate, and other ways to terminate a process.
  Currently this is only on Linux and Mac; Windows is not supported.
- Dropped support for Python 3.6, which reached end-of-life on
  2021-12-23.
- Updated Python 3.11 support to 3.11.0a4.
- Fix: the coverage data file is now created in a more robust way,
  to avoid problems when multiple processes are trying to write
  data at once.
- Fix: a .gitignore file will only be written into the HTML report
  output directory if the directory is empty. This should prevent
  certain unfortunate accidents of writing the file where it is
  not wanted.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-coverage_6.2.bb => python3-coverage_6.3.bb}    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_6.2.bb => python3-coverage_6.3.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_6.2.bb b/meta-python/recipes-devtools/python/python3-coverage_6.3.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-coverage_6.2.bb
rename to meta-python/recipes-devtools/python/python3-coverage_6.3.bb
index 6e080b00c..0ed90281f 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_6.2.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_6.3.bb
@@ -3,10 +3,14 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "e2cad8093172b7d1595b4ad66f24270808658e11acf43a8f95b41276162eb5b8"
+SRC_URI[sha256sum] = "987a84ff98a309994ca77ed3cc4b92424f824278e48e4bf7d1bb79a63cfe2099"
 
 inherit pypi setuptools3
 
 RDEPENDS:${PN} += " \
 	${PYTHON_PN}-sqlite3 \
+	${PYTHON_PN}-core \
+	${PYTHON_PN}-pprint \
+	${PYTHON_PN}-json \
+	${PYTHON_PN}-xml \
 "
-- 
2.30.2


