Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA09C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 23:46:08 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web08.1010.1645573566404986527
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 15:46:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ZhYYuhy3;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645573564; i=@fujitsu.com;
	bh=ttB3enabW9BsdnHr0Vqxa/R4XHFP3vdtjDtqGxodBjA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ZhYYuhy3VaLwpInQYvYFjW0HhC4qAm8rHKJO6x+Cjr3I74zf+aHfxMBIUb15DSpBk
	 XytTXwVgC4l5tK22MxFATWf92o0QxJfn3JApdJINB+IxCxRFL86Q9gJFK/6MzOK7m0
	 eUsP7FYlWDGqqq3h2qrQwE64qqQ1HPL9yMR40UMmDCF6/PnMcayQUjgK6GQHyhHUvi
	 oSEFZ818lpCvEqsPeLWs68Gj4AJADfiX0ne3DoR5TOnRVzElyjcviiy/N/aZFCRANq
	 V5d71vctbcKaH1S2Su3281cyeHWVgHrvt26KVn00g92IRwsS6Mh5IjQibxuNC+Z2DY
	 AW+ZDsSR18STA==
Received: from [100.115.71.247] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 28/E6-13301-CB575126; Tue, 22 Feb 2022 23:46:04 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRWlGSWpSXmKPExsViZ8MRorunVDT
  JYO4xQYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePktxbmgn98FRfunGZsYOzm7WLk4hASmMkk
  MXV6BxOEc4JRYuLThyxdjJwcbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdww5iCwtYS2zsW
  AZWzyKgKvFt0zkwm1fASWLutT6wGgkBBYkpD9+D9XIKOEvs728BiwsB1dzb/Y4Vol5Q4uTMJy
  wQ8yUkDr54wQzRqygx+3IzC4RdITFrVhvTBEb+WUhaZiFpWcDItIrRLqkoMz2jJDcxM0fX0MB
  A19DQVNfMTNfQ1FQvsUo3US+1VDc5Na+kKBEorZdYXqyXWlysV1yZm5yTopeXWrKJERicKcVO
  s3cw7uj7qXeIUZKDSUmUd66/aJIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV6VQqCcYFFqempFW
  mYOMFJg0hIcPEoivCrFQGne4oLE3OLMdIjUKUZFKXFewxKghABIIqM0D64NFp2XGGWlhHkZGR
  gYhHgKUotyM0tQ5V8xinMwKgnzzgeZwpOZVwI3/RXQYiagxVOyhEAWlyQipKQamJR2u+z7U3v
  QsWTNYzffu0L1j3rc82e2vTBWrLAReX/1bln22dcTpHguyCfk+Et9Ea+amLlMPrlGsDFwhYQV
  p3bzwuOcj/dxOcyf/fjqtz3To8QswuqiBfO2rmPby5ZgtupDcsidh3u7tAUTPu3kU5fQ8f2ls
  fT+1g8q4Yr10zcZSXeIFE7mMu13irjDx77v0/OFv77qSusfPxnc8c3ZJ+R0zzq5mMIofW0f7n
  7r5FvOG5mdLbftrbr+Irvjj60Df+7/zDMlO7Y7c6/fdD20vpVD6/4d/5VL9zbW2Gy9mH3W631
  UQx+r/VpHDqubXPv29Fvn/3Aqf2lil6t5/uPCO3Pn7lOoP8cjXW3NY/5KiaU4I9FQi7moOBEA
  qTwOJkkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-528.messagelabs.com!1645573563!12194!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3255 invoked from network); 22 Feb 2022 23:46:04 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-15.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Feb 2022 23:46:04 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21MNjwlu007217
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 23:46:03 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 22 Feb 2022 23:45:59 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] php: upgrade 8.1.2 -> 8.1.3
Date: Wed, 23 Feb 2022 07:45:48 +0800
Message-ID: <1645573548-27245-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1645573548-27245-1-git-send-email-wangmy@fujitsu.com>
References: <1645573548-27245-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 23:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95457

Changelog:
=========
Core:
------
Fixed bug #81430 (Attribute instantiation leaves dangling pointer).
Fixed bug #7896 (Environment vars may be mangled on Windows).
Fixed bug #7883 (Segfault when INI file is not readable).

FFI:
-----
Fixed bug #7867 (FFI::cast() from pointer to array is broken).

Filter:
------
Fix #81708: UAF due to php_filter_float() failing for ints. (CVE-2021-21708)

FPM:
-----
Fixed memory leak on invalid port.
Fixed bug #7842 (Invalid OpenMetrics response format returned by FPM status page.

MBString:
--------
Fixed bug #7902 (mb_send_mail may delimit headers with LF only).

MySQLnd:
--------
Fixed bug #7972 (MariaDB version prefix 5.5.5- is not stripped).

pcntl:
------
Fixed pcntl_rfork build for DragonFlyBSD.

Sockets:
-------
Fixed bug #7978 (sockets extension compilation errors).

Standard:
---------
Fixed bug #7899 (Regression in unpack for negative int value).
Fixed bug #7875 (mails are sent even if failure to log throws exception).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/php/{php_8.1.2.bb => php_8.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/php/{php_8.1.2.bb => php_8.1.3.bb} (99%)

diff --git a/meta-oe/recipes-devtools/php/php_8.1.2.bb b/meta-oe/recipes-devtools/php/php_8.1.3.bb
similarity index 99%
rename from meta-oe/recipes-devtools/php/php_8.1.2.bb
rename to meta-oe/recipes-devtools/php/php_8.1.3.bb
index 038d79783b..bfe4d270d6 100644
--- a/meta-oe/recipes-devtools/php/php_8.1.2.bb
+++ b/meta-oe/recipes-devtools/php/php_8.1.3.bb
@@ -32,7 +32,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "913dc7dd4388427fa33ea4ac89834e856ff5394f4218eace260a3a279f5b53a9"
+SRC_URI[sha256sum] = "354c4e2c506046eca812d1fc2526884a2f54b5e3d20ef0ede919a69eb232d0be"
 
 inherit autotools pkgconfig python3native gettext
 
-- 
2.25.1


