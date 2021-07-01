Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4883.1625133433272261308
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Jul 2021 02:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=W2l1zvbX;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2816976379=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 1619nwM8010740
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Jul 2021 09:57:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com with ESMTP id 39ga5r9bcf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Jul 2021 09:57:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4ersuyQc2be84jeV77bTd30J27JrWsxndyhaI4zMZbwHzSzw55b5xf2/u5cNPYm2GMJEP9POWwSOzzI7DvmZSbu/GClp0XfwXHXfuZWdk0Ff36GuQpiq+EsQL291WZfzxZQuYhZFr8WQKvVnWBgPPNW9RZ4yN5eff8C+HVZmGCy3V17Et/vtlT1xTPLu57PA0PE5qEw9r2OexZjGCaLgEoZ7FO7gkDOOIEo/ds3Vd1k7gOFTB2JwjGcAjPKtBTDUGNbrg0R8m0XeIJ1BvcNeacpCIgLANAWaxh0waxml56U1+dTrSO1npmf7sWm4x6X/YmfBGa2DQH6oEWRIPOTMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDv3i/K0eK5GlgLM3EuOa00cPizFPLUy7AxSf2TIA3o=;
 b=ni8KIUycVui6JJhVUQN/i8G4jzTvT7dIVrgU4OTmJBb+vtGTpJUPL7tpOHK0sMIvDFO3jJ3YD/Anv+I6JrNs5ZWwDTX8VTRZ8Cwj9zgXOxfXNbzblKkwrwW8UlyITcVe9UyWsxRKNmjOocpxdgceYRM2u4QSa4wlN8QXZghmfjO1gfPaz6d92CFokKw0+GpJbR1Cx7U3klgxCFNxdOJAiVUmKZEa3QV7PEx66+UiC0Sm4O0RYHoLE2mYuvNBIPF01Z8iZfmC6f+ljBezeTvznHlPYhzWoXRF/9O9El4kLFGZR81J8gZK3HiKbTZHkJ1y4xiXbHPNYfsNh19sqGXJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDv3i/K0eK5GlgLM3EuOa00cPizFPLUy7AxSf2TIA3o=;
 b=W2l1zvbX/JtKwMmdTJfDhGIZsrWfjR5dCQIJTDXmju17WYzAAamM44Lg30trwr1s7LRoGP2P+cQZeLP3Gdkz9yNtZYjhKFXLbTypj7SESSgeYr4v8I1AmyIDl66XOCaP8b/uWge/D0yHUNAUKV3lFSl91+BhcvOmVdiQD1N6h34=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:96::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Thu, 1 Jul
 2021 09:57:11 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ca0:3d02:dcd0:626c%6]) with mapi id 15.20.4287.023; Thu, 1 Jul 2021
 09:57:11 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/2] samba: add missing runtime dependency for pidl
