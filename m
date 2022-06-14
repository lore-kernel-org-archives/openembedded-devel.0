Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1892CCA47A
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 06:57:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3168.1655189848171713367
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jun 2022 23:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=A7kN7h0H;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=3164603221=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 25E6vQJl028000
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:57:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=6qzUzWagvEkWiR28xoY5Ro2RStCPDb6Hl601hnFib+g=;
 b=A7kN7h0HMaJpWLKz10ASZ2tff9aWdv5ZljIRVepQ8NyYkKxAN77AU8Tmzu73dl3U0XT1
 uDcc42MZ6CUTxZEbyjTFzlVkhU7wCZ96Iqz+vd5VzgP8F4HRAE1Tsg95HxfEWOZJ9uFK
 Q+Zqy7biqWxMDycblNCRUj1hwkq/no2qiPJHHo+goc08/kH7CPbj3oLxIOOMGLDzY1ah
 rMqql+VpsIh4ghuGjbFJdXEGf3jk1yUp0NJrsxpR4X6IaMnFMsGbYhhXjtrc/Cs+I1EN
 yDd2Umk7PaIi1a+XfL3NrEaUParOKI7HgDmFcB25MSLpkoM0ad5zeKkV5pCeEfWXlijt 1A==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gmg91t7tq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 06:57:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hk53qKs1qxCXiE6IqJs4XoBqYfAU3vQn2UMOBlqJlzCtHyH0dcXXBzjQDuOeqpOhlF2vFo7lfP7i/CmrwZxeiIeTmiUDvQ1z/l2WXQG6B6glIOW9bi+3XuYPqX7GhM7FPZJ7fVzL0lPibgxegaiw9GTpnxg84EuhZT4a4oqH/dNyT2ztHdLjNya5FgmgFixxMZ5mYw9ZwaJ1QWQzERGFOEx3eVNLBUyx0jE7OgHMeWqGpGasoN8Z1BDmhg4ao90eKHQ6+YZN6UNU1txs2VWZYla83aETLG/2/NSSrZkk02r0yB6BBRI3wpfZhQ4MP5jMYpMEWt2nmFtchaIiTt3nmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qzUzWagvEkWiR28xoY5Ro2RStCPDb6Hl601hnFib+g=;
 b=XFwo0NtzKO/Y2Mv+gmbQ0ZLWigCgP8IHzwXO899mS3fdj4rcc8xnrnrgOjkw0qz911xkZ7ZM98JBSz0M3i/KBuk9VxUcd6CcXonLbgCPuCY3NYODB2a8xK75LuvyP25MHjkWiCmaz8S2CILGiTf5txJv9QvWzGsSvgzi+POXCugNRxOKQsMIoGxeUtzEqq8gunNQFcIslXNyayJ++HDvsEoaJwYClXqV7/CI3lDcp82/YDnwpJ+EJ2l87+iFvBS4HJEIoMKRe0nmNAujrb9x0WPkOKJ6eVr+Bc2AQ/4EPSdKebI3F6wcGEqnPOjlFMxu9TE9kJLVk3Xav6n56PoJOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by CO1PR11MB5043.namprd11.prod.outlook.com (2603:10b6:303:96::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Tue, 14 Jun
 2022 06:57:22 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::f853:6ffc:1879:faa9%5]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 06:57:22 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] blueman: fix typo for RRECOMMENDS
