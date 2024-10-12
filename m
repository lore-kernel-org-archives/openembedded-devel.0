Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDE5D1A435
	for <webhook@archiver.kernel.org>; Sat, 12 Oct 2024 06:45:47 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5676.1728715540907127907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 23:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=001582d2eb=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49C6C2d1019047
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 06:45:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427g38g4ms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 06:45:39 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49C6jdTq000664;
	Sat, 12 Oct 2024 06:45:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427g38g4mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 12 Oct 2024 06:45:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCrokFd0iOPZ9LEcG/qh9Ds6ZMOHb3hOBTHDAbjZxw1RnWfXcUUJt/XZJZAeqX3Q0pZt073k2mZ+5COeZH3h3ozvGmWzAFQHgnDv1PGrHrBKjLPxorB09jRt2EzZszufApnMm5dkKlGkyuc3S6GTdtHOY6WpNccuilMtNBUUQfzEsQgp/mTmpJ6cPGW1M4jP1gfKCFn9lFwP2ujlOvl034fNpcRi7I0JcEm6ODznG8kVzjW3Cagxctp/lPd6+pSvmd26O+D5kQoWG82Ae71iwj9jxyjXKNxfAgq1TiBRjkOygMeiPOITJvQS8MnPdUexutBG3Qjosll43Ykz3lHLuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZATsppQ7SM/08EqogKrXqs+X7hZ99OezCSyhmS/+q4=;
 b=hKec2NHAtZtAmacJm27x89pvEDNEKxs+BF660AE6cqez/BQ6sFCSprAFdV3wlgSeURrcrXuoA7g5YOpQz8pNAPYF+HAtu5BiD757p+DXIvi8lfFCZ+P2cSOh3IwVo/PYTGrwHFxSTS5+kYlrCsrCvcCHzaqZUeIuL/P/VUgmZP9yhWuVwUBBB8X8pNdjafa1ehHyCLmNA2r/nk8/w/1n+cwG/QBtXz5r7tees1HvDkvogHfC/q93S/j2ixRVwlMXMs+KdJQQBOot2Z9vict5eNotYREzLspoASArc1eM/lTSsFiIF1+jkjZ++JxXj/2quwOt23U9FvdCYthyY+tcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH8PR11MB6928.namprd11.prod.outlook.com (2603:10b6:510:224::12)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 06:45:35 +0000
