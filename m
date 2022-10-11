Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB89AC433FE
	for <webhook@archiver.kernel.org>; Tue, 11 Oct 2022 13:30:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7249.1665495024941634694
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 06:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OChIkHw4;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=72837d5d43=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id
 29BBQrwt021883
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 13:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+dmAbFWAsyLOc0+zumuuOuS7GTe619+KdtrxX/Qi56c=;
 b=OChIkHw46cVlg66Cg2E7P+lboZCSq5MyluWzd8NuXwxcGea6PbxSFJ/D3QJXzeckBhZI
 kl6+ykdRf0aocMlbkjT4F82Pd7XcctyGDMAbO8FBvfvp2n6Kj6zL6NtAVE/lZdtNtbsd
 VahkH3bK1pmLUzZcmH5aGLsUWaygNIOrcOzq+JiM6sn++rrQzvNbhlfsTnVAl0pgYzgx
 3XHAbtLQSLcbdu7cTIDEgdLdb9dWX6M+b+V7lLMd+snvT58ORZDI0bd74uA0yg3t/IvI
 OzZkqgMtcwNiutgzBdJcx+w3h0dU3JINZWf4K3ji2hX0fl0uB+xhvxSOVFQfRCCWM7gy wQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs2brd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Oct 2022 13:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dNaF5Z/cHi6N0e0ie8KwElryTH4rlge27GrgjKLO2kK8D542d+HRt5HqLsQr3lGfHO127sWrfqv657KO57IT0ofTW/hoWDSu9qKbIro9aJPqLbjAz4kTMVUUMRJcwv+dccU3x8FEO0Xc5wTHkr0/LPmD13CFij/xD4Cs+0KAhH7K5SBb6tvh1T17YEllB6EcBfq9PuTgA42li3iWDsClFxSdEc/QH8b2suqu7ZMMkjTIENV6lFbng9+sEtVIfYTUbKjHrQxav29QaSjkj8XMHZma8Lpdz5WLsg30tVxNctcBoJGjiVH33Ux4JWWgObZGtg5/aNUCkjnnFw82Adzuyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+dmAbFWAsyLOc0+zumuuOuS7GTe619+KdtrxX/Qi56c=;
 b=SOCWwJsOw3SzltJpaaVR9d8wFESVVI5SUi96+tln8uVqq+sdf1gO2Jf4vlzWHJ0s4RvX0O60tP4ecJhiHzzsxHpqs/IZaOA/HQwb54UOnAonYu+Ae/2fSIPj8yJK1Qxh2pTj1tAk0YPsi4sc8byj2Z81JZgsvMmZq8dhLqlmXD0PoT/kE5fGh8kI/JrnFnxB/+sYKMqi+/xl7orlC/POx6WRHUWENASQu5GzTvCRNjgt4xUcf7+ck236d3FLqVMofPD21TlCoXzZ/qexzKxOppKyEJvCCrlvwlYNo5H+DOzpllVufVhB+RRWsdyzZFrk9T10wgzVA/P9P+a25TMzuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN7PR11MB6921.namprd11.prod.outlook.com (2603:10b6:806:2a8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Tue, 11 Oct
 2022 13:30:20 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ad2:95fb:73d5:35ae%7]) with mapi id 15.20.5709.018; Tue, 11 Oct 2022
 13:30:20 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dhcp-relay: upgrade 4.4.3 -> 4.4.3-P1
