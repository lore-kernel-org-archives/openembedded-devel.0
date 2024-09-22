Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ED3BCF9C6C
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 07:36:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11161.1726990592950204127
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Sep 2024 00:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=999533e59a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48M6pbGI016865
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 00:36:32 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41swnnh2wt-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 00:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBUcojAlC//gISC5Ic/YzC7N5Nrkdn0yLQvKnH6yKFrqHZVE1dt9e1QNKXFWGJgzQYCqV7RG52O28xS+I2j82b4lLC9PXcC1HJslJLGY0xSW3X2z6WYzXGpZu81EKqzi/aIFfenbEfJVRyhcIYS3C8Ka1Fh3KzFDx5m4GE6R4uDqLuFLBOt9ahubR6h5OIvpElymkEucrT20B4seZpSD8s7KE4axkbkfY+Myav1TrLhbvcDzPYBq4dZ0JOog16s6SRNahfwtQzrGSsgMZpr9nMb7ZtnYk+r3sL7aSY70Sdtr+7HGQuY5am2Tfz3azCQO32ufD+du/9myTpGKmqRZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UG5ir0qXoBihKqAb0chRSHpEh4KUN1tt1JtbBFVVEb0=;
 b=at2NYnrRGNokWcqHmrXbgjmaOofW/eRxAhZzOcbLQrG2LIkrzMtNy+0NMWTka7xqiC1NWJNTSBoE2p9M0Wg4ZmQhnLM5PrYDcHRpUXYPCuMtcUIinjvLpAj8e+wzM63vS8o7A7zF/O2SLelcEzyZz27uxaZIAdLLr1LoI3THy6KBrBJqYd4PXgqOjZlk2BOmpPvNW8RxTlD2trh590zDBKjZC2Q/MBf0ptLOaPoPIP3mYHcBjUyk/faHrOnqhySu+UrxjdxyzsnHGh5e8tADAneNA3+BvXpkJkj2vYHxTk6hC6lweMBwZqkXiMslLCpuJ7MGP5/Az2QDv10NTDLlyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Sun, 22 Sep
 2024 07:36:29 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.012; Sun, 22 Sep 2024
 07:36:29 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] protobuf: upgrade 4.25.4 -> 4.25.5
