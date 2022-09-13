Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A21C6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 10:19:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.2969.1663064388986059792
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 03:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=l20prhWk;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1663064387; i=@fujitsu.com;
	bh=mgvSDFKcCl0MBUpe2cg8MxQ1N0Zw9+SkWQC2smN/XD0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=l20prhWkdfIojR3iR46vlFJL79AL0Rkqh7gWpyqeMn6JpUSISgcDPrT/i1wOCnRrp
	 uOBXiWFDCkJqgmy+9TuNJR7ttY1SipeUAyrzse3Z3HrN4ajgaDK5wx3eBFzVk9b4IZ
	 jQDUU9/ckNPkEHTsZW3mudNPeOL2/MOMgvq5mGwn4c3BAVV2H4yuKneu63qZGS604O
	 +oLHmXfQJSlkqAnqwomaI4BD00FbO8pwlDcL4/WAtro2UeLcJWcz1/tb+PXV6VS+LA
	 lLgvqbmgmmIYiTsCqtCT+b5HD/XUqBw1xGvgryuoXqJKEVUjI6NLXam/K43wkMKtJ8
	 X3e0hQJrNv9aQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpOsUqZB
  scPmGscXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrHrenzBNK6KtUfSGhhXcHYxcnEICTxklHjW
  sYoZwrnCJDGpYyUThLOHUeLt3tksXYycHGwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43cMOY
  gsL+EvMPf0arIZFQFWie9I+JhCbV8BR4vTkNWBzJAQUJKY8fA/Uy8HBKeAk8aXTHiQsBFTyfe
  ZbFohyQYmTM5+wQIyXkDj44gUzRKuixOzLzVBjKiQapx9igrDVJK6e28Q8gVFwFpL2WUjaFzA
  yrWK0TSrKTM8oyU3MzNE1NDDQNTQ0BdLGuoYm5nqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrF
  lbnJOSl6eaklmxiBYZxSnD55B+Olfb/0DjFKcjApifJGeikkC/El5adUZiQWZ8QXleakFh9il
  OHgUJLgjQ8BygkWpaanVqRl5gBjCiYtwcGjJMLLEwyU5i0uSMwtzkyHSJ1i1OWY+bXtALMQS1
  5+XqqUOO9Mb6AiAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXIgxoCk9
  mXgncpldARzABHWFkLQ9yREkiQkqqgSnv9ck/Mxx/SMbblLhY1Cbck2oPdv45YYLVnBTV04LT
  BbSFAnfFLFjyKiHEV6L8Ie/Rbaq7BH5a6f/JEdW64rXzxjWmjJev+Nc3S11MjZ7D5h9isElCc
  8/axza+LxNjinmYLXkqGrccP7ow6LODIJv3q5W6y2puWEYsk/URTP7/fZPH7v1hmzuzswXVig
  u+Tp9vwOyz5HvUScvjnN9sU9T+WDw27t2aEW3Yw+MUumJ+UVUcc/Pyl1Oux7kk3k36yXNrmvR
  uMSPnC0l12ftWlvwKeXVd+eaZwNyFTJZ/6xd5TRTfNqF4T93UFaUVLos1pqX+uxCSlDJPIfzY
  3ZTEVqUHXJkVaj6BEy+fvid0XomlOCPRUIu5qDgRALEiColqAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-745.messagelabs.com!1663064386!89788!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25957 invoked from network); 13 Sep 2022 10:19:46 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Sep 2022 10:19:46 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 468DB1B2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:46 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 3B9FA1AC
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Sep 2022 11:19:46 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 13 Sep 2022 11:19:44 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-langtable: upgrade 0.0.58 ->
 0.0.59
Date: Tue, 13 Sep 2022 18:19:02 +0800
Message-ID: <1663064344-3276-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
References: <1663064344-3276-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Sep 2022 10:19:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98779

Changelog:
==========
* Add ibus/m17n:ar:kbd as input method for Arabic and fix iso639-1 code for Arabic
* Get translation changes from CLDR
* Add more translations from CLDR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.58.bb => python3-langtable_0.0.59.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.58.bb => python3-langtable_0.0.59.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.58.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.59.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.58.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.59.bb
index 025ceb6811..23f13fc96d 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.58.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.59.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "47128c06008acedee1745f2d56151461d94526b2be95a4124692013af35496b6"
+SRC_URI[sha256sum] = "0e9cec4dfadb4debf387ea695fe2bf7be4af1cbb3f030d5d04bf6a254ad13751"
 
 inherit pypi setuptools3 python3native
 
-- 
2.25.1


