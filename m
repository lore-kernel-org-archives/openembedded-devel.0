Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E89A9C61DA4
	for <webhook@archiver.kernel.org>; Sat, 18 Feb 2023 10:26:20 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web10.9575.1676715974659878451
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Feb 2023 02:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=JUZKtiWI;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676715972; i=@fujitsu.com;
	bh=aG+WwoeU39ps/3b9qIcDA1lI21VdP8K6xv+OXD6bOvc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=JUZKtiWIQHTWRl6v8X/ECJVhwcRyPsC9vJZigS/Id+2krTtq9y3OKES6cNcjabAbZ
	 ttzZowg3F0zHRI2906+nquc9VC0kw4hsUQpr3lPNc+c+ybX4+FbyyM5gbaMTpQCIBg
	 SyTZbACiBfT/S9XUJW7Ms0SPo0xCgKb4FpBCYG/5YBcE4hjbhe2M563bWW9TvW75KB
	 jitX9l40o0FlU1Cx9TuWqIhC7nk/q6RMrYSqwy5uLDfiDnwjORFsI3X792YkJalyZc
	 Hv095jvbjK1M7l1USH9Gyv+9S7G4CfAYr8orV8Uaz481aujjlAzkBcUDXcCfSfWwYs
	 MByfCuWVUaMqg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqHt4+Yd
  kg20LTC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oz2V1cZCyZyV0x99pOpgfEdZxcjF4eQwBNG
  iXl7Z7FCODeYJNY1NLFDOHsZJZZ27wFyODnYBKQkbtz/zwZiiwjoSyydvYcZxGYWUJF48bsHq
  IaDQ1jATuJguzpImEVAVWLl6Udg5bwCThITTr9lBLElBBQkpjx8D9bKKeAscWXhKjBbCKjm1P
  49LBD1ghInZz5hgRgvIXHwxQtmiF5FidmXm1kg7EqJ1g+/oGw1iavnNjFPYBSchaR9FpL2BYx
  MqxhNi1OLylKLdA31kooy0zNKchMzc/QSq3QT9VJLdctTi0uAMonlxXqpxcV6xZW5yTkpenmp
  JZsYgaGbUszCvIPxcM9fvUOMkhxMSqK8n7e9TxbiS8pPqcxILM6ILyrNSS0+xCjDwaEkwVs39
  0OykGBRanpqRVpmDjCOYNISHDxKIryVs4HSvMUFibnFmekQqVOMilLivO+WAiUEQBIZpXlwbb
  DYvcQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLdwGdAUnsy8Erjpr4AWMwEtXsD8FmRxSSJ
  CSqqByV2dpzIv6f0KiXquJPc278kT1/79v9S5trhvAne4JDvL8wzhN4HvlqX/PH2V/fSHpBbV
  R79nNkmVb5YzvvLCas7enfs+njvs4lXye9v0bRsq7/PF3Zt7f1bYtC0m76S1bR8sPSSwtq/Ee
  1LaC+E3G9Onpbrka12pFDjR8yCT7dBXvWfapd3K269F7aoIvhYYGl7XMUdo7p6Hb0oXNt5kff
  ncRMlyp8fUte+Ng+7nWUgtuH/f3OFYx6TG3+dmTvn/VXjuzbU776SYs605/q32tZ5W7W0jvje
  br87+JT6fqan/gLPBtFWHtQvZDkxcIrl9auSBw8evKa15X3xT2qPS/OKivcap+1dlxcqXX/Nr
  n+2oxFKckWioxVxUnAgAG/WEBFgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-9.tower-591.messagelabs.com!1676715971!195382!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15156 invoked from network); 18 Feb 2023 10:26:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 18 Feb 2023 10:26:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 78CE610018D
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:11 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 6BF3A100182
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:11 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 18 Feb 2023 10:26:09 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] neon: upgrade 0.32.4 -> 0.32.5
Date: Sat, 18 Feb 2023 18:25:45 +0800
Message-ID: <1676715946-32075-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
References: <1676715946-32075-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Feb 2023 10:26:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101141

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
* NOTE: Since 0.32.0 the "$KRB5_CONFIG" environment variable is ignored
  when running configure. Use KRB5_CONF_TOOL instead to specify an
  alternative to /usr/bin/krb5-config.
* Fail for configure --with-gssapi if GSSAPI can't be enabled (issue #102)
* Add Georgian translation
* Fixes for Windows MSYS2/MinGW build, including cross-build

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/neon/{neon_0.32.4.bb => neon_0.32.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/neon/{neon_0.32.4.bb => neon_0.32.5.bb} (96%)

diff --git a/meta-oe/recipes-support/neon/neon_0.32.4.bb b/meta-oe/recipes-support/neon/neon_0.32.5.bb
similarity index 96%
rename from meta-oe/recipes-support/neon/neon_0.32.4.bb
rename to meta-oe/recipes-support/neon/neon_0.32.5.bb
index d281bfde6..c364aab36 100644
--- a/meta-oe/recipes-support/neon/neon_0.32.4.bb
+++ b/meta-oe/recipes-support/neon/neon_0.32.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/neon27/neon27_${PV}.orig.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "1bcdaabb63206b5e00c9a8c4b3672168b523b49eb559c5a486e3256463af34fd"
+SRC_URI[sha256sum] = "4872e12f802572dedd4b02f870065814b2d5141f7dbdaf708eedab826b51a58a"
 
 inherit autotools-brokensep binconfig-disabled lib_package pkgconfig ptest
 
-- 
2.34.1


