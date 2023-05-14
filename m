Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DDAC77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 13:07:15 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.66584.1684069634770923426
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 May 2023 06:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aZZMdH/Z;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1684069632; i=@fujitsu.com;
	bh=jljFVDHjCHgpObdv2wED6rGbTugRzilEJg8vpCZ35Ds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=aZZMdH/ZiPoXzWZWzRbiZCWO7gR6uIV91OZ0IRU17kmcSnHpwcuTWJMukMYGLCCJm
	 HQ58qpQ9q7xR1KdoyN1uqVv2wOK+jbPfFSY+ch6zVwAdaQphkHJOSmS53SJktzwHUN
	 sZbuq3I/qzAi5wv1j3UzL9Sad8McscyG7xmsMcvscLNx/3N+/HCoH3zeaClTDvZCaU
	 gdLWDVMUr3nAezvABL3JI8vCGCVRC0L7fg83TOH27lC+A+nlLwZPCnzijnI7B13kDQ
	 wd7KvUrQH8i8d975qouHQBbAP4+rewzpyrAx2oeQN/Nw/WJcNVo+taWcquiCGVa2vg
	 aGW4ukAxaC87Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrALMWRWlGSWpSXmKPExsViZ8ORpPvvTkK
  Kwe2TMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bdo+IFM7kqZpxdx9rAuJezi5GLQ0hgI6PE
  8tPPWLoYOYGcaUwSZ9bHgdhsAhIS0/eeZAexRQR0JT5+mMsIYjMLqEjMmHyECcQWFgiQuH3+G
  FicRUBV4t/T9cwgNq+Ak8S1I3vAeiUEFCSmPHwPFucUcJa4c6uTGWKXk8Tt5d+YIWrUJK6e28
  Q8gZFnASPDKkaz4tSistQiXXO9pKLM9IyS3MTMHL3EKt1EvdRS3bz8opIMXUO9xPJivdTiYr3
  iytzknBS9vNSSTYzAgEgpTvXcwdi266/eIUZJDiYlUd5rJXEpQnxJ+SmVGYnFGfFFpTmpxYcY
  ZTg4lCR4dW4mpAgJFqWmp1akZeYAgxMmLcHBoyTCG3cVKM1bXJCYW5yZDpE6xagoJc6rDgxpI
  QGQREZpHlwbLCIuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm5bkBNIUnM68EbvoroMVMQI
  tv7YkHWVySiJCSamASebpun4XTi0zXZ+UWshbqC87dfn/+1PJ1/74vzr8ndvqCXsvRUCHmjxv
  uPdDM/it2P/Sv8RGVqImSrGdX/DQ46c32hsO9707grm9+PAqT/8sJb2F2b3t5KcqCITl56nQT
  iUVPuj2UI+1Tqw0O/GlLfGxhtujlWq4VvddPhG/d2vxnuu26dPPnk+/uOPBP7e9UBfbnq/8w7
  5tZxM0zUa1arOhLe+097bcZvavWCDSbZPxcp8vLynVLTzL4+GmhldEf8n1u70rYUrPu27F7Fk
  Vhi2MUvPaYSJTFXDdVveHDNKtmzmnHP5G8P9zeSJ+okfYJtVCpnrx4vrZQ2bqrwgfY/r0se/W
  w/nWZ6c6YfbUuSizFGYmGWsxFxYkAM94DwwMDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1684069630!247678!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28863 invoked from network); 14 May 2023 13:07:10 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 May 2023 13:07:10 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id E32C01AE;
	Sun, 14 May 2023 14:07:09 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 1606A1AC;
	Sun, 14 May 2023 14:07:08 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 2.0.12 -> 2.0.13
Date: Sun, 14 May 2023 21:06:54 +0800
Message-Id: <1684069617-12375-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
References: <1684069617-12375-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 13:07:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102582

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_2.0.12.bb => python3-sqlalchemy_2.0.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.12.bb => python3-sqlalchemy_2.0.13.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.12.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.13.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.12.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.13.bb
index 0b221c7e9d..3963f066c3 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.12.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.13.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "bddfc5bd1dee5db0fddc9dab26f800c283f3243e7281bbf107200fed30125f9c"
+SRC_URI[sha256sum] = "8d97b37b4e60073c38bcf94e289e3be09ef9be870de88d163f16e08f2b9ded1a"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


