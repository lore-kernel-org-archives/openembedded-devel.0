Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56138C369D5
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 20:49:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.23857.1745747362814304960
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Apr 2025 02:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=621208ffe7=lizhi.xu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53R5w4l0012047;
	Sun, 27 Apr 2025 09:49:18 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 468mq19keh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 27 Apr 2025 09:49:18 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 27 Apr 2025 02:49:17 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 27 Apr 2025 02:49:15 -0700
From: "Xu, Lizhi" <Lizhi.Xu@windriver.com>
To: <rishi_devan@mail.com>
CC: <raj.khem@gmail.com>, <Lizhi.Xu@windriver.com>, <Rahul.Taya@kpit.com>,
        <openembedded-devel@lists.openembedded.org>, <ticotimo@gmail.com>
Subject: Re: [meta-python2][PATCH] python: the fix for CVE-2019-20907 is adjusted in the python2
Date: Sun, 27 Apr 2025 17:49:14 +0800
Message-ID: <20250427094914.4018276-1-lizhi.xu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329015102.1360744-1-lizhi.xu@windriver.com>
References: <20250329015102.1360744-1-lizhi.xu@windriver.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=KsNN2XWN c=1 sm=1 tr=0 ts=680dfd9e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=XR8D0OoHHMoA:10 a=tWSnqiNYWvcfZm9rFm8A:9
X-Proofpoint-ORIG-GUID: g_ICw-M_uPO2qHPPLKUKVph9i3XAXurv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA3OSBTYWx0ZWRfX16F3vbq0zahO 68Vk+HyxGNPjChOIftKUBU2+mU2s6qcUNpIMsjHJKyRubJLpeobnO/nGI5pvP7CwcScIRW9bWoZ burhIp9tZ8v9xnEE05UpvH5eBAFEZ7lGCmC0WrToIRg2WkpXY4zFIyqEr0nyN3DjBUbZwyO2IAI
 011XwQEHp/+GG+RV8x5ET0huWnkGVeuEFHcdD6xK0jzu4wZ/SHfkxf9++GJFgAKR+mEnDnCkcnp nr+n87za5EzSa0qMLjV5k3bAhBY/8TjxcGe8ZsGURgf7woWwVliG6lvYvXFb8mChhNG4SQNa+rL 6thVhe6IaHXyaGbGbHTLg/Z4ZGm5PH6mOaI32/QTmFdMYS1jkSDBVhwxTx7Lq+okoCRD5UrIBpD
 QsiXCkG0W0iFsnhyMqHkyfhb9hMF1YzeleO+HUtgN+45mVRV6AFTJNmQDSoNdcFQkCKITpVs
X-Proofpoint-GUID: g_ICw-M_uPO2qHPPLKUKVph9i3XAXurv
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=601 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 phishscore=0 malwarescore=0 clxscore=1011 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504270079
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Apr 2025 20:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117175

Hi Rishi, 
Have you seen the patch I sent?

BR,
Lizhi

