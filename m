Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCC9A109E547
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 04:31:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41094.1774499457998412238
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 21:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cyC1fgp+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7545c1c00d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q2xma71804819
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=7/WSXUmJ/b1E5GuhhysB
	Bs5fKuy9xBAUc/ZFxT/lxyY=; b=cyC1fgp+ymYoZb8tc3EaobNbLP17pDM1i/Ts
	Zc9MPrb/Bj65A7S3zoI+9q/ipXBRpILpH2a4LQfkfuyIAmDvhgLv36TPWThXlRym
	HZq/ggT5/8a5cn5hjt91iMFoOe9k019Ojh8hzeGCtdUHJ36p/a5h/6gN38nVCs9x
	KR5g15jho4i4o9tXPZtkIbFI+cj+1+BjgaRduOsijzThq/3kwkTJxwZoM/cyf4CP
	hCOKRubaJRVDXjKwpfJpfkhSi+mz9+ErqWhQcKMExdLPPAmMDGVnRlsk4KAN0AUr
	DJtCvgHdf/Ch0iIUiv4GccwWJ5RTi6A2jWwAiq5zZzIcMUqlLg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj861sg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:30:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nuDQIPUg/qVR3pGlTz29aj+uwOp/mcOIMsj7csdhCKEsq1y3SWCxRJ8XDg1GQ3vF5D5WTpKhJFzrpvV23dXnG8BmSMZfTTDlyc5IEL+oIXj7oFBDmLIJcb6gG+a3xd3n8JrmbXnC4JCDQaRVwZ2NG/7jaJLcN4gQKRKrqxJHrt8GKXAQ6dZsJFMQ3CnO4m36/+QPJxet3KSrqbYOhXML+THJXraqYmi4hxWydyAkYhhpXIcPqHABbTVDqqHcBlJ9H2wgXxpCnsnosgddsKFPjoNsN8tbpVDS8aTUd76LJ6vMIE8o8pHHwVJ2GIHVIU03jE9PuS2peMy8xBXgLVfJLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/WSXUmJ/b1E5GuhhysBBs5fKuy9xBAUc/ZFxT/lxyY=;
 b=aGlEHZzbWlH+jPQdY+zmprLranDeSGrmB6EYRoPtiAoa78PL8rjcjRpfecnYBw7ThQpTnB8Oz96D59JddfzXOEMe83DmOaN7SwODII6bjoktO6zYA1oJOUjupOhL02TzDkpqcaaL3UXBkinXb5cvOa12GBQj/OECnXvBYHXR2rJvT7oVATrJ0c8CUw5BLDGyeKnDyjEnqYHpj3Ikxbng+4fEzjrDHPaa3Y/XUMN0+43OobouIWRG9wGc8pYzd3J588UYaLyydl+o2HhJfBTgOk6GUR2hYJrclG6q74b7+m7i4jds77FTmK3dZnX5HCohc3DQSRCOA/oNM1a2nLC67w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM4PR11MB5312.namprd11.prod.outlook.com (2603:10b6:5:393::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 04:30:53 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 04:30:53 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] librust-cxx: Fix update_crates command in crates.inc
