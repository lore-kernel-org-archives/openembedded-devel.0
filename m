Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D56E2CCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 13:44:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13532.1762955094701425984
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 05:44:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YbsQxwWz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3411d85ce0=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC3a6ED2219128
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=kVD1yZI0qepRT0yCxmmC4gv6IUgfOEQmDEa8qbV+oMw=; b=YbsQxwWzMmA0
	IJDYuyBiHhmeCckORChGNaIt9stzn0kq/wOefTlDZpmb0hJdZ+IY8swL3IsT7SE4
	CBH5WEat7GD83N1fEYEvlVNTM1yKb/0i2IPJL7GtnOK6+26ByPtCHUqR9HxdOlGW
	yhc2U32mgQBLoVLKqOz9DM5Xq+1/NJwvVensYkVTM+frj0xbM9ZoOC9wxtGE2jVo
	3j6onOs46/d2hJFJuF+I01XD4sS16FzBILHjx9Z5QtTFybbEna4IU61IY2i5q4JB
	KlhkjWj1IaFeHmc23/LpMlWgPA4N3Y/kHpIrPYU787htARai9om/8gFnQQQLEUwB
	0YeFsubFFg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011041.outbound.protection.outlook.com [40.107.208.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9vu958yk-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJ/nJhkfSBH30oq95st0wCq379c3uosPfnudOg2POdyJr+2F0ECHnvAQ4zdiUYMXJ9YVdjAJjVy4Qo29Vn+nzjBdNlsTmPibwSSJkVCcNht5+AZPPaHXAdbdnLQ4Im2pxtC+5/ht5GsKOxDmlng12OdMR0GzGxyAG48V1bZOMfc3wqkUJM+9LA0YHxVUQA+K0L5wHZgpH1UgsSLK4wzgqbwsl9+sV39pDub1z3f100Ddysn6nPXWUDvYhzijI6MyDNrHgooEpE5mdN2NfShVaEqV4XNPDNFXDGZTTsCXuyQ5/0488DgHYYrmu79Dpp6FMZRhkJ+I9vEkOZKLcB4WRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVD1yZI0qepRT0yCxmmC4gv6IUgfOEQmDEa8qbV+oMw=;
 b=zQCqEkijXhzbIlnYtAG5joHwNXI+speeZhxsVsahyaXSkVERqgVBxfpi8aK15H/qfcQTeDWfP2RF7Gz1Y3sIVPVMjZxAlPy6Wl/lfXSI0Z8/mU0jwibEGYSJP1sYx6hrcGmkxoH9xTJ5uFbFroxK9R0PQu2fpGY4HE3mlgIIDZif6/8YR3vw9XwUoM6dsSGe+mh/kXgBeV8GqmOJi8L4gD0OH9eAkWJ+nGmyZlPAY8sMvZcpRiC2aY+QToWDUD9F3vEBcdYZWbO8OZIU8FZhwrOjvZhD/ldr5fMUlVn+v5p6NMZ0N751lHxERr+tgRi80JY4YBPCcOmLArch/a1RHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CY8PR11MB7241.namprd11.prod.outlook.com (2603:10b6:930:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.16; Wed, 12 Nov 2025 13:44:51 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:44:51 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 19/19] xmlsec1: add UPSTREAM_CHECK_URI
Date: Wed, 12 Nov 2025 21:44:05 +0800
Message-Id: <20251112134405.3706508-19-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251112134405.3706508-1-yi.zhao@windriver.com>
References: <20251112134405.3706508-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0125.apcprd03.prod.outlook.com
 (2603:1096:4:91::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CY8PR11MB7241:EE_
X-MS-Office365-Filtering-Correlation-Id: fb4977e8-3fb7-40ad-8269-08de21f1a6e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i/tO5UvduYm6WGDQKavWNCVkHqRzfJrDN5j0Jfsn5Lllg3Ud8IWXiASB7/ls?=
 =?us-ascii?Q?Oo0R6abRMu7m6ro12lTLXcOMNQBUA8XoTErlh6hHtV6gBN/r3AtM9qyOU/gl?=
 =?us-ascii?Q?HMcaOUkQj9jUe7vCOZ4PjObTvH5eaqz360FPRR5K2HPdz5P79Bvc1crGFhiA?=
 =?us-ascii?Q?6ghNkpGn4R8/zb6XUCkEU8hsInd+ahXwT67ZgP6G3RhSmuPHj18QnWSordCO?=
 =?us-ascii?Q?TW4JaPpOYeuqxTMKEs814TXi0PXbYmjIQvKIMm1x4CeN9aK4VHUy1qj+VdPO?=
 =?us-ascii?Q?cPg3dpv1FdoUsSMBhKgdZVTyyw8pR039YN5tp76H6LUn8SH/KUchYhJ/f7yr?=
 =?us-ascii?Q?58zr7IT+n91896gC5bc5UmHwM9xW+5zKIC2nOWRbHIRCa25bqDhlmaTgEDz2?=
 =?us-ascii?Q?p3OXq7RNCQFS0Sb7mOIzFzfVfeO2LYU8+RlipNHvMh8S/wA6UFR3o3/R1hgf?=
 =?us-ascii?Q?cISLSpbYPYev7h4aX9poQyQ1ztNE4GhquDZP5tFuOn2FHMfRA51onQTF6bn3?=
 =?us-ascii?Q?WVB+vrwu7E0fbSZlnOY86DNqhIYGXElk4YWfhLLxNiexhbhWXg2oslFrY2VJ?=
 =?us-ascii?Q?/M14b3e874ocluA/5jwWxp6KRgyyrwRuwkB4KGdW+mzsgYQVwR8UzO6fqOo9?=
 =?us-ascii?Q?/xLwIx68wlEXchdXNeH2n5zPNTVYiW5fYUuNx5NxGrXgSw1lfeudFQeo353y?=
 =?us-ascii?Q?XsMWZOPPCDTKIjWU+OuyIvAgZ2ezaRLS2Ay1H4+taPAbZZw3CVd5ebnKOO09?=
 =?us-ascii?Q?iq3iIFiSgFZ68knUDrxYQbDZ5EVVGQ1jwZvCerJs5O+iuhUNnM0LRJ92R3o5?=
 =?us-ascii?Q?O+0C/bEoJU6HomkPW1iRNv8tUPzLCjcZSxPso3XZUni5Vtuy93zjt7cVEL46?=
 =?us-ascii?Q?ZuXgpihNgE6nl+/Lkcln1sXCI+X7HVxYPTUH8oxfQRm1j7SxgxLIl+K1T5hU?=
 =?us-ascii?Q?LnzkisdXQ8e2dxtyy4uIa/JUzOaRZEPGm5h/FFk07KtHr1C51v2EY5lStSYr?=
 =?us-ascii?Q?lHmS0MpvwBptmVEkc2M4Km7fMfGjUn7a8r7coCRbGQV52HNWnWjfhfky4LkM?=
 =?us-ascii?Q?LpLBZQy7etXsaE0ZjRp54DeuabNWiErOsT72/gPIJtf2KPKq+Oy9XjhdUccj?=
 =?us-ascii?Q?TxVXH1CY0wY3FU4o0VfvTB3npcBQlBZpK56p1CfFZBGs2dTD4gdF8L58EuIT?=
 =?us-ascii?Q?mqlBuhthYWm6Ol7Itc1WYj36eosOhoAeFMVr4qvKcOOd7tMj/hU6k/iQmFku?=
 =?us-ascii?Q?laah1u06C60E5m7mMVu7Ty0auIxKU/iSg4V9COTtL5wvMttgilYXdvNbUYtL?=
 =?us-ascii?Q?8cukebTavbxomO4Qcy2sVfAlRsu2hSCP3zgeb1HC/w50tnwBoX1W/ueo/qsx?=
 =?us-ascii?Q?a6Uj6x04Bd5LVvOzyyNOWhCKYq2HxwAz7MSK5y+DPTbwiurzA1pF+BwTZkRS?=
 =?us-ascii?Q?AFJCbWT5VyLi5EfXlGSP3GdlZHmENmKghZXF9+bDt0IhOevURRIBnw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?07K6kV6Eb06k0tf3Pnn3EzVz05Y84uEomIwuqt7P5Wr9HHbZjj5Z2zhAAfxr?=
 =?us-ascii?Q?G/eni/al7gMwrrSvkNKZuG3qlFHS0+fpWLqjDWLIjv0MF+n1Dta5kDxsVa1I?=
 =?us-ascii?Q?TwzwrWgVmSd+DD9kwNcOYTcOQOYyMbrgJWZb5k36VARWqV1VNwl1v0C91Z6H?=
 =?us-ascii?Q?UFSg6rEcFxQh6g2aaxWIJuHGeDPhj0eJlFTPcOQvu4V760MN1UmRt9an8/sP?=
 =?us-ascii?Q?93pjnnQuRhqtdhQyhd/MlWKcJbHipeD9NTLk+nQybxrSLNOFPMquZ58oaJ6K?=
 =?us-ascii?Q?wzgDFSjVtKOwJT4xG6QEnn4Qx4VYM/5dCLH6iBYFjFS4M/8hdWKEXZI/KmCO?=
 =?us-ascii?Q?3uqdLkaTP0j/QonpQPGGBp1BshpA0S5gyHMboGPlzEiwwg7JBfLbdKiabZEt?=
 =?us-ascii?Q?JEPVsapZI2TJnjXv4JfVXXRG7qQwI1ECH4crSMhPbdVWAGGRAfVi77+r+bi9?=
 =?us-ascii?Q?0rY00MgJGHWmhJSM2lOp8xN3i6VI0lKs8KMab1vR8ud73SzA5vqLN/Q7l5Yi?=
 =?us-ascii?Q?p1OenHLdbFmvujOm53hL3fsIk3u8xOi68c4ud02nje6ihDDbLigJuKLB/W8N?=
 =?us-ascii?Q?WcZ6J17KMuLdAexzU6vXPpyAz+i2FvlcSdMzl1hTSFvlltotEVN+SQgWpXdZ?=
 =?us-ascii?Q?pY+vGKPLP+OXt/NMzzi301sepbvDaEXF2P+EaBu7lzNIiaXCs7F6LjKEklPU?=
 =?us-ascii?Q?JWUJoBXQfZdwG1RJ0xjQYXovc8x7QRWNrgL6jMOnL9rNAuR22PLopaB5AQ2n?=
 =?us-ascii?Q?x/KO8kclY1M6Hduo3CQzsttXX4ug6gHBBJ3RzFge8wwFlDnZnp+jIC8GMFXS?=
 =?us-ascii?Q?WGEy0ByQRehd9FSvR70fcNjeSWL7tG+CyYoVEKvhoSLrrwSBPUtTlcCJ7U3h?=
 =?us-ascii?Q?5VQaqdF9blm7GkuZZiVV7t2iLhlvpyQTr08ihzRtoUND2oUEHeu7x6lzpkK1?=
 =?us-ascii?Q?u893D5hnfYRD4Pkc5Halvl+G4rFpMGFyOxqKKR/olLMM6VGMzqPTpDyY/LZD?=
 =?us-ascii?Q?aaIOGPzLwbvRQXEbJ3qRZTYyB4I0SpntSEswQvZ8oSDA5PvnnDWd2J/BqEo1?=
 =?us-ascii?Q?OJu/9AH2nwdcIJQNKy+Prm7fe6IrvYzdEh1FXMOxfnvXVu6mP5uSe5EMhSM5?=
 =?us-ascii?Q?Kb4iCfEtTc9cNBEabgxgzMMhyq5NesWnDNAuilqRALtfInmk6JUKnlMrdTgZ?=
 =?us-ascii?Q?vnDUZk0NZc8FdkC1dFdVfSLjF7oVWSrA8ukerNiSAykP6UX9MaG7PD536ckR?=
 =?us-ascii?Q?UA60Pe/PTtB7WnEHnW66wqk6eZBbASJXdeTf8bkMYaxs4ANepmilMBnYcbqm?=
 =?us-ascii?Q?2kaJlT3zvl9HZIbcxCJvhSN1NbS5JDdw1AV0o34pJCkwyXZn8JcmSNztehDt?=
 =?us-ascii?Q?vhwjTpgswqzcRtuVdrNePH/jXApgauDrsvtlsQdbVC+2AIr8bOTR4BKYp8xY?=
 =?us-ascii?Q?e3TUZ0hNUONqBhwJc0Ykto1/tkZOyqo0kFXmY6s++mXxfNI/SbUK6bJP5jQ5?=
 =?us-ascii?Q?QT3CXYNxlzGi44WF1QvTKW0wpMhlmM/DUkY7A3FYwDoAdr1w1nmSQxATzEJg?=
 =?us-ascii?Q?MIauzvm8Ic6SUJnPJUAChs0zkmPZbCTcnJvlKPMP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb4977e8-3fb7-40ad-8269-08de21f1a6e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:44:50.6973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zihQlMYs1qoD1kbmKXl1fRPud4s/Mw9p8zT0RSRNCUp/T+/tbPG/4051r/3hKQGCgcimXyvadSv/taOBIG0MTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7241
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDExMSBTYWx0ZWRfX5o43RCkUDCYh
 a0/dGKv4m7cLNRkWWp79BwqXt0GRn886hIWJ/FcglI9X4lxQdtYBdf1ZlYlaOW6GM/eNt77lbm5
 vwz27+HLiiNP+W1p9S4geEUlTES51yn8ZTjn97nqe1DuA8VeWQGn4luiu1m64sivbCKbMYv5vZR
 0TZ15nlVU2ngy4Bm74MJvvw7pD+JncysFLg4+E5JACZNbKUx03k1GpuprFxq2egj7AQqDSJkDQf
 mn6R6oxOAVGdmbWffO+FHwfmJ2T7LDv+0G6E2gPZnkn9Vk0Z45F9wsLE6ZmWYkEunNlESyrjVnh
 OrOCAHhjY1WzXVdqV/ms0YDYWXl77jMAlry7ODVXovPg9urI9i0eYwVd6VwqY0gs9m4rweNyk3q
 ROCLyyK+jRNUHZ8V26cXxQ5xQuWttQ==
X-Proofpoint-GUID: QQJDCLKe-0B-aBVbq0wgmq1YPdhSrv2F
X-Proofpoint-ORIG-GUID: QQJDCLKe-0B-aBVbq0wgmq1YPdhSrv2F
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=69148f55 cx=c_pps
 a=+KlkUUL6BOGgxGViHu3/Fg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=E18YAh5dzdhXVeS7JpMA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 13:44:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121548

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version xmlsec1
INFO: Current version: 1.3.7
INFO: Latest version:

After the patch:
$ devtool latest-version xmlsec1
INFO: Current version: 1.3.7
INFO: Latest version: 1.3.9

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
index 3e97bde86c..1990444dcc 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.7.bb
@@ -24,6 +24,9 @@ SRC_URI = "https://github.com/lsh123/xmlsec/releases/download/${PV}/${BP}.tar.gz
 
 SRC_URI[sha256sum] = "d82e93b69b8aa205a616b62917a269322bf63a3eaafb3775014e61752b2013ea"
 
+UPSTREAM_CHECK_URI = "https://github.com/lsh123/xmlsec/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
+
 inherit autotools-brokensep ptest pkgconfig
 
 #CFLAGS += "-I${STAGING_INCDIR}/nss3"
-- 
2.34.1


