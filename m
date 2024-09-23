Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004BECF9C6F
	for <webhook@archiver.kernel.org>; Mon, 23 Sep 2024 10:35:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33614.1727087731670368531
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Sep 2024 03:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=99961af2da=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48N6nQdv020702
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 10:35:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41skc29a7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 10:35:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4wXMTzdCXHdIA3VNpdGS8a5Tgxaf5FQi4bYW3CgCxsVJguXw8pZPM2N9JBFX4KAsz4cyZwJveVvVWqR5wl283785MPbV91evNWnErcoYfawIosTl3dyKaays7GkBZjGO0H4dcFPimyX1RDuda4QPp3F+ZX1YbhUnq/s4OT9TvUdtZtWJvC5h796FJqxidxvDCSccWeiHopHmC8XUB4lCOrKuFtMjJE9YEyVATHad8oBTjHACmcYKQqAQSzwLhNO/cztlEWx+OOszKjaVi1/MCVuXCwN8i/HCgGnk1J/SAvjrratMdf/n8ktW1teA1LEtO4PwwvhlKKLjRbMLzZ5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAo1rnXkaWDwp90quqeWaS+n+L5TtoxE8ZROEXUNlHo=;
 b=PaelMU2K5s3lI7ObMX0nK0zQ7K0hlarQRzBc0Si2FUuyM/1B+8Rq4z3nLtSNtxP0+HjsL6twfW47I/phSFJFQnXQLo1A2uWX7MLrrffJSWUVFnjD4QHZpz1M9afD+wNAP1HBo7soPcgJOim8a5u1Oy02WQ8X0T9g4sggWS/INtCTlKKf07INR2Esqn1K/RFCutmcikMrhNjSK+fJJD+LrnqDkW7OqDTVPiO279I6hJces+r+uZ774FmrKVzr506oL+ON8p8dPAVg0q4VF/H/Z6hpj30RLAkxlHvV9dp5Yc6YaIVj+QKgn/Lt3zF5jreDw7niJtbRE1b9R6qvJUUr9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7019.namprd11.prod.outlook.com (2603:10b6:806:2ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 10:35:27 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 10:35:21 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] tcpslice: upgrade 1.7 -> 1.8
