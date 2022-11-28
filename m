Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E105C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:06:28 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.111327.1669615581248229515
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:06:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yJiZ4AEh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669615579; i=@fujitsu.com;
	bh=ZDQq73gWL4f5703sA9rFn0/U/Bzlp3Djyk4+Ptpmhu8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yJiZ4AEhNuDFW5CQ5Fcj8PWROwdc47PJeZcV+zwTutBQmYHtb7K1X2Jpeji7gVE/f
	 Uvk/bErNbliV64J0NlxpTVAuSZDAwcgyZzwxzNC/HlRG2VTjl2N5q0R8eq5op/HjPH
	 VOTWHUBe4F+7ZF130z8IjoQjwSMUWAdyXQ6W/hFP0fL2KNU2f9eSogm/KsemHWs1cZ
	 3+WSNSmBNsWZuq+u0TDBoKOOG6OuxvRR3Hnsliz+2IAdlDf/XFqy+Z8owWSG7dfDfz
	 3HOFNbYeyM31FE/i4Z1DpaImizEiKAhtNRgWaPy8kMGsaznSDWSsUSRUMfKBEDv7cx
	 U291kWdAS/IeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8OxWfe2f0u
  ywZ9HbBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bdq/8ZC7q4Ky5tecnWwHiFs4uRi0NI4CGj
  xJPf/1ghnMtMEu3vP7JDOHsYJXYfnsXWxcjJwSYgJXHj/n8wW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICtxK7Pj1lBbBYBVYkPpxqZQGxeASeJthkzwGokBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaFqcWlSWWqRrqZdUlJm
  eUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOil5dasokRGIwpxWy/dzCeX/ZH
  7xCjJAeTkijvwktNyUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeNd7tiQLCRalpqdWpGXmACMDJ
  i3BwaMkwrvYHijNW1yQmFucmQ6ROsWoKCXOO9cPKCEAksgozYNrg0XjJUZZKWFeRgYGBiGegt
  Si3MwSVPlXjOIcjErCvIIgU3gy80rgpr8CWswEtHiTYhPI4pJEhJRUA1PIhJ/b7CKvX/ifsOA
  RW23G+iDfTe8uLfs7hemCt1Ko9lMVrr06HtfO1QabZkXNFuZvr2C+v36r5L+vB30ftH/k3Sjx
  pj+4YKmZrEiWw47vPlvdp36M4E2JmOu30E1B6jJn2NRtnP8juk3c98n/MZugPeUKR86pCM2KF
  8f5imIzk0LzmWQi2Msu2948L+H41bAgeZ7H4X8NfknPGgr+P5tzJP3Dnsdyr+/GOvG+OcihJT
  gjoWMFq17r+UX+f7lmuH9jvPQh8cyR0Pm1z1OntQhGrNw7/Y9pdUqw9qm7RoX1B/77B6Q0hjH
  c3rP5oszajf9qeAIuPZki3/1ofmrZBNtt2kdjbmcc5Tn06WyVs6cSS3FGoqEWc1FxIgBRvPz9
  QQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-587.messagelabs.com!1669615578!200346!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11740 invoked from network); 28 Nov 2022 06:06:19 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:06:19 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B9529150
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:18 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id ACC517B
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:18 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:06:17 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] audit: upgrade 3.0.8 -> 3.0.9
Date: Mon, 28 Nov 2022 14:05:48 +0800
Message-ID: <1669615552-13033-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99786

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
    In auditd, release the async flush lock on stop
    Don't allow auditd to log directly into /var/log when log_group is non-zero
    Cleanup krb5 memory leaks on error paths
    Update auditd.cron to use auditctl --signal
    In auparse, if too many fields, realloc array bigger (Paul Wolneykien)
    In auparse, special case kernel module name interpretation
    If overflow_action is ignore, don't treat as an error

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-security/audit/{audit_3.0.8.bb => audit_3.0.9.bb} (98%)

diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb b/meta-oe/recipes-security/audit/audit_3.0.9.bb
similarity index 98%
rename from meta-oe/recipes-security/audit/audit_3.0.8.bb
rename to meta-oe/recipes-security/audit/audit_3.0.9.bb
index 78439f66f..dcab7dcc8 100644
--- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
+++ b/meta-oe/recipes-security/audit/audit_3.0.9.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
 "
 
 S = "${WORKDIR}/git"
-SRCREV = "54a62e78792fe583267cf80da717ee480b8f42bc"
+SRCREV = "81fa28e0e8b4be83ddba03de8b816a3df510c17e"
 
 inherit autotools python3native update-rc.d systemd
 
-- 
2.25.1


