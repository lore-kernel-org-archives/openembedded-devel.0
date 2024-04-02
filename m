Return-Path: <william.lyu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00D2CD1284
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 13:34:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12451.1712064858132184424
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 06:34:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZWYas/4X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4822a20b16=william.lyu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4326EObv008128
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Apr 2024 06:34:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=GVpNAUvsgmByIdseDm
	ENC8vUW1jVjaENQjlZU72nbBM=; b=ZWYas/4XZBxKZfapv1ZUrRGfZk7cU1Sscx
	Grmd0kf5loS5Go2EX+1Itd34p5tFd0DA76qrnnOmMgx7XkCj6dYcZUlOk6Jh8X8R
	WRSAk8isLzXCHozXcKA2TrSr3mlcvSt4Tfa39jN98+9svmCctxxIfz4YDWwVOvAd
	a/tZsGp4YC6G+3o5RrXdESZPHdiZtsfqCFfLxUdyUQFEP/F4m6lCdwAD+zUNxZMM
	CdvERQOP+IsZBF629pdnUwLW5lvT2QSEDO9cEvIjaBpFF111lu7yYEdvTNG0tEHG
	II2C0Fb5i6ZquT7wDB82MEUCyn1lSy6LdeB4S77+nhtb4gZZcD0Q==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3x6e10k2mc-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 06:34:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkMtq5Apk5DqE/nYDgGTcCaFmhoPEwS4QcBS5TpnOD5KVw104StBLmh83YchkpRi+cYTGDii+rw+qmYzt0BO/vJjKwn2MsUTi1fSFHbvXLIjprFoOdzFMggz4jdlcB7+nf8h3709XPwmueSHJGEu95pZ21CPLO99qcz72j//RdU3Pg619aPonUQqJ+UNjabQb5vKvRqzCPk3Bh18jnuexreiafrnYC5Hbwf6xXIT1Fb6Utjv324gm3boIvc9Uzptp6oniNhz4gzhBxydyuIuKdHj/NdorY5M+muzbnrMRxS+qSU0utyOK5otJdIkZ/A1Q0/ZfpLHgpujiS2GNiUsJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVpNAUvsgmByIdseDmENC8vUW1jVjaENQjlZU72nbBM=;
 b=m7RNWJhR7JLi577WG5JR1mmIiv2l6qHS6bI6nVujwitsXkoDkUIUwJ/txRffcLURkjnO+9z+4oseS9/MCx/QhXfI+yGyJVT0qjyS/Zr8YppNVYbLsoRcIXfbAE2u7jtJDTGzamLJoFFMBlb5ktMRieiETV8ixdcBdKKLkz/j96AJC8xjVbLyEI2Mu31n+PekLFURG1XHVSU9reH7h6W8xCzllxxDLEfPXE4r/xgB0lp5XEtjLatX+SsYf9Pk/u5AxprsToiz0yS3K4M8wP1Ej4NSNNql9b0CBv5/xJ0+zmLiQGjEP7gV4B3rEFu+rFIO2AH0wtHYjB+BFYmYLntWVA==
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
Subject: [meta-networking][PATCH 1/3] nftables: Fix ptest output format issues
Date: Tue,  2 Apr 2024 06:33:58 -0700
Message-ID: <20240402133400.3347547-1-William.Lyu@windriver.com>
X-Mailer: git-send-email 2.43.0
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
	un05t+9dAYMtX8Lya3WO6HQaHJ3ZvrpcwEvZTRxdpreLL9Lajhyo295ZuHSXc69DxF0bg8qQZkvD6vQWxGBPghvX0+zR5Bi3LQ8MTze+MNvqzXx7KIBBBSgbx6MzogD+Mp8yH7u0IzXEscZ13ObNdwMrYDp8HJb9+LeBlkw0EN/ouwV/hfpU1pTLsxZNuZxgQOyipFK8PsCtktM4FoqsYxhNS/Cq/PtYemmF3ncM9TsJkze90qTHwI42bD1ShP61ZRs7GsEQoK0swaLa+aAdjovytxdlE/TeOygg5YojE3A3YMby4jBfrlgJtfu8RJetiRtvY/3R/juZe9PS8KPbP64YoxuFNyJdPVgIvQ58WfJwLeWpRVW7PdDBn0jZMy9PrpT8fp1gSqapYiBrmMC2hBF1aPMjZBRA5NUPSMjB2gh4dbGCuAq+Jx9/wz+OxSevp9SJUqTaJtiPS4pVvdDA86Mag/D1zo0YN/qkjOBzQEcvsCWoa0CdLVH06FtsqLzzpVt4vN4v0GjKTAQ5Qx6GTsh1jgoSsikjsxP8PuC7TctpdCB9j7Fj/SqT/zf96oG3sXMctNFfVX77FY40VrJWOk/9oHUMtJHB0wjAeMKPZ95J9wk8F2MfI2SH9/1+5LpKoSWXhO+b3ti5gALvYxpfkbmfLJAlp7LDIzN50TVwSC71PfXedPPlBmrNhoKPZzsY8vKjbMGqe3LyGwlxMi8jsw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8767.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(52116005)(376005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qga6z75TwOvJLCsZFCjr9ug48G5b/b/IbRzTSANu4Kg2GgEsc89l1jUJfpdj?=
 =?us-ascii?Q?dkRkW7uiaZYKPD9lkjGKwG9AlgwSeU55ukFkZOOZHFcb6fcGSu07TvzGN/CY?=
 =?us-ascii?Q?DHDL/m/hLoUVSCz+5qMHqHyvsEBZjrLDl6LyghQhr/TQpLm7M8HZqWOWq9J2?=
 =?us-ascii?Q?e+QCu7+uiEm34ksJNazhA6i+MQa6KWjDFOR7qKL6wOhgI3vHVQWB2nQ9Fm0c?=
 =?us-ascii?Q?AZkubqII4PHT+xpbT0eX9cdQDBYJH6p0rG7PatU4Mk7rtvsPRpyjUqPAtmYr?=
 =?us-ascii?Q?64ZOhZ4e+BlE7VH8Zuzxqb0V3o9iwzbykaInXmWk7o1xufxGg7xKwah9ovdN?=
 =?us-ascii?Q?VlfGuS0LlffHIwtbhN0UOmxtcrPt0raF0rmb9rrfBwTZsjdZsxLeH4vDWrnR?=
 =?us-ascii?Q?mx2W9rU0hUXXYmo5nsrR+EUXUfHeZcA3DCGopP+TUA/y1cttVMIPUHtU8d+B?=
 =?us-ascii?Q?5XeqlsHxNoYnGkVm8rynWZdIm/+UU35GmhXgZwTAZ/+i5Gd4ZAquKn/f5WYb?=
 =?us-ascii?Q?I3MAH2ynLrhvhksjLe/uMQiM/1ssrKbsV2/9+lAQRXv03Jnhq8DxuvKrgxZe?=
 =?us-ascii?Q?PlpayXf2d61IPoylZX3aBRJm10un66WoFOmTecwEx4/FLKKjS/PyDpPfXAx3?=
 =?us-ascii?Q?IwFVuIdNvO1DvQ8ZCPGgC2J3M41UYBPd2fQ1Bs660AvbWgupoCzL/IG8wORd?=
 =?us-ascii?Q?gCHoo7mELRu036JSCsCpCCuQGGoUyjWcgaVilg9caMM3369RyInu+npDZw0n?=
 =?us-ascii?Q?HVSseyWZEL48nJQkEvqLmqrKP05xWZ113I69RMuqsHpR4sLShf1OIH8foMOO?=
 =?us-ascii?Q?3ywnNEAAR85nOj3iv+A+9abLWLq/XgAGW809iBmDKcXYhwu7OX0jVu1VVS7j?=
 =?us-ascii?Q?vD9szTikVULVUPY+xYIYVuAZ/UN3xCIyp4fxCbBU5lktUtXGTEaid/1YDF4V?=
 =?us-ascii?Q?2H4cYy4aqCaRQpwGmXsfESafQHt5l7BmyMJtSNYTgQJglxzWge7XVJ5ThwbE?=
 =?us-ascii?Q?kXem1X3a8w6OB/d2Vs/fWknPe7nmrbKy8bIMFaCLSFRzDxkct73gGua07IaA?=
 =?us-ascii?Q?PWIpa9rmku4gtSJyQ+7xbAiV7LKnBVXVCmJqDVbPiu/e/6VYUk/guCWouDHG?=
 =?us-ascii?Q?8lS7yaDAoVfGOfibFMKvckc8NIrZPWbCd7LDgz8zqvg2aBlpLia1eoIZWjRp?=
 =?us-ascii?Q?PL+ruw9cv+671XTcycElNgt0nwIAuB5f7Fg5AnIkCO2oFEZqUyrlzI2ZW0Vj?=
 =?us-ascii?Q?xIN5L9Hmw8CP1V2S7XRbXieb8w7C7gd9R9gVaBXWNRKY8Ku1MhMay8CuDvLU?=
 =?us-ascii?Q?2JCBhqtV7UQKOaJvia1KFG4zD9AO7QpwasDM2dIcjxSpEYlTUhvY3UQtiGZF?=
 =?us-ascii?Q?74Xn2oCAYdetk0YUDYmGySlA/R6LZCnqsE1/Z+oQ6BWyOteGcfnANdtvmS2E?=
 =?us-ascii?Q?Vxqv3Jco67gf/XKlevWs+CSAAJ6PgLZ12ZABJqbcXrDM6hS2MmBs/1qtjNRR?=
 =?us-ascii?Q?QaM9T9vmbF6CGyKN7TpMxjo5ZyKjidiI/Af6n02G6npD+09wj2jZouQppQ9Z?=
 =?us-ascii?Q?oXQqG18Aug0MXebeJSfR3wSf57cwq2FmqoOPyD/6uc0NKjghccPwoRiwDohC?=
 =?us-ascii?Q?hQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b3a529-3c57-4c6d-2652-08dc5319958e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8767.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 13:34:12.9590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XVIfv1ojfMbwRM1ytrtWovMTLAA/1wdvs084KVsnp6rY44WVU+k7Kck0ZNkwFsOSgrzir9g9cfm+LXd3m1fi4mducIoflQlWBfk7ZmBPYd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5090
X-Proofpoint-ORIG-GUID: wPYyc0X0BbOBldztTinf8l5CvzhoUIHI
X-Proofpoint-GUID: wPYyc0X0BbOBldztTinf8l5CvzhoUIHI
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109781

From: William Lyu <William.Lyu@windriver.com>

Fix the following ptest output format issues:

-   For "sed" command, change "-e" option to "-E" option. I believe the
    previous "-e" option is a typo based on the manual page of "sed":

        -e script, --expression=script
            add the script to the commands to be executed

    "-E" option, on the other hand, makes "sed" "use extended regular
    expressions in the script" according to the manual page.

-   The test result summary line is being treated as both a passed
    testcase and a failed testcase due to this line containing substring
    "[OK]" and "[FAILED]". The following is a sample test result summary
    line:

        I: results: [OK] 379 [SKIPPED] 1 [FAILED] 0 [TOTAL] 380

    The fix is to change run-ptest to look for "I: [OK]" and
    "W: [FAILED]" when determining which lines correspond to
    passed/failed testcases.

-   Previously, only "W: [FAILED]" out of the following testcase failure
    prompts is parsed:

        W: [CHK DUMP]
        W: [VALGRIND]
        W: [TAINTED]
        W: [DUMP FAIL]
        W: [FAILED]

    Adding parsing for all testcase failure prompts.

Signed-off-by: William Lyu <William.Lyu@windriver.com>
---
 meta-networking/recipes-filter/nftables/nftables/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables/run-ptest b/meta-networking/recipes-filter/nftables/nftables/run-ptest
index 27d780ace..3217c743d 100644
--- a/meta-networking/recipes-filter/nftables/nftables/run-ptest
+++ b/meta-networking/recipes-filter/nftables/nftables/run-ptest
@@ -4,7 +4,7 @@ NFTABLESLIB=@libdir@/nftables
 cd ${NFTABLESLIB}/ptest
 
 LOG="${NFTABLESLIB}/ptest/nftables_ptest_$(date +%Y%m%d-%H%M%S).log"
-tests/shell/run-tests.sh -v | sed  -e '/OK/ s/^/PASS: / ; /FAILED/ s/^/FAIL: /' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | tee -a ${LOG}
+tests/shell/run-tests.sh -v | sed -E '/I: \[OK\]/ s/^/PASS: / ; /W: \[(CHK DUMP|VALGRIND|TAINTED|DUMP FAIL|FAILED)\]/ s/^/FAIL: /' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | tee -a ${LOG}
 
 passed=`grep PASS: ${LOG}|wc -l`
 failed=`grep FAIL: ${LOG}|wc -l`
-- 
2.43.0


