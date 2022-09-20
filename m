Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22ACC54EE9
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 11:25:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.10481.1663673124288262489
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:25:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oaMaUUXP;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=6262b0a03a=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28KAW3Rb005977
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:25:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=8ChDKBZ9WH4lwAN2CUNLA5dPYsbyjGhHFjhmxaJrAxY=;
 b=oaMaUUXPn45HY48BjISCMOiuLFweFy3dG2aa1GjmSd0xvXFKQU4czQedBGpGO9vagyxp
 k43WHEz7SjzTkt0Y4zHdScFFQUH/1PQfQQmmbGd3Mvkh3XiQMnaQHDW2/5vfghQJro2Q
 /OP48sOVdRwN6GJ+QJql30C1oPV92uNmtLQZebZIDvRACo0r8+WVCV5JgBWQGLlBaJwp
 ujY/fOwYUGKL4h7x9fHt8LClUxH+kEWutI/+otSnv5VNIjrUOH8hDW6H/HouhSZJYwMO
 HJSgVZQ8BCZac2G21YWUETrE+l6B1dmyz1TBsPP6FExFkFl374VLiHq9flvXt+Q2fwTf 6g==
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam04lp2046.outbound.protection.outlook.com [104.47.73.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jndrkj5wa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Sep 2022 04:25:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JN+coghO0Rb7beyZYJ9BQgJvfZB1rv/kGt/5hV82AMYeUyvwN08E8lauV5Gfpog4XSBYgkOpMJ3wKCSiOPyzWjqCjtBk9Nh1TnoLoQXFcCJ5pXWfbBAqFf3nFEyOnCWz++WzsPXVXa/rWxbmNyK0yPDD7fFBUdXBBNQvoFdq20TAqfiawdmeJwLS/9azX5zw4yMjxyrkXjkEew7grSWUjXQ9RHGnnAjqPLD+y/2Qn3oglweJW39b851JfdW4Ettay9/ZfrMcf/w7z7JXBNlz5yTscol+HfX3BV8AgHdRQ9POV2IvRH4V7nVgKttTf+PbmmPHNw0RLVAn5ZRhjcP91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ChDKBZ9WH4lwAN2CUNLA5dPYsbyjGhHFjhmxaJrAxY=;
 b=fwXxWV2t25cwl0NllU4V95jsqJkDHPan/HXYuXmlnAghy0eYTfPem2TEC97fLLr1N95LTCUtV6ArDVXlfushO4Hbd2gn57ZkprBQMD0vJUhITXn6qMuCqRGOAQhQw0PvwMeoTVO1rFfjnxyg6E/kNRs2ch8we0I03hwmODqSN1U+BcsLYee2GWwhgeUowoczTjrXom8AY9kIIGxKVABg3jXyM7x7eByJEKw9WCPNtr1gEgtbVx6vOFPuO+mh7cfpsmXDQSQA06HPbk7FvrmJyWvTB4jlMoznNUNaF0nkL+s7PZghfgLqkfsjTtwI48O0YcCp95O6bpZxgU5b7K1Zhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9)
 by BL1PR11MB5480.namprd11.prod.outlook.com (2603:10b6:208:314::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 11:25:21 +0000
Received: from MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::bd56:b599:547b:6895]) by MW3PR11MB4633.namprd11.prod.outlook.com
 ([fe80::bd56:b599:547b:6895%4]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 11:25:20 +0000
From: "Jia, Hongxu" <Hongxu.Jia@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH V2] python3-h5py: fix wrong file driver
 version
Thread-Topic: [oe] [meta-python][PATCH V2] python3-h5py: fix wrong file driver
 version
Thread-Index: AQHYzOLPR3gian32JkejPFSzPgshla3oLX0W
Date: Tue, 20 Sep 2022 11:25:20 +0000
Message-ID: 
 <MW3PR11MB46338FF7276DE8C006BA8543944C9@MW3PR11MB4633.namprd11.prod.outlook.com>