Received: from PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840]) by PH8PR11MB6928.namprd11.prod.outlook.com
 ([fe80::4f5d:1d96:e74c:2840%5]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 06:45:35 +0000
From: "Song, Jiaying (CN)" <Jiaying.Song.CN@windriver.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "Zhao, Yi" <Yi.Zhao@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Li, Changqing"
	<Changqing.Li@windriver.com>
Subject: RE: [oe] [meta-oe][PATCH 6/6] debootstrap: upgrade 1.0.132 -> 1.0.137
Thread-Topic: [oe] [meta-oe][PATCH 6/6] debootstrap: upgrade 1.0.132 ->
 1.0.137
Thread-Index: AQHbB25+rv2WbBJDwUqrsVrWc9kjl7KCzypw
Date: Sat, 12 Oct 2024 06:45:35 +0000
Message-ID: 
 <PH8PR11MB6928E4BF2813A15A2028BE61B87A2@PH8PR11MB6928.namprd11.prod.outlook.com>
References: <20240915125153.2940806-1-yi.zhao@windriver.com>
 <20240915125153.2940806-6-yi.zhao@windriver.com>
In-Reply-To: <20240915125153.2940806-6-yi.zhao@windriver.com>
Accept-Language: en-AS, zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6928:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: 5e09ed43-5221-4b97-8141-08dcea8979b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?yVzgTUdxVYgdYbnAM0gq7QjPM6aEiQ9eocw57NI12cR86aoKE6JfeciVgfE/?=
 =?us-ascii?Q?+koMXHRxRJG6FiBhg3VGaTJVxfKssE1dEh82MlxB73gE1ABWqc5N+nXwX+TM?=
 =?us-ascii?Q?HvT+iqO4KEcQHl+B4fQyBj1h08+b88S67+CjQNFAPUW/qHGug+Hhe9Volay+?=
 =?us-ascii?Q?nnmDvCI41Ko72QRUSirflfBgpGdd1FyPZ2JrQHBrFzVOP07oxU350YHnMBdc?=
 =?us-ascii?Q?qQ1SVJSGMVFIOcLMAKT0cQBZJ3xbT4247HpWkRVb85JrIyJCwTW6ZCQARl4P?=
 =?us-ascii?Q?KSES8MtigrhckIfbO1YzttTreK1JqYHJAk38bb+zwDdwf/YcF2gClkGiIkSo?=
 =?us-ascii?Q?GiMyMg7lt6M1g26OO1biQYKJMsRqbxAO8pnzlTdVSDARILcDnfgOcGuNvYkz?=
 =?us-ascii?Q?uSJ5mgV8RFdL5Vo614IuXomkPvKfjUBU+E9E2Eh669RCr7M9AQfO+djt74JX?=
 =?us-ascii?Q?Y7ZlUUeIzwTfuhFKMCic9wLWcMf6UatkUYj/ftIvHqEaaeuLlU7O5nzPK2hy?=
 =?us-ascii?Q?9iuRIe25aiarr3XpUzjUFMPVVt1nyBfTMmKt/pHGN8yHooA3RHQ1LaJN5hwK?=
 =?us-ascii?Q?vK5/hjudB2UcJ8xUvTpOeY+R9y81uHpuOTyE47jHImbZkue8I28UOOKivNJy?=
 =?us-ascii?Q?pQ0r+BgC/wyShDKccdU/VnssrXVDPJN5njWoCqB93bP/M1HvI3iQNZA+zaVE?=
 =?us-ascii?Q?Jve18Tr8MfbLiM2o2GBFZG6O71vx86p5enKw8PBQ2oJurHTYW1upn0+QP/LT?=
 =?us-ascii?Q?5eQymyS/FAJGdarrYwtn6d1a8NbJypjNDkt7Xv1x/6u4VDZS9cuN8jJHTLm2?=
 =?us-ascii?Q?6yGYC3cCToSk69LddzhCuMRjsnjA8JjWNVZVPBH2Nx13ElPqycnd3wjBfC6/?=
 =?us-ascii?Q?pbU1OEUwSFRG7+11klnHT6VR5nO8uwT8urh29rVIUxkxMXStAT+5oY7Q3nro?=
 =?us-ascii?Q?CD8CUXNxhb+wCfI0ZW+ek8GwENKmoGjM2YpIIFhPsqF6X41wJNREx0zmHEI3?=
 =?us-ascii?Q?xLHkqK/vMq1iflAtMEwX82XbdKPyr4O3nCb+Cd4HkYHIAbdHbkEnGiRNhvRl?=
 =?us-ascii?Q?6wR5+Yy3hEHVXrL4F5UoZT/fh2V4HpDuSZT0sZtPP8uNsMTeZN0FnaldgIDa?=
 =?us-ascii?Q?V452SLVw0rsoPnnDmrB9NOj/w63oOaYxQpKoqMw+4uRDhiZiA1OKw9Wjv7Dj?=
 =?us-ascii?Q?zM5HCWkVGmnuXxquIGNEefENQp9Zayq3r84els4DYe0t2mZB/r7slV6g3g+F?=
 =?us-ascii?Q?kj6u89P200/DoSul+eIsCJ1IkSjgbrEnNRBOY1bEJuLLJi4VPr6y3eOR5Leh?=
 =?us-ascii?Q?42o=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6928.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?01if1jLF3wpq6Xl1jpyA1HFMUsEY53gJKRMJ/4S2/G+f59RBWKKx6tzN3lNK?=
 =?us-ascii?Q?cPrcH5rO9rPb4bvP0ESg/8t0EKb2N6lWtzfADP/T0boiZIY8+cULcuDt4eTN?=
 =?us-ascii?Q?g/rQC6koazFghmMGXwHIVoGt9wxRuCECT5gS9hYTq3EGlFg0VAMYJytkyErv?=
 =?us-ascii?Q?nQv4v+sIgnx4Z1npVa17qq+WAuUGmKJxLxmVASic3ap1YNbfvAEAs1m2PVFU?=
 =?us-ascii?Q?2LtyhUL7OEy6r5kNOcIohiVsOZGr9pKkTT/wn2p8FUOnRQYS9kuksGG5IeOH?=
 =?us-ascii?Q?JKGYQYhjZgRZw7Z/6oM3IV33qA5A5UyLYf01js1qIxyzLpSbCTyuqn4PsAB+?=
 =?us-ascii?Q?RJwQsFvyj4crgjCJcYUSaDuj2Hp75Cyknh1XYnIGqoE5kd3pWB4ckZ/PHqpE?=
 =?us-ascii?Q?u5TmNS/pVmPpxt2NS+8enRwmHFP9AL7KtHV+pinosjknRRwgeKPJrepi+PBm?=
 =?us-ascii?Q?4eU/JXTDW5oE0pg6lhda/j9JFGlwycjOOBfbHO4HZTPfC0AOki5sYdRCwN3F?=
 =?us-ascii?Q?39rC8dpqV5ltX9674olFb1LkTln9Cb/OwGGYsd9E8l5EZYSR/6Nrrcl3RVGo?=
 =?us-ascii?Q?+tPjrsW8kEMCpm2Uwlh0iuO12i+vOKTMHG6xMJNPZJtSJ8mwJpB/GKpldJBv?=
 =?us-ascii?Q?j3b0J2RXkNFB/h5GnIdFxNlXWXWfxDrukSDPbUImFDEJgrPsrnn+F34AViOC?=
 =?us-ascii?Q?2Ds7l75w8PQ1k10knTDBqsALJ82RdJ7/7LRD3BtvAlwmIHq9kXwO5IgLn2jd?=
 =?us-ascii?Q?bmU1f0aC14QNabLKXntsxljxwXeNDECe2+V4JGQ4I9baLWgfp7l2tIj3xR3V?=
 =?us-ascii?Q?pxBeTRLIajXgcKjmbgvKnPlAo7I98mZXeANJXpg0Mzvfyw3yOdHVB4KD/Qar?=
 =?us-ascii?Q?k6hEdp4DDFi5wFSmn0SpiIrmCrNbP4ubkd9nGTln/y/Tk07b2/VzET0jBOXg?=
 =?us-ascii?Q?+5xSZwZfynbm3UrdGQ5E0reYBQvt3z+BU7dept6i+/SPxyERucmek9WJ2Q7q?=
 =?us-ascii?Q?kiF6WBVqoUp1SdG1suHxlJnQsrdj05eR25vgiyKoZhJqiw75SzabZNX+xngT?=
 =?us-ascii?Q?lBJf/1SZxbxik8kRTfwUHSCrIX+4xRU2ynGqa5fTKV98ymI/2zIW+l8BMVfq?=
 =?us-ascii?Q?BKvhS3iSE92HmdQk14puc0HhVjNk2kOx6a64XO+E4ujZ+Gkfp3vgY6rIVdTU?=
 =?us-ascii?Q?asKncSQNrJ39cFlKOQW7zVJWf0IDOrfHdFYjoEWK+9nqjwp+xfF2rCg4KCPW?=
 =?us-ascii?Q?hmHF5Y/bT3q+BqDiHXVX2DPEO/kdUYPekKVi/mA0hppu6Xp7JM4YIhUQD9Wp?=
 =?us-ascii?Q?U4Z3tvcdxwxpybVRF2EzMGEdGw7fkHHS7gfYVgaDHvm43HGi36itfrQ2b6xQ?=
 =?us-ascii?Q?rwX1Rdgf1GIzBgFThm2b0+XQTlAVxOFE7FLInOBv8TQaR2Nk/q7ksvxjsBZe?=
 =?us-ascii?Q?YgNyt1dytL5gbPaInG+16qRI8LOcNAgauNtSMH8y22gOttTa3BS9vFp3wugj?=
 =?us-ascii?Q?iE7zpSgtMtbfg7o3XrLpDaFVFnVs/gRCbDoVUx8sxs2tCEv8d1iYClhBKRIi?=
 =?us-ascii?Q?wSPsHe8AGpke8vJZYuhVggUFliECv9U3yYs7fEnjRKrOIQGRBFQQveQb0tnH?=
 =?us-ascii?Q?8g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6928.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e09ed43-5221-4b97-8141-08dcea8979b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2024 06:45:35.2355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMfJjTj4MNjd+h/AUJGfoUje+kX4lfQPJb754ZWl6mXjAO71/3Q2KWyacL2bMswP0g6M3fKdyhWR3yvfwSBCgxKhM9mC+7LjOLVUYXpQbPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
X-Proofpoint-GUID: 3cu7u9jErElc_HBPGJ9iA2v8yPSPVCdv
X-Proofpoint-ORIG-GUID: usPR3qd71_xbIDFC-wwaV1ZS6GEVxLHd
X-Authority-Analysis: v=2.4 cv=DukE+3/+ c=1 sm=1 tr=0 ts=670a1b13 cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=xNf9USuDAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=QZg4Uw8NlMAVgxGFAe8A:9 a=CjuIK1q_8ugA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-12_03,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410120044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Oct 2024 06:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112819

Hi Khem,

Could you please upgrade the version of debootstrap on the Scarthgap branch=
 from 1.0.132 to 1.0.137? The official download link for version 1.0.132 ha=
s been removed, which leads to the following error during the build process=
:

WARNING: debootstrap-1.0.132-r0.wr2401 do_fetch: Failed to fetch URL http:/=
/ftp.debian.org/debian/pool/main/d/debootstrap/debootstrap_1.0.132.tar.gz, =
attempting MIRRORS if available

Best regards,
Jiaying.


-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Yi Zhao via lists.openembedded.org
Sent: Sunday, September 15, 2024 8:52 PM
To: openembedded-devel@lists.openembedded.org
Subject: [oe] [meta-oe][PATCH 6/6] debootstrap: upgrade 1.0.132 -> 1.0.137

ChangeLog:
https://salsa.debian.org/installer-team/debootstrap/-/blob/1.0.137/debian/c=
hangelog

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...rt-to-override-usr-sbin-and-usr-share.patch | 18 ++++++++----------  ..=
.support-to-override-usr-bin-arch-test.patch | 12 ++++++------  ...o-not-ha=
rdcode-the-full-path-of-dpkg.patch} |  8 ++++----  ...strap_1.0.132.bb =3D>=
 debootstrap_1.0.137.bb} |  6 +++---
 4 files changed, 21 insertions(+), 23 deletions(-)  rename meta-oe/recipes=