Date: Tue, 11 Oct 2022 21:30:08 +0800
Message-Id: <20221011133008.1048028-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::10) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SN7PR11MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ae0f547-fe76-43a8-5f5b-08daab8cbe22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0cxABkY35FpSw0zTCuc/T7JQ3fG65welrbSJ4whPzv6PlzaUmQBT0X8HjQN9IcKXfVFKsWTXj+/ZR11cfqDEtZwOehQm9Y0lHvw3JT+t3soZuiSL9aTf93D0rJMYnlJUOkNDn625HK9Wp5FEzTvWJt6OqNKcHpoeN9ltNQeS7XnvlyyG86WTdmTeWCdItVOwd7y23mhUafKx/cPcegse/r4uEDL+0fu1UkyfC1X7rw1tv5GT7ZwhITmRZfb5qwCSUHb7clxJluXZNIMb/jidh7yziFlMJ52kBEQxPIo5PjFsq56DEJ6ZO578Xlo1OWpzj1UZC/V8+4hnW6FnQ+Qm2iT44R9edwGs6SXm/SMfnYCIZK4dyYDMmipTkKzFLa14VX1J+StVd2UmT5LibxSHRqcSRi/hZe4TIlyfvaOw8fWvE851Haiy8qMdC8BYpM3pVCZWwnq3cvYMAYsUsvgHhoZhNTop5cum/N0ge+nmY9h9jXhA3ODVI+18mqoTmhr+7PQy2qeezCoFBKWIsK83DDGc84ZkOPJsw7OxF0n8YE18MxIRYzEAFpknqhpa1rPM/vSWep22Y/2sFSEkftJJ4VqnzICFUGX8UlGl3WKRWCKOvb00irxvAJ1UA5Ylik+UBggAm9wqILbGN5QCKdaRPRwgi/9vHzEE5kKdkhRz652nV7+taK5g0aZl3ZWM835ymU/h5S1HXmcQ32PyURX+LArGcf6vDgLDsNwkGx6xBq3Bn8hRf+ZgXFyQA1uRRHZX+ZuAT42fnr6wgKQS84KgdfBVGVMWGlw0r7yeGuf3Pl3X7xGTkOqPm4lHI4UXv3keuUMs7/8NQEO/+3en5LB89A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(396003)(346002)(376002)(136003)(451199015)(1076003)(186003)(2616005)(83380400001)(38350700002)(38100700002)(5660300002)(52116002)(2906002)(44832011)(8936002)(41300700001)(6666004)(6486002)(478600001)(26005)(6512007)(6506007)(316002)(8676002)(66476007)(66556008)(66946007)(6916009)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?St10nKhUaPdBqmNlMmvl6tYTADAEZwwoAhjqqiQj7JCwxYhtgb6QuwHxpKCn?=
 =?us-ascii?Q?RBt7MCH2lHSlYY3KkqI7MX0rkfQrF0fAGYjTj3hqwIhKB0LrBrJOJMWFWNF4?=
 =?us-ascii?Q?nVTQlOdlz1n35Ya+3a0I5sLR/9/tt4iImqr2C4nx33DCzPJHH+ZXNjZNY7US?=
 =?us-ascii?Q?BuXZLHXwAv4ayGr3pqi793AVF7+SSrp1PkNB1BoQR0GyuaylllTBTksBifN2?=
 =?us-ascii?Q?kRlT302fyK48yIAgumJT+EPQGf+0kVrq5Fxqe1H8Ar8kQubaO/QAvfbYF0nD?=
 =?us-ascii?Q?7wUZ1f20nR+TU0SQ5ApGuGtyG+OGkG7w/V3c956AoczhznUHmKbKOaEAxLL/?=
 =?us-ascii?Q?yt2aBG8TwYx6+aU5iWe9s//H7dJb2MX6tJpskDOOpP3u2OvjhjxVmPrY8eek?=
 =?us-ascii?Q?MqT4zpGc3f/j4UVdAf7v+LRM3bSI3PpvopdcUJqaVdGazpAOENyil4EicBOs?=
 =?us-ascii?Q?h45rK0H52sS/wtxAmpmQGaCJPuf5ZPAEU6hqxFWpefvj00WiWNUboGUTZEmI?=
 =?us-ascii?Q?Wya3+ib2sHp/sqtWMsMp3wh5y6qxTv/yVAEMQGCrPfDzizYIY2C1HclEwJjp?=
 =?us-ascii?Q?SdtQXxyfDvX9B+3nKVGSiNVkqX/iI4MLXDrLUz/7/elXgkVaAFL4vV5C8FJk?=
 =?us-ascii?Q?eAkHdBZpQrVXZxCqqYOBrBRg1KsRpepW8VL5eLk/ExPdPpOUzmLRfIunHGXY?=
 =?us-ascii?Q?7KftgZv63gyDkwtajYVOBniV536UGMhB7zo6WEneh0N88ULi9GPEO2SVi+tR?=
 =?us-ascii?Q?kIQiHOWVNZkyscXm7qkDI0FwKahU2pPRsfskNBg+t3UBZMb6RQa8CBW7pcru?=
 =?us-ascii?Q?eACYbq5kgIFalgKX81rCNw6edNsy4KrYlPxTmCDxBPwjcqPQzOIg2Xsf0Qe+?=
 =?us-ascii?Q?dzIMpJJFWDMywMyL2dAgrwiuW0i9WOlgd/ZeSbXJckgUQRLgmJma2agPDFQi?=
 =?us-ascii?Q?OECJkoA5RZkjOBSBJgq9ps+HuOj5RjJG3LkalOdwmnX/8S7oowEvJis+Auxk?=
 =?us-ascii?Q?cGr9YoqVsEndRY9tdTacBRwHpYpES39FkYvFt2GfxEjELkHrshW5vgYIcrM/?=
 =?us-ascii?Q?a1qZQlvqKNIct8R6xDjWKUPkTNL0FNiQPJ0Ahu1qox1+RzqVPmNphPdQgZDT?=
 =?us-ascii?Q?amhOmmfIs6eWqkIByGulonamSPBPD61qvnQ97iKcSvU3Cu7WI7eisH+g11i3?=
 =?us-ascii?Q?OUOmZLYmYuOjECdZD9lz42S3zHU7Mo66ZaDmC3/7Veg6T8pJT1380lI3NqtS?=
 =?us-ascii?Q?MYtmpve9ABqVPvD3J3+iRicw8+hcRBPjcEPO+ufhioFKtTmPHvlPRrss852Y?=
 =?us-ascii?Q?P1r8l3nI/WZ+8wga87za7gd7Fbh3F4kvsKkbBOj5ATR5KdC0C6vf6tIoBApP?=
 =?us-ascii?Q?/IHEVVVq+D9oTQBxve5bK26Rv/vHWjn5WyKBPBn5a00UMrUB5zI8fELf8hBs?=
 =?us-ascii?Q?St9SucaaZiDq2BqrKwbI7Ih7orGieKCDce16me6XHTXcvYKLxc6MPXyEUWlO?=
 =?us-ascii?Q?MdIabwL+TM3s4uodC7r8RR7WXrQaJyJVusl1GRINQOJx+j+woTFnbJmB1fnW?=
 =?us-ascii?Q?41F5S9r+IB+4DBmMXJyuz2toYYOThyipy2Vc16ej?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ae0f547-fe76-43a8-5f5b-08daab8cbe22
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 13:30:20.1604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cPshxJnKf42jvyB9/X2tUGjpONY1T3RNImiX/xGd0sMSiGw1kxuBF0sSM77PUUqolVPaZtFqGMc8i+tz9C0dwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6921
X-Proofpoint-ORIG-GUID: KwOO2oWUoiTyqXpDVBUFwt0mOPeQxYMC
X-Proofpoint-GUID: KwOO2oWUoiTyqXpDVBUFwt0mOPeQxYMC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_07,2022-10-11_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210110076
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Oct 2022 13:30:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99139

