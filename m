Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9873C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 08:59:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14174.1721638741337970008
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jul 2024 01:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7933935366=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46M4h35m008376
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 08:59:00 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40g4761bjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 08:59:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LG/pwU+Vz2pqBJEEoYrni4LWjjYbadvIEHOXrdgaYlQF+HbcD7NrYHQSwQQMfs/tPGG2jtmbpFRNKq+ljIQncA6y36/Tgb3pcw1QTzMhUyL4WEUNZu6rQa5+bAUCpCm9nPTT6aj/GHYdb9zpk4TWWwqtv7+LUUu3zvsr+uDOq6pa3PLPKX/yNTsfaY8srK2NM/giTHF2O/GYDuvtKsx71YWDVINf4+XgID1mDP61ns02V21zEqYrqXgXEasy4gUtWvGVmqJ0bkhEGgnRcNmvpEddsz53wd42KI+4g2LKP5r5+ZuG5tqIaFSH5KOeRwb0NQeVNFHfJFz9E2197fSKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTwBAKu1zkn1qS8kmreht1UJWEWhn1PNmhjvYCZLwbk=;
 b=nuYZ+eDOHY2wBJslulzO9X1HrnVPFWt0WRTCKbNouru5lcRcRe8CkRx7xycDsxOVfLIYTFsV4NUklCaKvEapSNopYu43KTyX4WLEzRZEgCrb1IbKwSwZYfVZ6929iLH7wzvFcqEVcqiX2CxEUYa8daNpPDgovpjhiV/uKQSe+acA7q2rMg7YKDSuU3puD1ybfhDDH8KEecz31wyzpecqpdKsL0gYME9vxgdBU6ZHj3PQUiRBbCfGsif6WMFCKSRBOYe3bcLU7N0W3hZDpSxm6f40SVD5X9DLoxgXQ2ouRuvU7w5Ler8K9tFgkOpD2ZEQ/7KsBFIUszg+X/t7GghZxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB7102.namprd11.prod.outlook.com (2603:10b6:303:22b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Mon, 22 Jul
 2024 08:58:56 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.7762.030; Mon, 22 Jul 2024
 08:58:56 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][scarthgap][PATCH] hiredis: remove ANSI color from ptest result
