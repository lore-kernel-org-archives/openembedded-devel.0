Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AC0CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 07:09:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.95352.1755068959523821304
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Aug 2025 00:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0320f3c99f=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57D5Z1Jk2819686
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 07:09:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48fv001kaj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 07:09:17 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSv6kbADDrDAttoK6etH6aCSkhinXUKzVH9O0hoPvL+PPPiV6Pz8RfbXQh+PYI6+UJZht24ww4bOLULlLevq5ro/xtOfIVaRfIqMckudLhIRbLrHMGZELXUwYYX4W4kAItdv2ENC9CcPBnkV3It9XCL3m5g1vVHTInpUgyh0sRDyUn1TNVOuKx06I3YPJ038RvhzU6TD+qg8QGu65VedUBi2hY5Os3ctvzeDWZkMfgwkCzahdr5L0N2xh/BPi9282sxtJs/d3HvNKO6qc2kFJG/1HEmLkAte7r1BHkSiOQfiPpgwdhhIUi02NGWvmoXaiq0437Qx9p9Wk/GaGw9QBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsRVlUHjrz9qIZbA2/lUwKETVGIhU5f0Au0w+PEpaDE=;
 b=BYdD9dBKFjMxjTs8hb1U1wBE9CpIDEf8aNp+OoRCWoLOY+1WTh3XAy4qB9k/nTusrR63ep7xlS/wbDcH8BnVKfos19RPRo1asL6PwH4X/f4qEI/8z+ZE4JwOcOxbfBvKCjiVqf/TWjVvcR2ptJVQGQLhX+C9Y0ma3ApWyWIsvbK1cDH5Y8QBpyoKewwatZciSv1QPoSt7CIVWdL/YYfFfNMH0pRSUcwzSJgTWktkGf6ont96oBBvhKNIxAy1qLS7Han4shSnT2ZUFSXCAWuRK7F+UC+j5KgTpW0HEv9mNo2RGDgH21Mftof0re5hXsEvsvKcQLaA3MuzKEQqSB5/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 07:09:15 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 07:09:14 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][PATCH 1/1] python3-posix-ipc: upgrade 1.2.0 -> 1.3.0
