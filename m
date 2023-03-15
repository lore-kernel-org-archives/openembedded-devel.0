Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941E3C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 14:07:40 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.8962.1678889256444537561
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 07:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IBBdTHrH;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678889259; i=@fujitsu.com;
	bh=ZEJxziBAIH0aKBOfyyymsx20KFAhAS4nxRMO0AY3I/c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IBBdTHrHHNLEFfZtV0SSe5n4CpHlWiuWesN1L8BHu69QcWFoO927SBhY8BX3kC0xd
	 CGbe6uVFCyb2dHQgMq26NnugHYeexF4y8CCBzta1tKKN8I5EV4EJxYUpBgHcecCAES
	 uReVj/4lqNuHMaNcIRz43iRGiIkrwXIAhkceJtOBR1bRg6EZ9Vucxc1fwxFi1fT5pW
	 zuJg50PnzJ9/GsGjy3FE+gsck3rbNpaOWnw58rollXvTGsT6tODdbwlhEI0D6TbcsS
	 fnvVRB5+XOgWAmKdjcff8u56cVlSI2rJcuokPG4UGMGXwwhjBZLElKqx2MwFnOQcMm
	 z8prx6kipCGYw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSVfromC
  KQeMDZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPy2bNsBQsEKrZdOs/WwLiSr4uRi0NI4Amj
  xOPLi1khnOtMEm+mvWOCcPYwSrzcfwHI4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8e9
  i5GDg5hAW+JxnnsIGEWAVWJv6fvsYLYvAJOEp+777KA2BICChJTHr5nBinnFHCWaLhmDRIWAi
  q5fLeBHaJcUOLkzCcsENMlJA6+eMEM0aooMftyM9SYConG6YeYIGw1iavnNjFPYBSchaR9FpL
  2BYxMqxjNilOLylKLdA0t9ZKKMtMzSnITM3P0Eqt0E/VSS3XLU4tLdI30EsuL9VKLi/WKK3OT
  c1L08lJLNjECQzelWGndDsYlfX/1DjFKcjApifL+WSOQIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ
  0mC998ZwRQhwaLU9NSKtMwcYBzBpCU4eJREeFPPA6V5iwsSc4sz0yFSpxgVpcR5/4IkBEASGa
  V5cG2w2L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZh3Gch2nsy8Erjpr4AWMwEt5p0nALK
  4JBEhJdXAJP7i2cvXPpuetWqzl1fGX5pxMj/jwtO9/wIElnBJvyresWPx47L0F4J8i583WbVt
  svA3ZNlrdsxA4VHkWnaVjzrcKst3VeSsfObr/ODa25aHLRc7pD79Zs+NXK+/Wr3kQf6GNLt+p
  hIfz8TLLSkXevv72+c//uipIpWh+dMvz0663WPN5lMZeza9KdyXdzT+Xv2SsuWvj6y0367s7L
  gwa9cZljknZR83cHZZ7+KR+vLiYDtjzWmekqp1+uZVffsYz1WXrVmw8Pa0fvG+KxzGiQ8P2by
  5JZ92aVEEu/2qdZU31TOjIhzisuqPnvNN+iyrIKB84u+iH4LTlv0+UdeQVbauUWiOvdL2VBvd
  Uk5mJZbijERDLeai4kQAaGZVgVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1678889258!116943!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24197 invoked from network); 15 Mar 2023 14:07:38 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Mar 2023 14:07:38 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 4C6201000D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:38 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 3FC6E1000C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 15 Mar 2023 14:07:36 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-portion: upgrade 2.3.1 -> 2.4.0
Date: Wed, 15 Mar 2023 22:07:16 +0800
Message-ID: <1678889238-20738-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
References: <1678889238-20738-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 14:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101550

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Added
------
 An AbstractDiscreteInterval class to ease the creation of specialized discrete intervals (experimental).
 A create_api function to generate an API similar to the one of portion but configured to use a given subclass of Interval (experimental, see Specialize & customize intervals).

Changed
-------
 Speed up repr and to_string for Interval instances (see #76, adm271828).
 Some internal changes to ease subclassing:
     from_string and from_data accepts a klass parameter to specify which class should be used to create Interval instances (default is Interval).
     Add a klass parameter for open, closed, openclosed, closedopen, singleton and empty (default is Interval).
     Add a _klass class attribute in IntervalDict to specify how to create Interval instances (default is Interval).
     IntervalDict uses self.__class__ to preserve subclasses when creating new instances.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-portion_2.3.1.bb => python3-portion_2.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.3.1.bb => python3-portion_2.4.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.3.1.bb b/meta-python/recipes-devtools/python/python3-portion_2.4.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-portion_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.4.0.bb
index d998db01d..942f1204c 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.4.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "247471718131d41fb82137ab7b6466cdf4b785d047e38d309ebf34c84101a3a6"
+SRC_URI[sha256sum] = "deb16389e844dbf9aeb654261fce5febd720e4786c6690efbb9dc11608226840"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-sortedcontainers \
-- 
2.34.1


