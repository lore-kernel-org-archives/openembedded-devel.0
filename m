Return-Path: <nikhil.r@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6801CCCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 09:38:23 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.127])
 by mx.groups.io with SMTP id smtpd.web10.28176.1761557896713364966
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 02:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=LWJYF606;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.127, mailfrom: nikhil.r@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETDEIdEifqjEK1CCJ4EaBaC+6iu2lMGhooY//q/ik+mRlebr13+YudHqNp23xjYxMS+INjR8Wo1DQ4/75x8LiBKXQ1ZcG3DEuBhBGcIFusfq+SIaBKfEPjknEFl7V/qq/E/ly+7zELAUVPF5x4ukrG+YZY1XY/FDnic4plLzjLJ7aEDj4g69ExCBiubsauZgiOckmk9pNmOa3QdzIM4WcF5OxWh0QWxI0/N2ITqG/M7otXoGr7kkf/AaMJ3Tf413ian5LaRo6WBet5y/rIE2UPjKja0wJaOi+PWdKOHU+FXe79CUWjqf9ztfTfkdUl38Fpz8XGunBTA06cILPTobRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylV2WNzwQn/fCVavviDeZu/IViN02DOSqmhaGTfKqto=;
 b=C99RHnuEYYXuxwqQNYKnnn8OgszRkyy2UK7Reg+rgtPz+xbJnR6DHQB2XSEIaUemCXYX3IMk1rZy2QqMMDs05RdCwKRy+S9jZbblcX9vkNtzqW6nsPYqHXaPwR1D6Tp6iL6hMbkIduQiInIeTfBu4WfzhUIzabOf6vWuoWZ4ulLIojcrDp8P+UoO6duBD6i9vfv9SAwrm1GTKjOATzpEpc41ZNgbMr+CU7HQiQP9doJjh+AwoK1eKp3vQGOEStR9IgGWhMFhLplIrpsxr3l65/IC4t0rZ6XNMNDN8iPO9MXpclyPtF5sn6kD/yCHIPohP2HLok/+8IpZlAgvh7udpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ylV2WNzwQn/fCVavviDeZu/IViN02DOSqmhaGTfKqto=;
 b=LWJYF606bxvHqMYoa9/yk8DWTKMajFX4J3fmvFRRuicEaZm7Lp3jSqSnWHVoq4bjhbaD34KtQURSj4KMnkY/sgrexUHni/HgBrQAYs9FeZhbHzVWJK2SJlk3edy0W2b9zD5nI+3eMEktGogbHNFqXzkKlWe+XzAGL8nPe2b4wikHw8jZnFuBnbU6igOPQ3oPBGGlNCFRrMaEf2+vXjx+VCDDtS9TZp/KyHnVbPEwXP//FYAeMCZlqAkuedVsRoJLP3AfxIKOGzL46AzSCm6RFJIjCdrQ8JR3CEs+ZjT/AfSzi8pn/dm34t3XfZgU7qTnZQ0aiqGLj6yASkxpxN3RrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:19c::12)
 by PN4P287MB4509.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 09:38:09 +0000
