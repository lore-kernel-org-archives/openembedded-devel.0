Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.24651.1629941627360568590
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 18:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=er5ISahf;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629941625; i=@fujitsu.com;
	bh=bd5tsfJvj2YcQgUKFmfmclRgTyHFi7AEvtiQlXyulfc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=er5ISahfiuMlSngThzl+zk814TSJGqQfhJX4pfd2kFdTwSKcBozWOuBIc4BsfEPIv
	 ieCIl9W1eI5XBZlFhydKzJgw+bg+h7dEbslKXZW0QNmUHG/+MN5vTc9w2HHD6FikFB
	 eBU3Winjsk6kBA2NsOeHRea0+eko7yU943yW/jZzJjemBS5rqOHxQUtmh6qlKSkw0v
	 533nkspjLo6ryJEK2jMkUYhy5ycMQi4xWpoaGxxJhQANfmCrPlthLnBaLNiZgLPAej
	 2LU+A8Skb0Efmsb5/zowiCgm0Iju6ZYImzrQa0V4DAJVMTwRYByeNG/Pn4M+RCbbzQ
	 qZEJAjeXDRwcg==
Received: from [100.113.3.182] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 24/0A-27444-87FE6216; Thu, 26 Aug 2021 01:33:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxVbfivVq
  iwYYFMhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b/1k9MBSc4K279f8PSwPiEo4uRi0NIYDaT
  xOy5kxghnBOMEl8mrGbuYuTkYBNQk5h+6wYriC0ioC+xdPYesDizgIrEi9897CC2sICrxLOj+
  8HiLAKqEi8a9oDFeQWcJN4smQgWlxBQkJjy8D0zRFxQ4uTMJywQcyQkDr54AVWjKDH7cjMLhF
  0hMWtWG9MERt5ZSFpmIWlZwMi0itEyqSgzPaMkNzEzR9fQwEDX0NBY11jX0NJEL7FKN1EvtVQ
  3OTWvpCgRKKuXWF6sV1yZm5yTopeXWrKJERhiKYXMh3YwPnn9Qe8QoyQHk5Io7/yDaolCfEn5
  KZUZicUZ8UWlOanFhxhlODiUJHi/vQbKCRalpqdWpGXmAMMdJi3BwaMkwjvjLVCat7ggMbc4M
  x0idYpRl+PLqiWLmIVY8vLzUqXEebeDFAmAFGWU5sGNgMXeJUZZKWFeRgYGBiGegtSi3MwSVP
  lXjOIcjErCvEtApvBk5pXAbXoFdAQT0BEFfKogR5QkIqSkGpiEN02KY7fjXaAc8Gu/Xp6JRQV
  flsypj//ZGJbcMd0xKfv7mevXvnuaVBwonfPHbsrCe+9P3lv89Ma7sxOsPs9b9nTrmh/Tn5+8
  ur7b82L7/k07LHuydhSvddjP/sG6KV/96jY7p8JffgzvGEPXJ0W3OXf33N2l82POwm8zv+1fL
  nNYsHPjUivmT8zmZ2X+2Prcigp7ySZj9exXgfThIxGsMx9+u9j4ry8s7EZwevrCptrQWv+YXb
  8aWR/Ma2zWSPoj0PfyG5d6pFZecMbhRK87a1/Oepp8z03q4jyDw/WnJJ9Pv/T0Bc/cy5G3PdX
  33d0dPvN4JcO/kCav8nTTrfNEui2ulpuYbZ7154GwV940MyWW4oxEQy3mouJEANBy6KY4AwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-228.messagelabs.com!1629941624!192934!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25284 invoked from network); 26 Aug 2021 01:33:44 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-3.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Aug 2021 01:33:44 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17Q1XZix018832
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 02:33:44 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 26 Aug 2021 02:33:33 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] live555: upgrade 20210809 -> 20210824
Date: Thu, 26 Aug 2021 09:33:13 +0800
Message-ID: <1629941597-62033-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../live555/{live555_20210809.bb => live555_20210824.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210809.bb => live555_20210824.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210809.bb b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210809.bb
rename to meta-oe/recipes-multimedia/live555/live555_20210824.bb
index b6a7d9488c..deacab2ac0 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210809.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210824.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "31ce35f13d676033da3fafdb67c6f26e9717438112230743a107dd3a67ebe285"
+SRC_URI[sha256sum] = "ce95a1c79f6d18e959f9dc129b8529b711c60e76754acc285e60946303b923ec"
 
 S = "${WORKDIR}/live"
 
-- 
2.25.1

