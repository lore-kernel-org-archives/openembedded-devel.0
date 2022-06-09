Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37EF3CCA47D
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 07:57:51 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web10.7946.1654761461989709232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jun 2022 00:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KVsdTpZ6;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654761459; i=@fujitsu.com;
	bh=saVSycvgMh07tmrpxmabbXmKz1l4vxOd3CtsItEoM3k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KVsdTpZ6LMLLkZsV5w28xnj7sLLtlfmKZtUE55cAwjUxO/5zrx4W5RTZkOKz+CltV
	 SjsTJdmL7A8v4YueNcL+UjqHhtdPfwWikw7sGATl0lnqkSh8Jw2BybCi38yH2ns7JG
	 GojnNEx0LfxJ4Lr5Hy48pHwqhIxxfcuCPGklqF7K4j0mqkiyM9t+o71VXSHV3zLYci
	 PueujRBwHxEkSm+FrAUfhcFSvu1q447nGvf3NIb91QJYUhJz6HIMV7GucrNTIzxzkZ
	 KEuOLL+ZnIq1LEA+uVj3YYABcFeYl51FNSH1DZcbX2cL8Srq8q97dk0/Inn71dMTJB
	 kLf+waw57QE1Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrDIsWRWlGSWpSXmKPExsViZ8OxWffz8oV
  JBtO+iVpcPLyU2YHR49zGFYwBjFGsmXlJ+RUJrBnPGlYxFzzmrDi7Xa+BsZezi5GLQ0jgIaPE
  wx0/GSGcs0wSM2/fgnJ2M0r0HLvC1MXIycEmoCYx/dYNVhBbREBfYunsPcwgNrOAisSL3z3sI
  LawQIDEq+6TLF2MHBwsQPHj/8HKeQWcJBacv84GYksIKEhMefgerJVTwFni5NlpYK1CQDWbJh
  1ghKgXlDg58wkLxHgJiYMvXjBD9CpKzL7czAJhV0jMmLENaqaaxNVzm5gnMArOQtI+C0n7Aka
  mVYzWSUWZ6RkluYmZObqGBga6hoamupZmuoZmeolVuol6qaW6eflFJRm6hnqJ5cV6qcXFesWV
  uck5KXp5qSWbGIFBnFKcILCDce++X3qHGCU5mJREeU8uXJgkxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYJ35hKgnGBRanpqRVpmDjCiYNISHDxKIry2y4DSvMUFibnFmekQqVOMxhwzv7YdYObYtK
  /rALMQS15+XqqUOG8KSKkASGlGaR7cIFikX2KUlRLmZWRgYBDiKUgtys0sQZV/xSjOwagkzDs
  dZApPZl4J3L5XQKcwAZ3y68oCkFNKEhFSUg1MChk60ixfppqaFswPUHv4p/S3teWL11NST5w4
  1ChUu1FgiZrM9Fj3uFtra7/9C/aMfDsjevuZfucF99/+WzZz0d6DB573f9mVwPXW71TrusAyb
  7fUhUprF0sKHVjQnLv0yee41Xqr5++KfWV82b2OP2TWA1Z95omdJtFLz/+8vyEj9hVTSs7/Hw
  HsifFnz+ZefnQg6eAElhu7NK8I//2RcMEz+ORX9+Swh8a6rRE9r3XnfEtQeP/68m+ppYbN/q+
  5jxzRmLMjQHL3fL4VazOSp3JeNr/+sMFs86GwPbOkvcvql6y52f9WXfe6t3C4d9H9SC11mYp9
  eos2ve8t3TEnIj1a57xG2/+qq9e8Dr0qCVZiKc5INNRiLipOBABlPfQvbwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-745.messagelabs.com!1654761458!206905!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24238 invoked from network); 9 Jun 2022 07:57:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-5.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Jun 2022 07:57:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id A8A7F8AC
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:57:38 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 88D33816
	for <openembedded-devel@lists.openembedded.org>;
 Thu,  9 Jun 2022 08:57:38 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 9 Jun 2022 08:57:22 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 1.4.36 ->
 1.4.37
Date: Thu, 9 Jun 2022 15:57:00 +0800
Message-ID: <1654761421-29641-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1654761421-29641-1-git-send-email-wangmy@fujitsu.com>
References: <1654761421-29641-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jun 2022 07:57:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97459

Changelog:https://github.com/sqlalchemy/sqlalchemy/releases/tag/rel_1_4_37

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sqlalchemy_1.4.36.bb => python3-sqlalchemy_1.4.37.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_1.4.36.bb => python3-sqlalchemy_1.4.37.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.36.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.37.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.36.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.37.bb
index b20c6c8ba..9e50a8ee7 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.36.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_1.4.37.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f4001d1ca15b69d096fa1b4fd1bdce79"
 
-SRC_URI[sha256sum] = "64678ac321d64a45901ef2e24725ec5e783f1f4a588305e196431447e7ace243"
+SRC_URI[sha256sum] = "3688f92c62db6c5df268e2264891078f17ecb91e3141b400f2e28d0f75796dea"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.25.1


