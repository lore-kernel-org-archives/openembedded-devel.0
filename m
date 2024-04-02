Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933CBCD128D
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 13:34:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12450.1712064857695380221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 06:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fQm0UovW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4822a20b16=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4326EObu008128
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Apr 2024 06:34:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=j83UhUoF6mgMgJM6dcYy//V6JFHL6WXcDi/BKK7o5hw=; b=
	fQm0UovWMLyVjI6giKl3SbziKYCGTyPlRSo96jjLFYtSdzsQ5Pb2Gs6j+Sg7lynJ
	JoTkAXV63ewKoqAb5YkjtBmfMRf65oCtDzJMSYJAFS5fLeoTbpsW6Xxq1NKFjujq
	w+BZF3PYli2j+Iv5tiOVVfv3wO5f5N8aooQ64F09qq3KDSAMPhXW6ukDpaWiSEb0
	u3hbiix1D2t9n3sZHmGR+rPpcVtkDqgfOTXu2aY2VZuCAH/CvTf/X+datzwS+7x/
	dgIVodN9FzdVAijcBEyBAi/OElanO1m9MnKRGwDXQRYIPgRGRKluPjjtPysG+WcO
	Ct+XUIQHw87BMn4HIzT1Lg==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6e10k2mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 06:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as3xGZxBM5R9dmiu4nhekrvgLxHnfg/ezkvv3EiemyJPZcT1ahUMzeD8gF3R4ZKrorTa1DeUWaxL1C2Wt1tYgPcaecPL63TERPkVCKL9X0ZAufvQm9XxTBclq9SFs5caa7lXsjqZfJqZfkL5/YcoSzQ9Wq2Tfwjs6f7YoKfDk+5PGCWG2Fqpp8/1YEw45xPScKY6/E+aHEuc9nILBvztZb3GbaNHh19t5GsHDhCa5/hM6MX9jPRy3rGsN+s3y7DUJqLpqwpIEGio9LwbPw6JSN0iopaLMu9NKrUwPXgvRiba0AzjuLKbrph8iQJ5hubyaP08cc0h0lTNKZziOEN/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j83UhUoF6mgMgJM6dcYy//V6JFHL6WXcDi/BKK7o5hw=;
 b=nfYMwvTo2+1XLYPHKX27ZHvZvbKkWLicso15OQ4bQ04Ns145DUWc+4dDuILO1yTzB7//EU/kR7e7ZDjiwZL1+gz34S0Gj+uD9V72BkCRrYWlRmdHzliJ4zOk+A1yuaG833ZkiNF2rbGpuNiEDQCDktuApWzfN9uNhqOmzGA8AXJZm7ikX7JiBgL5eUpHqmIOIci0hlFLiqvChRlEi9dViXZLnm6DwdESvyWXAPzBhvMY333Uo7p0pL98nrMVgXMkHuwfKtP952MNCPhQxPKDNdxW9L2mOouqQtp3lR8QRB39vg7RhyhZwxcuNjqLrSqJxMGaP8W+qEiMKiWIAIbP/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8767.namprd11.prod.outlook.com (2603:10b6:408:215::11)
 by CO1PR11MB5090.namprd11.prod.outlook.com (2603:10b6:303:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.22; Tue, 2 Apr
 2024 13:34:13 +0000
Received: from LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379]) by LV3PR11MB8767.namprd11.prod.outlook.com
 ([fe80::6730:81e2:544b:1379%4]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 13:34:13 +0000
From: William.Lyu@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/3] nftables: Fix ShellCheck violations in ptest wrapper script "run-ptest"
Date: Tue,  2 Apr 2024 06:33:59 -0700
Message-ID: <20240402133400.3347547-2-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240402133400.3347547-1-William.Lyu@windriver.com>
References: <20240402133400.3347547-1-William.Lyu@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To LV3PR11MB8767.namprd11.prod.outlook.com
 (2603:10b6:408:215::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8767:EE_|CO1PR11MB5090:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pMlPWSofTz4ScVrJXWpf9MORwyVMc+yv8mVt8kHnyJOzLEh4Ycdtq5iyU/T6+qJaM03SKtcnDBx1DFn+AS9u2WtgYt+QQN0O6Q7C9fRAZfYdVdU9T3ClE6SDyaYeySDBN1HHBqQJnGC/UoUNW1EwfUKlgn3N6j/73bxVLIXFkmq9ByD2qyUsylvZ15B2zbx1CDW8q4HVu7O5b4XVE6DlEH0XUeX21DXsOU1XdwByalqHqeUvPvrS7Iztd8UCfC5a2msB/G5Nb2/NK6/mEj3d2ivTQ49HZIKGMkZG9lgrgyclaYaSbuq9A5PCZTD62jcnEXPcznIAEtE54TB1O6FjiGTdaWIhwT0gzguxfflJ5Yt8o0KlzU3dLraHY+OqvPfTX+6RFZrJ/JfqT3pYhbwSy9CBB3Fn1KBL0/qHt7Ke3+WXSW10Ib9sinW5JspVPabo1R2fhPTAH1ziWKbgd34Ja+f9RfzfA13SGvNP5XNh3BLqXfMFqF+2F/UjVhoVgBOP557gHY7iVEZK1lYZZuL79ncyE0jhteTnc3N903qDvxWP2NiQIk3+LnpC01VMJMMJ9I27runUD/H/lZWjxxs/0Lg5JFD7DsP6jJHp6OT++Ch0wPbRMcNTlwu/IIRkLJXVMEz/tkWsT7x+pgrUEaq9VJuO26PwrK6uy/OPYNJPP5qCCqT+AoT6vxg2S401PV9n2ozua/Jh/vr+IOEapOTeZZYL49M6/q/s2KMzoba0bOw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NR0fkz9PbnNPFVj24HbUxZylYB28ZtZG3lDc63oMPBt373inAFA00RxeW3ja?=
 =?us-ascii?Q?z/w4tPUct++v/Xhy6gYwhuGmsrkRU40lg3amqnlCaTbQMJZiHGQuNe288QBb?=
 =?us-ascii?Q?SCe1v4IByviYynMxK0VYAxSvrNo4ckzyPG/nOHU0M1Mp6N8JbAzHe4jftPVk?=
 =?us-ascii?Q?Fo8k5Gzu4k0KvWb2QLcCv1L+FGSww+v6ZcLZDfvjC7XKxrxl3vEmpH0WADBC?=
 =?us-ascii?Q?D6DCsRosBo3uD8E0Z0GDF69Nnfc9sskhZCtcLh93YZNED/BEHRCOTD2tAYLg?=
 =?us-ascii?Q?3IEOKuEnV1h2zWYiv+cI+XQulJumYfoV7nMO5i9xZncKR3NPXORfSlTjc++v?=
 =?us-ascii?Q?Oi+ur1A9xYW8CAslEMdLqZoAUx+7I/nv95VqCg5UcPiXmzNWL+/lvmo3n9dd?=
 =?us-ascii?Q?oW4bt7IgYc7XBCTuYPymdEweYM2egvfHXBH9yGW/ok+Shsdpaqn3dkhONhF9?=
 =?us-ascii?Q?Q/jjA6YkSE3grVIzO77L+8vouTO2DHbeOej50AidGstOVpSgIQVEoAnOO5/+?=
 =?us-ascii?Q?ccHJ7vUdVPw9UCJS0S4dV6lwY2d/N0VU1DyGruLPWuJrad6zDi2ztrrree9Q?=
 =?us-ascii?Q?LtN7tip7F6Ib9s54bp0YjiuCKAB9sY3A+juHsYjmsvEefDhCy13JyaNEBsnX?=
 =?us-ascii?Q?cPmg3Rzc3khnANfh3dWYDrVqngN1GjKABgyW9aCO9nTaxF4AA5zXjd+CtQ+V?=
 =?us-ascii?Q?alVW/Mc0sJcfWhAoGUxCB/WZ5/fZrlIk0I6OMd7Ay5fKz93IVOk5qEU7CG2K?=
 =?us-ascii?Q?gPS4YQEt+arM082NrYTWfDMDGPXeC6uHwId9FDnrWxmDQ0iucxjnNIW5XHVg?=
 =?us-ascii?Q?cqXmSE/abcVWs7K3ikFwnTaUaVitF1gxA2LCT4cIG+AsUQUmY1z5i3vBxtEc?=
 =?us-ascii?Q?GJEh93rNaSN0DBh9sonO7gwHAXLW2yJBxNtT2FN8z6EX+zEt5zLgnLqpduCC?=
 =?us-ascii?Q?Dv9p38PBWHsj8z1WK7TkG2soja2ZTKuoWExfOM9ZGHGq68Bv83+Bv75bsXqw?=
 =?us-ascii?Q?uhcWBMpWgCzoVcbZEaesa1b+VjFNLZW/LntEi97gCjlPv0rtKgQKRTQMiLIp?=
 =?us-ascii?Q?paO9GLxDM0VhmRc1kSF8BEtXwAmDL08WNx8crHdchmCch0kb3hhaHeklkoxO?=
 =?us-ascii?Q?evx2Yu3rwnq794t6DOCp+V8gdLRTnucyX4D92x9sjWXmTeOfbj5wea2+LFQH?=
 =?us-ascii?Q?dUlNLa4/jA+d4pIrUAZZj1BbIT0oGXkfvJ+fLlSw5gqdLc9Mxba3dbZti8x+?=
 =?us-ascii?Q?XKNLx+Eg8ZcDRJkFrfDuiZXabpMIwuo4gOOtDOSvT+R1mrAEWQbKFyGhcUQT?=
 =?us-ascii?Q?2mVcp6pqz6LMU3iUV+Yc+tefQt6+1HGAZpUu/CGEXxLEh4ir8QAlMe7IZrIU?=
 =?us-ascii?Q?+gNoLhO4Q1z0XoIbNue4pe/StkNMGdWUZlKDJ0zasMq1LcIN0N9KPpI0h+AF?=
 =?us-ascii?Q?F4Q1DTUzrmJ2olIe27Xxr756qFIIkMeS90YJWGUdjO4yo44b8h/S67joBve4?=
 =?us-ascii?Q?4LFcBUwWDJ4hT95wNqDoCk6FB1JkNDK+iDSPULIWW/U3uB3e9jxaNBAMpBKH?=
 =?us-ascii?Q?ZsJEU52iA47MPiC9sW0dOKoxQh9MbyiUYCdKX/gC6m/cXFJ2vdX7m+cQ2aYk?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ea6bd2d-051a-499c-8f2e-08dc531995d6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:34:13.4155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fe0caozJprLeBYOHOQ7i1adaRWzs63JKL96CuP3YFeagC85rF2koO9B4ErcT7lwPpX/nKneKy8GI6oRh/HG8ITxhgEe5EVTI9vUILJimZOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
X-Proofpoint-ORIG-GUID: sRIrgaTo02-EIbnltJ4Fq4OkJrYa-Nk1
X-Proofpoint-GUID: sRIrgaTo02-EIbnltJ4Fq4OkJrYa-Nk1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-02_06,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404020099
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 13:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109780

From: William Lyu <William.Lyu@windriver.com>

The following ShellCheck violations in "run-ptest" are fixed:
-   line 4:
    SC2164: Use 'cd ... || exit' or 'cd ... || return' in case cd fails.
-   line 7:
    SC2086: Double quote to prevent globbing and word splitting.
-   line 9:
    SC2006: Use $(...) notation instead of legacy backticks `...`.
    SC2086: Double quote to prevent globbing and word splitting.
    SC2126: Consider using 'grep -c' instead of 'grep|wc -l'.
-   line 10:
    SC2006: Use $(...) notation instead of legacy backticks `...`.
    SC2086: Double quote to prevent globbing and word splitting.
    SC2126: Consider using 'grep -c' instead of 'grep|wc -l'.
-   line 17:
    SC2086: Double quote to prevent globbing and word splitting.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 .../recipes-filter/nftables/nftables/run-ptest         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables/run-ptest b/meta-networking/recipes-filter/nftables/nftables/run-ptest
index 3217c743d..363a1ee25 100644
--- a/meta-networking/recipes-filter/nftables/nftables/run-ptest
+++ b/meta-networking/recipes-filter/nftables/nftables/run-ptest
@@ -1,17 +1,17 @@
 #!/bin/sh
 
 NFTABLESLIB=@libdir@/nftables
-cd ${NFTABLESLIB}/ptest
+cd ${NFTABLESLIB}/ptest || exit 1
 
 LOG="${NFTABLESLIB}/ptest/nftables_ptest_$(date +%Y%m%d-%H%M%S).log"
-tests/shell/run-tests.sh -v | sed -E '/I: \[OK\]/ s/^/PASS: / ; /W: \[(CHK DUMP|VALGRIND|TAINTED|DUMP FAIL|FAILED)\]/ s/^/FAIL: /' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | tee -a ${LOG}
+tests/shell/run-tests.sh -v | sed -E '/I: \[OK\]/ s/^/PASS: / ; /W: \[(CHK DUMP|VALGRIND|TAINTED|DUMP FAIL|FAILED)\]/ s/^/FAIL: /' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | tee -a "${LOG}"
 
-passed=`grep PASS: ${LOG}|wc -l`
-failed=`grep FAIL: ${LOG}|wc -l`
+passed=$(grep -c PASS: "${LOG}")
+failed=$(grep -c FAIL: "${LOG}")
 all=$((passed + failed))
 
 (   echo "=== Test Summary ==="
     echo "TOTAL: ${all}"
     echo "PASSED: ${passed}"
     echo "FAILED: ${failed}"
-) | tee -a ${LOG}
+) | tee -a "${LOG}"
-- 
2.43.0


