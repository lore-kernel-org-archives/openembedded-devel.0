Return-Path: <wentao.zhang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6718CC07E97
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 02:59:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.63839.1701313167055021896
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Nov 2023 18:59:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MAyfIM6U;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0698f2e0ce=wentao.zhang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AU1msCd024710
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:59:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=3UeLfWmMSSCJOF21Ek
	Fp95wOlbqTR7NeMAWQGcX8Yr0=; b=MAyfIM6URajz6CbOmGTRdUzIo89uE4gcIR
	Cxd8SH31XWdulKrlurYDToT2GPuh2y502s/kLioneRP15imNbEyfq4xPr1pAQD+P
	85hQ1PgaVzFUIu4DFGD2U9zWy8oxAw02OqLh7OlBQ2H6M+sPEFCHyk1BsRSTooGo
	gmyVK5AsN+JkZ+MZvJf3bGyFbeUShIO9p78xbMbdudfjAydgbzBGJDg3KKMeOLhZ
	rqJ9Z4rnExTNPENyUKtOI5Y7W9i1ANnaGSVgirCgxlar4ggJTPPetA+YGY6kgA4V
	qiYgt5vhdI7oHSlzt7iyl/P6fqtNi7Gy/rcDlurG9n6Mqzhgk9ow==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph0w81gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:59:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ287UiSI1LRxHfBpWJ0pWt2lVWomUIZ0o7ATKZ4213KrFrvJiwTyQvna3nfrl8KK5NqXGqMcRDes7i8cNYV42p4TPn8sBhyNw9JRHWVx8yu8/Z4iaoUaIxVi1lnD0hyD9wjfKlzGMPb27bLLgaA0vt5nOuq+P1C7EAnzXEfmJr1xv0T234/bec7J89iJA6HcOsVguW/6NjxVRRmQL3+FGFDiyPSL3Yu4JWzdoYGluOuPZR8XB2uxx14lo68Df2Jy2DjG5XTLtXLPpE+IfjpnPo8k1fPFrS1bQ8rrvfsmxSNue3xH7ypqWOTHW936ogneptASmSrNc36B81Q7vxbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3UeLfWmMSSCJOF21EkFp95wOlbqTR7NeMAWQGcX8Yr0=;
 b=T+GXVTV43H2N8R4PGlMHBrPUm/h+iixD04YlzhxN3LfIDbybk1q/0Sbd8h37gk8YRBBNiCBc3qxCGldAY4kA9xxqClpg7GAImMAJFvguPiDj85JdqS91uhG6V/mAEfnAJwYZ3HDk3+kGlBhbzXZIMR9t+iTftkSDmCmCsWvAd7nvI1nKXmwS2yP23BcaHXw6fjy9+T5YqvWCu1O6VDJ70RC5rquqoapbjYKHylIEnq81IKq2KiZDpGHgWfkKbqimT0aseIUyeE5XnVbJ+g34553Uw7X6nx8PABNW4/nBQ78rkiWx4Odrq3dotaxuXLvucXllJJV74Rn5MxrXkzBkDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com (2603:10b6:a03:48d::6)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Thu, 30 Nov
 2023 02:59:24 +0000
Received: from SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::9faf:5e6f:eaf4:7374]) by SJ0PR11MB7155.namprd11.prod.outlook.com
 ([fe80::9faf:5e6f:eaf4:7374%4]) with mapi id 15.20.7046.023; Thu, 30 Nov 2023
 02:59:23 +0000