Received: from PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1]) by PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 ([fe80::e15d:4961:f9fe:b7d1%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 09:38:09 +0000
From: Nikhil R <nikhil.r@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Nikhil.R@bmwtechworks.in,
	Nikhil R <nikhil.r@bmwtechworks.in>
Subject: [oe][master][PATCH] inotify-tools: improve ptest result handling
Date: Mon, 27 Oct 2025 15:08:01 +0530
Message-ID: <20251027093801.73058-1-nikhil.r@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0199.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::12) To PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:19c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1693:EE_|PN4P287MB4509:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bb78f67-06be-4ed7-564c-08de153c8a3d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xEHYgyXQFwY9kI4h09ZDiYKAh8gH2HEBZVSSiGakWT6hNeAqGbr0+cYFf9rs?=
 =?us-ascii?Q?z2Zqsgv3I4G8qzIGCH1C7j7T7EHeiZPANndS1l2ayiozFxmmdndF53m3Bi28?=
 =?us-ascii?Q?zt9KqHteiwnheAhhLEf9sTFTAOcrF5DZ1SbAAPzu157EFIVRMtg5caLzEppc?=
 =?us-ascii?Q?JCDgF1Yd4Cz6yYQHrkQ/zLoWwoGRN+gGWzP0aSlkuy14OeQ3IvpbqlW9A/qx?=
 =?us-ascii?Q?t4B1Yiu7wFKw3QHTgFOWWOPCd53GZSDLPnIfIPfEkJZgeOMIX2ayYVUvkU+x?=
 =?us-ascii?Q?s0GlIbgL0bvBB7VYsTxtkH8vbRRmhEZe0pqFsazxfAH13KAL378GmdglhCCP?=
 =?us-ascii?Q?XIbsI7Rza+LbDuBiZV+y7bdNgjJuNh8L//XvFe7+DPQU2Z6yCdRp4AbJorzs?=
 =?us-ascii?Q?RleMzmFPHxRgPwRh2aRqXmfl9xMnT6MedS9dfbEHFmhYMLClVfR8f3Ezu+A0?=
 =?us-ascii?Q?SVI+rwvOwwrU46Lfr55tjTxRfVYPiR2kahUhxhrLTfd473duoffYchrBkWK8?=
 =?us-ascii?Q?B5rNdNs5kH+gzrxjjkj2gv3Vzes7AwW3TcaIhN5DCruwT/K+c5nzY4qjFQek?=
 =?us-ascii?Q?m17Kmmo/w0CtJX4+CZ91ylf20CbPWzUZS0EhLjdmh++FW6ZcF6Epwlx34EhK?=
 =?us-ascii?Q?tJmtGczWTwUaChgzKlQWkYPr7AyiipZZdLZ0RdODMKIRB41/fuGgnDzYYnO3?=
 =?us-ascii?Q?vx+hfz5+/gDXWJe71uaqb3iH02a0l8zloNx0wdhJXKly2YwD41hz1s18rSCI?=
 =?us-ascii?Q?pdXyMjqPOB1aao81yZcDqWYBI8BjxPIjWxKi5hM9dwDudxsz0hAgi3pJyYu2?=
 =?us-ascii?Q?lB6UecLEs4Tuqu7OrkM1+rf/XhLXS3KatT1iIDH1AhhEQrVQ/em9LQCzL03t?=
 =?us-ascii?Q?uI39PcwmW1AIPvYz4KEa0tsm+m6fArEgK0yYA4nfPx3FBE3ByUUzl0xkl/nV?=
 =?us-ascii?Q?kO56hnf5OjVwfH1FXuQKZ27ko2S3cOSsgmZMze/7sLOzs0IZvAuUBTq8bYT+?=
 =?us-ascii?Q?YBqdSs3ByBtL7Co97qoBvde1aIeUaovQcze6TBCHvi6MxdNhQYULveDTppyt?=
 =?us-ascii?Q?j+LOTppP2+4veoWz2SLvRyBsEDfhvAhuhLgFyyNBTBJKyGo/+5aGNB0v5N2g?=
 =?us-ascii?Q?GPenyk4V7HjISnEJwzNwMyFtFg2yMKf0YVwXg0uRXEEBIkcMG9qauTLniaTG?=
 =?us-ascii?Q?T4ukD5UApqYMgtC0ofrcezdszoSQu7Jk63fldoRV+7c9Ui4GpF4me+csqKsN?=
 =?us-ascii?Q?k6OuPh9cNHxduD16JlrSt6VGvoPrHZjF6EWeWvhkWST0nQCOw+GtO0xZWQep?=
 =?us-ascii?Q?E8SryBxIhY+RjpTxipnNuo/CQcdVnjpTFhLW0lgTPuCS4sH6P0eHH1J7fLyz?=
 =?us-ascii?Q?41EHdrTFqz3E/aFmlZdNr8iEV3kyqB1El7sjKPhy+5cRrVw3Tzvgv8n0DTlN?=
 =?us-ascii?Q?6fUBe9Ro6GAKCsY49wM0atLcUUZkjUiuiP6fk2FXjl68XZ760iHMPvFxPwnB?=
 =?us-ascii?Q?Z9YcAEhM1rc4qBzYEHYP0J/Ygh5kNSGDYbV2?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1693.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J39KGlctjCXpYr+wlxB7qlqb0T/+OplTQwbYVtiWx74PpD1pVFgK9Re0dBww?=
 =?us-ascii?Q?5nptdrI54qnf9U/agrkkyXmadV8rHUrEatoTdCpHzBGD6jFrUm3AP72lOxJd?=
 =?us-ascii?Q?cOTirEmRCri6RKLTfRA1uq4zsRk24YvoYiic578XA/DR2QGVBwLln8/JxYfo?=
 =?us-ascii?Q?48c50hlfTROMlEUOTEdrO31Kpa6/vwzgX72PYa//VzK3XyhO6brFwrb7DHPv?=
 =?us-ascii?Q?QsT7aZVCk3lMzb1U+g8RPfRDySeRh24099Ml5yq2X9J+Xf8UA0pxOQ7UGNrF?=
 =?us-ascii?Q?ycVDPrYTaWb2LVRS26WiDvBr2ujaJ5LsWR+DesB+w7iHwCmmKOQn7reHVl34?=
 =?us-ascii?Q?FTLqqkvkHNUQxUExA2WX9pGmmUYb7QlXlQSR/OoyrLd8+kI679yeReQsy+0p?=
 =?us-ascii?Q?MPRPAeW2u+0S+PMt3L84/oTRrSnv4UK6nFqwAZWb5MIuX70Tr/zZxPsaeK89?=
 =?us-ascii?Q?3vh+oLAg4TiPp56sHrQLAtf9JRckvJ/eW3EI8tkUJFc868kn8VFP3aUUj6q5?=
 =?us-ascii?Q?hSILjd8KZFFD4ocoQtBunV0A2unouHJHqK3gYnss8V6/2AcJj1TdGdQIVaBw?=
 =?us-ascii?Q?+kIfODjWT73+KDReMzDgtUIA0NPgfHX59hEvIEesypWzJ0Zl0fAvfLrvQkMx?=
 =?us-ascii?Q?AjJe8t0fJFZHl/6Og0rn5WFPUG6nTozIuEy/6bu1HOO6H2IZppCRMh0LRUr2?=
 =?us-ascii?Q?Qjk9Px/QlUfuInXPuMQ2RkViU+XdMMEP8IOV2fBx5zeCqjHSQx4TQVtydAYC?=
 =?us-ascii?Q?iFvaAA5+QkmcfLWdpcJGxgPu2XAEfnHNGiNTW+ceBabswuy1jqxjqB3GwB2U?=
 =?us-ascii?Q?aRmSZUIqg75+3i4vupZv1hilrKYma/GMX6fZ7bSui8rZ6/Jq95UNnLD8paDO?=
 =?us-ascii?Q?M8GTtmrSPZI6G6eW+I3ivWVejIDEo/wUO6T9qFFRfwcNlEckJz5GmBuOF9Xm?=
 =?us-ascii?Q?dVSe7G/0sNS1oiqAE5P7asuJxkC93dMG+yXpJr/wjdwUS1qAkcXaLFxouSCs?=
 =?us-ascii?Q?84Hqsta9XQ6tsgBDr7gn3O7O+eNzGUEij+MK0Ou2ZHskxsrYp7uECIo4jSa6?=
 =?us-ascii?Q?EZAEOWufjpQLk0HnZcgRSzA/hL4A+bQCBloIIAdRRsFrZpisxp2Y6zDOe0eG?=
 =?us-ascii?Q?CGHwDHIetMl47o9QFkEMMRbVyCrqPWZx11/zTQc17PQJaUlJ6k+B5BF1alfG?=
 =?us-ascii?Q?b2qFcrktJzRTNKVD1WQBSskiz6DCdvSEywBgFh6bKMZ5Ppd7iNRJPFFMwshL?=
 =?us-ascii?Q?Bcsx8pX/cj/P3kHfBk/QO1Ueh+vV4iyrWAnZCAd8lDjgjx6TNECyzMhKByu7?=
 =?us-ascii?Q?+o9WLgGOTRXI9Kwu4R2ZF+gAWmQbcXeh+hUsiCB4RErPO4GaQHJ3iMPYfHf7?=
 =?us-ascii?Q?dmgtNNib47/p9wvr99oDYz1EUz18CCGsJPXnR4ZFDnmGpk5sB4PtaqGdSQ+o?=
 =?us-ascii?Q?QUFHUzsd8ZxzhmGHGtFMmZMAw8VQFUdYhoiMZ36mnjHYqIjE+7ZhvkuDt315?=
 =?us-ascii?Q?CURt2/owjO4bSa4qmJoCMTwqje3Zou+Dr+xywlCmyfltlDgV34x9vuxWD0tD?=
 =?us-ascii?Q?uS4FZXZPbnhCVMO8z8Ty4dTCk7cMw+ewTYv7MctpIZvvJN9YtKr8+jV+iGWF?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb78f67-06be-4ed7-564c-08de153c8a3d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1693.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 09:38:09.6039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a5bUaLWNNZoFW7mutUJT0Qi3zB0iGyTWV//5yB1nEwhyV47oWfI4zzC4Rb5f9LzOJ+tdXh3Lvqy8t8ip8sVd5iKA7phTG/q/jreKveBQa8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4509
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 09:38:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121030

The run-ptest script determines success by grepping for
"0 failed" in the test output. This could incorrectly
report success for cases like "10 failed" or "100 failed".

Update the script to rely on the test binary's exit status instead,
while still capturing and printing full test output for logging.

This makes the ptest behavior more robust and consistent

Signed-off-by: Nikhil R <nikhil.r@bmwtechworks.in>
---
 .../recipes-support/inotify-tools/files/run-ptest  | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/inotify-tools/files/run-ptest b/meta-o=
e/recipes-support/inotify-tools/files/run-ptest
index f3b23d86f0..1bd51248d8 100644
--- a/meta-oe/recipes-support/inotify-tools/files/run-ptest
+++ b/meta-oe/recipes-support/inotify-tools/files/run-ptest
@@ -4,18 +4,18 @@
 set -e
=20
 # Run the test binary and capture output
-output=3D$(./test)
+output=3D$(./test 2>&1)
+status=3D$?
=20
 # Print the output for logging
 echo "$output"
=20
-# Extract the summary line
-summary=3D$(echo "$output" | tail -n 1)
-
-# Check if any tests failed
-if echo "$summary" | grep -q "0 failed"; then
+# Evaluate result based on exit code
+if [ $status -eq 0 ]; then
+    echo "All tests passed successfully."
     exit 0
 else
-    echo "Some tests failed!"
+    echo "Test program exited with status $status."
+    echo "Some tests may have failed. See output above for details."
     exit 1
 fi
--=20
2.34.1


