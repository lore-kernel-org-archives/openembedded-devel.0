Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E64AC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 09:02:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7068.1743152536810994256
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 02:02:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51826d0eb3=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S805HS006361
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:02:16 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1q2bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:02:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UECsX8dzTt8HD1oAS3akHBjYc9z/mHZ4yexnBrWWAz95/RzHcht43N6y6a6s743FdgbgWPZohsOtUmSHGGUjchmNpto7kw8dhQ/QP8hgc1iUv36bR+Rj1g2Ym7rg8NWhhGCnBtDSUdXcP4OFp2++GTBF75hBG08a04aHVqkRDcVJpWFRtYg19T5M8w2Higws+wgCrZpaSbDIQ7TmRIBdjnqcqIWGEMZrfuEoCpwxCA3KI4kQiTBiAa48U4Oh0gWCXQWoNEygH0PPjId1xZe7QngWhM0NhTp2TeNOp5OJRpeiYcPfN1PjXl7TbjOkY/3l1/xC9nSzfN5T8JhYt3x/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4dei8dbrCIjMkg6s/GCgUPxwYms0sm8jNEEJmIDJzA=;
 b=bEGkaXeS19cErSygawChLmI/seNergCx0sGQO70PbbIPMmBNgPgt7lKehTGM7CUEaGD0MtgkzLnuKuERddLqctQ9FpKKHhK5X1IU3EuPDzXTeqUd2BtmW413DI9y99lU7Xv2BztbhajbmWEMJ2p3T7AEoCv2O2k8Gp2tgP/XTbJ7Tye3HkRQaeJfGa7YhC9CSKEmrR1PswLlY2YLwiE2ympJM1VjZ4HU3qiHOCd9VqCwPuvnKdO8tSn/8q7RTg/GAzCzMjy40peIgRvyt1LIPZUPF4yeax8MS9rrbqYLjQqEul5R019lSRLkAn6kb7FKn+qC66T/qtnbqSSWd9obUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 09:02:13 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 09:02:13 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH] openvpn: renew the sample keys
