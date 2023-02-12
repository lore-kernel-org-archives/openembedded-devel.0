Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4C7C636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 09:07:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.7821.1676192867266799002
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 01:07:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=k9N45tZF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676192865; i=@fujitsu.com;
	bh=ABrWNIfzNN/g9kJjF2apa5js3hWJMzrYUxxx6LKE8r0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=k9N45tZFms/4FryQ336uZTK8VnpAX2dLoSB9CAXMeDn8Qht8MRpYtLNVeGcUBk9xZ
	 H0qinYOVJdKfardKNAg6MeHD9iYcR/1tBMXG5xcc0o8Od7yzFCpshJjObZoGsUy6AA
	 OLLlxgLb1xvciInu29cZcs9cqam3CdatxSpo/NVgbgM7oz/9MZEzdLgOcJRRjiYam2
	 RhqIRyEPK8CFTBygPHskAwZ9PKcS3e0bjL82oN4BbqOvf7IwmAOcioB7EGnzOQ1mqH
	 3O2/1ducd6JzlR2s5CccPEhDVPYjiH+V8VDUN/uvK2zfMHx2eDdfuSr29IdTrJrHJ+
	 N1NwvdfcbRHBQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpJuw5kW
  ywdJ5+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bfsxa2goVcFX/v3WNpYNzJ2cXIxSEk8JBR
  4u2TE6wQzhUmifnPbzNDOHsZJTbM3wGU4eRgE5CSuHH/PxuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWCBAYuay52BxFgFVie7F28BsXgEnifa/h8BqJAQUJKY8fA8W5xRwljh34RRjFyMH0DInia
  XNchDlghInZz5hgRgvIXHwxQtmiFZFidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYx
  MqxjNilOLylKLdE31kooy0zNKchMzc/QSq3QT9VJLdfPyi0oydA31EsuL9VKLi/WKK3OTc1L0
  8lJLNjECgzelOJlhB2Nn31+9Q4ySHExKorzLNj9NFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBy
  7L6RbKQYFFqempFWmYOMJJg0hIcPEoivFULgNK8xQWJucWZ6RCpU4yKUuK85iB9AiCJjNI8uD
  ZY9F5ilJUS5mVkYGAQ4ilILcrNLEGVf8UozsGoJMx7dBXQFJ7MvBK46a+AFjMBLWaQegqyuCQ
  RISXVwMS7ZFHmMvaYX1bJm3MkljmJ6aj2WOUpzHnELPbSv3XXu+mhTisMFO4cKQyZNcmmWMzs
  hkKaBsO9Rfev6W49c4DTTCNI0ZRZLvVYPUOY11qzqLmTTjwtZzsebKbudjLRadf5s7Hm7ukrN
  hY+jTtde2BT5WeXT1OsCzL/3pirF7KOJX3H3sum/Hd1/XXeGnl+WydSyOt1KlDlfsDe2TM2q0
  71UY5jF9t8hFkpeqcuu5LeqmO9wdf0BZbExDZuZkw+LHF6e0W80KsrvHEF17UaWD6qf5mXmbg
  7XfPw6amLdsYluqz1NX7MJblb1oi7/LbUq6unNqZ1KNm6nJb0W1AcY151jyfOVf/K6jpBz7zl
  SizFGYmGWsxFxYkANcSHxVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-732.messagelabs.com!1676192864!699493!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19338 invoked from network); 12 Feb 2023 09:07:44 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 09:07:44 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 3E1681B4
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:44 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 327A47B
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 09:07:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-simplejson: upgrade 3.18.1 -> 3.18.3
Date: Sun, 12 Feb 2023 17:07:19 +0800
Message-ID: <1676192839-13378-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676192839-13378-1-git-send-email-wangmy@fujitsu.com>
References: <1676192839-13378-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101047

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix regression in sdist archive
* Distribute a pure python wheel for Pyodide

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-simplejson_3.18.1.bb => python3-simplejson_3.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.18.1.bb => python3-simplejson_3.18.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.18.1.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.18.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.18.1.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.18.3.bb
index 1aaa1eab0..5752a0344 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.18.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "746086e3ef6d74b53599df31b491d88a355abf2e31c837137dd90f8c4561cafa"
+SRC_URI[sha256sum] = "ebb53837c5ffcb6100646018565d3f1afed6f4b185b14b2c9cbccf874fe40157"
 
 inherit pypi setuptools3
 
-- 
2.34.1


