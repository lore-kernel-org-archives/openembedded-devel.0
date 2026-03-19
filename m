Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE3A1075296
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7477.1773914163078181013
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TNMlVXlU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5JhCo2348891
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=kBElKRHvEW4JzYdNrskU
	TTsIGYM60pntPHwjnc8wfxM=; b=TNMlVXlU/HSvI/TvHCKfyOg44T6/XiOWnqIo
	jNQ+ISb+ITUFg5e2QF1zExwsGRA5GvD+I4VzPR/O+F+TBQoMZ8VEAMmB3jw3StDW
	6ZZjNp4J/k1+GUsaZkFWMyxoJy6KOWRgFWT440nGVHhVmhzdNwHE6fGe1W5H+osI
	hvtrsOK5PVl9HCtZRZ3n314ISKx5LusaVntvwJZ9SZOKCmmSoaa7p88FIj7WCf6c
	XUXviopKHM93ZYZxbq2nCcbtN0bzwUa78MDgUmi5PTw6Awa06qfIk/MCt07e5XMd
	iBeFZe2bK1fJRh8JxvY25IQtN77UYdsUeDrI8Zmt+SGDvYcg6w==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y163vx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HtEo3NQZUVSy1mn8NtGWhj/1VEVkphruYUwwkRGRSROqJce/txtA1J2XEOVyW7VTXVpCvafusibZDYyPbb82Q3FiUYkL9gu78KvAEe3GKg27LoOzKhJWwtHXpeq/zBE5ac6RFyqPRzdGCom8j2cDyd0d29wpyDf1+yUyX89BlgR++wcACKJpM6nvQEWYGFEf4JpkmGpvNQSMU6Taco0YzM6jniPTL6Ij6sc2kfTR61CgL7UbnRShgI8uEvJL/atT6nnJmLelNo0TgCxsIxV/Mvdz5/zFX8T3zOWITEfgtLjxB1Ty2LqAJ4qk2bEHbDYpd9P5WQfP9zQh/Hg2HZvxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBElKRHvEW4JzYdNrskUTTsIGYM60pntPHwjnc8wfxM=;
 b=DU0QDkTRjdO9R1qg2qVLf3QJqMSo6ldsG4hVmIMJLHFoTW2gqF0kRQsK1ha00wBJzjv3zQ4fyq0j0+1aFxCj9T7yQsZtjVhLpV48H0sLsZA6f5eTbQnlEjTGvU16FebW6aSmpqK0ifnHih90rnrX+Hbg7yHcMX6VbYJ+Uz82bTP7vjy+9mjCz+k86pGSGusg40fc7+iw72hs3tOG0oPLengb4xt/f4b9W1vsGlCGhSXSd5XfAXXZK5BgmNslk6HTrx9he1VQhfrZPn3YcJ8aCAuFRiiv6gpBhAHEZPHztNl/lMEUIKVvU1Uza3hFso5Khr0RlBdEWcmrFTtM4clDDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:55:59 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:55:58 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 1/9] xfce4-terminal: upgrade 1.1.4 -> 1.2.0
