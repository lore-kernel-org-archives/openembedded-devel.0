Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D10BC4708D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:36:55 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.152376.1672123012263639205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:36:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=N81CwCd7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123012; i=@fujitsu.com;
	bh=fkzvcNx8Dt8ob45U0orZlBu2pjUsaL25YZJsNlhdBAI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=N81CwCd7xd+pyQ5k2YzxFkOvdqyM60pmc4RIdF/yhgHT2SjtmInzdsorpklOJmlgO
	 cOxIJdM5VgVaH3y8rcvOfiWRJ4I9fZ0Xk64G+7uglMktIq1hGJirq8ggiPCrTugWhF
	 c+l9pcZM24aK8M2dod7xb49+OGH1oWEiZHDvlwDjx0rGSa9Z4X+EC0E/k1vDPkejVp
	 9c6j1vxoEqZY4wfLQX+/9E/ZXsi1kZL3s1iCe64VTsfIVwEYjD0sQ3MCMGdgBcQsj/
	 13KorYQ2RI5tTKgHJn8c6RxTeoZFWCh429we8hnY6hQCuiXv5jiqh/2dt/aebOeIbn
	 qa+CfyL+502Fg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRWlGSWpSXmKPExsViZ8MxSbdl0qp
  kg7nbmC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxr1z6zFpzlqdjc84K9gXECdxcjF4eQwBNG
  iQdtPxi7GDmBnOtMErfe6UIk9jBK/PtzhRUkwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAo8TGOwtYuhg5OFgEVCW+3dcBCfMKOEl0zdkAViIhoCAx5eF7sFZOAWeJlS//MIOUCw
  HVrF+SAVEuKHFy5hMWiOkSEgdfvGCGaFWUmH25mQXCrpCYNauNCcJWk7h6bhPzBEbBWUjaZyF
  pX8DItIrRrDi1qCy1SNfQSC+pKDM9oyQ3MTNHL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHBTitmTdzD+X/ZH7xCjJAeTkiivVPeqZCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvJdBcoJFqempFWmZOcAogklLcPAoiUC08hYXJOYWZ6ZDpE4x6nJ8/HNxL7MQS15+XqqUOG
  /nRKAiAZCijNI8uBGwiL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXHWQVT2ZeCdymV0B
  HMAEd8eHQSpAjShIRUlINTEovp00tbbOIyON61OXaK6KkWvYgVXDxO+f6Gbcv/nvKdLV7bvGM
  V+HpzJsnHOJYE8c++U+S14TmBydUCu9f3rquZu72LkX/eIHTF3IeBZUvDxDbv/TJros/PB+/u
  bPT+8Itb4E8q3LOuRdKde/oqtqbFqyeVvb7SnpGc8Ka+X8b3t0onx4U8XuRiK+9dmF56vGtze
  /6I7wt4hUOndp2zfirfpEY25O5u9TslrD9cZh/W+3B7Zz8NVnPvt554rl47/2yrXF63idkXVQ
  EJjIoNe/YpF1uwx8dZcuTr1O0YtW2W7eSdGW7+WZMexirs/OK4h65px7TA33c16ZHOTzsmb9P
  /a7h1OWbSid/m+1nb6HEUpyRaKjFXFScCABi0XHJYwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-587.messagelabs.com!1672123011!180819!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31289 invoked from network); 27 Dec 2022 06:36:52 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-19.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:36:52 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A74BC1000D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:51 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9AA5E1000C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:51 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:36:49 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] memtester: upgrade 4.5.1 -> 4.6.0
Date: Tue, 27 Dec 2022 14:36:06 +0800
Message-ID: <1672122966-31746-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
References: <1672122966-31746-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100259

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
  -fix warning on signedness of the ONE constant.
  -add note to conf-cc about how to silence gcc's incorrect warning
  "suggest parentheses around assignment".
  -fix overflow in output for reported address.
  -add note about randomizing values used at runtime by seeding PRNG.
  Disabled by default for reproducibility.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../memtester/{memtester_4.5.1.bb => memtester_4.6.0.bb}       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/memtester/{memtester_4.5.1.bb => memtester_4.6.0.bb} (82%)

diff --git a/meta-oe/recipes-benchmark/memtester/memtester_4.5.1.bb b/meta-oe/recipes-benchmark/memtester/memtester_4.6.0.bb
similarity index 82%
rename from meta-oe/recipes-benchmark/memtester/memtester_4.5.1.bb
rename to meta-oe/recipes-benchmark/memtester/memtester_4.6.0.bb
index 9df450cba..42cee1108 100644
--- a/meta-oe/recipes-benchmark/memtester/memtester_4.5.1.bb
+++ b/meta-oe/recipes-benchmark/memtester/memtester_4.6.0.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz \
            file://Makefile.patch \
            "
-SRC_URI[md5sum] = "1bc22c01e987d6a67fac39dc5656a4d3"
-SRC_URI[sha256sum] = "1c5fc2382576c084b314cfd334d127a66c20bd63892cac9f445bc1d8b4ca5a47"
+SRC_URI[sha256sum] = "c9fe4eb7e80c8cef5202f9065c4c0682f5616647c0455e916a5700f98e3dbb2e"
 
 do_compile () {
     echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
-- 
2.25.1


