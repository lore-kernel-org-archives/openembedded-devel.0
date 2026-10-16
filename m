Return-Path: <yurade@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BE2CCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 06:23:35 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15945.1792131805649821057
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 23:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=K4TUinfW;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2173; q=dns/txt;
  s=iport01; t=1792131805; x=1793341405;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tYR/fMdrAsjGHHF2U/G8qbaNevM7geYq1qtlS1IO+J0=;
  b=K4TUinfWrq5SQbcqDv+pEoJdfklrcLHHoKBz3uYYrGfrDS1uqKh5QB5m
   MDGrrDLne7C9M7uaf5D/KprapCU6YkhRU1jPaGD/FL8sKFHcBJBvBYsj4
   XqxCibsvDVIW5lZkvClkNydxnwzPDYujgFkp+yZZ9kQgP0U5p2FPflLXP
   jSlMn/0VSJF2DrYF1EwMamBAfkdLsR2olw8hdSgBw6nF/sTHt1BqSj1iN
   dCjzZXfiU+RlUAh9FL140qI1LSZ9iv49E5OSALbcJxBM/WQhqKaYsDA20
   h/xUjCTf/vuVJ6RACJPCbHPzqzhXnYbpoufuMbCDgkEAV7c6jGRn/oTqQ
   A==;
X-CSE-ConnectionGUID: 0bFZce7eTXWvoDyeO/6mnQ==
X-CSE-MsgGUID: qiLLWMdXS6GzWMZScLP2Iw==
X-IPAS-Result: =?us-ascii?q?A0AaBABfwdFq/47/Ja1aglmDTGBDSYRXj1KgQIF+DwEBA?=
 =?us-ascii?q?Q83GgQBAZMcAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZckDwPARgBYgImAi0dAYMoAYJ0A70EeoEygQGDKQGBVNlKgXQVgQouiF8Bh?=
 =?us-ascii?q?QN2hHwnG4FJRIQIdoUQgw6CagSDHBKXIUiBAhwDWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XL1gbBgWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsN?=
 =?us-ascii?q?xUZBD0BbgeSFB6CZYEPgleldaEPhCiMIpU6GjOqb5kIpAxNhGmBagE5gVkzG?=
 =?us-ascii?q?ggbFYMiCUoZD+B+JzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:bDHVKKqEdR1veLZQ8ZSU+IFzvg1eBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnTaK6ONGH2eNEiaYW0phtVupPWmtVnHAY/rCk3ESpH+ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfvb8U035ZwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0r59L1NF+
 KMVFAAycBevlu+Rh+y+TNA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Xo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LUvrSn8/w7pX7WyxFsluZqII84nPYy0p6172F3N/9J4fUHJQJzx3Jz
 o7A1334JjUlEdCv8mSq4E2JtNTEuRuheZ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YcLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:iZrjzKjlOB+ndvlV6cOSwaBi53BQXuwji2hC6mlwRA09TyX+rb
 HKoB17726XtN9/Yh8dcLy7VZVoIkmslqKdn7NxAV7KZmCP0wGVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gcSVbSO09QYKcemsAJsQiDtENg==
X-Talos-CUID: 9a23:W3vPbWBSREJnNS/6E3Ft2nwfF58oTk3i0nD8MkKfTjhsToTAHA==
X-Talos-MUID: 9a23:QBmLrgbbQEibOeBTrj7IoA5HOPdTvYu8N2U/qp4ig5OlKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536194939"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 06:23:24 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id BC80C1800037B
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:24 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 62471CC1611; Thu, 15 Oct 2026 23:23:24 -0700 (PDT)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][wrynose][PATCH 0/9] python3-pillow: Security fixes
Date: Thu, 15 Oct 2026 23:23:14 -0700
Message-Id: <20261016062323.251925-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 06:23:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131055

Backport fixes for eight upstream security-fix patches covering ten
CVEs to python3-pillow 12.2.0 in Wrynose.

One upstream commit fixes CVE-2026-54059, CVE-2026-54060 and CVE-2026-55379.

The series also marks CVE-2026-55798 as not applicable because it affects
Pillow’s Windows viewer command handling, which is not used by the Linux target.

The series updates the recipe to apply the fixes. The patches retain upstream
references. 

Yogita Urade (9):
  python3-pillow: Fix CVE-2026-54059 CVE-2026-54060 CVE-2026-55379
  python3-pillow: Fix CVE-2026-55380
  python3-pillow: Fix CVE-2026-59197
  python3-pillow: Fix CVE-2026-59198
  python3-pillow: Fix CVE-2026-59199
  python3-pillow: Fix CVE-2026-59200
  python3-pillow: Fix CVE-2026-59203
  python3-pillow: Fix CVE-2026-59205
  python3-pillow: CVE_STATUS for CVE-2026-55798

 ...-54059_CVE-2026-54060_CVE-2026-55379.patch | 168 ++++++++++++++++++
 .../python3-pillow/CVE-2026-55380.patch       |  62 +++++++
 .../python3-pillow/CVE-2026-59197.patch       |  74 ++++++++
 .../python3-pillow/CVE-2026-59198.patch       |  57 ++++++
 .../python3-pillow/CVE-2026-59199.patch       |  84 +++++++++
 .../python3-pillow/CVE-2026-59200.patch       |  82 +++++++++
 .../python3-pillow/CVE-2026-59203.patch       |  45 +++++
 .../python3-pillow/CVE-2026-59205.patch       |  66 +++++++
 .../python/python3-pillow_12.2.0.bb           |   9 +
 9 files changed, 647 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59197.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59199.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59200.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59203.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59205.patch

-- 
2.35.6