Date: Thu, 19 Mar 2026 17:55:39 +0800
Message-ID: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 971eb8d5-20a7-457a-7526-08de859db85d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	wX5KWgN8b44kvq+7VjqimD0AjvuyRuagv9zyaLNkvxuEAXISRjVsRpib0wPiMM2dz2IXppMCRtSieiMPVS1HFZAnLyRNgqavqAFo8AxEI+t9+jl1sT2cHoZcUA0M6DvNvX7zahzWvwjab0iEII0ZC5Vyeb9PS0hClBEZ0KbdbxVcUKDl8fa2mC0OGItvAOvrrDJWXUCFFYDzMB/rVh8kmFNcN0QFctmcmJ3cA6zSNsdqAcL83PaT4jUeK6IVWISuyR9lKP0/POTUazuDtthvANBBsL6H441WEkY7JJVr0SGbvtF46CjMRW91Ad7Fc9UK2XAVSGajNiRlZfNURiI5e6Td7FlMnt4U3bYzLMuKRDRorERqyuwnX79lbbaDbkIES9aE9gEXvnmNgfQXvsYEs7aWN8tXE92l84ZZ8FMH41dADNlTaZlT+nYN7IceY/bhK3MP7560GYeaUdDd5rniER1kYZe8gphYDOiLTLg7CEtzkYPRdeQrUSwNdoZVmbzthsjPo4IGBbdcNg7cWKWw82XajIxrWPy73CWuykCZrADCQwsl5VIahq5yYiMfW+2lX6VNtuCoBAyP02MshWOKGcpJ9c0khUTiuzoNKGJwa0muRdjMAaksncjkVbv/q93fo5AN9GW1FYyE7HzCN4oC9IXyS0UX9YHDyZ3aJHouOXxzhjxULRBeb0JQy1elBGjIkcu3aWa0KZOApeExp59HbBSvuM2UvAiGwafhV3HWlve8S5wtJugPUPnEVD2lN9s0bPi9gTDznwk3DoWhrwRr6Do3dvwqvEnU3un0oO6IVkw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zkyGONqtpUUhZ8mPZUhDKTXJUeRMLADDltD7t9LNc/PFyVR3ahZp0VeBaikL?=
 =?us-ascii?Q?bTcvkalzHh0x8/1v0PTTqcr2WdWMF7zWskVCfXQobdK/nZW3BQow9i3iuUFF?=
 =?us-ascii?Q?6WluntXmGanyRA4MeFM8BPYqfjCUqcBNW0PNHNH+4ktGevwSSGasE4G679aG?=
 =?us-ascii?Q?StFcsO5pc3UJhlijMn402iP34K9G4HHeA7Ax3GIH2lwj7mUCj+tk/BXBqZG4?=
 =?us-ascii?Q?jAYQIM6V1oNW7X6KkL61hsFEfz1YEkHnlwMpozdgSrHoAwwGdXXDx7BB7R0m?=
 =?us-ascii?Q?n1c2wGYaSdrT3Ms9ZFXL2xPliRzVPyQDvnvYu84QE5fzFVGffp1GYtksYdae?=
 =?us-ascii?Q?0TFv+UhzZcbreMkwyxu4GxP+IRpyj3LLzxkosmqCNE5K3cFHTqvtv4+xTNJT?=
 =?us-ascii?Q?xIfCLRvrTa1GYULZkBGt7YLCaeD2lFnptC9OBnykSSYZG2FmSo4q/+r13Wnx?=
 =?us-ascii?Q?GxOmgHn8cbIstd+NIzb0N2QVx1ccl61NypX5XmMDZyIuwkKX6aqIa8ScmUNj?=
 =?us-ascii?Q?xcDLVljyahuhXiAtAoVLKdwDGUqeIvhqNHF9d0glsAYAEK2SlL9nLqmFqQ7z?=
 =?us-ascii?Q?YtdZdbr6iFYR2FvhfU1gPYLlL9O8+iYmLjt6S1rJabpmBArAuZd2Z1EtpHux?=
 =?us-ascii?Q?MIxqhDDyoD0du+8sZ6Kgiw2x+a2fulMkYfcbaLuGjBH3bjDCKtLKIf1vJwV5?=
 =?us-ascii?Q?FuyYsIW21ToVRJS2fwX6wnOMWUJVM6Y8O3buKoudZ6T33LJcHrsKHI32rPFl?=
 =?us-ascii?Q?mLv091iDfv6qku/ceGTNiQDkQihsAzvcfEOQJb1i2ENWylpyR7ORo2w2ZLln?=
 =?us-ascii?Q?NUlv1apUqawWCWtXu21OnhDHvpUIaJXC7hMVqz9zvmbW8hv7TCqT4IYedO4T?=
 =?us-ascii?Q?rmjg3Fy63NQ/YPs3sRUmzpPZwAXtJu77e2j+HXkZ/KHLoIrMDk0klgexejda?=
 =?us-ascii?Q?rI4iuGfYXsAnwbc+PcFGnBlsrBtWp3ObBvRay6Tv1UWoJNXvjj1/DngSB46T?=
 =?us-ascii?Q?twQ1+SOHtOeULx6mMQMQBlz8Z2YO9Fo52vlCyMG7ceTd3FsUMxSh3KVpzPTK?=
 =?us-ascii?Q?TjXFRsCN2ndi34hk1uJDa/CSgYO9rmsTEHiEewdib/gZN0kDLI2t250v6PTa?=
 =?us-ascii?Q?2IQiB0mEjplnd61lu0SQjSpw9yOn/NKi1ADWgNEhWkjqBgpU/rbZ3xjYHfjO?=
 =?us-ascii?Q?OTvDAd7+hVVsWvpdQPupuCZGUwb556DG+HIUzkLz/j/ABpYVZXlwRub8/qjK?=
 =?us-ascii?Q?FwPzKjKHTy+gboBhzGXgNqNQd0bQVwKWwoy0h9Ilbl7r3CfXx3Yjr7++FJxT?=
 =?us-ascii?Q?kOEBy1wGGAADzidmqazsObn3ge9H1/BjVu0T3lrj6Zdg1lS7HKwdrGDXlio8?=
 =?us-ascii?Q?Y3mfb/0KErsYAAoXGxo/wL6cOU8Su3mis/L/moli+lOhqYtqfKSF6D6NAmUw?=
 =?us-ascii?Q?ErFeSRmwCcNEeoBouGyO76WhLeKM0SIxjeJbxafTo8qMRvkx79OQUBtNOlWy?=
 =?us-ascii?Q?+mAbQwfHpx1FILb0Gbs9NxeCvTFoRhOmqulwDIvHJroeza+hOc2O24lkEXdZ?=
 =?us-ascii?Q?yPgBd/GJW6im84mVlNk+e3KoOV6Itj3WmronoKsPFJJgoZ8xcZ7xn2LA++sZ?=
 =?us-ascii?Q?r8TVIksQllezMlNGprUPOWjaBphSBZGgsB+Auy4/6UG++Zc36Zrye/zaX7yR?=
 =?us-ascii?Q?mmIWs0fzIO5/39JoIRP/HXzccKwXE8HwJqqPudAzkDPSgsG8AroGH2+G9X73?=
 =?us-ascii?Q?/1aTh1W5BcOX5y4He6ebYPvJs8kTOTk=3D?=