Date: Wed, 25 Mar 2026 21:30:40 -0700
Message-ID: <20260326043040.4009965-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM4PR11MB5312:EE_
X-MS-Office365-Filtering-Correlation-Id: 81f37c0a-a1ce-477e-91be-08de8af07776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	FLRaBDcygxrNt09aQJN6rQ8ewiJGkQmjFw27q0sQyLzxMLK7oocTWTNUB2J2qf4Wem9hXzNd0RvM0bxWSCUe9f7GtjwkUGu04zEcbeKLmglbAuhUfJGrspYrCPIzohn6IUFaP4YojpIDN+jh4nUaRAQHSj95/FUJjSi3oHuqrO3TlP0mk4sIkSowY0zA6V5sUptN2cNSgDXZbtynEeY2mUuh40josWsgEwvs2w1T/hljzOOxjuwSAk6iS2WEws9ghCTBsONJmlx3vRdyYWK0/PkDKA77eXpv7+uTTbJTkQSPyI4hxvh6+vbsJmhDOvFmVMyMAi1K2SLR6ezYVEYVVSvZYtzlAIvtgxVNtV2MzI2aU951VCnj/BGZT0AKbxnGK1/pS7SCnWAOc5KKz3iLKct9hmPvf0KPmCta/D4JYTtFFCe5ubOoZUtNds0DGBcwoBrPsHVfW/lr3MEDv9y1mnyFA+xQik3q6iRozZzVrPqPfetpeeDhguQKjPLJBCp4rwaPektffy1jrIOpP3bPs5geQZ6uGJJOisH2JvGSnIV752nPXqIaCXH6AJVwG8yNVeNUujEie87FUUg57sB9c9lcVCnp48pLBYIwsoPPuw/7SM0GmgBjWAZUt6BVPRm5ZWkf8/qRfHXqcx4b7Tg2fQm8+EMGXu3FVjACs2XdchEhoiw6OYb/CHzr1Fo29zZjkNUj8lu/d/1IGTw9toPP//76QuLt30/T6isJmZvQ3/N/nqbHZOcs83BebC3m3Aq8f4PfZdb7yMqfXZLaceild9gcR6ThH4MNiGRT/2dozSk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VvuRn0/VA+R1tlhoj8Qxrkx+zUrPc4PgbLhsEL8CRa0otT/WV9j1nyjzsqua?=
 =?us-ascii?Q?PmW0DCChgeiQo/Dy4I44u8avJItrJhBOdTGvoBBF/1ae6MxUdoEhClYYB7sO?=
 =?us-ascii?Q?4D+DqzRgQ52VdYoiWeDt4yVSbtVBv2NJjW75PebtGbjgqsv4W20bKESB1x33?=
 =?us-ascii?Q?7OqsHXNUXJMNMLyw3fMDB0zseSOAfhmO606r9p1ip8QFfjD8ErRqwiReeq4S?=
 =?us-ascii?Q?lFvWz6YYf+C8tY5jYsKf7ptUI6Ev/C9JZCqlyNxxnxC59Y6jCerd7Jp6qAA9?=
 =?us-ascii?Q?e43xoIlzxKZh8iKLMuPW/T07tGw7LDUZh+DW2E4NJCdBYST/sbeb8Mw2gU7m?=
 =?us-ascii?Q?7Kxak9SPo+TGJ7U+t6K4PsdxxGDQuCoTfr4KlyXlW10YgrR/QKCBOv5Q7czf?=
 =?us-ascii?Q?zQCjicjigwJ/9cSiHSTrncwDG7BbYsKtYFoVKc4UYuqpIB7e9OhZLJ8DwQhC?=
 =?us-ascii?Q?8eMILB7RHuLlbtpqdvARlOyQzNrpxTaSKpaleFRlZfsI5Kf5nRJFvSMB1rHA?=
 =?us-ascii?Q?+7cKnY4Ukep7o4tstK5wzZFv1Q5R1JzPuW4CcJSXPs/H5oGXUseXGxK7AlMF?=
 =?us-ascii?Q?RnIOIqa0zVPmzjW+u4dWsIotr5WOn69xqcQ+LKh7vYllmEgVu6QL2Xie4WFc?=
 =?us-ascii?Q?4CJbTAoUdockFC7DCZtOsH00ixuXTDmJxSmKZ77tXfbZ4I3j88LA0UxqVsQb?=
 =?us-ascii?Q?e6fhrYYLBuqlWMTB245xUQFeB3Ee2WvhZVTnTlPb2MiBV3Dd9rXxhxY/BHwW?=
 =?us-ascii?Q?6lkUM8+mTV2rUDzg3SEDmZbGLBRtFPaGCC2z0tRx1+yVImzc1aAZ+1cVPO2x?=
 =?us-ascii?Q?k0366FNF3rCGpW1r1ixFNZFaD0Yn1HU7Cqiy+8uLvmoEU2IN/1ANlyLdbnlz?=
 =?us-ascii?Q?OsqdC0huVf7X9C4OVt9DXO2croyg8MfPekf6AwxLJf7mnmVlqRKM63Y39ERH?=
 =?us-ascii?Q?oaOiYyz+Zb/8sy11lIiuXEFDi4/P0yXudnia3kXM0ukZK7hej4m1uYKpNcI/?=
 =?us-ascii?Q?PzIVx74R0Fd6qWUqNWWmI6j1nm2hTEHuZL98hRGOzr4aKpBNFqhESPKxumyK?=
 =?us-ascii?Q?XQtkFOhJUk9uYplaVf9jv3RPXLXc1qP4N0ov9Q07AnX8SphCcwA+htn+tNAb?=
 =?us-ascii?Q?be93lI2/aq1f2ipTrOPksghfAV+tuPLGmjepuI5Zm5WFEHFS6z9cdMB6OwaU?=
 =?us-ascii?Q?KRebe4Mv7jMce2u84etbqrQmnDVqwkRzYBuxw1wHugJcP2q43+cukQ6IQup9?=
 =?us-ascii?Q?g90blsy1dYRytCUIygrugLlt6+jvbjGV3CgMbWNydGITGhs91l9tJPDvQ/cu?=
 =?us-ascii?Q?bmAkTf2gZQApCR5NVJAKzRr+2I5fYkoUFkbD3fjVUfXIdrWI9B8NEPUUzets?=
 =?us-ascii?Q?Yz/d7pztv4xcc+r2pDrUdsy7gFOu4eFgy3zCKIQcIQPaiQxnWEnSbhS51JEK?=
 =?us-ascii?Q?gVOh0Pfy0BW9YmkAr4fp7PpyMf5XrYeL4uLr6xtJzfSI8Y1IfytXdHH2Rz7i?=
 =?us-ascii?Q?TR/2muP6gy/Z6Ja8/AxJfVOAUsIrhAIFkhqQJjiEhYDTQfn+tev4han6nV++?=
 =?us-ascii?Q?LVHfSxv+jDLuNyKXijCYEZqXL+xoGjvcY3z8//JbY0EIsAlUYYKbZLiD63aZ?=
 =?us-ascii?Q?ukziMtJUjwyCZMKE+KsOacFyL757+r7wmVaSJ1eoFDRQRoiDMAX60GQ0gH3j?=
 =?us-ascii?Q?ogesQrCrwFW2QCM66YLHhOvKoTUC1HPfSsQT2MWm6chL6u4xo689dqCy6LMk?=
 =?us-ascii?Q?ZTE4+i1FOxhGcmgaQIE/4gBqyklVgyA5MFmQXpMIoqCi6IDCyuwo?=
