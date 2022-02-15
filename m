Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A33EC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 07:38:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.6811.1644910681720785222
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Feb 2022 23:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=D9PiJcPu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1644910679; i=@fujitsu.com;
	bh=ZKdg+H37syvCxxVOmkWITq+oa+44pLUv1vEjbmXlG+g=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=D9PiJcPugbOOQkgeV+XKsOrxdP9tNEt9e70mA3NBzGmXv+aLJyG3lmmzw40x6vVrs
	 2wzA9Tn/mkj+og8KPjdLjzbd1zf4dy5TeT4OXJxE1BYhufQH8LOHfoZdElHGxa+G2C
	 0HAQ9TOf34mk7p1XLdyjJlGg+w6+DwRb0gm9WvVP5F9qPnJkvfMoL72v9ov9m2SkOk
	 Nj2tPaGot0/uoA6qhtJCnaGdjZ7UGblFXb5rxcHMOQEuSItS1nV5U1IM1OBCv0jeUS
	 Ya8V3r5PD4WoW6Qw26NYIb7mq2sEeLzbDa8xSurDEjcsWfqolEHpoQqpW+UnOj1ir2
	 g+AeIIcy0JHqg==
Received: from [100.115.7.136] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id BC/DD-00700-7585B026;
 Tue, 15 Feb 2022 07:37:59 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8MxSTc0gjv
  JoH0dm8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmvFo0072gn7eiiO3W9kbGN9xdzFycQgJPGGU
  ePryIDuEc4FJouPONSjnBKPEwZNrWbsYOTnYBNQkpt+6AWaLCOhLLJ29hxnEZhZQkXjxu4cdx
  BYW8JF4v2gfI4jNIqAqcbf1HBOIzSvgKLH1Wx+YLSGgIDHl4XuwXk4BJ4m7C/+C9QoB1Vzd8Y
  wdol5Q4uTMJywQ8yUkDr54wQzRqygx+3IzC4RdITFrVhvUTDWJq+c2MU9gFJyFpH0WkvYFjEy
  rGK2SijLTM0pyEzNzdA0NDHQNDU11gaSpiV5ilW6iXmqpbnlqcYmuoV5iebFeanGxXnFlbnJO
  il5easkmRmAYpxQzzNrBOKvvp94hRkkOJiVRXm997iQhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKE
  rzPwoBygkWp6akVaZk5wJiCSUtw8CiJ8M73A0rzFhck5hZnpkOkTjEqSonzmoUDJQRAEhmleX
  BtsDi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmYdzrIFJ7MvBK46a+AFjMBLVZs5AJZXJK
  IkJJqYJJb5zf3A/PVPofw+7PYYuac2L34/pYbU1K2vDial9M3S2IZn6jG28RaDmvuaUEzNcz1
  E3+tZm18riuRy7K0ftIu7rTNNUHmnDN/ff2caWRz6W9e2OUP9nPaH9oHzdO1+PUxb/+e9z77L
  N/H3usVapygd968IOxqanrB/TenXnE3ldzlujXJ0+vNux/L+LzO1jnz2b84Lnxny0PuJo6FWx
  ZuvdCuIDP9wPc1Wg/4BH7JVu1snnBG1/ajisXl3RfyQz+xz9aVWNS19ccZ5WUPLkx89fpszOy
  YD0+VFjNsapvzJD3ukmHgO4sVH8OMTyyK/8n0Kbpw8W0Z75pWFgu2FX9MgmrMnJdaSHh61P8x
  XnlSiaU4I9FQi7moOBEAfg/Oll4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-591.messagelabs.com!1644910676!73769!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2381 invoked from network); 15 Feb 2022 07:37:57 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Feb 2022 07:37:57 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 969DD100451
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:37:56 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8A6C3100440
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Feb 2022 07:37:56 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 07:37:39 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-werkzeug: upgrade 2.0.2 -> 2.0.3
Date: Tue, 15 Feb 2022 15:37:27 +0800
Message-ID: <1644910647-5613-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1644910647-5613-1-git-send-email-wangmy@fujitsu.com>
References: <1644910647-5613-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Feb 2022 07:38:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95313

Changelog:
=========
- "ProxyFix" supports IPv6 addresses. :issue:'2262'
- Type annotation for "Response.make_conditional",
  "HTTPException.get_response", and "Map.bind_to_environ" accepts
  "Request" in addition to "WSGIEnvironment" for the first
  parameter. :pr:'2290'
- Fix type annotation for "Request.user_agent_class". :issue:'2273'
- Accessing "LocalProxy.__class__" and "__doc__" on an unbound
  proxy returns the fallback value instead of a method object.
  :issue:'2188'
- Redirects with the test client set "RAW_URI" and "REQUEST_URI"
  correctly. :issue:'2151'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_2.0.2.bb => python3-werkzeug_2.0.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_2.0.2.bb => python3-werkzeug_2.0.3.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_2.0.2.bb b/meta-python/recipes-devtools/python/python3-werkzeug_2.0.3.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-werkzeug_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_2.0.3.bb
index 4c221cc41f..ed7a509ad3 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_2.0.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=5dc88300786f1c214c1e9827a5229462"
 
 PYPI_PACKAGE = "Werkzeug"
 
-SRC_URI[sha256sum] = "aa2bb6fc8dee8d6c504c0ac1e7f5f7dc5810a9903e793b6f715a9f015bdadb9a"
+SRC_URI[sha256sum] = "b863f8ff057c522164b6067c9e28b041161b4be5ba4d0daceeaa50a163822d3c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


