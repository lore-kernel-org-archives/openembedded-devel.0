Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EEAFC433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 01:39:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.1699.1642124395730044126
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=OrZY3GnQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80133a60ff=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20E1SUwB012691
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=d3zuVCTt98vWeVc+PIKvE6kJpKfSl9RCqFGt361Jdls=;
 b=OrZY3GnQDnhAgjpDcN7ECOVnHCuPfEtc6ihTIY4wyTDxcge9t9NV3WhSfZg8W0KU+itm
 TxLmSQU1RAPdB42f14En6g2zO3PPNsxIrrsJ08XH9mZyfHusAcGks56Oc7Zah0CqVAL1
 HlMSxWjDVqZFncK4j5bd++2qJYT24pJSqVrdgN75zc9afUyHaz7r+/oqmRoJ4lNIXftb
 Gq2qyhmXVggkB7pWMyRwSfdZE9Of1/l75fi6FByNGPUCnssOjkDLY0fonWaSSlxbpRUN
 vqGc8bA5JvmA0MxIm06WkXPSll3sZlVn00qpf4XAKJlolf3CfmEJPkWK76gFyAX1MaZu cA==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dhy079ad6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Jan 2022 17:39:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGtDq9kOJuamIY0lRRKpgeZtgEBhngQUvO08+EqFk+TJrw7HcA4azqpcWQX+2Ot/zaVQVmjtaAWLlgyauojK+C/Nk7Ef0nXSAvw7APDpk9tXP3wSHUH0y7N//J+mSWMWjiT0PUgLbrR0kjvu0rKf4vKHa6KVJm8Yf+iFoFpE9449/fk3kvn/K97qjntqK8NBf4SQXPWTBkYgHDfqm5h+iiYX+D/QlFM8WoaHBBf5DToeVXBLg6F3Lzzhu/v+xVJ9uT9U+UtbuoULoe1pTgiIX9c8OKgpuwsPO7ZxN1CCKSePy/cptQHOZdo2me1O/hg5eu6YLy7zOgM4kMTmH1c4kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d3zuVCTt98vWeVc+PIKvE6kJpKfSl9RCqFGt361Jdls=;
 b=g42g67B6kpjAS4351DfmvsHBuyz23dhf86Y6YZ9ml7mioH/PVKi2oPrMxM0+3DECpUTslmj4BSTZdaWgopNWcXxtFS7YovcHaNd1Jc8kgHbwqWHNpwwL3ZSrx/nodyE0tuWVg5zQRgmyvgBB9VHNwAZqolFdSqvC1goDUfHZkaB84GzE7laruKbIoc4JSVjijktrvpXd2uo85ua1y0tkkiKAEdT9G56aq6A0Ah68OkynsC8+H7bYbztio+jFtWzPEg7bBRXbCZ6FoqZx8rMy5pYt4NXNvkMKkHcyiTkyN/uISbBOEfhDgyRWe2PIIOdKXSkli4b9+BO8o1qVzgebtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com (2603:10b6:a03:2d8::19)
 by DM6PR11MB3145.namprd11.prod.outlook.com (2603:10b6:5:6e::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Fri, 14 Jan
 2022 01:39:52 +0000
Received: from SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459]) by SJ0PR11MB4878.namprd11.prod.outlook.com
 ([fe80::687b:9478:2713:459%5]) with mapi id 15.20.4888.011; Fri, 14 Jan 2022
 01:39:52 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/6] nftables: upgrade 1.0.0 -> 1.0.1