Date: Mon, 22 Jul 2024 16:58:46 +0800
Message-Id: <20240722085846.1599546-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0015.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::20) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 60b406ec-ff81-43ed-d096-08dcaa2c84af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?exoMir2wtK6dChI922BfFNBxUeFLmWEoLsuo7CDPam6NyFbHtqbfzGak9mom?=
 =?us-ascii?Q?GKUqs9ez/uveY2y2w8QKyIlWY31mCiWkOWs4zQqO5bHZoYnao9ONuKm2dZgA?=
 =?us-ascii?Q?2KOVZmBPgrDHwaHOfnANWHtNPYDbEs+WABWhDeEMk8ruaNLAVK0bZHbyQnN2?=
 =?us-ascii?Q?fX9altDYKQ+wKv7GJUqVCKFXKwS7YhCQf826w7Ii3QZvudZaaJludH1M/afx?=
 =?us-ascii?Q?yprYCCoHklyXeSpnoSkgFIHBbYnsa+tco/ajr37x315U11vqLh7wVr/yScSL?=
 =?us-ascii?Q?tfP8LS1pjdEgAKmDpNrIdsxgoD0RW0foNd8jDHO0e1fcU3y9KwHp4+2IDwE/?=
 =?us-ascii?Q?zwLWfDUwZ08WkQfLrYuYePMfN920xT//J6pvQ1xIknYRZUjJ1Fql5/UOiM3k?=
 =?us-ascii?Q?79gfwnDSSEbFY1DD0P3Vvv3p4eKR+qLDzQOSh60Ijqsq52OefsMS6uEZe2bb?=
 =?us-ascii?Q?FAyTEtBT3gauI1q/j3igJLryK9RCmCDa7Z0EYnyEW1WYsIv3zU7psegdOAmi?=
 =?us-ascii?Q?2nuc9ZIiryjADS2ZUyCrDcBz8hYxyaR4Pgk4OTptnrNX3lIex96b/tI6Z0Vf?=
 =?us-ascii?Q?GTyMvwPkzSD6ji5PSgCHqilpksTuQPy8U+AsrTklbtcqCxoQH4q2koKY4qh5?=
 =?us-ascii?Q?TNyUSVm9541/0ouGXiAdr29PfWWG4tXVo/drWth3MJlR3ZAHEi2cvNpDFWh1?=
 =?us-ascii?Q?EZDLrE3/NXZw475ptokgKVl6cOy/o/fO0v7miVto/CUK7cmCcT8hW5Mv5rht?=
 =?us-ascii?Q?S6Y0keCTxeMPjBb5If7pML1NicGR0JOJ83RqLGgfE/YCZj/8HQdTPoz95TKD?=
 =?us-ascii?Q?mZU2dXUYgS743/9/Gg1aKeVYsKInQMGacLYmxkACgM7sZT8ikzfJf8CD2Mni?=
 =?us-ascii?Q?6rkJ1p+Fz1AtcnL+x7krT8wGWoTUyGw4NcZ+iQYNLVN2DhMl0BAzm//pTI0x?=
 =?us-ascii?Q?hoVtnUaq5aVQlU/grySdMB/TkT+ErR6t+R95FF1ylsaDN/wLNHDIy7NfXpmL?=
 =?us-ascii?Q?yo8YMeaH9bFK6WCmNp0jng033U8C4L33+vihcoD+QadryABqOZfdXwljtxR8?=
 =?us-ascii?Q?/guxVuBCCdBwUtUcnaCy2rB/NrSBJUOxQdL5h0U0CeqK8R48vjdRv+l6zOY0?=
 =?us-ascii?Q?BlOLaTDtR+oEkovQHR+JCRY0UrUa3UX7vTtIc5ODWETveFFHwdluDFqg5oec?=
 =?us-ascii?Q?vsbewEkhb4xaVD/7Y7b4tmxc5rlVJ+e7OeFTe8e+gWYoPCLwm/0/DTqPH9pT?=
 =?us-ascii?Q?fsHPE6g+uwNUICUhHl9nCkW8ZgeLttqwe0ucAQSQuURTMwv07rxinjGz2y4k?=
 =?us-ascii?Q?PbtX2bgbZQ8y2HRQxAWK1QFQ/squXbZXH+tlnj/1I99s7cbmc1rwDVFbS+QG?=
 =?us-ascii?Q?l4xp3YPadvXe+zJNniq62wZKU72P9AZvfg4usPPM0181pzPZsQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xFFPSi+1aEMEfZgKtiDTTTaQ+U4QfKlUApBuVLwVlC16KX+GWymRbM6TR+Eh?=
 =?us-ascii?Q?0NIJGXghzU7Ad3d0Osw3zdpgs1hk540aFSoT0yoaOlaRik6L914V8LabEA2i?=
 =?us-ascii?Q?N6jB8qPB158RXMYJGyGUmz539SbrORV8hghY4KUxfDBwgXITuHksOapRNKD0?=
 =?us-ascii?Q?u3CZ0I86/kwUjx6zJ8MfRkM9s3EoSyJBS1HSjaNnAb9ZDdRjD2Q47MeYPC++?=
 =?us-ascii?Q?8vtgXC7A4bIoKqxLO5R0p5EjKJ/a9dLBSSYguw+W72jqAMPEAkP6LC7ISYwd?=
 =?us-ascii?Q?vkiCD+nlswVTLFNdDlqhmkyiD/sjQuYUAu7BUJ7R6pQxrGZR1jk+5WHMFqqx?=
 =?us-ascii?Q?zuockfDk20/8TMKxqPIP77IZ4TbG0X6CVKEY4S7hFXC1kWzbriCUZLML/O8X?=
 =?us-ascii?Q?08cnCAnazLel4wcyrf4PHbNWhGydF72dBqvELz3AETcDrQTVP3PqnsiyC66k?=
 =?us-ascii?Q?lMbNP8vx+re1uHaajqDND8qn/0C1LRUVR/dv7xRByFdch3hlD0Md2R/XAopX?=
 =?us-ascii?Q?miAoMiCVZjwR7MoqEtKYtOmZfwcCxa67za+991tYA/yh9VJRYBvIYe4gDhwf?=
 =?us-ascii?Q?q9YponoJ2OtfMUcNNBGYg5rjGo0S5dVetKN0pa40W8DVGtpLe1ag7e9TAc0e?=
 =?us-ascii?Q?40V8esM+2kt4du7A99/L8ObvSYIiVgmYDruKiPxMd6gdUoJcGmQtjqjTQlRs?=
 =?us-ascii?Q?iRh80Pk/e3rUsuOxPa0VDFYt3uvIhnkrIJiPTXQOCa/LisctC2gwca182SsX?=
 =?us-ascii?Q?MyFUuDmrBUxxpDzGXYzBS8sGrASou9FbsIsJMMno7QruW/5AE+qhl6anw9Ik?=
 =?us-ascii?Q?2+as1k7HeDvcKha3dpI6iRLxIQAnIROptxSTVSCIRRLoLHip7ReOYIcWBl1L?=
 =?us-ascii?Q?GllNUJsIH1WOKAb+qZxk6y0hCSYrCWp8gTBH20Ll5AYnz49a7eClmV5holHm?=
 =?us-ascii?Q?3V8MXjsdNeceHAUQoeWt+3FjDWgeFEZ9O8Kdvi7vqD4wCm1lyP4CMoe3hqIy?=
 =?us-ascii?Q?ZY/OrCC0tu/LuuGpwQtD5BMHHYKOq77puS8B+GiGXBLxK9cvFMNjiaCvhQC5?=
 =?us-ascii?Q?55NLmVXb9QzX/PovksQu6FO64S4522yFDS1IioOujLDDtdTvM3CjPWLIMn6Y?=
 =?us-ascii?Q?pt064VI4nRfAZKSlX91eZj7tcgLsEh7sTElkgJT94nU/4D8spPfWWJjn6ADv?=
 =?us-ascii?Q?x1XJNhrkI+f7A2CEQnFV3lYb1r4RWNbt/kb0ZQ4ycbOzMWDD/XvdxZ4XbUXP?=
 =?us-ascii?Q?EuFfyQJljqyX/XQ7VNri6ntq+wkMHBC3zTVU72Q8aBdvn8TqcM4ibZ4oxG+8?=
 =?us-ascii?Q?70YkrBA16sW3p0GGJ9+PO5Rp3hcvwF9ORCfrtDV4udscsPs5NwQ7bqyp2fv3?=
 =?us-ascii?Q?aiv6laDyUT6mxJBs5B4Gf4ASXlUAIP/brK6nPTxZWAvhg9TKuPjMj0Tqso08?=
 =?us-ascii?Q?d7rAU7WaZvLQt+nf/l/RKNP3Cgl3ghrIf5TXHNnK7vo8c68A5qIO2tTwRzfn?=
 =?us-ascii?Q?/BqnoXGEUdUeJtqHhB35oqDcQ7ZsNXlfx8s96CHdLL8Bm4UseHE6fuYzCyjT?=
 =?us-ascii?Q?hl6PH9IzESqe6mWKlYHzx/8Ceg60p8/FyM8YJqnCJdw6+aB/AG1LGSfw1aTE?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b406ec-ff81-43ed-d096-08dcaa2c84af
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2024 08:58:56.3884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wnpyx28AACgml881tAgEecHPcSD/zX+OdTGEfd4vLbBGuzme82b7EyBmKmtvwGBoQ+uziktnQ4kyao3LTtkHzeVUBzCoZKI+RuOKozCs4Wo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7102
X-Proofpoint-GUID: XcDj3kcEFtJXGGpmRRFG8co6aliB-NGH
X-Proofpoint-ORIG-GUID: XcDj3kcEFtJXGGpmRRFG8co6aliB-NGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_05,2024-07-18_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1011 spamscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2407220069
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Jul 2024 08:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111426

