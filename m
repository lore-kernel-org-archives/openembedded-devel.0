Return-Path: <Poornima.Lokesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D18CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 11:56:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6220.1791546999911953291
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 04:56:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UwK5TB/t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4742854fca=poornima.lokesh@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Balht210027
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Oct 2026 11:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ZaGuKvVO3GCfbNZKoYRO
	XiNce8bs8V2O1yzpJUtxwIo=; b=UwK5TB/tIRxULD1r2h+WJxW2rnB2Q/KJzq3f
	qApvnnMcaVxYPPhrrPCQjZiqgcF/69ozjMuhCS6dO/k7mITa5bsFiH7FoasdsXtj
	QMj1nh8cc/LzoQJ0mqEyPySoj2swNXwXkNK2Ygf5fvqacONg0mCxiCp7dIWGzu9I
	F/kzfv0dPUMXBer+oaxcLA4FY6fb/AS4EC1903RFCi6EyEkLZl9t9t+4ncsDeH+3
	gID1l3BVASh+Mxs+4D8/PNqnawB8RCPZryBLjNmTmrYdTc6abz76rML5DlijWo5O
	cVB8kaOu0+kMn9/F2M8uk+GFo2NqO2/9tZx7gQRPkxMCacMH/w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020099.outbound.protection.outlook.com [40.93.198.99])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h5xep2aad-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 11:56:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7JSsW7ojcTXMddiXTyinmgI5awgP3xpz653L9qQsqC2QDIs3lw0d+PwTpsPiLS101r2WhVJTagn1UjFQMHTerYau6UVaJsGRd5YG/No7LWZvRzkBDgeM7ND7QJ5JyEyyK6uTLx++4BFF3I0ntLKkMaM6SRpCY1IIF68xQjyvL17n6l4qVGGGvSl+sFaoa+mG2VAsxwK7dJuq45sEQ+tg2NSDNCQzvTuGCX/vSj69J9NObqMxfvgCdtyUK55ADDeg/5GIdCbk27AWK8tPDbgpugkUZRTfGuquXQmnlxrrc5JMjvfR/DOkxl12fws/LClqFrb+d/pD8vZqPzoqbInWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaGuKvVO3GCfbNZKoYROXiNce8bs8V2O1yzpJUtxwIo=;
 b=bWDlHdRqe1h9bECEC7IyAAaPlIYLZ/si83fdWT8PkHh21N1D4ulDACVy3dbdm0/nKcovPtLuOeBvNuJsec9J0Ff11oTp6Fd5etrQjtB+PBklf19Ts8Giv1cli2ePASrveV1Edaps8IaE58PmE0D7jbW6+yV1+biY95djP6mxJwfcjc+as0yhpEpfnrjH8NmkQDeBfJyeVDofG5RYaEOwaUFAb02xcNblnS2oZ/cyzDT9Rb9G6mcNOYL/4mHNWC2hZG8F87c2csffZ9b9I+QMsz0AOXON7oZXuG/LhZ4iieHKKMeJR4xN77w4Uq6TdRziVdos6WzLlafU0BXmxuSBrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f4c) by CY8PR11MB7800.namprd11.prod.outlook.com
 (2603:10b6:930:72::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.16; Fri, 9 Oct
 2026 11:56:34 +0000
Received: from DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 ([fe80::8a71:6d5:1f9e:f8ac]) by DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 ([fe80::8a71:6d5:1f9e:f8ac%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 11:56:33 +0000
From: Poornima Lokesh <Poornima.Lokesh@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] rabbitmq-c: fix CVE-2026-59986
Date: Fri,  9 Oct 2026 17:25:09 +0530
Message-ID: <20261009115509.841718-1-Poornima.Lokesh@windriver.com>
X-Mailer: git-send-email 2.49.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::18) To DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f4c)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPFCA3BFC2BF:EE_|CY8PR11MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: f288f0d6-df7d-4bf8-ae8c-08df25fc5d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|38350700014|56012099006|11063799006|260925021311599003|260925022911599003|260925021911599003|10067099003|18002099003|6133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 
	/Fy00MP52s3inuuWKCHKCYY/2LKAAF0guNqeKv5mx2W1ae0qfhTKlwatisy8gkDc6StmxrZqmZRF1W8g4OQ9N22RupzKpqFT9BL3xb8Fno/sTQe2pvD0AjBQ9NO6P3SkoHo3IqsSQUFAbsMgU2xj38Ihc9K+RtFWKeUorCs3DQwfJP4TZvrCXFjBjwhdLl7hv7iBqMesEwokLdzqGyTyuc6LVsE+DqgfLQUpa/j0+3RjcN2jOvbm7ouu0uAjcSONvKdVl7ol+mSP6cCm9xFTaXl47LazCOwDucp3DFaV9CPTljY/l6ziNgtjdOYwHVd1h0o5BLQNVgdz0uPspuy36C0bT0dX13YgpVTqbdXmN8B17XcQeE+9g+fXYdOHTlVM7dX3AuHuKN5bINZyrus1jFDNrLY95WiSP86pvEtk1GEn1U/U0PZDd8+X32ChyQxK57LnmCzU6DQB3L4xAYhU0IUL2vh4ZDbUMQvvv5TTMjnnR3UhTahYpM/5wmT8vOq/XGq8DMlkbNrkuRfSAVD6F1UGBtXw7T+wjEvubyd06qrXmGuRYUR87lrX7ZnpV+v5wtPkQeYycRK48wGt1ewnnqfdakGVnm1Yjgqm4NGNQGFd0OzwcxpMmpB+fQ4P/Xoibh+VOBvQLUflTALCl7Q2LjxZ2NKax4J8AOtb0r4oU5J0Hy+sk2UKTfuTkBR1HUVlsQp0wbYpfnCrt8dzsoo09Wxtw6/p+GZW83B+jvtTkhs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPFCA3BFC2BF.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(38350700014)(56012099006)(11063799006)(260925021311599003)(260925022911599003)(260925021911599003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/9eZmyX0d/ToP38SuCcZW8LjinKy3hFFRcfZZlJruTZEZyCEYEMgEDGKe+Yd?=
 =?us-ascii?Q?aFO6vHDQz4D7qJUrd/9aoQ8URrejD6k36C8mF/fRNV83bOupR1LKlFTQYZiK?=
 =?us-ascii?Q?COHHY+B3KNQFkxRh7H98PbrCznpfkxdJihb1kP8NY1UEQ4zf/g/+sqjkBK6D?=
 =?us-ascii?Q?BKKEmlijHoFcmIEMTNn1IB+5z5UHaLAvVotvOXwIjZ7lDEKfKh9GDbjuk5zK?=
 =?us-ascii?Q?YGl+7b9mSBD00WCT1PRSUvIAJGCz+UnQhKl0HkzN8Ced5cHE5pwdtQwF5eBZ?=
 =?us-ascii?Q?4m1OBMWTWQbQYZ6AxzvtNrFcFXk8VcfB86lkRaWFxjoPjTTS+hVPN0ywswh0?=
 =?us-ascii?Q?gDI2NguXx4WXOYFiu4VnfTe04t2LA+ZmbJgXe12s6PCfKg67FeH3o7o+85Oi?=
 =?us-ascii?Q?aqbtMPLCmz3FBN3oE0IqhVtPSjKuFoOAo6JphgYhRieYE3P0oURX6+drF1NR?=
 =?us-ascii?Q?tJGZ7dok/o+v7Vlo9HZVxG2s1AiM7gEX7+O926dWaHwTP7bBqqzgZFZjDiUX?=
 =?us-ascii?Q?by5v7Da8mnONuiaUWxmdTUd3A7OiGtG+1bzk0E06pQ7t1FrDBRY3FJcEp+kw?=
 =?us-ascii?Q?j7ydDTA/tFS9akfBRwAuZCI2Kjcr6V7m9Hs/Yi8RvambHGUrDUqEG/ga60+S?=
 =?us-ascii?Q?kEom7XsvcwGAwSndB59HDcTeWnVLScjdJV6/kSPUtMC9uOpZFgBQIkaDjL9u?=
 =?us-ascii?Q?NZ/ntKCx3394U8NX7vVkeyuSGzEDE9o+pskZ4K4TNHR01FfwdwBy15q19OP8?=
 =?us-ascii?Q?wtglbcF1qVITR9bHiJxUkXDFkJXS27/ZFFFjbUxrNDT3JcRzruIMLk4Xf2qa?=
 =?us-ascii?Q?d2YRDp/gSjGVQxSzlUyuowEs0QUK6envs1yFiHPG8jRpq+kRr322UXa+IpCV?=
 =?us-ascii?Q?WSUMNzD5sQ8sbH27uXBipcAgNyjA78LAl1+yw6LTmATNfS4u6qvQ8MVzCe2J?=
 =?us-ascii?Q?PgBnAX62VuhNZTt4rYG+lPtm6Zhx9Drsvihf7tZtfcH8GXhdZ1Iz7STgRv2u?=
 =?us-ascii?Q?M3jaFxC4PL0PfqZciM7tTzNqv5Zapg4ILyZMNuuItfF3n1HxWlrziVlxgpjy?=
 =?us-ascii?Q?Tnf4Tbqm1uxY0vl6MaG2tgrHbMIOxLCVNfp9EMbWSNwm5eaam6KXQqW70KFS?=
 =?us-ascii?Q?Xg40gZqAen6+WJUkt76la9aZNevy2RMGeiYWVrdK/vtq5+XIznBKcR6nSK/8?=
 =?us-ascii?Q?20GQNMdI60lhIAFkKkyzrTVbwopxwe5Wc+DBQaFFj0cptKFt4HbvN91REqLw?=
 =?us-ascii?Q?+WOZ4RlcNG8JwgV+a/dMEZIovmRlh/6X4HEwyggAo7P5nRpga3Nrsz5Vucwd?=
 =?us-ascii?Q?taCMCk0qNx1pd/m+tQLO00umb1Er6+N2Aas3o0TQH6ZPHjVj/+kBjzYBiHbu?=
 =?us-ascii?Q?gzq0NIFR6+yu7/KvlEwZCpYacCZNC94tis7NJ3ybZD8Jta3ODVmR0wjNYKpH?=
 =?us-ascii?Q?BURCAGladEJzz83iQo8RCCaDHyXmpvflw3RA9RUzB+OcSkXIj8knlHNzXsX1?=
 =?us-ascii?Q?sUWNs/TMLu3S2c0ZjejCwCLD+OAh4pYtHip8QAjKgwaFMBdRnibjNUqEjyCA?=
 =?us-ascii?Q?sBel91U1ObrRKyuMwbbM6vrpN5ly0/oTMyNKVzaSyxf0E9qZnD6J8d+5HlF6?=
 =?us-ascii?Q?bO3N/3QqIT48FCBT2gk9oTSS1gAYcyofLAoJiuXlXt2wIaF7aLPTSlRDvkIW?=
 =?us-ascii?Q?e+EKZYcdRbueqH5fnPsKQEvpaEXWauY0RqTM4qkkHwZmLeMLjm6/0zEM5KbP?=
 =?us-ascii?Q?iaDyDIODWMQJo+XcuAo3JgVq4wf2sho=3D?=
X-Exchange-RoutingPolicyChecked: 
	WRmIZBadmSLg2mx01TeLK1AX97s2SMUlzS614ETcJMljWuwh7RaPq+C+lM0pJF4AFhqixvxKFfdNl5AtrBF7NRrI7B488HVyfwAQh/tjTaxLADg/1qjpnjJlbY6Z3zR+jFuwbKF/HuMXIst8ZSxuhuBIRT7yN/V291u4crbZiLhZ4c22iv1vYzJQ16Yv8ZtWBGVqfs0bhpbmLHGKRTMZiEMM8NMLr0WlADjrWh2UG+M5r000V89sY8gilf42mYZVJEm+nvmNrtAeavpO9DikNl7LsLmqGZQkZT8NrW/hpwjR0zP/000qXjSbfMSdyWV9uyMt1Rh/YLwaIApFELFSpQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f288f0d6-df7d-4bf8-ae8c-08df25fc5d18
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 11:56:33.6122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v8UWPs6S7q2u+f97ZMOwQTMk8BPkiIzphErXlz3aQYpSAUfvM7TcVdS1fuIZQpR6uYoM3lEM/yWZYSHzvuzxZW9i0nL2eWyJWub3QVYjs8g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7800
X-Proofpoint-ORIG-GUID: S76pEwLlW5KUhMrGdN_XZtqG_bhgTrAo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfXzqL+kq0OYy+o
 bhCZCsAWv/SnvdluxfY3oNhtd5HE5Ln0Vz9z97Y6JIHfxGs1fjqv68MbI0UVy5+GYHEeol1lc1H
 +h2C0PJ8MlGS8A7lDt6mglwp9CiHcieuw7TCIBHSnL6Io2JMdYX5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX89VXltdoQ3Ps
 OQ8HI5mNcbeHe/j4WlAIF+0yeZU6Octge4MWoEBiVUHrvlc7KcWcaf+TsLLThLGwqdYBNVskwbx
 KloaO7FdMNQ23JsnTpgbvOWuawZxy9RfZZc0WRttr6aHOsf5lHAjedqlXLFxWt0wpY3nzrvLhs3
 nG7tvzy0OpUXWUF0x2RQXXpRzk3A6ZH47T1hvXgU39ArAS6J1WPN1i2vLAMMNBbOG3lhJs7r66P
 TfCQQ5Kv3BZLWTV0ig2+U16Q+MMAHJadhCyjBPmUetyvNz+5BmQcVb4lGXmMEVQg2rs2A3dBDuu
 OSvuQwKN6hUepovjN7haF/0VfWeWI00UpmiN9Qs44+z/QySUwDbYGF8ZjnQdFWVYfSXYMHxdzpy
 GfLHhxyLOHqd1U5flsTI6iULZBdquiMjNUyuHZbCRVeOPbjub2c8TWa1f/y02b9HeCWL3dEztiT
 SUWo5X3TyRZfTt5PdTA==
X-Proofpoint-GUID: S76pEwLlW5KUhMrGdN_XZtqG_bhgTrAo
X-Authority-Analysis: v=2.4 cv=G6uJgNk5 c=1 sm=1 tr=0 ts=6ac8d676 cx=c_pps
 a=GknEWMF7HrfbFJOd498rxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=Cy5Of2NaabftW1Hj2B8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 11:56:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130694

size_t integer overflow in amqp_decode_bytes bypasses a bounds
check on 32-bit systems, leading to an out-of-bounds read.

The bounds check in amqp_decode_bytes computed (offset + len) and
compared it against the buffer length. When offset + len exceeds
SIZE_MAX the addition wraps around, which an attacker can trigger
on 32-bit platforms by supplying a large BYTES/UTF8 wire length
(len is read from the AMQP frame as a uint32_t). The wrap made
the check pass and produced an amqp_bytes_t with a multi-gigabyte
length pointing into a small frame buffer, leading to an
out-of-bounds read (information disclosure or crash) when the
value was later processed.

Rewrite the check to compare len against the remaining space
(len <= encoded.len - offset) which cannot overflow because
offset is always <= encoded.len. Apply the same hardening to
amqp_encode_bytes for consistency. Add a regression test.

Details:
https://nvd.nist.gov/vuln/detail/CVE-2026-59986

CVE: CVE-2026-59986

Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/1bb1b9b1b7bc69eede6295e95fa9527c731f0798]

Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
---
 .../rabbitmq-c/CVE-2026-59986.patch           | 173 ++++++++++++++++++
 .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |   1 +
 2 files changed, 174 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-59986.patch

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-59986.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-59986.patch
new file mode 100644
index 0000000000..1b316c1d11
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-59986.patch
@@ -0,0 +1,173 @@
+From 0977b4326649b323fa3418bec8e46398f18dcc30 Mon Sep 17 00:00:00 2001
+From: Poornima Lokesh <Poornima.Lokesh@windriver.com>
+Date: Fri, 9 Oct 2026 10:37:17 +0000
+Subject: [PATCH] rabbitmq-c: fix CVE-2026-59986
+
+size_t integer overflow in amqp_decode_bytes bypasses a bounds
+check on 32-bit systems, leading to an out-of-bounds read.
+
+The bounds check in amqp_decode_bytes computed (offset + len) and
+compared it against the buffer length. When offset + len exceeds
+SIZE_MAX the addition wraps around, which an attacker can trigger
+on 32-bit platforms by supplying a large BYTES/UTF8 wire length
+(len is read from the AMQP frame as a uint32_t). The wrap made
+the check pass and produced an amqp_bytes_t with a multi-gigabyte
+length pointing into a small frame buffer, leading to an
+out-of-bounds read (information disclosure or crash) when the
+value was later processed.
+
+Rewrite the check to compare len against the remaining space
+(len <= encoded.len - offset) which cannot overflow because
+offset is always <= encoded.len. Apply the same hardening to
+amqp_encode_bytes for consistency. Add a regression test.
+
+Details:
+https://nvd.nist.gov/vuln/detail/CVE-2026-59986
+
+CVE: CVE-2026-59986
+
+Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/1bb1b9b1b7bc69eede6295e95fa9527c731f0798]
+
+Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
+---
+ librabbitmq/amqp_private.h | 12 +++++-
+ tests/CMakeLists.txt       |  4 ++
+ tests/test_decode_bytes.c  | 84 ++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 98 insertions(+), 2 deletions(-)
+ create mode 100644 tests/test_decode_bytes.c
+
+diff --git a/librabbitmq/amqp_private.h b/librabbitmq/amqp_private.h
+index 77a6904..93ee7f6 100644
+--- a/librabbitmq/amqp_private.h
++++ b/librabbitmq/amqp_private.h
+@@ -299,7 +299,10 @@ static inline int amqp_encode_bytes(amqp_bytes_t encoded, size_t *offset,
+   if (input.len == 0) {
+     return 1;
+   }
+-  if ((*offset = o + input.len) <= encoded.len) {
++  *offset = o + input.len;
++  /* Compare against remaining space rather than o + input.len to avoid size_t
++   * overflow; o <= encoded.len, so encoded.len - o cannot underflow. */
++  if (o <= encoded.len && input.len <= encoded.len - o) {
+     memcpy(amqp_offset(encoded.bytes, o), input.bytes, input.len);
+     return 1;
+   } else {
+@@ -310,7 +313,12 @@ static inline int amqp_encode_bytes(amqp_bytes_t encoded, size_t *offset,
+ static inline int amqp_decode_bytes(amqp_bytes_t encoded, size_t *offset,
+                                     amqp_bytes_t *output, size_t len) {
+   size_t o = *offset;
+-  if ((*offset = o + len) <= encoded.len) {
++  *offset = o + len;
++  /* Compare against remaining space rather than o + len: with len read from the
++   * wire (uint32_t), o + len can overflow size_t on 32-bit platforms and wrap
++   * past the check, yielding an out-of-bounds amqp_bytes_t. o <= encoded.len,
++   * so encoded.len - o cannot underflow. */
++  if (o <= encoded.len && len <= encoded.len - o) {
+     output->bytes = amqp_offset(encoded.bytes, o);
+     output->len = len;
+     return 1;
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 8c0aee0..edff2e5 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -41,3 +41,7 @@ add_executable(test_merge_capabilities test_merge_capabilities.c)
+ target_link_libraries(test_merge_capabilities rabbitmq-static)
+ add_test(merge_capabilities test_merge_capabilities)
+ 
++
++add_executable(test_decode_bytes test_decode_bytes.c)
++target_link_libraries(test_decode_bytes rabbitmq-static)
++add_test(decode_bytes test_decode_bytes)
+diff --git a/tests/test_decode_bytes.c b/tests/test_decode_bytes.c
+new file mode 100644
+index 0000000..17309f6
+--- /dev/null
++++ b/tests/test_decode_bytes.c
+@@ -0,0 +1,84 @@
++// Copyright 2007 - 2021, Alan Antonuk and the rabbitmq-c contributors.
++// SPDX-License-Identifier: mit
++
++#include <stdint.h>
++#include <stdio.h>
++#include <stdlib.h>
++
++#include "amqp_private.h"
++
++/* Regression test for GHSA-jgjf-7fwf-f3c7: a size_t integer overflow in
++ * amqp_decode_bytes bypassed the bounds check on 32-bit systems, producing an
++ * out-of-bounds amqp_bytes_t (information disclosure / crash). The check must
++ * reject any (offset, len) pair that would read past the end of the buffer,
++ * including ones where offset + len wraps around SIZE_MAX. */
++
++static int failures = 0;
++
++static void expect_reject(const char *name, amqp_bytes_t encoded, size_t offset,
++                          size_t len) {
++  amqp_bytes_t output;
++  size_t off = offset;
++  output.bytes = NULL;
++  output.len = 0;
++  if (amqp_decode_bytes(encoded, &off, &output, len)) {
++    fprintf(stderr,
++            "FAIL %s: amqp_decode_bytes accepted an out-of-bounds length "
++            "(offset=%zu len=%zu buffer=%zu) -> output.len=%zu\n",
++            name, offset, len, encoded.len, output.len);
++    failures++;
++  }
++}
++
++static void expect_accept(const char *name, amqp_bytes_t encoded, size_t offset,
++                          size_t len) {
++  amqp_bytes_t output;
++  size_t off = offset;
++  output.bytes = NULL;
++  output.len = 0;
++  if (!amqp_decode_bytes(encoded, &off, &output, len)) {
++    fprintf(stderr,
++            "FAIL %s: amqp_decode_bytes rejected a valid length "
++            "(offset=%zu len=%zu buffer=%zu)\n",
++            name, offset, len, encoded.len);
++    failures++;
++    return;
++  }
++  if (output.len != len || output.bytes != amqp_offset(encoded.bytes, offset)) {
++    fprintf(stderr, "FAIL %s: amqp_decode_bytes produced wrong output\n", name);
++    failures++;
++  }
++}
++
++int main(void) {
++  char buffer[16];
++  amqp_bytes_t encoded;
++  encoded.bytes = buffer;
++  encoded.len = sizeof(buffer);
++
++  /* Normal, in-bounds decodes still work. */
++  expect_accept("full buffer", encoded, 0, sizeof(buffer));
++  expect_accept("partial at offset", encoded, 4, 8);
++  expect_accept("zero length", encoded, 8, 0);
++
++  /* Plain out-of-bounds (no overflow) is rejected. */
++  expect_reject("len past end", encoded, 0, sizeof(buffer) + 1);
++  expect_reject("offset past end", encoded, sizeof(buffer) + 1, 0);
++
++  /* The core of the advisory: a wire length large enough that offset + len
++   * wraps around SIZE_MAX. On 32-bit platforms a uint32_t length of
++   * 0xFFFFFFF5 with a small offset wraps to a tiny value; on any platform we
++   * can force the wrap with a len near SIZE_MAX. Both must be rejected rather
++   * than producing a multi-gigabyte amqp_bytes_t into a small buffer. */
++  expect_reject("overflow to zero", encoded, 11, (size_t)0 - 11);
++  expect_reject("overflow wraps small", encoded, 16, (size_t)0 - 8);
++  expect_reject("max len", encoded, 1, (size_t)-1);
++  expect_reject("32-bit style len", encoded, 11, (size_t)0xFFFFFFF5u);
++
++  if (failures) {
++    fprintf(stderr, "%d test(s) failed\n", failures);
++    return 1;
++  }
++  printf("all amqp_decode_bytes bounds tests passed\n");
++  return 0;
++}
+-- 
+2.49.1
+
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
index afdc99623a..45a90cb7b7 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
@@ -6,6 +6,7 @@ LICENSE = "MIT"
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
 	   file://CVE-2026-61547.patch \
            file://CVE-2026-44235.patch \
+           file://CVE-2026-59986.patch \
 "
 SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
 
-- 
2.49.1


