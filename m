Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E74D6C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:24:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.191350.1673940291235749863
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:24:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aiNJO5ic;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673940289; i=@fujitsu.com;
	bh=fZAefdV8vFpCYSLBbITa+ZJ0Be2+HxqR5pj+WF0cd+I=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aiNJO5iced1JmUVur3cxt5fWyFSEdAiMUyRzm0sebSDJXCyBaLPwuLKynK1t1bLNn
	 GwtoBzfPoRqoBhfwrPmDUZKCAwc6+NO49IepHVEGd828dBoj92sb47vgTfdhLlVEHY
	 /s6nQ84/RN9yXdm/ELFCe5JVyNhGMLBpL27YF32ybpcQyzIuIC0fuutpg2HTQLa2Lc
	 hNJ8hL2hyTBg7LAhPTJ7JDz4ZkaIDcBp0BB8Vjk3LL48ZVYxL79HferWpwSPztzsed
	 mtnR01+UcbF3fu4vjbtq1TlsUIkG+cbwYWzk3TOobRQrPegpdRmStQaAgsSl04Dh8n
	 vbaA3k3N64nEg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWdfB91i
  ywe5mW4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePkoX1sBff4K5asb2NpYPzA28XIxSEk8JBR
  4v6MjewQzlUmicOXPzBCOHsZJaZObWHuYuTkYBOQkrhx/z8biC0ioC+xdPYesDizgIrEi989Q
  N0cHMICARL3fuWDhFkEVCXOXXjJCmLzCjhJzPszmQXElhBQkJjy8D1YK6eAs8TBXbuYQGwhoJ
  o/d08zQ9QLSpyc+YQFYryExMEXL5ghehUlZl9uhppTKdH64ReUrSZx9dwm5gmMgrOQtM9C0r6
  AkWkVo2lxalFZapGupV5SUWZ6RkluYmaOXmKVbqJeaqlueWpxia6RXmJ5sV5qcbFecWVuck6K
  Xl5qySZGYOimFKur7mA8t+yP3iFGSQ4mJVHek6bHkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8
  J7yAsoJFqWmp1akZeYA4wgmLcHBoyTCG24JlOYtLkjMLc5Mh0idYlSUEuc97A2UEABJZJTmwb
  XBYvcSo6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWFeR5ApPJl5JXDTXwEtZgJa7FFyFGRxSSJ
  CSqqByVIu5RkLtz7nkr/7Aq8+WTVlSnPVTZ7GmtNHbwo037zB9m/zLuWSs98NC1xdnru9LX63
  hbdsr/g5NWuX5werbkkc7ry+7Kvoi+tJrG3hPILHk94F2a9W1C15yh7B7t4wZx3fweO5n2Imn
  vK9wntgRuHS7U8e2J84+8ao5fRc1allr/lufntjLfdQmnn35vTGnf6GqYoi/L/Fvm/7W6qe0s
  3V6GzMcJY5QWqad2E2ayjPqu93X/gdWm3dNlspPa//6pU7vafqb7pd/rFQJXTipVrOC8fWTw3
  s32LeHr+Uf+nN+8J+/Z1ilfFlZ2+l3VjR5aZq+aJIUsnU82DbmzNmbzJZlQvqkvNful02zMhr
  UWIpzkg01GIuKk4EAHtcwXxYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1673940288!383733!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18850 invoked from network); 17 Jan 2023 07:24:48 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:24:48 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id B2DE0151
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:48 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id A6996150
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:48 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:24:47 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.12.1 -> 1.13.0
Date: Tue, 17 Jan 2023 15:24:24 +0800
Message-ID: <1673940264-20487-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
References: <1673940264-20487-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100624

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add Starlite integration (#1748) 
- Adding support for the Starlite framework. Unhandled errors are captured.
  Performance spans for Starlite middleware are also captured.
- Profiling: Remove sample buffer from profiler (#1791) 
- Profiling: Performance tweaks to profile sampler (#1789) 
- Add span for Django SimpleTemplateResponse rendering (#1818) 
- Use @wraps for Django Signal receivers (#1815) 
- Add enqueued_at and started_at to rq job extra (#1024) 
- Remove sanic v22 pin (#1819) 
- Add support for byterray and memoryview built-in types (#1833) 
- Handle "rc" in SQLAlchemy version. (#1812) 
- Doc: Use .venv (not .env) as a virtual env location in CONTRIBUTING.md (#1790) 
- Auto publish to internal pypi on release (#1823) 
- Added Python 3.11 to test suite (#1795) 
- Update test/linting dependencies (#1801) 
- Deps: bump sphinx from 5.2.3 to 5.3.0 (#1686) 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.12.1.bb => python3-sentry-sdk_1.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.12.1.bb => python3-sentry-sdk_1.13.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.13.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.13.0.bb
index 00b14ed1a..001ff6082 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.13.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "5bbe4b72de22f9ac1e67f2a4e6efe8fbd595bb59b7b223443f50fe5802a5551c"
+SRC_URI[sha256sum] = "72da0766c3069a3941eadbdfa0996f83f5a33e55902a19ba399557cfee1dddcc"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


