Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00FCC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 09:06:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web11.36415.1640682397762677989
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 01:06:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=K+lsKyOo;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640682395; i=@fujitsu.com;
	bh=zVZ8CrbGo9CJE40ehZJ7Hc7xBXWugboVM2Preb3h5Hg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=K+lsKyOowSZDePP2NWKlnqNjdEgSsuFsQWDIeHhO/FtLucp40dYJlmvpa/pKggtMV
	 Og1MsVPGY/+j9HFN7Yh+fnsncQegxEXznJYYZZhiaYXzznMzNjmK/PpkMIBSunTC0x
	 eRT6M7NGDrWTL5eXHk2263NjB66PcunDrzKh+Qt9htUoLpZg6uF04jK27S+kKuUSLb
	 4VPROaHuoON2sWogevPTBPojRAQEZ2I4IxX37/fSzCWn0fDlYNaw1L7OhPNBgG3a9Z
	 kzDAdzqmyLDe6zP8hTZ+iDXCBBb2dNARnQlx/F+nUbGy0CgRQmvAbqFgcNUOfWgNek
	 Drkk7uWiI+AZg==
Received: from [100.115.4.164] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 51/A3-13695-B93DAC16;
 Tue, 28 Dec 2021 09:06:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MxRXf25VO
  JBvPfM1pcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBmPbkxkKWjlrJjWvZWxgXEFRxcjJ4eQwEwm
  idabOl2MXED2SUaJ39+PM4Mk2ATUJR7ffM0IYosI6Essnb0HLM4soCrRfXENO4gtLBAu0f3yA
  5jNAhT/OWUlC4jNK+Au8XrlLrBeCQEFiSkP34P1cgp4SDxZ/Y0RYrG7xOZZh9gg6gUlTs58wg
  IxX0Li4IsXzBC9ShInVnxkgrArJF4fvsQ8gZF/FpKWWUhaFjAyrWK0SirKTM8oyU3MzNE1NDD
  QNTQ01TUBsgz1Eqt0E/VSS3XLU4tLdIHc8mK91OJiveLK3OScFL281JJNjMCQTClmSd3B2Nf3
  U+8QoyQHk5Iob/H+U4lCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgvngfKCRalpqdWpGXmAOMDJ
  i3BwaMkwtt7CSjNW1yQmFucmQ6ROsWoKCXOKwOSEABJZJTmwbXBYvISo6yUMC8jAwODEE9Bal
  FuZgmq/CtGcQ5GJWHeiSBTeDLzSuCmvwJazAS0eKbDcZDFJYkIKakGJp71kouSUxTE5VYViL+
  YuUahVcLSfE3of2ZHhndXf6v2XWnfqJF1f80DxRlPJXYGTXFe+dP+JNedBU57mQ/Pj/pyYJb6
  ky83m+e8OPE/oUdAOXiKk6vgD+ffb3pv7k+SM1nr8KnfvKJQh8NB3V1+od+Mz1E1LQucyh/lH
  rPfqPVcqHlipItZb0g+r4B0hux+3VLXjkMCBrNPKHuv/S0u8dJ+8kWH0nWnrt3+tai2+MO7I4
  fOlZ19qmTL+ufXRKaSb43c/Wuz/v5J+7Bh07bpnnl5C9ussu/vZb3/ne9L2WLTN6vTz3d5Gjw
  s1lNk2/i6ntXsZHL6FGeeRlFFnswDnQfCtTJUvnxrOadQkOawQ4mlOCPRUIu5qDgRADptV6BE
  AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1640682394!407408!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22668 invoked from network); 28 Dec 2021 09:06:35 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Dec 2021 09:06:35 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BS96SDD026910
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 09:06:34 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 28 Dec 2021 09:06:28 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/2] [oe] [meta-python] [PATCH] python3-smpplib: upgrade 2.2.0
 -> 2.2.1
Date: Tue, 28 Dec 2021 17:05:15 +0800
Message-ID: <1640682315-13256-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1640682315-13256-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1640682315-13256-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 09:06:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94547

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-smpplib_2.2.0.bb => python3-smpplib_2.2.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smpplib_2.2.0.bb => python3-smpplib_2.2.1.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb b/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
index 00a4939147..7401e039bf 100644
--- a/meta-python/recipes-devtools/python/python3-smpplib_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smpplib_2.2.1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv3.0"
 LIC_FILES_CHKSUM = "file://README.md;md5=8b4e2ac8cf248f7b991784f88b630852"
 
 PYPI_PACKAGE = "smpplib"
-SRC_URI[sha256sum] = "3d513178a35573f66faac4ef2127c4bd73307ddb463d145b17b013cf709d9ddd"
+SRC_URI[sha256sum] = "c0b01947b47e404f42ccb59e906b6e4eb507963c971d59b44350db0f29c76166"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


