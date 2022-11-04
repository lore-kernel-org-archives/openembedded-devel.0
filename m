Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5598C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 06:50:38 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.8290.1667544636016778991
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Nov 2022 23:50:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tW3gKQ+X;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667544634; i=@fujitsu.com;
	bh=Hcr8/+fye6fpBPgu1Ss8Hew3ism9niYVMZl+YNBlD/o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tW3gKQ+Xh3i6FMAt+4zeN5UWai+sdefnEWOT4XvyIL0lIy0mey3ZtuVs8twTZQcEb
	 oPNn/JGK6LKvs7rWvwPT/MI4NoI4UdT74ZF/X8DBLj2uR/VDyroIIBOEqTFg76vOrs
	 2or0D2z4M94Urmdc6sHbUMV8SlHdXtP9Z4lwp2UGybE5/QR48GwHAno4xEyeXT4bt7
	 ZKLnLoCOvhBJsle/Tw+V1vPn+qGFu8SRWWpt3exfTiRVwG+yqunSnC5ElaNxI8nIIr
	 hYQTyCQqxKKA14aq4ird+tpmlSJe6yZ+UOXGqz4s6jiGoE/SOjoTIxQWI1XDq3/k6A
	 NbWxGnHuxHwkg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8ORpGu5LSX
  Z4G+rhMXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHu+zb2gn3sFc0zT7I0MF5j62Lk4hASeMgo
  sedcMyOEc4VJ4tiROcwQzm5GiY33J7B3MXJysAlISdy4/58NxBYR0JdYOnsPM4jNLKAi8eJ3D
  1iNsECYxIETTYwgNgtQ/Py7XawgNq+Ao8SKV71gtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsColZs9qYIGw1iavnNjFPYOSfhaR9FpL2BYxMqxjNilOLylKLdA31kooy0zN
  KchMzc/QSq3QT9VJLdfPyi0oygFKJ5cV6qcXFesWVuck5KXp5qSWbGIHhmFKczL6D8c2SP3qH
  GCU5mJREeet4U5KF+JLyUyozEosz4otKc1KLDzHKcHAoSfDO3QSUEyxKTU+tSMvMAcYGTFqCg
  0dJhPf3PKA0b3FBYm5xZjpE6hSjopQ4r+EWoIQASCKjNA+uDRaPlxhlpYR5GRkYGIR4ClKLcj
  NLUOVfMYpzMCoJ804D2c6TmVcCN/0V0GImoMXbqpNAFpckIqSkGpi4ue1jOieVh7i+WbZcq3b
  nr0bPXLFWpZCsKiY3v0N9esvvnzu5rPjiWvnPB5+tzcnr/DSX2/n0iWrFb/2RqxviToi4OP26
  8uecpbmRSKqnxLUnKeKZYQr5y9bLHajc7BxjqnVgocknw3eNeyZ/+Zi5aM7KdWc+5mi8UZl/U
  LzQ7St3zYmudztWptczavQ8dv2h2XYjb38kw+7A1OJH3gq9+rGz4/91mLz+J/fuuOfZ4/UxDy
  bvfHhxac/ryxuEbu5M6hGyqj296qH6+onmEvW7rq6YnVl0dOEbnrrJNeu38l7JsHxXb7fjdt2
  TNbIKsqZfPubWXFIPXc7y5sbeCTe8flmqsNYEznFZJjJ/W7afEktxRqKhFnNRcSIAP0upB0ID
  AAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-745.messagelabs.com!1667544633!769856!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2917 invoked from network); 4 Nov 2022 06:50:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-9.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Nov 2022 06:50:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id D93B81B5
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Nov 2022 06:50:32 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id CE0D61AD
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Nov 2022 06:50:32 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 4 Nov 2022 06:50:31 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] openwsman: Change download branch from master to main.
Date: Fri, 4 Nov 2022 14:50:19 +0800
Message-ID: <1667544619-5006-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Nov 2022 06:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99427

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
index 7fc5d4218..0776ea2f6 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.1.bb
@@ -17,7 +17,7 @@ REQUIRED_DISTRO_FEATURES = "pam"
 
 SRCREV = "6cdf3bee50388d8e5f70850322a4df57fd685a5e"
 
-SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/Openwsman/openwsman.git;branch=main;protocol=https \
            file://libssl-is-required-if-eventint-supported.patch \
            file://openwsmand.service \
            file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
-- 
2.25.1


