Return-Path: <trevor.gamblin@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AAFC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 15:57:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.12713.1648137477571044393
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=sNgDpPuF;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=008297714c=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22ODBFjd020587
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=2hJdP0CHs7U0bjbiipTrTkKjs3eZlc5roKVkF+dsheo=;
 b=sNgDpPuFDjIPDvVswg5eo00V6erPsSQM3YHcRvcCcCurUtH5KrnYjT5JpKj/xs9jApUZ
 wO33AKa7ui36bQkQ8k3geOdw/Nc6RoGRfz6cUUql89C08leTTnKD89+l3kjzF5RJWrda
 vKMdFJFvayTXgeiN5XW/WP3FJZcWZ6slOT1CvCj7ErY7/dViYMe8hKLK1wic1a9QW+Al
 3gx+9C1tPtAYHUfzu1TT0ASus6ueo0crI6wXXAqjJLAdyDwJ3dkJuaNdxg2jHJupqggl
 DeX7i8DTW6kl1evJ577voACeliYzwItxxDWewiAbWIXD8dvPh2MJDAb8YTM1pAvKVafO Pw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3vjfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 08:57:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLo4W0zRcowB2Ldv04nq6FSaqvUUZv44Lq4fLj1gHUEIE84+fD377+BYfAdogidvkSo9ZNXClAJkgN1pgmmsOPwNeWC1gIbA2wrzqyXZxfAly7LYPE0MDNo7uyxYr3FWQii08miSEpnGUISZ+xvsozZZxEh7kzEfPLwR07mOLwL2qAoITLRY3gQn0yYBjNULyw5WiGWLkdR+Xx5ouoij6mP5wqwv8snln70Rzav4Vi7UrqHZrphvfddGv9F8UN+PVZB/t0XrhXx5JXENzuPV9CNV8vOncm85whGya5i5DPF8kuQNQu9ovgtoUz9ustnREcDG6hiQ7ZDdIp4bZ+kB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2hJdP0CHs7U0bjbiipTrTkKjs3eZlc5roKVkF+dsheo=;
 b=l2W4b1PGuLf00S91TaMPftbgwVXyMRH+osFwpwaqP99lqvgHcWI++whUl/hrJX8hAWiJU2KiBARArh8P8HjtqtKMCnnBO3+W4hEyPAUyguNhJgEZn8VuJROchXhsrXr/HeM5DMdvWCoXUItcm6AgWCIpKLffRSycbwqT7P/N1EXPuVSWQ3TCYKIgTx/mcs0VTfd4I9gIZUiC8I2nPSFvvz5Dl0TtY0Pyfzy2Ga6n1SOTMfUciJ9o4smls1MpawSRVO33+MMzrSuv/n+LFYNisJ6jXs/+bfrujxVb0Kv26C/Un9duNyC/0cls6l+2RfQdObdvOEV6oY0vqNGa1Ziy6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by MN2PR11MB3869.namprd11.prod.outlook.com (2603:10b6:208:138::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 24 Mar
 2022 15:57:54 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::c1c7:209:c28f:67dc%3]) with mapi id 15.20.5081.023; Thu, 24 Mar 2022
 15:57:54 +0000
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/4] python3-protobuf: upgrade 3.19.3 -> 3.19.4
Date: Thu, 24 Mar 2022 11:57:43 -0400
Message-Id: <20220324155746.2341330-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::41)
 To BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 389e4d87-6bf1-402b-3ebe-08da0daf0e80
