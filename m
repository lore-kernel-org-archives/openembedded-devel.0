Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D99EAC433EF
	for <webhook@archiver.kernel.org>; Tue, 28 Dec 2021 07:38:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35927.1640677126540189316
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 23:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=gKIWfeQ+;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=7996075b3e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BS7RvpD018664
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=3gAbxYTRpB2i//wUTyzhHj73eO/o2IyJ+k0XwAHoY9U=;
 b=gKIWfeQ+r+xJnkoKA6tUkMw0g+4ykmvF6GoXbGsnj3ZT3aO3AKBCkIjQefIfynMh4nrR
 HEbThTwqfOFKKk4h8hrJucaAU49VzNlrXKcDh5PqechBcdZLixw5/1SdwJC2sCkE1iEk
 J2f3LuTF9sJO/UXCMojPy3+jN7ptMvH/3UnX2POT7KPa6eeVYJ80w5Vwqs3UQYfD4fW+
 ynsEaag0yU7mj/TVIVyD+5mRkVi3kqRnCFu9d7N9pVtS+1tOYX/SxCuvB4L2S7zeQgc5
 eF8CKyL5s9SPnnSSGYk1+yUYYQWcOvERF43KGuXGY4FSjTV+HTvV6CIhF3nnMydyk4D1 BA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7f230dyk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:45 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BS7ci2N002231
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Dec 2021 07:38:45 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d7f230dyf-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Dec 2021 07:38:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+nbNQDhuFsp3nysRyOw0fPcjaDNOQg8S7QOgtyAH8EI+ua8kwY6H8kDf7lviCHHXpRZXEVGSJ5z0P5sT8GHuylJka/In4uSB9kj9KCIu6DJe9Lsy1AjSB9roSLtcLD/EaJ0bIaTodZsEACO3Cj/gR9IK2ehRcmrDN/PXOo2KEZUA8+8ojlhzzi+ontAxl8bQ3np8BDNlHULbzg/CX2jZX1j3yHA6ueHjCJcxT9LqC+2xUPFjpO2mIB3rsz7NYiftnc5UYMuTKH72KzRg6vZRwUJpCwby1/0QTM7szg/ZIq8KVKq9HYihuBXdsAgWhta+zCFByP57d7jngBzkX4UZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3gAbxYTRpB2i//wUTyzhHj73eO/o2IyJ+k0XwAHoY9U=;
 b=GpEOhUHIwD/XotdM2BhYYp48Yu7f+H3WWTzQfBHQtViWWVm7iSg1pJxrlEzmX9BfzKVHZEELVWnTnmQXUiBz2KAfdaw6DZos5VcBYKZyGOQVD3U8Sa+XDnM5lYFG/yCNHysUp6Bh+jxQInRxYsJQ0Ciri4Cel5QI8ODJlNbbAlzLGacZfW+0p9jS4dcPxD6ni1YFkiFX6FmHcu3dWWKT5xkW38X58t6f8cTzCyOJpXpkA6motLYzFO3yuOfGEj9Ka1wUi2OtT/hfn+07zuRR1YyEKcgVU0KrPeFhUiggrYu6o5SgsEXa3VYbwPVG0ryCz1mhX5eSOmFeasVSadumzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1584.namprd11.prod.outlook.com (2603:10b6:301:e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Tue, 28 Dec
 2021 07:38:43 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%6]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 07:38:43 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, akuster808@gmail.com
Subject: [meta-networking][hardknott][PATCH 19/19] samba: upgrade 4.14.10 ->
 4.14.11
Date: Tue, 28 Dec 2021 15:38:06 +0800
Message-Id: <20211228073806.868759-20-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228073806.868759-1-yi.zhao@windriver.com>
References: <20211228073806.868759-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0057.apcprd04.prod.outlook.com
 (2603:1096:202:14::25) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0657c0f-2392-4d40-25e2-08d9c9d51310