Date: Wed, 13 Aug 2025 15:08:49 +0800
Message-ID: <20250813070855.664999-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.44.3
Content-Type: text/plain; charset=y
X-ClientProxiedBy: KUZPR03CA0007.apcprd03.prod.outlook.com
 (2603:1096:d10:2a::13) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA2PR11MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: b574236d-a200-4666-0c55-08ddda384fa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FETQ7/mJI90nkFdGTM4JQaZeHy5f5M1Hf+JECj0zdLBFzEpboCFfK6400RnH?=
 =?us-ascii?Q?J03AFpvgtO5tItmiLty0EjWzCrFGqhaq19mp7cu2mtcwnJn6aw1a55c9oH2R?=
 =?us-ascii?Q?RTrqMNWfa+nVP3t50T2QIjAOjuUrw/7I8Giy9SxN7DGLt+oTE/G484uI8GtG?=
 =?us-ascii?Q?LcIM55aMO3KTgCeEuNmfkkfzBsjDPP8ApRUdUE6BkD/16g1CsAHUIcPPG+Jn?=
 =?us-ascii?Q?0+Q3O+tZrusNh3GFE/piakIzrQ8acKSucit4VV7OY/A+O/yIYmYb3WPOil3l?=
 =?us-ascii?Q?5aowXYSTVDRdf/ZA866Cp2qhfvSyrAe/z6cWQSbtQwjF1EaINobzO7PkBjJ0?=
 =?us-ascii?Q?fbHkr8cLEGtv5n/el9j6bJeV3kCM/As2OFxSqbv7aKupAL1W7sE/kjWhW3NO?=
 =?us-ascii?Q?C0QUAKYWYd6KiewyocOyibwOswOGPGLv/g+rKGuJOHmKziANKsVvFIslxz3x?=
 =?us-ascii?Q?TAytqBtJ0Y/P5QxgVngMPfawTGpP7jR1De6zwcEwh0aOasRqvlrHSWeA95Ap?=
 =?us-ascii?Q?M1/VJsBZpUDQSU7pEsI+x+0xERCpF67LO7NEG1a6Sju2pp5iI3rk8RdR6ovn?=
 =?us-ascii?Q?6cnScCKezPPeKne8E//ub6eCvei6clnt6hR0v4jFwOkcNxM3KzSqYFXf+Qt5?=
 =?us-ascii?Q?ION28PtSRmcVW65cwXC6sbA3jJyiU9Vt7++jlE5jNqnI+vzcb1lF126G5frY?=
 =?us-ascii?Q?svbuuU5aEEnfpfMhfhd41BcyYmqQ1MYO9aswb6wMut9tfajHbPg3cSdYQG3C?=
 =?us-ascii?Q?u5nsQ1MgaRh4WThsvgZUrN9jQYAm40HBgVM5xVEDwEcGx8E16xHm9y45dxxM?=
 =?us-ascii?Q?vaaJs2q2r3BP12k/e6mjYKcMaAiB4WOPGTUku5d0AyB2q41MzXxM9U1wmIuL?=
 =?us-ascii?Q?V3pP/fDX5yXgjXu4ZVrYX10Z+UDfig9l8ZN8/5xdyxKpOtNmdGoqYBCLl53k?=
 =?us-ascii?Q?JiOFRrwqs0z0jk5ZpkJ3BTin/AFkcfjXZZqzucFRnJM5OkHTdpcTH369S+NV?=
 =?us-ascii?Q?VrmJIRDywYoVA/+ljJEaR5BUSSHpbBFnsrB2WKGBjT31IuhrKsLZQQlyA24R?=
 =?us-ascii?Q?wpqAWgF/46XJUGpYta3qX/3ewSNT1PDADZvwHKEc4XGnSDCzs0Cj/Qg0/pdj?=
 =?us-ascii?Q?tc8UXeU2QOs9VNrI7FGT4ljJJ5vC1uDgGQvJhGjK+lCwk5FPYUvoFixPp3Em?=
 =?us-ascii?Q?NXOsf6S0hwtCf9x73/JkAMtqxrgjYRSdZK53jWdX3Ey7Cb4WuFef9gW3Cm2K?=
 =?us-ascii?Q?BzY/dCT/bAXPJgd8xSzOBq7ghy1mqos7ccBwNepKg/o6LsVo620bGfOfp8Ny?=
 =?us-ascii?Q?4vZ4hXjyi+sRHLPAa2ybF0Suiy2sgm9C5MS+HkXVk/dyaiKJLocm78sK1nFG?=
 =?us-ascii?Q?bXkRc5vCPS9jRmPAFTK8iKS/vVIyg8Ekd+C7UDjN43TH4yE8IYHurv+doUw4?=
 =?us-ascii?Q?Cjl1IBHoe6M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xMTbFy7t3fCY+O0g0WSDnZsb2UzqwtvPUOiK8qASUZSt3sQh3k9aB48opVch?=
 =?us-ascii?Q?uC8KPN37ASUvt2fQ3VH8tISmutEmeGK3PlOQG1wNsJwyd/i+nRc9ipSlpxrq?=
 =?us-ascii?Q?qLzxVfzWdYadh5m3xDcgog7yenz5NrTohPQaewad/RS+2YQxbej3QzMKS8ZG?=
 =?us-ascii?Q?rn7QAwb8Xm5AvhFLLjVItqWEPNO6lTTi35yGWc3M/rmwGsz6gID9blNWSK0J?=
 =?us-ascii?Q?sNsBuwaLRvIb3agmXsnH1B6uitrJQuBndgadfCRLgvV/t2MA5/DHn7suvxKH?=
 =?us-ascii?Q?jj/Rko5PgfxdyaipcCwW5StE1jOmrdhQCjkbNbdBCG6CvDqMerrNXzvcOpTp?=
 =?us-ascii?Q?mT7uybJ7dZdCHAlZjcLzlJ4HWCuaOBwAWYGlAV4XhikFsv3z8slRFqhflNoa?=
 =?us-ascii?Q?yxYfs9Y7jrV5th6ZN119NzmcosfHeWCXWQs7ozI/MxpSj9FE3wZEgG5Fnl07?=
 =?us-ascii?Q?gpi0m3Vc2R4l5ob/2sGFekEcOmP/qcQtS+6Ce4UCGUWsPhX/x4ewQp7OCOg5?=
 =?us-ascii?Q?q6sPhg+CL9MzWI6PH1YJlJ94sJ8/h5fEdUl3VFEg8n+umvk6yUxVZJ/INSmv?=
 =?us-ascii?Q?ih29dn4N3LU4HID4oGO0ijRtC865DDIGdsuUxDcedtNqxIZdo/wY6h4exdSh?=
 =?us-ascii?Q?ihXB0i/mkvfC6S+dkjjYEsIBgdXpvZNdMNMpfVbuGZept4aZATCMYI/7QRNK?=
 =?us-ascii?Q?w2FxTI3/C0pGE8rXUKQtzBbfg3eVIu7w2ZRgUmT+DWKHZCaLzR7MAGbmZ0ES?=
 =?us-ascii?Q?K3Ky5+rTxjL+mKH3K1JnYx3/LGBv5YJXTyHkjlIQENGfKvBilAnuf5pCHxcn?=
 =?us-ascii?Q?MajVlLhF4YOELldGQeMitb0JAUrfKGk7GwFpbbZQ+omaP51S5J3ZcyWOjhVQ?=
 =?us-ascii?Q?VCrYsT+k9rUpajerzrXsh4AxfChnEUaD2NAF7ZxrKY8OjGvFS+38y23N1Ebm?=
 =?us-ascii?Q?Jmf5Qeqk6PScgaq1YJVePXgIguw28Z17vp2+wTAZiTXlJC2WmLwbrk1SqNk4?=
 =?us-ascii?Q?w29x2IcNs2bPZb00BIDAfp/GGMswcjUYqkcNUfwL6kBhnBNvXXWGIqtElXZu?=
 =?us-ascii?Q?1A763484yj6BEVF/Tm9ZiQ29ytTXwG17upOUoX97FkCr1A26463DNbWbgQMV?=
 =?us-ascii?Q?Wr7noPpBtQ+0Ye+CLnmHHDbSMWHE0Tuf+weK2AHTgKjWp+xpyj+8VprIeRAb?=
 =?us-ascii?Q?figzBVbxCN9nPc2nMw1MqCntIqBJ6tdrWTAvjY8Zc+OXvGsOh2aWnuDsdYIL?=
 =?us-ascii?Q?I0dONBmpFXhd200WTDKvivsKEcPeykqHw9rgiiJGrY8KUrrH/5npVWEDOFic?=
 =?us-ascii?Q?YXH3l0cGnR56tKBNzAXucIZtXixtq0Th/BXW8RZQY11MyrUnSGSBUNz21wdF?=
 =?us-ascii?Q?DCBjx+LTtR7fJeBkJhiQypJx2TqVbVHvKgrSoSeHV+8If6rJpq79ynQ+554l?=
 =?us-ascii?Q?vHPPrVMkCO1pH/drVK0og3zq67mL3CulvP8xpStC20nwYWEK052/1BJUaPz9?=
 =?us-ascii?Q?+hhefj3ZACwjodaodHh4BgbeqONSI8JIi+nacEUBisM8yN0f98FqMcWE3Mv3?=
 =?us-ascii?Q?krHQeBqr8d8/UMbJ2EN8NNRO5c/xYL0U3/eEIdva5X1fPr5Qpyv152oCWgYo?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b574236d-a200-4666-0c55-08ddda384fa3
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 07:09:14.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M0JlFsThyGtsH47fGqoosgV8Dvv5VNKUv1jBfx/IsFYMHSQuJBzn+ZSmTgctKt4rpXdx0IB46Qp076xs3ZpyZ8AgA+S3PAf5kTEwNtNU41Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
X-Authority-Analysis: v=2.4 cv=JKQ7s9Kb c=1 sm=1 tr=0 ts=689c3a1e cx=c_pps
 a=mi3bKrpD1VGuQXVfC4HZlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=qf4gfuq51q0A:10 a=2OwXVqhp2XgA:10 a=NEAV23lmAAAA:8
 a=uZvujYp8AAAA:8 a=-w5ALONIAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=R0vk_TK9CL-CTnU6KmsA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
 a=NK6dRPDLI4cA:10 a=SLzB8X_8jTLwj6mN0q5r:22 a=C79KhC8RY3WKb-qt5qOK:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: _cpZ_2bxwsDIe1GEy5YUqxq35R9QKp_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA2NyBTYWx0ZWRfX5Q9dKWkp/fyy
 r6BfJQR0Y7CLsMgEAw4l4aW55C3dKdljeJNuaxRKD9Vd0ZwNcH8CtAMmrgQ1y1wUjNV0Q2wEp5+
 03rwqG7u470ft2aIs0rPei755Q3FeSr6gil204KxiShAJ99hPiUyOo3f2dMtoZDB7X2MO6hNoV6
 IpJAuhJdXbQThCAehQy7lw1zEMIa4tiHHflbdq1E5SPseWN8flEDOzrvaFZykVWBCjjNnWKvfM8
 j+P0mFvQxjIVDaH60I5kZkgQXGeKsEHtJ0Fn8ZV7IeIObElNoOzJTrgnMSXtC6+HmwQ/umM4/Yv
 QV/UKQLU3r1GvbXxe8YizYyQw3vBWakidcYokUg1s922DH3crnBn6KVsveia6c=