References: <17168B304E0C4C80.10707@lists.openembedded.org>
 <17168D89DE79BF41.15621@lists.openembedded.org>
In-Reply-To: <17168D89DE79BF41.15621@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4633:EE_|BL1PR11MB5480:EE_
x-ms-office365-filtering-correlation-id: 5817b259-9eca-4440-cb3d-08da9afacd67
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kPOgyyAQBe4wUPWMtd3zRFhstnB2kRYJCbOt861cEJUzEZ3NA4kk/jGUGAVgq98rXIEar0FZOrHbD2DgacmwnPoYsxd5xbuZLPjS4d3CeaqhqUDSBtS16jC4aePlmO111szggiKbkjxJ/Gqun0GkgSHRoVAal6w6Du3orMiWY91JbVpLCNPe76uWc2W7Q45PnQr0FlnPXgZx2bI4d91O6DPkgqB3ChPUgzpU918iX6Vyig1VRlCWIlLVJBxJel2BLiBjN/tQJT5ndl1QAJQa3mvbElN11BNkf7UxMktQKpUAa5ga8twmxwyk+yyLixa3o/FWFWnYsoUJ/sz0+/TTAQzgQ9Sa9+MeVwhzx24YpjC6NlLxiFUWQyNfUsR4VvZu8qDLsdgBrtmWjloC1Ck5D13JV+bOR5IW8jDZzXS2LegzRziWqHSqri0Ot0e59b90iCe2UMUwHaMNvQGdbQWqGwlvOrFrdrAm7qRsFGwkt34IhRlyuEVSaZ9SSVQZEJ4gF7qMZz/zZmGXesaZNlp5oZl5pI4Krr51d+y556Ycmjwfi65xppPNOueHSnqcmC+OCPFU0GgYRMjRbrF3r6dZGMsPf4QKo2P9gnhlbVT64PH/KRsw3DlOr+WcrYa8sKIp4Thqk4EiG7/CDeK2yJtWPE5V7JQv4Fm4TJeV8ZdetgI4lpurXnHYkfB4mn8zXEMzz1T4d+ruPt9vJM5plRUuTYGu8UILuBWm+qs20P62TsiSpmg7wJWR7HfPUO0C8en2I39blcbPZ4wOPb+n3XOQ2BCLBgm6Q/r1qWaFFMx//PeLBQnBelWTjB2Ybw6SYrMxxO9ORb/lifyAnBqYuz9OuQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR11MB4633.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(396003)(136003)(376002)(366004)(451199015)(9686003)(38100700002)(26005)(166002)(122000001)(19627405001)(64756008)(55016003)(6506007)(33656002)(8676002)(76116006)(91956017)(2906002)(966005)(66946007)(66446008)(53546011)(41300700001)(38070700005)(7696005)(186003)(5660300002)(478600001)(71200400001)(86362001)(8936002)(66556008)(66476007)(6916009)(83380400001)(52536014)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?65PB0duH/J45RssG80icRf+S3qI18y2woIh5hBiaAqdwlWhbw/lyRTR45/BQ?=
 =?us-ascii?Q?plYKJvPE8xqTu/M7AYTiS5pVAIYw+Kg5wbGuivCKMLNqshnj37isEqKBnqFH?=
 =?us-ascii?Q?VoVh+p/C2ghvfzXH011+OE7QASCTYsipuntOnL5PiQehzsbruiUMdS+rQCKv?=
 =?us-ascii?Q?0tFUrryoO5xHTUdQREIpstn3GTkuFoMWwmy+yDAhHTB+mTqaxeMyxoQQnLZv?=
 =?us-ascii?Q?VfERj5IU+e1TPmEr8Ua/Wbhi5cK4MkU1PTMJ/Tlib9/OFJhUxMmYreMJPEvV?=
 =?us-ascii?Q?mWWhyr+PsGlJw/kSoniagFFk9ceb/lH2YPkuJHuwJBWW5D7z0GRxyVFtcHPG?=
 =?us-ascii?Q?crtF6dIFdHAXvhOfQUX/AvGqPHjDVFsNJbgsEyttE+IrcoqP4kDPAqCfc/Gg?=
 =?us-ascii?Q?9ipTI/gS3ptn/fFVsFmxJgGesEnmOXQdVeKPMWy6at2bCbmQ5B3vEKuxWDFx?=
 =?us-ascii?Q?mHVzqoMZ/px2qE8tIzjzwXi68k+93D3cCfdH1LTVCzbQD8e+DX0lVQX7g1ZJ?=
 =?us-ascii?Q?B31bpSjCFenp7XxIuUCoi9YRKgsAdb7hrYdxRNgVRu6VB/A9td0Dd3AT6R8U?=
 =?us-ascii?Q?jH+n8ZzxMN6TQXJzAsqxAdYhIobx8QdKRMRQ5xtPfkY5ep5eSjWUpIXvA+6g?=
 =?us-ascii?Q?W+WVn+hNm5jsSXnpDkL1Sz3ferrxGysmC0zeIs/FvIUQWR5hsNmW9LCnw4Kh?=
 =?us-ascii?Q?H7fu3ITC8BowPxkn+i7UCuORLXm/WG1NweY+/xDUzpWU+8bgd+Zr/I0YzAyR?=
 =?us-ascii?Q?HNhkfNDxOmuIONQZQJKk1oIIaTx9feua3TRvg8CxzH9528G0ntpXFyXruus9?=
 =?us-ascii?Q?+g6GCDUi8teHxy2RVtdpugpIJbUOn4gdan8fH0q3J/r8Dji7dimdRxq/L//+?=
 =?us-ascii?Q?Nyp31fIjgaRSb1qt3IoVBRvkfUMiv2spcELhvFiflKxJOWNbu5D5hguqYtLJ?=
 =?us-ascii?Q?QNGnY351WwxcRfWaXkIHYV9XoGWt8XtiUUCVd1zYKp4UhEs6PMiqmrn/ksqn?=
 =?us-ascii?Q?pTqLaojmkS1Jcnf2JcGcxtq5A/PQN7pjysGNpwqsoul4scdwxRhecd1O0LwY?=
 =?us-ascii?Q?bfPk1ftfBXCy7uTK/6vbMsPTPwhqRdxy4z0Is/94DG2ARlPKtSYeR1l2j52K?=
 =?us-ascii?Q?XAqm8TSW6k+OO+SkSI/LbfVlsMINAbdvbJtrKUSo8war2hOv3SFdh826/3zq?=
 =?us-ascii?Q?7oG2nZ99nmjw4/yVQjmS8A1Jgun/Q+SHiZoMCiwkq4Sf2gZi8aKv43/JSugJ?=
 =?us-ascii?Q?hh/DJE01eijMcoYJ/zqOWGD9ahJxWuh3trU8vFo1g67DC+5ff0ib88q2GTBV?=
 =?us-ascii?Q?LgrbduWfrEgQ+4nSPs5n2WcZw1YkysEWYzykLv+0QRlsBSjqZQG/kegdxdXw?=
 =?us-ascii?Q?fZfFwyUhiP+lpXgYYF63CxnHGkzcOK/MoWYeNhKOahCBaddHIF1c3coHeuXV?=
 =?us-ascii?Q?0K6JJsvov07DCa5JjmvI059RSULENZy+1lohuhArMV3xBX9BCtPHqPlesulz?=
 =?us-ascii?Q?lRycW2r+ArwVtkCN7PE9Mww5tRNzBR2gXPaeR442UFcCrHJeH6bXdTCeosX1?=
 =?us-ascii?Q?TFdLp7vPR5XmIq9XFDq9hvoA8jirv0igSLd+F1vn?=
