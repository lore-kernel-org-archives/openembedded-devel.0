Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91335C4332F
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 14:05:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.39079.1669039512814457002
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Nov 2022 06:05:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=aCJj4oWZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=83241b2a1f=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALCMOqS004158
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Nov 2022 06:05:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=+9ARgRVZdZiMzmy6nAg0zinqCTP8rjYEC0HpoRs9LIs=;
 b=aCJj4oWZIbAbmdr8+w37HoISWLjEAyYjVN90vMqo9uRd9JxhsZuEFYxdZzWrwQHBEAto
 vduAaBQQhcwP8j5Ndk3iDzXa4aWlRrVY1wA+n+Mite0+JN8ppCdOJSy/M+L6WloOHRlJ
 jCBnM+5zLiTAPJz5ZwD8x1V8reT2add0Y5SppvHniSONzRcIOxf5rCvvQV+EE1CZ/t/m
 gxKxM1mPDlu+XV93FTP/snN1fSkJXepuIaCGoQbgx8ky1gpu/7CkBRiuSH9L/He7emLw
 FaRcSo/2BztA5zPa7UppdpXIvXhf3IUyXhJ6WZtmRFakhD2dgWPXABTFFcORWpKzkFT+ 8A== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua69gg0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Nov 2022 06:05:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ali1LYPO9FBISdV+Jqgp5HgNneaRunzOHYaoUnHMAY7A1BJTx1X6pWT+FH7DbnDvcgGwizONwemVhmTxFyKCE3tpxgQwzc5p78gk8KdtmZjYoqwUTPgsSCk6nDfLkR3CX+8SH3a6Hb6wqUIE3TWbWnCgRjANAt90KoYMRd9f/WMGIQBIxvte4eHoZH8k7PS4um+0U8J9YYIVjG0y8JhBN47RGg4LHxC4J3y/mMQan48GMeCSvGRzx+/R4fXOrJ46KNIreLXLV1pAsHTbAqLT0tq9fztN7KTWUb/PwBdY03eLhfkm+lDmsWp6RUZUPPyhLINuw8+qXeSvBmXgG6rCpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9ARgRVZdZiMzmy6nAg0zinqCTP8rjYEC0HpoRs9LIs=;
 b=CAK1zS1N2ji9QHRYsQLNhjymkvQNICXyVV1yWI7pUj5s1hG7lMQpF4C859/PTyZ0LgP7eJqVY/y0d54Z8q2TnnGI5r8/Ac0TlhtmYDydWjNWEwyEsQce78UUqhaXBDcXlT44FbS0i6CEIc5Jm9TS5JTVIO+59I0L/f5qaorUtt3A8mfbV3th/XXKQ2fWwzMc/8Nh98EmFqSwxFFkPZN6U2QUoVRTpaUu8GlIx8kRPFlKc1/sEKyYKwzcIJpM2orf+xssjYRwmOIUh5fJzujjeV3DxILHXbFDdGkqlvh9BGatkoTWM0il7EntWQ8lHRzku3Aio+PdqVZDybZ62xNPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH0PR11MB4789.namprd11.prod.outlook.com (2603:10b6:510:38::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.11; Mon, 21 Nov
 2022 14:05:10 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ebd:1e92:dbb2:1fe5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::6ebd:1e92:dbb2:1fe5%8]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 14:05:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] ostree: add runtime dependency bubblewrap for PACKAGECONFIG[selinux]