X-Proofpoint-GUID: _cpZ_2bxwsDIe1GEy5YUqxq35R9QKp_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 57D5Z1Jk2819686
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Aug 2025 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118923

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Remove following patches, they have been fixed since 1.3.0.
0001-build_support-use-source-filename-instead-of-foo-for.patch
0002-build_support-handle-empty-max_priority-value-as-Non.patch
0003-build_support-use-does_build_succeed-in-compile_and_.patch

Backport a patch to fix dicsovery fails when CC contains flags

License-Update: update copyright statements to include contributors

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
This change also fix following runtime error:
 ./build_support/src/sniff_mq_prio_max:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required=
 by
./build_support/src/sniff_mq_prio_max)

 ...x-cross-compilation-error-when-CC-is.patch | 53 ++++++++++++++++
 ...e-source-filename-instead-of-foo-for.patch | 50 ---------------
 ...ndle-empty-max_priority-value-as-Non.patch | 49 ---------------
 ...e-does_build_succeed-in-compile_and_.patch | 62 -------------------
 ...pc_1.2.0.bb =3D> python3-posix-ipc_1.3.0.bb} | 10 ++-
 5 files changed, 57 insertions(+), 167 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0001-build_support-fix-cross-compilation-error-when-CC-is.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0001-build_support-use-source-filename-instead-of-foo-for.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0002-build_support-handle-empty-max_priority-value-as-Non.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc=
