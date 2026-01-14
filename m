Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70F7D2A01D
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:01:34 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9438.1768395689267341766
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d0QxCVn+;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7b22ffa2a88so4172654b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 05:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768395688; x=1769000488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkKRuEZ/EyAtsT4F72NgRdDRae8kV4krNQwDghSHDAQ=;
        b=d0QxCVn+VbzZZKoImPuWEQEz51OOp4jdDRa/buo5IsEcXtEoxC0hgRiaFuJ+1YiBbv
         S5f1SSbBW7Kyujtr/MsIG2+9xG4IeduU2sW/Yt3gDwKOJ38uGV3cU8CGagH2R3MZ3W5+
         FU42r8scxmjVa8ptGQA418AvOY9kiT7tzsvwHa4vHTYPW4PVNxYDZa27+fXkO0hpz6nY
         TxSsSJiIMNuPKNGD7dQ10rVXzXIWoJIIify9hPT56D0Nm0W1HAnIqVnzWIjDkiLpRi+p
         b2N753EByo0MBNJYqsJ/ov05d/a4t4IEjnXFBgd5MbH8Yq4aTZAvpCnXntrvJ2e5TFi0
         IOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768395688; x=1769000488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bkKRuEZ/EyAtsT4F72NgRdDRae8kV4krNQwDghSHDAQ=;
        b=ZAp/+3YX6RpbxV3ontM1hfvPHA+JhDpYFTAHWwUXb9cEnwbKempEBmE7Bh/DUhYwu7
         L7geQECrR0+O8fBddg6tJE2104ak6664019CucxVrsCUiqCneswZXzqzn3nGgTLs7vYi
         vNMu0Qi/eFhZjNYNjF8K8lD7lTB781cxS5m1JOeF9KLa9BwfEpSByxURJR50NY5sx9TR
         4/J9CJYIprrXdNSC1MCmZwGb1TuIaSucZxnL7nQbFNZecMMepmLom9Hfd5baRffOSsre
         ZHaHO9x2yBHqahZlo2hAcj8WQaFKSUC26vLeAufVZb4ddwdJozYpq59vTdLk7P/V6Zg7
         d6DQ==
X-Gm-Message-State: AOJu0YykyOUX8fM9Ulw052zGbPMDQutu2s05qFoDypLV1ezinlZAcsKd
	FI8gMDMe/6gdAxvL62hnTpewjN+lTPc4ucxfDN1jcu7DruFcLET8O9MbO6AGTQ==
X-Gm-Gg: AY/fxX5UZbtisa1iiKrIWImjCIJ7eWn9szZ550wULMEqWwRae7eaKWfETs4xJDV69k5
	RDV42EqKMPbIOIrPc95IpE+++BNjbfcz56okdR7G2KRcUPxVTKlRVkqfD2BgqjJz5PfCbpLmMOd
	D5a+sWmhohijJsRO3F73swH/5Ba7TfIoHi4P8SavlqVao56/1n1iAKUSThzSjj/fUcMYOQogJrx
	prypEpHCilsnumBzDegz5oJhAui1gzrhTrzNuZ8dlIwoaFb6oBmfPZnffUyrKiP47J8I62ZykS0
	ug3KAV4FXuqB8syEgXwnHM0bp8j7HDy9JLOV2tZCCJodD83B/s5mWltPdspgiZx+6/pyYeyov41
	BT94upynpg+XJbl4icqjaOmr2dfexscxEibcukyZL2mu1+gBHk0tTdAjcTjyUDbNRnGkMUQ6yXF
	QJONxngWO9OscEv6XOv2NdjPA=
X-Received: by 2002:a05:6a00:3497:b0:81f:5a3a:c91a with SMTP id d2e1a72fcca58-81f81f9553fmr1909525b3a.46.1768395686848;
        Wed, 14 Jan 2026 05:01:26 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819ab137711sm23340853b3a.0.2026.01.14.05.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 05:01:26 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][scarthgap][PATCH 09/20] python3-ldap: upgrade 3.4.4 -> 3.4.5
Date: Thu, 15 Jan 2026 02:00:46 +1300
Message-ID: <20260114130100.1016416-9-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
References: <20260114130100.1016416-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jan 2026 13:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123462

From: Gyorgy Sarvari <skandigraun@gmail.com>

Contains fixes for CVE-2025-61911 and CVE-2025-61912

Changelog:
Security fixes:
- CVE-2025-61911 (GHSA-r7r6-cc7p-4v5m): Enforce str input in
  ldap.filter.escape_filter_chars with escape_mode=1; ensure proper
  escaping.
- CVE-2025-61912 (GHSA-p34h-wq7j-h5v6): Correct NUL escaping in
  ldap.dn.escape_dn_chars to \00 per RFC 4514.

Fixes:
- ReconnectLDAPObject now properly reconnects on UNAVAILABLE, CONNECT_ERROR
  and TIMEOUT exceptions (previously only SERVER_DOWN), fixing reconnection
  issues especially during server restarts
- Fixed syncrepl.py to use named constants instead of raw decimal values
  for result types
- Fixed error handling in SearchNoOpMixIn to prevent a undefined variable error

Tests:
- Added comprehensive reconnection test cases including concurrent operation
  handling and server restart scenarios

Doc:
- Updated installation docs and fixed various documentation typos
- Added ReadTheDocs configuration file

Infrastructure:
- Add testing and document support for Python 3.13

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9eabbca90565e4ae790bedeef9a91df1878c6f93)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-ldap_3.4.4.bb => python3-ldap_3.4.5.bb}      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.4.bb => python3-ldap_3.4.5.bb} (77%)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
similarity index 77%
rename from meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
rename to meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
index 57a5b8dbe1..bbec490c23 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.4.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
@@ -7,13 +7,13 @@ HOMEPAGE = "http://www.python-ldap.org/"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=36ce9d726d0321b73c1521704d07db1b"
 
-DEPENDS = "python3 openldap cyrus-sasl"
+DEPENDS = "python3 openldap cyrus-sasl python3-setuptools-scm-native"
 
-PYPI_PACKAGE = "python-ldap"
+PYPI_PACKAGE = "python_ldap"
 
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "7edb0accec4e037797705f3a05cbf36a9fde50d08c8f67f2aef99a2628fab828"
+SRC_URI[sha256sum] = "b2f6ef1c37fe2c6a5a85212efe71311ee21847766a7d45fcb711f3b270a5f79a"
 
 do_configure:prepend() {
     sed -i -e 's:^library_dirs =.*::' \

