Return-Path: <libo.chen.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345ADF8DFF9
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 08:47:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40246.1776415644289499468
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 01:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fZhMc6o3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=856723d307=libo.chen.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H4trbT2751062
	for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 08:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=yiS5Nf3jWj4YQUnlwtlpkZSCytPDlhKTp34+CWyPxVc=; b=
	fZhMc6o3/PWWwXd93L+aAoWYRgNGocfI7fAMftDRKHJ0m/W9YWcHijPI8at2Ps66
	UjSyPfTOlGcfv1J/L6i+YcFuAEcb+Q8H+OVrUPSC55dpnufaZWA3psrge6thJc9F
	Mbq09FfD/eMTjHlm55/OoAAxfXdBKjft7oMpc165rFAJAqFhkYggdWkcK43486bj
	2PeEtBkbFfPV760TnJd0aKPWNCqP309agcGi9f+Z4uQ6XcfBBTjt1jOOLD0KbQpG
	9ikXw6QnXhiWoByQuYPP3a6En4FCC+1GMPyQqifWhsLy24/49KmQhc/nZj5f75V7
	by3etALCNa1/qTzQ3FSlxA==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013040.outbound.protection.outlook.com [40.93.196.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4djym3964c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Apr 2026 08:47:22 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e54YYoFAATnzo0tBofWsRMS95LRP/zB13TWcb5BffqTgPrD20aQoBq17L958jUJsjHEH43zayZBWdcoScSIrlwza1nDSdN6ARgb1slW03x0Dptmg4IoEmXROTzvxsvwRVNLxwSgoBb+UnBU1MT+7GqxfeaqsGLld/KnPO0t4jDmcNt02dYJSousmK/xXAC4BQPmbzzp8b+H6PQUQTh/64AwRahNAHRXZglnp3rPlMXWZTBNwC1/AgNco57z2LR1dHaG+ygL/v42uUnmrHVAzHRADvNxelP5i9+lS1oNnlimOJWgg+j1RNQsgtRL/MDDV8dmtJPB03M/JFXLgkQL3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiS5Nf3jWj4YQUnlwtlpkZSCytPDlhKTp34+CWyPxVc=;
 b=V1SX1sMyHBaftjfUtHMSUPMPliKbXegEN5dA0UY8vqyFJhhTzSTS/XWEqEq0yZr+CIhAXkUyXo56bSsIOiJ26PFaKAs1QDLO1kIP3kz78hvaltpywg5vdVkGgta17t7ZAyHqdP0GXZx5pS1yw0ijBi0xLSL51Q32wmijgj2z9Z5X3n4Au4IdwzGJ8bJeizMf5jmfkqPgwPthwC8hvkZEWWaP5AGhiiwZh7K6z67502EHocuAFX1cSAKd2QNBdvPOHsFZ87LBn5W5eR6AoFQEd0YrJMbuDhKFgkvZPJ7hdnC/zanJf3xdIiV8ACUhblqbsYcf2nmH0B7eJDqW+F9NgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN9PR11MB5354.namprd11.prod.outlook.com (2603:10b6:408:11b::7)
 by MW5PR11MB5810.namprd11.prod.outlook.com (2603:10b6:303:192::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Fri, 17 Apr
 2026 08:47:20 +0000
Received: from BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700]) by BN9PR11MB5354.namprd11.prod.outlook.com
 ([fe80::4a0e:caa8:c2fa:8700%3]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 08:47:20 +0000
From: libo.chen.cn@windriver.com
To: anuj.mittal@oss.qualcomm.com
Cc: Jinfeng.Wang.CN@windriver.com, Libo.Chen.CN@windriver.com,
        openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][scarthgap][PATCH v3 03/11] hdf5: fix CVE-2025-6857