/0003-build_support-use-does_build_succeed-in-compile_and_.patch
 rename meta-python/recipes-devtools/python/{python3-posix-ipc_1.2.0.bb =3D=
> python3-posix-ipc_1.3.0.bb} (51%)

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-b=
uild_support-fix-cross-compilation-error-when-CC-is.patch b/meta-python/r=
ecipes-devtools/python/python3-posix-ipc/0001-build_support-fix-cross-com=
pilation-error-when-CC-is.patch
new file mode 100644
index 000000000000..c78d4ad726c6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_su=
pport-fix-cross-compilation-error-when-CC-is.patch
@@ -0,0 +1,53 @@
+From 01134093c9150248f9ea8890a41e922159593a7f Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Fri, 8 Aug 2025 19:30:16 +0800
+Subject: [PATCH] build_support: fix cross-compilation error when CC is a
+ multi-part command
+
+Fix the following error when cross-compiling with an environment-defined=
 CC
+that includes flags:
+
+FileNotFoundError: [Errno 2] No such file or directory: 'x86_64-wrs-linu=
x-gcc
+-m64 -march=3Dnehalem -mtune=3Dgeneric -mfpmath=3Dsse -msse4.2
+-fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-se=
curity
+-Werror=3Dformat-security
+--sysroot=3D/build-1.3.0/tmp/work/corei7-64-wrs-linux/python3-posix-ipc/=
1.3.0/recipe-sysroot'
+
+This happened because the CC environment variable was treated as a singl=
e
+string instead of being split into arguments. The fix uses shlex.split()=
 to
