Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43551C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 08:42:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.14238.1671612115195566180
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Dec 2022 00:41:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=oT/Tek+e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9354b462db=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL7MRPc028001
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 08:41:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=bYgIH5y+jJ+ZRb2dW04HxWo51S7eTAFok07Dbwz7dAw=;
 b=oT/Tek+eLYu9QKnqoVY+OnUHQDTYRFegP/DVsx78yXut5JkyrAHLX7d/X6a2qeEFKi0g
 zUU17c6485AIHbQIkr3JUtWzCJEK+tV+iejja29JTMJ0ws8g+TB4TVM+CWxNC78rIaQu
 phUqZBupe2xhvuTPXQ1ZVb15qYNJOZASRAVWqXTIJHNksnF6lqJoOcfNFNKj0AWc+A/K
 ityWMNRlYqMRxgz+rf1ko/+F7eXioVIO3wmBmgy5NB8IPX1wZEgrb3AOFsFJ9FeEPUON
 IFWOsapThHy44pec8/v72SIzJzpkmzh6ixXJAb35GYAJCHyi2x+10ZKM1Dma5zj3jPhx 2Q== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mh4r9b0cb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 08:41:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CD7HqWWz4me/sOetHWc7gwPLAXWR0fv7XS761tsxFsHoWspkEjj9VF5sgybuS7OhBR71R3SAUcxZlnwAYsxOydtg8zSnV5XYTA039HK+VdK4pFkkyQTI4+EXv1rNAbG+JIQzFZ6Y17IRAwCobWZjzwcsAk/TtcwL+nMbQ14Bh2JsjaZIlrj/V+44tTLvUV04mnqQ1xopc7gVJl7kwXf+F5ZKeBegr+DJhj3bQFxnqloF0XDTB8mu8kinZc5G6HqRsT3cxjaUiJMHlsvzjdMMXpHL4Sj93CdvWSilwVzb6RLmHX3xnQA/QuTsTtQ7M5oc2ZRanqMkVVIHMCblGVLA+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYgIH5y+jJ+ZRb2dW04HxWo51S7eTAFok07Dbwz7dAw=;
 b=LQ81KM4AXkgfol7tbK3wKMBP4O4miMg92QyVdcE24ToxWJ/s6v5MpfD5VMQMysSCD6PoqjeZY2u56t5RcAyUZLyiTWC4ihmLN39/S7vnQIav0cL0ZXy/bdmYvDNujFkbe7Vo8tILOOXAkHMvGgidKq4CGMSdYW7FDTQCRthqL7P8uhz0/pJ93yy8/RID03ADo8YeqUK7Bc0slJ7b4voSPZ2xNOZpWDzGZKcQRMHoUedeiTizN1sg0jphjidF/colNepAc1URp4aaBBGhCMasxadQZW2it/i1EINP00Ty6wWbcQnnr4+NXXxMk4QXoUtfnYlfi7pqfZhQQyxgu2Fk3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33)
 by DS7PR11MB7808.namprd11.prod.outlook.com (2603:10b6:8:ee::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5924.16; Wed, 21 Dec 2022 08:41:51 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::e0ff:22f9:8a29:4955]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::e0ff:22f9:8a29:4955%7]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 08:41:50 +0000
