Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC60CCD187
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 10:02:00 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16045.1760263319352035189
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Oct 2025 03:01:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jdkU95a2;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23802d874e=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59C9e2IZ2887044
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 10:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=wI72GCjcFjxXyFrtPKAQ
	nPYOR0l8hS9622DaIPfTM9M=; b=jdkU95a2dc7XooSk8wPuMvnzWA39Jo1nef2P
	jh1XHSqSsiW0ryES/yx+lDaUdQNbMIhmJhUEo8zbL2Eolyc5rv+/atunyPUXX46E
	NVxClm3DSkpfl2yTxncx5olkQinDrhuCTW3HCmoDCz4EAMUGeyQmKTTeF3nOcYDp
	zVYgWnpAqJrX/XMeSkJE1WjJyl2NNkAgFDN+QaGbNyQZrlLEbhSjV9w1rDHzXln6
	htgnT/vXTOPc9bOho3gm/LacSy/miyOM82sNs9FRTT9ujkIw7dXNOtcR7xoYknlr
	/Jc2elBPv4WcpXZZll7UjN1kyj0ZmQvx7Y+0X6JrIWKlNm+vkg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011069.outbound.protection.outlook.com [52.101.62.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49qe768v5t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 10:01:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGps7cilrrAJSFEziPKvzB529DrX7Ave5kDa5f4ANu8t0fdhN8L2AbONlTKjMCmGMkHBhKLYi0y/bGWJ9Qb4rMbF76DVCqSsxmW+8NWIG6Vt1Q4gKDQH90Umhbl/hy9FWR3kICrD+xBDb3he5qjs831N93qK4c5yKh9hbc9I0yCqP2uyPZ/bRyByhJKZ2t1gLWdnE2xwDS7XZU/ZCon8/cvAhI5l4+S9+KllMIrBF2cibpruIC1j6NLM5oMNlOpiX/hw6rne2oLsGm2LP1HG3/2ISXghgq238dLM2TFg/AAvL1U5x7LJdgWAwx+NolLKQ+2W+2j7XMDK+7FSxXoH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wI72GCjcFjxXyFrtPKAQnPYOR0l8hS9622DaIPfTM9M=;
 b=itHKWoyC8toMjgLjcYxvC164MeNsMh05f7Va+2XUKdmOwKEJ8vx0VIMJi6UfNGTinH3j77TJSlQqqBddimc7Jv17S+YNIH7CnnSzuciaTqs0sjyrMfkss4p7OwxKzc0E+QsvMFyVomZTHGM5+QxjPbJuPpWDKZJEiZL+o8pE3wB1eBTP9HBs9n/CY1EcDFdpLI54e5mLkMQ46/Cn+VX1cUU5L3eQdiEP4/UKs7ooQnsNszQXvc/c5K0Nd7UL/CWr+D5DF1BoBzmoP0HhFp+1pOqww2RMS89GGIZ8C46e1rH78lxq4LW587Ju3K7wQSCoE8tpz/+mDEPQhVvkLBMZOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Sun, 12 Oct
 2025 10:01:55 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 10:01:54 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][walnascar][PATCH] python3-m2crypto: fix test_IP_call
