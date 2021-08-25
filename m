Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15962.1629902038479530707
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Aug 2021 07:33:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=mGjTAhTm;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3871ddd116=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17PCHRct004683
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 14:33:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=QNKtRoK9XpR5Mo176q05P6vUgKlOZ2jv0SWNzYiY228=;
 b=mGjTAhTmXjjmZIwG+AfCMKo5DSKl84kDnL9qauV2IbuiZCgfhnbNMM/cio0P/ymIeFJh
 aH8/UYrSVuO38iUm97hriktBICboNLy0tzmJMYTJrNjIrYoNuD3kWMFR1iMOpuphwvHJ
 obt7vOISrdiQgJbfk57WWQw05gh6A03rikjUhTDR16VT8cVjW3jpfpLWNMJOSrjSiX2/
 AQ9Dx9aD900eqzWrI7INOLGPp7o8kkilACTMHClsytEQq+THxVrZKLgapvoZmC4gsnHL
 1kAhfFvG11QZuWyctI1QXALc+5qidu9oyADR9pJc7Z6ydRvUFdiqz8f5EX0kqPlFFPCc ig== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0064b401.pphosted.com with ESMTP id 3an7e4gmbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Aug 2021 14:33:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KCAvuXT20WgKAdeCEAWcCA/Td+UcRLzWymX9laZEtawUqT6Gkz/Cs10YOZ7JhoYyYEb2KxywomcQuCznbuH/9xJb8IGtG21N2hF0Wc1ktSPLwmtsAekLUk2Dedy45HHI2fmXgv9ekwEcJ9EOH4dKJXStm2U2/Od20qX9c9wVFUdkIWdNoooEQxodxH+Mcm5HbCUDELZST034MRcTSj5F2kShaO2i8n4yIRcMMnWV5yRvogh2mSCLi4L6R8Xf4S6O+irYDwvkPPjQZph5QlhvgMN0XlEDcNBu3htQRTE3H517Lgq37Mw/Lw/M5gAgdJGDc9U7C5tsRGMN+HDnhLEmyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNKtRoK9XpR5Mo176q05P6vUgKlOZ2jv0SWNzYiY228=;
 b=cJJ9VDMq7M8VT9hiTviEVKmizgcGbnXWx1ijR6AE6a3zCt4u8k169WQoAi5WAU6BmGGs+wH/qwR1R8aYBsd7+5YHIkiKMJq7e6jM3QgsCcHt+K3Tfl2zbw5MwbXt/Mg+7KjRgiB6t81G5vIpfdPcn3IT46LCGM0cz4b4LNIvt9GfI4KB6EfpFhxEmxGZDi+Vl73matblv6wbbm5wcf7UuwyFf/TDEUE+hrh+75D8anQfje+lP3PxrA5EGYpp2z3I4JfHiX+0oaXEjpWJ610IpCCImx2iY2ibuPLEIeaTXBOglJPsUJpeOkbprVdiOYv5A3ykb+owbZwFwGd5VTG5mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3765.namprd11.prod.outlook.com (2603:10b6:a03:f6::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Wed, 25 Aug
 2021 14:33:55 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5988:9cf6:c130:3530]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::5988:9cf6:c130:3530%6]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 14:33:55 +0000
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: timothy.t.orling@intel.com
Subject: [meta-python][PATCH 2/2] python3-gunicorn: tweak run-ptest, add RDEPENDS
Date: Wed, 25 Aug 2021 10:33:36 -0400
Message-Id: <20210825143336.491953-2-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825143336.491953-1-trevor.gamblin@windriver.com>
References: <20210825143336.491953-1-trevor.gamblin@windriver.com>
X-ClientProxiedBy: YT3PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::25) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from yow-tgamblin-lx3.corp.ad.wrs.com (2607:fea8:c29d:d7c0:fa88:8bc5:c0d2:27cc) by YT3PR01CA0077.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 14:33:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1dbc4fe-811e-4ca4-8b15-08d967d55db8
X-MS-TrafficTypeDiagnostic: BYAPR11MB3765:
X-LD-Processed: 8ddb2873-a1ad-4a18-ae4e-4644631433be,ExtAddr
X-Microsoft-Antispam-PRVS: 
 <BYAPR11MB3765D301B819C1D0C034085E9FC69@BYAPR11MB3765.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
 v0zd/tM/RBSHx+7O6tn/NznI1cA3ETDABWeSja3arwDxnT8NPDqlVnRIJ2D9jKEabjnMV+jsWIiHR4xKawVElnBw6SKZ3rUHKoCDPjtGJ7v1oZBHI8EC/Oi+wJhj13nxrY5YmZH1nsTAOzXdVt/5fwpJiN6cLXhe6LZijggwFWBDPWWvO8lXYAhy90zbc9Zz4nCUe6BBW3JPA80VHDGHgS8F0J71mAousjVIX+fKQpp1Fz0Um+4lPp5ueny9TXlxcLHyNZ3pjzdzIdnOH10fBM8UNe6GqMEoy7QfLMNd1B3UpxuyLfHE7WKyQjk5NrafEbYVxSHtSMfs+n8A3PbXBx8pBtZdSfE0M0jASl2rhjoF9aiJaFIkl6l5k00RI4xg7p9pIGmOgfamzjx6VnBCQ2+ypmtNzBz/V2aop7a0vsefOzfao6+aNkWRgJdgmVVTOzi/uYQVE3XysvNeM4Dwoqw2NW8DEcXJyHY6qu/L+YdiolZMS8XYX0qfdPybjI1+h3v3NM2/Pw9WMWrbtuTa/oVunlu6xbVKAdTe9sSOTmHl0BSGYVAsUQC2q6KliixApOGvzR91oBfflgm3DzfRoQs9NMShFwGlyCyGTq3uZDz0e8y0zx8+kvE0588ADLZpLxY+4SNhAfvpwYQE+JmD8Q==
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39850400004)(346002)(6506007)(1076003)(6486002)(6916009)(66476007)(86362001)(8676002)(66556008)(186003)(316002)(66946007)(52116002)(5660300002)(478600001)(4326008)(8936002)(2906002)(2616005)(36756003)(6512007)(44832011)(38100700002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?FmeN2ydJ0dD/SNkPJLGGG0o2NOAacPIR+Xy0W2pfSqKP24aHswO4YTw6997K?=
 =?us-ascii?Q?4ItOs370TR6IGioV5Y8CpWx+hwS/VTgn3e7GAS5WZHcq01EJGrUth9nePw8r?=
 =?us-ascii?Q?z3hDp2mBi3bZFQ2xCz9s39DUBZlYt08rPJ+V+Q5LPUqKThMgINRaYk5UYaf8?=
 =?us-ascii?Q?gE7R8YOA7qJQ2nj7zdgi8+Fe+4gfjPZtdQci5wvXdPyk44lZEAF6yn6g1sVx?=
 =?us-ascii?Q?4Reo4ruwvQ+sS+99pHUlNOMZRMwDoRlGM4SyDQ3u5c4mRm9E2d/T2v8d9flz?=
 =?us-ascii?Q?RRLJGafuXcCU8BnyCj5/wKhv2watms5rSeASE8rTFoLitevcT4Tp5GNiN/WZ?=
 =?us-ascii?Q?KxYs4FZ6rgdJSMePM8Kp1gIDGAcm9z1S67LtL4CvEX4zqZ7wRIiTbdSu7U9S?=
 =?us-ascii?Q?NRS00kilnSmbw5tSOt48qJSe9YIaB4hB3fFZiKnGXUcpwDqZy4fBVq05pkyv?=
 =?us-ascii?Q?Xxc5pmdO9WahaNqDU6+veAZAq/TM82nG4tmu4rAVXFY6/ecpavxRO8xTnJwI?=
 =?us-ascii?Q?1PxDQmINgU6sz8KBioRQVGIDM58KqTWk3ol5WMboluKVUaHnXxeoNbT45NLY?=
 =?us-ascii?Q?iKiCFuV844vjRSCtZLm5iITFnrelWumkjzgsxmYN4SgGBUzCQPZx4cPFVqlR?=
 =?us-ascii?Q?1vFwVXCBgAAgRs0iFtW4s6W4LovZqjaF+AQB5q5fIK+TZlMaPrBG1dcs5/xI?=
 =?us-ascii?Q?tiT8PWqFPyIHntEhODo54qDVwwwJ9shi/6y7FCkZ8v2w67BpQIRfsa75Q7oH?=
 =?us-ascii?Q?wQEYPjt43Kqnb9roCkuxLf2Ir+FcnhLyByxOHb0bk2BFFfLjFGXiKn4bZo9L?=
 =?us-ascii?Q?tqD9xWNQuAl/Qa2NtiCeVpry643vYaURwgyxhbj2XnPCRxhlc1F8ELi+WWck?=
 =?us-ascii?Q?aUuc9i9yiHeUrHMY2VddcB0mPwsGxN0W3sC1YXrQ25WkFyxiLJFE3oUu6rM5?=
 =?us-ascii?Q?xbEq8ihixHooM2DB+To2jWC270v4a095O8XdBA5WUIHFK2UpBxSG/PPHC1aU?=
 =?us-ascii?Q?LZnESb2lRanon7s3qKroW1V6RqHJaC97mWNDe0S8YeR/++RXPDzT3P5WaR9k?=
 =?us-ascii?Q?pcnW4Ix6nZowQm7hGKDw7Xxk0GDhxyRV8/a4srrETc3gF8YcRz32I4rtYm5f?=
 =?us-ascii?Q?5kCbfv3sfCyK+petvapHvMqG9MXjVo+BZWqTEhzgAbshiG7rnniB5u6hx2l3?=
 =?us-ascii?Q?RfOwoP8dXcLaBEMBkSnhXcdv7W8FhTwqQIdaNXcQ0UDeYGJkx0TygUjtjKRe?=
 =?us-ascii?Q?h5AftZhFRHJa6iGWowhiR1A6CV8XLPEwFFp+Ni6hiDMXkLzasZ9Qpxgi1FZM?=
 =?us-ascii?Q?7FfZ9ezFvKM6GmyhqC+BtfwnmiR2uiW+Facxs0BTD5zqiMAuig8/cX2sarsr?=
 =?us-ascii?Q?9fQDEiO1fjFIAKLf91s+oSioFp+q?=
X-MS-Exchange-Transport-Forked: True
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1dbc4fe-811e-4ca4-8b15-08d967d55db8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 14:33:55.0234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k67B8itMDNZ8HU4/jLH6a9aBVo1ryb18LuIcWA/5FwrOeMn3q5w40W5z1fPKiBp3oBzmt3u/sLZlqdrqmEYkFGPz+wJ6iNnypBU3yoDYAjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3765
X-Proofpoint-GUID: -diRTQR8fpZzpdp2Og7CnLBvklMboHte
X-Proofpoint-ORIG-GUID: -diRTQR8fpZzpdp2Og7CnLBvklMboHte
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-25_05,2021-08-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108250087
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

gunicorn relies on eventlet and gevent for its ptests, and it also
requires a non-empty /etc/resolv.conf for one of those tests. Add those
two modules to RDEPENDS for the recipe, and add an echo in run-ptest to
make sure that there is something basic in /etc/resolv.conf before the
test actually runs.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 .../recipes-devtools/python/python3-gunicorn/run-ptest        | 4 ++++
 .../recipes-devtools/python/python3-gunicorn_20.1.0.bb        | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest b/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
index b63c4de0d..98d73fa03 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-gunicorn/run-ptest
@@ -1,3 +1,7 @@
 #!/bin/sh
 
+# there needs to be something in /etc/resolv.conf for the gunicorn
+# ptests to work, so make sure there's at least one nameserver line
+echo "nameserver 8.8.8.8" >> /etc/resolv.conf
+
 pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb b/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
index 38353c473..f381b9df2 100644
--- a/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gunicorn_20.1.0.bb
@@ -12,6 +12,8 @@ SRC_URI += " \
 "
 
 RDEPENDS:${PN}-ptest += " \
+    ${PYTHON_PN}-eventlet \
+    ${PYTHON_PN}-gevent \
 	${PYTHON_PN}-pytest \
 "
 
-- 
2.31.1

