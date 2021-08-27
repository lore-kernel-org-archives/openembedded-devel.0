Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web09.4301.1630042771357475573
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 22:39:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SE1odWbq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630042769; i=@fujitsu.com;
	bh=QX2WxjdKwyPIpicCR4gME5g7eRGGXMB4Rcv9WkCxIG4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SE1odWbqJjEW4QLIRw0bJloOb7PYTgXwKld6mOzpYDsLwLq7SvJtksK5PXiVuBAvw
	 9jtWCkv0ZS+EWux2pwrA26oSePwjuLI4rZcLZKh+hRIYOb1O6tpTrXey+Q8ltfrinl
	 l8B90BZOUClTURbIxHYtJ3JzPtmi522Wgkjnj+3+QmbAiPGOzeZBNLb1KZMG+g0SG6
	 Y2WIxLskcMs7BYf7AuFsCjVMszqeDVFLKa86oYnP43/zaDQCuptx3kvpAWLM9IbThp
	 xlAWu1pezDlps5g7PxrpxMHwiZWO5lNkZi/9FaRozjMSuLodnU4iDU6cLOOE4nahCG
	 I0ioKa4md/3pA==
Received: from [100.112.194.228] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id C6/31-28260-19A78216; Fri, 27 Aug 2021 05:39:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+EI0Z1YpZF
  o0PmQ1eLi4aXMDowe5zauYAxgjGLNzEvKr0hgzXi8cyljwQ+einNtfA2MG7m7GLk4hARmM0k0
  bTjKCOGcYJRY/eYSaxcjJwebgI5Ex4tuFhBbREBfYunsPcwgtrCAj8Tz3klANgcHi4CqxOl2X
  ZAwr4C7xJbNjewgtoSAgsSUh++ZIeKCEidnPgEbwywgIXHwxQtmiBpFie07z7BA2BUSrw9fYp
  7AyDMLScssJC0LGJlWMVokFWWmZ5TkJmbm6BoaGOgaGhrpGloCsZGZXmKVbqJeaqlueWpxia6
  hXmJ5sV5xZW5yTopeXmrJJkZgEKUUHKjbwfjg9Qe9Q4ySHExKorw70jUShfiS8lMqMxKLM+KL
  SnNSiw8xynBwKEnwrqsAygkWpaanVqRl5gADGiYtwcGjJMLbUwmU5i0uSMwtzkyHSJ1iVJQS5
  /UHSQiAJDJK8+DaYFF0iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwbxjIFJ7MvBK46a+AFj
  MBLS7gUwVZXJKIkJJqYGLgvun/aj//Oa8Kw+WbBVPqODaucH6ufnfF3JSdy/bsNJO2duu6Fye
  e/v/RzOAzRws11zrc+M9ySN9JQqz+ziXpaouF/+/t+tH6u+KZy9Nby+RsnXalsJx7khMjt/+b
  tLbwtkDpjym6IaFcmTmVn+bL/bkovjE007Jgcty+KZw37P/lH6h8nSubYF7cxcm574LxP9Fjm
  9piP/hW+U+Zd0Om0275+/cz5HnkOS9F/GU3u/PSikntQyy39uu2LwreEzdPKKndHrKhfmOyjc
  D6B5+6JmTtXPv32+b/yUemaPf877yjxjqjQdls3b5df+7Nk1t3QmNFydxj1WIprOsX/F/Gtz3
  i+ZF3a/+ymGxYls6qxFKckWioxVxUnAgAChpRoB0DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-2.tower-267.messagelabs.com!1630042768!109495!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28037 invoked from network); 27 Aug 2021 05:39:29 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-2.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Aug 2021 05:39:29 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17R5dSro031243
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 06:39:28 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 27 Aug 2021 06:39:27 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-gevent: upgrade 21.1.2 -> 21.8.0
Date: Fri, 27 Aug 2021 13:39:22 +0800
Message-ID: <1630042762-53016-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

21.8.0 (2021-08-05)
===================

Features
--------

- Update the embedded c-ares from 1.16.1 to 1.17.1.
  See :issue:`1758`.
- Add support for Python 3.10rc1 and newer.

  As part of this, the minimum required greenlet version was increased
  to 1.1.0 (on CPython), and the minimum version of Cython needed to
  build gevent from a source checkout is 3.0a9.

  Note that the dnspython resolver is not available on Python 3.10.
  See :issue:`1790`.
- Update from Cython 3.0a6 to 3.0a9.
  See :issue:`1801`.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-gevent_21.1.2.bb => python3-gevent_21.8.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gevent_21.1.2.bb => python3-gevent_21.8.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
rename to meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
index e4eaad0170..74ae6cf69d 100644
--- a/meta-python/recipes-devtools/python/python3-gevent_21.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gevent_21.8.0.bb
@@ -20,7 +20,7 @@ SRC_URI:append = " \
     file://libev-conf.patch;patch=1;pnum=1 \
 "
 
-SRC_URI[sha256sum] = "520cc2a029a9eef436e4e56b007af7859315cafa21937d43c1d5269f12f2c981"
+SRC_URI[sha256sum] = "43e93e1a4738c922a2416baf33f0afb0a20b22d3dba886720bc037cd02a98575"
 
 # The python-gevent has no autoreconf ability
 # and the logic for detecting a cross compile is flawed
-- 
2.25.1