Content-Type: multipart/alternative;
	boundary="_000_MW3PR11MB46338FF7276DE8C006BA8543944C9MW3PR11MB4633namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4633.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5817b259-9eca-4440-cb3d-08da9afacd67
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2022 11:25:20.4823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 c7mTvy8yUj4j/Z+HgLd1Y1NcMgy6Ob/oOL3Nhp0wI7K5A5htwlpDdchNSJ4r35I8qy5BJ4i5H4OzuNK/ZrZvfYkBYwQJ7Gxn1gt0oomw8eI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5480
X-Proofpoint-GUID: PyI2tPDFtUg0WDPXUv6o0XEHAjKHzfSj
X-Proofpoint-ORIG-GUID: PyI2tPDFtUg0WDPXUv6o0XEHAjKHzfSj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-20_03,2022-09-16_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209200068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Sep 2022 11:25:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98905

--_000_MW3PR11MB46338FF7276DE8C006BA8543944C9MW3PR11MB4633namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry for the duplicate, please disregard

//Hongxu
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of hongxu <hongxu.jia@windriver.com>
Sent: Tuesday, September 20, 2022 7:18 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe] [meta-python][PATCH V2] python3-h5py: fix wrong file driver v=
ersion

Due to commit [1] applied in hdf5 (1.13.2), import hdf5 failed

