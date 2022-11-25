Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF51C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 19:55:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.55697.1669406110860192230
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Nov 2022 11:55:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RPrZTkz7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8328c4fba4=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2APJrYha009505
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 11:55:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=nmahqnpTUCBnLWv6RlgMC2F83Cl/7VZldWPJUtPQGA0=;
 b=RPrZTkz7R0M1iW3pueDwis5FGU7unAq2au8DAASLxOHw/hRETTBDy7WA4rlO9vcIW9I2
 WOVh5YPmY47lSmGj0+9r3vYD0l1CeQX2ECieJ6Na0hfKzY4f2vdMC5GvKdY9i6xm1wUc
 XlJV+uC5XBKcmycQo0LDzT/PAu5BCaMJXmAssNFziWQXz8TJSArWHJ8KsNNExaqUZrpJ
 JlubijR0OeoeoxJ9GL/cHqTrOjIjFRpZbIpQ09hiVThlnpeGdwDKCWeFYF9teVpb8Z8z
 QvKvVYs8uclPbQesh3yNvDAN9IuJB1J9G/aprY3eA8ti+EtBgVr0odw3UB+xZpqHa2RT xA== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2041.outbound.protection.outlook.com [104.47.74.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxua6d6rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 11:55:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FP9iT1GDwSni8Bn9LEZBQhdqxXtL6jmTX7RqK+zkm5xAewlAiUzpjhdq70xtt0YSTOKoXcLMr2D4Vw+eqMm07zW96MLAMPnwU29X7f06N7KPrqBZ1agCrdmduQMLdKrSkhofAihAAw9OWmJdgp3z3fd9rqKCNO2NZTVaFJDirLOz4OddZIh4MV5ZUOZej3wOZF1u99SfPdvv9HRtHK2iZzy5TvrYET4qrRCEVeEKM2vdxL/v8UgXlDXf6xwE77sJjEelgfeJAE13qX4S6o6OxSQ8iquIDoyIN1cZF8auvHNHIykcnyWDo8E9tkRysgC8YIJZsFc2Cv16niEeERmNPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmahqnpTUCBnLWv6RlgMC2F83Cl/7VZldWPJUtPQGA0=;
 b=mxtLmEEbPWT4YI3s0SJ3sPtAzlmWMbid8sygsO4q7odC+y2o/pIfUNmgc9LoX0u00jIHWC9Yzjh6RWK/S3xeo8x5pLmdO0Dj5ckjHbS0u2zGFw/CJSesqmYIhw0x9qNwDyobPqueyjc8BRsAz6EN2jYf6NFRT4W8/0+qCS0E+47/Vcwio5pnH5ybhEx0OFAENIk4s7lV2lT+nCLWwPUJ5yxqIJF4NVgB5F2LnLfT+xC8vDvYQPkz2jPSuF13MMBbIhbnc3Pun1TcELB1xuDANo95Pk3IvMgvoYq5TIOazWOVT/SkvSI8heTlKLIhwon2LQFlxHlSBpccpLioPTp5lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by BL3PR11MB6484.namprd11.prod.outlook.com (2603:10b6:208:3bf::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Fri, 25 Nov
 2022 19:55:05 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 19:55:05 +0000
From: "Qiu, Zheng" <Zheng.Qiu@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [master][PATCH] python3-inotify: add ptest -> v2 please
Thread-Topic: [master][PATCH] python3-inotify: add ptest -> v2 please
Thread-Index: AQHZAQBzfafeTPWLokqNZLokQc/4b65QDZEA
Date: Fri, 25 Nov 2022 19:55:05 +0000
Message-ID: <06C87C3F-2EAB-4AB5-86A7-80A900C7CFE3@windriver.com>
References: <20221125171044.3649193-1-zheng.qiu@windriver.com>
 <baf5d0de-4416-765b-2dce-117fc97e7916@windriver.com>
In-Reply-To: <baf5d0de-4416-765b-2dce-117fc97e7916@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5536:EE_|BL3PR11MB6484:EE_
x-ms-office365-filtering-correlation-id: 365f690c-9c73-4be8-aed6-08dacf1ef2c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 x8Gj6DOlWrNVzPopngaCK6Mmc/kSxZRBAgxmJa2cIhtNZZ3gTxwiMGhQitoefwhTGTSss1SQXJR4aw4gsvkiY09bvv4wfT0hK0IKLG6X9I9c6MYIKbpUvx3dCfS8h4EPfrDuQI1Fo5vmkfV290magz2Uoj8oUI8ZeBv2j73+uT3oxiqihAwI1GlSkKuSoyTmdTTfZwOw8OOlKTJfgw9KuekwExVbCEoZ8IwuSqRYdbu4ivh8vCOE9D0VqVj+FlLmAL+e7D1yEl2Q/dW96QWEHhHj1b1YERbpoj5FVyh/GrOnmirv9tf4C+WRkTKHISonlSOQt4+nZGxRF5zCGgUs5bLTTuAZZaJ7cfBkusgboSIkiFr6kIMkdj/LSKiLAKZ25K/RTmBdznFxnjVM2GqfyT5AcEes5g3YrOND2TPtaHIc7uTjNdThyYzvOVa6A722ApzopWi0PjFvGE2TDIfTGVJw/0RytNg51rtW/RVJhtBzDmw9FQKwRQtiXf6q7Iy1lbGr/ddesGPu9UvSnELjX/Z8cMVVa8fbabScSIwI0NIYbuprDQ9vrm5jVc53at+/TcC3EQt3RM+TlgGP7/9ZNKE5GvgE6/FHkDagVeOsBPyVnegzpU6s40M3R0uqZmg04f132IeHnGUCq3lmSe+9zp54/S3cs9KrsjGEExhFGNp1tXD0vicOLjaAd7fucjBDjROFypuPfrlsHvgCLFs+51LgolYi8jgtWdRLigKY8pQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(366004)(136003)(346002)(376002)(451199015)(36756003)(33656002)(4001150100001)(4326008)(8936002)(38070700005)(6862004)(38100700002)(83380400001)(122000001)(6636002)(86362001)(8676002)(2906002)(66476007)(91956017)(66946007)(186003)(37006003)(2616005)(478600001)(6506007)(76116006)(66446008)(6486002)(6512007)(5660300002)(66556008)(41300700001)(64756008)(316002)(53546011)(71200400001)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?7uf6WcgsgPtX6coErqH1szhAU5TQwy84ZWu8HhPp504WdNvGkIaGmkiEv9Co?=
 =?us-ascii?Q?aJoEbj+A9T1zIC7+i/KG0exwsgI5mkH8VdqOE7hzC4xZ0HVgl1K0F2uR9Not?=
 =?us-ascii?Q?6+7zS28d3OZWnFnyiqW/zJsHxerfIhPZDRDqVoyjb6YvraUA0LgGK0sa4B6A?=
 =?us-ascii?Q?UjkBehQkjsSjR3n+dFpjeu5L0HH+7JPmGGSuoT4/J5pQK2mPcr5XGkPY5nhi?=
 =?us-ascii?Q?9Pj6ZUsu/6Uf9ucAFxn2cGkqEf/ivJcQ9EeWutOhzYjjej7SxZ+P1btIe0d7?=
 =?us-ascii?Q?doCwBqgB7drC/dyBrr6Gb6T3Vhu3JKKwmjofLXRvL00eHQwkVlMwpXRsDPr1?=
 =?us-ascii?Q?MvQwKee16Qcc/Hu6QUyJh+OmmKtUSEEiwx7hqBrdN101zZj96R5Y+HKCVlgQ?=
 =?us-ascii?Q?OCS8vSLUXG3AsgFQpLZhVcSEP3r0bquof0/nhEnuv/tIfBYnUVKloEeUkXfU?=
 =?us-ascii?Q?lGnLULSz5hZbLqAHOU+oiAS7kRBJ9X1k1KMr9e9cSGu1R+1IKSzaQV+a13Qj?=
 =?us-ascii?Q?Xt9BITz8bE5NHicgJ7YJvXIn2IJgz0XOGNAWX4kUrz05iPArgVO5dFI+lWQA?=
 =?us-ascii?Q?AWWOTKpB5jR55iPPsqczE1PvOXmMD/yVXtrKmqhW9Fs+YjkxZsTC/4x0mOIa?=
 =?us-ascii?Q?MuWgC3xz8fksiYHd5hc/Oq34ufiau+LWrT8U3BcI+ax2naDuVojd2yhsqHPK?=
 =?us-ascii?Q?D+b7Z9cq1cusEF1MEMAdzLtcoE+GtdHDgm54bIndVAGw84jK+WAoeo5D9A6M?=
 =?us-ascii?Q?AsFmN2qkSmv7fXolJaaJosMcgfxX6M//FRFUKZVsPdqtULG10E/9b1ehRYqn?=
 =?us-ascii?Q?2wDoFhY5Zd0EyrhSUBeFF4BZlYLM+BkJVEeCbrBNPaSQ9Nzrzy9i8KR5vcRJ?=
 =?us-ascii?Q?gR4RZ9wqL/pGyFB+8glZ8MzN5xZGwatN45r3mAybl+SmsvwokU8yYC9YUlOP?=
 =?us-ascii?Q?6z1UtQif6YtYOJH1xAvtp8Q+a61Zhj/J4fH51g1+JzASYCj9br9L3jL/FHbe?=
 =?us-ascii?Q?BbixfaSLJqR2+0Qywo/TKFuOFmhplJJbfPpvhvCmBxSB7aifhNUduYSC1nrv?=
 =?us-ascii?Q?VnMNB02NUsaERR7gIHEbUlCAvDwPtSKmlXfH5JOfcrIOJMCuowudrnhh2kge?=
 =?us-ascii?Q?6/EW8+PmYbZYKgcBFoxtIZggIdA78fVhgF3D3l2JBEyShB/fDAuP9z7DttA+?=
 =?us-ascii?Q?RqKXxPHqjWojgPvy5tmvHFNiT7WNGInhSe1JVInCa67JQlRDvI1w3VhOeAA5?=
 =?us-ascii?Q?JOH91KELW5cTeOPsS4uvR1KhKAw1pNDXfcJ6qfztdCsB1hnYP3XUlz8BdnXg?=
 =?us-ascii?Q?pnlIit+r8ZcTaza6Qn0XSbFfXdRnYwIUoOIldCn5+SwLWB7Pl+DYAEP8itxU?=
 =?us-ascii?Q?VRZBg3vou/huP7ErPwStfPmGgUXYOCgU5IwX5jYdBwSAjz8OmlV5MoYBcUzi?=
 =?us-ascii?Q?m770/1zaYNZvT4H2WB4AcjvPRWGCacLDvFDX/umlaOOmxfRC2Qi3z9yaL77x?=
 =?us-ascii?Q?E1H/fEYy3YQy8F9mRpPcqUzM3Il0ZRIwi7wqjHAkdttV0g8v7gvzfniesvEX?=
 =?us-ascii?Q?CX63Scvt/gh6FTpQusjI1rEqftvj2iLGtVrdL1GzQC+lMPprtZ9+8740gjgG?=
 =?us-ascii?Q?uQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_06C87C3F2EAB4AB586A780A900C7CFE3windrivercom_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 365f690c-9c73-4be8-aed6-08dacf1ef2c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2022 19:55:05.5004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUmbGbKsLj+xBzgmlmEj87+ywjICLQe5pjBNAkCMps5G2bhP43AD8JWNtuLQ7TT3T6z38ZJuMJyo0aEdzye8hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6484
X-Proofpoint-ORIG-GUID: lmS1NKYYvTfQOK7mq-N5zL3zr2X7u7n0
X-Proofpoint-GUID: lmS1NKYYvTfQOK7mq-N5zL3zr2X7u7n0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_10,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250153
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Nov 2022 19:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99739

--_000_06C87C3F2EAB4AB586A780A900C7CFE3windrivercom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


On Nov 25, 2022, at 2:02 PM, MacLeod, Randy <Randy.MacLeod@windriver.com> w=
rote:

On 2022-11-25 12:10, Zheng Qiu wrote:
Add ptest provided from the source code, and run it using pytest.
Super, can you add the ptest result summary in this log.
If any of the tests are failing also add upstream issue links.

Sure.


Since the tarball provided with pypi does not include ptest, switch the
s/does not include ptest/does not include the test code/

Okay.


source to be its git repo.

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com<mailto:zheng.qiu@windrive=
r.com>>
---
 .../python/python3-inotify/run-ptest          |  3 +++
 .../python/python3-inotify_0.2.10.bb          | 23 ++++++++++++++++++-
This should be renamed from python3-inotify_0.2.10.bb to
something like python3-inotify_git.bb

OK.

 2 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-inotify/run=
-ptest

diff --git a/meta-python/recipes-devtools/python/python3-inotify/run-ptest =
b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
new file mode 100644
index 000000000..3385d6893
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-inotify/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g'|=
 sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g=
'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=
=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'=
| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" || $NF=3D=
=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb =
b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
index 524c3a0d2..3306438a1 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb
@@ -6,9 +6,30 @@ LIC_FILES_CHKSUM =3D "file://setup.py;md5=3D79b7ec72aa0d44=
6a552d3cceb5799e41;beginli
   SRC_URI[sha256sum] =3D "974a623a338482b62e16d4eb705fb863ed33ec178680fc3e=
96ccdf0df6c02a07"
 -inherit pypi setuptools3
+SRC_URI =3D " \
+    git://github.com/dsoprea/pyinotify.git;branch=3Dmaster;protocol=3Dhttp=
s \
+    file://run-ptest \
+"
+
+SRCREV =3D "f77596ae965e47124f38d7bd6587365924dcd8f7"
This is the current head, which is fine but add a note in the  long log
about that choice. It's
$ git log --oneline 0.2.10... | wc -l

14

commits ahead of 0.2.10


Will change it to the head of 0.2.10


+
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3 ptest
+PIP_INSTALL_PACKAGE =3D "inotify"
+PIP_INSTALL_DIST_PATH =3D "${S}/dist"
Mostly harmless, I suppose. Any pippy pythonistas want to comment/explain?

Since this recipe does not inherit pypi anymore, setting this would help wh=
eel build.

+
   RDEPENDS:${PN} +=3D " \
     python3-ctypes \
     python3-logging \
 "
+
+RDEPENDS:${PN}-ptest +=3D " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+}

v2 please.

--
# Randy MacLeod
# Wind River Linux


--_000_06C87C3F2EAB4AB586A780A900C7CFE3windrivercom_
Content-Type: text/html; charset="us-ascii"
Content-ID: <4E7862ECF6A6D145A77BEAD896FF7147@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
<div><br>
</div>
<div>
<blockquote type=3D"cite">
<div>On Nov 25, 2022, at 2:02 PM, MacLeod, Randy &lt;Randy.MacLeod@windrive=
r.com&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-widt=
h: 0px; text-decoration: none; float: none; display: inline !important;">On
 2022-11-25 12:10, Zheng Qiu wrote:</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;">
Add ptest provided from the source code, and run it using pytest.<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Super,
 can you add the ptest result summary in this log.</span><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">If
 any of the tests are failing also add upstream issue links.</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-de=
coration: none;">
</div>
</blockquote>
<div><br>
</div>
<div>Sure.</div>
<br>
<blockquote type=3D"cite">
<div>
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;">
<br>
Since the tarball provided with pypi does not include ptest, switch the<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">s/does
 not include ptest/does not include the test code/</span><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal=
; text-align: start; text-indent: 0px; text-transform: none; white-space: n=
ormal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">
</div>
</blockquote>
<div><br>
</div>
Okay.</div>
<div><br>
</div>
<div><br>
<blockquote type=3D"cite">
<div>
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;">
source to be its git repo.<br>
<br>
Signed-off-by: Zheng Qiu &lt;<a href=3D"mailto:zheng.qiu@windriver.com">zhe=
ng.qiu@windriver.com</a>&gt;<br>
---<br>
&nbsp;.../python/python3-inotify/run-ptest &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| &nbsp;3 +++<br>
&nbsp;.../python/python3-inotify_0.2.10.bb &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;| 23 ++++++++++++++++++-<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">This
 should be renamed from python3-inotify_0.2.10.bb to</span><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">somethi=
ng
 like python3-inotify_git.bb</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; font-variant-c=
aps: normal; font-weight: 400; letter-spacing: normal; text-align: start; t=
ext-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; text-decoration: none;">
</div>
</blockquote>
<div><br>
</div>
<div>OK.</div>
<br>
<blockquote type=3D"cite">
<div>
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;">
&nbsp;2 files changed, 25 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta-python/recipes-devtools/python/python3-inotif=
y/run-ptest<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-inotify/run-ptest =
b/meta-python/recipes-devtools/python/python3-inotify/run-ptest<br>
new file mode 100644<br>
index 000000000..3385d6893<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-inotify/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g'|=
 sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SKIP/g=
'| awk '{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=3D&quot;FAIL&quot; || $NF=
=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&quot; || $NF=3D=3D&quot;XPAS=
S&quot;){printf &quot;%s: %s\n&quot;, $NF,
 $0}else{print}}'| awk '{if ($NF=3D=3D&quot;PASS&quot; || $NF=3D=3D&quot;FA=
IL&quot; || $NF=3D=3D&quot;SKIP&quot; || $NF=3D=3D&quot;XFAIL&quot; || $NF=
=3D=3D&quot;XPASS&quot;) {$NF=3D&quot;&quot;;print $0}else{print}}'<br>
diff --git a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb =
b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb<br>
index 524c3a0d2..3306438a1 100644<br>
--- a/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-inotify_0.2.10.bb<br>
@@ -6,9 +6,30 @@ LIC_FILES_CHKSUM =3D &quot;file://setup.py;md5=3D79b7ec72a=
a0d446a552d3cceb5799e41;beginli<br>
&nbsp;&nbsp;&nbsp;SRC_URI[sha256sum] =3D &quot;974a623a338482b62e16d4eb705f=
b863ed33ec178680fc3e96ccdf0df6c02a07&quot;<br>
&nbsp;-inherit pypi setuptools3<br>
+SRC_URI =3D &quot; \<br>
+ &nbsp;&nbsp;&nbsp;git://github.com/dsoprea/pyinotify.git;branch=3Dmaster;=
protocol=3Dhttps \<br>
+ &nbsp;&nbsp;&nbsp;file://run-ptest \<br>
+&quot;<br>
+<br>
+SRCREV =3D &quot;f77596ae965e47124f38d7bd6587365924dcd8f7&quot;<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">This
 is the current head, which is fine but add a note in the&nbsp; long log</s=
pan><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-si=
ze: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; text-transform=
: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: =
0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">about
 that choice. It's</span><br style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-text-stroke-width: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">$
 git log --oneline 0.2.10... | wc -l</span><br style=3D"caret-color: rgb(0,=
 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-v=
ariant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">14</spa=
n><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">commits
 ahead of 0.2.10</span><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
</div>
</blockquote>
<div><br>
</div>
<div>Will change it to the head of 0.2.10</div>
<br>
<blockquote type=3D"cite">
<div><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400;=
 letter-spacing: normal; text-align: start; text-indent: 0px; text-transfor=
m: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width:=
 0px; text-decoration: none;">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;">
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit setuptools3 ptest<br>
+PIP_INSTALL_PACKAGE =3D &quot;inotify&quot;<br>
+PIP_INSTALL_DIST_PATH =3D &quot;${S}/dist&quot;<br>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">Mostly
 harmless, I suppose. Any pippy pythonistas want to comment/explain?</span>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
</div>
</blockquote>
<div><br>
</div>
<div>Since this recipe does not inherit pypi anymore, setting this would he=
lp wheel build.</div>
<br>
<blockquote type=3D"cite">
<div>
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;">
+<br>
&nbsp;&nbsp;&nbsp;RDEPENDS:${PN} +=3D &quot; \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;python3-ctypes \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;python3-logging \<br>
&nbsp;&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot; \<br>
+ &nbsp;&nbsp;&nbsp;${PYTHON_PN}-pytest \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+ &nbsp;&nbsp;&nbsp;install -d ${D}${PTEST_PATH}/tests<br>
+ &nbsp;&nbsp;&nbsp;cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/<br>
+}<br>
</blockquote>
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">v2
 please.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helveti=
ca; font-size: 12px; font-style: normal; font-variant-caps: normal; font-we=
ight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; text-decoration: none;">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">--<span=
 class=3D"Apple-converted-space">&nbsp;</span></span><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; te=
xt-align: start; text-indent: 0px; text-transform: none; white-space: norma=
l; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none=
;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">#
 Randy MacLeod</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: H=
elvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0p=
x; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-te=
xt-stroke-width: 0px; text-decoration: none;">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 12px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;">#
 Wind River Linux</span></div>
</blockquote>
</div>
<br>
</body>
</html>

--_000_06C87C3F2EAB4AB586A780A900C7CFE3windrivercom_--