Date: Sun, 22 Sep 2024 15:36:18 +0800
Message-Id: <20240922073618.1359707-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240922073618.1359707-1-yi.zhao@windriver.com>
References: <20240922073618.1359707-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0101.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df77151-14f3-4863-fb8e-08dcdad9456b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ylmAeF4c1cPwYbigptm0OjUdQvA+daPqdXZyKjNDJv0ebpltTlevxrdvw+US?=
 =?us-ascii?Q?bby0JuPXm28x1luhqwEM3v1JT4Z17EvEP/pVu9mV1tiaSixtN0yAEX3IjJXR?=
 =?us-ascii?Q?vPSUz968Uw6oMGVXWU63XT2IARvmHKVi5C9ptebHo0NRerlHeMjj6m+QMcUA?=
 =?us-ascii?Q?oIQ1EPzGes6rtHrZyjJnZjqy7LcGqndAAj9SM4bk/jrTKAopQY2qeSV3sTgJ?=
 =?us-ascii?Q?YG464ktJOzxghhv8UrvLXBmSHO2GVFQCl+TSSXj0KK4Iksp/tZrL+DyfWoC4?=
 =?us-ascii?Q?TQsF+PJDcggZkZrB4EZpA+Zo66EGXIlDnijDCRuOxUmdqBF/7DsUYjTg3+Xu?=
 =?us-ascii?Q?nx17OdPmymB7PC/2M5IMwqP+HULpKlgUrp0/q6it2pcuVmkK71jfb/dhXykw?=
 =?us-ascii?Q?TyjE4jIBvjL5zxWgd9J5p+AT9qmlQdAVfkMZJXhZ8KHtqd9BEMfee3A27zwK?=
 =?us-ascii?Q?a0+oPGLL3xnqf9BQ2IzXpZxrDdWkG2OPmtMyBhrda7fjBo2y2wpZURcBAn1L?=
 =?us-ascii?Q?SMnQwjvCKrOiyo4WWaH+gPmEgH6GdTEjHp97FP6mOG8dTiftezI2UubZ/dyZ?=
 =?us-ascii?Q?UYwAZWzA5KVHez8Cy55qswtysmnFTf4ECgQYOtJpipZpMq7aqydvZ+9W6J7a?=
 =?us-ascii?Q?kd/r8bn5EOVM42jZ9ICsFUCPD60GiUGIyxvt4uv9hybkM+9u5mUsh8vKTjKR?=
 =?us-ascii?Q?jBoKhPMEMt7DSSL8A47bUnoru4J+aodpWGwG6av25uk2exhqFshx0Fr6av2p?=
 =?us-ascii?Q?M5WuqUSVv3iVCvM+5ckEGB/mPQxKW6sU8BARiNX3CrUDo7hkG9CrD9wb/4qy?=
 =?us-ascii?Q?ftjieNidCPkFS4T16bZAu8sksXKy/a/0XvIl8ryXq4YKjugbGtSG/Qu6j+un?=
 =?us-ascii?Q?aNqUsmp2Ax3xBacG77Wn/egTSv7t/uXwQIKRA+plvsyA8ysdP/rDK6Cjkjsx?=
 =?us-ascii?Q?SysYEqIOlqQlr/F4vY2h3diQfMrcWtBRyFdPI80QFAXHOKGqqdPj7rfxqMNg?=
 =?us-ascii?Q?DVjjbHuZGmlAkP7JmO925yJueLyivx3CE4E5tyRXChIKM9Eq/RjW0CxZbvxo?=
 =?us-ascii?Q?evq5Yt9XbAI7pFAejqZ+dZCOf1lgk1v5lVPPxOzz+qplZoUbXIfHEOqgnKTW?=
 =?us-ascii?Q?nv599HH+S7TY8izJKxdsVX0PV9ZC3pJffAJ70rBKNc9ubY5r0ZCtcjudK3BG?=
 =?us-ascii?Q?DopYkaKq3xb7HpS7mPR8yfMvm0nqlXLNlsoKJYp2RzA3lRVazTPDvKlB/Bxg?=
 =?us-ascii?Q?A01hxDWsFsM6LuukoiSQFRNP1XOF5ms0kYXFE7D2P4v+lOh7BZ6RKiJP5s0U?=
 =?us-ascii?Q?i2FzxJKg/uoNe+EPxvF0khGyVg6ey1GoyPXf1Xx+5DWcJx4VQ0Lr6S4/vUZl?=
 =?us-ascii?Q?Pfqvd8M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/3WCSsuK+wV6n4mICJ/ECS/MiRJqBsr2cAx51V+4rjUIH6g4V9pbsrfXGRAe?=
 =?us-ascii?Q?ptzPpzTd9Fu+NMpkm4co/B+Q4IUbTmEhNDPuX2yeARycPfhNls11X3jkG4PA?=
 =?us-ascii?Q?MYKWmEjYpBRyJ1PZJUlE8xMTmlOifM8VfyegNZn6DFCkfkUrRQppuVu1y1LA?=
 =?us-ascii?Q?LEgiTPoJHfLZXWmfOYu4AbD0S79VmhTt/RweA/P/8YaLAm+EMZAgMg6HWAmC?=
 =?us-ascii?Q?JLyeBtkQD0imqa9xOl7hlCoadFCyTkJcVvuMTZG2/C6ue/WzFo+YPpNMHffg?=
 =?us-ascii?Q?2UPWu7z8JjxYp9+QxgfRcTvHziehaVbDUNxAS+iY9eH3GVYJmpbNBnwn8B+B?=
 =?us-ascii?Q?ffGJuqrsknFF57rFkk87tBwSr7rs0NMj5fWuQFjkn1UeKqfW9fqkXvzP2Fh5?=
 =?us-ascii?Q?bn0bzAECkE5lGp8NCabwucO60l84rbZDqDW1aZN08ziPuzOhDYWH1+jPPe+B?=
 =?us-ascii?Q?WQPkMvPFvD3TlFGdigc/qqVdA7bU9ZjaxpeayDLe7iGc6AVNhGjm2PcNQUly?=
 =?us-ascii?Q?C3uWeofFL6C2s2NuzqgJmIsHbG2pNUrnxyxfdmda1wjYiyqZpFAr2xNHai41?=
 =?us-ascii?Q?GfHNS1eKb1746PW9r7Ku0A9JKGPH6zapzRlWk6uoufzs26KLi+yCUQdbMNXQ?=
 =?us-ascii?Q?5QlFBtbi5r9QyfRCXlq0aB5HWHc6qdlmbN4ZQbmNWh8jCgx4fMGNQ7l3XNhq?=
 =?us-ascii?Q?Y82dtiOWIjzkAat89HOyduXqcwrkrfXHX37Gu6n5I7Nu6DA157Nk4sfAgMuq?=
 =?us-ascii?Q?q3pRRX4XkFL4kIhGvn/601FQ+Pp/EvQauWQxBWV1XFyTOajgyQCIrb1xLutQ?=
 =?us-ascii?Q?zKfWYmejta/wFYye8wWnAca7GpQ5ysk6SEfgNvFybUpdSd0RfXzmickuolR1?=
 =?us-ascii?Q?W6sOjqlpygo5gHhQl+noqxLNkNNiOo+04Kx1toh5AnWFe09IQ7HkQwYuhynm?=
 =?us-ascii?Q?yKr2ZHKqoBdAmcO4HowqkSDs03oluMojbCoJHkoauZo1p0Oj2mqzeX/ezQta?=
 =?us-ascii?Q?2dCDtTmjkTip2W8XwFezHwSDLNA1VAZdR0M/9vtcYnMB89YteAVCLTpBgrhF?=
 =?us-ascii?Q?eZHfIgzVepfurp0RV/TS+JAiHu+YRqXTxfCN7gzGbzjggi6cgHDwNcWjKFkR?=
 =?us-ascii?Q?zgGbTJhfcJu954fwD+3/7y2AI5WYEoNEi0HPySSB/gLNv9sZjtUBNc+ncbEu?=
 =?us-ascii?Q?/KD9sp8hohEIEZAQZ5rcGVkkI2Bjtr0B9C3g4+qCOgUWjKCfJ6BVx9IVpNts?=
 =?us-ascii?Q?rXoxBWKoPy6zHrYKmk8Z8aPJB3vx2cjFXFKkU9VWnT8bDYocL1yt7EXmuUH/?=
 =?us-ascii?Q?I41EpCfn/6qVOFawc0/pQx/78UugJz5hlSuQ+ufOGm+g63MK16XAG+t5Ixcr?=
 =?us-ascii?Q?RUWFIOBwVZN+70qzTaXIMDlKxEFosEn7XPHS+QegtO2PrQHoBQXGYmG1pjh+?=
 =?us-ascii?Q?Ry1ut0xSD2D+q39atWOjbcGkAowtJBfXNaT3r2uR925TQ7m+biKr8PP+aMW3?=
 =?us-ascii?Q?JzbwEVfyTwDFe0LHa2Z/SbkcVwaCN7Ttoms6Tl/tkT4Be/7MGqcWVp07Yb4X?=
 =?us-ascii?Q?O423S2quBp7Fjl3iDSYiKG4++cvVfnCmrOtTkqcW?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df77151-14f3-4863-fb8e-08dcdad9456b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 07:36:28.9703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCzpBDGyC0soGYPDKMO/b6kS6O39wieERpo4jeI30bVU68E5fiProYITL3KcQ04poddqyH5RekL7Q6fMfFiMVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
X-Proofpoint-ORIG-GUID: uutZHc4Uht-2FD44jcEGQv9TQ5bf6SvX
X-Authority-Analysis: v=2.4 cv=f/QaB/yM c=1 sm=1 tr=0 ts=66efc900 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=BhuEcEwMIRinowTuBiQA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: uutZHc4Uht-2FD44jcEGQv9TQ5bf6SvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-22_06,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2408220000 definitions=main-2409220056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Sep 2024 07:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112449

ChangeLog:
https://github.com/protocolbuffers/protobuf/releases/tag/v25.5

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../protobuf/{protobuf_4.25.4.bb => protobuf_4.25.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.25.4.bb => protobuf_4.25.5.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
index 354b3213a..d5fd90137 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.25.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.25.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "e915ce24b3d43c0fffcbf847354288c07dda1de0"
+SRCREV = "9d0ec0f92b5b5fdeeda11f9dcecc1872ff378014"
 
 SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=25.x;protocol=https \
            file://run-ptest \
-- 
2.25.1