From: "Urade, Yogita" <Yogita.Urade@windriver.com>
To: "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Chen, Qi"
	<Qi.Chen@windriver.com>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: RE: [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-41973
Thread-Topic: [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-41973
Thread-Index: AQHZFQp3w2QoF9YjVEaCCIzFXb3SgK53+/oAgAAEtJ4=
Date: Wed, 21 Dec 2022 08:41:50 +0000
Message-ID: 
 <BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9@BL0PR11MB3410.namprd11.prod.outlook.com>
References: <20221221070408.1871070-1-yogita.urade@windriver.com>
 <MW4PR11MB5822338B5148FFBACF96864284EB9@MW4PR11MB5822.namprd11.prod.outlook.com>
In-Reply-To: 
 <MW4PR11MB5822338B5148FFBACF96864284EB9@MW4PR11MB5822.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-IN
X-Mentions: Qi.Chen@windriver.com
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3410:EE_|DS7PR11MB7808:EE_
x-ms-office365-filtering-correlation-id: b0eab52e-95d1-4a48-d556-08dae32f3449
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ETcswK9V58njoMqa78yp5U8QaXVEydeio+wcyxq9HYyjehBUO0uADtcpeFkhMZNHvB3lbUjhk/MwQf8S4yaWHiKhRmd3jKq/v7Khl80GmUsANdjIywazP1HTJV9IXKQbHTZEl54zdXpDRT2TIx0Ehyq5NxAe9gIc6X2WRlYJa7mq+FTqYgJYOSl1kWIMuWSal3ZVrShfF471U2t93ccv5IwjNmTtNEnaSy4GgZlEV6gnCzGLroFKnqLV1qIbeoi0hKHJCAZ3haIunETOFWwo7u+6B5tratfIt50q9zEs+4PlIKxBQkY/7KX3vxCVTZBo9PCyjmgyqTE0by0omPIs7ZaF7uateAiY6A+h0Yi6Kr8lvagNNfN8IzO0nDHiLOT7KWQ2TfaQssBoq4+3IAfvAG1tnyDjsEYuDifm5XY+y98v/kheWlXWIpXOOTS/76jIJiSvsERBuMTTpa4dNGUrNea6ILnmMJ+7Y/yrGWg+EHW5jJHjlIg3FegOciaH/3FHnMShlTn9sw3MRl3z4Wm5+52CVaRkXcsucCj9QnlJ9aAkCRtZBpTJSoO9/G3FOWLinPE99ooFAgySzDzHIe9elozHvkg5X3ofdNYzw/KcjcRRelq/Siw5iBaHWmoCRHED6SiJCiJ4VxfOtuWdaWga0fxauQSF1GzS9Ouad1Xwj0bsF5dXsVIQeVRVR5GJIczZjrM68CZkWNKIpn7oHseJJA2pCOj9QzkL2tOG4ZJLpb6214uEQhgM+QMPCS0TF861
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(366004)(39850400004)(451199015)(41300700001)(8676002)(4326008)(2906002)(38100700002)(83380400001)(122000001)(99936003)(9326002)(5660300002)(8936002)(38070700005)(166002)(53546011)(52536014)(7696005)(6506007)(107886003)(478600001)(33656002)(966005)(55016003)(26005)(91956017)(66556008)(6636002)(110136005)(66946007)(66446008)(71200400001)(66476007)(316002)(76116006)(64756008)(9686003)(86362001)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?qq+RREfz6PTOzTOnnXZ1QQvQjijOKEuW9Z7vmCQuN8aWXNUOzVYWUXhWcXHi?=
 =?us-ascii?Q?HOo+/OcqwJ2lC8KnA0hokLM0c3YQV8An3Nj5OoXYOD0VxIG7oT598ANU25or?=
 =?us-ascii?Q?OPEUVVWYLlpbMW0ckqUgrXpM6trJBqWLolnq0u05vClAsdYubr97wdSyUgvr?=
 =?us-ascii?Q?2xaNR28VBi3Pj2gqRT2GLdxbANWxWpimvqNKDsIb1AJRbfOBq3jZXaW+ebaX?=
 =?us-ascii?Q?4nySQah2sZ5dI7ts3jViMApHNUbwA9jJMmDnahgPNHqa0jOEq4OPVkDkioU/?=
 =?us-ascii?Q?atpSVOD7lN9TvlLx/dXpCDc+F5clohYFkJZY2tNvBdeWEpK2/0wY8SMlRzhc?=
 =?us-ascii?Q?9CcTwNIJQocPAYhL7g7JqcRDATByNyxdy3TcDUO+sYnMa7p0eXKai/wN9cPt?=
 =?us-ascii?Q?tJ6CoaR/9eqgnZgaEHEcOUoF151CFt94pBXI9VVLSO/gzluwnaXvZWsfmL11?=
 =?us-ascii?Q?yG5MXyJQFAgwIkwK8VRfBuD3AXlreM0+K8++frOxfgsPtAdJut5A1zRMi/Xm?=
 =?us-ascii?Q?zd/zwC07O3nqLAve9MVGwYBLqZolnkbjuQEJk5+eugLyAFKyTz3CNat6Fhsk?=
 =?us-ascii?Q?Yj75bxeUPGqfEP2LvZIxWB2T8aEwXqDZBOi5S6mOYgybTT4BJfu8T934n9bR?=
 =?us-ascii?Q?XtMaOVFtpIcTwoSA49IGobozIZ9jInPBuwUJpNGNLZ/1pDWiUKjzZQPcs9NB?=
 =?us-ascii?Q?S2UyRWFVI+sMJE4N0wCxHlJ5BzXuwOi7+aF3NqHlk72h6VXYpO7/X4ww/3SY?=
 =?us-ascii?Q?vRLUgga0EETmmF8BVgK+4hE//6UOLTz3VK3YApZlJdta/6XUYuTUbOA1dExw?=
 =?us-ascii?Q?T6Csy4Kg3rWdZKgXcGSO7PULhQ6K/iwc2dkcg7GwQ99sR5mY4G0jnuoYjJ1u?=
 =?us-ascii?Q?QjRHxUdUW8o1h0vRQi922PNwTiQoO5wBjo8rgbsktQMdd2XhtBjdL1jKJrHS?=
 =?us-ascii?Q?QKex0TYOyJX0Ry+RBqREzxrcfdMcyehvurss5Vl6SdLt9kZbgdzH+sQ7LUkp?=
 =?us-ascii?Q?JLaKvAYTyfjfKczW+yjWAPv6VLsvs7hTXymKWCRWh1DP1eua2lTb9K68De1L?=
 =?us-ascii?Q?Aj+WbrDf9ZYZPPXoyiK1uULi23EuL+rMqZ1UMMrEgeM6iis/uS+bFTk07CAL?=
 =?us-ascii?Q?YRH9xUQTkhFJeFBWfvpXexGc6R9pKiS+fEkLi69puQJfsV3jW7NsoIVhyrOO?=
 =?us-ascii?Q?rCxQgpNKjq3yTSCg/B78v2di5TyuxtrnltpxiyH/GWYhkp0gRzrfdoy7TNiU?=
 =?us-ascii?Q?IaKElDDAGn3iCJhKn5n7C/SPQ/QvkIbuJktncc4xsD3ZR7abHcK1xKwagDAl?=
 =?us-ascii?Q?nZTcvCGBve6ZffqPjPjCZ3vlLojCDadPogUnhh0LB8VyHpFG8OMhntvQjI3x?=
 =?us-ascii?Q?ukToeRbz4s+hBl+ulColBGlAk8Wf4+zRYqjlimA83DPS8OCrz7rA4Mjqu/2m?=
 =?us-ascii?Q?OC8ezLacCYR+eTgrLasypYYeFrqm3Uru/KyCRTcEM6mNgcN+OMdpECj2YYKi?=
 =?us-ascii?Q?tgTV8PuIbVZ707bhuf1JBdddzanJKgTK5VtnlvEg0uRjf9qGHR1+2qPBxV/o?=
 =?us-ascii?Q?SqYtop8diXCVKZ+CaDZE0TntLoUVfMQU6RuL/1yj6jnjTMl8ym273sGHBfl1?=
 =?us-ascii?Q?jU0dsRmNnbLG19H8ru8RESg=3D?=
Content-Type: multipart/related;
	boundary="_004_BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9BL0PR11MB3410namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0eab52e-95d1-4a48-d556-08dae32f3449
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2022 08:41:50.6099
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zm31RiLgbiW9rJLoZIfXKiTyXyC42QZ3K1QBMdr/QNYH/9ULPk86JHzd9B1wh5lZL9jKY/fALqcDQ8+r0uGSbJPPAgibrR/uCDmKzZnLexU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7808
X-Proofpoint-GUID: 0N7PPwAKZ2lVLjy-Eiyp5iHPeVaFf7WV
X-Proofpoint-ORIG-GUID: 0N7PPwAKZ2lVLjy-Eiyp5iHPeVaFf7WV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_04,2022-12-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 08:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100176

--_004_BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9BL0PR11MB3410namp_
Content-Type: multipart/alternative;
	boundary="_000_BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9BL0PR11MB3410namp_"

--_000_BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9BL0PR11MB3410namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Archana,
The same patch which I sent on 19th Dec,  for the kirkstone branch, in that=
 I added the CVE ID & upstream-status.
But @Chen, Qi<mailto:Qi.Chen@windriver.com> suggest me to remove that becau=
se it was  already added in the patch.
This is same patch, only difference is that this is for the master branch.

Regards,
Yogita

Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s

From: Polampalli, Archana<mailto:Archana.Polampalli@windriver.com>
Sent: 21 December 2022 13:35
To: openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@lis=
ts.openembedded.org>; Urade, Yogita<mailto:Yogita.Urade@windriver.com>
Cc: G Pillai, Hari<mailto:Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-41973

Hi Yogita,

Please add CVE ID and Upstream-Status in main patch as well

Regards,
Archana

From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Urade, Yogita via lists.openembedded.org <Yog=
ita.Urade=3Dwindriver.com@lists.openembedded.org>
Sent: Wednesday, December 21, 2022 12:34 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Urade, Yogita <Yogita.Urad=
e@windriver.com>
Subject: [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-41973

multipath-tools 0.7.7 through 0.9.x before 0.9.2 allows local users to obta=
in root access, as exploited in conjunction with CVE-2022-41974. Local user=
s able to access /dev/shm can change symlinks in multipathd due to incorrec=
t symlink handling, which could lead to controlled file writes outside of t=
he /dev/shm directory. This could be used indirectly for local privilege es=
calation to root.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41973

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 ...ath-tools-use-run-instead-of-dev-shm.patch | 159 ++++++++++++++++++
 .../multipath-tools/multipath-tools_0.8.4.bb  |   4 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001-mult=
ipath-tools-use-run-instead-of-dev-shm.patch

diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-t=
ools-use-run-instead-of-dev-shm.patch b/meta-oe/recipes-support/multipath-t=
ools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch
new file mode 100644
index 000000000..dd6af413e
--- /dev/null
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-us=
e-run-instead-of-dev-shm.patch
@@ -0,0 +1,159 @@
+From 23e13a52a6213b11eda9a3b09df455f495f74e8d Mon Sep 17 00:00:00 2001
+From: Yogita Urade <yogita.urade@windriver.com>
+Date: Tue, 13 Dec 2022 09:18:33 +0000
+Subject: [PATCH] multipath-tools: use /run instead of /dev/shm
+
+/dev/shm may have unsafe permissions. Use /run instead.
+Use systemd's tmpfiles.d mechanism to create /run/multipath
+early during boot.
+
+For backward compatibilty, make the runtime directory configurable
+via the "runtimedir" make variable.
+
+Signed-off-by: Martin Wilck <mwilck@suse.com>
+Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
+
+CVE: CVE-2022-41973
+
+References:
+https://nvd.nist.gov/vuln/detail/CVE-2022-41973
+
+Upstream-Status: Backport [https://github.com/opensvc/multipath-tools/comm=
it/cb57b930fa690ab79b3904846634681685e3470f]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ .gitignore                                        |  2 ++
+ Makefile.inc                                      |  7 ++++++-
+ libmultipath/defaults.h                           |  3 +--
+ multipath/Makefile                                | 11 ++++++++---
+ multipath/{multipath.rules =3D> multipath.rules.in} |  4 ++--
+ multipath/tmpfiles.conf.in                        |  1 +
+ 6 files changed, 20 insertions(+), 8 deletions(-)
+ rename multipath/{multipath.rules =3D> multipath.rules.in} (95%)
+ create mode 100644 multipath/tmpfiles.conf.in
+
+diff --git a/.gitignore b/.gitignore
+index 9926756b..f90b0350 100644
+--- a/.gitignore
++++ b/.gitignore
+@@ -8,6 +8,8 @@
+ *.d
+ kpartx/kpartx
+ multipath/multipath
++multipath/multipath.rules
++multipath/tmpfiles.conf
+ multipathd/multipathd
+ mpathpersist/mpathpersist
+ .nfs*
+diff --git a/Makefile.inc b/Makefile.inc
+index 4eb08eed..648f91b4 100644
+--- a/Makefile.inc
++++ b/Makefile.inc
+@@ -44,6 +44,7 @@ exec_prefix  =3D $(prefix)
+ usr_prefix    =3D $(prefix)
+ bindir                =3D $(exec_prefix)/usr/sbin
+ libudevdir    =3D $(prefix)/$(SYSTEMDPATH)/udev
++tmpfilesdir   =3D $(prefix)/$(SYSTEMDPATH)/tmpfiles.d
+ udevrulesdir  =3D $(libudevdir)/rules.d
+ multipathdir  =3D $(TOPDIR)/libmultipath
+ man8dir               =3D $(prefix)/usr/share/man/man8
+@@ -60,6 +61,7 @@ libdmmpdir   =3D $(TOPDIR)/libdmmp
+ nvmedir               =3D $(TOPDIR)/libmultipath/nvme
+ includedir    =3D $(prefix)/usr/include
+ pkgconfdir    =3D $(usrlibdir)/pkgconfig
++runtimedir      :=3D /$(RUN)
+
+ GZIP          =3D gzip -9 -c
+ RM            =3D rm -f
+@@ -95,7 +97,10 @@ OPTFLAGS       +=3D -Wextra -Wstrict-prototypes -Wforma=
t=3D2 -Werror=3Dimplicit-int \
+                   -Wno-unused-parameter -Werror=3Dcast-qual \
+                   -Werror=3Ddiscarded-qualifiers
+
+-CPPFLAGS      :=3D -Wp,-D_FORTIFY_SOURCE=3D2
++CPPFLAGS      :=3D $(FORTIFY_OPT) \
++                 -DBIN_DIR=3D\"$(bindir)\" -DMULTIPATH_DIR=3D\"$(plugindi=
r)\" -DRUN_DIR=3D\"${RUN}\" \
++                 -DRUNTIME_DIR=3D\"$(runtimedir)\" \
++                 -DCONFIG_DIR=3D\"$(configdir)\" -DEXTRAVERSION=3D\"$(EXT=
RAVERSION)\" -MMD -MP
+ CFLAGS                :=3D $(OPTFLAGS) -DBIN_DIR=3D\"$(bindir)\" -DLIB_ST=
RING=3D\"${LIB}\" -DRUN_DIR=3D\"${RUN}\" \
+                   -MMD -MP $(CFLAGS)
+ BIN_CFLAGS    =3D -fPIE -DPIE
+diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
+index c2164c16..908e0ca3 100644
+--- a/libmultipath/defaults.h
++++ b/libmultipath/defaults.h
+@@ -64,8 +64,7 @@
+ #define DEFAULT_WWIDS_FILE    "/etc/multipath/wwids"
+ #define DEFAULT_PRKEYS_FILE    "/etc/multipath/prkeys"
+ #define DEFAULT_CONFIG_DIR    "/etc/multipath/conf.d"
+-#define MULTIPATH_SHM_BASE    "/dev/shm/multipath/"
+-
++#define MULTIPATH_SHM_BASE    RUNTIME_DIR "/multipath/"
+
+ static inline char *set_default(char *str)
+ {
+diff --git a/multipath/Makefile b/multipath/Makefile
+index e720c7f6..28976546 100644
+--- a/multipath/Makefile
++++ b/multipath/Makefile
+@@ -12,7 +12,7 @@ EXEC =3D multipath
+
+ OBJS =3D main.o
+
+-all: $(EXEC)
++all: $(EXEC) multipath.rules tmpfiles.conf
+
+ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathc=
md.so
+        $(CC) $(CFLAGS) $(OBJS) -o $(EXEC) $(LDFLAGS) $(LIBDEPS)
+@@ -26,7 +26,9 @@ install:
+        $(INSTALL_PROGRAM) -m 755 mpathconf $(DESTDIR)$(bindir)/
+        $(INSTALL_PROGRAM) -d $(DESTDIR)$(udevrulesdir)
+        $(INSTALL_PROGRAM) -m 644 11-dm-mpath.rules $(DESTDIR)$(udevrulesd=
ir)
+-      $(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(DESTDIR)$(libudevdir)/rul=
es.d/62-multipath.rules
++      $(INSTALL_PROGRAM) -m 644 multipath.rules $(DESTDIR)$(udevrulesdir)=
/56-multipath.rules
++      $(INSTALL_PROGRAM) -d $(DESTDIR)$(tmpfilesdir)
++      $(INSTALL_PROGRAM) -m 644 tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/mu=
ltipath.conf
+        $(INSTALL_PROGRAM) -d $(DESTDIR)$(man8dir)
+        $(INSTALL_PROGRAM) -m 644 $(EXEC).8.gz $(DESTDIR)$(man8dir)
+        $(INSTALL_PROGRAM) -d $(DESTDIR)$(man5dir)
+@@ -43,9 +45,12 @@ uninstall:
+        $(RM) $(DESTDIR)$(man8dir)/mpathconf.8.gz
+
+ clean: dep_clean
+-      $(RM) core *.o $(EXEC) *.gz
++      $(RM) core *.o $(EXEC) multipath.rules tmpfiles.conf
+
+ include $(wildcard $(OBJS:.o=3D.d))
+
+ dep_clean:
+        $(RM) $(OBJS:.o=3D.d)
++
++%:    %.in
++      sed 's,@RUNTIME_DIR@,$(runtimedir),' $< >$@
+diff --git a/multipath/multipath.rules b/multipath/multipath.rules.in
+similarity index 95%
+rename from multipath/multipath.rules
+rename to multipath/multipath.rules.in
+index 0486bf70..5fb499e6 100644
+--- a/multipath/multipath.rules
++++ b/multipath/multipath.rules.in
+@@ -1,8 +1,8 @@
+ # Set DM_MULTIPATH_DEVICE_PATH if the device should be handled by multipa=
th
+ SUBSYSTEM!=3D"block", GOTO=3D"end_mpath"
+ KERNEL!=3D"sd*|dasd*|nvme*", GOTO=3D"end_mpath"
+-ACTION=3D=3D"remove", TEST=3D=3D"/dev/shm/multipath/find_multipaths/$majo=
r:$minor", \
+-      RUN+=3D"/usr/bin/rm -f /dev/shm/multipath/find_multipaths/$major:$m=
inor"
++ACTION=3D=3D"remove", TEST=3D=3D"@RUNTIME_DIR@/multipath/find_multipaths/=
$major:$minor", \
++      RUN+=3D"/usr/bin/rm -f @RUNTIME_DIR@/multipath/find_multipaths/$maj=
or:$minor"
+ ACTION!=3D"add|change", GOTO=3D"end_mpath"
+
+ IMPORT{cmdline}=3D"nompath"
+diff --git a/multipath/tmpfiles.conf.in b/multipath/tmpfiles.conf.in
+new file mode 100644
+index 00000000..21be438a
+--- /dev/null
++++ b/multipath/tmpfiles.conf.in
+@@ -0,0 +1 @@
++d @RUNTIME_DIR@/multipath 0700 root root -
+--
+2.32.0
+
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.=
bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
index 5a8db0877..8f15c2c21 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb
@@ -48,6 +48,7 @@ SRC_URI =3D "git://github.com/opensvc/multipath-tools.git=
;protocol=3Dhttp;branch=3Dmas
            file://0001-add-explicit-dependency-on-libraries.patch \
            file://0001-fix-boolean-value-with-json-c-0.14.patch \
            file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_m=
o.patch \
+           file://0001-multipath-tools-use-run-instead-of-dev-shm.patch \
            "

 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522ec=
2"
@@ -120,3 +121,6 @@ FILES:kpartx =3D "${base_sbindir}/kpartx \

 RDEPENDS:${PN} +=3D "kpartx"
 PARALLEL_MAKE =3D ""
+
+FILES:${PN}-libs +=3D "usr/lib"
+FILES:${PN}-libs +=3D "usr/lib/tmpfiles.d"
--
2.32.0


--_000_BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9BL0PR11MB3410namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal" style=3D"line-height:200%"><span lang=3D"EN-US">Hi A=
rchana,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:200%"><span lang=3D"EN-US">The =
same patch which I sent on 19<sup>th</sup> Dec, &nbsp;for the kirkstone bra=
nch, in that I added the CVE ID &amp; upstream-status.<br>
But <a id=3D"OWAAM6B62024851054EC39858BFA20575F5FDZ" href=3D"mailto:Qi.Chen=
@windriver.com">
<span style=3D"font-family:&quot;Calibri&quot;,sans-serif;text-decoration:n=
one">@Chen, Qi</span></a> suggest me to remove that because it was&nbsp; al=
ready added in the patch.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:200%"><span lang=3D"EN-US">This=
 is same patch, only difference is that this is for the master branch.
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:200%"><span lang=3D"EN-US"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:200%"><span lang=3D"EN-US">Rega=
rds,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"line-height:200%"><span lang=3D"EN-US">Yogi=
ta</span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:Archana.Polampalli@windriver.com">Polampalli, Archana</a><br>
<b>Sent: </b>21 December 2022 13:35<br>
<b>To: </b><a href=3D"mailto:openembedded-devel@lists.openembedded.org">ope=
nembedded-devel@lists.openembedded.org</a>;
<a href=3D"mailto:Yogita.Urade@windriver.com">Urade, Yogita</a><br>
<b>Cc: </b><a href=3D"mailto:Hari.GPillai@windriver.com">G Pillai, Hari</a>=
<br>
<b>Subject: </b>Re: [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-=
41973</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;color:black">Hi Yogita,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;color:black">Please add CVE ID and Upstream-Status in main patch as =
well<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;color:black"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;color:black">Regards,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal" style=3D"background:white"><span style=3D"font-size:=
12.0pt;color:black">Archana<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><img border=3D"0" width=3D"471" height=3D"1" style=
=3D"width:4.9097in;height:.0138in" id=3D"Horizontal_x0020_Line_x0020_1" src=
=3D"cid:image001.png@01D91546.18CAFAF0"><o:p></o:p></p>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> openembedded-devel@lists.openembedded.org &lt;opene=
mbedded-devel@lists.openembedded.org&gt; on behalf of Urade, Yogita via lis=
ts.openembedded.org &lt;Yogita.Urade=3Dwindriver.com@lists.openembedded.org=
&gt;<br>
<b>Sent:</b> Wednesday, December 21, 2022 12:34 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Urade, Yogita=
 &lt;Yogita.Urade@windriver.com&gt;<br>
<b>Subject:</b> [oe][meta-oe][PATCH 1/1] multipath-tools: fix CVE-2022-4197=
3</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">multipath-tools 0.7.7=
 through 0.9.x before 0.9.2 allows local users to obtain root access, as ex=
ploited in conjunction with CVE-2022-41974. Local users able to access /dev=
/shm can change symlinks in multipathd
 due to incorrect symlink handling, which could lead to controlled file wri=
tes outside of the /dev/shm directory. This could be used indirectly for lo=
cal privilege escalation to root.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-41973">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-41973</a><br>
<br>
Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
---<br>
&nbsp;...ath-tools-use-run-instead-of-dev-shm.patch | 159 +++++++++++++++++=
+<br>
&nbsp;.../multipath-tools/multipath-tools_0.8.4.bb&nbsp; |&nbsp;&nbsp; 4 +<=
br>
&nbsp;2 files changed, 163 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-support/multipath-tools/files/0001=
-multipath-tools-use-run-instead-of-dev-shm.patch<br>
<br>
diff --git a/meta-oe/recipes-support/multipath-tools/files/0001-multipath-t=
ools-use-run-instead-of-dev-shm.patch b/meta-oe/recipes-support/multipath-t=
ools/files/0001-multipath-tools-use-run-instead-of-dev-shm.patch<br>
new file mode 100644<br>
index 000000000..dd6af413e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/multipath-tools/files/0001-multipath-tools-us=
e-run-instead-of-dev-shm.patch<br>
@@ -0,0 +1,159 @@<br>
+From 23e13a52a6213b11eda9a3b09df455f495f74e8d Mon Sep 17 00:00:00 2001<br>
+From: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+Date: Tue, 13 Dec 2022 09:18:33 +0000<br>
+Subject: [PATCH] multipath-tools: use /run instead of /dev/shm<br>
+<br>
+/dev/shm may have unsafe permissions. Use /run instead.<br>
+Use systemd's tmpfiles.d mechanism to create /run/multipath<br>
+early during boot.<br>
+<br>
+For backward compatibilty, make the runtime directory configurable<br>
+via the &quot;runtimedir&quot; make variable.<br>
+<br>
+Signed-off-by: Martin Wilck &lt;mwilck@suse.com&gt;<br>
+Reviewed-by: Benjamin Marzinski &lt;bmarzins@redhat.com&gt;<br>
+<br>
+CVE: CVE-2022-41973<br>
+<br>
+References:<br>
+https://nvd.nist.gov/vuln/detail/CVE-2022-41973<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/opensvc/multipath=
-tools/commit/cb57b930fa690ab79b3904846634681685e3470f">https://github.com/=
opensvc/multipath-tools/commit/cb57b930fa690ab79b3904846634681685e3470f</a>=
]<br>
+<br>
+Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
+---<br>
+ .gitignore&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 ++<br>
+ Makefile.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; |&nbsp; 7 ++++++-<br>
+ libmultipath/defaults.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 +--<br>
+ multipath/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 11 ++++++++---<b=
r>
+ multipath/{multipath.rules =3D&gt; multipath.rules.in} |&nbsp; 4 ++--<br>
+ multipath/tmpfiles.conf.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
+ 6 files changed, 20 insertions(+), 8 deletions(-)<br>
+ rename multipath/{multipath.rules =3D&gt; multipath.rules.in} (95%)<br>
+ create mode 100644 multipath/tmpfiles.conf.in<br>
+<br>
+diff --git a/.gitignore b/.gitignore<br>
+index 9926756b..f90b0350 100644<br>
+--- a/.gitignore<br>
++++ b/.gitignore<br>
+@@ -8,6 +8,8 @@<br>
+ *.d<br>
+ kpartx/kpartx<br>
+ multipath/multipath<br>
++multipath/multipath.rules<br>
++multipath/tmpfiles.conf<br>
+ multipathd/multipathd<br>
+ mpathpersist/mpathpersist<br>
+ .nfs*<br>
+diff --git a/Makefile.inc b/Makefile.inc<br>
+index 4eb08eed..648f91b4 100644<br>
+--- a/Makefile.inc<br>
++++ b/Makefile.inc<br>
+@@ -44,6 +44,7 @@ exec_prefix&nbsp; =3D $(prefix)<br>
+ usr_prefix&nbsp;&nbsp;&nbsp; =3D $(prefix)<br>
+ bindir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =3D $(exec_prefix)/usr/sbin<br>
+ libudevdir&nbsp;&nbsp;&nbsp; =3D $(prefix)/$(SYSTEMDPATH)/udev<br>
++tmpfilesdir&nbsp;&nbsp; =3D $(prefix)/$(SYSTEMDPATH)/tmpfiles.d<br>
+ udevrulesdir&nbsp; =3D $(libudevdir)/rules.d<br>
+ multipathdir&nbsp; =3D $(TOPDIR)/libmultipath<br>
+ man8dir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D $(prefix)/usr/share/man/man8<br>
+@@ -60,6 +61,7 @@ libdmmpdir&nbsp;&nbsp; =3D $(TOPDIR)/libdmmp<br>
+ nvmedir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; =3D $(TOPDIR)/libmultipath/nvme<br>
+ includedir&nbsp;&nbsp;&nbsp; =3D $(prefix)/usr/include<br>
+ pkgconfdir&nbsp;&nbsp;&nbsp; =3D $(usrlibdir)/pkgconfig<br>
++runtimedir&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=3D /$(RUN)<br>
+ <br>
+ GZIP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D gzip -9 -c=
<br>
+ RM&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
rm -f<br>
+@@ -95,7 +97,10 @@ OPTFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +=3D -Wext=
ra -Wstrict-prototypes -Wformat=3D2 -Werror=3Dimplicit-int \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Wno-unused-parameter -Werror=3Dcast-qua=
l \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -Werror=3Ddiscarded-qualifiers<br>
+ <br>
+-CPPFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=3D -Wp,-D_FORTIFY_SOURCE=3D2 <br=
>
++CPPFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :=3D $(FORTIFY_OPT) \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; -DBIN_DIR=3D\&quot;$(bindir)\&quot; -DMULTIPATH_DIR=
=3D\&quot;$(plugindir)\&quot; -DRUN_DIR=3D\&quot;${RUN}\&quot; \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; -DRUNTIME_DIR=3D\&quot;$(runtimedir)\&quot; \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; -DCONFIG_DIR=3D\&quot;$(configdir)\&quot; -DEXTRAVE=
RSION=3D\&quot;$(EXTRAVERSION)\&quot; -MMD -MP
<br>
+ CFLAGS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; :=3D $(OPTFLAGS) -DBIN_DIR=3D\&quot;$(bindir)\&quot=
; -DLIB_STRING=3D\&quot;${LIB}\&quot; -DRUN_DIR=3D\&quot;${RUN}\&quot; \<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -MMD -MP $(CFLAGS)<br>
+ BIN_CFLAGS&nbsp;&nbsp;&nbsp; =3D -fPIE -DPIE<br>
+diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h<br>
+index c2164c16..908e0ca3 100644<br>
+--- a/libmultipath/defaults.h<br>
++++ b/libmultipath/defaults.h<br>
+@@ -64,8 +64,7 @@<br>
+ #define DEFAULT_WWIDS_FILE&nbsp;&nbsp;&nbsp; &quot;/etc/multipath/wwids&q=
uot;<br>
+ #define DEFAULT_PRKEYS_FILE&nbsp;&nbsp;&nbsp; &quot;/etc/multipath/prkeys=
&quot;<br>
+ #define DEFAULT_CONFIG_DIR&nbsp;&nbsp;&nbsp; &quot;/etc/multipath/conf.d&=
quot;<br>
+-#define MULTIPATH_SHM_BASE&nbsp;&nbsp;&nbsp; &quot;/dev/shm/multipath/&qu=
ot;<br>
+-<br>
++#define MULTIPATH_SHM_BASE&nbsp;&nbsp;&nbsp; RUNTIME_DIR &quot;/multipath=
/&quot;<br>
+ <br>
+ static inline char *set_default(char *str)<br>
+ {<br>
+diff --git a/multipath/Makefile b/multipath/Makefile<br>
+index e720c7f6..28976546 100644<br>
+--- a/multipath/Makefile<br>
++++ b/multipath/Makefile<br>
+@@ -12,7 +12,7 @@ EXEC =3D multipath<br>
+ <br>
+ OBJS =3D main.o<br>
+ <br>
+-all: $(EXEC)<br>
++all: $(EXEC) multipath.rules tmpfiles.conf<br>
+ <br>
+ $(EXEC): $(OBJS) $(multipathdir)/libmultipath.so $(mpathcmddir)/libmpathc=
md.so<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(CC) $(CFLAGS) $(OBJS) -o $(EX=
EC) $(LDFLAGS) $(LIBDEPS)<br>
+@@ -26,7 +26,9 @@ install:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 755 mpath=
conf $(DESTDIR)$(bindir)/<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -d $(DESTDIR=
)$(udevrulesdir)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 11-dm=
-mpath.rules $(DESTDIR)$(udevrulesdir)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 $(EXEC).rules $(=
DESTDIR)$(libudevdir)/rules.d/62-multipath.rules<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 multipath.rules =
$(DESTDIR)$(udevrulesdir)/56-multipath.rules<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -d $(DESTDIR)$(tmpfiles=
dir)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 tmpfiles.conf $(=
DESTDIR)$(tmpfilesdir)/multipath.conf<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -d $(DESTDIR=
)$(man8dir)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -m 644 $(EXE=
C).8.gz $(DESTDIR)$(man8dir)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(INSTALL_PROGRAM) -d $(DESTDIR=
)$(man5dir)<br>
+@@ -43,9 +45,12 @@ uninstall:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RM) $(DESTDIR)$(man8dir)/mpat=
hconf.8.gz<br>
+ <br>
+ clean: dep_clean<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RM) core *.o $(EXEC) *.gz<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RM) core *.o $(EXEC) multipath.rules tmp=
files.conf<br>
+ <br>
+ include $(wildcard $(OBJS:.o=3D.d))<br>
+ <br>
+ dep_clean:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(RM) $(OBJS:.o=3D.d)<br>
++<br>
++%:&nbsp;&nbsp;&nbsp; %.in<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sed 's,@RUNTIME_DIR@,$(runtimedir),' $&lt;=
 &gt;$@&nbsp;&nbsp;&nbsp;&nbsp; <br>
+diff --git a/multipath/multipath.rules b/multipath/multipath.rules.in<br>
+similarity index 95%<br>
+rename from multipath/multipath.rules<br>
+rename to multipath/multipath.rules.in<br>
+index 0486bf70..5fb499e6 100644<br>
+--- a/multipath/multipath.rules<br>
++++ b/multipath/multipath.rules.in<br>
+@@ -1,8 +1,8 @@<br>
+ # Set DM_MULTIPATH_DEVICE_PATH if the device should be handled by multipa=
th<br>
+ SUBSYSTEM!=3D&quot;block&quot;, GOTO=3D&quot;end_mpath&quot;<br>
+ KERNEL!=3D&quot;sd*|dasd*|nvme*&quot;, GOTO=3D&quot;end_mpath&quot;<br>
+-ACTION=3D=3D&quot;remove&quot;, TEST=3D=3D&quot;/dev/shm/multipath/find_m=
ultipaths/$major:$minor&quot;, \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RUN+=3D&quot;/usr/bin/rm -f /dev/shm/multi=
path/find_multipaths/$major:$minor&quot;<br>
++ACTION=3D=3D&quot;remove&quot;, TEST=3D=3D&quot;@RUNTIME_DIR@/multipath/f=
ind_multipaths/$major:$minor&quot;, \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; RUN+=3D&quot;/usr/bin/rm -f @RUNTIME_DIR@/=
multipath/find_multipaths/$major:$minor&quot;<br>
+ ACTION!=3D&quot;add|change&quot;, GOTO=3D&quot;end_mpath&quot;<br>
+ <br>
+ IMPORT{cmdline}=3D&quot;nompath&quot;<br>
+diff --git a/multipath/tmpfiles.conf.in b/multipath/tmpfiles.conf.in<br>
+new file mode 100644<br>
+index 00000000..21be438a<br>
+--- /dev/null<br>
++++ b/multipath/tmpfiles.conf.in<br>
+@@ -0,0 +1 @@<br>
++d @RUNTIME_DIR@/multipath 0700 root root -<br>
+-- <br>
+2.32.0<br>
+<br>
diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.=
bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb<br>
index 5a8db0877..8f15c2c21 100644<br>
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb<br>
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_0.8.4.bb<br>
@@ -48,6 +48,7 @@ SRC_URI =3D &quot;git://github.com/opensvc/multipath-tool=
s.git;protocol=3Dhttp;branch=3Dmas<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-add-explicit-dependency-on-libraries.patch">file://0001-add=
-explicit-dependency-on-libraries.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-fix-boolean-value-with-json-c-0.14.patch">file://0001-fix-b=
oolean-value-with-json-c-0.14.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch"=
>
file://0001-libmultipath-uevent.c-fix-error-handling-for-udev_mo.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://0001-multipath-tools-use-run-instead-of-dev-shm.patch">
file://0001-multipath-tools-use-run-instead-of-dev-shm.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://COPYING;md5=3D5f30f0716d=
fdd0d91eb439ebec522ec2">file://COPYING;md5=3D5f30f0716dfdd0d91eb439ebec522e=
c2</a>&quot;<br>
@@ -120,3 +121,6 @@ FILES:kpartx =3D &quot;${base_sbindir}/kpartx \<br>
&nbsp;<br>
&nbsp;RDEPENDS:${PN} +=3D &quot;kpartx&quot;<br>
&nbsp;PARALLEL_MAKE =3D &quot;&quot;<br>
+<br>
+FILES:${PN}-libs +=3D &quot;usr/lib&quot;<br>
+FILES:${PN}-libs +=3D &quot;usr/lib/tmpfiles.d&quot;<br>
-- <br>
2.32.0<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9BL0PR11MB3410namp_--

--_004_BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9BL0PR11MB3410namp_
Content-Type: image/png; name="FDE94B1FC6E24792AB839251AE1F59B4.png"
Content-Description: FDE94B1FC6E24792AB839251AE1F59B4.png
Content-Disposition: inline; filename="FDE94B1FC6E24792AB839251AE1F59B4.png";
	size=144; creation-date="Wed, 21 Dec 2022 08:41:49 GMT";
	modification-date="Wed, 21 Dec 2022 08:41:49 GMT"
Content-ID: <image001.png@01D91546.18CAFAF0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAsMAAAACCAYAAAC9p9F6AAAAAXNSR0IArs4c6QAAAARnQU1BAACx
jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAAlSURBVFhH7chBDQAACMQw/Js+EIAC6JJ+VlMA
AOCpdQIAwHGVBilNgMa0a9wjAAAAAElFTkSuQmCC

--_004_BL0PR11MB34103C0DCC60ABB542E6A9DC9FEB9BL0PR11MB3410namp_--