+correctly parse CC into a list of compiler and flags, and then unpacks i=
t when
+forming the subprocess command.
+
+Upstream-Status: Backport [https://github.com/osvenskan/posix_ipc/commit=
/0113409]
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ build_support/discover_system_info.py | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
+index d1b171e4f602..1c3741f5577c 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -1,6 +1,7 @@
+ import subprocess
+ import platform
+ import os
++import shlex
+=20
+ # Set these to None for compile/link debugging or subprocess.PIPE to si=
lence
+ # compiler warnings and errors.
+@@ -49,7 +50,9 @@ def does_build_succeed(filename, linker_options=3D""):
+     #   - Some versions of Linux place the sem_xxx() functions in libpt=
hread.
+     #     Rather than testing whether or not it's needed, I just specif=
y it
+     #     everywhere since it's harmless to specify it when it's not ne=
eded.
+-    cmd =3D [os.getenv("CC", "cc"),
++    cc =3D os.getenv("CC", "cc")
++    cmd =3D [
++           *shlex.split(cc),
+            '-Wall',
+            '-o',
+            f'./build_support/src/{filename[:-2]}',
+--=20
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-b=
uild_support-use-source-filename-instead-of-foo-for.patch b/meta-python/r=
ecipes-devtools/python/python3-posix-ipc/0001-build_support-use-source-fi=
lename-instead-of-foo-for.patch
deleted file mode 100644
index 8bb726708654..000000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc/0001-build_su=
pport-use-source-filename-instead-of-foo-for.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From 09cfcf7de2aab873a13949d5a128ccfb9e54732d Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 5 May 2025 08:15:37 +0200
-Subject: [PATCH] build_support: use source filename instead of 'foo' for
- discover tests
-
-* helps when debugging the issues
-* use the same order of CC arguments in compile_and_run and
-  does_build_succeed just for consistency
-* use pthread in both compile_and_run and does_build_succeed functions
-  it was added only to does_build_succeed in 5ec39f7af8cfd8525d225b1302f=
a93f7133b3849
-  not sure if it was intentional
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/=
77]
----
- build_support/discover_system_info.py | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
-index bc4d174..6d059d9 100644
---- a/build_support/discover_system_info.py
-+++ b/build_support/discover_system_info.py
-@@ -60,7 +60,7 @@ def does_build_succeed(filename, linker_options=3D""):
-     #     Rather than testing whether or not it's needed, I just specif=
y it
-     #     everywhere since it's harmless to specify it when it's not ne=
eded.
-     cc =3D os.getenv("CC", "cc")
--    cmd =3D "%s -Wall -o ./build_support/src/foo ./build_support/src/%s=
 %s -lpthread" % (cc, filename, linker_options)
-+    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%s =
%s -lpthread" % (cc, filename[:-2], filename, linker_options)
-=20
-     p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=3D=
STDERR)
-=20
-@@ -73,7 +73,7 @@ def compile_and_run(filename, linker_options=3D""):
-     # Utility function that returns the stdout output from running the
-     # compiled source file; None if the compile fails.
-     cc =3D os.getenv("CC", "cc")
--    cmd =3D "%s -Wall -o ./build_support/src/foo %s ./build_support/src=
/%s" % (cc, linker_options, filename)
-+    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%s =
%s -lpthread" % (cc, filename[:-2], filename, linker_options)
-=20
-     p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=3D=
STDERR)
-=20
-@@ -82,7 +82,7 @@ def compile_and_run(filename, linker_options=3D""):
-         return None
-    =20
-     try:
--        s =3D subprocess.Popen(["./build_support/src/foo"],
-+        s =3D subprocess.Popen(["./build_support/src/%s" % filename[:-2=
]],
-                              stdout=3Dsubprocess.PIPE).communicate()[0]
-         return s.strip().decode()
-     except Exception:
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0002-b=
uild_support-handle-empty-max_priority-value-as-Non.patch b/meta-python/r=
ecipes-devtools/python/python3-posix-ipc/0002-build_support-handle-empty-=
max_priority-value-as-Non.patch
deleted file mode 100644
index 54c8ddaba7ae..000000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc/0002-build_su=
pport-handle-empty-max_priority-value-as-Non.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 8fc46d871639dbe799f6ff0a61b046412ef5dcc6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 5 May 2025 08:16:30 +0200
-Subject: [PATCH] build_support: handle empty max_priority value as None
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-When cross-compiling these tests they fail when the host cannot execute
-the binaries built for target.
-
-On my local ubuntu-22.04 docker container running
-build_support/src/sniff_mq_prio_max results in:
-posix_ipc-1.2.0 $ ./build_support/src/foo
-bash: ./build_support/src/foo: cannot execute binary file: Exec format e=
rror
-which triggers the Exception in compile_and_run and returns None
-
-While on some other ubuntu-22.04 containers I see:
-posix_ipc-1.2.0$ ./build_support/src/sniff_mq_prio_max
-/usr/lib/ld-linux-aarch64.so.1: No such file or directory
-
-and the compile_and_run returns
-b''
-which then causes
-posix_ipc-1.2.0/build_support/discover_system_info.py", line 244, in sni=
ff_mq_prio_max
-=C2=A0 =C2=A0 if max_priority < 0:
-=C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^
-
-Handle the empty value the same as None to avoid this.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/=
77]
----
- build_support/discover_system_info.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
-index 6d059d9..f8a3c83 100644
---- a/build_support/discover_system_info.py
-+++ b/build_support/discover_system_info.py
-@@ -223,7 +223,7 @@ def sniff_mq_prio_max():
-         except ValueError:
-             max_priority =3D None
-=20
--    if max_priority is None:
-+    if not max_priority:
-         # Looking for a #define didn't work; ask sysconf() instead.
-         # Note that sys.sysconf_names doesn't exist under Cygwin.
-         if hasattr(os, "sysconf_names") and \
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0003-b=
uild_support-use-does_build_succeed-in-compile_and_.patch b/meta-python/r=
ecipes-devtools/python/python3-posix-ipc/0003-build_support-use-does_buil=
d_succeed-in-compile_and_.patch
deleted file mode 100644
index b36d1cdb3ae1..000000000000
--- a/meta-python/recipes-devtools/python/python3-posix-ipc/0003-build_su=
pport-use-does_build_succeed-in-compile_and_.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 760374e778fc28193cfea1416a739e206f9201c6 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@gmail.com>
-Date: Mon, 5 May 2025 08:28:56 +0200
-Subject: [PATCH] build_support: use does_build_succeed in compile_and_ru=
n
-
-* avoid the duplication and building the sniff_mq_prio_max.c twice
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Submitted [https://github.com/osvenskan/posix_ipc/pull/=
77]
----
- build_support/discover_system_info.py | 27 ++++++++++-----------------
- 1 file changed, 10 insertions(+), 17 deletions(-)
-
-diff --git a/build_support/discover_system_info.py b/build_support/disco=
ver_system_info.py
-index f8a3c83..f6e6c8c 100644
---- a/build_support/discover_system_info.py
-+++ b/build_support/discover_system_info.py
-@@ -72,22 +72,17 @@ def does_build_succeed(filename, linker_options=3D""=
):
- def compile_and_run(filename, linker_options=3D""):
-     # Utility function that returns the stdout output from running the
-     # compiled source file; None if the compile fails.
--    cc =3D os.getenv("CC", "cc")
--    cmd =3D "%s -Wall -o ./build_support/src/%s ./build_support/src/%s =
%s -lpthread" % (cc, filename[:-2], filename, linker_options)
--
--    p =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3DSTDOUT, stderr=3D=
STDERR)
--
--    if p.wait():
-+    if does_build_succeed(filename, linker_options=3D""):
-+        try:
-+            s =3D subprocess.Popen(["./build_support/src/%s" % filename=
[:-2]],
-+                                 stdout=3Dsubprocess.PIPE).communicate(=
)[0]
-+            return s.strip().decode()
-+        except Exception:
-+            # execution resulted in an error
-+            return None
-+    else:
-         # uh-oh, compile failed
-         return None
--   =20
--    try:
--        s =3D subprocess.Popen(["./build_support/src/%s" % filename[:-2=
]],
--                             stdout=3Dsubprocess.PIPE).communicate()[0]
--        return s.strip().decode()
--    except Exception:
--        # execution resulted in an error
--        return None
-=20
-=20
- def get_sysctl_value(name):
-@@ -211,11 +206,9 @@ def sniff_mq_prio_max():
-     # ref: http://www.opengroup.org/onlinepubs/009695399/basedefs/limit=
s.h.html
-     DEFAULT_PRIORITY_MAX =3D 32
-=20
--    max_priority =3D None
-     # OS X up to and including 10.8 doesn't support POSIX messages queu=
es and
-     # doesn't define MQ_PRIO_MAX. Maybe this aggravation will cease in =
10.9?
--    if does_build_succeed("sniff_mq_prio_max.c"):
--        max_priority =3D compile_and_run("sniff_mq_prio_max.c")
-+    max_priority =3D compile_and_run("sniff_mq_prio_max.c")
-=20
-     if max_priority:
-         try:
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.=
bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
similarity index 51%
rename from meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.b=
b
rename to meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
index 4f544c80bcff..02d2e55bad15 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.3.0.bb
@@ -2,18 +2,16 @@ DESCRIPTION =3D "POSIX IPC primitives (semaphores, shar=
ed memory and message queue
 HOMEPAGE =3D "https://semanchuk.com/philip/posix_ipc/"
 SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1a4f3bd729df04bf68f66ef877e9c=
7c9"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3d8df223c2614dbf1aabdc1ca23c=
c10"
=20
 PYPI_PACKAGE =3D "posix_ipc"
 UPSTREAM_CHECK_PYPI_PACKAGE =3D "${PYPI_PACKAGE}"
=20
-SRC_URI[sha256sum] =3D "b7444e2703c156b3cb9fcb568e85d716232f3e78f04529eb=
c881cfb2aedb3838"
+SRC_URI[sha256sum] =3D "6e559ac5bb5f6f233c396103f4868e383bbd8f4e54d20876=
910896f47d353448"
=20
 SRC_URI +=3D " \
-    file://0001-build_support-use-source-filename-instead-of-foo-for.pat=
ch \
-    file://0002-build_support-handle-empty-max_priority-value-as-Non.pat=
ch \
-    file://0003-build_support-use-does_build_succeed-in-compile_and_.pat=
ch \
-"
+    file://0001-build_support-fix-cross-compilation-error-when-CC-is.pat=
ch \
+    "
=20
 # Message queue support requires librt for proper linking
 LDFLAGS +=3D "-lrt"
--=20
2.44.3