X-Exchange-RoutingPolicyChecked: 
	rDKYFyx7hozpBBKVZg9os1wCzsenntkSJEkrSSm7idyvqSlo7g8dVUi+WVmewaF1VRYgpO+0d51KD8VzCKTl74FY+tSsrs1ZE3iYvAR6TOonOIkviF2SmQnvAGkY58mStBwEsOJHcXbL/a3hiRSPd000dZRhj1+/ykXC0LmnuQCqoQVLgHLMsCy1bV1ISVk5qEp5I9/wI+CCgYfM7PmVPwNAQAAyofjtL1O19KNsg6tj5mvlI4EXtgidyD+SuB4qZhs5Wly9FTfjZnksiAc1cU05mK3vDzePu/we1orny6dsyoeQhU17N7nVArRUx2Wyvgi8/41eEnFwMSX6bXoNiQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 971eb8d5-20a7-457a-7526-08de859db85d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:55:58.5655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OHMI/ccc5bozKDUxnlgpFdIXkCylLk5SMKCo3Jjpk3uj0JSWQyKlNRfZpSNj79JeT9JDiybT29f19XiAC9i6Q3hu9X5Z0+2urCn2uSbDtLM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bbc832 cx=c_pps
 a=56WOIFdoL1k8+DRIoLPNvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=J8jsVdYCOt4fcvd2V_oA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfXy0eQVcOJ3jFd
 lJjwgsu2ffaTzpAwvt2nO3q6E5RhiS2MjC8iM7kC1tHbuaDAySGTiEMe3FCukvMRcsVD0xRxCAu
 Zq0hvfkaHCAQY2WfOZjM9XiuliMS1HUB+dswCkTAd5hhBdFbzw4tsyCGLAqVvC9B3zGORK4RxXZ
 GPasiv/dRcn+4vI/oyRZYMpbsm16WKitOPi8IWUzwDVXrOd3F+1J5cLrqTZ149s4bqb3EcqtK8a
 nO8nLoDS0CBMT1njaH/6Jxmfl7UvZFwwwzH64XohcKEnrWRaXBEybymCTIcJKWsWSNZ+a8ORmfV
 5+GjwVSUQPN8bOLlbAhXuj4jZOJwBjq0q+FPCdVpav3cJZXg4zQ8g5hNvOhzYt07TL4ApMwt6mE
 1UyIMuskgI+GOciQbMPZxo1+AtjPRq1lP8ta77vAu+dv+BEybhhw3FgKEuVv+jA9DRJN0H9jcgm
 2R+MOT1uF2syb2HeL8w==
