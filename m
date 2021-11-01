Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B44C433FE
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 11:23:01 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.42352.1635765779298198384
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 04:23:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=BF1KTt1K;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635765777; i=@fujitsu.com;
	bh=2+nvf8QScy9ben9Rmd1ZDBKYEt0xMGi0S/wB9cx8LFQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=BF1KTt1Kctp2Rimtyz50z0nc66+Kja84nRoMn4SziEcf4Z/8DQuRAf3biZS8GkMBd
	 Vg0xkXEhsQgybywMZATn+ETliFyauYTCSq2mwjqPTf66Q1sZLKCL3DILLgn0hKSRvq
	 cZW/DsF8ysPysuhDo478DsWlt/cfmWXj6Gzob0V5pFteyGhoFezOhc3GOAb2bxU0E2
	 syKChCsUkuAFb+9vn8kqeG/ctHaKN9ulAAkm0d2HEfDV8lpUXYRW2TkdadmrVMdWzv
	 /yvNPbjK+PNWmtKR2S5R3L4TfDSFGrFgoRoOULpL7Zg6s2NUw9JKnGq/dg80XbA3Uo
	 A6QdPE8VHbkBw==
Received: from [100.112.196.248] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-west-1.aws.symcld.net id C5/5C-17294-11ECF716;
 Mon, 01 Nov 2021 11:22:57 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNIsWRWlGSWpSXmKPExsViZ8MxVVfgXH2
  iwf8FBhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8arRVNZC3o5K6b86mRrYJzC0cXIxSEksJlJ
  4tCWo8wQzglGicvtZxm7GDk52ATUJKbfusEKYosI6Essnb2HGcRmFlCRePG7hx3EFhZwkDiys
  o0JxGYBijfO2QVWzyvgJHH262s2EFtCQEFiysP3YL2cAs4Sp+7eBerlAFrmJHGhVxuiXFDi5M
  wnLBDjJSQOvnjBDNGqKDH7cjMLhF0psWp1H/MERv5ZSFpmIWlZwMi0itEiqSgzPaMkNzEzR9f
  QwEDX0NBI19DSQtfQ2EAvsUo3SS+1VLc8tbhE11AvsbxYr7gyNzknRS8vtWQTIzAcUwqONe1g
  PPn6g94hRkkOJiVR3qil9YlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhTzgDlBItS01Mr0jJzg
  LEBk5bg4FES4V1+EijNW1yQmFucmQ6ROsWoy3Fl1ZJFzEIsefl5qVLivFdAZgiAFGWU5sGNgM
  XpJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvMxngabwZOaVwG16BXQEE9AR+8RqQI4oSUR
  ISTUwrfd+Ja+pkJFWe1X4UYyeF9tDPdGke3Vqamd63e8HLPNmLNFRS5KcJ+zZ1TOp0l1+l4Vd
  jtQZmdlRn++a++svZr8iJHhyx3GRssXJj558dlOweiogn9q7uSZnfcrXe1O7TN6Vl324b7998
  xQT2ZXlW9jTZXvSbURPbc9dYPLyuEyB6bGzQkpRj87ctjq9S0Fni+ulQKtTjUIsV6323t/LfN
  ntUeLknaK23bovDrcVc6RNdXPfdMh8bVfflBvatxbvr9DveC907tL53ZyJGz02tttLx55dutr
  U1s1ptc1u3+nuO5+eXPXj58MJ/w94XjZdUrv08t8lUVvW/nXe9uJw4DZXlqDUhcs/VH55+mHu
  PSWW4oxEQy3mouJEANf0F0lOAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-287.messagelabs.com!1635765776!3435107!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5912 invoked from network); 1 Nov 2021 11:22:56 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-16.tower-287.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 1 Nov 2021 11:22:56 -0000
Received: from R01UKEXCASM224.r01.fujitsu.local (ex2k13_224.fs.fujitsu.com
 [10.182.185.122])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1A1BMo7v006392
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Nov 2021 11:22:56 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 1 Nov 2021 11:22:54 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] c-ares: upgrade 1.17.2 -> 1.18.1
Date: Mon, 1 Nov 2021 19:22:26 +0800
Message-ID: <1635765747-37718-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635765747-37718-1-git-send-email-wangmy@fujitsu.com>
References: <1635765747-37718-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM224.r01.fujitsu.local (10.182.185.122)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 11:23:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93695

c-ares version 1.18.1 - Oct 27 2021
Bug fixes:

ares_getaddrinfo() would return ai_addrlen of 16 for ipv6 adddresses
rather than the sizeof(struct sockaddr_in6)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../c-ares/{c-ares_1.17.2.bb => c-ares_1.18.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/c-ares/{c-ares_1.17.2.bb => c-ares_1.18.1.bb} (91%)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
similarity index 91%
rename from meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
rename to meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
index 2109d955d0..71c94b4ce1 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.17.2.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.18.1.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=fb997454c8d62aa6a47f07a8cd48b006"
 
 SRC_URI = "git://github.com/c-ares/c-ares.git;branch=main"
-SRCREV = "6654436a307a5a686b008c1d4c93b0085da6e6d8"
+SRCREV = "2aa086f822aad5017a6f2061ef656f237a62d0ed"
 
 UPSTREAM_CHECK_GITTAGREGEX = "cares-(?P<pver>\d+_(\d_?)+)"
 
-- 
2.25.1


