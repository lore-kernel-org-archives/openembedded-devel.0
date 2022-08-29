Return-Path: <Saul.Wold@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E53C0502E
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 15:24:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.71831.1661786677290017260
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 08:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=jsazWZcm;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6240c2564e=saul.wold@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27TEwdPG010739
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=uUgJhZpGjVGZDhvmb0t4Q+1nW/ohXB5ZFyrTAUAEhPg=;
 b=jsazWZcmC7zOrsmF9sMC1rVZx+ve2tkinn6xApZ1aDorJFhucD35GVg3VS5P2DQj6p07
 TSRddcZyKcDjlCDAjp6HliVk1rzEdfpV/ngMXlbsBFwC4VDi0kaE8Z7jzV2MmAFc7B1o
 r8EvkWetklhgZ/Qm3S5C9Qy+VzACDPNRdnw8b0/gdoyjHw/L6uZmrTF2xvJf4OqNsDty
 bP/iZ28548I1cz5K0QnuZcOffij+Xuc0fht0ZuWgc3E92SvsuKPuATJyw3g7MJ1TIRTT
 EIMFEFElDy6RxH08XenYelHwFwzMk7tK77dPt9A0pOcVHKrvu3bJxUfxtn59Ou6I+qVc Dg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89hr7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:36 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27TFLMmO014844
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 15:24:35 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7a89hr7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 15:24:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LgVxTEUVy/ZQKUftH+X2V1lddy5a00U3YNb+EyELKhCKCEcbiT6l11eyL0mIVkT72dN1PlQzdM41sS7krbnwR6nXO38+PbK9WuTOEYBpXop6lPtxsxhzDnnapwG+32Phe34vl8c5V8PxGMo+SRDmATyay+xatN6+YlEMOhE5c4zpOMGDAKFbxCDp64Z5TItNwD+nTm+iVTM0f6THX6JHIZ7HL5PEkuB0X+WVQI/xbn/bz8ApDqAujLkKScLPWRk/GZgOWGfMXdLWGMUVjCZ/sx8hrXqFk2FpiCK7/wmhBinpn983DXjnRAEBZ4MTz0s5N2yyqdKnkPaO94IbRKzhLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUgJhZpGjVGZDhvmb0t4Q+1nW/ohXB5ZFyrTAUAEhPg=;
 b=Sh/zOCTR6HBXbQ70mOtZwB0QsSR3mQ6SVSfaja8XKRvrxM8XTeMMHh+XOeli12SXpBA6AKlLBy8icvv8tcqTiu1duNzRqxQZAlyElXBsPJZo4Es5Qj5OwUuTcz7MdG5N44Mk3uaPcMpNJkMkMM9ve4Z5o+2F47MzW3wzu8xlk6TQcFqhd3z4I+kasW7n8YOHzrNad8uwysTndJRDAypPQphbKySNTITZfB0XcuQtVJ0KJS2SKm46u3VOKei6kxReH3NtWt0SK150/IgqbkAkXaFRCQgEfKjAJBGBINM4pWXGXekmoy5oGw3YkxS20LJ8+oesO6T8Ijc9GFHafRYAqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB5818.namprd11.prod.outlook.com (2603:10b6:510:132::11)
 by MWHPR11MB2063.namprd11.prod.outlook.com (2603:10b6:300:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.16; Mon, 29 Aug
 2022 15:24:33 +0000
Received: from PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356]) by PH7PR11MB5818.namprd11.prod.outlook.com
 ([fe80::d5f6:1024:58f3:d356%5]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 15:24:33 +0000
From: Saul Wold <saul.wold@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [kirkstone][oe][meta-perl 07/10] libnet-ldap-perl: Fix LICENSE string
Date: Mon, 29 Aug 2022 08:24:11 -0700
Message-Id: <20220829152414.1757540-8-saul.wold@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829152414.1757540-1-saul.wold@windriver.com>
References: <20220829152414.1757540-1-saul.wold@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW3PR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:303:2b::35) To PH7PR11MB5818.namprd11.prod.outlook.com
 (2603:10b6:510:132::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70803201-aa7b-422a-471f-08da89d29317
X-MS-TrafficTypeDiagnostic: MWHPR11MB2063:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xqdxPjXdnrm+PaMUxk61wEVCCxCimZeRy9N0ZyGoOsaIZpbXZra0ZsbDEfhc8RZZU3Wi7bRisU7ku2qEfdhU2vwRfPpb2vyFP8Z16MGrvhKx994LepbkwpPNhPJTTFdMXmgiU5JnllwRvQUBpeJ4gxAj3dGVDeJTBh6Fn6cig7i7hQj6j254snM3vY3eRLHg+l/zmxCQgnTyjeGZsR1DGKmnRQgasrht6Yy0QIVsXpHIPzZRwqSnUjXyLN1iVxvcumWWJKZGh670f2cguEBnEmiLa1qw8JIXFXd+DaAxDVvNbQEUIimitTv0CX1Cg8z2VCBqOEU/I051Opyj6EE+/Ojdm6/zPOnwNmNe9ZV2lUs+wbTuZRJvqbVKhpaogRhNaiOHjLPilEu6JhWkzcnqiNR+OlOrWVqP1fLKQBpClEJGf5zIvDOYn+oUcY6/73mKG5vW12yBKv7Qbcw7AaEACwqSdJn1LxNEozykWTK1M8zHzYXRvr8e+Ss9RviGBygM4syoZtEvtfDweKXZqd9gWgFbs1lhqKCdpTyDuXTpo1HYzwBhEgnXxifJCwJLUmJveraVXA02k8/Bj5f6xPMKEe+kRqkWjURmAc6YqgWHm/jVJnLgQvp6k2buTx0Tvx08PRNqXfHzQfA1M8S5zoGQKn9WnoqKX8ltGnhnMYWHc5BQ0Kl8uxikeJw+tNNcfPH/g2omk59CNb4PXYSfrpPyjFI/sgs9VFJDPhZQsHHrrZsJgFkcZldsJRzKkGiDeOYxpezUrv5vigIKOzbOGH88yQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(396003)(346002)(136003)(376002)(366004)(2906002)(4744005)(66946007)(8676002)(66556008)(66476007)(52116002)(8936002)(6666004)(6512007)(6506007)(316002)(26005)(478600001)(41300700001)(6486002)(86362001)(38350700002)(83380400001)(2616005)(186003)(1076003)(36756003)(5660300002)(38100700002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?liGXK7rdw61qSsb6JKJEY3hNuJ3ug5YNDFRpRlE2XrcshV4lCNYM9MFohChn?=
 =?us-ascii?Q?0k8okppMSPuhMwIiiKIqSgd0kmrbvqi9WrVVq2zkQRCqr26F9+Tsf/+ZOMTd?=
 =?us-ascii?Q?6RIsvmLtl/dVc9CGpQw/+IED35+9LwSBZ4h5yf4ZqiHMiE648Vj90yvxbV2z?=
 =?us-ascii?Q?PtabvDHkEY6hSnDsn5+RTefQjCwm0q1zw+M5c7Oidyc33KxxR1eggUx66L2U?=
 =?us-ascii?Q?G1j25ubrZ83i9FOk8W27fnH04oF8oWG2Am1Qi/N598mhj5+xirXiegjRAp9M?=
 =?us-ascii?Q?ej+JgIB8cDTCmajrf6tMvtEMgWkmIh6eQF78YdM+lWQ8plT02LtkxUTd53Bf?=
 =?us-ascii?Q?3mJfNMMbKzLmTia01eVq3JCjnXIpKc/K6prQqJL+3SHDjge05TJfxPkaiURQ?=
 =?us-ascii?Q?Ctn9y3MUgtnznq8rx2h6wEJGqRTKexXS5iy36sYlelMCH6zgGyVr548xJdQe?=
 =?us-ascii?Q?Tjyta9Sr7PxjhWoBxSsHkSSCeIfdpLrLAyuNYtlPnnYkhGGKwfBLVfSv87hH?=
 =?us-ascii?Q?P33Of//KLypl/zpnAftyebCoklcFCoL4FIhs4JoMWdWEJbtQnjxIwhVhxW4v?=
 =?us-ascii?Q?Ecd9KK37kMQGsHE4yFEzl02FfwVlfidaGh2IMlSTVeknKxod3PlTxcYIVwnJ?=
 =?us-ascii?Q?mVWLV/t8V6w0sCZSJAorWI+A7jVbqLVLnpisQbLq+7D5orkYGdFDYdPg++D7?=
 =?us-ascii?Q?55uZjFOMwhoAk7A01sF4V6I+TEB3n9wrld/3BWM/PUIDg3JHIfBUuted/qh+?=
 =?us-ascii?Q?KAvofvvBe0Pv6FH+WUGr6ma2Oq+UkaqYfUxJlxah+rUHKqBq6y/mRpqDspvQ?=
 =?us-ascii?Q?CROOXoJcqIoxE0qpP4pqNMLTiy5pJo1043kG/okUYs4I63BY6kbdYcf7ut69?=
 =?us-ascii?Q?6V9n6F+3eipB0AJPXMZQpsDO77RXtgEpIEQgZ5Jr/56LJIMJOuizShXdHWl4?=
 =?us-ascii?Q?iT+GbRIciMgtSSvjK69H0XV9XzZxYympwTiGYSZ+Z2n/giFXlrxti0tJtk1m?=
 =?us-ascii?Q?NrUSy9yyNqkTDQM9asa0jrYm4v3kNtIHL2JTaQWRkioW20AQ9izvwRla3IVO?=
 =?us-ascii?Q?mpyJW7Xwvd2G874Nfn2E0dt2QuRxDlqlW3x2AFW1I1doX0HkrS4cXEM8mPbG?=
 =?us-ascii?Q?DOg8o2wZoduYOgQ8Bk4nHWqBG/UPb4cKHYxcdAV1eb3TrEleR8C0pAUyYcAt?=
 =?us-ascii?Q?OiGa11ViDqB+PiCL4L3bVKSD5vhXnLgAm86vz74TJRaUynoyhEKFbyC/qAFu?=
 =?us-ascii?Q?8Ifs9nIpNUq2e8HQam+Q7PqNDSeiIWns1ECJS5cTEkBCuGAWBPPnh5B1I3yC?=
 =?us-ascii?Q?v4NKpqGcOXSPAFDb46vlBeMepDsU25q/9KIfoZolxcIsWNIZ648nAkiaki1c?=
 =?us-ascii?Q?0JUgiaDwuqJG0GFmUCEWejWkRKagZamJsbRiqw+45OGbzAV7BM37u7yml2ZU?=
 =?us-ascii?Q?x3hmz/beUP7r/dak7+XOQohRbXeVQuyyyiQTKR+jWlTYmhDOEjlpoGxT+Flx?=
 =?us-ascii?Q?KRQSezReRhYGcqNTP7jZgHPeEDa1Uk1UHz5bFrnHMSt1UbNPWCigMzmBWeml?=
 =?us-ascii?Q?bUpVfnwVnmndywEEovP41vBcpz3O1P9+pMbbwyfZIt2eXaz61qGKMAyOkOS3?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70803201-aa7b-422a-471f-08da89d29317
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 15:24:33.2603
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 V4cwntXKb8dnGGnOhFGAlHqt828Slb5EcBsfQQYcCP1VBC5axGjbHbGWuAiNr+iBNR9tFNFXYJDgkuf7gp2GTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2063
X-Proofpoint-ORIG-GUID: i6ZLYLPaQJHru2PgHk6ufW49cwOjbaNN
X-Proofpoint-GUID: BQtcicyh9sFxsjtKNUgbo2rr2O8MPGLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 phishscore=0 adultscore=0 spamscore=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208290072
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 15:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98531

The create_spdx bbclass does not currently handle the lack of
spaces around the op (| or &). For now fix the LICENSE string.

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
index 293f42120..dcc5ea88b 100644
--- a/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-ldap-perl_0.68.bb
@@ -6,7 +6,7 @@ deleting or modifying entries."
 
 SECTION = "libs"
 
-LICENSE = "Artistic-1.0|GPL-1.0-or-later"
+LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://README;beginline=3;endline=5;md5=4d6588c2fa0d38ae162f6314d201d89e"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARSCHAP/perl-ldap-${PV}.tar.gz"
-- 
2.32.0