Changes since 4.4.3 (Bug Fixes)

Corrected a reference count leak that occurs when the server builds
responses to leasequery packets. Thanks to VictorV of Cyber Kunlun
Lab for reporting the issue.
[Gitlab #253]
CVE: CVE-2022-2928

Corrected a memory leak that occurs when unpacking a packet that has an
FQDN option (81) that contains a label with length greater than 63
bytes.
Thanks to VictorV of Cyber Kunlun Lab for reporting the issue.
[Gitlab #254]
CVE: CVE-2022-2929

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/{dhcp-relay_4.4.3.bb => dhcp-relay_4.4.3p1.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/dhcp/{dhcp-relay_4.4.3.bb => dhcp-relay_4.4.3p1.bb} (90%)

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
similarity index 90%
rename from meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
rename to meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
index 92c648708..2fd86bc28 100644
--- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3.bb
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.3p1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c463f4afde26d9eb60f14f50aeb85f8f"
 
 DEPENDS = "openssl libcap zlib"
 
-SRC_URI = "https://downloads.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
+SRC_URI = "https://downloads.isc.org/isc/dhcp/4.4.3-P1/dhcp-4.4.3-P1.tar.gz \
            file://default-relay \
            file://init-relay \
            file://dhcrelay.service \
@@ -19,12 +19,12 @@ SRC_URI = "https://downloads.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
            file://0003-bind-Makefile.in-regenerate-configure.patch \
            "
 
-SRC_URI[sha256sum] = "0e3ec6b4c2a05ec0148874bcd999a66d05518378d77421f607fb0bc9d0135818"
+SRC_URI[sha256sum] = "0ac416bb55997ca8632174fd10737fd61cdb8dba2752160a335775bc21dc73c7"
 
 UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
 
-S = "${WORKDIR}/dhcp-${PV}"
+S = "${WORKDIR}/dhcp-4.4.3-P1"
 
 inherit autotools-brokensep systemd pkgconfig
 
-- 
2.25.1


