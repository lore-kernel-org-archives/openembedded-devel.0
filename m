Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4D95C27C76
	for <webhook@archiver.kernel.org>; Sun, 22 Jan 2023 01:03:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.10286.1674349433607594233
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jan 2023 17:03:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AlDBU109;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=038692d17f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30M10ILD012553
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 17:03:53 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=q+gJJLF14NuA9OczqTCDiFCRDZzvuqVvjRqmKStWtsg=;
 b=AlDBU109k8OaWcZ+7bY6BwOON0aRq2MVOHiIhyAJgZm/eeL63usLpvG5plYZrrQ1hAwy
 9xf7Mb8cNuDXDF7JUOZT2BlcWr9M05B9l7VcYywgWb6xdi2GEVdMo3So/o+cHuEWEL8f
 6gZtCEiF4IJcYXJcyYk6yZdMeThEZiQP9rG3ombzK/sownJEgJpp7aAGu8w5779lbdLT
 86NBmjHr4tbX2XoHfL0GLEGn+QTRhYoMy6Of0MYztnDk+nP+1691UYLuGbTHuhX0BZW9
 uM2PslUV8DdnDdSebPvcjJgbmej7TqmD9/5/+9dfhLeelSfnvKo5rhOUsGojjx8km6nC rw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n8geqrfpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jan 2023 17:03:53 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Sat, 21 Jan 2023 17:03:51 -0800
Received: from yow-fedora-builder1.wrs.com (128.224.56.212) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.17 via Frontend Transport; Sat, 21 Jan 2023 17:03:51 -0800
From: Randy MacLeod <randy.macleod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/2] rsyslog: update to 8.2212.0
Date: Sat, 21 Jan 2023 20:03:51 -0500
Message-ID: <20230122010351.2741378-2-randy.macleod@windriver.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230122010351.2741378-1-randy.macleod@windriver.com>
References: <20230122010351.2741378-1-randy.macleod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yVlDy_4hFDSq4RcfK18PyZb_jB5zidju
X-Proofpoint-GUID: yVlDy_4hFDSq4RcfK18PyZb_jB5zidju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-21_17,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=962 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301220007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Jan 2023 01:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100698

ptest results for qemux86-64/kvm with extra FS space and 1 GB RAM:

   Version | Passed | Failed | Skipped
    8.2208 | 465    |      1 |       5
    8.2212 | 470    |      0 |       5

Signed-off-by: Randy MacLeod <randy.macleod@windriver.com>
---
 .../rsyslog/{rsyslog_8.2208.0.bb => rsyslog_8.2212.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/rsyslog/{rsyslog_8.2208.0.bb => rsyslog_8.2212.0.bb} (98%)

diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2208.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2212.0.bb
similarity index 98%
rename from meta-oe/recipes-extended/rsyslog/rsyslog_8.2208.0.bb
rename to meta-oe/recipes-extended/rsyslog/rsyslog_8.2212.0.bb
index 5b30ecabb..ed65bed0d 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.2208.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.2212.0.bb
@@ -31,7 +31,7 @@ SRC_URI:append:libc-musl = " \
     file://0001-Include-sys-time-h.patch \
 "
 
-SRC_URI[sha256sum] = "14de68e7b8e5ab0c5d734f82e2dc9fff22cd7f4710ad690727eb10a7b9b3df5e"
+SRC_URI[sha256sum] = "53b59a872e3dc7384cdc149abe9744916776f7057d905f3df6722d2eb1b04f35"
 
 UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.39.0


