Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F01CC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 03:08:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7710.1663643308809207448
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 20:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L7gXOeN/;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62623de0d9=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28K1waos008707
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 20:08:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=/NnnfsYSNCiF0r8/2eBwJ/7XGnckzYW5sT8U2DqlSEg=;
 b=L7gXOeN//H6EkQ68k9mtfZew4EAX9Izvr0WtAEzZNVFwWQdeW4RPWgcSark8WJ2ooDT4
 g/iNPSe3m4PJvN83bp/hyYDXl3p0jKY8uYqWy0f+xleQ/3YvNMWAmHlFyFG2fnGksjq+
 aRTIFF5l60OM+Z+slVGdRqAS6VgATPsY6c+khrOTMf3t/Q3T89FebVdlVYqxb1WjfrcB
 wj0ezRLrWFisRJtxfi18kMnH0eLv77XmH8/r5XfGcKQuvP/PrD9+i2hT3hZkLy5cl8ou
 EpmJTV72wfTVODTahLg7zShycnD/HCEwK7HNouy/G9pF4Qg1AU7mz4FJPrLf9fPBi54m 2A==
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn9h3t1sq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Sep 2022 20:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnZ/rvBrVnILQR6bwK4pHOKfutZrR6QdLYKTnIeuFL8pdISDDS0yx+IqREEVdP9s93hoaJIm5EnPTwmjPaVzdaOO5/NzCwbCAz8e0i3kedxwvGPTb/7Z2JC+98wWnHGFqnq8QJpv8j0PNF6kSPwzG/2C5kNq1jA9bNHZHIGONB25n5M7oczzv8aZmClZFD7tbAV8XUxMDC6iPJ7zETpwL7uVu81kI4TixsKtwMfE1gwelqajQt6CqWnNJkcqNsUEY8Etspvnveq7/69sUqZfXYUgrfjcbWSN4F5CesGWos99dUzxum50U4daY0+alstiAsmkVzMiophPS/D6z9mD4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NnnfsYSNCiF0r8/2eBwJ/7XGnckzYW5sT8U2DqlSEg=;
 b=jcfBtaQDi9/5aUUBugD0O9kNK2RAMPm7gQrRLCuN4tVzipSLNvj/i7qZIGZKFRBQrIPsxwlQ2vS/BWCVidRWyPdlkddd8DMn+A03wtPUvt/QoJPtptrYhj4XRbQcQk1GOniX5tbsMsjVC2IWREhJIv2xO3qZCtLbAApttf794GSIjPYcFljFcq4iRQESBkbzuP6CXBs5x8T8pchBRaRDtvjdE7KGk3BZrxDQvF1DBOopMjsj+6tAn1W9Fy4+32GQbfLU4uQ7GFS/pGEQl7ydkJ8RhQ+vKUsgo4w5sZCa+hlYW9RWCfdlE1sS5rKaujJolQu7HMEGsFdGKRno8R1LXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Tue, 20 Sep
 2022 03:08:25 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::c112:6e86:1bdf:66ed%4]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 03:08:25 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] passwdqc: fix the libpasswdqc FILES setting