From: Wentao Zhang <wentao.zhang@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][PATCH] libbytesize: update github branch to 'main'
Date: Thu, 30 Nov 2023 10:59:10 +0800
Message-Id: <20231130025910.1139982-1-wentao.zhang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::19) To SJ0PR11MB7155.namprd11.prod.outlook.com
 (2603:10b6:a03:48d::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB7155:EE_|CY8PR11MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 964e6ffb-8619-495e-7347-08dbf1505b34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+4XlV//fis0qogZMoEmeifPFDTTq/P5oNIC1f8DnxOEuymhI+/bF0N05rGo6H+RA14A/EnNIK7z5mi2wXSdnf75B5HhZ8pjKTkE9AiLB55L95A229GwewydtVF0aQ2tPkBinXvMwcO733XeyZX8WrvBdeVItT+RzGEd7eI54kOpExf4JX0mEG0I60FtPfFqNVckZfom0U5jnRInWripoAzQIdh7WjJhgKGjlBvbD8d2vvhvz9y1Sh2h7+W06QOlhy3yHoHOD6qNgj8oh8qIrO6Qml1z2nybZ4XAhT5Q8FjTVi5MVCJG9oIFmWyxdw/qFJI1PwheiK0RPJTQLEXDdtKfm/Uf2WkS0BRurBQkjSQaQCfmVQ8583pIrpsSkNJ1eCCz/FPvYjqvJ+uE/B4RkcP/b04q+PHmPVkuwoq96/VEV9ZFpVWidOWBA8QwL5o2fgN6iMuDrFXyGlUul2yFPWIJt1ZdAfZ8y0QocLYek129YdX8G5V4rTTqbOumvh4o4uiZWGeqaefDw+xVQCL4+9+ABYJNJyC/DBNvYJaVM1qrDAAySdduzb9LR5MuE6kk3hvpPNFnCzjO9BbsgDwK7csxmPQrVwA7WX0ziGY8ZXdb1/t+8laQjdOuM6eUueNrpQ5OstHziA+jBgEt3IvyQc6lwN80bqNXXc3uIau3qSa8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB7155.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(376002)(39850400004)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(41300700001)(2906002)(5660300002)(44832011)(4744005)(86362001)(36756003)(38350700005)(83380400001)(38100700002)(1076003)(2616005)(6666004)(6506007)(52116002)(6512007)(26005)(6486002)(478600001)(202311291699003)(8936002)(8676002)(66946007)(66556008)(66476007)(6916009)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZeVxn1t8QuMTWmxphd9S7g4xwmq2fxwAsX1fnmF5y+gWdFTrZcJ0GqW2A11y?=
 =?us-ascii?Q?E/RzZciX0ece2sNEhsp6By7yfgW3zXRsLLJ6a9DXNm2rrauSc7ZTWt7l3M7K?=
 =?us-ascii?Q?R3TcDjHhshVSfgrbrbATpMd7NIbpZ53oq7UVhPcXxD6vucmwtdIP091kKO0r?=
 =?us-ascii?Q?q7sv1nRYIi5pugeQM20n3utJNMrJF6khVAw5fwM9PbiACrCGaeeN7H8OElsp?=
 =?us-ascii?Q?C2SgwzLu2e46mChKfXuJwWFQG5nYcgEgkdH0m73dMiLN3wyXepoQL9zYfMej?=
 =?us-ascii?Q?IUCmlRyV+3oByu6PzkJNdijszELWo8Lj9OietdyucCFPYYW2kyzI/fnrZJ9B?=
 =?us-ascii?Q?E0K7kJXjOoJsv2UWzHL4u7FwA0yzxjmRge4hFcSu1p3S6e0voCehrPmQhGL7?=
 =?us-ascii?Q?xtbygTz9rmyIXjrkd+PAvAdL+K3+lplzVDNVrlQi9fsy8TVUMwZIEtpUPMnC?=
 =?us-ascii?Q?reB6RFwB1dZ2gd7XrJlr22JZGYvSv+b4wvaALl3oRM387gncnVlifvhc6NuM?=
 =?us-ascii?Q?vA4Hum4vRXzEowcDIgvPMsvSc2sS6tfz3z6KCMb+cx+KhN4aK0W1VEo4N/Aa?=
 =?us-ascii?Q?wyNFm3nJiDMTTSNaN+121X/xn1MP0JcxKSLKOXJcFVZCoNKI8E9dOPHVgnif?=
 =?us-ascii?Q?/kS/ZPpXh9QyfmrqHAK5bO+DGXESEzxPw5Rbz5LvJXhX+elTtl9q2f4LW1Q4?=
 =?us-ascii?Q?sKowdpEfVpNhftdj8NvxMuS8j8Z4Fk1p9q8xstqWhDKVb5iq1TlKQiNAEEtu?=
 =?us-ascii?Q?A5BLoigTGi1OOJB0tUNUbxHJ6XqKASN/hpp01qXfysR/AC5j8vWHHrs/IM1n?=
 =?us-ascii?Q?k5BxKg0z9jmjvg6XrhX+GM+EcFnmNNWCRpw1S9GRFwrD7CZCkVNQsXVVseFt?=
 =?us-ascii?Q?oSSiiRqfOLPHW1BUlTGq1F6VsGQ9Bt/X2VSzNym/xgibrtNpfeybWU0p+/tS?=
 =?us-ascii?Q?xhC5ucBm6ZLTsN4yIZM94QtQkJin4cOTJZ2ApHcEOoALC6wi4hzDWCHbeKzA?=
 =?us-ascii?Q?vTCovC8CpOwQwPDLuNHYjKFVMqdmSkHeJcon/SGAMVRCiK43b6CGaVUUZwoZ?=
 =?us-ascii?Q?+30aBB5byJ8Q9k5ZSAYcGpsRGnRNIbljUNp2qr/LXIRX3iy1MRPSwnmvW4sZ?=
 =?us-ascii?Q?QJcM5LZw90zVaXMC6gfFjgJWf/g0/uQ7gCiUIXQG/b0+jjO2V8X1BiacsoYe?=
 =?us-ascii?Q?ounLZVXSUSr40ZkPo6VnxyZchXQqa+qMntKqdwMYIVZPHgl7azsPiYfXU0HU?=
 =?us-ascii?Q?D7QgsA5kPnlnI+DbV2eb6cJJGFUfoY5Rh+pRXbqa5GFca0iJ8d3nRK7pe/m8?=
 =?us-ascii?Q?0alFtT/GuQp5Mb7mk6QU+k/QLb/FR7bj4Nwkfwzxk7bctH1R+BuSfz/J0Vwa?=
 =?us-ascii?Q?TcDKYE4e8gEDV/9ZJTev/+dzLWNVeIVY18iJi5UBR85/gU+U0PLLQONfSo0p?=
 =?us-ascii?Q?Ofc+lv7dwP4h5j23Dswz74VvlzvlvjR9ZPMHEuocRjw6W3nkmC1VUsnTjy/b?=
 =?us-ascii?Q?Tl+xED8x6H3/Dh7u2LCBqf5zvHr67qB73SGusZ5Raa+TCI7FJCuAwgvSYZcn?=
 =?us-ascii?Q?aRfMAAs7lvIlSj82DIDMwlKTQmKl70UYSpCl385u7oWAORZteVEpQmgRnPdG?=
 =?us-ascii?Q?Hw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 964e6ffb-8619-495e-7347-08dbf1505b34
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB7155.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 02:59:23.5062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u5vFW+VttJ/Zey+629Eubu3JjH/nUJWRv7V1cjOcYyHS5N7KFYHQrOekRLNiwABtdvJb98SdXMNSESmdeUodlT5bFYN1nDCucsrvb/W0SUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
X-Proofpoint-ORIG-GUID: Q8Rg52-1b3d2KPrI0GXcbNCC79F3_GMG
X-Proofpoint-GUID: Q8Rg52-1b3d2KPrI0GXcbNCC79F3_GMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 mlxlogscore=802 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311300021
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 02:59:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107160

the repo of libbytesize doesn't have a branch named master. Change
the branch from master to main.

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Wentao Zhang <wentao.zhang@windriver.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
index 0afe8a6c0..58ae52cc6 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.8.bb
@@ -10,7 +10,7 @@ S = "${WORKDIR}/git"
 B = "${S}"
 
 SRCREV = "12b8e6bff611eecb0343ee8a765151e7d9d3547b"
-SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=master;protocol=https"
+SRC_URI = "git://github.com/rhinstaller/libbytesize;branch=main;protocol=https"
 
 inherit gettext autotools pkgconfig python3native
 
-- 
2.25.1


