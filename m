Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752F8C4167B
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 09:54:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9500.1670579680349552614
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 01:54:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=M/ztRc4R;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93424c1fdd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B99JuIt003222
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Dec 2022 09:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=6sySu3W/LxVHtPlbw6AbEc8d1FnVlZ65idTAU/IzXCY=;
 b=M/ztRc4RbBb7l//LZboTL8M1ZgjESg3Z3o1PAaEwFIiJhpJ0xOyfew0cZhozC4BbLU/N
 WZ4Ma4yWUHSgPHoxPA1V+4hveTTTuS4jZc+vQCDBo4xk3HFf+6q979dFuxBe4uRMkMCc
 1Y9yJdvwCmPfwPoGI84ShE0ALFiJFVEw8XF4+aijrR//rLUj7x8BTllz6iGF6+CGl477
 6Lg9igCOYiPVv1XxKovkWbXq8GVR4IzJXhh7XeJbZM929fs7xnIeiFyA+tQBtzivdkyW
 F0A8b0nsO0iKCYEwp3CXg+AOaL5ImiSFxob+onFx3HiWg51naNqEoFQ8Suf3XdeFNKPN zQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we959p0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 09:54:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wb71vylSGCIU9QQhLI1yadFmG9qWupRIycQ7jZELXYYWBdtGY3hQgOImeCa8tAjtuNRck8WbNH+igfIoQtdQ/s2Sxg+uv7ME8MBaR5ctQwEyk+I+UJP40a6OPYapEDu17IROp0g8ozASAHU9mCckU5qGPdIsVkCMb2pRSMeQrx52s6bJFO0Bj7M4zDGMLyuv5IpECvoM+I00uGHbjPpBKk/dPgmQcLiQm0Bve5O0QsRBY5Ez98/TiX+N7srvGMhc+YIBkbdch4iQFMGS9qxV/GvItmSnnS26NCjmJON/sI8BQkcbCG5s11J9LXe2lWRBxaV1g8QPgB6nN1f3DfJxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sySu3W/LxVHtPlbw6AbEc8d1FnVlZ65idTAU/IzXCY=;
 b=lFO5dsnC95XuhcllcsOASHcTImPuFktAkDxBpfUNt9HMLsQab0m6en793Eny8FM0MwjyHNF6QLyFycE5a96RIHnoorcsHwntG6skSTENwStZLEFtxQryaBkob033Z5y6kEyjUfbr4eXK7ss+xinWNKe+cN4eCrjzeOzJ7B4l9IFgzgdkaafqO9b9t7ZMPYloCZ3HqewKRGJKG0Cv+juYeLPPb5WbijWTd+xfP2YESFbL35bqPg4wy8jP+0bV/RfzLS2YbIGh7uMrKdfzhjUA1kEfTLkfBEUouvU0ob1zQUCIL9m+OeV3m43XNF9OSVdTShTa+QmcuIcaqOtsqrnAkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.18; Fri, 9 Dec
 2022 09:54:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::d8ac:d3b0:6765:63f7%9]) with mapi id 15.20.5880.018; Fri, 9 Dec 2022
 09:54:36 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-networking][PATCH 2/2] networkmanager: install config files into correct place
