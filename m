Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE097C4332F
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 08:19:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web12.29532.1652084346362217250
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 01:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mpaVqCFQ;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652084350; i=@fujitsu.com;
	bh=3MPbTeHMA5TFgtDJtVyFbp4KDYqiTVJhAOdAmfKSgnE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mpaVqCFQbimcBA571PaRzrZ1hRTCvpmgtT7/m9znX9DRtrVoFFWorTi8hEHvP0/Hc
	 oglVgNkZu3a33PTut1T7SCiRami7Y+E9BjVvqBokL2CEyBdXRWsEsHzO+hhlXRfOfV
	 fUhOte9u0W3+MGgah46hAfyVtl0hHTe+Y7yrNc7VwcPAT4zfi4h6zPxELdYH7maTgl
	 pb8P5H9sWHOj8olHFa9pX9JcytE6UGKghus+DlM0SZTPUYCIY5SzQicCVBXZzyNy7I
	 8w09ITtWG1Imogb4z4v1LKBTj/TgKWx+f/M4vxNxHEMEjTJpA4rRqWOWg5JGM3Nvif
	 mxyrjnybuLcKQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8MxRbfuXEW
  SwdrTIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bL7QeYC9p5KnZ3TGBsYNzD1cXIxSEkMItJ
  Yu3k/YxdjJxAzm5Gifc7qkFsNgE1iem3brCC2CIC+hJLZ+9hBrGZBVQkXvzuYQexhQXsJd5cW
  w/WyyKgKjG/bRmYzSvgJPFv+RywXgkBBYkpD9+D9XIKOEtcvrcZapeTxPPJJ5kg6gUlTs58wg
  IxX0Li4IsXzBC9ihKzLzezQNgVErNmtTFNYOSfhaRlFpKWBYxMqxitk4oy0zNKchMzc3QNDQx
  0DQ1NdY3NdQ3NjPQSq3QT9VJLdctTi0t0gdzyYr3U4mK94src5JwUvbzUkk2MwKBMKVZdtINx
  /6qfeocYJTmYlER5K5sqkoT4kvJTKjMSizPii0pzUosPMcpwcChJ8DqcAsoJFqWmp1akZeYAI
  wQmLcHBoyTCe/cEUJq3uCAxtzgzHSJ1ilGX4+7CvXuZhVjy8vNSpcR5uc8CFQmAFGWU5sGNgE
  XrJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvI4gU3gy80rgNr0COoIJ6IiPAaUgR5QkIqS
  kGpisMqolL1np6Sd5qXyRtC5odz315PC8ez7TFiz+2i06v2BP6pEN6sxhV+1+eSsq3Fg48+WF
  r+2MH5XtQzIe3j+v3GPx72xP5P41dSed9qbMK2eayFRy7f0E3fXvw1f4ir6U5TiqPT/YuOH4I
  ZO2k7ffNR7M8JS7+jry+pF/GhLXjjWsbNUUPCYRvP6d8NNZzjl6qy7I9rxdW9BefeaIqd/Z7z
  nfljHK+e9cExz4P6dG5XbeYofurfUv12gts4ia/3PDnZVlgV9aDZ3Frs/ZcWKBzJoVsyxOR7p
  s8un5sprhpGObX90cTcdMqYSHh1w5o7fcaC/5PZFXgcH3Uv/a+SG6MR1ax07P2/eDVTbdifeO
  EktxRqKhFnNRcSIAEEZeH1EDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-27.tower-548.messagelabs.com!1652084350!205283!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24058 invoked from network); 9 May 2022 08:19:10 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-27.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 08:19:10 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2498J4Sl032126
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 9 May 2022 09:19:10 +0100
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 09:19:07 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] freerdp: upgrade 2.6.1 -> 2.7.0
Date: Fri, 29 Apr 2022 16:01:12 +0800
Message-ID: <1651219273-27341-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
References: <1651219273-27341-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 08:19:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96988

Changelog:
==========
Noteworthy changes:

    Backported OpenSSL3 gateway support (#7822)
    Backported various NTLM fixes
    Backported WINPR_ASSERT to ease future backports

Fixed issues:

    Backported #6786: Use /network:auto by default
    Backported #7714: Workaround for broken surface frame marker
    Backported #7733: Support 10bit X11 color (BGRX32 only)
    Backported #7745: GFX progressive double free
    Backported #7808: Disable websockets with /gt:rpc
    Backported #7815: RAIL expect LOGON_MSG_SESSION_CONTINUE


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp_2.6.1.bb => freerdp_2.7.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp_2.6.1.bb => freerdp_2.7.0.bb} (98%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.7.0.bb
similarity index 98%
rename from meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp_2.7.0.bb
index ece2f5696..0645ccd94 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.7.0.bb
@@ -13,7 +13,7 @@ inherit pkgconfig cmake gitpkgv
 PE = "1"
 PKGV = "${GITPKGVTAG}"
 
-SRCREV = "658a72980f6e93241d927c46cfa664bf2547b8b1"
+SRCREV = "40ee5d3bcc70343af6c0300d71968858c1f1948f"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https \
     file://winpr-makecert-Build-with-install-RPATH.patch \
 "
-- 
2.25.1


