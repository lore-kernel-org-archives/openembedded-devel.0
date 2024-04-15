Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92169C4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 06:00:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14521.1713160797119886942
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Apr 2024 22:59:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48356a946a=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43F4Dr9B018039
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 05:59:56 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xff8y9c3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 05:59:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UZ5Sr7mEZjo/vYiE6m2h16nSOQiUE6xuY+WRT2+5bN0sBrAQ+P+l5Xijve+oqfrz0LbGQE7chA/mwQuH6HixwuKoeOqmZbvO5PobDEoHzKDLCxtjfQIzPFNecmgRVCJFE1ADn4dtmtlD5xICYRBjM8xs9WT0lPG6q+3F3ZXccuOzDLE8muB7mFaXP40uETh2h5QiemtA4CD7yggcsabKUUVofctj7Dsyj++DXQ7zXfjnMePXVLh5HpeLS3op0Cxh350gApUg3tGGJno5Dj9sPpQ3KAmvLNsAG35rHrHMnAHaFRE/udstIAw8ueA6UTqe63nmh2MhdGuHyEI5J3UpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6W2kRgdj+xKK0L/SvN2wT3hnRoQjoXhB1NMc5sif9Vs=;
 b=oOni9IjGL5J9HJLRXpzjICp2DSDTUHGPS++6CEsN5tuV9h6CQkjPXk4XhAO541J6rQnJJamAzBptz/HRNSSkSDjSb2QxqCg7OAS7Ah+KMMFveTGOQ/oI5XIkYLOX9UHKrAKY9jiM9+r9C5V6xUdWikFS9vhJzAzD4KpB/EGL/EquF0tbdBdBG0gJYzRrdV41omOutLNodHN3Ol9XTSPhDNGQY9KJjsxtqHJfG2DVfoU0e65PdmNGPy9EtLc+0KxGm1fVbgwvPbWzggmHGXfxlzE8GQU8Ss2F0ahCbNDeZ54LpGCqGG8D6fJVLlR8vekibietzStSCCnJqvmeLocaFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB6381.namprd11.prod.outlook.com (2603:10b6:8:bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.29; Mon, 15 Apr
 2024 05:59:52 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::e7b2:a7c6:5d72:2855]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::e7b2:a7c6:5d72:2855%4]) with mapi id 15.20.7452.046; Mon, 15 Apr 2024
 05:59:51 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][kirkstone][PATCH] bats: fix bats-format-pretty report error when multilib enabled
