Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 876CFD72345
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 07:42:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63334.1769154163940267426
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 23:42:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=VQgZcza/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54833b6d62=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N5oepK3261624
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 23:42:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=mc5Lh6Nhj7UpM6MeiCO+8qaojhahA+SML3WlHKB86IE=; b=VQgZcza/4wtV
	0x3JMGclxml/SUmWcYWwyK/80LXXhvP+G9pBnzicaCVnllmMK/bL4gKboP1Gizlw
	mmPg1Vk3NVZj+Zn25PX/AF7yoFXM2VdnVRzArXPSCMr6/t7npFTS2xJKDh4SnWqc
	eRqiBL1dVrFoalgs748icvFYR81Y1gVdfKr9ct9hZZyUCe9BHrZ/jjGHcaMb49T/
	kEzk2ZBiurCcD6MLSbH1MRFjROcOQcHbs7K5w36UphwNbcsMPP+OUrn8fyJKpZ2z
	xYcYsjwW5evhRQk7qDvUmZo7VnODH3UyycWcFhG3kKcFuFuMQeOw1R36FhsQNbf0
	cdGrzY//dA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010047.outbound.protection.outlook.com [52.101.46.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn75uugc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 23:42:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIHX4dcrqmgf0su6SUHvH5PqHSt/6QUmKzI/tIRI+AIFqe7j1csJKTn1toXiHUB5tirZ8VcaiR3tTeRjicEMNIfSwm6xntpEAID/iIuEG1lXg6xcqCWnX+/+lOrLowAeNty8i7Wp2GU4MtGSK+YZx2VSgylBRx9fwHU3ATiSrb05u+4685lZA+PytacVEmBHAMgibZJHj/0KsBwXzYDqBJ2wBOJ3T/IbFxbTB3S1SsP6791UEHnqUe4eI7ChtsHo3c4+vEHmQf/lxezpESgtcbumtjenUa/XwaP8So0NkiJ3SyEgfTlYg5oyodaZYATIExvKac3XmQ1BJZMVO6YIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mc5Lh6Nhj7UpM6MeiCO+8qaojhahA+SML3WlHKB86IE=;
 b=SrJtWMTetZg/WfjP0tZN4jAcMQejnyb6RQxAm2BpAu+8jEKhFaN3JSzmRWkhr9s9JSnBPwSM4reLFYZyv107v5Dxoc2uJ1nvsxQ862wZwTjE3x0DV4ty8qyKq1Oqtaa+SxzqxZKzoi5r/i6a+mPShzN9rPKUCHAkj6sWrFAHLx1n1J1mxldXRzvR+b1ypOqQgE3g4/u5GQ4XmUKT/YiYbzOxzwPpdSGoDJEfpygdPtYAiuYRi2sc+qqIozlkvMHLfUjgwqvnPhkDKAjSQWP8geOGlCOZVAkcHaTkLcugLAZYrY2XcvAbm3OMGm3yXpgRrw+7ykNca4KYdflQz686tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 07:42:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 07:42:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] xmlsec1: remove des from default packageconfig