From: Zhang Peng <peng.zhang1.cn@windriver.com>

This change removes the ANSI color codes from the
ptest result.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta-oe/recipes-extended/hiredis/hiredis/run-ptest | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-extended/hiredis/hiredis/run-ptest b/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
index 8d450b881..8b352c340 100644
--- a/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
+++ b/meta-oe/recipes-extended/hiredis/hiredis/run-ptest
@@ -2,17 +2,17 @@
 
 TEST_SSL=0 TEST_ASYNC=0 ./test.sh | sed -e 's/PASSED/PASS/g' -e 's/FAILED/FAIL/g' -e 's/SKIPPED/SKIP/g' | awk '
 {
-    if ($NF == "\033[0;32mPASS\033[0;0m" || $NF == "\033[0;31mFAIL\033[0;0m" || $NF == "\033[01;33mSKIP\033[0;0m") {
+    gsub(/\x1B\[[0-9;]*m/, "")
+    if ($NF == "PASS" || $NF == "FAIL" || $NF == "SKIP") {
         printf "%s: %s\n", $NF, $0
     } else {
         print
     }
-}'| awk '{
-    if ($NF == "\033[0;32mPASS\033[0;0m" || $NF == "\033[0;31mFAIL\033[0;0m" || $NF == "\033[01;33mSKIP\033[0;0m") {
+}' | awk '{
+    if ($NF == "PASS" || $NF == "FAIL" || $NF == "SKIP") {
         $NF = ""
         print $0
     } else {
-    print
-    }       
+        print
+    }
 }' | awk '{gsub(/:/,"",$NF)}1'
-
-- 
2.34.1


