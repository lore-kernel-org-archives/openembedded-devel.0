Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D49C636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 09:07:44 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.7820.1676192863423624025
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 01:07:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CAVXUgrI;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676192861; i=@fujitsu.com;
	bh=mBI8AsGLWSNM2tIGLVSfDnySIv/5qZ6SH3Hfe3reo8w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CAVXUgrIgdTWx6fYHS8zdTqn1Mqg8zDdZ5azgl7GKZpvcoFF4kC0DI+KMoIV76jC7
	 Gx/7UDM2JByY7t2Eq42+vgZGxZE5tcuFA6LafmGODHSG0qBLla55eXHRqj2cxlfRLd
	 k5fNga1plsPgOzuXM90Hl4jduOm09rO7vDgn7H6jgIlfWyfSN4uvL7XD5DPEwvTfIF
	 tPAOogM4CnJpTuVYIwbjebWt0yLA0miDwN3x4vdijVmdFuq9sTHt2vRUNQwmEvyA4q
	 /aq+GkkpSOoyM5yeiO3SBuE4g/e8nh4XN7nKOiEFE4+cQLg5/mVsh3ifiAb5VsbDnR
	 z1h3dtmq0HN9g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORqBuz5kW
  ywfGTahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bX28fYC1YKVyz485OxgbFbsIuRi0NI4Amj
  xNOeB6wQzg0mid6djYwQzl5GiY7mCWxdjJwcbAJSEjfu/wezRQT0JZbO3sMMYjMLqEi8+N3DD
  mILCwRIvN21lhHEZhFQlbh04BNYPa+Ak8Slc+fAbAkBBYkpD9+D9XIKOEucu3AKqJ4DaJmTxN
  JmOYhyQYmTM5+wQIyXkDj44gUzRKuixOzLzSwQdqVE64dfULaaxNVzm5gnMArOQtI+C0n7Aka
  mVYxmxalFZalFumZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBwZtSnPB4B+O8vr96hxglOZiURHmXbX6aLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCl
  2X1i2QhwaLU9NSKtMwcYCTBpCU4eJREeKsWAKV5iwsSc4sz0yFSpxgVpcR5zUH6BEASGaV5cG
  2w6L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj36CqgKTyZeSVw018BLWYCWswg9RRkcUk
  iQkqqgSnOQfSP7TWnlVoegSxas/i/X0pYEGG8/vRCg2fKRzT6vvKafTxulH2uY/HhEK8dliri
  VgYrl52TK7+pc/3cF8Yr/v5lkXfZvqmaX4rTfJt/9FftssTr1ZpfJV0ZX/2/byAryPi3oGj/i
  nkeKVGC5TU2mjMONv8JFjxw7c6vOd9+z5h6UKdNQLvAl90wavIG62Kpl3oiHNxKbiH/L6vNPT
  /hRs+VGUx7T8ncZj8rGOi/fO/VS0+ZVgspXp29131R2fVrp29O1tR7sVS8YlJu/LQIvkOmQdW
  BfQoqR2yeVHIx/fvuGZjQnCRtm7m/5dR998mzOR/9ejlTd8+j7DuHU76uYRapXHBuZvyR09/O
  iNopsRRnJBpqMRcVJwIAK83/b1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-732.messagelabs.com!1676192860!699152!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5674 invoked from network); 12 Feb 2023 09:07:40 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-4.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 09:07:40 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 1A574100182
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:40 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 0DD0E100043
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:40 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 09:07:38 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.13.0 -> 1.15.0
Date: Sun, 12 Feb 2023 17:07:17 +0800
Message-ID: <1676192839-13378-3-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 09:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101045

From: Wang Mingyu <wangmy@fujitsu.com>

Various fixes & improvements
=============================
 New: Add Huey Integration
 Profiling: Do not send single sample profiles (#1879)
 Profiling: Add additional test coverage for profiler (#1877)
 Profiling: Always use builtin time.sleep (#1869)
 Profiling: Defaul in_app decision to None (#1855)
 Profiling: Remove use of threading.Event (#1864)
 Profiling: Enable profiling on all transactions (#1797)
 FastAPI: Fix check for Starlette in FastAPI integration (#1868)
 Flask: Do not overwrite default for username with email address in FlaskIntegration (#1873)
 Tests: Add py3.11 to test-common (#1871)
 Fix: Don't log whole event in before_send / event_processor drops (#1863)
 Add before_send_transaction (#1840)
 Django: Always remove values of Django session related cookies. (#1842)
 Profiling: Enable profiling for ASGI frameworks (#1824)
 Profiling: Better gevent support (#1822)
 Profiling: Use co_qualname in python 3.11 (#1831)
 OpenTelemetry: fix Use dict for sentry-trace context instead of tuple (#1847)
 OpenTelemetry: fix extra dependency (#1825)
 OpenTelemetry: fix NoOpSpan updates scope (#1834)
 OpenTelemetry: Make sure to noop when there is no DSN (#1852)
 FastAPI: Fix middleware being patched multiple times (#1841)
 Starlette: Avoid import of pkg_resource with Starlette integration (#1836)
 Removed code coverage target (#1862)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.13.0.bb => python3-sentry-sdk_1.15.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.13.0.bb => python3-sentry-sdk_1.15.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.13.0.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.15.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.13.0.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.15.0.bb
index 001ff6082..b3ce17451 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.15.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "72da0766c3069a3941eadbdfa0996f83f5a33e55902a19ba399557cfee1dddcc"
+SRC_URI[sha256sum] = "69ecbb2e1ff4db02a06c4f20f6f69cb5dfe3ebfbc06d023e40d77cf78e9c37e7"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.34.1