X-Proofpoint-GUID: rg7S7zA4hItlBW1UCvxrRbi7zwNRciWM
X-Proofpoint-ORIG-GUID: rg7S7zA4hItlBW1UCvxrRbi7zwNRciWM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125384

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/apps/xfce4-terminal/-/tags/xfce4-terminal-1.2.0
https://gitlab.xfce.org/apps/xfce4-terminal/-/tags/xfce4-terminal-1.1.5

Backport 2 patches for fix build issue.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...splay-full-path-in-generated-headers.patch | 36 +++++++++++++++++++
 ...01-build-Properly-guard-wayland-code.patch | 35 ++++++++++++++++++
 .../xfce4-terminal/xfce4-terminal_1.1.4.bb    | 16 ---------
 .../xfce4-terminal/xfce4-terminal_1.2.0.bb    | 23 ++++++++++++
 4 files changed, 94 insertions(+), 16 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce4-terminal/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 create mode 100644 meta-xfce/recipes-apps/xfce4-terminal/files/0001-build-Properly-guard-wayland-code.patch
 delete mode 100644 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.4.bb
 create mode 100644 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.2.0.bb

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-apps/xfce4-terminal/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
new file mode 100644
index 0000000000..ef4052af51
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-terminal/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
@@ -0,0 +1,36 @@
+From c1b15e5249fa975308c75f5f9791a444a44f05bc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Mon, 16 Mar 2026 16:48:25 +0100
+Subject: [PATCH] build: Do not display full path in generated headers
+
+Upstream-Status: Backport [https://gitlab.xfce.org/apps/xfce4-terminal/-/commit/c1b15e5249fa975308c75f5f9791a444a44f05bc]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ terminal/meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/terminal/meson.build b/terminal/meson.build
+index e0e109f7..5ff7b1ee 100644
+--- a/terminal/meson.build
++++ b/terminal/meson.build
+@@ -50,7 +50,7 @@ terminal_sources += gnome.mkenums(
+   install_header: false,
+   sources: 'terminal-preferences.h',
+   fhead: '#ifndef TERMINAL_ENUM_TYPES_H\n#define TERMINAL_ENUM_TYPES_H\n#include <gtk/gtk.h>\nG_BEGIN_DECLS\n',
+-  fprod: '/* enumerations from "@filename@" */\n',
++  fprod: '/* enumerations from "@basename@" */\n',
+   vhead: 'GType @enum_name@_get_type (void);\n#define TERMINAL_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
+   ftail: 'G_END_DECLS\n\n#endif /* !TERMINAL_ENUM_TYPES_H */',
+ )
+@@ -59,7 +59,7 @@ terminal_sources += gnome.mkenums(
+   install_header: false,
+   sources: 'terminal-preferences.h',
+   fhead: '#include "terminal-enum-types.h"\n#include "terminal-app.h"\n#include "terminal-preferences.h"',
+-  fprod: ' \n/* enumerations from "@filename@" */',
++  fprod: ' \n/* enumerations from "@basename@" */',
+   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
+   vprod: ' \t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
+   vtail: ' \t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
+--
+2.51.2
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/files/0001-build-Properly-guard-wayland-code.patch b/meta-xfce/recipes-apps/xfce4-terminal/files/0001-build-Properly-guard-wayland-code.patch
new file mode 100644
index 0000000000..4f46e8a8d7
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-terminal/files/0001-build-Properly-guard-wayland-code.patch
@@ -0,0 +1,35 @@
+From b07d9546a08a3cd70b7e9aaad7a86256fbe32b8b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
+Date: Sun, 8 Mar 2026 22:23:34 +0100
+Subject: [PATCH] build: Properly guard wayland code
+
+Closes: #383
+Fixes: ab0136ac39d1eb0849dcfca84bbd91e8562a7176
+
+Upstream-Status: Backport [https://gitlab.xfce.org/apps/xfce4-terminal/-/commit/b07d9546a08a3cd70b7e9aaad7a86256fbe32b8b]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ terminal/terminal-window-dropdown.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/terminal/terminal-window-dropdown.c b/terminal/terminal-window-dropdown.c
+index 6f9e3b48..074a6ce0 100644
+--- a/terminal/terminal-window-dropdown.c
++++ b/terminal/terminal-window-dropdown.c
+@@ -567,11 +567,13 @@ terminal_window_dropdown_finalize (GObject *object)
+   if (dropdown->animation_timeout_id != 0)
+     g_source_remove (dropdown->animation_timeout_id);
+
++#ifdef HAVE_GTK_LAYER_SHELL
+   if (dropdown->set_monitor_idle_id != 0)
+     g_source_remove (dropdown->set_monitor_idle_id);
+
+   if (dropdown->monitor_removed_idle_id != 0)
+     g_source_remove (dropdown->monitor_removed_idle_id);
++#endif
+
+   if (dropdown->status_icon != NULL)
+     g_object_unref (G_OBJECT (dropdown->status_icon));
+--
+2.51.2
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.4.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.4.bb
deleted file mode 100644
index 50adacbcb1..0000000000
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.1.4.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Terminal emulator for the Xfce desktop environment"
-HOMEPAGE = "https://docs.xfce.org/apps/xfce4-terminal/start"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "glib-2.0 gtk+3 vte libxfce4ui gtk-doc-native"
-
-inherit xfce-app
-
-FILES:${PN} += " \
-    ${datadir}/xfce4 \
-    ${datadir}/gnome-control-center \
-"
-
-SRC_URI[sha256sum] = "873c921da1f4b986ffb459d4960789c9c063af98648c9f0ca146dc6f6f5b71b7"
-
-RRECOMMENDS:${PN} += "vte-prompt"
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.2.0.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.2.0.bb
new file mode 100644
index 0000000000..bf31ae516e
--- /dev/null
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.2.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Terminal emulator for the Xfce desktop environment"
+HOMEPAGE = "https://docs.xfce.org/apps/xfce4-terminal/start"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+DEPENDS = "glib-2.0 gtk+3 vte libxfce4ui libxslt-native docbook-xsl-stylesheets-native gtk-doc-native"
+
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
+
+inherit xfce-app
+
+SRC_URI += "\
+            file://0001-build-Properly-guard-wayland-code.patch \
+            file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
+            "
+SRC_URI[sha256sum] = "6874c7b975cc3dc3bd636d57ffec723de7458202defe65377593d3a7e0734b94"
+
+FILES:${PN} += " \
+    ${datadir}/xfce4 \
+    ${datadir}/gnome-control-center \
+"
+
+RRECOMMENDS:${PN} += "vte-prompt"
-- 
2.50.0


