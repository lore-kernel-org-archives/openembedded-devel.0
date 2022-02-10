Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 991D4C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 10:25:22 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.8398.1644488714964063945
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 02:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ADmRnoh6;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644488720; i=@fujitsu.com;
	bh=loyQbZtBoseRmVRmhnGBezRzAHGWOWPC2PsJbpOAMa0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ADmRnoh6E7H8evM1FtVn0ucPOMPrNxAyrZBLvqAFas9z6TGZmjxlWM+T6eq917gAL
	 cnmrJkB1vJ2DSzf9J2DIMG5OsoaZjCXKTsNiuStI5rs33dbpVDrsO72wOlxNU2BCZX
	 2m6Aopnl3Icd6y93idqXsuhmnwcckqLZkXj94tQ/xBwwX7xaquUhQnhKkFzo4iT+XW
	 E7S0V1NgOrSzXn3T0BhGquxBMCtRXd8EXhGqW+D4/YW9ad2qdjxS7dPqCm/aW+KvUr
	 8MUvRKdqJe+3Tbl31GGt0S3mo2kvB1E3f4ro41eTgdf9dt3ZTFvS+xB4UCycDgikUT
	 8abvUx8Wl6GcA==
Received: from [100.115.2.98] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id EC/C6-00700-018E4026;
 Thu, 10 Feb 2022 10:25:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8MRoivwgiX
  JYPkiYYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaPr7iHWghbOivl/V7M1MC7j6GLk5BASmMkk
  0dSp2MXIBWSfZJTo7WhiA0mwCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENO4gtLBAh8eZJE
  1gNC1D8S8NEsBpeATeJ91cXgNVICChITHn4HizOKeAuMfftPzaIxW4Sj7d9ZYOoF5Q4OfMJC8
  R8CYmDL14wQ/QqSZxY8ZEJwq6QeH34EvMERv5ZSFpmIWlZwMi0itEqqSgzPaMkNzEzR9fQwED
  X0NBU11TXyNRUL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3OSdFLy+1ZBMjMCRTiln/72Ds
  7vupd4hRkoNJSZQ36BxLkhBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3nkXgHKCRanpqRVpmTnA+
  IBJS3DwKInwvr4NlOYtLkjMLc5Mh0idYlSUEufd+gwoIQCSyCjNg2uDxeQlRlkpYV5GBgYGIZ
  6C1KLczBJU+VeM4hyMSsK8MiBTeDLzSuCmvwJazAS0eNt0JpDFJYkIKakGJklzTZ3qbu5LfGf
  Snry8b31HQNYx9NsTj0vPPnge6jbcI3fA8/Zn85irz8PvLXzorrvab9XeHyz3VJgEO88lfz58
  Iu9Mym+BNd7lllmRtlN+PFu4f8nlho+PvLp4nnZn3RHndtq8vl7u07np09ZNT2kv5ZO49eX0w
  44the8jLfxFJOsObn6XGfpfw2H2nTvVT4/d6BTJ+MoskK52/8pG9Q36M/Pi86JDJ1+P25nwr8
  HM5sM10X2nZ3berrijMlHj04Gmj6xnJ9hve+80c5bUnGD2j+1C7UUuH3cvdmXvZu/edvh1t0u
  +6O3Xf2b++5L99sjU17kMlku+z66Vv8zZYDdfNqT04sqjzTL/duS8vuamxFKckWioxVxUnAgA
  PQoNLUQDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-587.messagelabs.com!1644488719!6702!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15115 invoked from network); 10 Feb 2022 10:25:20 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 10 Feb 2022 10:25:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21AAPCmQ004140
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Feb 2022 10:25:19 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Thu, 10 Feb 2022 10:25:10 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 4/5] [oe] [meta-python] [PATCH] python3-pyudev: upgrade 0.22.0
 -> 0.23.2
Date: Thu, 10 Feb 2022 18:25:38 +0800
Message-ID: <1644488739-3593-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1644488739-3593-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Feb 2022 10:25:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95281

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pyudev_0.22.0.bb => python3-pyudev_0.23.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.22.0.bb => python3-pyudev_0.23.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
index dc70b482b1..183bf7273c 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.22.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.23.2.bb
@@ -3,7 +3,7 @@ SUMMARY = "A libudev binding"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[sha256sum] = "69bb1beb7ac52855b6d1b9fe909eefb0017f38d917cba9939602c6880035b276"
+SRC_URI[sha256sum] = "32ae3585b320a51bc283e0a04000fd8a25599edb44541e2f5034f6afee5d15cc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