Date: Mon, 23 Sep 2024 18:35:11 +0800
Message-Id: <20240923103511.506983-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0372.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 719dbbfd-cfe8-4c92-c3b1-08dcdbbb6d26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b6YW1BPcs8IFH+HVQ/X+bfielKIijuQ90/l74phNnyHTcPWXTWqjwpPU5SPk?=
 =?us-ascii?Q?gWmEMPWeeaorao2o4H/WByYP0/P42m9iiFkT+wy0YLeTnEX8/bKIbhO+rDZz?=
 =?us-ascii?Q?T5w08LubNKCnt3FjC0MJoBC5bxBw24cPLVmgyNEaG0qaddctt1xYPUdd4xa0?=
 =?us-ascii?Q?qskY3GaCOawYBvrDRBCO2V2uOuMxB9g3ZY9vW4av2UbI659RFT0gM5FAjcFW?=
 =?us-ascii?Q?9V4I/8tH250Mq0Dn3kC9FXD3uJH1Ut9KtHtmaFONc0vrZX8lMXXhy8fmH57B?=
 =?us-ascii?Q?Ij/su1upYHvTc20a+blPvZjTH093uCD1iZbENLqxLnLU1C3mlI7VrUTvhvIf?=
 =?us-ascii?Q?5PoVYXAHblEKfSV6eJ/hQVKgRM/d13CcCmIRNSxZTZ5/CJecRG/zNZu94uoO?=
 =?us-ascii?Q?iSGsfx8mW/j0jUBkQRJSMy+IaPQhTktGc5uYbFIn3KobxdAM6WV8V5Nb8OM/?=
 =?us-ascii?Q?sw7fIjoGYLOPAIJLa0uSdY2TcDtRgolZbXSy8hxEmA097LH2UJU+CCa3ycsc?=
 =?us-ascii?Q?m5RkZoCC5JH6JFAoMOjDOpEx7MJO14Wdk3Kejf+gdgyAiSFhIfCJ6bVwl4S4?=
 =?us-ascii?Q?CM8H7Nz1b4J/Gw+KkMGG1BZVglFsPFU5f4CDW6eAwt32kA/0t+kxaSmWYodQ?=
 =?us-ascii?Q?QEja1frjcmEiLL4H+4m8bkKVz+dmQTMKZDv8mQV23a/EUXUf05zi3YiMSk+P?=
 =?us-ascii?Q?nH2TvpsX+uQHW3YgpFFzXSUwvbmi4rTSMuLa9mVpp/TLeunrFvkf4HL0pLKK?=
 =?us-ascii?Q?F3a/NsyulOlMUbbdHwYAKbmhs5l5aCSGeEus8lZoaX0D4Ak/IynpvzPSlKK8?=
 =?us-ascii?Q?dLgXnCvSV6/9w+dYfZbaCGo4OZskmrhXMsqvl1+lNCphRT4/8U0cytAWo/mL?=
 =?us-ascii?Q?pV31yYjYdpiHgQFU0RfyA1wzS+XAeU0yUJH4GAp3eLEDBXQXq3BOzyrGTK/U?=
 =?us-ascii?Q?q3A8Dp/p5XIOrC2OqKMUIMkivu/1EZQYZbRboNe3Qr5knO0Rkj3U8gOZqO9e?=
 =?us-ascii?Q?bSbwT1QAyqIlhmd/GI4WzJpjLuaT7Pl03g7o9zISCyR8As5xOH/r0sgGqvgO?=
 =?us-ascii?Q?pXqmvBQlVnU1oxD4DZe9AxiWHlHRiJnMGzbU7byGEX/zEPfSdvlWU6QPeA5Q?=
 =?us-ascii?Q?sfzOnqtNwcAT18xgbZ52lyDSYAwYdESPnNli+T9C7nGCn2RNeJDWnPVxfLuI?=
 =?us-ascii?Q?7dpKF6zw26VSz2JmeofARgShn5L1lMflHKac4zjUnTmOokwGhxAn0673va0t?=
 =?us-ascii?Q?rzqJmANH882OhghkLoueLKc5Tb6nP+Hcqv5PuXxm4rW7PINLuLdAtaDj9wiT?=
 =?us-ascii?Q?k+OrkKEELdPYFmPprwtvL85zXX8LZfbMPM+ZJ//6nKEicZRUei4VxXDqrpi+?=
 =?us-ascii?Q?AaBQ3vCQxTlMUf9wFJ8fbXMFGBVkjwHFYsxtP5QRWvtNhchmqQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4nW8EsVyZy901oBQ5Wr+tOrG3GFIser6dOSVAUqy2a2Ye0isvf10l8nfUYxx?=
 =?us-ascii?Q?5GJqQS9pxKlGXfl7rcCspWHDoCQ3exD+R7aVDkA2vDv0jiR4yI4/Y0DLOVDU?=
 =?us-ascii?Q?EIeAM8LPlJskEee5Gt4xV/qY43C6tYgz5GCABtDNIXuRmJG/a1jwoGqjHttX?=
 =?us-ascii?Q?w6TurG8ihwDuVg/69EI9uXRL8sWdahC03uP/71sl6riLYrX0gNLBcXqbAGCb?=
 =?us-ascii?Q?lghhH7CnLRUTRDuMUa3xlQpCru0N3PiVZGe81ZxfnPyMMivhmS6be3qs69SA?=
 =?us-ascii?Q?5qXCdLX0qOnhBLbPd0/ewPSqULHMyNkdyL+brVikgjE10NiNJhO2lBoHIrfu?=
 =?us-ascii?Q?6FNrNdCR8rC0U+jBnTBHtIHLf6RFgYsW1tq1rtwtw+aLlslKUTAaTJLBhQTJ?=
 =?us-ascii?Q?lxyqjGSTFi6ut9c0NnnA08WeanhTyvu5aYZPX9DaYDr4Q3FZy7bDxMPqgWHz?=
 =?us-ascii?Q?kTfY3a5CyKsaBGkZA4iRbc7udT2rigN5uq8y735voCEuI4k/fFGxI4zqFGKs?=
 =?us-ascii?Q?8G38ja+OMNQqzLq6OWVU4AorWxFt+cDh+bVBc3oY3WmHoGhwLgZII05aheji?=
 =?us-ascii?Q?fchj5E2eE4yFjeSWtelLj+pr3YzKKkJVuC02JkkKuy7+kKBeSzrs8Lo03i1h?=
 =?us-ascii?Q?0rNstBvhkSFmYlt70Y4jrpEo0jHd6TAEVcP7dskNA8scj0eFU2bWvCO6puKe?=
 =?us-ascii?Q?86Zt20lbSR6t56FhKRcD9Tn7zdPxpMp2B1Rtk5AmoE72IChAZEALej3NES5b?=
 =?us-ascii?Q?aR3CRx+VnTflUWffDuMz08w6pCWqUVJS9z4bKpR26uWVEYLv20a3XdmjRYUq?=
 =?us-ascii?Q?xT7eDnrmeCJuIL1dS3J0ERO4Y3RU3nc6BFHQ3Mm1d3LnOBwhM+JNb3gsHevO?=
 =?us-ascii?Q?2eSC7XX9H3uE1l+RxVxzWeU+AsFty/gJlqWnI43cRuSmLoYVIXWAuZdBxf/t?=
 =?us-ascii?Q?GKFdIWtirw6693ON7GF1hN620I7I0MyIyHhL+yFWvyNklFOOMQNQcCwI7Rna?=
 =?us-ascii?Q?npidbm14RAd1gjNXMA6IqC+4/1Bu6/quEpxHWHdxLYga9b3a6YgvokEa9BCC?=
 =?us-ascii?Q?VXNZMKSe9C4fpVRdZA2bEN2q5bMlG4HPtWg2gR6iEe8dcWDXDXrM8T2Y4y+P?=
 =?us-ascii?Q?6Q16gKyvsH3y7D59OhDVICrll/JgrrA+P68DDcNbtDUJavRhluWUave/ChrQ?=
 =?us-ascii?Q?m0kdf0NSMMRwpfvf1zjHyNul6rB6BsNGVrwW7BZtVLeNXNfXwzK8dXCMdJc7?=
 =?us-ascii?Q?XYSCiXGMAofotFaUzAco05uK6JQl+Xez3tz7eimJn6peoFJwlft5PWgr5g9d?=
 =?us-ascii?Q?yZUHsVlCp2BZQVAFADAMoCc84CgRKF++J9aM32LrBVIhWv/wp4IM2tTHYqYi?=
 =?us-ascii?Q?BVVRcs7dxubukx2TE4ZRI6xPHpHVD/RtvkeYR/E0Xj6rsnvripxm6aKNryhn?=
 =?us-ascii?Q?4dCR6UVTkF3E+11W3JplfwLqimsXNrdDswiovFyxiLyWQxxNZT+HBtar2GDQ?=
 =?us-ascii?Q?OTAGUX1evfYaZ2HzSKn17yk2jQ+83RqVp/tKUFW5VmW7R+U3gUnfciVDjiyW?=
 =?us-ascii?Q?i2G48U317igpNTrg0iUSQYwqu9QOl8/z6OpmP1xz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 719dbbfd-cfe8-4c92-c3b1-08dcdbbb6d26
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 10:35:21.9047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Hwg1l4JZTvwEejMbI+UXyU7GjEr3MJexZcaAgM22sjyyOQJPS8WIKMclYmGV11UlBYhYPatCghQmlYklkIiJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7019
X-Authority-Analysis: v=2.4 cv=M9ofKDws c=1 sm=1 tr=0 ts=66f14472 cx=c_pps a=yF+kfS/uWKtSACHbTM5LMQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=RwghQLH8AAAA:8
 a=PzSUNAM6LYNZHE8V_qYA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=n9nybW_iuiH3Rhfh8WpK:22
X-Proofpoint-ORIG-GUID: gMPxKLxjHW8HGwPQbGJlA3Iy6598yyA5
X-Proofpoint-GUID: gMPxKLxjHW8HGwPQbGJlA3Iy6598yyA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-23_05,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409230078
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Sep 2024 10:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112457

ChangeLog:
https://github.com/the-tcpdump-group/tcpslice/blob/tcpslice-1.8/CHANGES

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../tcpdump/{tcpslice_1.7.bb => tcpslice_1.8.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.7.bb => tcpslice_1.8.bb} (87%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb
similarity index 87%
rename from meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb
rename to meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb
index 93197dc3b..3d61160bb 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.7.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.8.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa6
 
 SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "e513f0710c4ab45ec627e5df6f7b80d12e488146e1bd500c92247e20ca608903"
+SRC_URI[sha256sum] = "082967d6bf793499d3d655cea2149e07c0da97287f1877a6eab88d17cb703d0d"
 
 UPSTREAM_CHECK_REGEX = "tcpslice-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


