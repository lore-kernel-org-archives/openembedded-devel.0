Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E12DC4167D
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 02:20:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3550.1702508792445768730
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Dec 2023 15:06:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PRJ6uDId;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0711bab2e0=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BDAhT0N005136
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 15:06:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=xrbHS+9Sr8l3W0aI1Z
	ZcIwHW4Qc+aUJHuiZllkPrEug=; b=PRJ6uDIdBTrLihRg6BIn2DrBApheR0nA2r
	fjA/MJ0T7F16oQMUmaNxQgcH0gX5qOuCsLVv3KzO4CljwcXDOHi7rz4lPiDCLcn6
	eW9E0RTd3komKGb+DqSrzzsVqJ21/Y4pu8Ktz/tIob7Xn/XYOAcAhQc2GeTaN/mJ
	NKbZEEjdaMAv14oPIJufHSh5U7vBftrcuZNaiefJJ7Cq2i8jofLgWYQ4P0QoB+wl
	lPdG8oPUmdIzBy3Px0+c9KsyBOrEAezNdV3SuKU2/DaZzSN7gtZnTdy0m6yZ9BZB
	KqIJ0dY5u08qai7VaJDJTzCvC+HHJIvb9HBjboNFAZysP1qLfY7g==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uvmd4cf4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 15:06:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vq6oG66IEcDEL1kyB9v2CjyhNcUTIoZYBb0bxA43rTsI7OoqDRpi6a76uBhYkEApAPDgoixlKYm7S1OXYBHquEhn/OVaon2Iu7WCmZB9RILVw35i2JKhfD4Z5UL3menjboT0ebrz2Ytx4Ohz2Ibw8tP6hfsgm2OfTx5FCiY0oQ0Txa7AGejT1GYUOWGHv2D6xopoc3BQC6apqialqAVauPaN5h4kM9uDbBcACCv9XahWudFH3V4hjO2y72t4drJm8Y4DSdLODaLndvlq1imdl3sLJ2SzFyoeEaqMdgTD1cKI1JYf3HBinSVeocFD0mUthUiFlI/SglH2Qjfytp36vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xrbHS+9Sr8l3W0aI1ZZcIwHW4Qc+aUJHuiZllkPrEug=;
 b=IUwqR+ZBGfaP3Qe4i2XxNq26Kdh7lvPlCB4ScPAftiAHt9QhrBnpVk1wWTvffP+LvqG0dRPiuWE52jjk/0mMJlnYZMc+jZdZ9HNky/4HVY2mXs6L/jbyD2ML30FBALNc6+V+CsPVE99Qj0haTEW8H5Np92mNmqRH5WSiAnLV0Myfuh1eZPJ5vLqfzmGAPBoAC8gNcp2zqQYiydDQMKRGzzxmlVQtV3+CURhuw9U0YVtjttvb3b1OcBw6tD0POmf/4Y6aYtLdlqnKBvljbxM+E2a7ok5/Ve9mKVLq4PXbyNIZq9XrUVFzib3YmWm00l1EPRQUrmsgS6TBdzZP+HSqYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY5PR11MB6342.namprd11.prod.outlook.com (2603:10b6:930:3d::20)
 by DM4PR11MB6068.namprd11.prod.outlook.com (2603:10b6:8:64::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.33; Wed, 13 Dec 2023 23:06:29 +0000
Received: from CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df]) by CY5PR11MB6342.namprd11.prod.outlook.com
 ([fe80::dcd6:34af:90b7:15df%3]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 23:06:29 +0000
From: william.lyu@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] networkmanager: Improved SUMMARY and added DESCRIPTION
Date: Wed, 13 Dec 2023 18:06:13 -0500
Message-Id: <20231213230613.253946-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: BYAPR11CA0072.namprd11.prod.outlook.com
 (2603:10b6:a03:80::49) To CY5PR11MB6342.namprd11.prod.outlook.com
 (2603:10b6:930:3d::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6342:EE_|DM4PR11MB6068:EE_
X-MS-Office365-Filtering-Correlation-Id: c1507930-baae-47e2-c987-08dbfc3023e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Dxs0qQssUhFlxVIYiTlv6k8ZgT7q5YVJ5kGYqHOwX6W4w585dX+1yq6ddja2qKRjXGYDy+q348sjduVBo6ekEwj52gzHsITta93XeIGgWIcfYu43kjBv+DDVz9/31EZBNJqv8WbP+N8S6blQQKXp8SnSfYS3yTBXDE5UojWl0JsOFRgWcOFxR9TrfJsibKq7lb0CTy52EISN71mBQiA24qpEE9Df6Ss9JTKupX9sj2+eCJJHfp+3BCl8+USWpjkO4v7TE1ab2YOPYSj0dMsMD5jEP9KJ2AV3Eckink2rgZBRPwzTV5bsmj3s3gPj1AWoryDG+lWtYuvWZoTKrfvWSRlum1KMO7MfkzwDseqmJk9Ti0dm3AViTi4OnhrF1tgYr4RCc8fp4WZoRB8TnK9OsY5jT1DrMw/YMuIEu4QSKEmjvJNNWIw057JEu4BZ4C2mHtYr5YHEhlOmAG5w3O9mw3NMFoWFFSteYvnkWhRIWfpHMDY9n9jKzxny3vS91ypDxR2ywx0ujfDydvPGmUrNoOP0aLrezAu/v/eZT9piVLrTKGOzi3d4Hm46qlzhOuMn9GGOe6+v1KO+Js50Iv/ISokeKpiBxc9hmNFHZZ5e8Dk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6342.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(396003)(346002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(1076003)(2616005)(83380400001)(38350700005)(86362001)(36756003)(38100700002)(316002)(5660300002)(6666004)(6512007)(6506007)(26005)(52116002)(9686003)(6916009)(478600001)(66946007)(66556008)(66476007)(41300700001)(8936002)(8676002)(6486002)(966005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?02rb0wP+2Qs1Hjb09jDir18WqamM6N2gyQWPD5X1VTFiVEoAvQ7Qyf2y/Yt5?=
 =?us-ascii?Q?zcGuA9P/jj4TEYRFIcX5MUE8wLZbau2ZSRreII9B1FNltmUg0QsCCrARwFLQ?=
 =?us-ascii?Q?Ez0mx7CYxHCXyt/7DExGzHIXdKR51s9XXTeZWkuNIWiWfArFEUmu21suLnwu?=
 =?us-ascii?Q?XRbfMiVXbqLyeqODCPAfRsQCGJ8QuLyaWwCRvUX32/tR0eBoGh/6oVut1X+v?=
 =?us-ascii?Q?iAS+C5H3t6y487YwE95d0xf1WnQUqxZSmNfFI/cq4sXfoPlze5VJKpd51Ra+?=
 =?us-ascii?Q?b8cVt5RF3XGzLABX8WMKFXiqXCQDv2exozk500LJbibwskXpF9Qx/FlEJKnw?=
 =?us-ascii?Q?0m+++V3k+kQslgvcD2FAerRzmg9d18U0Dj7uPw2kXnN9e+QZte3yRZFH4UzI?=
 =?us-ascii?Q?DUcc3W3HbjywF77AdZR7HgDsvFvU65oapI9z4lAcfQ4bSfgf1zvQX8HKAQWp?=
 =?us-ascii?Q?2jOeaAlCJH+NDGIKxxnGARBzHIxxPm3nosqkYUqwWCBx3g2FiD0x2mmTLu2s?=
 =?us-ascii?Q?lUualpmug37GFgAMeksTjSuekHO8zXLGaiWr2ZTpMGQS+adLS9d/aihzVOVV?=
 =?us-ascii?Q?9AChZ8b2SF3pC8G7TfZQKO+aymd6+gflhusOiG5by3txDj626k/0qpnNEAbw?=
 =?us-ascii?Q?mPUdcrChD+ux/aUt/wGMAmn3tYrag0MHhMboUU/+i+/Ihf3Y/2AJbEtLBatF?=
 =?us-ascii?Q?+5yn3j66zNJKEJxtZbkGuv/NRGwFVetYkoCV5wv3ysuiKdIBqxKTuY2EakpE?=
 =?us-ascii?Q?ZNmnH1hW51JlmpEbBbbfvfQTZFWdZKftRVHnSPMyarhDz0J5+LhCsqk7EQXO?=
 =?us-ascii?Q?TXohUTFal+zBOSMfDsBxBTuDiI4GhGMNoR+6/FIIkFEw6WZ3oiiy6wou6hTB?=
 =?us-ascii?Q?OxaOilllpDrzu5jsKrBLFYdwNbOM9RY4MSooHhQUeBsH4tMdCULpsOhH44U5?=
 =?us-ascii?Q?kVg6GLYPg8Y5HHK7yfrn1NhOh7uLUxy6i2EmucPK6fx921NXq4mioykjf77A?=
 =?us-ascii?Q?wtPuD3PaFVBILpjkAOkuuapxAfVzSkqgcVDsuJIHy3G6Ry1+31jbAn78lAfV?=
 =?us-ascii?Q?5K5IlFZU0vTSsypHv631TGd/+ZmIX8ZcR5iItYjQNQ8/dSZnKDaSzzBpw1K1?=
 =?us-ascii?Q?aCnsQprN+CWLKJhnUFaGWQLi4WvM1JnOjZWC5wWyDdMot9T2O4GC4KHYJ650?=
 =?us-ascii?Q?rmfdOx8NTmw05tPI166KsUy0t6CHaVPrV7QgQJR2lmeXwOHoPubCWKBpowIW?=
 =?us-ascii?Q?CmSVx5a7xDQP54V0UP77/BgSPzFMuFbfJFcvPbPWWCc3kYeZSLtqtlJInGmW?=
 =?us-ascii?Q?oea5lPGkQ7uYVkYigrlq24QrstYFyLI28vjRywSl9WACK9pnLbrF4u4p4vJI?=
 =?us-ascii?Q?q3qwVeODST011KDe0kX8sZul7sqeMU0kUWG4lRjS6sDXo2bGuvdVDr5ZI8pS?=
 =?us-ascii?Q?IwgvGPdorozK8Pwbl4xVqNgLLGyN0wLf5em4Je06y+xy6aNP7KthNDyqUt3r?=
 =?us-ascii?Q?8FQft+yL4PAZd4b8PlnApda7vpVsOK/clgcjLX5UWZArY36tSPGIc7oWYaPJ?=
 =?us-ascii?Q?pAlB7CCJcwsKWn5+GWorz69wT/n5Xxh9reeRwYJz++zKBbL11YNlUPwN5Q/j?=
 =?us-ascii?Q?Xw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1507930-baae-47e2-c987-08dbfc3023e4
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6342.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 23:06:29.5683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Af9mz3m4/uNJ00LSgrEorrD/7rbZjf5LUc6xQzBhj/iEMRh516xDBtvWRd9w1W2mD1n/S3py//HNr1Ij9wjteEU04Prsz2JF0rsofYOD+Fs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6068
X-Proofpoint-GUID: 3MnIT8qw4EUmGPLutAyP7dazNPoyfIjH
X-Proofpoint-ORIG-GUID: 3MnIT8qw4EUmGPLutAyP7dazNPoyfIjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=688 bulkscore=0
 phishscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130163
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 02:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107406

From: William Lyu <William.Lyu@windriver.com>

The SUMMARY and DESCRIPTION are taken from Arch Linux wiki page:
https://wiki.archlinux.org/title/NetworkManager

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 .../networkmanager/networkmanager_1.44.0.bb         | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
index d213ef650..167572b0a 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.44.0.bb
@@ -1,4 +1,15 @@
-SUMMARY = "NetworkManager"
+SUMMARY = "NetworkManager is a program for providing detection and \
+configuration for systems to automatically connect to networks."
+
+DESCRIPTION = "NetworkManager is a program for providing detection and \
+configuration for systems to automatically connect to networks. \
+NetworkManager's functionality can be useful for both wireless and wired \
+networks. For wireless networks, NetworkManager prefers known wireless \
+networks and has the ability to switch to the most reliable network. \
+NetworkManager-aware applications can switch from online and offline mode. \
+NetworkManager also prefers wired connections over wireless ones, has support \
+for modem connections and certain types of VPN."
+
 HOMEPAGE = "https://wiki.gnome.org/Projects/NetworkManager"
 SECTION = "net/misc"
 
-- 
2.25.1