X-Exchange-RoutingPolicyChecked: 
	s8Xcnje9+jRyaRtMDcr0u24o8hYozNHiXRz9jUGhXDEykGowo0TI2Idj7DTvJ94Y+bPCyU5LTEf+OkDFEXEnSN5PFpqRWLIIwCWxLtOKKf7sw1tWzSr9Xb4jwAhcRFJu9xaepoMbdO59RlfWmHK/svcKQAlNDGHuIavV5sSm7hm0ApkOzvEAYkQgSyULAGRsJPyKYmVTaS6TR2BmNstPPN20cPn1kcLPGJtwnnH4yvmQEUUoBS2NNZ0YwTabPl4Wjr3A06eLCyw2oXXeXeydjpKR98y8knrdbxDBHTRo0/K2rmX+umQgmz9rkc/f8rJjnorU5jtqZfhLYgcYdiBG2Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f37c0a-a1ce-477e-91be-08de8af07776
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 04:30:53.6228
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdAPerijQttYV/Y18SNBcJ9aP9L3kXkipGQpfrtuX3HGTJRv6z7ZFUmFCSuGBuMzhgTKsnd3r6fTIKv4O+x9aa5RdT4j+zdagwrPEyjz7cDKUXUVIwHgp9h9eGTwr5X6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5312
X-Proofpoint-ORIG-GUID: vvE_xbZRFCkx_PAEI7HpQQ83xax6IERv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX2eZm2PvCv3h9
 Et92JsVySEj9EWtJQhIISOe+qhTqHZZYJqy9MR0/6OUk6LAA+1L2nA21pLuVIYUxANEJyKdhY64
 +mA6xc5tmhNyaitSZLHydbKlKzwZK+29Rz10aTiXKFGSeVpnm2fGG1ro648GRBywqzn25NZUYao
 D2XPz22YauhP1gVoIeh/40PFEk+NrCN0FQVdUJvof89co2taWEbWbK8HhT6ih6CAzR1JwJk/Q9R
 yuBdudVqSt/007S+CNeVUYetgxRem6tkQOHfg4BNcAKGZn0b7l6hvza4TJtRw/CQkJDRYXeQQP2
 C2AqLBzJf/BkOkQf0M9oSTI9sIHqpeGnUXAPtMmgnoQHbQsQWhul30asL9gJpcszYUFSiYPfsGo
 Ce25FB79d7hdmvj5gxjvUF6etKl0u06Ek9uJmpMM2BhdUYLyKFEciZs8jes2Lj5/CjZyCOB1jDC
 6AhmKrAFANFlpCkqvGA==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c4b680 cx=c_pps
 a=7APEvFnVlBjFtWv3F9ubqA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=Xtxr2QhbOcTFASHzfYIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vvE_xbZRFCkx_PAEI7HpQQ83xax6IERv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 04:31:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125633

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Update comment to use correct recipe name
(librust-cxx instead of cxx).

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
index c313d24e5c..ea21ea5924 100644
--- a/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
+++ b/meta-oe/recipes-devtools/librust-cxx/librust-cxx-crates.inc
@@ -1,4 +1,4 @@
-# Autogenerated with 'bitbake -c update_crates cxx'
+# Autogenerated with 'bitbake -c update_crates librust-cxx'
 
 # from Cargo.lock
 SRC_URI += " \
-- 
2.49.0