|>>> import h5py
|Traceback (most recent call last):
|  File "<stdin>", line 1, in <module>
|  File "/usr/lib/python3.10/site-packages/h5py/__init__.py", line 56, in <=
module>
|    from . import h5a, h5d, h5ds, h5f, h5fd, h5g, h5r, h5s, h5t, h5p, h5z,=
 h5pl
|  File "h5py/h5fd.pyx", line 220, in init h5py.h5fd
|RuntimeError: Wrong file driver version # (wrong file driver version #)

Initial driver version to fix the error

[1] https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735e3cee2077f2e=
108f9463e

Issue: LINUXEXEC-22810
(LOCAL REV: NOT UPSTREAM) -- send to oe-devel on 20220920

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../0001-fix-wrong-file-driver-version.patch  | 53 +++++++++++++++++++
 .../python/python3-h5py_3.7.0.bb              |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0001-f=
ix-wrong-file-driver-version.patch

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wron=
g-file-driver-version.patch b/meta-python/recipes-devtools/python/python3-h=
5py/0001-fix-wrong-file-driver-version.patch
new file mode 100644
index 000000000..2692acde7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-=
driver-version.patch
@@ -0,0 +1,53 @@
+From 5b0b1d0b941ba338d449f9261bdf4cb2b679d048 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 20 Sep 2022 02:53:11 -0700
+Subject: [PATCH] fix wrong file driver version
+
+Due to commit [1] applied in hdf5 (1.13.2), import hdf5 failed
+
+|>>> import h5py
+|Traceback (most recent call last):
+|  File "<stdin>", line 1, in <module>
+|  File "/usr/lib/python3.10/site-packages/h5py/__init__.py", line 56, in =
<module>
+|    from . import h5a, h5d, h5ds, h5f, h5fd, h5g, h5r, h5s, h5t, h5p, h5z=
, h5pl
+|  File "h5py/h5fd.pyx", line 220, in init h5py.h5fd
+|RuntimeError: Wrong file driver version # (wrong file driver version #)
+
+Initial driver version to fix the error
+
+[1] https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735e3cee2077f2=
e108f9463e
+
+Upstream-Status: Submitted  [https://github.com/h5py/h5py/pull/2153]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ h5py/api_types_hdf5.pxd | 1 +
+ h5py/h5fd.pyx           | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/h5py/api_types_hdf5.pxd b/h5py/api_types_hdf5.pxd
+index 6977f1a7..312fdaa0 100644
+--- a/h5py/api_types_hdf5.pxd
++++ b/h5py/api_types_hdf5.pxd
+@@ -237,6 +237,7 @@ cdef extern from "hdf5.h":
+
+   # Class information for each file driver
+   ctypedef struct H5FD_class_t:
++    unsigned version;
+     const char *name
+     haddr_t maxaddr
+     H5F_close_degree_t fc_degree
+diff --git a/h5py/h5fd.pyx b/h5py/h5fd.pyx
+index 04aff077..d41953d0 100644
+--- a/h5py/h5fd.pyx
++++ b/h5py/h5fd.pyx
+@@ -191,6 +191,7 @@ cdef herr_t H5FD_fileobj_flush(H5FD_fileobj_t *f, hid_=
t dxpl, hbool_t closing) e
+ cdef H5FD_class_t info
+ memset(&info, 0, sizeof(info))
+
++info.version =3D 0x01
+ info.name =3D 'fileobj'
+ info.maxaddr =3D libc.stdint.SIZE_MAX - 1
+ info.fc_degree =3D H5F_CLOSE_WEAK
+--
+2.37.1
+
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb b/me=
ta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
index 07128bb03..ce4f05dbe 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] =3D "3fcf37884383c5da64846ab510190720027=
dca0768def34dd8dcb659db

 SRC_URI:append =3D " \
            file://0001-setup_build.py-avoid-absolute-path.patch \
+           file://0001-fix-wrong-file-driver-version.patch \
           "

 inherit pkgconfig pypi setuptools3
