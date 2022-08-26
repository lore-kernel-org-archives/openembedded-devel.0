Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08099ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 03:02:13 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.32830.1661482925246891631
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 20:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Ztp9H9Xq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482923; i=@fujitsu.com;
	bh=DqYLR1bl1E0idJyEjnktKpwy09ycYSv3EbSmCs1ZiQg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Ztp9H9Xqh07otMq/3B18Ik8cwItOToCIFPmPgqBMzALfPbpdgayFtOfq5cCFc0CFJ
	 NtkXzl/fC7aNADYKMxM2VIQjO31eRwjU1x9XsWPislKdp9JspnV8kux9OL5j01iU74
	 yFAZDah+g/lmhJqn21/RMRP6hQam2/f7B2heIkv9rPOEBWmi9Hh5IOkeKayBNiTRzI
	 W+qrhN5zwaCygv2noe4xroycfnDX5xjxAMQwIE6LJnuIRA6e10gtYGvrcQNGOrsteU
	 4jvcXSSU85s9vLvXY+NKfiPUnauSWTot/n2SNxSQcMZzXr3Er4jKfRey89DFf9H77K
	 he5tENigieYfg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGIsWRWlGSWpSXmKPExsViZ8ORpLvanCP
  ZYM90DouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePQujmsBQ2cFS8+PWVpYFzH0cXIxSEk8JBR
  YsaWLvYuRk4g5yqTxPFOVojEXkaJBQ2PWUASbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA
  9YsLOAnsX39LrB6FgFViUOvIOK8Ak4SO1e/ZAKxJQQUJKY8fA/WyyngLDH1/mYmiMVOElNv3m
  aBqBeUODnzCQvEfAmJgy9eMEP0KkrMvtzMAmFXSuyZ1Q81U03i6rlNzBMYBWchaZ+FpH0BI9M
  qRqukosz0jJLcxMwcXUMDA11DQ1NdU10jU1O9xCrdRL3UUt3y1OISXUO9xPJivdTiYr3iytzk
  nBS9vNSSTYzAIE4pZv2/g7G776feIUZJDiYlUV79Z+zJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4l
  CR41Uw4koUEi1LTUyvSMnOAEQWTluDgURLhlRYFSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy
  9VSpzX0wyoSACkKKM0D24ELLovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmlQKZwpOZVwK
  36RXQEUxAR0htYAc5oiQRISXVwKRyN+fTo8KX3JdPfjbq91VZYpbnnRE898JcxV+uH5Men5Zb
  0VDz4l7r9Ce/WzqTK5wcPhjsan2mvv3wgvbar5c9Y58k1x1acOjULN7CD1teG/kxf4lwXM5S/
  tF+859vTTr7Vu+xXXftTtb6ef/PeDAFb/m2SnRB3cPqDfJ3nGtnbbf2dny11yZFaamZwOeIhf
  ln9jPEqPB02xgIxAks1GfnWdpau6D40HVXBs+sDs5XZUvFBSenzncyLFHysDxe6Ny1l3su7yL
  vjCMpbAuL3lidujlb8EXb586m94/PuMsc9etP/5rGGNt+rmMnU660/5uQwAtWj+/dYHM7U+/Z
  t/dgR3Qs64TmTMsthSsWWiuxFGckGmoxFxUnAgDtwJDHaQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-2.tower-587.messagelabs.com!1661482922!175637!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8569 invoked from network); 26 Aug 2022 03:02:03 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-2.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 03:02:03 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id BC0661AC
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:02:02 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B040F1AB
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 04:02:02 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 04:02:01 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pythonping: upgrade 1.1.2 -> 1.1.3
Date: Fri, 26 Aug 2022 11:01:48 +0800
Message-ID: <1661482908-10720-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661482908-10720-1-git-send-email-wangmy@fujitsu.com>
References: <1661482908-10720-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 03:02:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98462

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pythonping_1.1.2.bb => python3-pythonping_1.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pythonping_1.1.2.bb => python3-pythonping_1.1.3.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-pythonping_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-pythonping_1.1.2.bb
rename to meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb
index 3fce07b43d..5e016fb928 100644
--- a/meta-python/recipes-devtools/python/python3-pythonping_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pythonping_1.1.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://setup.py;beginline=12;endline=12;md5=2d33c00f47720c7e35e1fdb4b9fab027"
 
-SRC_URI[sha256sum] = "7f783688268334fbfdec31b3a3b105a347844bd621de48d63f38e6ecfaf14af2"
+SRC_URI[sha256sum] = "3555a03439eb48d5e0e8c201f7c334c1e13b997d744f93453d4d601c0fc8330f"
 
 inherit pypi setuptools3
 
-- 
2.25.1


