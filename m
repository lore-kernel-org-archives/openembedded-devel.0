Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED74C369CD
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3642.1744877132357787029
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62023c0ecd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H60XU4002201
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2ma8hp-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1MIYCP8llpHIpJk7TYcWvS2GveHrUpp+KcaIgk2tc5BRnVHycHWfhRCvYS3XYIlcCDQryVwQhbf7HwPSblxyQQLix+9aCM8IyxrLT1GWK5msUqf43fWvkVBrJes4BavP4zkDL8k9+pUR3bhTHDPRZ3V6JgrYo7qKzEUsPhqAFahh7FzxyoeiE+gwuefKrVtUm/vtGZ6JB3LlWQfU9Qasv/c8jkZUVgIqokAwpw7rfHYtOojv+cHvJRip3oOgKe5v9gs9DVnjF7Y/g6GD1KKqnWRxtfKHKw3JwMiCLyk7xRVrNX0Lz79SMnaNRZQkTeVpIMe9wymBXEpnT2wmEdTpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rM9CgVhTTbtbc2kjB0txmfX3lv1bf8xvG3+erutYwrE=;
 b=qwHc9AfIRs+d4IEb1n6dC4rOdbP4qWjrf08ZbPrlvuM1hBC95VxN3iRisCcaIkK0uOjAj+JNffwAzkb7ln40MOrj0YELarnekEA7+mpG0GArY5J8ZKTPseS7UrnYKWp/rxg4IEjpP6yvulSiVfVQGcJi3UfT6b2nO9uXw1OJSL0xIXaGDTkBQWVRNYYkIpTKFrY3S8pfOzZM7eoi4wpIOFpu6jEEvF2+NPbouYo5Qmi7owO2fbFtN+X+i3t4iMWaRBti0U0u5vsiSdFaLjBeNZOO31b4nuW6luBvuHzr4TOH3/s5kLkW5EXHoVbHcRrO2xaz8tOcZf3TNrjaw4iaGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 08:05:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 08:05:29 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 3/7] conf/version-check.conf: skip piglit
