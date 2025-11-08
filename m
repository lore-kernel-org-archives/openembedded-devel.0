Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0757BCCFA13
	for <webhook@archiver.kernel.org>; Sat,  8 Nov 2025 14:20:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6410.1762611614675063078
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Nov 2025 06:20:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Km8rFlg0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3407a683bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8EED3A3338466
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Nov 2025 14:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=EENuBli2fU9i3hzBbJWT
	X5aSOcJaVWh+DPyXo1Wgi0s=; b=Km8rFlg0/1MmBkk4Awn3Stf7esPfREZqbLHl
	QSla6g5fRu/S+JsLmcMn0yYYyjTq6aq5GI9vZZWUtV3hPpmRoEsChBZHLzdnwYn1
	o9uoTltyUNQvw3auFGPY2BAJc8SliABC0r1B1go/ddDCs8FFDBFZrX/28JTbYpiJ
	v9MGIsaLIdf5whLDbfNRnTAabO70zUWG01FU1FSODICPYiiSLR1bYCP6o+G8dZkL
	wDxhxNzUbmv/wdxS1x1mT7ss26qeOhRqikABsDVPbqWSU/7qI0lxIAWVgub/yC5D
	+TcJ0wtUGtDvZ7TalPwgH5vMzXdnC9aaVXD/14ZCeuwyNaPNxA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012019.outbound.protection.outlook.com [52.101.53.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x0dyk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:20:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MHO3Y6rQVuNtjNkYO3Jzet8b9lzLIRcB+bQHSNLcEr2IqY20GwoKfKxM6mKOQGt3RJKtyQB7iVZJYnOKKRYkPkRJxZj7k3vAE7fB9U9mpb+NAhkYRfMeps2vEZXhT0NfO8Cfa7WqUk5crMdsRQ3yAM3HV4ZjQtcsz+T+PvmPlJVH8rhOltWK9ZczJ5radIZOiAmq3pFjrrpQ9GIntXGRXbeCkCIbtIXePj3efp+3k79jgC3T7USPnqo6gYbgnc9vVNRIZk3lcr1dTu/fNCTa1QA1eots9EZvbVCO4F6Agw3o9luKuOgBD9Btai3H4zMMwcPsA61zPipNihinFXnKzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EENuBli2fU9i3hzBbJWTX5aSOcJaVWh+DPyXo1Wgi0s=;
 b=KKNxd+6sTk9PCa5tsd6eoFzQ6MMIQVlyC4dJqr4RAL9eE5f3URygWy/+Ol+2anwvLW2yx9vox4+HxKeULYoxCMiW8UwQMSYatw4US3Gtr854nGW0r8wcP+qNAGxKgvfF9ngLPU4vpErKVrlonE13Bx69cSzCK9B5WJuivNncTaLERt7Nxa5WPqlkLooKhZs3BmN6lpjyMCqoguqSkwmlM/bbW1xSSbmftfjPvyF3zcKgiAEEqVw4y/3ltyp6/c109t5xarm2qx12UBB7LBwdPg6VtOQDJI0tG6Cq/qNXeuC5oF7WBCIF1rdxe1aDS1yYB9QrXMDpbm0I61KhIjMMDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM3PPFD5EE188BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f53) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.14; Sat, 8 Nov
 2025 14:20:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.012; Sat, 8 Nov 2025
 14:20:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] ntfs-3g-ntfsprogs: update UPSTREAM_CHECK_URI