Date: Thu,  1 Jul 2021 17:56:59 +0800
Message-Id: <20210701095659.113682-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701095659.113682-1-yi.zhao@windriver.com>
References: <20210701095659.113682-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR03CA0281.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::16) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR03CA0281.namprd03.prod.outlook.com (2603:10b6:a03:39e::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend Transport; Thu, 1 Jul 2021 09:57:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51fa8f8d-4b14-4c34-7baa-08d93c76984e
X-MS-TrafficTypeDiagnostic: CO1PR11MB4802:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB4802A1C7DA616E0754A3E27BF9009@CO1PR11MB4802.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UvK+0aDthVlVnB41zv/PDetZP/cbMK0QJu8TMVy4y4TUR6eBHGUKOQBjuPJOAc0F087OXkxBhRrT5PSSGXcyXU0q+X8j0FNxDbSLq5pHCvxvzLQ2XnYxnTc7r9wE2IN4/RAW062YGPXSncuwWKOYgulJ3XDuIYb/Mw1WM7a30qGF8uw27hYMWdrVzjay9A7PmvpHLVs/RMHEvCIQab38Os5UqKw4vXL7yi9IBCfcecZJBVeumxpBdjqxTmFBkWD1C+ObTp5ndNP7ARf6Cy0gl3KWL8VHtSHGCdu99+lxvIsSzUonVTUrIgdGvSoXjZwyVXlwkRV4FWq/cYM76vBlYEBqzpuvlSc1MrxLvgL17qRBO0yFpJCvFVqunwo84cOvgnPUslsgRexU5hN2vCMLMFGocg0STZTNX2TVpblS3g45QLdDTBbI3fOaBHg1hfd7Wsw4kbEoLplAx3GOAq7uk3Rehn5I7gmVasIAlNYVnOGtqqEbgpFMTM9sCjwhMp/pIEzASeWjTPadaO/CqRJ7mCSEXt0kg4ksPLV46z5ntd2mMm82NWdopIcoR1kpzplSXaiCr+frN+EBLzH8v6JtQ5vxHE4vaW4tZvztZnlRhyeODxQ78yL/NSh55Wvgd3v1d69ivmUTckV7OqmKjwU4wT5ouOK88hja+1Au2Ax9eYgcArg3S4vUqF7n5kYDPYlcuuUk6pzlsZebNF3EGPMM5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(186003)(16526019)(83380400001)(86362001)(36756003)(44832011)(8676002)(66476007)(4744005)(6916009)(6512007)(26005)(66556008)(5660300002)(6506007)(6486002)(2616005)(478600001)(316002)(52116002)(2906002)(1076003)(38100700002)(38350700002)(6666004)(66946007)(956004)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sTjWtJXMSsNQdZmLUtpxrDmoqJnvZ/6VH4wEM9SNt23VFy9KhMQR12nUUbEn?=
 =?us-ascii?Q?HsPZi/zrqotlpxkWCB9WW7ALgdZGh8t03zSd1pamUIDHC/6looBCdkBkjxzT?=
 =?us-ascii?Q?XczVGD27kAXIqJkXH9tlqEfawY+0ox9gq2aO4zKkALICmXcr+KNMc9Nt1QmZ?=
 =?us-ascii?Q?zBsduYO4OlR1H4PDy2So3p5eVVWtMAEoTQVlxV0UFAXtIbW2i6xzsvhsp5MX?=
 =?us-ascii?Q?z639OymQ4IqEbgN6TpYI6zDNH3JKvoXRicBQZQeWDgCPhU3GZBybR3NfiDon?=
 =?us-ascii?Q?KJjGom6GXTNSp/OUDh+oNsWIG75bpVy+hgXPv5f4Q9Fzz6Aq3rmqkkjFTHQh?=
 =?us-ascii?Q?0505DA+XTP7BILkKh+7lcriKLuad3Ztppx817gmDGPzPaJTtrOwNZLKs/4qy?=
 =?us-ascii?Q?6stpvjFs0fMDZEWaah9Bp1IWnrArJIoYXCEAuiVZPspju0u3xCMxLXtPgHyj?=
 =?us-ascii?Q?6xWFHoWEL9TxXJFKsy3SyjtCc8FMGOdPGWWVa8/F268BeQ/mJGeK3EJYXtNM?=
 =?us-ascii?Q?ip6IbQsbeElKRmZ4oQBpwKu3XCNKGOwEl07Y2+jIixmjXlQbWMGaaI1HV1kY?=
 =?us-ascii?Q?6wzK1MZUQa4uR16gg2yRt8Qz2qve/M7W8m3ADK2fEOlScMKHKTrdE+CAmyeH?=
 =?us-ascii?Q?qSxX9eiOuU8FNSAcLFhmY0DChSrc1pJypfeYZhC/4xwCd0T5H5GitIrJt8ao?=
 =?us-ascii?Q?udV/HhCrlAytb02VPcnHgMJD60YISgBf0mj4NHz3GcQlo0LI8QU/Iv6UzEbX?=
 =?us-ascii?Q?jaRBDV3zWx++raTXntdUXpx1Dh4PjDQYcdObUr6gJ/AGyXQNyRaomL66mpfR?=
 =?us-ascii?Q?u9cTlwazrfFqY7RftnNphapDZ4PFoavBY5u+R/IEl5HjJJwUH9z3vxx8Dofb?=
 =?us-ascii?Q?uZ2QrS93y1JMjHzNGC13caxkfiA1wjBsOiISXIey59HuYRMo8viiqLX2zsKc?=
 =?us-ascii?Q?IE96CErhJLLKNO8qwRRLtZyO+hCx5APUv3ggxbGD4eJTm7YciScZdLicBxJ1?=
 =?us-ascii?Q?oetht5vo+x3w+E4dODMfHUD/h0XPGmHqlL4jcu8XTWgh46BaTXsTnsU1sqa8?=
 =?us-ascii?Q?wtoxUpvbtzUgvht6OJamhojFdnFU/naWVeMqXHsCVeHQz9EVeYzcIClX4Y8t?=
 =?us-ascii?Q?Dsbcyn84i1V/uzYzgxtkWwIwOmHBuFZEMy+/r2SfewofR1qlFYVbhxXObcKR?=
 =?us-ascii?Q?Atoi8iot6M8SZiuNyGtjHz7qyA65oYfsUldEARhUccxpBE/aIKS9ZLsWGBQR?=
 =?us-ascii?Q?ZTm0GhrUoFFBRs3zt+NhFMGDfzx48sKki5coYCA7TX5dhUHtsfIxzkwGJFQI?=
 =?us-ascii?Q?+24y3Mo2ntGF4AYN1F6q980Q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fa8f8d-4b14-4c34-7baa-08d93c76984e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2021 09:57:11.1332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aR31IkxfftXxpGdHco5nSLjfRaRf4VyHWEsmPVJqya3bnzy7DdAXHreE2dtGmSTODCzXiV8yYQpf7WxDMxIOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
X-Proofpoint-ORIG-GUID: R8jsM-J3yVfYljDyLP1jDzr-_T5cPT1H
X-Proofpoint-GUID: R8jsM-J3yVfYljDyLP1jDzr-_T5cPT1H
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-01_06:2021-06-30,2021-07-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107010066
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Add libparse-yapp-perl to RDEPENDS for pidl.

Fixes:
$ pidl
Can't locate Parse/Yapp/Driver.pm in @INC (you may need to install the Parse::Yapp::Driver module)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.14.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
index 49259c7e2..5c5ce3670 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.5.bb
@@ -316,7 +316,7 @@ FILES_smbclient = "${bindir}/cifsdd \
                    ${bindir}/smbtree \
                    ${libdir}/samba/smbspool_krb5_wrapper"
 
-RDEPENDS_${PN}-pidl_append = " perl"
+RDEPENDS_${PN}-pidl_append = " perl libparse-yapp-perl"
 FILES_${PN}-pidl = "${bindir}/pidl \
                     ${libdir}/perl5 \
                    "
-- 
2.25.1

