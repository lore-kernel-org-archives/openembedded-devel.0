Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878E8C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 00:59:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.83119.1722560350517145892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Aug 2024 17:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8944593547=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 471NgZMs007085
	for <openembedded-devel@lists.openembedded.org>; Fri, 2 Aug 2024 00:59:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40rjf2r41x-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 00:59:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWhnVMFnEcykJdj0AZn/D+tTFFLA8Cn7Mflrl7whsxHDl5a0D6y6vxwwI4AyHyCigNJXsfpajOHYf5bMQ4qqTZf2y7fBpdEQ++zXyfn1YmkL+kjbgQ8htAhtQUcW6cnJxPQE881/j7X5/8GdXSqx6xjBrz3TR4shGOdpMPqk/duIYwS9YIkBmuxDiCGw3SWDYIpoDP8yDiYz4DhHsFLJcUqRYLWgKqTDzPR0NVG4eUtEqo4OHGWr5SPE2ETF0SQghsty8ITBPpdIS+y/v3DIfzSLHwO10rwJuvfVwxwoGVBPrQ2CYohKUl10kWhtmhyvGJYQH2hUAYpUTN9qdyW1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iJHt+5AEp20ELpBylm1srjm9rx1H3FuC0Qcg7CYUbjE=;
 b=FH64JEm/dkGCDKhFcbWNBCAjuDR3AoEfw6R5A1GPdIjU8cMm5pDpCS1IQIMIX+io1WPhGOJpxaqXTW4v8YGzxhbZh07sI6mOsyePmca5Qk4Bgtuy+kGYFZIp/T19rj9g0F3bBWLv2+L/clUbGuLPzkWHy3HOf2LsgAZ2EAiGg0jpRAvagP+wtBUQGjjrRJ05wap6Qj9+n9M6uKRpjPHTl/h2Q6crW8xpNpedWcdYgi/Rtndy6gyI+O0ZGKVTEqkF56my843g9SIQlkM/qJaWbCDp3ip3UtgYHRb74ZdptVWem3m3oJ82Y1fp7oI4OkMJE/Jun5wiiYqjSQQZx44mjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7871.namprd11.prod.outlook.com (2603:10b6:208:3f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Fri, 2 Aug
 2024 00:59:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7807.026; Fri, 2 Aug 2024
 00:59:07 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] libdaq: upgrade 3.0.15 -> 3.0.16
