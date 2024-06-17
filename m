Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E397C27C77
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 05:02:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.49518.1718600567533722593
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jun 2024 22:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=68984e9a8a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45H2ornX000659
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 22:02:47 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys682h8ft-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 16 Jun 2024 22:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=arn6fLyTLTzK18iMumShQcOsGvEvwRStrJyGjiA6Xy/cG3sg2b5wmI3YSN3y6blv9xey5ubatg0r/WG5G5G0PRoUvHlM2YpEHr+rFdbRgXWuwplM7l9QjiKwfpd+Yin+RR0NziwKH53FJQFZv6flPKZaqS2S2xvMaok/n6jxIqL0/4QXW6rWS6biIVyCfV54LFgj7leQ0BEWcPBOyVuZB3oDAZc8yyY8xByxtUNpTpDXLqjwP+9vwvl536yg8tKfyMytNOcnnRvCpCDGPT/crWWcLXaMzKCLN2FMuPxkdn99JRXGvKqL6+KDNYFeRKExRUf47pV0i3pG9YN+EB2XuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgFVWbRWsghX4QVwyv/hrplOeoFMHbkAg3DIjSfeqEo=;
 b=Cmm24tRR+luvn8XmNngU9B07+zD1f/SXO6y2AkGd1mTK9S+Nf2S0qZ9KLpOY5FVtH9aPmbdAh5AaoLQ4L1W8F1vQoNZwupE+TZ4+B4HkAMol9YQjTiy2POgkI1uwp2fgNDKZpwncSLZhEcDcIq98v3CBqkREre0E3s/ULDQiJtm6KrC51SS3mz+RPa2inDeZeu8EI1+tGf7h5BIsyKl8Jz5bwlK3+lPsb/Vf5Qs6MJIKUI1+Yqay6HsO6XIn55MxN5DaMuqPVhwVmPzZeQOv92Xe/igHysTg+80P6P3J3iRnNmghRaQtKWo86nhs2W7ypVt3ua9xtA01v/G4Op7xlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB8717.namprd11.prod.outlook.com (2603:10b6:8:1ab::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 05:02:43 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 05:02:42 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] hiredis: change ptest output format