Date: Mon, 21 Nov 2022 22:04:57 +0800
Message-Id: <20221121140457.1377924-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221121140457.1377924-1-yi.zhao@windriver.com>
References: <20221121140457.1377924-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0002.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::23) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH0PR11MB4789:EE_
X-MS-Office365-Filtering-Correlation-Id: c1d317e8-a360-43bb-dfc7-08dacbc966fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YjIU9JJ5jCLF6LwGV2eF8LN62onVmMTFvbB2ZwaqKevQO9XWb6cwPF/orvMNQTH0E42EpxtR1oybJIJJyk2vG1ONIfxbaZ1Fh7iuz7ChkuAswdtdGfJXjSuBb/+MqroQ6wmbkeW/E6EXA73GmbbxyGMCZlg1Chl6QntRl6dX0VkZdTp3pkyPuNux9YAa+DzSYxDwwAHMJovICv1/ZXEkVODQS22/aTYyBmSLHNjHqGtLz/Spd8WsnWhp2tbEaVqBz4/lXt8BIT7IZSLssIvl6AqqRDDinB5FR9ACuuI4Vj/HYAKp8FxYBCqb057EDR69LJ1qYHsTmPg4wGVm1wnh8yW37jt4HfDnU7MAuZD/qrLId+eLo3/ht18Vh44sTeu12x3hoAdTpWfHA4/RPqUIcOOp+tkqaj/YZZqhTTeAWOVtSP3elVOcDbzM+VJitS2TU3QTj1bGLkIrviEUPn3fnKAZxxSyrJlAsp10jjeFVro1S9SlQj5zCwz8SN28i3uf4RNCQMIzvdb6Q+0St1sjm1y1HNh4ardYVJkzFKOAvpZ08HI1rZtWl0Ie/lHuen1hWiLpFPqy7UXLz7Rtl+7y2ZdR6nlqyCRu0goupv5reE/ioShc+wnLYfBh0xT5sqGvVW6y+BXNsNytdRvDrR1mYoFfrgqtt+eCiLRrBfBr93K/9ZvwTWk1EDXu8Vvm6RDGT/v/QeFX2D4YkEx4szJPL2VNSUQJnw3PjoeKq+runPQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(346002)(136003)(376002)(39840400004)(451199015)(83380400001)(26005)(6512007)(186003)(1076003)(86362001)(38100700002)(2616005)(38350700002)(2906002)(41300700001)(44832011)(8676002)(8936002)(5660300002)(66476007)(52116002)(6916009)(316002)(66556008)(478600001)(66946007)(6506007)(6486002)(966005)(36756003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?crYhD9l80fUYf/AKNcIB4krsR1ERh9W1PgNfZPCBDE4AHfV+37pWbA49PpRL?=
 =?us-ascii?Q?UlbhJeqiH3LX2c+uQX0q6NmnNpq9QDn3lvIonz+RVJDNsMESangSBwkhekne?=
 =?us-ascii?Q?nkpxPuWcxogJPJO9m2TmJQUwJrIclVp3Cbbtrpu7+9LOUcCrPMKNidlkE8e4?=
 =?us-ascii?Q?b1DLeVhdu1/pKs3TL5BU2CCyg/qWvdUPBSgDkQ94g3Dh8Y/ZtSVP2oWNPO6j?=
 =?us-ascii?Q?YFVMa9kTfP2y+Tpl5T581gmRr6eYrQSeH2VADW5j4r0pZwxTl6B24p11FJiZ?=
 =?us-ascii?Q?1ctFwhAszNIXBzTqYrZWQlL6iUZjdnfgBwmnanDoTYAIQyRCZ0caxPXF2JDk?=
 =?us-ascii?Q?okKqRWd9aMqu7/nD0AdaPULDEWluvevV6qScS75zhrM6cncMC+uVZwG0DSMX?=
 =?us-ascii?Q?ntBVSBGGx3f9jLwB0xsZyn/PQxAtwg8+uhgyeCL0mRYP1U6k2OyXAxQOJgmK?=
 =?us-ascii?Q?s1ce5z6MJmchW1Hq58lV+Hl2zi1op326f/qBL/4y355u95sOQaisJQ6U9bRz?=
 =?us-ascii?Q?cJDVZa/kS+E5uY5NDRU2+GaIGr9Y+Qug/t1VcZHaIAO0gJvQek09hRCsejjU?=
 =?us-ascii?Q?f6vxay6X8VYgFiN6seI8Fzj9NQAfdNMSF8yH/PihHWTs8BJvBHxJwI+fKu0V?=
 =?us-ascii?Q?ev2lICSSJWP5x6z5fPpfryWoN5fK4u6qmDVxbBYmyxnNtCPRpiLHw26cd1Ls?=
 =?us-ascii?Q?DCswIOSCJlcyRYan+AXvnIdixyEKX67vQ4DPlHvYQI1zIliscLLelXMoisA0?=
 =?us-ascii?Q?bxlSIThJukkqLwJHDIUHzySPRs3ijkDHknGp29DqN/EfNiMlW6TJkLzdHDV6?=
 =?us-ascii?Q?n49pUi5xcPKc/6TbXFoww9gKPlGN9HLS23Vlc6j4lmGSAsa1gXjl4i3eAtw2?=
 =?us-ascii?Q?cwIZcq4xcfNpkryysibVMSJrg/XEzuvt5GeJVib6VBRGvC6pTeLss+tVA6v5?=
 =?us-ascii?Q?k3AuiFgYFFrZwaAOjaTJ6fBTnMAd6tt0Fr1oAWmUetfFpikO/7ePKt/60g31?=
 =?us-ascii?Q?M/VTJzG3ddOcIXOOFdVl5dVSw9QkVvW0EWuncSwl7w7Wwzak1hotD6KwNR2a?=
 =?us-ascii?Q?jrL3bQ2yKHN2YgbmyfUKtPsiYAt/YP4sN8lfiYG4lXbKdDYjnjUaLv33Esl4?=
 =?us-ascii?Q?NqlGRqRzCF7kTiwXwGF5clVk45FhlQBioXUjJ2ZEdGYDFb5HkvW9UIt1qpOt?=
 =?us-ascii?Q?SVNr4nc4eYQURlonZxOZFOFooViz9oPTudPApYf720iDAi41MFQyxq85ePyl?=
 =?us-ascii?Q?QiGlRDHVfopwwJsbme2k6qrgzhUkNm3MwGQMA4dv12TOXIhFOnt+eE6hOux1?=
 =?us-ascii?Q?ZyHbWF7QNlAMmOZJHSNVVlCwfDg9pge+S8s3FlQ+y2y0Un/IiRAs+Ooz3y1W?=
 =?us-ascii?Q?/KV21b73+ZUot7+w5a3Z6SQh8vhwfm28A1O5zfXZsemAFj7vPrwMelraVYUI?=
 =?us-ascii?Q?rwnM6eP0Io99GHfSYUYd+69DJcaz/4REWVhDAfXzdWm5Btj08koTZoSAJANq?=
 =?us-ascii?Q?Mu4+vvUsrdmYjaCFtWGYKnyWJRZ8ApYNija8TUunkYtODwpw7ez4q8HDSJ7Z?=
 =?us-ascii?Q?zRoSSATprMBtPTUhoJS8yeWjIIB/+DK2Bp7lqJAQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1d317e8-a360-43bb-dfc7-08dacbc966fa
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 14:05:10.6053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpVE9nY/lbbbSxMVdyWPp3Jo0WAqw/6FudIJaHJgOFIzG4btDlzaXFJtBETsEnSRbwAkw8v7GHPBR+PZ1DAF1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4789
X-Proofpoint-ORIG-GUID: qO48LePmVkz2Ij1d_RanGculJz4nAoM9
X-Proofpoint-GUID: qO48LePmVkz2Ij1d_RanGculJz4nAoM9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=368
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210109
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Nov 2022 14:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99678

Since 2022.3, ostree has a runtime dependency on bubblewrap when enable
selinux feature[1].

[1] https://github.com/ostreedev/ostree/commit/edb4f3893474736156c654aa43bdbf3784991811

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/ostree/ostree_2022.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
index a21c473f0..699b693d2 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
@@ -82,7 +82,7 @@ PACKAGECONFIG[mkinitcpio] = "--with-mkinitcpio, --without-mkinitcpio"
 PACKAGECONFIG[no-http2] = "--disable-http2, --enable-http2"
 PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl, , , glib gnutls"
 PACKAGECONFIG[rofiles-fuse] = "--enable-rofiles-fuse, --disable-rofiles-fuse, fuse"
-PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux"
+PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux, bubblewrap"
 PACKAGECONFIG[smack] = "--with-smack, --without-smack, smack"
 PACKAGECONFIG[soup] = "--with-soup, --without-soup --disable-glibtest, libsoup-2.4"
 PACKAGECONFIG[static] = ""
-- 
2.25.1