Date: Fri,  9 Dec 2022 01:54:23 -0800
Message-Id: <20221209095423.43705-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221209095423.43705-1-Qi.Chen@windriver.com>
References: <20221209095423.43705-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR04CA0035.namprd04.prod.outlook.com
 (2603:10b6:a03:40::48) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ee5cb7-468e-4f06-b001-08dad9cb6178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TonGwjOcVDapPsqo+a1yW1xy9+eaiNZGC4xZ82+AE77D8j+x5h2p8Yn4XOnxf1WYhXDh/TsEfj4knDza8n8svwYR167adfXdK52iBDqyLO1q4LmZcEaLCICpwnnh2S9ckQKxcBJg4115v7t0+7TyHoL9SiQsjrvFqisyrPp/UsB76Vll2PCr++qx/JlMecUy9Ncpcs51wOhWtmMjB6tWPqfMm00l43whFffrrDaZ0CT550nq5TuG3Al6geR3ndqy0Dd+8ywv+CGvPSbdTMn/lyoxEzmLXx5kVKerVHO4utQn82HJi9ZBa9w0EcmDpJdTYrZ8LFYoAZgsRmGfrzbEq39HD91ey14Gieee29GP9wQJ51Ja2HzBAnvJY0BqiJYNUf5CzzPEe4fvG+eeSSCQuQBD0q177h1CTgZOi/My91VU9tXWZLl68KO52v7Y5EmKvhDQBlYQnLspGGcb4425VgnVW/IzWTFNmomrm87agrztjCThUxtK/768b5kWGbGwiOLsyeuiG6k/B8x8gX2QCdxDGAAvpE9OBbk+q205usWHmTbZpafUltfgy236iLnjUKpDMxFV7YvktglmjgzYeJl5NL6PwbyMiOM55NiWyz6aHHwNKPEH4b0oKoKPocKF6YksXiiuvvsfdfx1YpG11jVVvTQYcO1s3/qWO0ggA6XXae3SlhaFDvsrq7SXhzr7ZOnqeohs18RdwevPFIKQtw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(346002)(376002)(136003)(451199015)(66946007)(66476007)(66556008)(8936002)(8676002)(36756003)(41300700001)(83380400001)(478600001)(6512007)(186003)(26005)(6486002)(6666004)(6506007)(52116002)(38350700002)(38100700002)(1076003)(2616005)(316002)(6916009)(86362001)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rltfyuJBmjA/mT2GHATpoyMn1K5Yi7BqvT3DZU+KLjpSTRWuN8a8ekbih1Dt?=
 =?us-ascii?Q?Hi7fEuONuj9YDwg54PTqNgXJrTc8t9qVgAKlrC+4gdp+vz+W1DavUNWCiwL7?=
 =?us-ascii?Q?QcsgtF3Avwww4tMd3HmiWKsjLrcTnaOXf9F17CPccyfciaAeYtOFfwOcTakP?=
 =?us-ascii?Q?aU7VjaSULHQ0IiZCJYtuZVZ9qUo6BjV81LUpxZmihIMXfTpWGohTroBumuLI?=
 =?us-ascii?Q?Clt6R/7fiIIuksiDBXJt7h3VCQyvjxiw0ydxBo+O/i4tLf0+AevtdYuOXVpg?=
 =?us-ascii?Q?3BatmOQL5L/rgpTS0dJJkpqmCQbX9N7pKj567CV6fQ6j8mo7h+7LcXkhRJXu?=
 =?us-ascii?Q?fECk/72UpnIF8MuNSm3PFtJE0znhg6UpAC0Gl0oH8ioZP6XKI+Cq7t16NJNf?=
 =?us-ascii?Q?jXyt5SZlOoUzG9XFgyAJUe1072UL31iVEOfP2tJE077B0RZlSt2xTNX9O/xU?=
 =?us-ascii?Q?O0YQVsACjrkTAUnAzDnpy3lGQ7bEh/omDMcBbvK+QVL1kdHfywa/gxLsfTrW?=
 =?us-ascii?Q?ABecwE438SPw2zKIW1D6d1DWpcJ4gpHzM5rsozJERPH60Rz4UuHvB4+jYf4J?=
 =?us-ascii?Q?kFofo0IiQFUu5ETT3iXW3jjyEmfUqw0NBNHpceGlYT+/onupG1+NnzIGQ5SN?=
 =?us-ascii?Q?RqFXdSmOPXksgqdjYX0Tkfr3s8/rGG8ocfxrE8+2/x+9nfy5gpcg5R/dhs0M?=
 =?us-ascii?Q?JZoxDpktFMSr2pVbOvZssHY0vH8HoM3aWasE98O7t7wjD938uhwIJsFvvuib?=
 =?us-ascii?Q?JHq0TKY5qpVTbtQ/F10gBxzrSzK3OGk25tEJAW8T5O4l+/jm2y4J9+X/Vm0N?=
 =?us-ascii?Q?/IYTb6VkVx7RjI31D1hstw56IolL7pRU02LXNqrZSnk8RoxxKXBffKFef2Gl?=
 =?us-ascii?Q?NIdxISzMS+4ZpvGJgBK6aljRpNauieTK6YH+ZfPpo1JTx+LgJCwYDS8O6aRq?=
 =?us-ascii?Q?Xa8ij8qu6Yv92womIRFD6Wi0MuvQ875SZsiTLxQm4fOiKW21pPNxvppLOqUc?=
 =?us-ascii?Q?OXcntnrXqsNU/jU1uQz/mF2W2LiJxFTW6K/5dgU3NTJeRRw9GJV0LBhOYIUx?=
 =?us-ascii?Q?0AQCDD2265sm5w85FiRs3yTEepfFVSVQ/0cM0yJc752qQTsq+Kxbtd+bvQER?=
 =?us-ascii?Q?TuYRWe+8SoZwaIJX8ZQHHvCsBjrGdRKkTi2NjpqjA8p21VRYaVw0pMyJKnGP?=
 =?us-ascii?Q?betBQAuwAaZqgQGwlYL/rrVf9TzOBYtrMDHC46vn8Fw9G10MDRbV62VwNxCH?=
 =?us-ascii?Q?FObjDv78MRgiT0e+9RIg4mwVzYjuGsX8Fbz/BJTlRISWz9kEdk5amepcozEN?=
 =?us-ascii?Q?P454Tjczcpyd7p4R8hWmUbr3Yel3AIH/3ITBOEnG+rnYiZ+5IGGSdzVAybIp?=
 =?us-ascii?Q?304z6yRGRl46FNjWxHX89l5yx0/V8d5G72obfvGC8D9rLGEiOfZ+0Gab3EsO?=
 =?us-ascii?Q?4sW7tPqDicSABk7oVon8lxVsHILzmPPNzhs7Ob1eVdlb7kv/wsgKFlTgeUHV?=
 =?us-ascii?Q?KfwbjZHTLx+s9TbTHwVpL7ORX7MhGwFzIJKRl+qLlOvmRjWb1hOPPK2GepR2?=
 =?us-ascii?Q?ZpoKzO5oSNEQS3WqDuB431ZGi7tKW6aE+jibewijJW8B4Sa6OnBe8wxUHapi?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ee5cb7-468e-4f06-b001-08dad9cb6178
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 09:54:36.4952
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gT0H3iaJ7NSKjxfPTgfuAVXXdBmjk51TwVTq7nJgtlVgxXOUvXYja5/DNU8ptSDVDYCclqXLiSjsYijCBoeNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
X-Proofpoint-GUID: CbKcIPsH4VnHENSVoQnc-0_0duxC64OH
X-Proofpoint-ORIG-GUID: CbKcIPsH4VnHENSVoQnc-0_0duxC64OH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-09_04,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=891 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212090066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Dec 2022 09:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100003