Date: Mon, 17 Jun 2024 13:02:30 +0800
Message-ID: <20240617050230.520417-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0165.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::21) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB8717:EE_
X-MS-Office365-Filtering-Correlation-Id: 4502f7c4-c497-48ef-57c4-08dc8e8ab7cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|1800799021|376011|52116011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5S8MpeZJ8kZjI2OwscJ6swuy85j1dzg3C8D0WjgsImrT47X5hC5hlu/pfsWr?=
 =?us-ascii?Q?EHZTRbo9ryaRCS6VkHxhBxxAU0AdAq/Qa9NwngLtBD5P0liu3EB8l0reh6T2?=
 =?us-ascii?Q?S+GI+ko7hQ6RgjNEmT8cHFiFJbqYRpAzOWm3iKshrvP9sIeonC0f4he5cWS6?=
 =?us-ascii?Q?YkIXt1NhOU31laTf85SGiKN9b+wUTJPOpowwzdbhPHdvTLK7Ftcie3L907iZ?=
 =?us-ascii?Q?5I0VoIbt7crNfL710jtlt38vPwOm16i06hpsL9f3bqAMPe67XOcrdvGdhzLL?=
 =?us-ascii?Q?etnRX3QFwUAAlzAGB6mCdFasz0TRvqg5Cu5rVETLhIgFUnR6olTZ+QkcbvVt?=
 =?us-ascii?Q?r290M+1Yjua3+iQT/K6Cy8vzglRfgXwzG43R8mGDtGCfOrufNxn0MSkas1UJ?=
 =?us-ascii?Q?15Kt01+S/Lm7iZd8p+BPsWUHk2NsalR/RpdFu+pNXw7Fo5mPOcm+t+WNlvZ2?=
 =?us-ascii?Q?2pYWXjT0MPNDWM81iy89x6F+rTlv2xMAVnvf+Bl6tdzaHDjFPDDnZYzUnJsB?=
 =?us-ascii?Q?6Y3qqCZDVr13LcCAGJEBeQ9jcbrLCKEsc8wdP2u0YBVQg+O0y0KxVzu9VlbX?=
 =?us-ascii?Q?6ktAp8/ZaAOtzwJcdMyQTEVYQ6RFi/98v3BizQkYLGJ4m020TR6HP304zSij?=
 =?us-ascii?Q?MfZyORe39ysdDpw/tb9TAXTaED1I3Cyt0VbmQJPeqX2E47r75hnbnrYBdPMU?=
 =?us-ascii?Q?6fRRktRZj1TA1yBf6kO0TYAhf9GsMqW0E/JI0IlQcF5k1dTb7Z7rOl4/hV5o?=
 =?us-ascii?Q?6sOw3NrD7xXWE4Zt7UyBpqbshzHzEFhsHz4HYJdWOGN6DpS2mcjc+KIhQZOa?=
 =?us-ascii?Q?3UFCPJG28VB1w6C+awosQ6JG93as2vi4i7dqbz9txEtfwHNxjW/pJrWR3OF0?=
 =?us-ascii?Q?ipC2Dzw7BACMPNkxxoeaTW4VmzNAG4B3IXqJHEV6LGn6C0kI3Kj54TJNpxvT?=
 =?us-ascii?Q?eNVzErxhHcsOy/iOk5bTH+YIyz2PXdwAOv5komG3vIKOuW+4pEbPWJrHCUSN?=
 =?us-ascii?Q?qy5G49OD0h/UEHz5uc0SaUlT3Xl7/NCi4P9M1dLH7uJaDW4I3jJRA/mdX9TS?=
 =?us-ascii?Q?B1l2hgSn10TGCief7sDsFVebbTXGiAHdxT2A9dJpvpa6CiP2S520FqPfNK0V?=
 =?us-ascii?Q?vJmoic1HwwmxVwD8KeAkUeya3Mulm2AfmFY6+8zRzgI7ztwlHyWUDx7fYLW5?=
 =?us-ascii?Q?znQsmqkn2PAfamyuOel7mucViGqTGB9C5GtnxobYXMcpl2xxiCuiQZVgZDDT?=
 =?us-ascii?Q?KypoWdBWoN5SHZkMAeq9j1p31lvHd24b3q2dHQa8cjDTg3/qD6hLglKk9rIl?=
 =?us-ascii?Q?mI9mvfApgPD0FwNfeVvfXsO74c8rOak3UyqVrPSk23a38qsgYIwWhtw8Ycmp?=
 =?us-ascii?Q?RvooUmM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(1800799021)(376011)(52116011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PddC6msDQy5QHEWetnW/5tFb9rcjPPCtGt6Qe6kf5wXNHjxNTwMynRoQYLdZ?=
 =?us-ascii?Q?q6pYyU7bAvCLrr/rVLS4OkdtaMu9MsOQ8CdtLg3nr1yhcZ+BXDCfj+hgwRFT?=
 =?us-ascii?Q?1DRJg+QIgkPi9EeSr+QzQ1YcpKPOSVQf5LjzH93LpFuKKtzycnOn7Y8cXBRY?=
 =?us-ascii?Q?NcozaL/fPWjLZpb3ffOgEuNiALNq3gW2ZferZaIZu6yp5vd6bmgaXqAmE13N?=
 =?us-ascii?Q?B1qEHW6l2IXOY7SWP4+zcpJBMcNbTy+d9OxgNoOKhiZN71Zo9WULoGH4TnDl?=
 =?us-ascii?Q?0zkpzJYiqzwteczSDZk3Z8viib9u4ojJLRFjx3aNI9wnC3Dp+MYFXl1aZfvK?=
 =?us-ascii?Q?zyglinO7a6xoWWEiv0Z+ARoXoN1JxrAXuifisps1YgVt1m+JBgj+gsLopmnb?=
 =?us-ascii?Q?cN3cWLeFvYZ2R1jwUr73705xKjT7dJACT0dgWr+wE/bJBa4w/UVQEaUHYo5x?=
 =?us-ascii?Q?ulIieKPEs/1G3DdelFFAgEiUKzRjOn3iJGO83LqUtEULv2KkT9RKeYRy8Ani?=
 =?us-ascii?Q?hJV2YFnZFXrM2X2OscL8SFT2G2KfeukPrm5i4DPTn8eJRm72KVvqmWlqdqlk?=
 =?us-ascii?Q?hxrzr0nzoWKb/H8+4G0bcPKh2uJdMYoU+4QGrt4lLD4x14Q22+1BLF2iGMD6?=
 =?us-ascii?Q?ZxTZ5VBzFzvCLf41vnQPWJxl529ZrScyBQo+jtRxApRIfT6xPwFSkYztCFTP?=
 =?us-ascii?Q?mntirKzKUa9usRKycRkgKLQuvzGvRT9uB6R3Qn5bfnTDXHFaiQ/gFQz7ASsL?=
 =?us-ascii?Q?794Yf2JGH3PfXljE0eiW5SFB/GvFbTmi7y51QupBbYXNT+7ey3LP/1eVFt8T?=
 =?us-ascii?Q?n5DlithKw3FtD5BjUjBEM7LhgGcLnxsVD70OPs9zy0jQRVU/ZcyM0idfzfpQ?=
 =?us-ascii?Q?JgqjkrT7AqiC4PTnXDacuhEBSMtQPI7lJIP7uUEpx4ZixnQQblVJBRW4EilU?=
 =?us-ascii?Q?1l1WVj11w2SnHXHtEpo0UwLnYkf3CHo0fXGUU7Z/SxZLqNPmdASWicQu8lLn?=
 =?us-ascii?Q?3UUnhr0M7Tw5sATmrd2xGb1m9IDwMzesVWIS9NYohY3nGd46sE31xB1Iwbn3?=
 =?us-ascii?Q?MvsPgGzZJ7ssTA9Ss+GeDrvzdWdoOGLmgDCaBJgwXjlclRK6v3gP2qkXwTtd?=
 =?us-ascii?Q?rBgBV52TYE8GvAcpAR7xUpgPkWoXKfr5/eI7lhXJELkfqu1KI9u1mGYWicS/?=
 =?us-ascii?Q?oeMjsp5dAOIdghCNrBmD7TPpMzBKAH2RHCKuURzYfHg4MPyV9Wy++jXIWngq?=
 =?us-ascii?Q?aNQA61VQfPiR2zTaHWv/KyGm6Ho4gQwG6e9Jieb1Tk3WyUxMObsMJ8OZXrDK?=
 =?us-ascii?Q?sYEPmADjwcnhVMzBF0ZUiqFkva5JpFITgGnMUViPL+WskK2m1UbeIXF+zSUZ?=
 =?us-ascii?Q?tCZdCqIYHcfXFV4MIAXGlqLSB9tINjfGhr41JvJT01JH/V/IujaJYj/jj9XA?=
 =?us-ascii?Q?9p2OtLrD9G3+Z42FDffSFnb/yyXhPbIOoCIOrAYbVxvH9VH3oq03jcxWlMXG?=
 =?us-ascii?Q?9uVIE8+N5/SBVYV9198p2C7qHjmLH6141bNb8Ulj6WHhVCg0nluq2oEKijed?=
 =?us-ascii?Q?nmLGZq9LDVch5M/gUNbTxkyKXHDEXVva0VqDzQKAq+ZjVcrMfSaiSx3yJTms?=
 =?us-ascii?Q?5g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4502f7c4-c497-48ef-57c4-08dc8e8ab7cc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 05:02:42.3240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2kTFbkGKjKiCWCJFfvf+bRGsayhOIC4Kgyp9UEyIvhFngjq23j0oVAUIfwIuuHZQUJH1AEol70WOgGn6J7e9UypygV6mdue7N1ZdP6QjCCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8717
X-Proofpoint-ORIG-GUID: MBmzpYzzPwaebuiXise-GYTJTQ0zz2jW
X-Proofpoint-GUID: MBmzpYzzPwaebuiXise-GYTJTQ0zz2jW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_04,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406170036
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Jun 2024 05:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110939

From: Zhang Peng <peng.zhang1.cn@windriver.com>

This change consolidates the output format of the ptest command
into a single common format.
The format selected is the automake "simple test" format:
    "result: testname"

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../recipes-extended/hiredis/hiredis/run-ptest  | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis/run-ptest b/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
index 59b747dbd8..8d450b881f 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
+++ b/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
@@ -1,3 +1,18 @@
 #!/bin/sh
 
-TEST_SSL=0 TEST_ASYNC=0 ./test.sh
+TEST_SSL=0 TEST_ASYNC=0 ./test.sh | sed -e 's/PASSED/PASS/g' -e 's/FAILED/FAIL/g' -e 's/SKIPPED/SKIP/g' | awk '
+{
+    if ($NF == "\033[0;32mPASS\033[0;0m" || $NF == "\033[0;31mFAIL\033[0;0m" || $NF == "\033[01;33mSKIP\033[0;0m") {
+        printf "%s: %s\n", $NF, $0
+    } else {
+        print
+    }
+}'| awk '{
+    if ($NF == "\033[0;32mPASS\033[0;0m" || $NF == "\033[0;31mFAIL\033[0;0m" || $NF == "\033[01;33mSKIP\033[0;0m") {
+        $NF = ""
+        print $0
+    } else {
+    print
+    }       
+}' | awk '{gsub(/:/,"",$NF)}1'
+
-- 
2.44.0