Date: Sun, 12 Oct 2025 18:01:38 +0800
Message-Id: <20251012100138.1014334-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH7PR11MB7608:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5b2040-57b0-4548-45db-08de09765f81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v3+plLsNF0PMF8WE/PSwhOduTF3WFtGdKvgnTlfdzkaN0Ai+kDytOSr3htW/?=
 =?us-ascii?Q?vp9qQuJx/kg+fIIsjZkRKaqgt+nLE3SgRSBhujpIeSZP6JxvZFIxoUjFVBZC?=
 =?us-ascii?Q?DmY00nkP1gqOD2ABkqZntc/D4PYAA04yEKNnVLoU0DFN0zRwMaxAisTfKc52?=
 =?us-ascii?Q?Hv60cVjYg2NIqsbDQCOrb4oMhS3fNjDq67pEP8vdeCyAvyOUKXobUUczyVxL?=
 =?us-ascii?Q?LeCqWbMvhROyglq5D5NZwWfqiJhI1Nbc/6EKOrXWBARwZu+U+/CWNNSpUKgr?=
 =?us-ascii?Q?wgEa26S14UYYTzfH4RqhwzGA7k3SDqHoc7yqSXHeCRqCVVvgebN8Yuc7Ktw5?=
 =?us-ascii?Q?PUtUK8n+2iNaWuMM55grYTom6ew/A5a6FOp0FUOGUAl7kTuGzFKphPkEGTBX?=
 =?us-ascii?Q?zS0QkelD7yZ0Aw6p2XL1urHycCSFdaACptSOQslYh8MnnKOpfTIIXMQh3LvN?=
 =?us-ascii?Q?AuZ3K+M5idQZw18r2fZHaX1bFYpi+6s6tYdH2e4UaMm5AZ6kfrGTtNReWNmk?=
 =?us-ascii?Q?u8iIaaEtNCF5ezT2gRyH3cW1fRqUSsl8gE0hpHHKitEWAO174ZhONL3Ig5m7?=
 =?us-ascii?Q?boaGUZXjO8BQ1eFJ2jWl8+5NH0TVx7OgiwP5HFb9EjacOtSwnGgLNuq7lh2y?=
 =?us-ascii?Q?B2B3dC9LWBTneIGrQZdemetaygdbJtcoPMrxDbvM6XHtfL6hhXqNNsjVbhv2?=
 =?us-ascii?Q?j4MhcGuAeJWVa+jU0NcAUmkDHoygbDdp9ohz+klZP2D7n3dA9oaEvnf1aHzc?=
 =?us-ascii?Q?iRfntK/nr1emYtnOYF7peQUBZC4wl9jkSFXB2/NBv+lsXKDjfns6gtC0kYNE?=
 =?us-ascii?Q?T00ZvZ9zGRw5Yv9OSmXtcTcTMwrbDxdTpamP7Jlez7NTE0j4X1FXt215yRmO?=
 =?us-ascii?Q?WTA/j9rgDBlR9u7ceu5S9stJurfY9ZDFtt85uGpk1U0FU/QRJC60ayuw7Isd?=
 =?us-ascii?Q?LcaDMNnQBToa7q2a04uaDBQxY070vA6wOX2kBMQ1yFUe16yTIuR8J9WlFqxL?=
 =?us-ascii?Q?zn9aBNT5VJgBVhh2D7tMjSEjmmX+TfEM0fp/mo73nmoS6aFWWvA+sDuAveaL?=
 =?us-ascii?Q?2Ri4X9LUNPmrfhKghSND2JoN961oFO9GMA8eM6GUCaJqxy5C4e1vUQF2sPNC?=
 =?us-ascii?Q?t/2h3Xx8cFDHYY2mg+/0DL4z1i8OvBz1JgZzw/6wdihlrSY9zHCZ1tOe1Lhj?=
 =?us-ascii?Q?bCCu1+R9nTix9nhB/EROgF/KAJeGqmigij2WHLJPfI+pzIA0QlJOqMdMiCW5?=
 =?us-ascii?Q?D0SAKJj4wQJ7xwofcuIqKbbESC9G3CoTbxadEk6KBO0MIxuQNMcCNk9Jg7VS?=
 =?us-ascii?Q?QIwuIpMTAkGP4jNrn7eFrSfS5uYVqkIgV4HpJVjLUnw8Ouiujjo3wWqmhpz1?=
 =?us-ascii?Q?u5MFopfegp1efP4RFm2+SuFHE2rKGerYYyWqIbB7MUl34J+QOdKkTpTK1I5x?=
 =?us-ascii?Q?SsqmDBIUW56Dfwh34+wvs9R/cgBq9+ubidAirtzHOHZCUl4uU0gGxg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OAqjE6/nR7ZAZv4EcasPvluS3NagNFEUS1l4Wo5RJu0HlqY9b+GOABs/zN87?=
 =?us-ascii?Q?6vPSDuwNoE4rflkXmJar5+RYh2cOSUWJGzH7zqCGNFUGjUtuCPkPooF06HkZ?=
 =?us-ascii?Q?MPTUVFjHI+PTONRajgt93evWZG+brbBnF53xKN3QnPvfbKCLl+f1vgZVIA2O?=
 =?us-ascii?Q?ey5DQtXBeiS7z98x40YUS05gl5co6wTbLD4aKlFHkm+vkEcXtVBgFK+YdoxC?=
 =?us-ascii?Q?Nnf/UhSG3YIqKvWbGliNOZfGXt+zV7hMbLfbX33PRx7tw2ZrFPdemDfhWRG5?=
 =?us-ascii?Q?hQpfk2K8T80hsMWtPXSmxgepJKDx3S2qVweoEuFzxYrxX5J2S3UMSsrFI6vg?=
 =?us-ascii?Q?7N1waqN5/zyMHdTAn7jbCdJPE0xuZ4LXFxfL6QXYs1OE6SiWdkArQFegVXSS?=
 =?us-ascii?Q?p97vzOO4MgW3crYq8632jDmAOq6OoNehiQ3aNajSd+729Uv4qKNiDiAUh1c7?=
 =?us-ascii?Q?GwMgiR9tL2DgAYJ54PoFn/m/cX/jpAEyVCSWETRjaVI6Iu1Xv9NYZbr4ZjFg?=
 =?us-ascii?Q?J/ygOXi+Q0feY+tdXDJx8V0/vKnd+8e7k7+gum6vTFyhGhIEHqv8dxh7zgBf?=
 =?us-ascii?Q?adDRIFSWij5kGbmUcQsclFbqSiVKEf0gUOGtUu/kS6B8y7ANpekB6tgs0aFr?=
 =?us-ascii?Q?T+O+l6DTV44+cQeN7X0vu0f07j+1aNvEh7aFKs+Krf88p7Xa0NmPwanwt/h1?=
 =?us-ascii?Q?xw54qxJOsKP3oHYsxyTcpNOEp2hKEmxbqWFghqdxcKyOMHQPsjaFD1iw+c2u?=
 =?us-ascii?Q?WWWF1o8LyipbotlFyCX7aNuBQVDBSR30t0XjO1IqVB/yxyiJDJ88KsFMeW64?=
 =?us-ascii?Q?QqHJGmqidkp13miAPPqp/1BRVvsajMvE2N3LrASm0Ebz2nxIdm8rIdbhId95?=
 =?us-ascii?Q?bu6OuLymYGm+grzSPPFiw8R9fLZx5cOHfLEbN+XGce9oISxdz41LLucc/Uhh?=
 =?us-ascii?Q?Ys0MGpzAi8+JgmPDlHOaGg57T9Arm1cT0lzajUeDee/3QC1UFM+ppDh6CTrK?=
 =?us-ascii?Q?sWKwK25Wn9tIcFBUdNzD1TbF9JQiY0ZXMwL0ccgNgBZDoWR7XrckW7otxLtG?=
 =?us-ascii?Q?/oP4Ouq+ZUWTmVAq3BlgGNkkP8ryTJMxRLhRiGyulg//kifSe86gAN0L9wqb?=
 =?us-ascii?Q?T6FsPSgGC6uOoAfoahA0l8G5W6EXxsSAPs0Ae4CucG/DHpoGVQOH8e0hJnJX?=
 =?us-ascii?Q?q2FXQP8FUADoIRRXrjnO/mvUF/ki2e07pTUReQF6OrKZ7I41FSnAVgwVMn2O?=
 =?us-ascii?Q?d4qqDTqhGXyoxI9weOu6WVlkS2KdAKTFzzk+I3MnP+iq7lIr0jhIcdWYpfEn?=
 =?us-ascii?Q?GCDuOgDqDnCdzo9kgNO1fyyAe/RFPptqoo7RiPfpmx7g83eHmvcV21EHx/26?=
 =?us-ascii?Q?tXwiTBZXZnfOgxpBE53itNxV7kYGgxvgs0qKAutAuJetA5LWMsvPLwPPBe9U?=
 =?us-ascii?Q?0gXR4MjkveQ+agorYAMIl8OdNblnZtYPBd54H4wL7lBBmuqFzcPsqpR31Q9u?=
 =?us-ascii?Q?7AKIRnyWxEbw8VGajLFin/dDfaUnkeXvWQRlbgptQuMtzroDFCLd9+RGJX4v?=
 =?us-ascii?Q?rUPdYtcSni70vJjRtB+WFZCqWKatiypq9NBCLlrDEia6Bq+sz0EDG9G2VLN9?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5b2040-57b0-4548-45db-08de09765f81
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 10:01:54.9051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xfuF1XP3B1S+H8YMqpmVciMJ+OTkcXzp9Ad3kfmCCeFEwsv21VVLRWt81V13JGrtmCt6hiE7uJhYsfJt0KE3WhFZ2s8yG4UvTgiJNgweIKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7608
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA1MiBTYWx0ZWRfXyMlT9Rgf1mRN
 xf8dKJTx27lR06hq/2ccVHOuRuIHtwVdqBY+suyA7WnqpaUXZq+OGxZGYMaXlccZiX1xRSOfC4q
 H7hjqK94g4ELN6T+ztVxj4XzxtNRxw5tOC85k0eNE4bsYnXOvMrFXFIiD+BiXRU57M2+htkblrW
 UUJPFHI/0uofIpvdcJvnL5QxCBELqXDi35gzjo21YvlvreF1uzY8qwwMUDOKopr/dwn7+kS+ZT/
 wPlGzUi2xu2VeIkO9I6C0BQnEEeMnDKPgPixPxECME5cLxtZiddye+9s+oVtYbmaB3MckotcNc4
 GW/o7eGSgIorpMk0cYWOLr8Pne8R0PGbKpmf6faSul6d01Mr4nUdFaiW/iIMfAoiMXLFwiRPkkh
 hu70/yE4GSbV1M3oGxcz61SnzNOXwA==