--
2.27.0


--_000_MW3PR11MB46338FF7276DE8C006BA8543944C9MW3PR11MB4633namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Sorry for the duplicate, please&nbsp;disregard</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
//Hongxu</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of hongxu &lt;hongxu.jia@windriver.com&gt;<br>
<b>Sent:</b> Tuesday, September 20, 2022 7:18 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe] [meta-python][PATCH V2] python3-h5py: fix wrong file d=
river version</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Due to commit [1] applied in hdf5 (1.13.2), import=
 hdf5 failed<br>
<br>
|&gt;&gt;&gt; import h5py<br>
|Traceback (most recent call last):<br>
|&nbsp; File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
|&nbsp; File &quot;/usr/lib/python3.10/site-packages/h5py/__init__.py&quot;=
, line 56, in &lt;module&gt;<br>
|&nbsp;&nbsp;&nbsp; from . import h5a, h5d, h5ds, h5f, h5fd, h5g, h5r, h5s,=
 h5t, h5p, h5z, h5pl<br>
|&nbsp; File &quot;h5py/h5fd.pyx&quot;, line 220, in init h5py.h5fd<br>
|RuntimeError: Wrong file driver version # (wrong file driver version #)<br=
>
<br>
Initial driver version to fix the error<br>
<br>
[1] <a href=3D"https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735e=
3cee2077f2e108f9463e">
https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735e3cee2077f2e108f=
9463e</a><br>
<br>
Issue: LINUXEXEC-22810<br>
(LOCAL REV: NOT UPSTREAM) -- send to oe-devel on 20220920<br>
<br>
Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
---<br>
&nbsp;.../0001-fix-wrong-file-driver-version.patch&nbsp; | 53 +++++++++++++=
++++++<br>
&nbsp;.../python/python3-h5py_3.7.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
&nbsp;2 files changed, 54 insertions(+)<br>
&nbsp;create mode 100644 meta-python/recipes-devtools/python/python3-h5py/0=
001-fix-wrong-file-driver-version.patch<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wron=
g-file-driver-version.patch b/meta-python/recipes-devtools/python/python3-h=
5py/0001-fix-wrong-file-driver-version.patch<br>
new file mode 100644<br>
index 000000000..2692acde7<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-fix-wrong-file-=
driver-version.patch<br>
@@ -0,0 +1,53 @@<br>
+From 5b0b1d0b941ba338d449f9261bdf4cb2b679d048 Mon Sep 17 00:00:00 2001<br>
+From: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
+Date: Tue, 20 Sep 2022 02:53:11 -0700<br>
+Subject: [PATCH] fix wrong file driver version<br>
+<br>
+Due to commit [1] applied in hdf5 (1.13.2), import hdf5 failed<br>
+<br>
+|&gt;&gt;&gt; import h5py<br>
+|Traceback (most recent call last):<br>
+|&nbsp; File &quot;&lt;stdin&gt;&quot;, line 1, in &lt;module&gt;<br>
+|&nbsp; File &quot;/usr/lib/python3.10/site-packages/h5py/__init__.py&quot=
;, line 56, in &lt;module&gt;<br>
+|&nbsp;&nbsp;&nbsp; from . import h5a, h5d, h5ds, h5f, h5fd, h5g, h5r, h5s=
, h5t, h5p, h5z, h5pl<br>
+|&nbsp; File &quot;h5py/h5fd.pyx&quot;, line 220, in init h5py.h5fd<br>
+|RuntimeError: Wrong file driver version # (wrong file driver version #)<b=
r>
+<br>
+Initial driver version to fix the error<br>
+<br>
+[1] <a href=3D"https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735=
e3cee2077f2e108f9463e">
https://github.com/HDFGroup/hdf5/commit/42b767fc67ad1e13735e3cee2077f2e108f=
9463e</a><br>
+<br>
+Upstream-Status: Submitted&nbsp; [<a href=3D"https://github.com/h5py/h5py/=
pull/2153">https://github.com/h5py/h5py/pull/2153</a>]<br>
+Signed-off-by: Hongxu Jia &lt;hongxu.jia@windriver.com&gt;<br>
+---<br>
+ h5py/api_types_hdf5.pxd | 1 +<br>
+ h5py/h5fd.pyx&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 | 1 +<br>
+ 2 files changed, 2 insertions(+)<br>
+<br>
+diff --git a/h5py/api_types_hdf5.pxd b/h5py/api_types_hdf5.pxd<br>
+index 6977f1a7..312fdaa0 100644<br>
+--- a/h5py/api_types_hdf5.pxd<br>
++++ b/h5py/api_types_hdf5.pxd<br>
+@@ -237,6 +237,7 @@ cdef extern from &quot;hdf5.h&quot;:<br>
+ <br>
+&nbsp;&nbsp; # Class information for each file driver<br>
+&nbsp;&nbsp; ctypedef struct H5FD_class_t:<br>
++&nbsp;&nbsp;&nbsp; unsigned version;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; const char *name<br>
+&nbsp;&nbsp;&nbsp;&nbsp; haddr_t maxaddr<br>
+&nbsp;&nbsp;&nbsp;&nbsp; H5F_close_degree_t fc_degree<br>
+diff --git a/h5py/h5fd.pyx b/h5py/h5fd.pyx<br>
+index 04aff077..d41953d0 100644<br>
+--- a/h5py/h5fd.pyx<br>
++++ b/h5py/h5fd.pyx<br>
+@@ -191,6 +191,7 @@ cdef herr_t H5FD_fileobj_flush(H5FD_fileobj_t *f, hid_=
t dxpl, hbool_t closing) e<br>
+ cdef H5FD_class_t info<br>
+ memset(&amp;info, 0, sizeof(info))<br>
+ <br>
++info.version =3D 0x01<br>
+ info.name =3D 'fileobj'<br>
+ info.maxaddr =3D libc.stdint.SIZE_MAX - 1<br>
+ info.fc_degree =3D H5F_CLOSE_WEAK<br>
+-- <br>
+2.37.1<br>
+<br>
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb b/me=
ta-python/recipes-devtools/python/python3-h5py_3.7.0.bb<br>
index 07128bb03..ce4f05dbe 100644<br>
--- a/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.7.0.bb<br>
@@ -8,6 +8,7 @@ SRC_URI[sha256sum] =3D &quot;3fcf37884383c5da64846ab5101907=
20027dca0768def34dd8dcb659db<br>
&nbsp;<br>
&nbsp;SRC_URI:append =3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-setup_build.py-avoid-absolute-path.patch">file://0001-setup=
_build.py-avoid-absolute-path.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-fix-wrong-file-driver-version.patch">file://0001-fix-wrong-file-d=
river-version.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;inherit pkgconfig pypi setuptools3<br>
-- <br>
2.27.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW3PR11MB46338FF7276DE8C006BA8543944C9MW3PR11MB4633namp_--