Date: Mon, 15 Apr 2024 13:59:37 +0800
Message-Id: <20240415055937.456625-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: c335dd53-8270-41ef-1522-08dc5d1143de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PpyRPx1SzZOUQlDEpFhjg6TZ3TLR+2CNHH2Joj41vH+6FmoH8Q5VvpYS0Fg+N3nwUwknYgielJ89WvPxU2VQcx/x3bd4Yx6tXp9yiQv7Fpf54BYFpjbHKjNAinHnmLgrDAM6dXgss8GomALEcfVTHUxaEurr3Dgt73M6NV3MXZVrYUCBTug1DS7s4Vq+h0ukEz3vkMaqmJIFT4VeynpSMH60o4+7qKMVHfrcfVyWWKJnWQIxTAVeWrciLJWiYLFl6leVDqMsB7FDGjsoKrYyPuj1oBzQVUamQxEXST33wNi9+bjt4tbMrEIwadSSxmNE87dp5SNCjPMENROmSYaghMRtzY/dn9kLtRKQQRB52uq2St2uKS/McMR8IWcrNqzinBtmwiuBxoRauwJSgKmkXZ6nMyRQlfWErnZx/G2FsWxt7JVBi6aopYIuoWaPUMAMJox5WWNVHmPbyNW949DzTFmzJ9u9fPEoLqlZxWw6pWp0G/KExvhMCaiAgoG9j767EYta1WzeMARfX6UM8LZraAJjNaSsC8z+EfDyvWtgT1N+tCsKYn4jW7OiGNEC3W5CY1sSUwytk1qQ347IMihGvCzGuBCAD3Fk9d57g0c6Ow+7f+dYlyXHdvfqCoNC1NSCa8vco4j/FhqPsXxiUu16KK59yuI/Ysz5AxGMehG+Au39PfR/oiieRCICbAJW4IibZZSxEdtxMofmpnll25lRm/1xyZYN9VEJuzOSCsol0W8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w2X3U6/b6/C2pDkq3OzTNlRjidixY8TCk2v/YWmb1rJWkwxXR3HpzyvggaCZ?=
 =?us-ascii?Q?hX1vCXv2bI63yw4U5ajjbn4tKJ9DB2xJn0WWhvogT26Wt7KG/uJB7I34gTw2?=
 =?us-ascii?Q?w1j3XNBYdRxFT613uCzk7XEkpuyldaWjYwv4COSWQCUI9/eRkVc/t7gD5HxL?=
 =?us-ascii?Q?S9Y+BwRpXirzT4k/KIHjyMswpgY0KdMJ6jGgatOJrSE3XkIxLEH1/zK9ayqN?=
 =?us-ascii?Q?2LpUnleVoVgyawdO11vH3ije6woUra85QjYT/i1QErWRm8wjlcf0cZyI82sY?=
 =?us-ascii?Q?x4iWTQ93j0lQiAEn6zZR/VLQswox4kSomu30nBRE5/FiY9vXKY8rdXwLT9vi?=
 =?us-ascii?Q?IOehnxfn8TwzKvD3KCNUXiGErGohU/dXDHIKqTSX/IaBa5rmdYelbg0jbU+D?=
 =?us-ascii?Q?2btvvQLOwiazSaMlufmTnioyHUH2Ss/Qk+t0xZi728TOXbhOagghWdo8iMJI?=
 =?us-ascii?Q?RKhrEimmM9rYWwuCBOjzhv5inxjoZg8RwOjQnYpWDfYAn1C0WHr8vU2PP9wA?=
 =?us-ascii?Q?TO8+Z+9L7CypcPZZZ82dEjjqft747iZ3/hI4vmHoLUhjLnD2k7goMBEUVM8x?=
 =?us-ascii?Q?vlIdkV6cCLC+OJIyZyrAy/DkH4zO7L3m9tlIZnLtuPCcnUKGL6SLElsAJ+yM?=
 =?us-ascii?Q?uNgw4BlrDwPHzib/ETqiL9HyFhxLBsfkmlkR3SommffN7EmRImoouMDEZilb?=
 =?us-ascii?Q?JJfTIEiHTsLcPzMW4MVofsdhpShBUykaczT4reVRXCbWyT3T7wJ7s+8WuB9j?=
 =?us-ascii?Q?A77w90GrQefbC86QFYuLEy8WJbv+xrVKD5HJnevgYtY1YdiTmKNEVa/anfc2?=
 =?us-ascii?Q?QOgc6aWaTg+q/1KdAVwzW4yzxKn2gZ45QPc6xJ1WYvsA8M/S5vrjmmhxzDvo?=
 =?us-ascii?Q?2MSkO8g5719jvOHbHY5kebT7cKWawPmfq7zZdgq5guTWnnIzgBRyk0n8IdQ9?=
 =?us-ascii?Q?yYNDS/MxpUmkHAeo7bw7B2acJIzK8wp3nE19yfukiRQvzfZYGaQnh98qyexP?=
 =?us-ascii?Q?Yj9YIsLNCGMvGIS7Vaa8jUA06sWjfK9kNylx9njiCBLjOSytVXWwaPYc/VlC?=
 =?us-ascii?Q?X1Vc3BRi/xM09uGZw/aHtJwqkL5D+YzPmUHszV01Uzxf8E6R5mnJ+V1yR9je?=
 =?us-ascii?Q?MkDUGV1hO18F4UjHtUwNLbWju2ZlJUdQXDw9wSe3bnYB3Fa6jDD/AX8CTAST?=
 =?us-ascii?Q?sDqxT9fkc4+JFaPA86mhuXO7AhMarYZu2YwAXIpCZ1YhYXs+7jUA6JZ4zt7k?=
 =?us-ascii?Q?n4UK7Zdj0tJnGK/qJO++LzzCWBl4lNhhtjKmBp+qs8HbOtq4Cz4hXEZczn+I?=
 =?us-ascii?Q?BJ1l/564LGffIW2LX/4xx8Q+htJm/xDPNDdhph/L/CQkmJOSS9qpmvaoXEns?=
 =?us-ascii?Q?zm+Qwq6cURioCt9AsBu8q4PS8HPNoYpB8pn9s39E80x+ZUDA/irOU/ZHl62H?=
 =?us-ascii?Q?y8+HfID+rFNWRynEJFzroYPIOybSNW6jxLPmq3cy4WLjpDieM9hAJmmE68Sw?=
 =?us-ascii?Q?WLUek6C+PNHf69hg2/XHGCIGihq6dPswZNICypqilIxFMMWdyWgzgoxiZ7qe?=
 =?us-ascii?Q?GupcfF7RlZzFoYWyy7d0mjeMww2EQIcb/7DvSqa3agRQI2iKuWLAXp5jlQ69?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c335dd53-8270-41ef-1522-08dc5d1143de
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 05:59:51.7242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5NVfjeRSRh8L6+vRDnFGg8WYZqwqujQSjGVaBcMWkEPDOYn6DAVC39O6K/Ctiq6t0d9rFwp3dFGStSPClYQqW0Xa3OxtLQfzN3t1el831E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6381
X-Proofpoint-GUID: O9F3rUSwoHiJJYeBk3yJylDuGFxCLQDp
X-Proofpoint-ORIG-GUID: O9F3rUSwoHiJJYeBk3yJylDuGFxCLQDp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-15_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404150036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 06:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109952

From: Xiangyu Chen <xiangyu.chen@windriver.com>

bat-format-pretty hardcoded the lib folder that cause it reports
missing formatter.bash error when multilib is enabled.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta-oe/recipes-test/bats/bats_1.6.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-test/bats/bats_1.6.1.bb b/meta-oe/recipes-test/bats/bats_1.6.1.bb
index 7d72a5198b..3dcb51972d 100644
--- a/meta-oe/recipes-test/bats/bats_1.6.1.bb
+++ b/meta-oe/recipes-test/bats/bats_1.6.1.bb
@@ -19,6 +19,7 @@ do_configure:prepend() {
 	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats
 	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-file
 	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-exec-test
+	sed -i 's:\$BATS_ROOT/lib:\$BATS_ROOT/${baselib}:g' ${S}/libexec/bats-core/bats-format-pretty
 }
 
 do_install() {
-- 
2.25.1


