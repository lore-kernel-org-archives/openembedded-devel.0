Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABE1D3C52B
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:12 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12896.1765363447083347957
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=heB9F07X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9hAc3085408;
	Wed, 10 Dec 2025 10:44:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=JAGnKcFxTlrmqxdSL9ic8SolJDp4yncVBDX3ov4G4fI=; b=
	heB9F07XEsva7SUuusOtvO/P5lintBKxQ7NYidUCrlnciW8W+2FyYgxjS/jM/23x
	5iPxVCawzJLlX629L+MKax24qdPLdpXwTKnfe3ClFXW8HWoyH2NploYJA31JWlkl
	tqGxRQFg75f1Yt5F6o+BjxEmoTB8t4ePL4P5qsas+/rl6KvVoAog40HuL33j84qH
	xxYSi92w/xE1UWD0kwh7/ia9M3wu/Ouxc97hnFlWew2pE9naM7mlYTb7ey4aQUzr
	TYz509kkQ+VxgTzTQlWf5iaV/pkU9WgB5+Jxn2/ZDPv310z6nn/dFcITPCpJx+Wo
	ZVfzT4T/tR3YYOZWbT74iA==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axts7sx0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:04 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:04 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:04 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 3/9] upower: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:19 +0100
Message-ID: <20251210104325.175100-4-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4UNFtGqVKElnV-YNdcDNLjjazt8Fei6n
X-Proofpoint-GUID: 4UNFtGqVKElnV-YNdcDNLjjazt8Fei6n
X-Authority-Analysis: v=2.4 cv=N9Ek1m9B c=1 sm=1 tr=0 ts=69394ef4 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=n9SCklZpAAAA:8
 a=d_zq-5R5v5O3VGAzeD8A:9 a=Vxmtnl_E_bksehYqCbjh:22 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfX9ki2kYk0DxyW
 kCq07rW+sBoL9bT8eDtKJpNcssvTN264xk6cE82G7GYV91CWSKxrvwZ1hN+SVGL3UgBT57W6a0D
 vMPDbgF4xGfiv/j8xHQkHkb7996sV8nyshhvYE2EEQ4EroD2ywP6xxtFI09+oQX+QgY48bEB2ko
 ZQo7SPRSW6fFlHKA7ujWaz2eYVN0bmaaJBbKUHQ5gZMLltU3wnIyQkbLqRFR6RGGJsCmzlFnlT7
 3R00IBH8B4VM8f76oeO16yPmIZ1HDmgunGmmyCbbSMLxkWbh1jnbTzIekGQ0QiClIQIceNsYSlL
 rJpNmBqPpeTmBALPJamK/uKePQx1T+8LqE1BIAjRuI2jraO34989KQbbxG4iky+exIoPzStHhyS
 l4cA0oL0JQS5NajE86/XHKzFMj/BFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122497

Add HOMEPAGE variable to upower recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-support/upower/upower_1.91.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/upower/upower_1.91.0.bb b/meta-oe/recipes-support/upower/upower_1.91.0.bb
index 9d20e0a432..b81d0c2971 100644
--- a/meta-oe/recipes-support/upower/upower_1.91.0.bb
+++ b/meta-oe/recipes-support/upower/upower_1.91.0.bb
@@ -1,5 +1,6 @@
 SUMMARY = "UPower is an abstraction for enumerating power devices"
 DESCRIPTION = "UPower is an abstraction for enumerating power devices, listening to device events and querying history and statistics."
+HOMEPAGE = "https://upower.freedesktop.org/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0de8fbf1d97a140d1d93b9f14dcfbf08"
 
-- 
2.50.1