Date: Fri, 28 Mar 2025 17:01:56 +0800
Message-Id: <20250328090156.635557-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DS0PR11MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: f879882a-6679-4a0c-3368-08dd6dd73abb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nBSD3R46KUmeAMhrxo5EIilmSmXruDbh0d4Czvho1k/4LYOrAjKSDf/cF/H5?=
 =?us-ascii?Q?nLv+zxSuwdXXBbEoOg7a5FBejVd5P6FAOtaoAB+9w3WushhwcSFr6HPrFQke?=
 =?us-ascii?Q?pR/7QqwBz/hbGSVhIKDcnummAezSUxrcMu0tXkViqdoIcM3fuUuF9GDVmQ7r?=
 =?us-ascii?Q?O8W+Z3dB13MClbpJYtHbeVkwFSZEtLBnAraUCpVKMIxiNpKVY4oXctADw/vP?=
 =?us-ascii?Q?O0BeOLgZjA/xo+OLOd92CiH7CYwKnuc2pI5J2QwsvqTjN16EVziPkk5tw1f7?=
 =?us-ascii?Q?c4pcCNQAvx2gMsLdb+2yVoiD/PqWAKQKxMmnSRsziPEqcSi0lfIxlrDeHxtf?=
 =?us-ascii?Q?COG/NJTwRPChGvZbrCt/R5ykIjNAi/TESbSwwzz3d2HdC2HvZZ7DwPdJ9l+O?=
 =?us-ascii?Q?glIK+Vppm29jdojfv/wTDJo6Y+18of1s6JO5vDsf/CmMQ28UmTVybEvFP/7O?=
 =?us-ascii?Q?qmCa84vgcmSxLdnQ8LpIG4efogAyQ9HY9Kd+RhfBCt0hLXcsGv5IwSdshwtC?=
 =?us-ascii?Q?H7Okmd9yhWUZ2RvZ51To7WAh/R/CgVTmMkrKzcZil0ermh1zvWMnLq6vbXvZ?=
 =?us-ascii?Q?UlAOnkIubmMBr11w5rjH/1PBoTAbY1tdVHgGPr3bodPr8ZNZIi+ImycqgRr/?=
 =?us-ascii?Q?gAKrT0BaiUmQigRqJaS4JovuDlPBkh4BYpmtxFCeUCPN8KDaqmx4DswDoR7R?=
 =?us-ascii?Q?WQ7Muru4LsTDsC8beQXaf032hxmO1o9BJVwNjjVC5+sFA3z5OaF18u0Np8CS?=
 =?us-ascii?Q?k2tQFQSfAIixCLxYkitxizk/IvArrS/oGDdq7N/aaeYkLh611hojrWeC2Qe3?=
 =?us-ascii?Q?5je/3jcFekjNVdJmFqh1/KQ1J/RWZ6/H0rTRdcMgRaJCwzG6j/ay87pQa3A2?=
 =?us-ascii?Q?6S4Y/E6+JT4gLcHdDjDs8oLdVuZUzAzGzbQlzZ90iAs/suvmiSakIZJ/2+wh?=
 =?us-ascii?Q?UKFvSd35AzVRz9xu5IpfZUAxZwXZ7pjCAST3rzEYhpuca99OWnBogpMmjD3I?=
 =?us-ascii?Q?jAEJqu47SkBtdH4sVFbBuNAzTVjL+uMu9JRYbSEX1Y7kvmUsBeHhXc02wloi?=
 =?us-ascii?Q?Xj1m9ppqAS1voeXh76+cc0T1S0VGmIjee/6adlYRKy5edbSV7Bu2LaIu0K8f?=
 =?us-ascii?Q?CwbLZzbHuUwrqOQdWTIMZo63Tk+YIXa3dWDuPKC+jVmuvnale6L/7Ei07l+H?=
 =?us-ascii?Q?NUTnAW7e8liSAkhWSv1x6shyQCVVlTr5fANLye2qYUL9oZk4zZW3yrj2AZdt?=
 =?us-ascii?Q?QFblPxXE3sSECgSuzzxptj4aCl4Ls8rElxQaGqmFy+UZMMcv9Za82nABaCuP?=
 =?us-ascii?Q?i4pOF1vSVLdO2bFMcOs9o0GRrI7LTLCCIFADuKJpwqQKWr/V0QkZVM7eEUz6?=
 =?us-ascii?Q?2MLf4ZE0rY3ln27cyYIf6mVIXnuo?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4FsAJFgNjmgAPBzaUY6GGKwTwNt/MJvn5VQ6aNJh40hOm3VZA0HmGxniFOmX?=
 =?us-ascii?Q?T5SVakDvCEz9H5BEiPVWc2QxmfE5IpY6sItYLAsEuAFCZzpfs42OcXPiJfNK?=
 =?us-ascii?Q?JjxcC1PQ13TTt6eqv3G9OKjg4LYCvPv0y6Gau7oCTPxsNsGzt1WcFwdkxdZi?=
 =?us-ascii?Q?S+kiLFyp9pbUDb/uT67LX9iD8HGr8ydpErm0VGUi3kLUCgGSvFBn289PngoW?=
 =?us-ascii?Q?2i3A1MUnoPYV5qbmxvIuoICEsxHdTvWoKs1uQccP8zzZ6bgsQakh5/PBECPI?=
 =?us-ascii?Q?u5ve1soIzeOsJ1FtIKdI5am64mwLezpCbQT/Sunao8mpO+MlHoES9oebi5mJ?=
 =?us-ascii?Q?vEo1ZnO6J7zW/MVuZTDrC5Y+QedG8qsvuNijJbmI7b4RmwF+zOGlcmJxT2qC?=
 =?us-ascii?Q?r+jZISZK6mIs5l7L8x1n+Ql4WFpcgBcWFVSV++eTqbkfquNHbz3IxURf3DBJ?=
 =?us-ascii?Q?3dgnOxuPNi0W0gdEOGb9DRu4vDoaqD9M3PUGrpZ1SiRfxZysCp6W1/JixnTK?=
 =?us-ascii?Q?d1r8oyhfweD3tw7s9/hg6D8vCVSURQVHCsF4BrdhclRAj2wznrmNFcKRdonF?=
 =?us-ascii?Q?s2QAyhafesJKYSbdxmqrVFI74OXUUxefavnvZQhKvRnlID59jVTx1YAMPUOq?=
 =?us-ascii?Q?BVtfJ/++fCq/xck+88FMm923pSMSS0LcY1vOu+N5pw8d56BlNt22y9mQRuyy?=
 =?us-ascii?Q?76OgopusjahGJFOZ1WwPAHWsNjrgex3QKCIMBH/I7Y6ekoNpaF6h8qiYmraJ?=
 =?us-ascii?Q?zNux1WbzHWHuqnyyeaySAHL9SR559HGY/ntgJEAXp3Gucergjvv4Cy+xvlAG?=
 =?us-ascii?Q?ezDsK8N8DDj44BGvh+SWXizLG8ot9GqfN0CvZa6UMo/9F6NKjq0bQFzbfbi4?=
 =?us-ascii?Q?5hPZEBxSU2nBWp6heNXab07g8lJb1+BHnnnhxnSDLXGtY2D1cx3jL095NjOd?=
 =?us-ascii?Q?Wc4B5a/cQHwggZROPa2C20jOUKd3joPnzgGryyBnldmVKcUV9FXg3fXQ024v?=
 =?us-ascii?Q?z8JLTjoPAXneiOHjMLX5ZvTie2VbtH1dDeXL8NhllyuTqNyosSElCdekZMNW?=
 =?us-ascii?Q?oFXuYVVgbAVUItxu74o0KkC/Jnc6ELZSoCc1ZzdKCiYblWGkSG87rY/E6/mN?=
 =?us-ascii?Q?9r+vxeGtQf+28dU/unPaDAqljE8J4znUCiEYr8eJo5kT1Jfg5br/wfuiV1+g?=
 =?us-ascii?Q?O6D4QBJZnXJSy63V1tJCsMYZGC/sWZcVELfpiD8VvJDNJQZZYhe373c1RAOy?=
 =?us-ascii?Q?/XV1z8xHW9NIVk+qM2vDVQmJs4kBpJMoi+xzIzRMPRxx5EB/Zm0f0Mv5sOV6?=
 =?us-ascii?Q?0sMxdQ3OTys/PDcfJ6GObYU44TZPM0CAy2E9hCqlJuHov3KaMWLPniYb+AOu?=
 =?us-ascii?Q?ZSic3dyj8Nyf/Ih5pzyTCUDG6h2jcf0ecJ5w56qkQATgjbgN6UpVwTTnVCZU?=
 =?us-ascii?Q?08QMWcqiWW3BZKKgObqr9WhuyY4BnLZrJ2fgD9VOJTo1Dujz2qXga/WBVPix?=
 =?us-ascii?Q?15+wjXathsO/je5DeBCzYzBmKWpFsUWYTqxvGyauUSL2/Q5CqHRf053N1tUc?=
 =?us-ascii?Q?bragdfEAg8HfOd1vIWm/Ize8WUwu07ZZE/4F1yUgB29w/jDlw2Tr0T8jrULR?=
 =?us-ascii?Q?6w=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f879882a-6679-4a0c-3368-08dd6dd73abb
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 09:02:12.9177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1c+J0dp5IM7yc8DohGxGnCObnui+O5yhvN6ZqpZtmH8ctTjmBeSFDoJNukvhUklQmInPAn0Ks9kLTYs9a8ZwpqS2pBAsneZMiEK0VoykTm8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e66597 cx=c_pps a=nskeBUqQUen4dZUz4TdP1w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=9dNbsytUAAAA:8 a=uDo-SIiEAAAA:8 a=t7CeM3EgAAAA:8 a=dxKa-BUn6MQmpqo9sJMA:9 a=gPpeecpFUKP6j8iU7U-x:22 a=Rkhf4GTZPwEC63LfVcCP:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: StsGY7OR_1nWA3mtk8GxesBAI8bCfxyF
X-Proofpoint-ORIG-GUID: StsGY7OR_1nWA3mtk8GxesBAI8bCfxyF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 09:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116347

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Renew the sample keys to fix the test issue:
WARNING: Your certificate has expired!

The renewed sample keys from [1] contain binary files which can't be patched
by quilt, so archive the files into sample-keys-renew-for-the-next-10-years.tar.gz.

[1] https://github.com/OpenVPN/openvpn/commit/98e70e7

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...mple-keys-renew-for-the-next-10-years.tar.gz | Bin 0 -> 28118 bytes
 .../recipes-support/openvpn/openvpn_2.5.11.bb   |   1 +
 2 files changed, 1 insertion(+)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz

diff --git a/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz b/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz
new file mode 100644
index 000000000000..a79e6e4d1576
Binary files /dev/null and b/meta-networking/recipes-support/openvpn/openvpn/sample-keys-renew-for-the-next-10-years.tar.gz differ
diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
index 810a60308b80..6aed4145ec00 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.11.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
            file://openvpn \
            file://openvpn@.service \
            file://openvpn-volatile.conf \
+           file://sample-keys-renew-for-the-next-10-years.tar.gz \
            "
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
-- 
2.34.1


