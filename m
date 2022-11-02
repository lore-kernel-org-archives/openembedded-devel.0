Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E363C433FE
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 06:51:53 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3351.1667371903875992135
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Nov 2022 23:51:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Gr0kgJ0U;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667371901; i=@fujitsu.com;
	bh=f1dGPfc0PWDEpPHAJpCgHGinrelf4JGhJe4FPrxoHPY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Gr0kgJ0UICOnYdGDP+uDGICID9Y6IfumDKZ4pr8jW/mV56+3z6jhwTo7E9rg7f64a
	 evNEyI0xxV46ye9esPIkoXPa5YmBaHfg0Cl75Im1GhWqMfn0pg7b1RnbqwosI+MdBo
	 ibQGYeRtIuLL01uK7+B/2mbw3rNUsRsQ8A+k0bSCOwqHrGIW7/2+3LItgP/Hhs1c6v
	 SJyuij5MmE8K5EuVSCbXYxlhvyCYQaxIZn39gIIx60AOMNm9i5GqStk1qCtbpKd4DJ
	 hD9FOxhtXbaVicpcJ6arN1w3Xwxu6jtkax31BF+hgK7nywxFAc+0ZzjsZ6KtAIEJ7Z
	 3mwOhvtdCUTFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORpFsrnJR
  s8P4Rl8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHk/muWgsfsFZt/SzcwdrB3MXJxCAk8ZJTo
  efONBcK5wiSx7+otNghnN6PE1AudrF2MnBxsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3DD
  mILC3hJfG79zdTFyMHBAhS/Oz8UJMwr4CTx604nI4gtIaAgMeXhe2aIuKDEyZlPWCDGSEgcfP
  GCGaJGUWL25WYWCLtCYtasNiYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRrPi1KKy1CJdS72kosz
  0jJLcxMwcvcQq3US91FLdvPyikgxdQ73E8mK91OJiveLK3OScFL281JJNjMBQTClOz93BeGnZ
  H71DjJIcTEqivMnsSclCfEn5KZUZicUZ8UWlOanFhxhlODiUJHg/8QHlBItS01Mr0jJzgHEBk
  5bg4FES4dVkAUrzFhck5hZnpkOkTjEqSonzThMCSgiAJDJK8+DaYLF4iVFWSpiXkYGBQYinIL
  UoN7MEVf4VozgHo5Iwrxc/0BSezLwSuOmvgBYzAS1ma48DWVySiJCSamCKCMzktXA4p7rNfYt
  v+++2vbu+qOyaoyRj0Xe3Yoqhwv+ZU4Wf9fCxHzGSfXB6tcxfhqo1631asu4t2RF5f3tHH6u0
  6PcLTvvrjpzuusq09eq+510n9M8et7rdMrPk0UaO9Y8mNlW7xzZJL9/XlNvGtz2IufHYhL0h6
  53K8lWPXe/jtW1xOniN8YKOd+dxhyeSHcnXnx9ueXbh652LIjyuM7ouWqw4ljA1u+WAm+Z7B7
  Ff3cmMut0iqxqu/Vz0IfB9r/27H7ffqcc48/zKMLe/kMhd0uGi+EP+3mfd839W2H2xWe0dyXD
  4kXX35qXM02r7b14p+cSyQr/wxIQnbGsle41Citut0vOulyk4CLsrsRRnJBpqMRcVJwIAQdyO
  pEADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-745.messagelabs.com!1667371900!54586!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7975 invoked from network); 2 Nov 2022 06:51:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-12.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Nov 2022 06:51:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id A498B1AD
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Nov 2022 06:51:40 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 99B6A1AB
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Nov 2022 06:51:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 2 Nov 2022 06:51:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] fetchmail: Fix buildpaths warning.
Date: Wed, 2 Nov 2022 14:51:22 +0800
Message-ID: <1667371885-20154-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Nov 2022 06:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99406

From: Wang Mingyu <wangmy@fujitsu.com>

WARNING: fetchmail-6.4.23-r0 do_package_qa: QA Issue: File /usr/bin/fetchmailconf in package fetchmail contains reference to TMPDIR [buildpaths]

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
index e4ad0a39e1..266573681e 100644
--- a/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
+++ b/meta-networking/recipes-support/fetchmail/fetchmail_6.4.23.bb
@@ -18,5 +18,9 @@ inherit autotools gettext pkgconfig python3-dir python3native
 
 EXTRA_OECONF = "--with-ssl=${STAGING_DIR_HOST}${prefix}"
 
+do_install:append() {
+    sed -i 's,${RECIPE_SYSROOT_NATIVE},,g' ${D}${bindir}/fetchmailconf
+}
+
 PACKAGES =+ "fetchmail-python"
 FILES:fetchmail-python = "${libdir}/${PYTHON_DIR}/*"
-- 
2.25.1


