Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web11.3591.1624514719862479783
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Jun 2021 23:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tU/9zRLG;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1624514718; i=@fujitsu.com;
	bh=SHG414igDUW0G1FOCfLht4kBMs3kUtqaxga18hZXqY0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tU/9zRLGYQMs30RlI4V1TMpTCC4F2SCj9L0ZAX4OeXypRE8aj5eQa/Pzk33iEK79O
	 UWMiTSYdwY1bxx4VTBFZpGkhIzrgrg2I1rHt0SL80paGjQOm9b62GFDoXWAq/lvI5/
	 093qN2tH3aOLLlhLtA7rKCd3wwFZPSbRmwCV7a8r1UGtKgkl3rPBJZjtxJB/A9men3
	 R7xJ1CXhtge8FLQCs16e1ZkMM7tk5yVtfR+B3wxEv/WIh4u9tarMmHs3IlBfm7XSIg
	 kYSJS2hEok3qg+f5XKUCTMWLbwdy4n4NXT1Z6KpjWR6gO2ZJvw5nqXLHHJzCIwflJ3
	 t/gOxgA7yFObQ==
Received: from [100.112.193.7] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 2F/4F-39326-D9024D06; Thu, 24 Jun 2021 06:05:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqjtX4Uq
  CwdnNmhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bT33OYC5o5K+5MnMncwLiAo4uRi0NIYDaT
  xO97z9ghnBOMEmv+32DtYuTkYBPQkeh40c0CYosI6Essnb2HGcQWFvCQOD3jKhOIzSKgKnFm7
  Uwwm1fAXeLCo31gtoSAgsSUh++ZIeKCEidnPgGbwywgIXHwxQtmiBpFie07z7BA2BUSM2ZsY5
  vAyDMLScssJC0LGJlWMZonFWWmZ5TkJmbm6BoaGOgaGhrpGlqa6JqZ6SVW6SbqpZbqlqcWl+g
  a6iWWF+sVV+Ym56To5aWWbGIEhlFKwSGnHYzvX3/QO8QoycGkJMp7n/9KghBfUn5KZUZicUZ8
  UWlOavEhRhkODiUJ3uNyQDnBotT01Iq0zBxgSMOkJTh4lER4JWWB0rzFBYm5xZnpEKlTjIpS4
  rySwEgQEgBJZJTmwbXB4ugSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWHeXSDbeTLzSuCmvw
  JazAS0WOH3RZDFJYkIKakGpo6GngLFhJagm+embOF/x2Oo8D5/8rpXild2PHvkefBsUd/3r2n
  2ctzfZ8Zp56h/y++7drPX/2DUrF158Te71JdfW3t015bwyStLdJ/MnLbU/Phl19AegfK4l/Fb
  jmvGuTnyLdswIe7ArJ7vm3QuW1/03KnWUH33qJnO7vzv25dl8unven2vb1HmbBuTyY2hbOttp
  9gvUCu6FfD/cTRfbGTk+cMuC7ZkOh18W8/6IDZY1eL9/41xYdv701f8nfSeTUUrXWRJot2Sxt
  70vtcZHDtSm40lC2Vta/N+BeQ9nMy9pU49I3nRoy3Nn37rdt84Zsg3r0Npd+9cz+jffjdPsm1
  /k6xSKXzFySZU/o93shJLcUaioRZzUXEiAD7d3xoeAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-23.tower-271.messagelabs.com!1624514717!110768!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6756 invoked from network); 24 Jun 2021 06:05:17 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-23.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Jun 2021 06:05:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 15O651U7018854
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Jun 2021 07:05:17 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 24 Jun 2021 07:04:59 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-h5py: upgrade 3.2.1 -> 3.3.0
Date: Thu, 24 Jun 2021 14:04:51 +0800
Message-ID: <1624514691-14415-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../python/{python3-h5py_3.2.1.bb => python3-h5py_3.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.2.1.bb => python3-h5py_3.3.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.2.1.bb b/meta-python/recipes-devtools/python/python3-h5py_3.3.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-h5py_3.2.1.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.3.0.bb
index 5faa0b8080..58498f89a0 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "89474be911bfcdb34cbf0d98b8ec48b578c27a89fdb1ae4ee7513f1ef8d9249e"
+SRC_URI[sha256sum] = "e0dac887d779929778b3cfd13309a939359cc9e74756fc09af7c527a82797186"
 
 SRC_URI_append = " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
-- 
2.25.1