Date: Fri, 23 Jan 2026 15:42:25 +0800
Message-Id: <20260123074225.1538346-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260123074225.1538346-1-yi.zhao@windriver.com>
References: <20260123074225.1538346-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0038.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6981:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5887cb-e4d4-4c60-5407-08de5a52fd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RC4iO8cKcM+R1lBoFPKmZqWjBC+TKJaY1Fc7RqVsET37mNPJsEB0jfkttRqf?=
 =?us-ascii?Q?FaDur3k4hbrzt6Z3Z1lcaVkMpq9BPxsN0M6AwZinEHrNtYERabImQuO/X3Jz?=
 =?us-ascii?Q?9XSV69IxsL9BG7vWJZnFAyLSF7+oph6QFiccDPDRsyeqyRoTeS+FMv5e2GzD?=
 =?us-ascii?Q?vxYazXSStLoyOzLwU2kbCnf0i+PzO07zgDo00YMCftGeaWcnSDdFyQaDRsOm?=
 =?us-ascii?Q?bJ9xfyI5tLQAFMyl1F0R7lXEm1qJRSGpU2A7IbOH6bFoTN5PNLmBdkkU5fS+?=
 =?us-ascii?Q?R6JV9dORDhYdjfsgObtrHRm9iRUEiNumMwXo02uaYk6CeUNEI6lu4QKBNLYP?=
 =?us-ascii?Q?D9plMRZWbm9bi2IybvbYAYi/57togfcIDBwQgEF0O0I8kkp+p5WJrY1o0tco?=
 =?us-ascii?Q?o/HTFYbVRR6W6oVzWWAoVq8lOsXaB/HQExoljlE9Qnv1mln8CWmXHzWSdxji?=
 =?us-ascii?Q?GHiKyTKS2Kvq7cRi7NdA7iQppErCA9sM5cMKfI/foP51ufRNmJ0OBLjrOk+Y?=
 =?us-ascii?Q?PJAGMahxrWD1/CM5ssZFOI0LICwVonhgkmmLxc7neZnG4xz6lXQVXr8MaZ1y?=
 =?us-ascii?Q?3lmhG/A9yIwJu1/XXOzsz4hvUbsG5eRpe+8Mxt3A4RPH6SPUY+mMrZhl+1Pt?=
 =?us-ascii?Q?h6se1EFoy82+GJiC1eOPksROGMn6KdTBWOoYAKr0Xq6zCSJQNTHuzx96ZH1p?=
 =?us-ascii?Q?Wh1WQILLxxydf26bQhWiZcC0cZfvHPOvIzIoOqUE8amRHgwRjFeCnjfdy4Pb?=
 =?us-ascii?Q?QdvixsGEZuNL5/sIwOHDZrui1FS0t04bQWK/6Z8JJVRTjjY+6rOZj5w6p2x1?=
 =?us-ascii?Q?56v6PfQROitH0xXZgcvrJ7PIwo8HGlNfYYbjSwe3zvl8BHJ1AZ/P4j9c0BCh?=
 =?us-ascii?Q?dVzBMca9ZHCQtI+kRjHVGv6AeBA1OTeY0YgCDggGukpDgYUJ9PCKASrSQLpN?=
 =?us-ascii?Q?sbVE97XIHtuE6M+ZkkICzjt4g2/BpaTt+pacWyzsjq+oa+cyN+ma1LJvJ/q0?=
 =?us-ascii?Q?bn3sg640A5jyKxDbkJzw9EbgTMeh7P2PVObprdvKcx+eQnmC0H3HtJkoGCDT?=
 =?us-ascii?Q?OOAdYx1LPilwywZP5+n7hCXS3sfHWChaIjwVZMiNgRMBpsb8aSvFw1mE3A5G?=
 =?us-ascii?Q?g3hluuQwEvRCyswpEauUwBsEHkq262WYugf0QXUXPLodIqLQLqODCcdPe0nc?=
 =?us-ascii?Q?T0qQgC6fsvsW0caD+SdMG3a1lpwbud19xUBZ31xfQtqk16/mO/gKyKMiq7QG?=
 =?us-ascii?Q?46ibpN+7N8RUYOxQ7i+szK805wVkyrLJAzA54IcohMh9xDOU+eKpTydZ6YXU?=
 =?us-ascii?Q?OlJKwWoRKgw0SxK3ytXymyNxUNZmrhiJ7fAfFYzk8geU0gg0wKn/vI2lRzLG?=
 =?us-ascii?Q?oevq4W44lGzKBhRCBqQzfpvDKHoz/TMUOhxxm2cpB4ipPOCb5Osyp/FfzhI+?=
 =?us-ascii?Q?lzDvF/tJ0YIZ2AUnK9DvoZ3DOnyr926nmpT4HyNb4Ore22gOMLLUOeNkuxkP?=
 =?us-ascii?Q?LN8BEwZfaCGIMJgTD2V7xwSTaIzdUDtD3bQy2eZqdRuCiWd7fqbK4JiKenrP?=
 =?us-ascii?Q?ZJhyY7P9aiMpjMyLoJcE6SGll89wUM/FzAT2m8XqJVnDxP5KWW9UVdCJo85R?=
 =?us-ascii?Q?fJ6ofKB27B5It96StHvAOXw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rs8SWtC84AF46VQh/16cOC2P358aNRSjmaBqpgTsF4YxYpStp/i+kRPGQo1M?=
 =?us-ascii?Q?4mDxOrCpr8CNMo6OxD+JiOElh/l4hrljFrU+/i6BBVV70vLS1j4q28nkwcxO?=
 =?us-ascii?Q?2vTa0pJpdS8OLlGS1On+80Vcb3uaBPHi6w2PaepPmpPxb7waw8BoTPOfxHiN?=
 =?us-ascii?Q?rBLAF/8Q0Xu/yp85mdqL90QN60fv8ESoopSrgXfuiboOIOmMbv6HZN+dZdq4?=
 =?us-ascii?Q?Gm7VFAlxHqlUh21TEgapmM+Z7LZqLeAoiyU1BaQy03Vlj6JTHmtskOUzdBA0?=
 =?us-ascii?Q?sqv5+mTn27geNbYkrKBX4UkuyKBsva5HIgfzMuMO1Bm8Fxyk8DmxitNe4CE5?=
 =?us-ascii?Q?eqj79Cv36AfwJpfsDkETEte7JJSNEXBTM/JY8JDQbo/RQhtNPdACC5cYAUL2?=
 =?us-ascii?Q?xJxcKJorDnL19OlvJINoBnxLyLsKsVd4lHe3HMMidteI4OIHYg3DEvEZ2WKc?=
 =?us-ascii?Q?3hbFVpjc3n/484TJ8cnjb5GEaYp5cjFL7KQri6FTt1IhxDrjlwtI3x1AH+cf?=
 =?us-ascii?Q?fBt0U73ezlRDXWc/1rRdgYCdJuRiytiIR1EzMm2iE2EkfxEJkQ8zztExDOMd?=
 =?us-ascii?Q?6b6vpV2DGvqjJRaIa8L0Kf7ARWG+ko/CfXfckq7YljNE/m3xWCOioprsssTz?=
 =?us-ascii?Q?YeeOj9H88/MO06nn0SseAvRQ7SCEchW/fIU0rxhAIbT8O98btfVZZAGFhCt3?=
 =?us-ascii?Q?CmSSWyPALLW1FZoJInH5TEPkK90OWYOdno07PWzqIbtqRKIR3Ognd3ZK/pOf?=
 =?us-ascii?Q?lHGmqgZBCtLHgJTB0ZWyon6tQ7TNVo2KpOhWaCi+RhdYKSDzcjMSacNVD1gB?=
 =?us-ascii?Q?1Y8vHsls66r7n8Wycykb38vA1+4uHqlPrwFnWEz+yhckzWf6rb+/Mo5JuStr?=
 =?us-ascii?Q?5YUAwTbpaHhoCbdQk7Ymya8RM5kr5GnLVLm9nL8VvxODDPmuoMutn89VvlBh?=
 =?us-ascii?Q?p7i3+UU2F/B8OmHtW6Dea1mY2csQZ+k688BDg8IOlrHMxHszcoeNJWZh15vt?=
 =?us-ascii?Q?6MtFDGDEIUSSuuJc4T1gqW4+E/JuLEjqXyam2QQDV26+/tM0MZK+GragPy9W?=
 =?us-ascii?Q?j/CHTuOS2sTMzDwGbHRs0vjNgixXGZpWZFtj19mFVKXY+SkJxLbsxkdiZPxO?=
 =?us-ascii?Q?Rv6nH5oFlSiz9QdEfpETgdAQFXG73g8EtMLRGs7g3AWYHwAEvvawGJOdKBpA?=
 =?us-ascii?Q?VDCbG7R4xjzCzXk0o2Jpy4JWf2xUSD7admmKZj6S35RyAfdA0ZeOkj++PC8A?=
 =?us-ascii?Q?t9Rm5bZIdZH71/DryVk22ZoOIKtcJ7CEu9J9r+cuf4Mm2/9HgqBjtH44Mvzg?=
 =?us-ascii?Q?FsRaNQyiPSx/k1yw1Y5R0iV6pOKoYS7mSywIs1n7Q+9GcHiC/t05xJfrbG/2?=
 =?us-ascii?Q?M248SENpoo8ROgW+GPdR1bjNZe02ynSVQ5pXcdwNOO5p7dyJ269Cb9i96Lyg?=
 =?us-ascii?Q?BQuW/sVeklRN6eQWreMeigkI4x8zbLjGx5jEuxlOiYjvdwz5VHqAIxrROSSH?=
 =?us-ascii?Q?UoSHR4dLx2uJscmapsI2nPjJJb/MSYy4vowZIhsTBOsVBn99rul0MN1ApCLl?=
 =?us-ascii?Q?F6gf5HmKKpABsPNURtYaMROJUUA+nqPSxAJKOz46zWKm1D2IDthdRY6/9hi/?=
 =?us-ascii?Q?6Ab4A4rrMM4y7XIulnUn1Dxj+2y+ROlL+cTy/2aABw5yue58z7A4mBlO8ktK?=
 =?us-ascii?Q?YRfETL1zhken60zDMqJ7dK5SprOlG+ApHmJhUH14jcBekzJKSRqw/4Ekcb/5?=
 =?us-ascii?Q?9hWMRU8dpQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5887cb-e4d4-4c60-5407-08de5a52fd45
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 07:42:41.9416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LCI4d3HJNsB1g/0npkls0FahonZ/5dA+GWVVNQ091/fQG7W9G/lNF5mawfATKK7ol1La9fVgAMoOMVpbNyUpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6981
X-Proofpoint-ORIG-GUID: Igww0LrYcbva63KcU4g-EMVjYtH81w5Q
X-Proofpoint-GUID: Igww0LrYcbva63KcU4g-EMVjYtH81w5Q
X-Authority-Analysis: v=2.4 cv=fpzRpV4f c=1 sm=1 tr=0 ts=69732673 cx=c_pps
 a=jlQ7B5VXLElZiQQO4hIw4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=ROgHzTAFrpv1-ZrHE5cA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1OSBTYWx0ZWRfXwVvh3m+f/bRc
 yhHPCFoKUgC6vobcfd/gFnq84GJMJYh6Cbo56PTzGpfJ9iO+iGsV+9+yz2TmMGwgYDknUKMRhmV
 BEPwWDab24tuyR3VxRfpDo94XUmxvWc/GKWS74wI5sU1hg78uN7XVdLVPhKUQNH/FpgoUN8Spyv
 cwAzPvnyrLSIgjR1D+g2ud7pnZikxeNkTPhV9p2yW4yuWe21Xm75UHnB4eDWkPlBZHnjY3+ijqr
 hsd6dwQirDwR8CerRNVND0je0ilrUE7QVDvwyycjFx7ZwoV/F0nQhBrIgjVh5EskRmKeJMkVvsT
 CKi0Mpvxa0cBV+OcJM52TiAJ61ljVq+XCwN+SLDTMkvZRqseZ7jRX4qvL1vnPDe4E7SS+TlO8rC
 gXYYB3UmQL8P5F+Og0p4iDueE6z1VpB/MhqowYrcMuq0FLYOZUkphDt/fA9vLouKShjSGA66vOO
 zSVt/aRXooOiTpw0p1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_01,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 07:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123771

The DES algorithm is considered weak and outdated. Remove des from
default PACKAGECONFIG to disable it.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
index ca6ebba59c..e0888f1ff4 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
@@ -33,7 +33,7 @@ inherit autotools-brokensep ptest pkgconfig
 #CFLAGS += "-I${STAGING_INCDIR}/nss3"
 #CPPFLAGS += "-I${STAGING_INCDIR}/nss3"
 
-PACKAGECONFIG ??= "gnutls libgcrypt nss openssl des"
+PACKAGECONFIG ??= "gnutls libgcrypt nss openssl"
 PACKAGECONFIG[gnutls] = ",,gnutls"
 PACKAGECONFIG[libgcrypt] = ",,libgcrypt"
 PACKAGECONFIG[nss] = "--with-nss=${STAGING_DIR_HOST} --with-nspr=${STAGING_DIR_HOST},--with-nss=no --with-nspr=no,nss nspr"
-- 
2.34.1


