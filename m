Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DDA8FA3744
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 02:11:47 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.1711.1667268701754078731
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Oct 2022 19:11:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kOmICIGQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667268700; i=@fujitsu.com;
	bh=yjE4AJNkBLxXoTUVQAtyVOlQ/2JgbyYh82FeN7MCUQY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=kOmICIGQxVoyheefGR46ObcY7CG25cwBB4N1OrbT9dt19Eg+Pye3KYkOj19Yr+ZCq
	 yP3hN4qyAFkc+D0S7riSi0TUFfsYkYUL5KZZah6REH19aNQWNgdLnlLjiaejKNEA+5
	 gbeNoH3Hbcg4R4s4R6Q4+da054vGLNP1tImb52GFnZix6QWA7qI4wCf3H/MRD8MLJ1
	 vJEAnHeP5nG78bdnwGxfG4F/TIdmygZQI/SS0W0vxnrFokRpCGzLWhuFqsvKletNUS
	 EUrohKCga+xC2QXpAdsngB+D4XQo1RSLqd2aR/ZEfnWXY26m5iot9PbF41lk+/a8Zl
	 IqhLK/IfcN69w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrLIsWRWlGSWpSXmKPExsViZ8OxWTe6ISH
  ZoH87p8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFw+k3mgq+cFd9vXGBqYJzI2cXIxSEk8JBR
  4kzbT2YI5zKTxI+GVSwQzm5GiecNp1i7GDk52ASkJG7c/88GYosI6Essnb2HGcRmFlCRePG7h
  x3EFhbwk5i5+QZQMwcHC1C842wkSJhXwEni/dlXYK0SAgoSUx6+ZwYp4RRwlng5IwskLARUsv
  LDC2aIckGJkzOfsEBMl5A4+AIiLiGgKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo1lxalFZapGuoYFeUlFmekZJbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJO
  il5easkmRmDophSr9O1gfLvsj94hRkkOJiVR3v8SCclCfEn5KZUZicUZ8UWlOanFhxhlODiUJ
  Hh/1gHlBItS01Mr0jJzgHEEk5bg4FES4f1VDZTmLS5IzC3OTIdInWK05Jg6+99+Zo7lYHLm17
  YDzEIsefl5qVLivAvqgRoEQBoySvPgxsFi/RKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd4
  5IFfxZOaVwG19BXQQE9BBbO1xIAeVJCKkpBqYOIQUVn8RmF25NSFxxXsuXuf+b2t+ealPCM98
  wmEbw/CpqbXrnazvpftKpQnfrXuFf3S59K1fqiQvWDidWbl/aa3sp76iWVNldks/Fft4PuLDN
  4mNLlmC60s9ZrjozFjy4co9tv99PrvlSr5/UzhyspUt9PY80cLNGXeN/vCX1k3/+4ThyPpDF+
  f/qjIwOtqtlm9++d2Rb9KHG14Znm+6u25K1TvZg06znlXN7DP59/Zc76vSstmzZk9Qfl646cW
  rWx8nHVoY7NFbEhooUBUotmn1FlY29puOF4/yB37yiunftuT3yxkGJ99pKW+pkrCQ5Ehmun1m
  hfEG8x+HMo1+1FvO0rSb0nfhlvfC2R4HRJRYijMSDbWYi4oTAXlhSFtwAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-571.messagelabs.com!1667268699!341864!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2391 invoked from network); 1 Nov 2022 02:11:39 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-13.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 1 Nov 2022 02:11:39 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id DDA2A151
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:11:38 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id D11DA73
	for <openembedded-devel@lists.openembedded.org>; Tue,  1 Nov 2022 02:11:38 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 1 Nov 2022 02:11:37 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.39.2 -> 0.39.3
Date: Tue, 1 Nov 2022 10:11:24 +0800
Message-ID: <1667268684-10065-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1667268684-10065-1-git-send-email-wangmy@fujitsu.com>
References: <1667268684-10065-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Nov 2022 02:11:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99393

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fix port changes not being seen by ServiceInfo (#1100) 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.39.2.bb => python3-zeroconf_0.39.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.39.2.bb => python3-zeroconf_0.39.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.39.3.bb
index 53642c6308..a7ce78d746 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.39.2.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.39.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "629d2a0dd7a2b9af5bc5eb0c8402755e87a2d00f7015c72834fc0958ccda2835"
+SRC_URI[sha256sum] = "829de9ade964f1fdc1e55564a163f82dcc6e124fd858a4ad43cf324a6fb5a937"
 
 inherit pypi setuptools3
 
-- 
2.25.1


