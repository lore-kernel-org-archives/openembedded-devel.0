Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D35D3B7FB
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 13:10:12 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7337.1765285797990532984
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 05:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=Bz+VTcB+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: prvs=24386082c6=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B92Vujs1844017
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Dec 2025 13:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=nUxdmYe5Y91ilQfIS4w7x2xc3ZuQHljfMnecnLfzNwY=; b=
	Bz+VTcB+qqNmgiNDjzxS316r7qM2x+OSwdcU3des+3qQ6vYWY7A+vDFOVL90wq6H
	/3eEmTw2m1gNUYHCtwX55ty3LvJ9NMFbFg0v0qMBq/4wD9JtQWxZXklD7UrQ9/Dr
	zbC/X3ahUSlrztOGNoauge90ExfCFVz0gE2G5dU0nFvIV5c3RKw2gOmY4orTOrhJ
	PtQxEsoPkRtMYn7V4yemiJWGZZQgMPVmuYjhPEKSYy89aozoY3Z7latzr96kuJGW
	e5g7A3l95792/HJJrXHYQVtvyxyHddR85BdWXBTxO/ipdVhjW55Swtclfz1pKnPU
	69caCPaMeAmm6lFFJaVt2g==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4ax6rdt8u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:09:56 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 9 Dec
 2025 14:09:55 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 14:09:55 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH 2/9] trace-cmd: Add HOMEPAGE variable
Date: Tue, 9 Dec 2025 14:09:06 +0100
Message-ID: <20251209130913.388053-3-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
References: <20251209130913.388053-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=OamVzxTY c=1 sm=1 tr=0 ts=69381fa4 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=n9SCklZpAAAA:8
 a=TefjB8TjJWhxr7rzY2cA:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: 3axRlBcQvY2V6feWUB9NJL5kepRjqMIB
X-Proofpoint-ORIG-GUID: 3axRlBcQvY2V6feWUB9NJL5kepRjqMIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA5NCBTYWx0ZWRfX83ybwpvwET5D
 +AQaZgCYAHWr8bQ6rA6j4JyQCBnX0qBIgrH+3me4mLmi8nCehbCsZlHWzyTIHCJ0kjW4gYgxlTD
 Izv20TqJfmitnXlMmDbHGVa+6A9uMWCYP9Bh8xNkdvPWwBFWZXlXnICbxvsHhjpMmrQbhs1jIvH
 6+2bhQgRZY0ftkJWm1LsKHuF56MP2I6kx8zAE2YH2Ia/R7d4oscH9M/8ZHFBG47QONjzzCpmllF
 lpsJ28SOEqPuByiecHV+CbQVkiIT2ETG0v3lG/aomKUa/VIDka9iXFeR+z+5MAs63u9GpOMeMzu
 ty6a/kyY8/1f7DXYSHVpLYYoJEcjzqfZ9HPcryX+qJLl9HqBWW4hDRa8CspwPqLme8sCwggwQCA
 dHCPH8Uj6Le1uUNY6bzlzElHUIEPOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_04,2025-12-04_04,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 13:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122448

Add HOMEPAGE variable to trace-cmd recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 38922126c5..6686f1ccd9 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -1,4 +1,5 @@
 SUMMARY = "User-space front-end command-line tool for ftrace"
+HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git"
 
 LICENSE = "GPL-2.0-only & LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
-- 
2.50.1