Date: Sat,  8 Nov 2025 22:19:58 +0800
Message-Id: <20251108141958.324576-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:405:1::33) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM3PPFD5EE188BF:EE_
X-MS-Office365-Filtering-Correlation-Id: 11009216-c0ff-4767-edac-08de1ed1ede6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MktZ/hRhVJWq6BzIRR3mLfLPMIm4xaL+TJ+D5QMok+1doyJQ0VnFF28NY8BZ?=
 =?us-ascii?Q?qVcmBxxJ7pluxa0aQvNYBiRMEwpBReb6h7ueZgKj5P1YLy15leUs/LXZKUVM?=
 =?us-ascii?Q?cR2tGzlNc0GI/UwHEMLHf+wrkETtPgdU4pe46jWKilaX/DHkojEKueSg4RKn?=
 =?us-ascii?Q?Umh85UtY+um4mJf7iGCiRiPHN4ou+I1IdxLr9Zn5y0N+LO0YDMtHHmvVnVgo?=
 =?us-ascii?Q?bGFJMl+bDOpnFVX+1iR3sdZRJf1Vby7Zc0naO7qE7VHOMbFja18bgwiKfbTP?=
 =?us-ascii?Q?XXvy4Rk+y8eILVjliSHuU2bCdAhVbewUUEATHT+HtiQGlGoBJ37HhBXrB1zm?=
 =?us-ascii?Q?poXKyK6b/rBvuMkD+OISKpST+KaZ3feD28UHhjykl1rFIvt+Wv+gwovKOdpl?=
 =?us-ascii?Q?R95B3r4lFtlYeefAx/vuvQBGB0NGzOP0AsLydBuea/a+HIc8PPh17g174d8X?=
 =?us-ascii?Q?zr4oXc8dhmqp45gHOzeaZupk3Q1MdnGXRFE5l02Ea+zqS2dcOpvQiyJCaWr/?=
 =?us-ascii?Q?X8peJCV6RNyB2SPLO7Dm3Wbbm7bS10d/GajCCxUQkgwh/IQHjlKWSlJIPPU8?=
 =?us-ascii?Q?vCCq985qpGe0Fh/SWSf87+r02dfa521uhf19IAPvDxPxplCvZk+FbCzFFFK6?=
 =?us-ascii?Q?2Yi1+6JgZlGzTR53wTVzLXpLy2TfLQWqdBvgTdNU+gyTmzPlN6yNuyvkQBcz?=
 =?us-ascii?Q?bz6GXR2Ka7rdF5HWfeeoBMrL2+qUCzrpI6/gH2Wi9v8L2qDK7FxLvAEvNdKM?=
 =?us-ascii?Q?g8eQQe7m+lTv4G+dyBh3eaQeO3ejnjCMj9crQdrMHE5RR+SKJq5X8r9z8MgH?=
 =?us-ascii?Q?dmQyVE1urahG095TCqDLvW2NoHFYrMXWvgag4+RLRpJiJUGmp+UgaldDTghu?=
 =?us-ascii?Q?u0Jul2hHcMtMo9YS0JYuf6X2PNNMgl/NkM8mxw2OePhHoZZ/fQiaHHmrVyUL?=
 =?us-ascii?Q?qlpWGck6UopqqQN5HtSmuvKGF09OnkCociUgOT6nBI7QUY++ZdGhbSGYFcLc?=
 =?us-ascii?Q?RWlwWurbLWe1Ogq/+ekF5WNEKDAhCtaYcKSGScs0atAaVjpwzu0nbpXc61Fd?=
 =?us-ascii?Q?pAhM9vE1Q6xwk3SZq+RXHBB1g0obTqa6Io87B0p6OA51Ozj8qOpGKWWtp5g2?=
 =?us-ascii?Q?2VfcKuUVper4eSQizJLnCmdIg0AA+86RrAN7BxWXBvptZyC/z/zdgGMejKXa?=
 =?us-ascii?Q?JQAkcfde4jihNHmprO0qOaU+jXWxJrQFAv2CH1V0k2ITVW8cLqXy65q9L6UT?=
 =?us-ascii?Q?GeCJO5XWjIzUBDZf6SG1clRSN/FgKOcNWBW4x+hnJXpRh9QQB87K/tzxv1wn?=
 =?us-ascii?Q?TwhRRSezOxhnDZ+KzUyuvGaL5ZtCNA+/diBSxtBVfBD/nS4wrDv9o+rL6QDe?=
 =?us-ascii?Q?w5XmdHyJ2TdUwgXQaqI5wRr+YyP8jLhZz6LwvUowwicHQY4Hys/jGuY7XMox?=
 =?us-ascii?Q?Y1ixyE/+CyL7fbSvdCyU3fplY1yaacENb2OVmFaYHTmIiitWZkHeuIlgJZE+?=
 =?us-ascii?Q?9VmaujfSJ1LO5GvoIZXxePdl8rTfgS6RNm5L?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cqA80aa3SImKLQbh4FDl8S10rA7PUh+l0b2zDS7jlbuMlosCD1tlfgZ+UeD3?=
 =?us-ascii?Q?WK/1HNJXh/yKqVYIOr2SOIdfADAYNm2pBIkiZdOhiNNFBmoasvCDpijZev/j?=
 =?us-ascii?Q?unz/6QRA/kvuA3R/qs+nTUVoUg6Yvg9WPRJ88CkyhVnH/WJRVLiIRFEiWMvX?=
 =?us-ascii?Q?tUtB5ELF5eJav56FftOU5V9wspv8M/OiqEua1V6IDJVw5qRSytee6hpRK7mA?=
 =?us-ascii?Q?ZDh1eCgn35hOn8MhwDSUbs/cWY3yUtN6kNFYYALcx2fD5HzmClrDz52E5UnS?=
 =?us-ascii?Q?EElrLg96TDIrg8op3ekF6MXbNGUsf6ZItkgEKO+v+5KDIwLb491P/I7xRkk2?=
 =?us-ascii?Q?aDLs00LltQeCtlN1eUl7PiX5QM8xtAjifcEKTl+2mL6NPuJ4xSE3ZVC4KCdb?=
 =?us-ascii?Q?G06V7ToZ/S05CQvA9F8sGXEnCbtF0Hn6x9flIBNEtnEyolTQC56/4dD2gXxE?=
 =?us-ascii?Q?epyxXkC7uc1aWTCiCz0b53Z69eGVSK/Jzjw7vNb+BoS3HjKPKTWbcqcgExS1?=
 =?us-ascii?Q?ZnG5f2OBbsPz6Nv9sWOBimKhdLKJ6v8+G7+VSeigwCF6xT40no76t+U9Wf8A?=
 =?us-ascii?Q?a0mDI2Er7MO3uPqRJQ4W0fYofcEpM56bvBU4fa4BfhssTd/tcWClsU4eBEwc?=
 =?us-ascii?Q?ITfCOdLVHbQnpbb3onXUOAWmk+u4Bex3oneP0UG2BhqvVNlBVlbKBhs6MgrR?=
 =?us-ascii?Q?NydXFWthmGZ1RkM4nZjQWV6+4mpSbs7FSL9G0IkoJHwSc9hDtq0xQhFe3UDd?=
 =?us-ascii?Q?pNaZzLWSGbWHsDz7da027mtf3VTf+VflVODrc8PtgdbWalquC6oXRs4j4E13?=
 =?us-ascii?Q?GfdBKbUKze+FiWDkShOqYR4xMkV/I0Mv9L9XL3i9oG5HxFlZQxffwUeJwXz1?=
 =?us-ascii?Q?czDFdTna+HK/CawtMiKzY0oop8h9vQIiZyMRKoaa/Que091xteXm2dDotXQ3?=
 =?us-ascii?Q?D+B/7XMNHfh/4We1jY6drDej8xK1hwgtX893OKLb5nDRBavddA78QGAnrAqI?=
 =?us-ascii?Q?2ox70ldVMtDllKvC7SGi0NCB7TZoKnEjgFZCSD5dw1bo1hqqgXEi8whJH1RQ?=
 =?us-ascii?Q?ceAogVHpZm1XumyaEXdZkZ4JDqRFYAejyuNA9BZwQa0Im7A8GocGMHuoCqXS?=
 =?us-ascii?Q?KUE5SBexj+IGcP7C4E7CCGWAYfLI/IvaUvusltO7ZrQ9nKvgCNXnnFrfGa0J?=
 =?us-ascii?Q?Tyu3UVr/f1bJWs556sXi7OOu2aYQr1hIGofVrUFH+KXr+YktRksgNOtKWOH0?=
 =?us-ascii?Q?ZsSXkGl0LDZCrzTd8IvzKtU6OQhdcN4QaNAzIJY+9lGUYvn7zTw/j0A69wgx?=
 =?us-ascii?Q?MLlTbjH+ygNIiy8eZ4FfX25guWGh9MwWFWTgAbxIQXI6+ol9U2pb5/ryEN6/?=
 =?us-ascii?Q?ek35jcjqhKSRJdCv3P8FSb5yMv999Pe1UT4bFcYe0awQnZTSloeRvSijsJ5d?=
 =?us-ascii?Q?lLX12x96/lkvNyyUxizFGL7weOfeOLVlzKAwRiHW7ewYrmW1oFcz2OOj2ey3?=
 =?us-ascii?Q?IbdisL651Px/qa11g0GfGO9Pdl7o7srwV1sGgPkDF85p1YMyGewPdcl3YrGO?=
 =?us-ascii?Q?wMLflAybyvy7/Lr0aE0haMBQUC4/ysL6QfsJ4mfi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11009216-c0ff-4767-edac-08de1ed1ede6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2025 14:20:12.3286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VzQZ6FbrQMKSphq5SnvHFrJHSPFngVYr4xY76GXVSDA9grxX/m88fOYE0SBZ9dXWfPW8DytVSZuPXxHefUFvww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD5EE188BF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDExNCBTYWx0ZWRfX1h8CyjWdlifv
 Lvwx5GdYdG6By939xJGPeGFA5UfEpnOFS9HhuaZVypk5ofqzHtoIYrBGP/9OkLc5VwdcUGN/SJV
 sGOzyX1gYB88yzx8OUw3QpS6j5EqnHmXazMDbNGt6+taut0Wcjy02mqJ7WhlHXFSr34vGovo8xm
 Am55vCXi0RqWF0r39XSz003UZF7xrcV9LGe4BSLdSCn+d2g22ZomkiE23T4Z/cObYMnUNE02Y8m
 dLJmUMkadnqHSVNzUdaNgWdUqJaE2i4hH4A07x/OSFyvm30h16irqnK4ra4ND8S91BkoQqqN0I+
 Xn7cvqbqQTWwFAg3CxqpqfedIRsmkvqZQMlADrqFb8cFB5jYhtsdaGAJlXwT5ARKW0gLNcuPPln
 qeFo2wMyQ1GwJEmvzP99KPYZlDS2jQ==