The current location has no effect, because NetworkManager
is not looking for config files there.

In meson.build, we have:
  nm_pkglibdir = join_paths(nm_prefix, 'lib', nm_name)
  config_extra_h.set_quoted('NMLIBDIR',          nm_pkglibdir)

It's clear that the configuration directory should be
nonarch_libdir instead of libdir.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../networkmanager/networkmanager_1.40.0.bb                   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
index f5a710f98..af823e5ad 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.40.0.bb
@@ -287,11 +287,11 @@ do_install:append() {
 
     # Enable iwd if compiled
     if ${@bb.utils.contains('PACKAGECONFIG','iwd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/enable-iwd.conf ${D}${libdir}/NetworkManager/conf.d/enable-iwd.conf
+        install -Dm 0644 ${WORKDIR}/enable-iwd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-iwd.conf
     fi
 
     # Enable dhcpd if compiled
     if ${@bb.utils.contains('PACKAGECONFIG','dhcpcd','true','false',d)}; then
-        install -Dm 0644 ${WORKDIR}/enable-dhcpcd.conf ${D}${libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
+        install -Dm 0644 ${WORKDIR}/enable-dhcpcd.conf ${D}${nonarch_libdir}/NetworkManager/conf.d/enable-dhcpcd.conf
     fi
 }
-- 
2.37.1