Date: Fri,  2 Aug 2024 08:58:55 +0800
Message-Id: <20240802005856.1717959-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802005856.1717959-1-yi.zhao@windriver.com>
References: <20240802005856.1717959-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:404:56::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7871:EE_
X-MS-Office365-Filtering-Correlation-Id: 9412080e-b017-461b-4b9f-08dcb28e4fe1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8aQPCgCwjY1qjo30UDOyc87stHRewe+eeqID8eXazsI0NAO+CrkdR6Xp+K1s?=
 =?us-ascii?Q?aZ+g3Jr37KdwlarInTtk6vXiU45gQVJ6nN5apg6iLtPSlt1zCEU0E0+7o/bO?=
 =?us-ascii?Q?rOwsa9mUJ+aaWfDaWhW0j9vjD2d8uv6jRzgGj1yk1tgP2ivfhkfZmaDshnzj?=
 =?us-ascii?Q?1LhLaeO9Hd6mPvaxQSxg63TdHQd4wmdQkmXHIdIh/OJAvVo4+GbN929hVSrl?=
 =?us-ascii?Q?Dh3YIbqU8Ughq5ySPzQVWTblkOrOTHkUEt0PFgJi3LkH1xZDn6mYkCxPNY2R?=
 =?us-ascii?Q?EF6dnNKJAz9+8GUPHQNaeYIbzqw6f9+MNYL29O0cuGYJAHxD0vTkiQsRw9Wi?=
 =?us-ascii?Q?jvFh29QjKuDH2udbXQZzQUnS0uYDj/xAbqSg78yx1+p9+jCknopjzb+gkuzv?=
 =?us-ascii?Q?MSuOAjAhf6jQsvTr2XyezkXBA7hwyVVOr2QQE/K78VYjQCaBgFwJvtwMmiw1?=
 =?us-ascii?Q?00RdkqDKFk8Akb4vMWS6Fh3YRHmfRnuHf/6Ma4TXQiK/WBhOPpgPZy0+Wrd9?=
 =?us-ascii?Q?UF+/fnA2fosbJir6AHfV4BvcEg/8Pgo0AlC6U6cDkTS1UzOF21lzd9uf//z+?=
 =?us-ascii?Q?AFQq2AWgvXPURiJ8VyA//EqHIbzXQBv3GZTX5QAIr12US9988w0ErVdFHP2p?=
 =?us-ascii?Q?3hQmoooas3XtrJl2c9gz2/D3recTkQpA27TRvKQe3Zbarf2prhRUKgdkSzFe?=
 =?us-ascii?Q?Evv/g1QVE7JdpKrj6ZFtdTSdMJ6Sem0tCPXF+kxbYazHWIk376Kt8ETUb9Tc?=
 =?us-ascii?Q?B3PiGVjFUFGKEcqoteBVcKnKh8oivLmj6+pilKxe4dajPKVJT4eGepO0cthz?=
 =?us-ascii?Q?e3ELkibMYRALcq8vwo9Mx6I5+rhV533hbg+5WjTfB4nPlXLTGoZbc/n7xlXR?=
 =?us-ascii?Q?FSu7WXmqTeQ2dx0lpJK3ZhaoA4Ul/uLK7SuxndLbjLxtbpkDInCIyX9x1Uz7?=
 =?us-ascii?Q?NtwxQeRxbp/ZA7wwqwPb21xluU2minPVCjCc0sRBu1hm7QI30TlcTT1kDIlK?=
 =?us-ascii?Q?Qs3dky+WkPkHIUL5pdon2F1CvzwA6tbjUpAdtjiYn2XJWGK03rmD58i107oX?=
 =?us-ascii?Q?yzr5dq04OxKXrHnDZ1hdq6Qi3xdK89igI7+HvoogGwVCSlLwDQRRjbLQf4dK?=
 =?us-ascii?Q?Am2Tyzn1UV3B0C3Vqgwgn4cuGpYP3LVt6dPl0YHrQjuMoVUB1xSLBu5xBh0V?=
 =?us-ascii?Q?cqZC7Y6fJ+GeoWHixWNBGwRsLeVxAVfbGhAnQfyeYtEC8bqO6tui6dyRLkz9?=
 =?us-ascii?Q?Nc2xZ9ioWRvxM15EvdFfxAqQlWlFAu5J7YAOVGKXtfoPyMwcuSeXzwDg1mLQ?=
 =?us-ascii?Q?SjuPLsYjGBkg8+ojHF05WqjpOZN6KFUZpFtjHUzeupP+EjbRupaN9vhiqKAj?=
 =?us-ascii?Q?NGBHkq8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/7LJ+rgRIT9RJOi3hDlLKBbVZz8tEFUO8K5XM74xxEiDO/VdMcJJ8vErw0fV?=
 =?us-ascii?Q?KxsMWMy8JFtlyL2RVWgd0IOThT90dG102BLhdjbIYzrsaD9qJOf54ihPAu1Q?=
 =?us-ascii?Q?5lSHW/urjqkbERjoAjN5UVyI+qUJgOo3gCdp/ghkkq8c/Tu7mnFTHAsBmOCC?=
 =?us-ascii?Q?a9CoFJIihtmxFFh8R4c/MZU9AGRlOtCyZWuZJTF5bjiTh9SkLJ0Ph2PXD0CX?=
 =?us-ascii?Q?eK3Lakqu6ZotN/AXvBiCODcMlMTeCU2we7cKPdeMDFW9mDxVD+FlJ+2EwiZ+?=
 =?us-ascii?Q?Y2hpVSPW+2EhEgHuLqGvvQKn6X8i6KisgtPLfEbiy1GWCcRvAmevi85UJsiY?=
 =?us-ascii?Q?J1FbcH3/qdSpAIC6ENo3hGYQWcgBoU5+FMVTqGcKGrNZP4rOUJyBAbWBc8a3?=
 =?us-ascii?Q?0zsUSCHf0JqKqKoES7f2mTm1aMDjDpPyLCmAuY7nt9QrIAHnww9X+G0sccKn?=
 =?us-ascii?Q?I1giQEntvhZqg9GPrjPdeyaORPwMRur4DxW0vbG/cf8WxQyUmpoaZjWs3fyp?=
 =?us-ascii?Q?4gBOZuoeotkaVqgQDwfJOfc42it5bb0Y587myl7HjDTj01h7q7n8A1HN5QgW?=
 =?us-ascii?Q?PU9mHEJhr0BYvTgrbehzT3KAWfDDCYvwLWGUXD+w+sGE5ZPkGpp+EhveFpxX?=
 =?us-ascii?Q?92VGhMFrDZahlzir4/AD0ooxd67a8LwUBt4QyudUirinBtMxcsqEOQktn/Db?=
 =?us-ascii?Q?bl/zlWaHWO13t/tK+0OqWqN7IGHo3I/n+RqQtsf8Xaanfrw1DMuhwtJFEoEm?=
 =?us-ascii?Q?7ZPTICLmFiFsQHZsdBJN4mGu5HIXpbvNshqqH0ZtnmmfDYJv4LTRaRpLep01?=
 =?us-ascii?Q?EvP8IJuUYZ6jjaRuHrlJVLsbYiF78766+CsziTTM5j/U0Q62HXG1mptqQCo7?=
 =?us-ascii?Q?n5OqIfbW6dhEnPeZrN0qFqJWmVELCv6y2ojOYIOg7s2JyAY5Yca64tbHUXyi?=
 =?us-ascii?Q?grrFug2weH4CgEjvxa2W02Vs7Nx+x7gUFCH8yF8/kNUBpMzeMVH0uCbYdqNs?=
 =?us-ascii?Q?2krLDRNia57/zOcjzUJZ0+RFeE7M0+vEXTZJ47wBAmkBPgqHeO+r+9FLVhg2?=
 =?us-ascii?Q?hZOs0KNBgpqzxDqHU4MNIoleurQMDSIxm/LIk6mDv7noxvBSWNefGl+hzKIK?=
 =?us-ascii?Q?+FzotaksO3HFAchoCeuhTFchEi9dTe8TU4o5na5HaghtcSFt/HtsqncWSIeE?=
 =?us-ascii?Q?7VK0YUj9kDhk2+IDJEvoeH8JtzkJZNzeOFDu8f4nZ2Edc56byByQ0SztgGn4?=
 =?us-ascii?Q?KA76qB4i83KIxiGTz0MMR3sj3Rm4QoZ1We793nAXhKSSdTuvYNaUhMoLm/rV?=
 =?us-ascii?Q?7GejG2IkIAQp6S/Xvspepbg2Cts7WMtKOLLF9yMCFQSLAnIg4of9HRD5uIsv?=
 =?us-ascii?Q?Gwj+nQ37ssTnd0Bpq7jnSS+aiYbdtamOZg56IjCGUXF51Jh5IV/dd4XWbKX9?=
 =?us-ascii?Q?xb8xHf1k33jsyB9oLCMeiOCK2pY5Nwt3m/Xz9sMoO3pNZXA2csio2tlTtA8y?=
 =?us-ascii?Q?oWyYz0SJi+kK6QcZX22C4nQStZatb4pExWG3U839w7pUWbHd5OlA3/m3ltUe?=
 =?us-ascii?Q?qnDVb3BdbfIsRXwNdUTwqIQN7NJmXVDFdwmdJFIv?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9412080e-b017-461b-4b9f-08dcb28e4fe1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 00:59:07.7567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kItb/wlqtk7LSLIBL+w7UJ9I5YuxHzAMZWVu9SloFyQ/7RUJWFFZaIjXXi1uK0XchzmTVv3KRGPWEnjxk3HTlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7871
X-Proofpoint-ORIG-GUID: -UL-3kA_orl8N1c4dZZlT6qrYxCVqN-Q
X-Proofpoint-GUID: -UL-3kA_orl8N1c4dZZlT6qrYxCVqN-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-01_23,2024-08-01_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2408020005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Aug 2024 00:59:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111495

ChangeLog:
https://github.com/snort3/libdaq/releases/tag/v3.0.16

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../daq/{libdaq_3.0.15.bb => libdaq_3.0.16.bb}                 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.15.bb => libdaq_3.0.16.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.15.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.16.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.15.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.16.bb
index 9fe1b3823..7834d7555 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.15.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.16.bb
@@ -11,7 +11,8 @@ inherit autotools pkgconfig
 
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
            file://0001-example-Use-lm-for-the-fst-module.patch"
-SRCREV = "1b20345a3a714d2d0ffb71578ff75bcb207ae92d"
+
+SRCREV = "2ffe084d4d4ccf4ebc5c23ef119aa1ae223ce2ae"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