Date: Mon, 19 Sep 2022 20:08:13 -0700
Message-Id: <20220920030813.19053-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0031.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::44) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SN7PR11MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 795939f1-3bfa-4362-b350-08da9ab56222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sWEKzAHmSlQBZX6l371f6wDzm1KXyinV/lvH6oJCsv8y8YN6l9qvJd+8vN4VHEjd70MV+BcJjnSBCFG4jTqLKcQspsyxmHi+XrdaCsGMn3sVPsR1aYocryq6P6N4zZSp6ulBUmKq2DPKiuJVk4zu7cBMNcNVA0WAFQWzhz58+J9SsoULlhzbHaS9i0FF5jGo3ppbbdWcMRaTa4/RYiDECY0iTk97m5jeFw58n6u89ns2Wlgpdl6eTAW01lMflmMefEezOmQcRYMc06eTa4SC9qKJXaW35d5/3ro3IpMXoVtZ7UUva0V8mbwr+ZVAEvzMNKWIXgczM+EVrFn28Y6IuBTGWj9Vo8mmozIIqR6Cqa2fd5W3DfvaGKqOmNu8j583nfRR2n5E/3omKfFQV9nVGzMQFGxvkAIdj2SV0F0Pmrde82kmT6AOA0AROSmIiDJneNxuXusxZfd4V9zsCX4MzO0sCzN1FoARfGMkKaIDg1jocDYry+MryS1PQlifP/39fo4u/Suj8AxNkPmVUvpPOLFATQmD8rSseAR1vtut8khH92bTUv+7GsA9QLqoBRDio6yfDtFsRynqNNILP1PuvVGClzmNVSgnsowVS62+DGxBRBz/G0+5XbXE99fXwxli6G3v02XS1ZM303VTEpNilLGK2bvfIfYpzDJgwFSH6+sSbRMx9Mr8NXuQ2h34nbymw3/x6x//qi2wUGLo/DkB+LRjk9dIJ95Dk4hUXf3KBlhq8aQoftoRbtw8z/K1Iue/9DCAqRpRGoiCtlRqbPmHBw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(346002)(366004)(396003)(39850400004)(451199015)(38350700002)(38100700002)(36756003)(86362001)(83380400001)(1076003)(2906002)(6512007)(26005)(41300700001)(6486002)(6506007)(66946007)(2616005)(52116002)(186003)(478600001)(6666004)(6916009)(8936002)(316002)(4744005)(66556008)(5660300002)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?gnp6FsPROn8Cluh/fkHf0trDYOM56Kk7RORCB2G0gzEiyAJFDK4DL9s/ntJx?=
 =?us-ascii?Q?xkOfNw4bMqXCk9Y0OncacjCZuQA99hkTrQxgfc5d2cUhQIWjrdE2aXJTcPOd?=
 =?us-ascii?Q?HgbKsJpcfAG724gAa7Wb3ogoNLOxzVZ3SYvIAm6mgSfQoNS5oOZQU/bWtsug?=
 =?us-ascii?Q?BXYaAPyBliRQG83/da+qcVo25HbhDoi2ioeeopPOaiqBqx82U3lnja7XMA85?=
 =?us-ascii?Q?g+2/5C1RTUCTncdZIEHWiQ5xE+AOUySemsXPVjtkIvD6zo16gudcRl207TL3?=
 =?us-ascii?Q?Tf0QdcZ6dAfHHX/Mlh7kkCNSOcl42KU9PEpNnTlJoMJ50mMFG6bUsMiikecl?=
 =?us-ascii?Q?/hjSubjx9pXb3Qf/m4rULRtUpeyvkSNHwx/FCDRwBpIUbDTqAMlom4TbsXVe?=
 =?us-ascii?Q?Z6ok0ktJ+mm+s6/xZzxmzIxSc9j56Vik2fnUUVOMzKS/IYOYAL4yLG9VypFy?=
 =?us-ascii?Q?ytP5tlaX/9ATa4xlbmLPK8Rx2pPMycsqOGcb3DhizO2MA+sD4SLkEL953WCA?=
 =?us-ascii?Q?41qa2CkGYOKeONHqxFygUSvQ7BJoHcCYTqwhrMyg8vQeS1F+J9ogq3JQaHoT?=
 =?us-ascii?Q?WsFFdh2zOP7Px3HoTBEkVoYmtVLSJWy7O0/PJx9OX59IKy+waoc4vFEX+Hy2?=
 =?us-ascii?Q?H9sfzmiv9tq0YshNwF1KF8Z35czqFwDs8EoZxf6xgSs/Mwk79AK+X5yumGXc?=
 =?us-ascii?Q?1WjpIK0DOwvgyN8AOvX30LyS9Z/jBZyVntV2UIU60rIGeP6kbbjMAVgOfaBW?=
 =?us-ascii?Q?C8difI/yWWmG+VqOjW56ezqnt8e0/LAFmuwe3ec4qDV9XP/b/lIxPxQTsZEF?=
 =?us-ascii?Q?8Ax4xjePhzPfEM8uPzR1kjSeGnVpiwsAmnH+GfP6TjYTq8spOByKiEXXB33O?=
 =?us-ascii?Q?D5KoWTfaowXDsYAbTiGAuGTq4sXVKPMstS6YA+lT46dYQo4oMtY/Z+0fJzKS?=
 =?us-ascii?Q?mVnyK6Kzus4CQkEGpVBXTi0PY2ONmgXLLIUgLvM4/b/RTsZ3tnzn9VWad7+/?=
 =?us-ascii?Q?WqlYk/cCkUsVfLV0U0ekrCh/FZVpok7kwvBis3WxwP0XY7QsEWWJBXVI6qBr?=
 =?us-ascii?Q?dwdwLMkEfzZCpqwES9OWqDqvNYnaYhCHnSw6ua1K1rFkWA9sEShwstMn8tJO?=
 =?us-ascii?Q?SDRm6uf5bAZhMZTxnotmt40oFeTDesgQYGDaaWGmWvGxNXdQfjWJBiP626yx?=
 =?us-ascii?Q?rC0842a/Md6xPiuCzNi0P0lMHW4ZwjEHcLs4HyoQ8X9bAyCW3g47cgHkJQ+l?=
 =?us-ascii?Q?g1ikaEYSNLu65fJqUWZxLdE06jtjW0iqY5ddZOZyg622Q4bDMq1noKRuZ5Fe?=
 =?us-ascii?Q?ZwOKBTOeOyc2jLRDQRd81OZ5XQwLuK3O3sOgmHgd2MoOZE7oZMmMZJ0GvJVW?=
 =?us-ascii?Q?oHNDZFpZMaTn7/iPUmCYRcLi36zokU7Y98OQsL++w9XPpkHaIDdLQ7CTA1Vv?=
 =?us-ascii?Q?WOKjYpMi9MdKLA7tCbaIXOMpsPlz6GF4OQehjppVvgnpiJMWnKf8/Mok95ZS?=
 =?us-ascii?Q?TT43K6z2DoGjjH9F4J9hHHA8Xy1bo6AWV1cOUngxxySOFiFRupH95KeGmhGZ?=
 =?us-ascii?Q?vjuodU8sv+zc+CNaPCvt5YTp9pHk2eflJuAXOk+r?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 795939f1-3bfa-4362-b350-08da9ab56222
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 03:08:25.4264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QOvnDr8UrAZIBXngTbyQeX8E/ghd9VcBm5V4zCEZfCjhLXUzTVuIjJKcRrsiAtFwrvUczepLFmwPM25kLa6vcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6677
X-Proofpoint-GUID: raEwJVnouZNW3IUcruwRZflFZZl51sg6
X-Proofpoint-ORIG-GUID: raEwJVnouZNW3IUcruwRZflFZZl51sg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-19_05,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 phishscore=0 bulkscore=0 mlxlogscore=490 spamscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200017
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 03:08:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98899

The actual file name is now libpasswdqc.so.1 instead of libpasswdqc.so.0.
This fixes the following error when installing passwdqc:

  nothing provides libpasswdqc needed by passwdqc-2.0.2-r0

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
index de4bff8c7..8462701b3 100644
--- a/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
+++ b/meta-oe/recipes-security/passwdqc/passwdqc_2.0.2.bb
@@ -57,7 +57,7 @@ do_install() {
 PROVIDES += "pam-${BPN}"
 PACKAGES =+ "lib${BPN} pam-${BPN}"
 
-FILES:lib${BPN} = "${base_libdir}/libpasswdqc.so.0"
+FILES:lib${BPN} = "${base_libdir}/libpasswdqc.so.1"
 FILES:pam-${BPN} = "${base_libdir}/security/pam_passwdqc.so"
 FILES:${PN}-dbg += "${base_libdir}/security/.debug"
 
-- 
2.37.1