X-Authority-Analysis: v=2.4 cv=E8vAZKdl c=1 sm=1 tr=0 ts=68eb7c96 cx=c_pps
 a=/8oI+ICX6VsmSI+SRIYafw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=0SJgDBd8SxgA:10 a=x6icFKpwvdMA:10 a=xNf9USuDAAAA:8
 a=bwGbKnmsAAAA:8 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=wT9ZScjMB80q3_kr6UMA:9
 a=nuVVIWbBudwLbAahYuja:22 a=FdTzh2GWekK77mhwV6Dw:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=6_D5ljFcL1GZDUJyZucp:22 a=pHzHmUro8NiASowvMSCR:22 a=6VlIyEUom7LUIeUMNQJH:22
X-Proofpoint-GUID: -8Tqm5k4GN_BDOZr6OS0pJeW26KI4Cfs
X-Proofpoint-ORIG-GUID: -8Tqm5k4GN_BDOZr6OS0pJeW26KI4Cfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_04,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510120052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 10:02:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120518

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix the following test hang:

test_IP_call (tests.test_ssl.HttpslibSSLSNIClientTestCase.test_IP_call)
...

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...01-tests-Don-t-pass-debug-to-openssl.patch | 57 +++++++++++++++++++
 .../python/python3-m2crypto_0.44.0.bb         |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-tests-Don-t-pass-debug-to-openssl.patch

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-tests-Don-t-pass-debug-to-openssl.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-tests-Don-t-pass-debug-to-openssl.patch
new file mode 100644
index 000000000000..2507d32912e9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-m2crypto/0001-tests-Don-t-pass-debug-to-openssl.patch
@@ -0,0 +1,57 @@
+From 8bd51ee831e13412fda63c7e5ae8a74f8adc89f8 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Thu, 8 May 2025 18:46:37 +0200
+Subject: [PATCH] tests: Don't pass `-debug' to openssl.
+
+The HttpslibSSLSNIClientTestCase test starts "openssl s_server" as the
+server side and passes `-debug' as one of the arguments. This option
+increases the output while its content is not considered/ parsed by the
+test suite as far as I can observe.
+OpenSSL 3.5 (currently alpha) added post-quantum hybrid key agreement
+support. As part of this support keys for X25519MLKEM768 are sent during
+the client-hello phase and not just X25519. Since the keys for MLKEM768
+are large, the client-hello and server-hello messages become
+significantly bigger (since now X25519MLKEM768 is now supported on both
+sides). This in turn increases the output generated by the `-debug'
+switch.
+
+The output of `openssl s_server' is not consumed while the application
+is running but cached in the PIPE and consumed after the server has been
+terminated and the output is parsed in self.stop_server().
+Due to the big increase of the output due the additional keys the
+`test_IP_call' test stalls now because OpenSSL's write to the output
+blocks until the reader consumes it but this is not happening until
+after the tests completes. So the test stalls.
+
+The additional content generated by the `-debug' switch is not important
+for the tests. The `-msg' switch is used for hostname verification.
+
+Don't pass `-debug' to openssl.
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Bug-Debian: https://bugs.debian.org/1101045
+Fixes: https://todo.sr.ht/~mcepl/m2crypto/292
+Last-Update: 2025-03-24
+
+Upstream-Status: Backport [https://gitlab.com/m2crypto/m2crypto/-/commit/9c27fb1ebe28c2fa2a7ec850bbd716101e9ba108]
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ tests/test_ssl.py | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/tests/test_ssl.py b/tests/test_ssl.py
+index d80218f3fc31..c9648ea080f6 100644
+--- a/tests/test_ssl.py
++++ b/tests/test_ssl.py
+@@ -291,7 +291,6 @@ class HttpslibSSLSNIClientTestCase(BaseSSLClientTestCase):
+             's_server',
+             '-servername',
+             srv_host,
+-            '-debug',
+             '-www',
+             '-msg',
+             '-cert',
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
index 5afaed4cfea8..6a0adb618dd6 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.44.0.bb
@@ -9,6 +9,7 @@ SRC_URI[sha256sum] = "384bb4cbd178ee0e74015311b7b1f9f2c377e3686e03fa070b3ec2f494
 SRC_URI += " \
            file://0001-setup.py-Make-the-cmd-available.patch \
            file://0001-timeout.py-use-qq-format-when-time_t-is-64bit-on-32b.patch \
+           file://0001-tests-Don-t-pass-debug-to-openssl.patch \
 "
 
 inherit pypi siteinfo python_setuptools_build_meta
-- 
2.34.1