X-MS-TrafficTypeDiagnostic: MN2PR11MB3869:EE_
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB386970705FAF73B0E2EB3C089F199@MN2PR11MB3869.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8zm9+T68dE63DDdCgdblYVDIJBIZEv2HKJKGyDdv9VNUABSsQKVIrRkiHgublIM0ws1Y83vFrH570dVWU8KSNgi2DQho6EUXC/BI5KRWfJoB18Uxs5LQCmsp3lA9ViJqDsQyEDRARMHu6AZ2DCCz/kWf5tpmetaoEXd61JnzfmOlKsbNWbbmzW+uWgxA+Yw6qDZE0hvLVj+rU99GtBkta4uY7k2HdinZTRZsVBQ1yaZpt0GLEwb4Asag7zE4Eu1fA9QRiL+mhfeEUbLMvW2kVeUViaBI7A6Ilh8DHoQrzczs2UFmxuoSeDQS3/OpJhjaotwkrsGnCapxMGjTIOghHwAL8kbSQVkgOoA2s99padQPbq9pakqgx7DCsaS6uYy4REJ8CGCzcH3tNxIYnGRsV4Fis+M+5DP5eBXKx9opFT+jDEFTZHeVqBft7n9YdaPBBR4Z+K48NTTWoPmDdstbGNyZ+6PA0rBMKHhPCgS3tz2bc7wsPkLahAVzGC4+Bg8jSwMItAwwE34CvrKRzamsztKkWUsvn4py+rmqK+dZaUxWG9kO7CDdSPvSr7V2GfncjHlrJyijFSqaCpu13Zf+ykIaZmasqvdLYDc6TjHs8XofTOM9msQ7PzPkfimFYq0Q+P6G17LOeJHOkeAT4VfnIpw4ajhAbx1lvYIGM7ZML0sdm0ncGPUv7wv+iCGk+Y9y4EWFKjtIzt+tT1NghHlKo3XcBLO5kiKON/MZ28IOh5310v++WgHDBF3mmvap0/TZbethTxkIjqSSb+A40xclyw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(1076003)(6916009)(38350700002)(316002)(26005)(66946007)(186003)(2616005)(66556008)(86362001)(66476007)(6666004)(8676002)(5660300002)(508600001)(6486002)(6512007)(966005)(2906002)(52116002)(6506007)(8936002)(36756003)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I6w/KxfpJL/nXSRmcs/m+fLeHUAkyA8B8PTEkO/m7YSQrvi75cO/FjAoka/Q?=
 =?us-ascii?Q?2N3CCbMparP4yYMqfFU11X3BXzGTo1Sw/TBKUG1mQzkxjFYu9R1kWirYVzxx?=
 =?us-ascii?Q?aIe1XOcAMrWpp1eEy/t77GOOjxTySUWQE2hPh21dfzAmBTJ1WomZQ2pp3rLJ?=
 =?us-ascii?Q?YYoxcbOJLk/kN48c1wpUII19xr9VIHSwSkV4wj18CB9mD+ErF7Xe01ZMhhDR?=
 =?us-ascii?Q?2ZNn5aZ6Ys9vmb0dS3XavyEYWjQQ1cFNFLkmgFXfJ5fhkLfhQ031mo3TRa8i?=
 =?us-ascii?Q?VZK8mXTImhayBZX/F+Z0M4WYy6B43i4Zi+rMJr6V+meY1Sa0b8ZxJoEZA0CE?=
 =?us-ascii?Q?hMLbehonxzPZ/ylduA2BtIYc7Gn1NO2anW1YT/q9JBHMOg22sTrut2KXUGya?=
 =?us-ascii?Q?7G+TITLAGuFBcRWMXKAQfio1xv9pQtfj2VKthZBvUioGDII/+3U9ikFvxXSd?=
 =?us-ascii?Q?DnLpCqUh7ATYxP5KJBJyvznSUGGqLxbT14DJqvh5kKV6X9baZe/Iglc8LLFT?=
 =?us-ascii?Q?S6Vz4FKHr9WGcwPROUO+ZtPOvZp4P1pFZZdS4ZoQRSY9ilY2m9P1oagdnsfg?=
 =?us-ascii?Q?8J47pMuGsbot3Vm/dg8mOThoCterMEiUoaI6L55oSh8Ezc27ORILb1Kn3LXi?=
 =?us-ascii?Q?tUZGd0Lgi2f3IVSMHsqSLAdJaMJRCXQEy0aWdiS10ml+fEFP7HjY5CXF5dDE?=
 =?us-ascii?Q?RwuAWutXD+RAV5II5rBQbEfPQ2rbqO8mNdUB0KYTVqXIEpOrXdRA4ivBaszX?=
 =?us-ascii?Q?Zc+oFbiwkP2+Gga4SnjS2VVsmP1N5pZr4ZxmzWd8FtMtjkB3+W5LYXxQM36g?=
 =?us-ascii?Q?RKywvwB1/vkiN9pt7kDQa8gMT+hFY4PDraWpMtHDnuyDekmr2+U3npJvoOup?=
 =?us-ascii?Q?T0iVJp6an7Phz0TvJsoMHhCI37+PywD3UHVe7F5FwEhtmJ4ED2NX3whspISZ?=
 =?us-ascii?Q?h4SUOOS6LvFdJYlIdhiwOfd3erfOE4lYkE2enJwKDD1zAWGrs9YIkUWwBI99?=
 =?us-ascii?Q?hOswNR2r5feQ37b5RE5uuPenF47eWYq+7OFMz+eyds+9mhNNkWkg8xoAmxri?=
 =?us-ascii?Q?HyjxoL6fNc7/4AL73SFZKwRHdybrnKSQ0XAevP4EzgJwE0OlbKqkAMTE9Lzs?=
 =?us-ascii?Q?+UNRUWgYJ8yNNBU0OLijFFVmuj/J/21fkonHP31WBLrsoQYoElECCclXxrpn?=
 =?us-ascii?Q?n+FaCL9iX3s1ywSp6+/ZeWPyhRDuWt6FyFo3lmcL/AOs7c7SisHTbqNyzSwk?=
 =?us-ascii?Q?aY37FfhgGXUdzgdt9Fs1ZfCxsRqe8adQnKdMpvPYyDzZD7rgmKzOR7byWfS4?=
 =?us-ascii?Q?aLood2V7jDOXYrH9BSJk30/ZRCMDzjXpyJvF/9CYIUMCx9bIfjIfK+0xkynk?=
 =?us-ascii?Q?M/MhwZmp37onb4s9p/HL8MairWf16TPTOMv/0QaB1RhapqhQ8/ZwJHYIJPZH?=
 =?us-ascii?Q?XxWTAvTdnPwniZqfWWDyN4RIm8zA7NLd9dVDhoxX62eDKX744fcf7Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 389e4d87-6bf1-402b-3ebe-08da0daf0e80
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 15:57:54.1944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ysItNwDXoEiXvmL4xUTq7eHVQR9YP1cqOtSFo8K7lD/CzE1wAg1AtosDjjT7cJDTtGdiZWhDplMWC2MBkanA8oOynsfMoMHGSZJBqWYwAWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3869
X-Proofpoint-ORIG-GUID: t5K3w7P-xUMXIkhLyKopKwGdLAe8sMDU
X-Proofpoint-GUID: t5K3w7P-xUMXIkhLyKopKwGdLAe8sMDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-24_04,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=977 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203240089
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 15:57:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96196

From the release notes (https://github.com/protocolbuffers/protobuf/releases):

- Make libprotobuf symbols local on OSX to fix issue #9395 (#9435)

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../{python3-protobuf_3.19.3.bb => python3-protobuf_3.19.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.19.3.bb => python3-protobuf_3.19.4.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.19.3.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.19.4.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.19.3.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.19.4.bb
index 5e0ee7cb2..85147544e 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.19.3.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.19.4.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d975a6314fbf5c524d4981e24294739216b5fb81ef3c14b86fb4b045d6690907"
+SRC_URI[sha256sum] = "9df0c10adf3e83015ced42a9a7bd64e13d06c4cf45c340d2c63020ea04499d0a"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.35.1