-devtools/debootstrap/debootstrap/{0001-do-not-hardcode-the-full-path-of-dp=
kg.patch =3D> 0003-do-not-hardcode-the-full-path-of-dpkg.patch} (87%)  rena=
me meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.132.bb =3D> deboot=
strap_1.0.137.bb} (71%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-=
to-override-usr-sbin-and-usr-share.patch b/meta-oe/recipes-devtools/deboots=
trap/debootstrap/0001-support-to-override-usr-sbin-and-usr-share.patch
index 12dd23810..faa66e026 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-over=
ride-usr-sbin-and-usr-share.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-support-to-o
+++ verride-usr-sbin-and-usr-share.patch
@@ -1,20 +1,20 @@
-From 87d0174e8d56e7458dc94f05f82ab7a67a5cf7d0 Mon Sep 17 00:00:00 2001
+From 6c8b0a3f9c09a7a135d95ff18038bcba22e87b86 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 8 Apr 2021 14:06:05 +0800
-Subject: [PATCH 1/2] support to override /usr/sbin and /usr/share
+Subject: [PATCH] support to override /usr/sbin and /usr/share
=20
 Upstream-Status: Submitted [https://salsa.debian.org/installer-team/deboot=
strap/-/merge_requests/55]
=20
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
- Makefile | 12 +++++++-----
- 1 file changed, 7 insertions(+), 5 deletions(-)
+ Makefile | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
=20
 diff --git a/Makefile b/Makefile
-index 8516803..a2d8c00 100644
+index 21a9a39..649f465 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -5,14 +5,16 @@ all:
+@@ -5,13 +5,15 @@ all:
 =20
  clean:
 =20
@@ -28,14 +28,12 @@ index 8516803..a2d8c00 100644
 +	mkdir -p $(DESTDIR)$(sbindir)
 =20
  	cp -a scripts/* $(DSDIR)/scripts/
- 	install -o root -g root -m 0644 functions $(DSDIR)/
+ 	install -m 0644 functions $(DSDIR)/
 =20
 -	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)/usr/sbin/debootst=
rap
--	chown root:root $(DESTDIR)/usr/sbin/debootstrap
 -	chmod 0755 $(DESTDIR)/usr/sbin/debootstrap
 +	sed 's/@VERSION@/$(VERSION)/g' debootstrap >$(DESTDIR)$(sbindir)/deboots=
trap
-+	chown root:root $(DESTDIR)$(sbindir)/debootstrap
 +	chmod 0755 $(DESTDIR)$(sbindir)/debootstrap
 --
-2.17.1
+2.25.1
=20
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-=
to-override-usr-bin-arch-test.patch b/meta-oe/recipes-devtools/debootstrap/=
debootstrap/0002-support-to-override-usr-bin-arch-test.patch
index 69329df4e..5de65779d 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-over=
ride-usr-bin-arch-test.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0002-support-to-o
+++ verride-usr-bin-arch-test.patch
@@ -1,7 +1,7 @@
-From f0420b201f2fb5286ccf5657faa6b38cd2680e10 Mon Sep 17 00:00:00 2001
+From 3fee46c7e50f432fbd5c97c60b918d71c91f1adc Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 8 Apr 2021 14:08:06 +0800
-Subject: [PATCH 2/2] support to override /usr/bin/arch-test
+Subject: [PATCH] support to override /usr/bin/arch-test
=20
 Upstream-Status: Submitted [https://salsa.debian.org/installer-team/deboot=
strap/-/merge_requests/55]
=20
@@ -11,12 +11,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 8 insertions(+), 4 deletions(-)
=20
 diff --git a/debootstrap b/debootstrap
-index 9b9e58d..a3cf3af 100755
+index 552c8d6..11a9465 100755
 --- a/debootstrap
 +++ b/debootstrap
 @@ -51,6 +51,10 @@ INRELEASE_PATH=3D""
+=20
  DEF_MIRROR=3D"http://deb.debian.org/debian"
- DEF_HTTPS_MIRROR=3D"https://deb.debian.org/debian"
 =20
 +if [ -z "$ARCH_TEST" ]; then
 +	ARCH_TEST=3D"/usr/bin/arch-test"
@@ -25,7 +25,7 @@ index 9b9e58d..a3cf3af 100755
  # set $CONTAINER
  detect_container
 =20
-@@ -645,12 +649,12 @@ fi
+@@ -661,12 +665,12 @@ fi
 =20
  #########################################################################=
##
 =20
@@ -43,5 +43,5 @@ index 9b9e58d..a3cf3af 100755
  		ret=3D3
  	fi
 --
-2.17.1
+2.25.1
=20
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-h=
ardcode-the-full-path-of-dpkg.patch b/meta-oe/recipes-devtools/debootstrap/=
debootstrap/0003-do-not-hardcode-the-full-path-of-dpkg.patch
similarity index 87%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-ha=
rdcode-the-full-path-of-dpkg.patch
rename to meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hard=
code-the-full-path-of-dpkg.patch
index 2a5f23316..5cd1ce88a 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap/0001-do-not-hardcode=
-the-full-path-of-dpkg.patch
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap/0003-do-not-hardc
+++ ode-the-full-path-of-dpkg.patch
@@ -1,4 +1,4 @@
-From e735fb23f46f0c3c7a1144ba6b4050bfc0015a05 Mon Sep 17 00:00:00 2001
+From e92554e57b4aae242cb0416025883ccc2c539d2a Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 2 Jun 2021 13:34:35 +0800
 Subject: [PATCH] do not hardcode the full path of dpkg @@ -16,10 +16,10 @@=
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/debootstrap b/debootstrap
-index a3cf3af..5e96c3e 100755
+index 11a9465..17ab05a 100755
 --- a/debootstrap
 +++ b/debootstrap
-@@ -538,7 +538,7 @@ fi
+@@ -551,7 +551,7 @@ fi
 =20
  if in_path dpkg && \
       dpkg --print-architecture >/dev/null 2>&1; then @@ -29,5 +29,5 @@ in=
dex a3cf3af..5e96c3e 100755
       udpkg --print-architecture >/dev/null 2>&1; then
  	HOST_ARCH=3D$(/usr/bin/udpkg --print-architecture)
 --
-2.27.0
+2.25.1
=20
diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb b/=
meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb
similarity index 71%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb
index c28a51749..d4783b354 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.132.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.137.bb
@@ -2,16 +2,16 @@ SUMMARY =3D "Install a Debian system into a subdirectory"
 HOMEPAGE =3D "https://wiki.debian.org/Debootstrap"
 SECTION =3D "devel"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3D1e68ced6e1689d4cd9dac7=
5ff5225608"
+LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3De7b45429ef05610abf91ac=
199fdb3a6e"
=20
 SRC_URI  =3D "\
     ${DEBIAN_MIRROR}/main/d/debootstrap/debootstrap_${PV}.tar.gz \
     file://0001-support-to-override-usr-sbin-and-usr-share.patch \
     file://0002-support-to-override-usr-bin-arch-test.patch \
-    file://0001-do-not-hardcode-the-full-path-of-dpkg.patch \
+    file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
=20
-SRC_URI[sha256sum] =3D "d963a465314ac0e8fd5392573def042e6663e8edf3d08ace4b=
bd0d27ee8431f7"
+SRC_URI[sha256sum] =3D "666927457ee4b0b3e68e55a0efbf3fb69189610b7abbd53401=
7d7032cb3ae833"
=20
 S =3D "${WORKDIR}/debootstrap"
=20
--
2.25.1