Date: Fri, 14 Jan 2022 09:39:36 +0800
Message-Id: <20220114013941.229837-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0087.apcprd04.prod.outlook.com
 (2603:1096:202:15::31) To SJ0PR11MB4878.namprd11.prod.outlook.com
 (2603:10b6:a03:2d8::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83753351-5b8a-4745-17d8-08d9d6fec267
X-MS-TrafficTypeDiagnostic: DM6PR11MB3145:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB3145F2496B9EC210CBE1B008F9549@DM6PR11MB3145.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:421;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z5jwY+vRVGsRYo74tc+GyG15jee0C7rDMxMay31yYN6iHXAJTCnBy3HBkC47eMANjF4iweIBxuL9d1oLh2DYk32LrocJfvj414PfDmX673ivGEtCoEJR/u57NI/OmmYAD9HhRACCaTZelk+7pS1DJocLii0/L+00/UF5FcX684xEFcSQA9rmn6kjlX1iCfj8aWzexoGXBMVKGyHyGJEWCF5+a9vtZEkvJdPBSWooPUPMuWGIsgu7eja5ty+jveLw/7mNeCb2cL0q7l2rIacZRdXsOaptU5D7aMULlK86iSunpemx0W5+Hx1awo9YOTmB6MoGPIyykQDYqcG8a4+3xg3ZBNJ19480gawdUkkRpXO83zv15Nq5IsofQGRlSzf2f5ww+paeSh790nhNMdwyCFqUPPU9faepr1Ep5z+CreBvkVIc1carzGuTt97OJLDncU5r1CPl/oPc0jmmruWbGx/Gmvsd3GSLf+GHKnSD6b1fpOp/N5yROh4ZO5qCg3EY+ECOtoYBzM3g5KvQi8pWId4T1/c4GQvTZBCV3asgP40hkwAtcxLqw9PQ0EJf39wjvCD4oG+iiDYY6OyoHkOyT696Qc0Z6Q7ED7l0TCfVqL1AiU+zdOL8PV6hvlHtZweKXuIEQ9EPib5NVyfFs4Nbd8OoDkSuo3Z8H3W6LB4ZKN9LGdDizy1zNznl8MwwVFlfGpDBxlx56fz3ORDUuGID5W1NqUgOmlKSX+7jZdeJtBuN2OS16Sz0pwEpl4MjEjZkxOgwlR+9Q9D9zheeyGehwKLg/ZVdw/GjrTkhdg1lQZk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4878.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(6506007)(66556008)(1076003)(66476007)(2906002)(5660300002)(316002)(6916009)(83380400001)(44832011)(66946007)(8936002)(2616005)(8676002)(36756003)(86362001)(52116002)(508600001)(6512007)(26005)(38100700002)(38350700002)(186003)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GsSaHMMLIPB1TRM+Z6vFvVfx7V51yv5BA7dH5+uIdFY4npgD9AIBbW1Ssn1Y?=
 =?us-ascii?Q?vhUVQgfz/t4v3n+f5rBO/Y3p6/EsfsPJd2I7rPxYwG7YmCQG7QeFUtq+8LsR?=
 =?us-ascii?Q?o1Oy5ECPYfgX8ya3mhL9kf2G1Rwdi2iuh8ENgyi44soS3JXK8sde2PZAfTfQ?=
 =?us-ascii?Q?QpkizbgBG5mn7KDRJRWuFIZdZL/58F4YWG1M7fRifHOYKVp0SKodpAKjHqtV?=
 =?us-ascii?Q?1oSnyZN5csW0vN0MW/O4iOuu6kw2+XptwVMuql3HuzI59kW+1TipatGf5nFD?=
 =?us-ascii?Q?WZJ27IXfTNBvn8yoMNnjHR1VOEgZa60HO96Yxc4MIwwpNalJejNPx/1Z8uwf?=
 =?us-ascii?Q?7uNbo95QDEMZc6BdJ4lUUOqYEK/ba3QLasHMaQuNGcEapmG1XsnmK+YqokFC?=
 =?us-ascii?Q?Vyvns9bBZ9TOOz51mTqQZXC/F1t3QJrSMwNkGEDd8oFE7cxl4591ErDA+Rje?=
 =?us-ascii?Q?uM9/9rh4MOtnAef7iHux1+4SDSPmGDe9DH3i5WfQz9s+QWW+bqqr61CBTaZk?=
 =?us-ascii?Q?xcIyGeGFMS9d/0ZPR2uUK+Yz1cREQEx795Pj7nV+/300izvmAMnTlQRV637L?=
 =?us-ascii?Q?ZA6b1mu3wx6/LBDP+3XzzEpcUouIdVXbHxBGcCpjwI3tC9YoXscyQbCY5KZ5?=
 =?us-ascii?Q?LV1ziWbOYK/oILooc8HlCzwCI6qN1wq9JxjOcgcbf0slW6j+6Py+9e15N/8l?=
 =?us-ascii?Q?U0EtC1NntVNc140qXZCfy6fEYPzDy4a8yeCMHa6sZbSyiB6fAg5VRFQe+CW2?=
 =?us-ascii?Q?bZix1Fm//ffV/crst0uq7a+vkBYwzusAiFOLxvulIJwmpWEUWucRsn5cFlOD?=
 =?us-ascii?Q?pzbouNIr6K8XtFudCGAhBNtiPD2ERFWP3820ErTSvcEQyvbl8mQgMSrDssst?=
 =?us-ascii?Q?qZHJ2V1E3jTf1uuHICa4mN6FMjSId1Yvqy9u/UGsE6VMl1MlNvQIiAA7KadK?=
 =?us-ascii?Q?W/dNnNp17R5PAhCFUAe5YgROsrs64a5gyUC44sgAbUdh5KayV2jlFsuXEAYH?=
 =?us-ascii?Q?WFKVunKId5/4eup8Z8az+ntMTrTxPK7UNZf3yf9Gu9T/I+vdLSTddMsGYN2a?=
 =?us-ascii?Q?4nd7h//gi1W3N6VK17uu4XDxvC6dblrtfcMDoiwX/z+T2LLB2+OcHGBAin4k?=
 =?us-ascii?Q?DO4AL1jq5X9XuKFlf2v/acSQecv+p+ENAi8GZJzoXlloyNAcAtBDTI5WVYWN?=
 =?us-ascii?Q?S/Gp4hmOSlayBk0VfJ6MT3VT4nvDru1ff9wOTjbVMJ2gCmMvhVgLMqaG+FAN?=
 =?us-ascii?Q?4WGtFq/iphUSHmQEJBTBECci80hxrFZYEvMj2vJ15uf/H2RytJwgPiBfE3B2?=
 =?us-ascii?Q?4gbe8Uy2uwNVaPOe9po9G4FedgOlCbWuQNMC5/L3KvzPgWsrBNMJteQfetp2?=
 =?us-ascii?Q?St1C8CrU5tQfVy8I/is/PMKyOBbHEyXQSIkr0GtRP5KUEwAii9/Ig/SGFfjO?=
 =?us-ascii?Q?gopkjsYdLInREnExP1EyMxzlm8dv9BFOBiY6e/PDhFaM24+vU+oc66tE6JG5?=
 =?us-ascii?Q?kkGtfs7hpZ8Uy/kPe12CXUtGtT2wpy3s0O1jzI82aR6+5yBXrIJnIhJRE6HH?=
 =?us-ascii?Q?qzFgCPiOHgmQOege6U4kXdn/4I3TyyJLuaDEo7q+mUqIsXlL2SAznM+Pp0gZ?=
 =?us-ascii?Q?VqJ/yKQuZ4EWP5CFdPoCzdY=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 83753351-5b8a-4745-17d8-08d9d6fec267
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4878.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 01:39:52.4177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UwCmWBU2GlgFbjXEP0xZz2u5gG8TdyM8CquYLDF0jqxcowMZj8TaS4xvhxTg4AWlhXEfLJoOEymITHab8bTPpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3145
X-Proofpoint-GUID: RcYRmXyBeNrDVA6G8VNeTtNG_-SAdpxl
X-Proofpoint-ORIG-GUID: RcYRmXyBeNrDVA6G8VNeTtNG_-SAdpxl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-13_10,2022-01-13_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=810 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201140007
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 01:39:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94815

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../nftables/{nftables_1.0.0.bb => nftables_1.0.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/nftables/{nftables_1.0.0.bb => nftables_1.0.1.bb} (93%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.0.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
similarity index 93%
rename from meta-networking/recipes-filter/nftables/nftables_1.0.0.bb
rename to meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
index 68409c910..91df1547d 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.0.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.1.bb
@@ -10,7 +10,7 @@ DEPENDS = "libmnl libnftnl bison-native \
 UPSTREAM_CHECK_REGEX = "nftables-(?P<pver>\d+(\.\d+){2,}).tar.bz2"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "58bf547daf967a2b88ecb4f425f126006ebde22711db806b25c1d6cf84fe45f4"
+SRC_URI[sha256sum] = "3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423"
 
 inherit autotools manpages pkgconfig
 
-- 
2.25.1