X-Proofpoint-GUID: KS2KxeEob2wJ_LtIq4C3migaaB1NJIwR
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=690f519d cx=c_pps
 a=zrUOGFyhpnkGsAL0isy7CA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=3DfWnJiXAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=HuSVolzYDvQc5jx9j58A:9
 a=fbZbCd7XTi_oNd1tYRxB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: KS2KxeEob2wJ_LtIq4C3migaaB1NJIwR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511080114
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Nov 2025 14:20:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121388

Update UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version ntfs-3g-ntfsprogs
INFO: Current version: 2022.10.3
INFO: Latest version:

After the patch:
$ devtool latest-version ntfs-3g-ntfsprogs
INFO: Current version: 2022.10.3
INFO: Latest version: 2022.10.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
index 4c7fff8ea9..7cfafcad39 100644
--- a/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
+++ b/meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/ntfs-3g-ntfsprogs_2022.10.3.bb
@@ -13,8 +13,8 @@ SRC_URI = "http://tuxera.com/opensource/ntfs-3g_ntfsprogs-${PV}.tgz \
 S = "${UNPACKDIR}/ntfs-3g_ntfsprogs-${PV}"
 SRC_URI[sha256sum] = "f20e36ee68074b845e3629e6bced4706ad053804cbaf062fbae60738f854170c"
 
-UPSTREAM_CHECK_URI = "https://www.tuxera.com/community/open-source-ntfs-3g/"
-UPSTREAM_CHECK_REGEX = "ntfs-3g_ntfsprogs-(?P<pver>\d+(\.\d+)+)\.tgz"
+UPSTREAM_CHECK_URI = "https://github.com/tuxera/ntfs-3g/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
 
 inherit autotools pkgconfig
 
-- 
2.34.1