Date: Fri, 17 Apr 2026 16:46:59 +0800
Message-Id: <20260417084659.3488140-1-libo.chen.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CA+s=J=zvrCt_hz5vrF0ZT4Gc1yH+K0C0yWe3mqjBtqa7w9Bt9g@mail.gmail.com>
References: <CA+s=J=zvrCt_hz5vrF0ZT4Gc1yH+K0C0yWe3mqjBtqa7w9Bt9g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0189.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::20) To BN9PR11MB5354.namprd11.prod.outlook.com
 (2603:10b6:408:11b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5354:EE_|MW5PR11MB5810:EE_
X-MS-Office365-Filtering-Correlation-Id: 861b7110-ea5f-44e2-e6fa-08de9c5def80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|13003099007|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	NlYIvBNDfSy3fv8FuSr8l+Mw0KM4TavXan1tbjPtak2DQGz53+LfKs0atoJmtoAPhUCBb5Om73bGnGhu60mrXLVvXiSomuHGlS1ydO74YdDKw8Sb2ApmlRpxJltcTURRWaIgj6MN1llGO5LvbZQhxiKdNwbxvcYl/PKkvn6qYHjSHzO+4zt0OAApsOhYHBXzUCQPOZtzyBvOXI7XnALlyB0p7w3Q7b5HvK/Xejk++f60ztGrF0oavATTmU+SgBRI5IMCg7TC6WyW2mzhKwjLPbBruw7hzBm0KP8prjtEVlY5JR33bOrkMzagPWIPmYyD2b3Yk7HuNwDpIbZmEADkWQ8b4uvRBeiXkGwoM1F560kjOizSd2NpIbgVsQiGjwthvXZiBFSSSPyDQjkT7nqpvDQfbFIxCfJU96C1W8ngx42prJzxiNeSnJGAs1z1zll3c9rETkPc+XdpbKdVEaknS/QJu7fsN0UwQjPm6RD7EDeLRDR8k70EEHsX4iAbjr/EJ6D4DpiFYyiTYVNfjF0dNm/WNTTobmtqkv3zGHrXJmMuRDUKsWO0St3GXqn3jI+f8tnD0bTkb3CQJCa3CMm1TIZngCvgL/W0njnZFDwxI39ub96ZRNr6KPwAIoyXoc49SK7kzDl8Gq12e/Be9bvvk3t/9Gba/SFu6UoNW1Jhaas3s4Lw9mjXCKYzwzVzEsQc9r0TIOV8FVI150rvXLxBdgA+SkPmY5tUNchTN/6Dgn0lNQGFkJSu6KdanY3DPoVOvXyAI1P13VkFJLgfwbkqCPvTUgsfBbcOPv8E+HHOoohlyCf+NpPsaddkDIhgN0mZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5354.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(13003099007)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qBNpJ+4jEQUhoy1JipnBN1CH6+hhQyQULV26KztothoAoj3c1LTTkXd0NNvW?=
 =?us-ascii?Q?gsigXd/MEhOwtcuJI/4Nk6Zap6TlyvH9OlCpjJdszvbVUK1DufEAsSkCGiD9?=
 =?us-ascii?Q?3lNDS2XbcGrQKm79imrUvmPKnqowKjIC35DigIzsMRJBlpcTRGvM48lWSzXv?=
 =?us-ascii?Q?AZ6fOhcHMTQsNWoyveGjaBugHshwLHAarA5TEVWuIM7jL/0Jin0FWdgWc1N8?=
 =?us-ascii?Q?yGTMxm96fbcs2fV/mp4zBp/uBZAk3pKrB270OXZrv25JZUmyJPbmBXnMhSkw?=
 =?us-ascii?Q?xtIAQqpCPwu8rDJdeXZ+3fzI+BooKeo68UoQkazZU6uSLLhRvCqgHieRrucF?=
 =?us-ascii?Q?PFUamDJqtUW3qt6oS/xW7h+Qac4q3exAwgfzHxdXuRAHeLlpkDzdsq+mYK6S?=
 =?us-ascii?Q?sOWgpMr6fOUqkmqlUyImnvNPfH01D99zHZpVfaK3WB9F2gNKB1lmhvquJWVc?=
 =?us-ascii?Q?jyJNV5vu38XiAi924GekUtF3eTmPGba+Xrt4HtDQslu0EXpC6Vn/cyO/HLsJ?=
 =?us-ascii?Q?VwJsJ5hurxQfCcg0XAFkNDIRz9wKilf47kqPL2zWE1cPhSsY3+PbiZ7wLrtG?=
 =?us-ascii?Q?7NiC3iTnguHn/WX3odLohHIBAYxf9s+4wIPoB0ftS7jy/Gt1r5vBDdxA1L8C?=
 =?us-ascii?Q?iSta7uz9LsavEogj2qDl5XiLJqD8kAJGJVLrYlIbsKZynKE1znPxJDRDg8X1?=
 =?us-ascii?Q?wjV8o9nDK+IH9yAvFZrslq9ZEU2PvjvsCCrpATXJ1FBqQvCgshxCEnGB70l0?=
 =?us-ascii?Q?//B9lYuRnxGcwYZ6kChzP3f5m9zhTqRBW+Q45RDmB73wdyKXX7ivRHtFBeY3?=
 =?us-ascii?Q?bIcHjEH5ectQPsxVYbCebBGMvb7tA3eU77aBZ5haMFoM7sD9X6JdSY/PJqzh?=
 =?us-ascii?Q?EgS1hEOjIM89L4rOpzqdrdIFuQWBVl5tqRvzjd6ffE1ZQuiFuggYI9pdS5xg?=
 =?us-ascii?Q?c5kuEtdX2w2qjUbeoe6f8vf2JG6wlFBv01hAT/6rFDjmJUX3qHTK6qo9UJI6?=
 =?us-ascii?Q?rU0nTd0LMPGw6sErTAOpB7miT0gUO7+jeSKG9TiJ9Jo/AziifmPnWRJpzpXt?=
 =?us-ascii?Q?Td6mshWw7aICMTLvFiWRXYugu0+i8nVrIAhS+wqkISXySnMfQhnir6hwW8Er?=
 =?us-ascii?Q?tSsBfEqUaTkL2JYHEyeSNJP59srw+fm/ledm4R6fSy3z8KtB3TMVRXkUebwz?=
 =?us-ascii?Q?QyVg+JukBECzQ1w17YLFgE8/IdTiUVAO19zhxAx6VzK1psi/NLIOTKoKN2+C?=
 =?us-ascii?Q?GBy9096kOfcVmJmNzYlOWUeE+Qedo+um70QScsiXs8FZEBvI1PrKMKW93rnY?=
 =?us-ascii?Q?Y/LheKREgETrQeLXzT9N/l1g1UIxelievdfHld8d7QLASGtUemjTS4ViFuHJ?=
 =?us-ascii?Q?+YeaVy/lQCDemmcAPJezernd9EK+GPJEjUKvDwp6pmJbloXxtcgT2I/9VFh9?=
 =?us-ascii?Q?mkuqrf3QSHo36ERgfE7QbGjKPp/II1F64jClpm8twaVQDFWeiEI8JkZcSdmj?=
 =?us-ascii?Q?7Wu7F3IR8QDPSPMCTnSeewDljtwxgCI1Vt2DOHMvTN4Wq9Vxd8Z7WNxFu7V+?=
 =?us-ascii?Q?DzWlwFW723pkSg5R+yYLvpReeQs8H9vr2mhuqqvjbcfIQy5y+sHB9kw5NZ7s?=
 =?us-ascii?Q?q0aoQKGtsmyIDVRjErIZUbk2kYBwnSMiFeltZaiiJnNklKDVhYNogG5bPILY?=
 =?us-ascii?Q?GSORy3tkoBfKgv3CHZcAcEtYuKxS66uX4Yxt8Ge0h4nl4vTESRskDbEKmS8k?=
 =?us-ascii?Q?hSotvSc+Q08CtOrtbVMpOWL2y6rZkJU=3D?=
X-Exchange-RoutingPolicyChecked: 
	Qj7D6XKajp9uDI/foElkCH31dGpfc1TydXpi6zuaxN9UJ/6Dmm7A4LjgplZWP0mm4rtQknaxOLa4dyan+LI5xuoxFpUUDWTg9Rh4baVdURDu5+Pntvrc2icuVrfAoXr0LOFv/7UYZXrpUKtcDOrL/E8li60szDzKMvdWybsQP14We1ndzQYVTGUgUDTamnRUvDlS86Obo5H4/VTyYk3WnIUOpgpaEkqIb4nmsW2eXFoRqTXlli8AfpEwdmoySOhoCcn+s40EZyRhHHABmqz9IdCiIKY8FZr4vbfsBI+VaGPifni5Cadlw78rXmtsWvb4zKX2LI0vV8YpBtExPVnjFQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861b7110-ea5f-44e2-e6fa-08de9c5def80
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5354.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 08:47:20.0208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdOesXTWa6EvJsg+6Cg5V+WyyJ9gKncWyUP1wcI6aK7PdKygcRn/TYlJbvJJEQ6TtND53xCkT8if7CCSyysWCFJHhgIkHl/YZfCPvBhQGbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5810
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDA4NyBTYWx0ZWRfX8zW2bfSzjY7N
 GdcpmVjibA6qj8UQ2ZJ0jtjkFuf9xBEELgPO3Zk0EriwyLr8oNlqMe6D8o6F+xnmsYG0IbxsVEf
 okZOhDezdWVWwKtQhLwrdfBHbLN3fbZNAtO7Opw5Zt1glw3rUH7TlxDqoOK1vWSW4OQhmQN/EFU
 QUrMoVxwuaEZKnK0zeOKJF297yetBcNKmvmbxcIJu2bn/dj9oaAsMgTbEwEKNP8kgLNj3gfMTrE
 ZVrhOGCeeDHS0+fsGTANpP06K4Vooguf2QSbH9twyOVmhyBUu5mVwPwCVuXM7YVzhOBXtQOtQjv
 fGeDdeX6TcGP5gPkaNtgRG/ztUynfkbCrt3Mw6UM7pU73Cbr/KxmJhf4H3bW+7aa3+3G3+28DGq
 fEmd59Jbfo/RsfwtSuE+v3K0UDC2skNsVuZWgNjfZehNdszgLSe27hVaoiCnmghTT/LfXs2r99R
 IbRz+bZCaNJE7Fe4Gyg==
X-Proofpoint-ORIG-GUID: ccDWa1Kcd57WYKBe2CgnnvNmoGqx98ev
X-Authority-Analysis: v=2.4 cv=QOhYgALL c=1 sm=1 tr=0 ts=69e1f39a cx=c_pps
 a=ir2fm1PSN58pTRYNFrLYRQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=4GNiTbcGMzrreblgCxIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 7az3GqGEqBjtqqZolfazxgw3bm9WPOh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-16_04,2026-04-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 08:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126430

From: Libo Chen <libo.chen.cn@windriver.com>

According to [1], A vulnerability has been found in HDF5 1.14.6 and
classified as problematic. Affected by this vulnerability is the function
H5G__node_cmp3 of the file src/H5Gnode.c. The manipulation leads to
stack-based buffer overflow. It is possible to launch the attack on the
local host. The exploit has been disclosed to the public and may be used.

Backport patch [2] from upstream to fix CVE-2025-6857

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-6857
[2] https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363dad53c18540096

Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
---
 .../hdf5/files/CVE-2025-6857.patch            | 255 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   1 +
 2 files changed, 256 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch

diff --git a/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
new file mode 100644
index 0000000000..cc1301fb94
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/CVE-2025-6857.patch
@@ -0,0 +1,255 @@
+From eb3af284cc0ac8c758c65f492fc693ed50539592 Mon Sep 17 00:00:00 2001
+From: Libo Chen <libo.chen.cn@windriver.com>
+Date: Thu, 29 Jan 2026 13:59:39 +0800
+Subject: [PATCH] Fix CVE-2025-6857
+
+Add additional checks for v1 B-tree corruption
+
+An HDF5 file had a corrupted v1 B-tree that would result in a stack overflow when performing a lookup on it. This has been fixed with additional integrity checks.
+
+CVE: CVE-2025-6857
+
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/a8ceb1d95bb997f548c1129363dad53c18540096]
+
+In addition to the upstream backport, this patch includes two adaptation 
+changes for HDF5 1.14.4. First, the H5B_UNKNOWN_NODELEVEL macro and the 
+exp_level field are introduced in H5Bpkg.h, as these do not exist in 1.14.4 
+due to differences with the 2.0.0 codebase. Second, the 
+"cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL" statements are added in H5B_* 
+functions to initialize the new field.
+
+Signed-off-by: Libo Chen <libo.chen.cn@windriver.com>
+---
+ src/H5B.c    | 92 +++++++++++++++++++++++++++++++++++++++++++---------
+ src/H5Bpkg.h |  6 ++++
+ 2 files changed, 83 insertions(+), 15 deletions(-)
+
+diff --git a/src/H5B.c b/src/H5B.c
+index 5a7a238..4efa679 100644
+--- a/src/H5B.c
++++ b/src/H5B.c
+@@ -140,6 +140,8 @@ typedef struct H5B_ins_ud_t {
+ /********************/
+ /* Local Prototypes */
+ /********************/
++static herr_t    H5B_find_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_level, bool *found,
++                                 void *udata);
+ static H5B_ins_t H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, const H5B_class_t *type, uint8_t *lt_key,
+                                     bool *lt_key_changed, uint8_t *md_key, void *udata, uint8_t *rt_key,
+                                     bool *rt_key_changed, H5B_ins_ud_t *split_bt_ud /*out*/);
+@@ -252,26 +254,67 @@ done:
+ } /* end H5B_create() */
+ 
+ /*-------------------------------------------------------------------------
+- * Function:	H5B_find
++ * Function:    H5B_find
+  *
+- * Purpose:	Locate the specified information in a B-tree and return
+- *		that information by filling in fields of the caller-supplied
+- *		UDATA pointer depending on the type of leaf node
+- *		requested.  The UDATA can point to additional data passed
+- *		to the key comparison function.
++ * Purpose:     Locate the specified information in a B-tree and return
++ *              that information by filling in fields of the
++ *              caller-supplied UDATA pointer depending on the type of leaf
++ *              node requested.  The UDATA can point to additional data
++ *              passed to the key comparison function.
+  *
+- * Note:	This function does not follow the left/right sibling
+- *		pointers since it assumes that all nodes can be reached
+- *		from the parent node.
++ * Note:        This function does not follow the left/right sibling
++ *              pointers since it assumes that all nodes can be reached
++ *              from the parent node.
+  *
+- * Return:	Non-negative (true/false) on success (if found, values returned
+- *              through the UDATA argument). Negative on failure (if not found,
+- *              UDATA is undefined).
++ * Return:      Non-negative (true/false) on success (if found, values
++ *              returned through the UDATA argument). Negative on failure
++ *              (if not found, UDATA is undefined).
+  *
+  *-------------------------------------------------------------------------
+  */
+ herr_t
+ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *udata)
++{
++    herr_t ret_value = SUCCEED;
++
++    FUNC_ENTER_NOAPI(FAIL)
++
++    /*
++     * Check arguments.
++     */
++    assert(f);
++    assert(type);
++    assert(type->decode);
++    assert(type->cmp3);
++    assert(type->found);
++    assert(H5_addr_defined(addr));
++
++    if ((ret_value = H5B_find_helper(f, type, addr, H5B_UNKNOWN_NODELEVEL, found, udata)) < 0)
++        HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't lookup key");
++
++done:
++    FUNC_LEAVE_NOAPI(ret_value)
++} /* end H5B_find() */
++
++/*-------------------------------------------------------------------------
++ * Function:    H5B_find_helper
++ *
++ * Purpose:     Recursive helper routine for H5B_find used to track node
++ *              levels and attempt to detect B-tree corruption during
++ *              lookups.
++ *
++ * Note:        This function does not follow the left/right sibling
++ *              pointers since it assumes that all nodes can be reached
++ *              from the parent node.
++ *
++ * Return:      Non-negative on success (if found, values returned through
++ *              the UDATA argument). Negative on failure (if not found,
++ *              UDATA is undefined).
++ *
++ *-------------------------------------------------------------------------
++ */
++static herr_t
++H5B_find_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, int exp_level, bool *found, void *udata)
+ {
+     H5B_t         *bt = NULL;
+     H5UC_t        *rc_shared;           /* Ref-counted shared info */
+@@ -281,7 +324,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+     int            cmp       = 1;       /* Key comparison value */
+     herr_t         ret_value = SUCCEED; /* Return value */
+ 
+-    FUNC_ENTER_NOAPI(FAIL)
++    FUNC_ENTER_NOAPI_NOINIT
+ 
+     /*
+      * Check arguments.
+@@ -306,6 +349,7 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = exp_level;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -329,7 +373,17 @@ H5B_find(H5F_t *f, const H5B_class_t *type, haddr_t addr, bool *found, void *uda
+         assert(idx < bt->nchildren);
+ 
+         if (bt->level > 0) {
+-            if ((ret_value = H5B_find(f, type, bt->child[idx], found, udata)) < 0)
++            /* Sanity check to catch the case where the current node points to
++             * itself and the current node was loaded with an expected node level
++             * of H5B_UNKNOWN_NODELEVEL, thus bypassing the expected node level
++             * check during deserialization and in the future if the node was
++             * cached.
++             */
++            if (bt->child[idx] == addr)
++                HGOTO_ERROR(H5E_BTREE, H5E_BADVALUE, FAIL, "cyclic B-tree detected");
++
++            if ((ret_value = H5B_find_helper(f, type, bt->child[idx], (int)(bt->level - 1), found, udata)) <
++                0)
+                 HGOTO_ERROR(H5E_BTREE, H5E_NOTFOUND, FAIL, "can't lookup key in subtree");
+         } /* end if */
+         else {
+@@ -343,7 +397,7 @@ done:
+         HDONE_ERROR(H5E_BTREE, H5E_CANTUNPROTECT, FAIL, "unable to release node");
+ 
+     FUNC_LEAVE_NOAPI(ret_value)
+-} /* end H5B_find() */
++} /* end H5B_find_helper() */
+ 
+ /*-------------------------------------------------------------------------
+  * Function:	H5B__split
+@@ -425,6 +479,7 @@ H5B__split(H5F_t *f, H5B_ins_ud_t *bt_ud, unsigned idx, void *udata, H5B_ins_ud_
+     cache_udata.f         = f;
+     cache_udata.type      = shared->type;
+     cache_udata.rc_shared = bt_ud->bt->rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (split_bt_ud->bt =
+                      (H5B_t *)H5AC_protect(f, H5AC_BT, split_bt_ud->addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to protect B-tree");
+@@ -532,6 +587,7 @@ H5B_insert(H5F_t *f, const H5B_class_t *type, haddr_t addr, void *udata)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     bt_ud.addr            = addr;
+     if (NULL == (bt_ud.bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to locate root of B-tree");
+@@ -789,6 +845,7 @@ H5B__insert_helper(H5F_t *f, H5B_ins_ud_t *bt_ud, const H5B_class_t *type, uint8
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+ 
+     if (0 == bt->nchildren) {
+         /*
+@@ -1077,6 +1134,7 @@ H5B__iterate_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, H5B_operato
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5_ITER_ERROR, "unable to load B-tree node");
+ 
+@@ -1190,6 +1248,7 @@ H5B__remove_helper(H5F_t *f, haddr_t addr, const H5B_class_t *type, int level, u
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, H5B_INS_ERROR, "unable to load B-tree node");
+ 
+@@ -1542,6 +1601,7 @@ H5B_delete(H5F_t *f, const H5B_class_t *type, haddr_t addr, void *udata)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__NO_FLAGS_SET)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -1782,6 +1842,7 @@ H5B__get_info_helper(H5F_t *f, const H5B_class_t *type, haddr_t addr, const H5B_
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to load B-tree node");
+ 
+@@ -1923,6 +1984,7 @@ H5B_valid(H5F_t *f, const H5B_class_t *type, haddr_t addr)
+     cache_udata.f         = f;
+     cache_udata.type      = type;
+     cache_udata.rc_shared = rc_shared;
++    cache_udata.exp_level = H5B_UNKNOWN_NODELEVEL;
+     if (NULL == (bt = (H5B_t *)H5AC_protect(f, H5AC_BT, addr, &cache_udata, H5AC__READ_ONLY_FLAG)))
+         HGOTO_ERROR(H5E_BTREE, H5E_CANTPROTECT, FAIL, "unable to protect B-tree node");
+ 
+diff --git a/src/H5Bpkg.h b/src/H5Bpkg.h
+index d1ad647..f75e857 100644
+--- a/src/H5Bpkg.h
++++ b/src/H5Bpkg.h
+@@ -39,6 +39,11 @@
+ /* # of bits for node level: 1 byte */
+ #define LEVEL_BITS 8
+ 
++/* Indicates that the level of the current node is unknown.  When the level
++ * is known, it can be used to detect corrupted level during decoding
++ */
++#define H5B_UNKNOWN_NODELEVEL -1
++
+ /****************************/
+ /* Package Private Typedefs */
+ /****************************/
+@@ -60,6 +65,7 @@ typedef struct H5B_t {
+ typedef struct H5B_cache_ud_t {
+     H5F_t                    *f;         /* File that B-tree node is within */
+     const struct H5B_class_t *type;      /* Type of tree */
++    int                       exp_level; /* Expected level of the current node */
+     H5UC_t                   *rc_shared; /* Ref-counted shared info */
+ } H5B_cache_ud_t;
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
index b31a8d8cfa..816bd752a1 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb
@@ -29,6 +29,7 @@ SRC_URI = " \
     file://CVE-2025-44905.patch \
     file://CVE-2025-2309.patch \
     file://CVE-2025-2308.patch \
+    file://CVE-2025-6857.patch \
 "
 SRC_URI[sha256sum] = "019ac451d9e1cf89c0482ba2a06f07a46166caf23f60fea5ef3c37724a318e03"
 
-- 
2.34.1