X-MS-TrafficTypeDiagnostic: MWHPR11MB1584:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1584379AF2983AE923C6C7FEF9439@MWHPR11MB1584.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uUlyCHl3uCCPwLvHF75nx7Zwe/eeqqAHBP6l40RuYRDKMkDS+Kru1e9w4+euTawHNbsjdh6RTPInPhmY+OVzhA1UKadHcIqvi5h6YPlr/abYdbs6xyhrAP0bo0Wag4jlC4QxoJX8kow4PpjWiHJp7vJY4CCNrvc1KjoMwuWy1Z8n4Ro5sE4FsN97aJWT+g8HLTIaVD8VKJNU4DEMZKzBhIqh63jz50Z6fRkJLb0P+Dl+ED1A9xe3GgafZZAbzNI+ZAesSkiUCAiFnuipAWZAiVeII+SekRseCAaG1puj6y93b/VPdMXq8UsmdcR/dZazdwBlgD5LvWj92EjEr86IdmvRGaZa4LL60B5hf1VsZOGlDRABb8u25FonSOG7bIvCxN/1hdT6Owbd5yVjs9ecE1W4Ke+dgI48wNpFm/n4SxX6MacGcCTiImPJfmIeUEmbXUbIWro05zVxEnYZY3z98FIQN3izzW/g3sSVWKDzJBAb24qGdIfnUeBrzyFw2Xzh95Nb88hjyBVMfxuda5fzCu74mF/Mu6xkijUPBbbmmcnTYTbL7i4wcX0m4M7uCnguxuYdzwyvuSjLfr6qV1sU7nTlTOstqTAg27AwoLGIm8ec2BDpfeWJd40iTMrV8iZTEi+N6UM7yq4JEd4OlLfirv7op/3peY21YTXwGq/6ZfJQxl0NZKOn7DUeCAAfvoU6VT1nV3vTdvPTbLAFvQSSYexb075wS5j61ltTM/WeZ9qo57mxLQtGBHI8v1dC1a1Rd1GEG8BfrnukQoXbPHwJJ0Duimwp1l74YODo3DHDNnQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(66476007)(66556008)(8936002)(508600001)(83380400001)(2616005)(44832011)(36756003)(1076003)(6666004)(8676002)(5660300002)(52116002)(186003)(38350700002)(38100700002)(966005)(6506007)(6486002)(6512007)(2906002)(86362001)(316002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OKC3ATqse+eufFEUefcg5cHnnlepALKkR7SvVxUtNxOY6hBcEFciNH0YTvaD?=
 =?us-ascii?Q?rGHMjM35mtJg2+DhlReQWsYEvhIz1nWvu98z0P+Y/VGMer3GsZfd3GkNBhfQ?=
 =?us-ascii?Q?kYr31KB3JCioBX2BYAdDmZyBoU6DdAqy9lPY/HKcFu7MtFr1nLHjwLeKiepD?=
 =?us-ascii?Q?9h4mekA3S1vMyHGzgmkqsyiwOdFtJ6QvIjXn2LeOYOI3yoMn50zpj+ufVhaK?=
 =?us-ascii?Q?16L608LkOCIODT6LP9/W4oLAM+xlnE77Ko4TLmGhpFwiiDRargeV2/PxVl23?=
 =?us-ascii?Q?OJaW8mieIEK8XMjX563QFnryaLQabwcnvRUBrta8LsCBCTR4mfxh0N58EdFE?=
 =?us-ascii?Q?cyyfDhFu0GC2vXMaUDcUAhZSpzWJ2jvhEp/seCX9x51f1dw4rpzmMpo8fhDP?=
 =?us-ascii?Q?+bvN25UvpS45EP9uroHIOq67y/qz5SCC9UuAf7f+dIKWyc70dMq3wI7+SreG?=
 =?us-ascii?Q?l8u54sieHL5pmPze7q8QPJG8Ln20bZVwlKS8nc7qpzYRjrBJsJ4ALsuIZzCN?=
 =?us-ascii?Q?JMlw9gBekQjdTxtHIP/X/PL+9xt/wlQPTvufU8Gawyj97WKvNpiMJWJMs1uX?=
 =?us-ascii?Q?FG/RAvTmay2UXrs3g7/SYSM76JkTikNdYEg0JceK4Z0QsOT3LvNJi/rJr3IW?=
 =?us-ascii?Q?rJYz7QzdljC0dtpjzhc4WtuV3WUWkgfB+Bxd380WZpVDYJi231T3j63HjTjN?=
 =?us-ascii?Q?2oQ726VSS1bwDsZV+DPOVpuQY2bmkK1NYIHz80LkOwJ2dKQ5UTlM9Ozwm8EN?=
 =?us-ascii?Q?GJmVqUt4YxoTxQ68U+jjSr+nwCDSExOwoIwXBsQDYRz9ys+SAjhBsleTBSgQ?=
 =?us-ascii?Q?nh/e6wx/uOObXcyf23dU1pnL1RYQj9VqDgtJcJqD2RP2ACLdNX+hHUm0rUz5?=
 =?us-ascii?Q?QO6tzjQpvDYIpQ2YBDMsNm8QOVI0kw9DstCD6ihzxw8Zy4qETW5WuPYPQvF+?=
 =?us-ascii?Q?fmE7UqYbucwX9YvRxnQQWID2EMkyjZJYAHT8a5oPZ+vrHZ0bLU4hAbDolMtk?=
 =?us-ascii?Q?tw64UKM+AMSnhSGgQDFTmgDHkNzUJ+vKOhQ9I+rK+qo+5oDOIIlgJYhpS3cx?=
 =?us-ascii?Q?oaQEPok6ZWpHuAntEcHAPtf4RgPTiQXZCwJm4Bt5WJfCiwaBCIe8dKw8EmvX?=
 =?us-ascii?Q?2PDLSG+yBsvTGjO9T/xYLbzkw7kv6jm19xGu3l1uOPRjZZYqIeUO+NJ0ZoOX?=
 =?us-ascii?Q?Y+vNncGiyOQZL/1GHVZtxtxM+2vvCqR6RfTAmJedjXe3vEUFghXE84jWTM/s?=
 =?us-ascii?Q?zqNVSk9l2oAEGsBOitiXBe4+IoDXXRaUSsTIL+LSOupFcNnLXU16KgmzSURU?=
 =?us-ascii?Q?MqB8idkKgSTpne3pIFZtVNfyc3vebcZ16jHB7gJawHz/DCZB/gE246XttaCf?=
 =?us-ascii?Q?uMT9TwgFTfDmtFoejhIQI+OsOnEGMZcsOgkjryYPK021aaswxo9dCYJrFctM?=
 =?us-ascii?Q?wIBltHvxfNOc0DLF5nwgVmLHUHmB1kn2lKA6QpTRlqnIS38o0+I54ELdC3LR?=
 =?us-ascii?Q?QjXqW+HQSMmDXY2M9JsQ+W/3+4xTA1Y0Mi3DvaK+pqIzKXbUFPwjJ6tf/tqn?=
 =?us-ascii?Q?aMgo1UQPpP3MJM4pWqGjaWyYmiObCGZYqBRYRBEru/wGQQqniB91UvtePL2d?=
 =?us-ascii?Q?MKG5kz067TsE5cX12oBDX8A=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c0657c0f-2392-4d40-25e2-08d9c9d51310
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 07:38:43.6400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QL0qzpj2P17bBs/B2JUGY1r1LkJLSBa7CJTHCwUXbkkamS3dFwcC7nGJ3ui7qA47qXqCTc0gh5o5iSyhmfJEHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1584
X-Proofpoint-ORIG-GUID: i1qLsdP9R5DpytGnb4Tx2-XZ8opH0GYO
X-Proofpoint-GUID: GFTkRS1PVdsxNmAtJT_DLT_4e1J5anmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-28_04,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112280033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Dec 2021 07:38:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94546

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

Changelog:
============
There have been a few regressions in the security release 4.14.10:

o CVE-2020-25717: A user on the domain can become root on domain members.
                  https://www.samba.org/samba/security/CVE-2020-25717.html
                  PLEASE [RE-]READ!
                  The instructions have been updated and some workarounds
                  initially adviced for 4.14.10 are no longer required and
                  should be reverted in most cases.

o BUG-14902: User with multiple spaces (eg Fred&lt;space&gt;&lt;space&gt;Nurk) become
             un-deletable. While this release should fix this bug, it is
             adviced to have a look at the bug report for more detailed
             information, see https://bugzilla.samba.org/show_bug.cgi?id=14902.

Changes since 4.14.10
---------------------

   * BUG 14878: Recursive directory delete with veto files is broken.
   * BUG 14879: A directory containing dangling symlinks cannot be deleted by
     SMB2 alone when they are the only entry in the directory.
   * BUG 14656: Spaces incorrectly collapsed in ldb attributes.
   * BUG 14694: Ensure that the LDB request has not timed out during filter
     processing as the LDAP server MaxQueryDuration is otherwise not honoured.
   * BUG 14901: The CVE-2020-25717 username map [script] advice has undesired
     side effects for the local nt token.
   * BUG 14902: User with multiple spaces (eg Fred&lt;space&gt;&lt;space&gt;Nurk) become un-
     deletable.
   * BUG 14127: Avoid storing NTTIME_THAW (-2) as value on disk
   * BUG 14922: Kerberos authentication on standalone server in MIT realm
     broken.
   * BUG 14923: Segmentation fault when joining the domain.
   * BUG 14903: Support for ROLE_IPA_DC is incomplete.
   * BUG 14788: Memory leak if ioctl(FSCTL_VALIDATE_NEGOTIATE_INFO) fails before
     smbd_smb2_ioctl_send.
   * BUG 14899: winbindd doesn&apos;t start when &quot;allow trusted domains&quot; is off.
   * BUG 14901: The CVE-2020-25717 username map [script] advice has undesired
     side effects for the local nt token.
   * BUG 14694: Ensure that the LDB request has not timed out during filter
     processing as the LDAP server MaxQueryDuration is otherwise not honoured.
   * BUG 14901: The CVE-2020-25717 username map [script] advice has undesired
     side effects for the local nt token.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../samba/{samba_4.14.10.bb => samba_4.14.11.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.10.bb => samba_4.14.11.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.11.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.11.bb
index 98baad71a..3b1a0f4aa 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.11.bb
@@ -30,8 +30,7 @@ SRC_URI_append_libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "02a3ae53a9c3feb2f3c5b97141b7a8cc"
-SRC_URI[sha256sum] = "107ee862f58062682cec362ec68a24251292805f89aa4c97e7ab80237f91c7af"
+SRC_URI[sha256sum] = "3d9ebbf3280c7cf5eac1b15aeff8857b31151abaec4d2987be015a66c2945d98"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