Date: Tue, 14 Jun 2022 14:57:11 +0800
Message-Id: <20220614065712.986096-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c204e0db-e9e4-4707-8e6c-08da4dd3218b
X-MS-TrafficTypeDiagnostic: CO1PR11MB5043:EE_
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB504324E400CDEF2532FC8673F9AA9@CO1PR11MB5043.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	66jISaSaSQl1b/ncIsvpYOvQvcFOoU4e2i37r1aEHBmQBdgNu4Z5VrlDdyympXsdNUo4Uuh1chr/tSgSDcRWCcOEGC9IjyVRBMg+d9xSsULRfPB6HaEYpU4y9a5oXLtphrQleJR5lJlxsm6aldEaoGZxnSePDkkVytlQxs3Z+1W5vVj9STcIKJXGH4yR1h844NpwmwBbhxK87J3zxlSLgA/SxCLAR7wkjUWPX0pQAQakaVQ80XSQ0PjiM7G5KSMsAPFvS0L2+4Z4sUoJcca6uvKO97R8JqXQwIB4ixL/LcAE904Qtm1BjiiXd9hN86D/9Ii5Om2v07QniO/YAtsgHYPtcYm0HNtI/tcRdceDtMo86FRApTWxzah8AxwU/1pSZRFC0G7UHRxJO/fUlKhQa/48EDgWf3GD3VvTMwCIZbhZ9BQ4oc8v47qRNicA5WtgSsxjdPjLyvlEgH47qILA8zW4AfHTevMajQBBQO2n7XZ+FTNVaknaPwDjUQUfZ9V69pTJQCr3DRKs/iXMi3q+eKUZ5F8ihg+k+iiaR1Tny8oe5EY4OrPDfHQEg3P8I/MGX0Oq7l3N6BMh0vVnmsKReRxOy4dgAjhe4LcPCoSunCleHcWX5+h3M5xJPqaw8eFDGc4VlNNpNmZg3/+x6qUr8tiWuRmp1VYkxoEWPXPf8/76pNbrFG9vIGCPKYV+23rs4mMylfNn7N+erx9SUM3fqg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(66946007)(66556008)(186003)(36756003)(83380400001)(6512007)(4744005)(5660300002)(1076003)(8936002)(66476007)(44832011)(26005)(8676002)(6506007)(52116002)(86362001)(316002)(38350700002)(38100700002)(508600001)(6916009)(2616005)(6666004)(2906002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DUT40qh/uezEnciGDwjIOS2lWUKQhsMvGeGLcVVYiKhzzPhdYTHzyO1mSRdf?=
 =?us-ascii?Q?OVf51F6ONofoZ94cT/A4ArhyvmZ2PzmBTbOLf93F2UgBflMZAdrCTzxACiaa?=
 =?us-ascii?Q?E0ob2JFl2IycFk+le93VCA5b00/WDrssahl5Q7uZ6b1BLOfGQSzlBxKk+IfV?=
 =?us-ascii?Q?pAr759u7llq0KumfZ5+iCG0wWdPNDBDWalX7ktXGHhMgxUfrx19/dbxtaN/c?=
 =?us-ascii?Q?2irMN7r3FgFq+ojljdx8zA9ULn50k4gc+YGXakonlwNvhkPM7W7OeJMJCc/7?=
 =?us-ascii?Q?+DwA/09n49s2DzEVC95RDvh7rStnHU8pm4IG7b/ZT8GYvhTB2zZjpvciFhED?=
 =?us-ascii?Q?jY43823sTFO4poYjNfNO2r6zw215dRk5ylrXkR5Zj9t0rmLhO5eb47vUz57b?=
 =?us-ascii?Q?J9kIT1N0kg0o8pjjDT9uCgduL5DZZy5qR1MyZTs/575dkAa0asSPmMLbIHEG?=
 =?us-ascii?Q?739T/eLlumZpGEq7ro5K39gs/WoIrZsQJTvlwwf5RM/HinJY3uV4uW+ysjCy?=
 =?us-ascii?Q?2ZYrXLGAh0CnFgvJFyTddEMSXeS83jH7vV8JdVvKhHq59mjo0liXteT7adhA?=
 =?us-ascii?Q?AVlLiY1aGSZgHXQt1zWn4Ibzrd8MB6DNngKAm4CXImMP49Q6L9plwOZAiqCd?=
 =?us-ascii?Q?J/UN/udMBaM9+0dYzdQ12pETB9g+fWBnsVigH4yg0R5dRgz8T2DWlcy+K21F?=
 =?us-ascii?Q?SwhDBQELKSNSqnu8YgN3jy5aZcrAvRzsD9qI/xL5/nmVftk/6HOZYXR2AVv1?=
 =?us-ascii?Q?bp811XhFskTe4v2GAjFQF+bW254rtv8swFHs8WbLlqKLcLXkI0AFiWswALe1?=
 =?us-ascii?Q?BIbkBGF74MsiWZdbf8wx+53bkEe5SCV3z2KSVjvkBu3g8IAHOYSoH+i9I4eI?=
 =?us-ascii?Q?8dSNuIQlgOPKiWnn/Hne0EQhUKTpqdKWExWOc/AVJfuWhbHJlasAahE/nXbO?=
 =?us-ascii?Q?/ydw2llAC0OFBxCFlph9NsekAXIrmMexPuThhL+Bz7ttpwBd4gzsggHKx1fe?=
 =?us-ascii?Q?3mDG2IdgK0ffqB/9DqjPdNZ0yx6MRdFzowW/1qaQGNxy8EynHnU1ISuch31u?=
 =?us-ascii?Q?hcLvCfCE+3aix+wUl2RUPvEVP/G0NU4Dsq6bnM9LFcvHgFiXwu+SOLqGAuHQ?=
 =?us-ascii?Q?QJhxSPuK1Dhm9erNghyyhGS9rbTCUg0b7oze0ZQRJXEHaU0mwFuw0K8rahhi?=
 =?us-ascii?Q?unuwZC2peo/eC7ACKil2bWz8WABarv34pycygZFjtMAiPzsfznt4317VO2B0?=
 =?us-ascii?Q?3vqM8Fn3XS9fQAfbBmF7966cMM1h3i4vOE31uch27SwAwUbttyuOi27eTbKE?=
 =?us-ascii?Q?XpLzIS67dKNzbej6yfLo/k2zSfXUSGF0dkuYTuJ/YRrmJUL34NrX10aoFix6?=
 =?us-ascii?Q?8b3Y4MH7XvHR5Ls2XnmR/KaL9F0g8DTDI+cu4lo5LmyV883Kpm+ausnEb2xv?=
 =?us-ascii?Q?URFqr4Ek1D6pitNOQ16kiYg+qPA1g5LuJ8qEMjfd0TWZQWzvulNoD42Bf+vk?=
 =?us-ascii?Q?Istaq+u3YIM9tIa2EZugG7asSs+mD6r8ez50aET6AteaCQy4H494ne1M+n0h?=
 =?us-ascii?Q?pxOyWbpdMLO672vDnrlu0XE3gags3BfaPnsct+PO381WrD8BHVpoYY9fksTT?=
 =?us-ascii?Q?4URiA1kX5unbHlOQP+tMIhaRVOuaTpy3/qr30/DsqGIg5KwEJv57uGujagG8?=
 =?us-ascii?Q?/i+xueQelqC4uKrCE5Z0Mjj5v4Hu2WERvhpnrhGWEVGW2hNZOlV/L3WQrbd1?=
 =?us-ascii?Q?aMbSPEeDjQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c204e0db-e9e4-4707-8e6c-08da4dd3218b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 06:57:22.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6ICH6XDswbQndpX8vPrAPH9KAG9tua/kt7DidnrX4BM6DWttdutuKm6yqBUQBPJiwTCQBAG3HwS9+Gekxm1UoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
X-Proofpoint-ORIG-GUID: RJeOvJhAP7_90pyBxeVfGgERDzXyhXHD
X-Proofpoint-GUID: RJeOvJhAP7_90pyBxeVfGgERDzXyhXHD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-14_02,2022-06-13_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=331 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 06:57:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97505

RRECOMENDS_${PN} -> RRECOMMENDS:${PN}

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
index d5aeceeb4..119752086 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.2.4.bb
@@ -19,7 +19,7 @@ EXTRA_OEMESON = "-Druntime_deps_check=false -Dappindicator=false -Dpythoninstall
 SYSTEMD_SERVICE:${PN} = "${BPN}-mechanism.service"
 SYSTEMD_AUTO_ENABLE:${PN} = "disable"
 
-RRECOMENDS_${PN} += "adwaita-icon-theme"
+RRECOMMENDS:${PN} += "adwaita-icon-theme"
 RDEPENDS:${PN} += " \
     python3-core \
     python3-dbus \
-- 
2.25.1