Date: Thu, 17 Apr 2025 01:05:12 -0700
Message-ID: <20250417080516.3158818-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417080516.3158818-1-Qi.Chen@windriver.com>
References: <20250417080516.3158818-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A4.namprd05.prod.outlook.com
 (2603:10b6:518:1::53) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 47ea1f02-9127-42a7-6222-08dd7d869df7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3qo7/SwEYdlhZJIseFYXdIwQloviORsRq1E9G1wNQPpF1kIqnRZV6kXXdPuf?=
 =?us-ascii?Q?5M+PCjTFuXt5rL7omPlk4U0jWIi+6nNEbFIwK7U0Rtnw7Ue7qQkPFwLL/hiS?=
 =?us-ascii?Q?8bQSz67207xoQACB9gcHEDQzKhjPwEB843flAQVPiZMX6n8K7Kj8xW6WtRyD?=
 =?us-ascii?Q?Mv5DzeA/YNNZbbSzo/2xG9M96c1RThhQz+D/T1aKK23zARMV8KW/j8oKaZM2?=
 =?us-ascii?Q?RdVSoS+jWp1I/gNcbw1KXXV9k9GImJnjJ6qcjZnx2uy9da7/sIG3h8VPX6OC?=
 =?us-ascii?Q?Af+EOq4p0iMO81lcpSc65OthJozKVowvUHJ09jOthJ4GK1m8GYXiyb6Vu3w1?=
 =?us-ascii?Q?kzXY3bTmf2/b7LqVYqW+uK+HCOovKyA2aLgk7AWo4+sFg10VThSlH8mePhaY?=
 =?us-ascii?Q?CR6aAV4ybVGofEqO0txkpfK3Gf5aYIZ9Htiz/6xlO1ckIXnDlns0a0CKHs2I?=
 =?us-ascii?Q?1Aw1XY04FSk4MHqQTVnu4YiKjZhwKOsHyW1XVcrPX8Ivpk4yjCn4VjrQHUzV?=
 =?us-ascii?Q?YeQIjbr/I776LcqHn0wmD2ZWt6Zqr344tj+nHhh1f55OWPLVYHgKG65dt74d?=
 =?us-ascii?Q?cLCQgmcIxMYf/Hvu8cP71G2Gi5SEYH7sAxH46lsyJ4+8VaNoOmaGG+R5U8tA?=
 =?us-ascii?Q?RgzWqTJnyhhZUqukpf88XoImTCzIj9HNj8ggySr+RIhIeHIu04qI5deKaVQW?=
 =?us-ascii?Q?F5K/zX3S8CrAnzWJzkfbtF2e3y7iCzHZP2GvMeicPzHC1E2LBH2kJ2ZZFD63?=
 =?us-ascii?Q?BXEv7X+3N4t6bFLG8t2Cf/weSPUJcrRa+JGliTv3E5WvigIDdOD+upvebs20?=
 =?us-ascii?Q?GdV33EnMRUdm2+ZSBrgHcyf5BRTDjv9M6dMwT2U0pcOEGSBHBe4L47eajgCc?=
 =?us-ascii?Q?KXC6RfxEtYynIq4M2CrRMoDSq0tErKU9cA0W5ExcRbS6a6bgHGvl3CE3tZfh?=
 =?us-ascii?Q?Hb2gyMwERzpCSfLRZrpwHB8xweomkskmYBZ7bXd2Ya84xpdJkDJ2TiMUxWs6?=
 =?us-ascii?Q?AKjPBwfjcQZMtLUx75l4UndvrBXsDvtX8hla+ssblwJ4ePiVfiNfWv31mA81?=
 =?us-ascii?Q?I1q95dVuVu3KTBDhiaAe8RfCwDzhVNhrFjF2HquqVY2Ju2jy1OTk1uC36Tah?=
 =?us-ascii?Q?5VJYXldx96C+QrVnfwN56OlFhKrlN1u1E7IKzuP20eJMhRjnxbtj+6rmTSIE?=
 =?us-ascii?Q?W+Og8axZclXFBAYVcWThepM2HmSTCCjrjOYjTCGADq4k9AQ7sxH6dU2RtkVN?=
 =?us-ascii?Q?PBgozAQsLYKv65PeSqdmqgruxuYtihNoR19eKY6LUr0CRpn+c6OFZJaM5yHs?=
 =?us-ascii?Q?Xq43k/A+lxyFElF/Q9/fX7KATAIhcBMGwDEG5Th+q12juUxMqGOPHJ0VNukj?=
 =?us-ascii?Q?0co2TIoXURwMNj16h5ak9jMILqdFrTEPR0YPKXQEL+VN/L+oYLfmRtexDTnW?=
 =?us-ascii?Q?Qh4Cr6RXRWcHqySL6j6wICevanzF3zSOESVrwplMh01CNTbegXEv4w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z9MzhL+lB+Sn1hKVI2kgcP+3nw6YjxRY/cqXNK7la6C9jtKyxjX6NF5WPLcH?=
 =?us-ascii?Q?ZPbi63uaTuyyuzzk5hly+3SKoTz5vDsPysaB1hMvMZMjbYJ4GSJakucpvGm5?=
 =?us-ascii?Q?d7jnmYsdRP/yGU+ucBqzENEQkiUR7FlH+CpSDVxtruG5Q4ZL54CwYmd8thCC?=
 =?us-ascii?Q?xgrJ8KI4BwzwWtq45o5pV2Y2BpvcKX+yzpbo/0yEzkCRC7g8cYkdiepbVhmg?=
 =?us-ascii?Q?dDw941tkB4tjhfgJ3QvTsJYllAKeFmCMrXJvjHDLkLDIKT07CxVTCcETf9jG?=
 =?us-ascii?Q?afvasqGe4gIExIq815kBR3zmKJAlJe/tLgNdMPiovPFBvGcOvLg3fwaLmwIt?=
 =?us-ascii?Q?inbXaLeyEo9pRX86nB1zQZE/MEyLHGv3PPfxjxaReyAA6XEPnpWDNCzkb0To?=
 =?us-ascii?Q?Go7447Z9sDTuFvZzR5chVYCpvy2RVlR+OpjFutvyGbQ8PfF2mTcnLmzubm04?=
 =?us-ascii?Q?o4ImN3Kr/3XyDZpsUJzmu3O4WpIfRa8IztKL4mVFU1UvlxkOZYG8ugiYQxnF?=
 =?us-ascii?Q?WuVqgYv15jTATCgNuKxrXI/LjJhZVeNMrNWJVNCJ2tQhtJX4IEEojvM8+VFY?=
 =?us-ascii?Q?Ki0kjZzZ8p+zAy/RroUpO5nR39BtljlH1TxczGNSCKPNPpOXbslOZswPVYuP?=
 =?us-ascii?Q?DRg5wbm3C9KzWfSUf3Ok1ZLNiwYUXvnh35LhPXkBse/xaKCxQWS1x/kNqSt7?=
 =?us-ascii?Q?J6U02qHefZkA23SfRccConIlUpWplliJBNBn4N3sjH+TbulWsgfSnVh14cYN?=
 =?us-ascii?Q?0hzs0A6On+db7ybWODFeWB4S9W0G5QaEreUz7BacKhMdLL2ZRcVff5kdSxDd?=
 =?us-ascii?Q?o+FsDWtXuxZb09OVMp2rXeP23otjHX+TMS5o0gWYy9S6Gc1yLp9dhF5W6Sjc?=
 =?us-ascii?Q?QsYw3iLbZSlUWpz5+Lxmm7Naa1q+kdXmisFE3MzD5ppJy2iHM2siNw2412xR?=
 =?us-ascii?Q?0XJEDFo2EmazSM80NT7yxcHr1hMJDgz8+goZ4llmf4yQ5ajEYvDFW5l03hkw?=
 =?us-ascii?Q?RfV8scDwNamZpPAFWHtW/lmSxYRqv+/YofkoYsSE+bTyziBftho8sPXWC4gV?=
 =?us-ascii?Q?wZ6BxMHh0HNbm6eHR0w8TbhfAuCMLtTgmLbo1kPRvew3VIP7L9CUoOI8KNVY?=
 =?us-ascii?Q?85OjzrNGWVozdYvj8EW8rOmrUf9Bt1ChE57NtPR7XsWeEHlgrX04avZ5EpZv?=
 =?us-ascii?Q?ObNIidtp6FzvdHS5JYK4jFwlKxaG9krjmYRTdkRG5Y8T9HnjGB07B+jZK/v8?=
 =?us-ascii?Q?2pE0iLGPxPoWfquPDb+gEQqUVsjz2LPk5PKeQVLh7fBOSct4pdWvBc0YAzdG?=
 =?us-ascii?Q?4ETrGXC8j730ZHwnH7pgLklLEj8cwt8AHzke/vYx0fkinYzKXV0qD9Cg45z7?=
 =?us-ascii?Q?M0VFlhF5v0Eq+4IUn6Us1wFAqI3ZmwlJr6Dar+1b1i06cUhnJO/MsKjjOEhl?=
 =?us-ascii?Q?pSu3z2oYA+zaobfk763f08dzwapuO/VDperzCvPvo7sIM9IUYiyanxH7qJNJ?=
 =?us-ascii?Q?68gWtFmfMiHwRnASP6unpuvEbO9ZKNR1tdvime95Ltawbuzx2ES1QuE2oBj4?=
 =?us-ascii?Q?saxlDNy47PWZ78ceJtf41QbN60jaFsTY5DD/NpwYzLAQRkIU1GgfBK9lrVHR?=
 =?us-ascii?Q?Jw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47ea1f02-9127-42a7-6222-08dd7d869df7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:05:28.7713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Up7V/+48gBbaZfjjy7ao1oRmMVXDpXNU3sg05PYoYyKmWp51XM6BQsd84gd4iaxHehsh9eADem26asocOY8pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-Proofpoint-ORIG-GUID: myoQredtywAmEMRP4TqctpNmj0YTHYhP
X-Proofpoint-GUID: myoQredtywAmEMRP4TqctpNmj0YTHYhP
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=6800b64b cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=hSw8icBvHKLkroCVF4YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116922

From: Chen Qi <Qi.Chen@windriver.com>

piglit is an open-source test suite for OpenGL implementations. It
contains a whole lot of programs which all do not give out any version
information. Running version check for piglit is a waste of time (~1h),
so setting a '%' to skip it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/conf/version-check.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/version-check.conf b/meta-oe/conf/version-check.conf
index c41df0d496..5ab9a1d665 100644
--- a/meta-oe/conf/version-check.conf
+++ b/meta-oe/conf/version-check.conf
@@ -13,6 +13,7 @@ CHECK_VERSION_PV:pn-vim-tiny = "${@'.'.join(d.getVar('PV').split('.')[:-1])}"
 CHECK_VERSION_PV:pn-ncurses = "${PV}.%"
 CHECK_VERSION_PV:pn-alsa-tools = "%"
 CHECK_VERSION_PV:pn-gst-examples = "%"
+CHECK_VERSION_PV:pn-piglit = "%"
 CHECK_VERSION_PV:pn-libedit = "${@d.getVar('PV').split('-')[1]}"
 
 # meta-oe
-- 
2.49.0


