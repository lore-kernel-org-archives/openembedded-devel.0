Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B301EC4332F
	for <webhook@archiver.kernel.org>; Thu, 24 Nov 2022 06:42:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17665.1669272126711586801
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Nov 2022 22:42:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cSMqtTyL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8327e4b041=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO6HcBA015433
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 06:42:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=nil0PcLGa1h0uxuwm+QIctQbX1ubBOX4X+T2z/Za5Kw=;
 b=cSMqtTyLOlKwb6okHepfLRjcNgJtljzwlUwIrLgxYi7/iPJkofik8Kkn0NWQCSoRi46m
 A38dbii9qXUVAYFZBzCIu8iQ/aTrtjTLBf2PPZRslusSXI2FcgZs9SLb/pxw2ZdGmpua
 on0xAMBbGVDKYpGSgVx18NQ/opJqTW1WabnrjEjA5eqwK3zFsHRcOhJUwxbzSnqePPoJ
 35XeB5Km90Rmq+vga+4QECB/PihDKEAA/e1aWjbSCIMK6bYUeTJKT5QpSVp2lIinV8jp
 hqHKM62MM+Qk3ROcvKebwjv7eKGjVEmna/TZqi+yWxNPGDXVBdTGSAhfEvTi9FLX5ZzA sQ== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2175.outbound.protection.outlook.com [104.47.59.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj41cr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 06:42:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OptJ070BW1KUtNssWR/BA1CEa4bhA2gGie2Q1jbGYz/tWpIMJ/woh0LDh6aqgRdiUU7hgKfuNkwcJ4kpSr+ixk2pEnjN3v61qtUdKbzfklatkVIiIJwtQKniXO27p2mYgA6wa631EArxQHmZGV+rCh+taVLytM5itdcKFCqxxTCQYkEAZRP5Dn2XG1U9XmH099mxu22fSebC2o/dQDkALnzfpov4KvaTk6hz53cmkETl4tEVgXgUzdN5+QL6C7c85kTw2YqgL8pGCcBcKzdI5XV2jCU4oZckC/37/Q1EKhcyDyhzP6o3UNyMfGI9PltskiWPf4d92eZU47B6/lrS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nil0PcLGa1h0uxuwm+QIctQbX1ubBOX4X+T2z/Za5Kw=;
 b=Gba3Xu4loYlTyLyB0g7BVX/Qebxn0RMlaZqbFqeQcZrd9xAystcMeai5ioq31Z5q0Gq9Nu/esgouog2EGooxt/sSPW7Z+A+XGN1kRDE6NRuDwACf9z2h9xa7NuaCqYURWlb+Rwtz12y44YRko4Wr0eAgatmkZyumKVE12CjbZS4sFNCx7okLTMMCYKaSzwZG6gMYRd9UzI3TQElFr2bJrWEFnAjRCk/4Jm1wnlWT7yOfhxxpSFJtxvOcPZ0bT3CkR5mC69RB3uaEvjkPV9iw6twzsn33KzlKN7b3t9ODpSL1jpytrt530xMMZpFRZFDDaAa6UCIbeMQnqfRtpXpEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BL0PR11MB3410.namprd11.prod.outlook.com (2603:10b6:208:33::33)
 by DS0PR11MB6519.namprd11.prod.outlook.com (2603:10b6:8:d1::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.17; Thu, 24 Nov 2022 06:41:59 +0000
Received: from BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::e0ff:22f9:8a29:4955]) by BL0PR11MB3410.namprd11.prod.outlook.com
 ([fe80::e0ff:22f9:8a29:4955%4]) with mapi id 15.20.5857.018; Thu, 24 Nov 2022
 06:41:59 +0000
From: "Urade, Yogita" <Yogita.Urade@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>,
        "Mali, Narpat"
	<Narpat.Mali@windriver.com>
Subject: [meta-openembedded][kirkstone][PATCH 1/1] syslog-ng: fix
 CVE-2022-38725
Thread-Topic: [meta-openembedded][kirkstone][PATCH 1/1] syslog-ng: fix
 CVE-2022-38725
Thread-Index: AQHY/8/ZEEsRYm3ntUa6MDGrpZrQGw==
Date: Thu, 24 Nov 2022 06:41:58 +0000
Message-ID: 
 <BL0PR11MB34107DD5DF3BD3449EE2772F9F0F9@BL0PR11MB3410.namprd11.prod.outlook.com>
References: 
 <BL0PR11MB3410ED9545E8270BCD2AD42D9F0A9@BL0PR11MB3410.namprd11.prod.outlook.com>
 <108d442c-d7ea-5341-8a93-5f9bea3ce09e@windriver.com>
In-Reply-To: <108d442c-d7ea-5341-8a93-5f9bea3ce09e@windriver.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL0PR11MB3410:EE_|DS0PR11MB6519:EE_
x-ms-office365-filtering-correlation-id: b23c3eb5-8a1a-41e8-0ba0-08dacde6fc7a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xYSRJxUWKN9x4V85XHDXj/zaCZOHDH9eN90TxNZrohMr3/Enqp0cGGmd9mY79IKxiLAtgUPkedEgQ/LHI+w2iieLsmk/w/f5tVyIubdcrb6E9LCV9Jf5iE3fSrWOlsHelj8Fdw29xbXdIBUmaZR7OXYGEGQxN1pGI8ReJnjstB48RjjltEqfNEpixx1KhqtdsfKCoVhRi7pVhJTjj3C5p7W0rzLJZLFttrv8KpDDqY+VwwqqOv58NvAw56D2gLa/0z5HGAJQM4XccC68xELrmDes/inEZDCTMyFFb1sXTGLH0HJn5DTB/ECI55kbNza+PIEW6+2fMkm4g/ck54XdfYAFQ7LyJkK3LTY4fthOejLKlO6JWe9kheXTE8m2eVancBB7pgqz/B1sEq4xSVzMJs/otcGijHYvrtn1E/NzF3s+SKq3Gx2S3fRLjTZiLxDo662tqnjWeu++EFhAQBeOp9vp7lIP2mRnepeCkA002BNsCoE1iLk+NZZZPJis66T26dkOLUjl2JNW9b0afBHw+V4wUo/VSIfD8GNHaMD/hoa6mbKsjnEfPo8o5pgbbjZWl/FYWda9uid/3qslZhVEA9/aryrUD77XLdWtwt2Nn1GL3g+zxIIfcB7aXJj8qHXGmgUY/5LCMrTaesBNx6Ro+7xQtr4GT+qK369w3aJ0x32nLddQtG0F04wmPMcuogwhLvMEAZTsRZvfrDBiigRZy5cgNju8NatfZx6KpkLXl13hF08OGGOLqwudBic/0pvIzF67nD6wizLabcB5DpT7FjqHkhjeQCKT46Iwj67K2J8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(346002)(366004)(136003)(396003)(451199015)(52536014)(110136005)(8936002)(54906003)(166002)(38070700005)(66446008)(316002)(5660300002)(66476007)(66556008)(76116006)(91956017)(64756008)(186003)(122000001)(66574015)(86362001)(966005)(8676002)(55016003)(66946007)(107886003)(478600001)(71200400001)(9686003)(53546011)(41300700001)(7696005)(6506007)(38100700002)(4326008)(83380400001)(4001150100001)(66899015)(30864003)(33656002)(2906002)(2004002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?bLqfgzZIbXMjE9N8KsJOaUPNNInFq1fNabAiHzO9iNgeY9y0oi2cj47CtK?=
 =?iso-8859-1?Q?ulintBliXOdHDs2WnUoj3YIYirS13RuKY/sWIHL/ek8xtJdZsVXyMJaT8m?=
 =?iso-8859-1?Q?x4lm4DOxQRlYNSGdnhd7vn+vfsrLXmxpIDZW6+3p/6mWacnuA38+z2/vWQ?=
 =?iso-8859-1?Q?JHrkLVeippSu6e6GjMWWtzbC/ExZr20XNLCY1iw002F5s227u8QvI1Y4tD?=
 =?iso-8859-1?Q?UP3Lo//yEoH0rFJ6AU2fhiyUWf9v3US+ykVd2aSW1ALKfgpWD5IWD2aeSW?=
 =?iso-8859-1?Q?VlkqINA+DnbUMDpQ10KU1sRMDu5G1vrPFxt+BnqQHTZx5MqHO9NvGFdl7e?=
 =?iso-8859-1?Q?AQZnabrrfkP4LaqP62t7ueAv/JgofL/RDPR4jDV4RXPCh4fuEdjS/K8syD?=
 =?iso-8859-1?Q?kK93mlTpt+cQ3xqyKvsz8JCeq+b/MFBSyuFt4wwOBBsiq8ZVgYprrFhCA+?=
 =?iso-8859-1?Q?YZqJ21ThE/JaDP+u/Wd8LYbPPoU9yQWceH1Up+shl/0H6oKyIoJ3/E/+9r?=
 =?iso-8859-1?Q?c+HQmMfwxmWFaKiirCiYgPel8XBeVvLcL4q1k6jx1GglIw0BxQpryyVcG2?=
 =?iso-8859-1?Q?XjDDOu/8+tw38QY7trXwxE8XdP+4n+qM7mZ2cpqkZXFM0GwnvziSiz3PiE?=
 =?iso-8859-1?Q?/1hWRu/EszNIN/s39axXhPwhlHsUUI+sZDtXrmWsQGGGBcXPELx43/fP2k?=
 =?iso-8859-1?Q?M2lh6cwpafBh7C3muIRZeQNwhM3bX1vZrrOiwWaTQLtKjk857+XZhOo2cD?=
 =?iso-8859-1?Q?Y9hf9flN6abrmK/r9sFQJ1YQ65uRT8kVgtLOJdaN0gNJ6E/FCAKx9gGVjO?=
 =?iso-8859-1?Q?VzsDCPnP0nw7u37UtWWkqC98lMro7aWF8AxesMWafQgBdh6TM6nN51odt2?=
 =?iso-8859-1?Q?06Rbkebc5dUyLxdaIHITr225F4uvnJPcz3JAfCNDJHHFoGnaFDW5oZpmde?=
 =?iso-8859-1?Q?LxfiL324hRrruL0gyzql5FvfDNDRO3c/BS2N2TAOu8wBfqqqawXFn8Wi4O?=
 =?iso-8859-1?Q?bH9zModBSh2vj7MnGZgub8RHajh3OCkP6AOdRL3X4WQ5Q1wwSI7To1h/Gs?=
 =?iso-8859-1?Q?0FjFd+dJsGNPJbYsCn/WKLvIjOjikmpRBEiy2Is0yYBInNEuhl3KJdAloi?=
 =?iso-8859-1?Q?VXDtg7gUjJbxB3GvStt8PCTTETiPk272xh2ajosmVGIfgNBj5KXLrAIm3P?=
 =?iso-8859-1?Q?1s2deFI/Vdv/LqpPmFyexeE66xIlTo+5hhueChapvA25CPvBmcbetJXjVG?=
 =?iso-8859-1?Q?ismywxVNuHPsc3XlQDvK7MQZKkItBW0CvBi8Yj0hV9QAKIdtBU2P8+2SYD?=
 =?iso-8859-1?Q?fPyd8ebmq4jgbDrgTQGVTT8J8ymFXSFpAR6uXWPLkrhf44wB1S8lJUlVW1?=
 =?iso-8859-1?Q?+e4VcfLbqxC5k3r4/CNMi+LXWxS1d1TIblyaIBjgzS1ZMXTrPmyZif6vnU?=
 =?iso-8859-1?Q?K+eRLSQjFuDnF5IACzWwXB8up+Z7w41vduIPvNi5dgvUcXQRXrZRphnEPF?=
 =?iso-8859-1?Q?NAPojlEhNRa2wfWax570gX8usn0A8Lf8R3CBTjLTTRKcIUQc5Cb68X7gfI?=
 =?iso-8859-1?Q?jlB/N4QqCax7SG3Vrk35lKoVWzDUDMVg5MO5/6W/RWyqlo+Shx8fzn5II0?=
 =?iso-8859-1?Q?VG8Mna6aStVxzdwHvyC3j7RByFwDPE3iZ4ExZGofBouW21vt6Ff96X/3wX?=
 =?iso-8859-1?Q?SW76L9agBBF/hVGXVjoVykBIAl8yTKrHY+uhVAsPK31CvdAqU9jyu4cIka?=
 =?iso-8859-1?Q?ttoKw2FnIMJl5+Qx/r+Zj86EM=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BL0PR11MB34107DD5DF3BD3449EE2772F9F0F9BL0PR11MB3410namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b23c3eb5-8a1a-41e8-0ba0-08dacde6fc7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2022 06:41:58.8219
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kT1ycK7dLbBTeb7DNZGXNH60YhIEFaNpI/CH8rtITOp9I3RMAoqHZ11APBDzGmOUI5H12PbQ7e9dR4xxcCYJcwYOfplIOwBcdGNm39/Xlco=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6519
X-Proofpoint-GUID: BBnK_gLNPVT1pAdUHkjoggfgv2WRe4v_
X-Proofpoint-ORIG-GUID: BBnK_gLNPVT1pAdUHkjoggfgv2WRe4v_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_04,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Nov 2022 06:42:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99706

--_000_BL0PR11MB34107DD5DF3BD3449EE2772F9F0F9BL0PR11MB3410namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Fix buffer handling of syslog and timestamp parsers.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-38725
https://github.com/syslog-ng/syslog-ng/releases
https://github.com/syslog-ng/syslog-ng/pull/4110

Upstream patches:
https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4d=
4163f94b1b8
https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96f51=
df3f2879f8a
https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7e=
eefab8dc89d
https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a04=
931279abb37
https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339fe6=
7c6798a0321
https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282cfc8=
66ab56054c4
https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4da=
c7102235396
https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e4=
eaf959a044d

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../syslog-ng/files/CVE-2022-38725-0001.patch |  67 ++++++
 .../syslog-ng/files/CVE-2022-38725-0002.patch | 152 +++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0003.patch |  79 +++++++
 .../syslog-ng/files/CVE-2022-38725-0004.patch |  40 ++++
 .../syslog-ng/files/CVE-2022-38725-0005.patch | 213 ++++++++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0006.patch | 182 +++++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0007.patch |  84 +++++++
 .../syslog-ng/files/CVE-2022-38725-0008.patch |  47 ++++
 .../syslog-ng/syslog-ng_3.36.1.bb             |   8 +
 9 files changed, 872 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0001.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0002.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0003.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0004.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0005.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0006.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0007.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0008.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
new file mode 100644
index 000000000..cd6a93d8e
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
@@ -0,0 +1,67 @@
+From c6e7195075fd4fbd3db04e187f6d75030d17cb6b Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com>
+Date: Sat, 20 Aug 2022 12:26:05 +0200
+Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading of data buffe=
r
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4=
d4163f94b1b8
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ modules/syslogformat/syslog-format.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/s=
yslog-format.c
+index 38bb6f6..9042396 100644
+--- a/modules/syslogformat/syslog-format.c
++++ b/modules/syslogformat/syslog-format.c
+@@ -223,6 +223,9 @@ log_msg_parse_cisco_timestamp_attributes(LogMessage *s=
elf, const guchar **data,
+   const guchar *src =3D *data;
+   gint left =3D *length;
+
++  if (!left)
++    return;
++
+   /* Cisco timestamp extensions, the first '*' indicates that the clock i=
s
+    * unsynced, '.' if it is known to be synced */
+   if (G_UNLIKELY(src[0] =3D=3D '*'))
+@@ -556,7 +559,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF
+       open_sd++;
+       do
+         {
+-          if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' || *=
src =3D=3D ']' || *src =3D=3D '"')
++          if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D=
 ' ' || *src =3D=3D ']' || *src =3D=3D '"')
+             goto error;
+           /* read sd_id */
+           pos =3D 0;
+@@ -589,7 +592,8 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF
+           sd_id_len =3D pos;
+           strcpy(sd_value_name, logmsg_sd_prefix);
+           strncpy(sd_value_name + logmsg_sd_prefix_len, sd_id_name, sizeo=
f(sd_value_name) - logmsg_sd_prefix_len);
+-          if (*src =3D=3D ']')
++
++          if (left && *src =3D=3D ']')
+             {
+               log_msg_set_value_by_name(self, sd_value_name, "", 0);
+             }
+@@ -606,7 +610,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF
+               else
+                 goto error;
+
+-              if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' =
|| *src =3D=3D ']' || *src =3D=3D '"')
++              if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =
=3D=3D ' ' || *src =3D=3D ']' || *src =3D=3D '"')
+                 goto error;
+
+               /* read sd-param */
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
new file mode 100644
index 000000000..ac5bc78a5
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
@@ -0,0 +1,152 @@
+From f8f985cd0902e0fa8306f988fb183f1987ab7d3b Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com>
+Date: Sat, 20 Aug 2022 12:22:44 +0200
+Subject: [PATCH 2/8] syslogformat: add bug reproducer test for non-zero
+ terminated input
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96f5=
1df3f2879f8a
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ modules/syslogformat/CMakeLists.txt           |  1 +
+ modules/syslogformat/Makefile.am              |  2 +
+ modules/syslogformat/tests/CMakeLists.txt     |  1 +
+ modules/syslogformat/tests/Makefile.am        |  9 +++
+ .../syslogformat/tests/test_syslog_format.c   | 72 +++++++++++++++++++
+ 5 files changed, 85 insertions(+)
+ create mode 100644 modules/syslogformat/tests/CMakeLists.txt
+ create mode 100644 modules/syslogformat/tests/Makefile.am
+ create mode 100644 modules/syslogformat/tests/test_syslog_format.c
+
+diff --git a/modules/syslogformat/CMakeLists.txt b/modules/syslogformat/CM=
akeLists.txt
+index 94ee01a..64848ef 100644
+--- a/modules/syslogformat/CMakeLists.txt
++++ b/modules/syslogformat/CMakeLists.txt
+@@ -14,3 +14,4 @@ add_module(
+   SOURCES ${SYSLOGFORMAT_SOURCES}
+ )
+
++add_test_subdirectory(tests)
+diff --git a/modules/syslogformat/Makefile.am b/modules/syslogformat/Makef=
ile.am
+index f13f88c..14cdf58 100644
+--- a/modules/syslogformat/Makefile.am
++++ b/modules/syslogformat/Makefile.am
+@@ -31,3 +31,5 @@ modules_syslogformat_libsyslogformat_la_DEPENDENCIES =3D=
       \
+ modules/syslogformat modules/syslogformat/ mod-syslogformat: \
+        modules/syslogformat/libsyslogformat.la
+ .PHONY: modules/syslogformat/ mod-syslogformat
++
++include modules/syslogformat/tests/Makefile.am
+diff --git a/modules/syslogformat/tests/CMakeLists.txt b/modules/syslogfor=
mat/tests/CMakeLists.txt
+new file mode 100644
+index 0000000..2e45b71
+--- /dev/null
++++ b/modules/syslogformat/tests/CMakeLists.txt
+@@ -0,0 +1 @@
++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS syslogformat)
+diff --git a/modules/syslogformat/tests/Makefile.am b/modules/syslogformat=
/tests/Makefile.am
+new file mode 100644
+index 0000000..7ee66a5
+--- /dev/null
++++ b/modules/syslogformat/tests/Makefile.am
+@@ -0,0 +1,9 @@
++modules_syslogformat_tests_TESTS =3D \
++    modules/syslogformat/tests/test_syslog_format
++
++check_PROGRAMS +=3D ${modules_syslogformat_tests_TESTS}
++
++EXTRA_DIST +=3D modules/syslogformat/tests/CMakeLists.txt
++
++modules_syslogformat_tests_test_syslog_format_CFLAGS =3D $(TEST_CFLAGS) -=
I$(top_srcdir)/modules/syslogformat
++modules_syslogformat_tests_test_syslog_format_LDADD =3D $(TEST_LDADD) $(P=
REOPEN_SYSLOGFORMAT)
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/sys=
logformat/tests/test_syslog_format.c
+new file mode 100644
+index 0000000..b247fe3
+--- /dev/null
++++ b/modules/syslogformat/tests/test_syslog_format.c
+@@ -0,0 +1,72 @@
++/*
++ * Copyright (c) 2022 One Identity
++ * Copyright (c) 2022 L=E1szl=F3 V=E1rady
++ *
++ * This program is free software; you can redistribute it and/or modify i=
t
++ * under the terms of the GNU General Public License version 2 as publish=
ed
++ * by the Free Software Foundation, or (at your option) any later version=
.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 =
 USA
++ *
++ * As an additional exemption you are allowed to compile & link against t=
he
++ * OpenSSL libraries as published by the OpenSSL project. See the file
++ * COPYING for details.
++ *
++ */
++
++#include <criterion/criterion.h>
++
++#include "apphook.h"
++#include "cfg.h"
++#include "syslog-format.h"
++#include "logmsg/logmsg.h"
++#include "msg-format.h"
++#include "scratch-buffers.h"
++
++#include <string.h>
++
++GlobalConfig *cfg;
++MsgFormatOptions parse_options;
++
++static void
++setup(void)
++{
++  app_startup();
++  syslog_format_init();
++
++  cfg =3D cfg_new_snippet();
++  msg_format_options_defaults(&parse_options);
++}
++
++static void
++teardown(void)
++{
++  scratch_buffers_explicit_gc();
++  app_shutdown();
++  cfg_free(cfg);
++}
++
++TestSuite(syslog_format, .init =3D setup, .fini =3D teardown);
++
++Test(syslog_format, parser_should_not_spin_on_non_zero_terminated_input, =
.timeout =3D 10)
++{
++  const gchar *data =3D "<182>2022-08-17T05:02:28.217 mymachine su: 'su r=
oot' failed for lonvick on /dev/pts/8";
++  /* chosen carefully to reproduce a bug */
++  gsize data_length =3D 27;
++
++  msg_format_options_init(&parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (const=
 guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) d=
ata, data_length, &problem_position));
++
++  msg_format_options_destroy(&parse_options);
++  log_msg_unref(msg);
++}
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
new file mode 100644
index 000000000..34e6b65d2
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
@@ -0,0 +1,79 @@
+From 041ccdf8a4c73cd3138dac0611272361f384fb81 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com>
+Date: Sun, 21 Aug 2022 18:44:28 +0200
+Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence id out of bo=
unds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7=
eeefab8dc89d
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ modules/syslogformat/syslog-format.c          |  2 +-
+ .../syslogformat/tests/test_syslog_format.c   | 32 +++++++++++++++++++
+ 2 files changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/s=
yslog-format.c
+index 9042396..fe829fb 100644
+--- a/modules/syslogformat/syslog-format.c
++++ b/modules/syslogformat/syslog-format.c
+@@ -207,7 +207,7 @@ log_msg_parse_cisco_sequence_id(LogMessage *self, cons=
t guchar **data, gint *len
+
+   /* if the next char is not space, then we may try to read a date */
+
+-  if (*src !=3D ' ')
++  if (!left || *src !=3D ' ')
+     return;
+
+   log_msg_set_value(self, handles.cisco_seqid, (gchar *) *data, *length -=
 left - 1);
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/sys=
logformat/tests/test_syslog_format.c
+index b247fe3..d0f5b40 100644
+--- a/modules/syslogformat/tests/test_syslog_format.c
++++ b/modules/syslogformat/tests/test_syslog_format.c
+@@ -70,3 +70,35 @@ Test(syslog_format, parser_should_not_spin_on_non_zero_=
terminated_input, .timeou
+   msg_format_options_destroy(&parse_options);
+   log_msg_unref(msg);
+ }
++
++Test(syslog_format, cisco_sequence_id_non_zero_termination)
++{
++  const gchar *data =3D "<189>65536: ";
++  gsize data_length =3D strlen(data);
++
++  msg_format_options_init(&parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (const=
 guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) d=
ata, data_length, &problem_position));
++  cr_assert_str_eq(log_msg_get_value_by_name(msg, ".SDATA.meta.sequenceId=
", NULL), "65536");
++
++  msg_format_options_destroy(&parse_options);
++  log_msg_unref(msg);
++}
++
++Test(syslog_format, minimal_non_zero_terminated_numeric_message_is_parsed=
_as_program_name)
++{
++  const gchar *data =3D "<189>65536";
++  gsize data_length =3D strlen(data);
++
++  msg_format_options_init(&parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (const=
 guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) d=
ata, data_length, &problem_position));
++  cr_assert_str_eq(log_msg_get_value_by_name(msg, "PROGRAM", NULL), "6553=
6");
++
++  msg_format_options_destroy(&parse_options);
++  log_msg_unref(msg);
++}
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
new file mode 100644
index 000000000..cfad5a378
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
@@ -0,0 +1,40 @@
+From bea4678261328c841b6062014394e6d3230a2fdb Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com>
+Date: Sat, 20 Aug 2022 12:42:38 +0200
+Subject: [PATCH 4/8] timeutils: fix iterating out of the range of timestam=
p
+ buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com>
+Signed-off-by: Balazs Scheidler <bazsi77@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a0=
4931279abb37
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ lib/timeutils/scan-timestamp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c
+index 2f6a6b7..cb6802d 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -328,7 +328,7 @@ __parse_usec(const guchar **data, gint *length)
+           src++;
+           (*length)--;
+         }
+-      while (isdigit(*src))
++      while (*length > 0 && isdigit(*src))
+         {
+           src++;
+           (*length)--;
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
new file mode 100644
index 000000000..487118957
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
@@ -0,0 +1,213 @@
+From 1f62031101608bee8ad772967eb8151aa33d6e1a Mon Sep 17 00:00:00 2001
+From: Balazs Scheidler <bazsi77@gmail.com>
+Date: Sat, 20 Aug 2022 12:43:42 +0200
+Subject: [PATCH 5/8] timeutils: add tests for non-zero terminated inputs
+
+Signed-off-by: Balazs Scheidler <bazsi77@gmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339fe=
67c6798a0321
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ lib/timeutils/tests/test_scan-timestamp.c | 126 +++++++++++++++++++---
+ 1 file changed, 113 insertions(+), 13 deletions(-)
+
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tes=
ts/test_scan-timestamp.c
+index 2756bf3..da375c8 100644
+--- a/lib/timeutils/tests/test_scan-timestamp.c
++++ b/lib/timeutils/tests/test_scan-timestamp.c
+@@ -49,17 +49,21 @@ fake_time_add(time_t diff)
+ }
+
+ static gboolean
+-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])
++_parse_rfc3164(const gchar *ts, gint len, gchar isotimestamp[32])
+ {
+   UnixTime stamp;
+-  const guchar *data =3D (const guchar *) ts;
+-  gint length =3D strlen(ts);
++  const guchar *tsu =3D (const guchar *) ts;
++  gint tsu_len =3D len < 0 ? strlen(ts) : len;
+   GString *result =3D g_string_new("");
+   WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
+
+-
++  const guchar *data =3D tsu;
++  gint length =3D tsu_len;
+   gboolean success =3D scan_rfc3164_timestamp(&data, &length, &wct);
+
++  cr_assert(length >=3D 0);
++  cr_assert(data =3D=3D &tsu[tsu_len - length]);
++
+   unix_time_unset(&stamp);
+   convert_wall_clock_time_to_unix_time(&wct, &stamp);
+
+@@ -70,16 +74,21 @@ _parse_rfc3164(const gchar *ts, gchar isotimestamp[32]=
)
+ }
+
+ static gboolean
+-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])
++_parse_rfc5424(const gchar *ts, gint len, gchar isotimestamp[32])
+ {
+   UnixTime stamp;
+-  const guchar *data =3D (const guchar *) ts;
+-  gint length =3D strlen(ts);
++  const guchar *tsu =3D (const guchar *) ts;
++  gint tsu_len =3D len < 0 ? strlen(ts) : len;
+   GString *result =3D g_string_new("");
+   WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
+
++  const guchar *data =3D tsu;
++  gint length =3D tsu_len;
+   gboolean success =3D scan_rfc5424_timestamp(&data, &length, &wct);
+
++  cr_assert(length >=3D 0);
++  cr_assert(data =3D=3D &tsu[tsu_len - length]);
++
+   unix_time_unset(&stamp);
+   convert_wall_clock_time_to_unix_time(&wct, &stamp);
+
+@@ -90,31 +99,60 @@ _parse_rfc5424(const gchar *ts, gchar isotimestamp[32]=
)
+ }
+
+ static gboolean
+-_rfc3164_timestamp_eq(const gchar *ts, const gchar *expected, gchar conve=
rted[32])
++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar *expected, g=
char converted[32])
+ {
+-  cr_assert(_parse_rfc3164(ts, converted));
++  cr_assert(_parse_rfc3164(ts, len, converted));
+   return strcmp(converted, expected) =3D=3D 0;
+ }
+
+ static gboolean
+-_rfc5424_timestamp_eq(const gchar *ts, const gchar *expected, gchar conve=
rted[32])
++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar *expected, g=
char converted[32])
+ {
+-  cr_assert(_parse_rfc5424(ts, converted));
++  cr_assert(_parse_rfc5424(ts, len, converted));
+   return strcmp(converted, expected) =3D=3D 0;
+ }
+
+ #define _expect_rfc3164_timestamp_eq(ts, expected) \
+   ({ \
+     gchar converted[32]; \
+-    cr_expect(_rfc3164_timestamp_eq(ts, expected, converted), "Parsed RFC=
3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, expected=
=3D%s", ts, converted, expected); \
++    cr_expect(_rfc3164_timestamp_eq(ts, -1, expected, converted), "Parsed=
 RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, expect=
ed=3D%s", ts, converted, expected); \
++  })
++
++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected) \
++  ({ \
++    gchar converted[32]; \
++    cr_expect(_rfc3164_timestamp_eq(ts, len, expected, converted), "Parse=
d RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, expec=
ted=3D%s", ts, converted, expected); \
++  })
++
++#define _expect_rfc3164_fails(ts, len) \
++  ({  \
++    WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
++    const guchar *data =3D (guchar *) ts; \
++    gint length =3D len < 0 ? strlen(ts) : len; \
++    cr_assert_not(scan_rfc3164_timestamp(&data, &length, &wct)); \
+   })
+
+ #define _expect_rfc5424_timestamp_eq(ts, expected) \
+   ({ \
+     gchar converted[32]; \
+-    cr_expect(_rfc5424_timestamp_eq(ts, expected, converted), "Parsed RFC=
5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, expected=
=3D%s", ts, converted, expected); \
++    cr_expect(_rfc5424_timestamp_eq(ts, -1, expected, converted), "Parsed=
 RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, expect=
ed=3D%s", ts, converted, expected); \
++  })
++
++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected) \
++  ({ \
++    gchar converted[32]; \
++    cr_expect(_rfc5424_timestamp_eq(ts, len, expected, converted), "Parse=
d RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, expec=
ted=3D%s", ts, converted, expected); \
++  })
++
++#define _expect_rfc5424_fails(ts, len) \
++  ({  \
++    WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
++    const guchar *data =3D (guchar *) ts; \
++    gint length =3D len < 0 ? strlen(ts) : len; \
++    cr_assert_not(scan_rfc5424_timestamp(&data, &length, &wct)); \
+   })
+
++
+ Test(parse_timestamp, standard_bsd_format)
+ {
+   _expect_rfc3164_timestamp_eq("Oct  1 17:46:12", "2017-10-01T17:46:12.00=
0+02:00");
+@@ -148,6 +186,68 @@ Test(parse_timestamp, standard_bsd_format_year_in_the=
_past)
+   _expect_rfc3164_timestamp_eq("Dec 31 17:46:12", "2017-12-31T17:46:12.00=
0+01:00");
+ }
+
++Test(parse_timestamp, non_zero_terminated_rfc3164_iso_input_is_handled_pr=
operly)
++{
++  gchar *ts =3D "2022-08-17T05:02:28.417Z whatever";
++  gint ts_len =3D 24;
++
++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.4=
17+00:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.4=
17+00:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.417+0=
0:00");
++
++  /* no "Z" parsed, timezone defaults to local, forced CET */
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1, "2022-08-17T05:02:28.4=
17+02:00");
++
++  /* msec is partially parsed as we trim the string from the right */
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2, "2022-08-17T05:02:28.4=
10+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3, "2022-08-17T05:02:28.4=
00+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4, "2022-08-17T05:02:28.0=
00+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5, "2022-08-17T05:02:28.0=
00+02:00");
++
++  for (gint i =3D 6; i < ts_len; i++)
++    _expect_rfc3164_fails(ts, ts_len - i);
++
++}
++
++Test(parse_timestamp, non_zero_terminated_rfc3164_bsd_pix_or_asa_input_is=
_handled_properly)
++{
++  gchar *ts =3D "Aug 17 2022 05:02:28: whatever";
++  gint ts_len =3D 21;
++
++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.0=
00+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.0=
00+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.000+0=
2:00");
++
++  /* no ":" at the end, that's a problem, unrecognized */
++  _expect_rfc3164_fails(ts, ts_len - 1);
++
++  for (gint i =3D 1; i < ts_len; i++)
++    _expect_rfc3164_fails(ts, ts_len - i);
++}
++
++Test(parse_timestamp, non_zero_terminated_rfc5424_input_is_handled_proper=
ly)
++{
++  gchar *ts =3D "2022-08-17T05:02:28.417Z whatever";
++  gint ts_len =3D 24;
++
++  _expect_rfc5424_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.4=
17+00:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.4=
17+00:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.417+0=
0:00");
++
++  /* no "Z" parsed, timezone defaults to local, forced CET */
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1, "2022-08-17T05:02:28.4=
17+02:00");
++
++  /* msec is partially parsed as we trim the string from the right */
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2, "2022-08-17T05:02:28.4=
10+02:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3, "2022-08-17T05:02:28.4=
00+02:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4, "2022-08-17T05:02:28.0=
00+02:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5, "2022-08-17T05:02:28.0=
00+02:00");
++
++  for (gint i =3D 6; i < ts_len; i++)
++    _expect_rfc5424_fails(ts, ts_len - i);
++
++}
++
+
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_ti=
mezones)
+ {
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
new file mode 100644
index 000000000..e32076ab5
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
@@ -0,0 +1,182 @@
+From 14bcd1596f0f194b28e3f7babc75ad90d39ae7af Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com>
+Date: Sat, 20 Aug 2022 14:29:43 +0200
+Subject: [PATCH 6/8] timeutils: name repeating constant
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282cfc=
866ab56054c4
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ lib/timeutils/scan-timestamp.c | 54 ++++++++++++++++++----------------
+ 1 file changed, 29 insertions(+), 25 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c
+index cb6802d..197e3ad 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *w=
day)
+ {
+   *wday =3D -1;
+
+-  if (*left < 3)
++  const gsize abbrev_length =3D 3;
++
++  if (*left < abbrev_length)
+     return FALSE;
+
+   switch (**buf)
+     {
+     case 'S':
+-      if (strncasecmp(*buf, "Sun", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Sun", abbrev_length) =3D=3D 0)
+         *wday =3D 0;
+-      else if (strncasecmp(*buf, "Sat", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Sat", abbrev_length) =3D=3D 0)
+         *wday =3D 6;
+       else
+         return FALSE;
+       break;
+     case 'M':
+-      if (strncasecmp(*buf, "Mon", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Mon", abbrev_length) =3D=3D 0)
+         *wday =3D 1;
+       else
+         return FALSE;
+       break;
+     case 'T':
+-      if (strncasecmp(*buf, "Tue", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Tue", abbrev_length) =3D=3D 0)
+         *wday =3D 2;
+-      else if (strncasecmp(*buf, "Thu", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Thu", abbrev_length) =3D=3D 0)
+         *wday =3D 4;
+       else
+         return FALSE;
+       break;
+     case 'W':
+-      if (strncasecmp(*buf, "Wed", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Wed", abbrev_length) =3D=3D 0)
+         *wday =3D 3;
+       else
+         return FALSE;
+       break;
+     case 'F':
+-      if (strncasecmp(*buf, "Fri", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Fri", abbrev_length) =3D=3D 0)
+         *wday =3D 5;
+       else
+         return FALSE;
+@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *wda=
y)
+       return FALSE;
+     }
+
+-  (*buf) +=3D 3;
+-  (*left) -=3D 3;
++  (*buf) +=3D abbrev_length;
++  (*left) -=3D abbrev_length;
+   return TRUE;
+ }
+
+@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint *left, gint =
*mon)
+ {
+   *mon =3D -1;
+
+-  if (*left < 3)
++  const gsize abbrev_length =3D 3;
++
++  if (*left < abbrev_length)
+     return FALSE;
+
+   switch (**buf)
+     {
+     case 'J':
+-      if (strncasecmp(*buf, "Jan", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Jan", abbrev_length) =3D=3D 0)
+         *mon =3D 0;
+-      else if (strncasecmp(*buf, "Jun", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Jun", abbrev_length) =3D=3D 0)
+         *mon =3D 5;
+-      else if (strncasecmp(*buf, "Jul", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Jul", abbrev_length) =3D=3D 0)
+         *mon =3D 6;
+       else
+         return FALSE;
+       break;
+     case 'F':
+-      if (strncasecmp(*buf, "Feb", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Feb", abbrev_length) =3D=3D 0)
+         *mon =3D 1;
+       else
+         return FALSE;
+       break;
+     case 'M':
+-      if (strncasecmp(*buf, "Mar", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Mar", abbrev_length) =3D=3D 0)
+         *mon =3D 2;
+-      else if (strncasecmp(*buf, "May", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "May", abbrev_length) =3D=3D 0)
+         *mon =3D 4;
+       else
+         return FALSE;
+       break;
+     case 'A':
+-      if (strncasecmp(*buf, "Apr", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Apr", abbrev_length) =3D=3D 0)
+         *mon =3D 3;
+-      else if (strncasecmp(*buf, "Aug", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Aug", abbrev_length) =3D=3D 0)
+         *mon =3D 7;
+       else
+         return FALSE;
+       break;
+     case 'S':
+-      if (strncasecmp(*buf, "Sep", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Sep", abbrev_length) =3D=3D 0)
+         *mon =3D 8;
+       else
+         return FALSE;
+       break;
+     case 'O':
+-      if (strncasecmp(*buf, "Oct", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Oct", abbrev_length) =3D=3D 0)
+         *mon =3D 9;
+       else
+         return FALSE;
+       break;
+     case 'N':
+-      if (strncasecmp(*buf, "Nov", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Nov", abbrev_length) =3D=3D 0)
+         *mon =3D 10;
+       else
+         return FALSE;
+       break;
+     case 'D':
+-      if (strncasecmp(*buf, "Dec", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Dec", abbrev_length) =3D=3D 0)
+         *mon =3D 11;
+       else
+         return FALSE;
+@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint *left, gint =
*mon)
+       return FALSE;
+     }
+
+-  (*buf) +=3D 3;
+-  (*left) -=3D 3;
++  (*buf) +=3D abbrev_length;
++  (*left) -=3D abbrev_length;
+   return TRUE;
+ }
+
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
new file mode 100644
index 000000000..b3135df4e
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
@@ -0,0 +1,84 @@
+From d4c8ba0c513052b5f19c6e989ba31f847f4900d1 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com>
+Date: Sat, 20 Aug 2022 14:30:22 +0200
+Subject: [PATCH 7/8] timeutils: fix invalid calculation of ISO timestamp
+ length
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4d=
ac7102235396
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ lib/timeutils/scan-timestamp.c            | 8 ++++++--
+ lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c
+index 197e3ad..4e618e4 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -346,19 +346,21 @@ __parse_usec(const guchar **data, gint *length)
+ static gboolean
+ __has_iso_timezone(const guchar *src, gint length)
+ {
+-  return (length >=3D 5) &&
++  return (length >=3D 6) &&
+          (*src =3D=3D '+' || *src =3D=3D '-') &&
+          isdigit(*(src+1)) &&
+          isdigit(*(src+2)) &&
+          *(src+3) =3D=3D ':' &&
+          isdigit(*(src+4)) &&
+          isdigit(*(src+5)) &&
+-         !isdigit(*(src+6));
++         (length < 7 || !isdigit(*(src+6)));
+ }
+
+ static guint32
+ __parse_iso_timezone(const guchar **data, gint *length)
+ {
++  g_assert(*length >=3D 6);
++
+   gint hours, mins;
+   const guchar *src =3D *data;
+   guint32 tz =3D 0;
+@@ -368,8 +370,10 @@ __parse_iso_timezone(const guchar **data, gint *lengt=
h)
+   hours =3D (*(src + 1) - '0') * 10 + *(src + 2) - '0';
+   mins =3D (*(src + 4) - '0') * 10 + *(src + 5) - '0';
+   tz =3D sign * (hours * 3600 + mins * 60);
++
+   src +=3D 6;
+   (*length) -=3D 6;
++
+   *data =3D src;
+   return tz;
+ }
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tes=
ts/test_scan-timestamp.c
+index da375c8..9b38738 100644
+--- a/lib/timeutils/tests/test_scan-timestamp.c
++++ b/lib/timeutils/tests/test_scan-timestamp.c
+@@ -248,6 +248,13 @@ Test(parse_timestamp, non_zero_terminated_rfc5424_inp=
ut_is_handled_properly)
+
+ }
+
++Test(parse_timestamp, non_zero_terminated_rfc5424_timestamp_only)
++{
++  const gchar *ts =3D "2022-08-17T05:02:28.417+03:00";
++  gint ts_len =3D strlen(ts);
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);
++}
++
+
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_ti=
mezones)
+ {
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
new file mode 100644
index 000000000..cec573fa2
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
@@ -0,0 +1,47 @@
+From f60dcfa9e094dc9c2a752115ca426159c4ae4192 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com>
+Date: Sat, 20 Aug 2022 14:30:51 +0200
+Subject: [PATCH 8/8] timeutils: fix out-of-bounds reading of data buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e=
4eaf959a044d
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ lib/timeutils/scan-timestamp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c
+index 4e618e4..0f7f52e 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -427,7 +427,7 @@ __parse_bsd_timestamp(const guchar **data, gint *lengt=
h, WallClockTime *wct)
+       if (!scan_pix_timestamp((const gchar **) &src, &left, wct))
+         return FALSE;
+
+-      if (*src =3D=3D ':')
++      if (left && *src =3D=3D ':')
+         {
+           src++;
+           left--;
+@@ -478,7 +478,7 @@ scan_rfc3164_timestamp(const guchar **data, gint *leng=
th, WallClockTime *wct)
+    * looking at you, skip that as well, so we can reliably detect IPv6
+    * addresses as hostnames, which would be using ":" as well. */
+
+-  if (*src =3D=3D ':')
++  if (left && *src =3D=3D ':')
+     {
+       ++src;
+       --left;
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/meta-o=
e/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
index 40bbfe495..5fc386e56 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
@@ -22,6 +22,14 @@ SRC_URI =3D "https://github.com/balabit/syslog-ng/releas=
es/download/${BP}/${BP}.ta
            file://volatiles.03_syslog-ng \
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
+          file://CVE-2022-38725-0001.patch \
+          file://CVE-2022-38725-0002.patch \
+          file://CVE-2022-38725-0003.patch \
+          file://CVE-2022-38725-0004.patch \
+          file://CVE-2022-38725-0005.patch \
+          file://CVE-2022-38725-0006.patch \
+          file://CVE-2022-38725-0007.patch \
+          file://CVE-2022-38725-0008.patch \
 "

 SRC_URI[sha256sum] =3D "90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f1=
1ff5eea049e60b"
--
2.34.1


Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s

From: MacLeod, Randy<mailto:Randy.MacLeod@windriver.com>
Sent: 24 November 2022 03:16
To: Urade, Yogita<mailto:Yogita.Urade@windriver.com>; openembedded-devel@li=
sts.openembedded.org<mailto:openembedded-devel@lists.openembedded.org>
Cc: G Pillai, Hari<mailto:Hari.GPillai@windriver.com>; Mali, Narpat<mailto:=
Narpat.Mali@windriver.com>
Subject: Re: [oe] [meta-openembedded][kirkstone][PATCH 1/1] syslog-ng: fix =
CVE-2022-38725

Hi Yogita,

On 2022-11-21 05:29, Urade, Yogita via lists.openembedded.org wrote:
Issue: LIN1022-1598
The line above is only for internal WR reviews, please drop.


Fix buffer handling of syslog and timestamp parsers.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-38725
https://github.com/syslog-ng/syslog-ng/releases
https://github.com/syslog-ng/syslog-ng/pull/4110

Upstream patches:
https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4d=
4163f94b1b8
https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96f51=
df3f2879f8a
https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7e=
eefab8dc89d
https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a04=
931279abb37
https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339fe6=
7c6798a0321
https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282cfc8=
66ab56054c4
https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4da=
c7102235396
https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e4=
eaf959a044d

(LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance

The line above is only for internal WR reviews, please drop.

Also, this is the upstream for WR Linux, so it's not out of maintenance! ;-=
)

Other than that, this looks good.

Please send a v2.

Thanks,

../Randy

Signed-off-by: Yogita Urade <yogita.urade@windriver.com><mailto:yogita.urad=
e@windriver.com>
---
 .../syslog-ng/files/CVE-2022-38725-0001.patch |  67 ++++++
 .../syslog-ng/files/CVE-2022-38725-0002.patch | 152 +++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0003.patch |  79 +++++++
 .../syslog-ng/files/CVE-2022-38725-0004.patch |  40 ++++
 .../syslog-ng/files/CVE-2022-38725-0005.patch | 213 ++++++++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0006.patch | 182 +++++++++++++++
 .../syslog-ng/files/CVE-2022-38725-0007.patch |  84 +++++++
 .../syslog-ng/files/CVE-2022-38725-0008.patch |  47 ++++
 .../syslog-ng/syslog-ng_3.36.1.bb             |   8 +
 9 files changed, 872 insertions(+)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0001.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0002.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0003.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0004.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0005.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0006.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0007.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-=
0008.patch

diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
new file mode 100644
index 000000000..cd6a93d8e
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch
@@ -0,0 +1,67 @@
+From c6e7195075fd4fbd3db04e187f6d75030d17cb6b Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com><mailto:laszlo.varady@pr=
otonmail.com>
+Date: Sat, 20 Aug 2022 12:26:05 +0200
+Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading of data buffe=
r
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com><mailto:l=
aszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4=
d4163f94b1b8
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com><mailto:ovidiu.p=
anait@windriver.com>
+---
+ modules/syslogformat/syslog-format.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/s=
yslog-format.c
+index 38bb6f6..9042396 100644
+--- a/modules/syslogformat/syslog-format.c
++++ b/modules/syslogformat/syslog-format.c
+@@ -223,6 +223,9 @@ log_msg_parse_cisco_timestamp_attributes(LogMessage *s=
elf, const guchar **data,
+   const guchar *src =3D *data;
+   gint left =3D *length;
+
++  if (!left)
++    return;
++
+   /* Cisco timestamp extensions, the first '*' indicates that the clock i=
s
+    * unsynced, '.' if it is known to be synced */
+   if (G_UNLIKELY(src[0] =3D=3D '*'))
+@@ -556,7 +559,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF
+       open_sd++;
+       do
+         {
+-          if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' || *=
src =3D=3D ']' || *src =3D=3D '"')
++          if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D=
 ' ' || *src =3D=3D ']' || *src =3D=3D '"')
+             goto error;
+           /* read sd_id */
+           pos =3D 0;
+@@ -589,7 +592,8 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF
+           sd_id_len =3D pos;
+           strcpy(sd_value_name, logmsg_sd_prefix);
+           strncpy(sd_value_name + logmsg_sd_prefix_len, sd_id_name, sizeo=
f(sd_value_name) - logmsg_sd_prefix_len);
+-          if (*src =3D=3D ']')
++
++          if (left && *src =3D=3D ']')
+             {
+               log_msg_set_value_by_name(self, sd_value_name, "", 0);
+             }
+@@ -606,7 +610,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF
+               else
+                 goto error;
+
+-              if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' =
|| *src =3D=3D ']' || *src =3D=3D '"')
++              if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =
=3D=3D ' ' || *src =3D=3D ']' || *src =3D=3D '"')
+                 goto error;
+
+               /* read sd-param */
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
new file mode 100644
index 000000000..ac5bc78a5
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch
@@ -0,0 +1,152 @@
+From f8f985cd0902e0fa8306f988fb183f1987ab7d3b Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com><mailto:laszlo.varady@pr=
otonmail.com>
+Date: Sat, 20 Aug 2022 12:22:44 +0200
+Subject: [PATCH 2/8] syslogformat: add bug reproducer test for non-zero
+ terminated input
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com><mailto:l=
aszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96f5=
1df3f2879f8a
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com><mailto:ovidiu.p=
anait@windriver.com>
+---
+ modules/syslogformat/CMakeLists.txt           |  1 +
+ modules/syslogformat/Makefile.am              |  2 +
+ modules/syslogformat/tests/CMakeLists.txt     |  1 +
+ modules/syslogformat/tests/Makefile.am        |  9 +++
+ .../syslogformat/tests/test_syslog_format.c   | 72 +++++++++++++++++++
+ 5 files changed, 85 insertions(+)
+ create mode 100644 modules/syslogformat/tests/CMakeLists.txt
+ create mode 100644 modules/syslogformat/tests/Makefile.am
+ create mode 100644 modules/syslogformat/tests/test_syslog_format.c
+
+diff --git a/modules/syslogformat/CMakeLists.txt b/modules/syslogformat/CM=
akeLists.txt
+index 94ee01a..64848ef 100644
+--- a/modules/syslogformat/CMakeLists.txt
++++ b/modules/syslogformat/CMakeLists.txt
+@@ -14,3 +14,4 @@ add_module(
+   SOURCES ${SYSLOGFORMAT_SOURCES}
+ )
+
++add_test_subdirectory(tests)
+diff --git a/modules/syslogformat/Makefile.am b/modules/syslogformat/Makef=
ile.am
+index f13f88c..14cdf58 100644
+--- a/modules/syslogformat/Makefile.am
++++ b/modules/syslogformat/Makefile.am
+@@ -31,3 +31,5 @@ modules_syslogformat_libsyslogformat_la_DEPENDENCIES =3D=
       \
+ modules/syslogformat modules/syslogformat/ mod-syslogformat: \
+        modules/syslogformat/libsyslogformat.la
+ .PHONY: modules/syslogformat/ mod-syslogformat
++
++include modules/syslogformat/tests/Makefile.am
+diff --git a/modules/syslogformat/tests/CMakeLists.txt b/modules/syslogfor=
mat/tests/CMakeLists.txt
+new file mode 100644
+index 0000000..2e45b71
+--- /dev/null
++++ b/modules/syslogformat/tests/CMakeLists.txt
+@@ -0,0 +1 @@
++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS syslogformat)
+diff --git a/modules/syslogformat/tests/Makefile.am b/modules/syslogformat=
/tests/Makefile.am
+new file mode 100644
+index 0000000..7ee66a5
+--- /dev/null
++++ b/modules/syslogformat/tests/Makefile.am
+@@ -0,0 +1,9 @@
++modules_syslogformat_tests_TESTS =3D \
++    modules/syslogformat/tests/test_syslog_format
++
++check_PROGRAMS +=3D ${modules_syslogformat_tests_TESTS}
++
++EXTRA_DIST +=3D modules/syslogformat/tests/CMakeLists.txt
++
++modules_syslogformat_tests_test_syslog_format_CFLAGS =3D $(TEST_CFLAGS) -=
I$(top_srcdir)/modules/syslogformat
++modules_syslogformat_tests_test_syslog_format_LDADD =3D $(TEST_LDADD) $(P=
REOPEN_SYSLOGFORMAT)
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/sys=
logformat/tests/test_syslog_format.c
+new file mode 100644
+index 0000000..b247fe3
+--- /dev/null
++++ b/modules/syslogformat/tests/test_syslog_format.c
+@@ -0,0 +1,72 @@
++/*
++ * Copyright (c) 2022 One Identity
++ * Copyright (c) 2022 L=E1szl=F3 V=E1rady
++ *
++ * This program is free software; you can redistribute it and/or modify i=
t
++ * under the terms of the GNU General Public License version 2 as publish=
ed
++ * by the Free Software Foundation, or (at your option) any later version=
.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 =
 USA
++ *
++ * As an additional exemption you are allowed to compile & link against t=
he
++ * OpenSSL libraries as published by the OpenSSL project. See the file
++ * COPYING for details.
++ *
++ */
++
++#include <criterion/criterion.h>
++
++#include "apphook.h"
++#include "cfg.h"
++#include "syslog-format.h"
++#include "logmsg/logmsg.h"
++#include "msg-format.h"
++#include "scratch-buffers.h"
++
++#include <string.h>
++
++GlobalConfig *cfg;
++MsgFormatOptions parse_options;
++
++static void
++setup(void)
++{
++  app_startup();
++  syslog_format_init();
++
++  cfg =3D cfg_new_snippet();
++  msg_format_options_defaults(&parse_options);
++}
++
++static void
++teardown(void)
++{
++  scratch_buffers_explicit_gc();
++  app_shutdown();
++  cfg_free(cfg);
++}
++
++TestSuite(syslog_format, .init =3D setup, .fini =3D teardown);
++
++Test(syslog_format, parser_should_not_spin_on_non_zero_terminated_input, =
.timeout =3D 10)
++{
++  const gchar *data =3D "<182>2022-08-17T05:02:28.217 mymachine su: 'su r=
oot' failed for lonvick on /dev/pts/8";
++  /* chosen carefully to reproduce a bug */
++  gsize data_length =3D 27;
++
++  msg_format_options_init(&parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (const=
 guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) d=
ata, data_length, &problem_position));
++
++  msg_format_options_destroy(&parse_options);
++  log_msg_unref(msg);
++}
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
new file mode 100644
index 000000000..34e6b65d2
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch
@@ -0,0 +1,79 @@
+From 041ccdf8a4c73cd3138dac0611272361f384fb81 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com><mailto:laszlo.varady@pr=
otonmail.com>
+Date: Sun, 21 Aug 2022 18:44:28 +0200
+Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence id out of bo=
unds
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com><mailto:l=
aszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7=
eeefab8dc89d
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com><mailto:ovidiu.p=
anait@windriver.com>
+---
+ modules/syslogformat/syslog-format.c          |  2 +-
+ .../syslogformat/tests/test_syslog_format.c   | 32 +++++++++++++++++++
+ 2 files changed, 33 insertions(+), 1 deletion(-)
+
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/s=
yslog-format.c
+index 9042396..fe829fb 100644
+--- a/modules/syslogformat/syslog-format.c
++++ b/modules/syslogformat/syslog-format.c
+@@ -207,7 +207,7 @@ log_msg_parse_cisco_sequence_id(LogMessage *self, cons=
t guchar **data, gint *len
+
+   /* if the next char is not space, then we may try to read a date */
+
+-  if (*src !=3D ' ')
++  if (!left || *src !=3D ' ')
+     return;
+
+   log_msg_set_value(self, handles.cisco_seqid, (gchar *) *data, *length -=
 left - 1);
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/sys=
logformat/tests/test_syslog_format.c
+index b247fe3..d0f5b40 100644
+--- a/modules/syslogformat/tests/test_syslog_format.c
++++ b/modules/syslogformat/tests/test_syslog_format.c
+@@ -70,3 +70,35 @@ Test(syslog_format, parser_should_not_spin_on_non_zero_=
terminated_input, .timeou
+   msg_format_options_destroy(&parse_options);
+   log_msg_unref(msg);
+ }
++
++Test(syslog_format, cisco_sequence_id_non_zero_termination)
++{
++  const gchar *data =3D "<189>65536: ";
++  gsize data_length =3D strlen(data);
++
++  msg_format_options_init(&parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (const=
 guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) d=
ata, data_length, &problem_position));
++  cr_assert_str_eq(log_msg_get_value_by_name(msg, ".SDATA.meta.sequenceId=
", NULL), "65536");
++
++  msg_format_options_destroy(&parse_options);
++  log_msg_unref(msg);
++}
++
++Test(syslog_format, minimal_non_zero_terminated_numeric_message_is_parsed=
_as_program_name)
++{
++  const gchar *data =3D "<189>65536";
++  gsize data_length =3D strlen(data);
++
++  msg_format_options_init(&parse_options, cfg);
++  LogMessage *msg =3D msg_format_construct_message(&parse_options, (const=
 guchar *) data, data_length);
++
++  gsize problem_position;
++  cr_assert(syslog_format_handler(&parse_options, msg, (const guchar *) d=
ata, data_length, &problem_position));
++  cr_assert_str_eq(log_msg_get_value_by_name(msg, "PROGRAM", NULL), "6553=
6");
++
++  msg_format_options_destroy(&parse_options);
++  log_msg_unref(msg);
++}
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
new file mode 100644
index 000000000..cfad5a378
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch
@@ -0,0 +1,40 @@
+From bea4678261328c841b6062014394e6d3230a2fdb Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com><mailto:laszlo.varady@pr=
otonmail.com>
+Date: Sat, 20 Aug 2022 12:42:38 +0200
+Subject: [PATCH 4/8] timeutils: fix iterating out of the range of timestam=
p
+ buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com><mailto:l=
aszlo.varady@protonmail.com>
+Signed-off-by: Balazs Scheidler <bazsi77@gmail.com><mailto:bazsi77@gmail.c=
om>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a0=
4931279abb37
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com><mailto:ovidiu.p=
anait@windriver.com>
+---
+ lib/timeutils/scan-timestamp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c
+index 2f6a6b7..cb6802d 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -328,7 +328,7 @@ __parse_usec(const guchar **data, gint *length)
+           src++;
+           (*length)--;
+         }
+-      while (isdigit(*src))
++      while (*length > 0 && isdigit(*src))
+         {
+           src++;
+           (*length)--;
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
new file mode 100644
index 000000000..487118957
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch
@@ -0,0 +1,213 @@
+From 1f62031101608bee8ad772967eb8151aa33d6e1a Mon Sep 17 00:00:00 2001
+From: Balazs Scheidler <bazsi77@gmail.com><mailto:bazsi77@gmail.com>
+Date: Sat, 20 Aug 2022 12:43:42 +0200
+Subject: [PATCH 5/8] timeutils: add tests for non-zero terminated inputs
+
+Signed-off-by: Balazs Scheidler <bazsi77@gmail.com><mailto:bazsi77@gmail.c=
om>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339fe=
67c6798a0321
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com><mailto:ovidiu.p=
anait@windriver.com>
+---
+ lib/timeutils/tests/test_scan-timestamp.c | 126 +++++++++++++++++++---
+ 1 file changed, 113 insertions(+), 13 deletions(-)
+
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tes=
ts/test_scan-timestamp.c
+index 2756bf3..da375c8 100644
+--- a/lib/timeutils/tests/test_scan-timestamp.c
++++ b/lib/timeutils/tests/test_scan-timestamp.c
+@@ -49,17 +49,21 @@ fake_time_add(time_t diff)
+ }
+
+ static gboolean
+-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])
++_parse_rfc3164(const gchar *ts, gint len, gchar isotimestamp[32])
+ {
+   UnixTime stamp;
+-  const guchar *data =3D (const guchar *) ts;
+-  gint length =3D strlen(ts);
++  const guchar *tsu =3D (const guchar *) ts;
++  gint tsu_len =3D len < 0 ? strlen(ts) : len;
+   GString *result =3D g_string_new("");
+   WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
+
+-
++  const guchar *data =3D tsu;
++  gint length =3D tsu_len;
+   gboolean success =3D scan_rfc3164_timestamp(&data, &length, &wct);
+
++  cr_assert(length >=3D 0);
++  cr_assert(data =3D=3D &tsu[tsu_len - length]);
++
+   unix_time_unset(&stamp);
+   convert_wall_clock_time_to_unix_time(&wct, &stamp);
+
+@@ -70,16 +74,21 @@ _parse_rfc3164(const gchar *ts, gchar isotimestamp[32]=
)
+ }
+
+ static gboolean
+-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])
++_parse_rfc5424(const gchar *ts, gint len, gchar isotimestamp[32])
+ {
+   UnixTime stamp;
+-  const guchar *data =3D (const guchar *) ts;
+-  gint length =3D strlen(ts);
++  const guchar *tsu =3D (const guchar *) ts;
++  gint tsu_len =3D len < 0 ? strlen(ts) : len;
+   GString *result =3D g_string_new("");
+   WallClockTime wct =3D WALL_CLOCK_TIME_INIT;
+
++  const guchar *data =3D tsu;
++  gint length =3D tsu_len;
+   gboolean success =3D scan_rfc5424_timestamp(&data, &length, &wct);
+
++  cr_assert(length >=3D 0);
++  cr_assert(data =3D=3D &tsu[tsu_len - length]);
++
+   unix_time_unset(&stamp);
+   convert_wall_clock_time_to_unix_time(&wct, &stamp);
+
+@@ -90,31 +99,60 @@ _parse_rfc5424(const gchar *ts, gchar isotimestamp[32]=
)
+ }
+
+ static gboolean
+-_rfc3164_timestamp_eq(const gchar *ts, const gchar *expected, gchar conve=
rted[32])
++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar *expected, g=
char converted[32])
+ {
+-  cr_assert(_parse_rfc3164(ts, converted));
++  cr_assert(_parse_rfc3164(ts, len, converted));
+   return strcmp(converted, expected) =3D=3D 0;
+ }
+
+ static gboolean
+-_rfc5424_timestamp_eq(const gchar *ts, const gchar *expected, gchar conve=
rted[32])
++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar *expected, g=
char converted[32])
+ {
+-  cr_assert(_parse_rfc5424(ts, converted));
++  cr_assert(_parse_rfc5424(ts, len, converted));
+   return strcmp(converted, expected) =3D=3D 0;
+ }
+
+ #define _expect_rfc3164_timestamp_eq(ts, expected) \
+   ({ \
+     gchar converted[32]; \
+-    cr_expect(_rfc3164_timestamp_eq(ts, expected, converted), "Parsed RFC=
3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, expected=
=3D%s", ts, converted, expected); \
++    cr_expect(_rfc3164_timestamp_eq(ts, -1, expected, converted), "Parsed=
 RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, expect=
ed=3D%s", ts, converted, expected); \
++  })
++
++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected) \
++  ({ \
++    gchar converted[32]; \
++    cr_expect(_rfc3164_timestamp_eq(ts, len, expected, converted), "Parse=
d RFC3164 timestamp does not equal expected, ts=3D%s, converted=3D%s, expec=
ted=3D%s", ts, converted, expected); \
++  })
++
++#define _expect_rfc3164_fails(ts, len) \
++  ({  \
++    WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
++    const guchar *data =3D (guchar *) ts; \
++    gint length =3D len < 0 ? strlen(ts) : len; \
++    cr_assert_not(scan_rfc3164_timestamp(&data, &length, &wct)); \
+   })
+
+ #define _expect_rfc5424_timestamp_eq(ts, expected) \
+   ({ \
+     gchar converted[32]; \
+-    cr_expect(_rfc5424_timestamp_eq(ts, expected, converted), "Parsed RFC=
5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, expected=
=3D%s", ts, converted, expected); \
++    cr_expect(_rfc5424_timestamp_eq(ts, -1, expected, converted), "Parsed=
 RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, expect=
ed=3D%s", ts, converted, expected); \
++  })
++
++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected) \
++  ({ \
++    gchar converted[32]; \
++    cr_expect(_rfc5424_timestamp_eq(ts, len, expected, converted), "Parse=
d RFC5424 timestamp does not equal expected, ts=3D%s, converted=3D%s, expec=
ted=3D%s", ts, converted, expected); \
++  })
++
++#define _expect_rfc5424_fails(ts, len) \
++  ({  \
++    WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \
++    const guchar *data =3D (guchar *) ts; \
++    gint length =3D len < 0 ? strlen(ts) : len; \
++    cr_assert_not(scan_rfc5424_timestamp(&data, &length, &wct)); \
+   })
+
++
+ Test(parse_timestamp, standard_bsd_format)
+ {
+   _expect_rfc3164_timestamp_eq("Oct  1 17:46:12", "2017-10-01T17:46:12.00=
0+02:00");
+@@ -148,6 +186,68 @@ Test(parse_timestamp, standard_bsd_format_year_in_the=
_past)
+   _expect_rfc3164_timestamp_eq("Dec 31 17:46:12", "2017-12-31T17:46:12.00=
0+01:00");
+ }
+
++Test(parse_timestamp, non_zero_terminated_rfc3164_iso_input_is_handled_pr=
operly)
++{
++  gchar *ts =3D "2022-08-17T05:02:28.417Z whatever";
++  gint ts_len =3D 24;
++
++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.4=
17+00:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.4=
17+00:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.417+0=
0:00");
++
++  /* no "Z" parsed, timezone defaults to local, forced CET */
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1, "2022-08-17T05:02:28.4=
17+02:00");
++
++  /* msec is partially parsed as we trim the string from the right */
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2, "2022-08-17T05:02:28.4=
10+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3, "2022-08-17T05:02:28.4=
00+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4, "2022-08-17T05:02:28.0=
00+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5, "2022-08-17T05:02:28.0=
00+02:00");
++
++  for (gint i =3D 6; i < ts_len; i++)
++    _expect_rfc3164_fails(ts, ts_len - i);
++
++}
++
++Test(parse_timestamp, non_zero_terminated_rfc3164_bsd_pix_or_asa_input_is=
_handled_properly)
++{
++  gchar *ts =3D "Aug 17 2022 05:02:28: whatever";
++  gint ts_len =3D 21;
++
++  _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.0=
00+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.0=
00+02:00");
++  _expect_rfc3164_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.000+0=
2:00");
++
++  /* no ":" at the end, that's a problem, unrecognized */
++  _expect_rfc3164_fails(ts, ts_len - 1);
++
++  for (gint i =3D 1; i < ts_len; i++)
++    _expect_rfc3164_fails(ts, ts_len - i);
++}
++
++Test(parse_timestamp, non_zero_terminated_rfc5424_input_is_handled_proper=
ly)
++{
++  gchar *ts =3D "2022-08-17T05:02:28.417Z whatever";
++  gint ts_len =3D 24;
++
++  _expect_rfc5424_timestamp_len_eq(ts, strlen(ts), "2022-08-17T05:02:28.4=
17+00:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5, "2022-08-17T05:02:28.4=
17+00:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, "2022-08-17T05:02:28.417+0=
0:00");
++
++  /* no "Z" parsed, timezone defaults to local, forced CET */
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1, "2022-08-17T05:02:28.4=
17+02:00");
++
++  /* msec is partially parsed as we trim the string from the right */
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2, "2022-08-17T05:02:28.4=
10+02:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3, "2022-08-17T05:02:28.4=
00+02:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4, "2022-08-17T05:02:28.0=
00+02:00");
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5, "2022-08-17T05:02:28.0=
00+02:00");
++
++  for (gint i =3D 6; i < ts_len; i++)
++    _expect_rfc5424_fails(ts, ts_len - i);
++
++}
++
+
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_ti=
mezones)
+ {
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
new file mode 100644
index 000000000..e32076ab5
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch
@@ -0,0 +1,182 @@
+From 14bcd1596f0f194b28e3f7babc75ad90d39ae7af Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com><mailto:laszlo.varady@pr=
otonmail.com>
+Date: Sat, 20 Aug 2022 14:29:43 +0200
+Subject: [PATCH 6/8] timeutils: name repeating constant
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com><mailto:l=
aszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282cfc=
866ab56054c4
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com><mailto:ovidiu.p=
anait@windriver.com>
+---
+ lib/timeutils/scan-timestamp.c | 54 ++++++++++++++++++----------------
+ 1 file changed, 29 insertions(+), 25 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c
+index cb6802d..197e3ad 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *w=
day)
+ {
+   *wday =3D -1;
+
+-  if (*left < 3)
++  const gsize abbrev_length =3D 3;
++
++  if (*left < abbrev_length)
+     return FALSE;
+
+   switch (**buf)
+     {
+     case 'S':
+-      if (strncasecmp(*buf, "Sun", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Sun", abbrev_length) =3D=3D 0)
+         *wday =3D 0;
+-      else if (strncasecmp(*buf, "Sat", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Sat", abbrev_length) =3D=3D 0)
+         *wday =3D 6;
+       else
+         return FALSE;
+       break;
+     case 'M':
+-      if (strncasecmp(*buf, "Mon", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Mon", abbrev_length) =3D=3D 0)
+         *wday =3D 1;
+       else
+         return FALSE;
+       break;
+     case 'T':
+-      if (strncasecmp(*buf, "Tue", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Tue", abbrev_length) =3D=3D 0)
+         *wday =3D 2;
+-      else if (strncasecmp(*buf, "Thu", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Thu", abbrev_length) =3D=3D 0)
+         *wday =3D 4;
+       else
+         return FALSE;
+       break;
+     case 'W':
+-      if (strncasecmp(*buf, "Wed", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Wed", abbrev_length) =3D=3D 0)
+         *wday =3D 3;
+       else
+         return FALSE;
+       break;
+     case 'F':
+-      if (strncasecmp(*buf, "Fri", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Fri", abbrev_length) =3D=3D 0)
+         *wday =3D 5;
+       else
+         return FALSE;
+@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *wda=
y)
+       return FALSE;
+     }
+
+-  (*buf) +=3D 3;
+-  (*left) -=3D 3;
++  (*buf) +=3D abbrev_length;
++  (*left) -=3D abbrev_length;
+   return TRUE;
+ }
+
+@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint *left, gint =
*mon)
+ {
+   *mon =3D -1;
+
+-  if (*left < 3)
++  const gsize abbrev_length =3D 3;
++
++  if (*left < abbrev_length)
+     return FALSE;
+
+   switch (**buf)
+     {
+     case 'J':
+-      if (strncasecmp(*buf, "Jan", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Jan", abbrev_length) =3D=3D 0)
+         *mon =3D 0;
+-      else if (strncasecmp(*buf, "Jun", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Jun", abbrev_length) =3D=3D 0)
+         *mon =3D 5;
+-      else if (strncasecmp(*buf, "Jul", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Jul", abbrev_length) =3D=3D 0)
+         *mon =3D 6;
+       else
+         return FALSE;
+       break;
+     case 'F':
+-      if (strncasecmp(*buf, "Feb", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Feb", abbrev_length) =3D=3D 0)
+         *mon =3D 1;
+       else
+         return FALSE;
+       break;
+     case 'M':
+-      if (strncasecmp(*buf, "Mar", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Mar", abbrev_length) =3D=3D 0)
+         *mon =3D 2;
+-      else if (strncasecmp(*buf, "May", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "May", abbrev_length) =3D=3D 0)
+         *mon =3D 4;
+       else
+         return FALSE;
+       break;
+     case 'A':
+-      if (strncasecmp(*buf, "Apr", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Apr", abbrev_length) =3D=3D 0)
+         *mon =3D 3;
+-      else if (strncasecmp(*buf, "Aug", 3) =3D=3D 0)
++      else if (strncasecmp(*buf, "Aug", abbrev_length) =3D=3D 0)
+         *mon =3D 7;
+       else
+         return FALSE;
+       break;
+     case 'S':
+-      if (strncasecmp(*buf, "Sep", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Sep", abbrev_length) =3D=3D 0)
+         *mon =3D 8;
+       else
+         return FALSE;
+       break;
+     case 'O':
+-      if (strncasecmp(*buf, "Oct", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Oct", abbrev_length) =3D=3D 0)
+         *mon =3D 9;
+       else
+         return FALSE;
+       break;
+     case 'N':
+-      if (strncasecmp(*buf, "Nov", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Nov", abbrev_length) =3D=3D 0)
+         *mon =3D 10;
+       else
+         return FALSE;
+       break;
+     case 'D':
+-      if (strncasecmp(*buf, "Dec", 3) =3D=3D 0)
++      if (strncasecmp(*buf, "Dec", abbrev_length) =3D=3D 0)
+         *mon =3D 11;
+       else
+         return FALSE;
+@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint *left, gint =
*mon)
+       return FALSE;
+     }
+
+-  (*buf) +=3D 3;
+-  (*left) -=3D 3;
++  (*buf) +=3D abbrev_length;
++  (*left) -=3D abbrev_length;
+   return TRUE;
+ }
+
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
new file mode 100644
index 000000000..b3135df4e
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch
@@ -0,0 +1,84 @@
+From d4c8ba0c513052b5f19c6e989ba31f847f4900d1 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com><mailto:laszlo.varady@pr=
otonmail.com>
+Date: Sat, 20 Aug 2022 14:30:22 +0200
+Subject: [PATCH 7/8] timeutils: fix invalid calculation of ISO timestamp
+ length
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com><mailto:l=
aszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4d=
ac7102235396
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com><mailto:ovidiu.p=
anait@windriver.com>
+---
+ lib/timeutils/scan-timestamp.c            | 8 ++++++--
+ lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++
+ 2 files changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c
+index 197e3ad..4e618e4 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -346,19 +346,21 @@ __parse_usec(const guchar **data, gint *length)
+ static gboolean
+ __has_iso_timezone(const guchar *src, gint length)
+ {
+-  return (length >=3D 5) &&
++  return (length >=3D 6) &&
+          (*src =3D=3D '+' || *src =3D=3D '-') &&
+          isdigit(*(src+1)) &&
+          isdigit(*(src+2)) &&
+          *(src+3) =3D=3D ':' &&
+          isdigit(*(src+4)) &&
+          isdigit(*(src+5)) &&
+-         !isdigit(*(src+6));
++         (length < 7 || !isdigit(*(src+6)));
+ }
+
+ static guint32
+ __parse_iso_timezone(const guchar **data, gint *length)
+ {
++  g_assert(*length >=3D 6);
++
+   gint hours, mins;
+   const guchar *src =3D *data;
+   guint32 tz =3D 0;
+@@ -368,8 +370,10 @@ __parse_iso_timezone(const guchar **data, gint *lengt=
h)
+   hours =3D (*(src + 1) - '0') * 10 + *(src + 2) - '0';
+   mins =3D (*(src + 4) - '0') * 10 + *(src + 5) - '0';
+   tz =3D sign * (hours * 3600 + mins * 60);
++
+   src +=3D 6;
+   (*length) -=3D 6;
++
+   *data =3D src;
+   return tz;
+ }
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tes=
ts/test_scan-timestamp.c
+index da375c8..9b38738 100644
+--- a/lib/timeutils/tests/test_scan-timestamp.c
++++ b/lib/timeutils/tests/test_scan-timestamp.c
+@@ -248,6 +248,13 @@ Test(parse_timestamp, non_zero_terminated_rfc5424_inp=
ut_is_handled_properly)
+
+ }
+
++Test(parse_timestamp, non_zero_terminated_rfc5424_timestamp_only)
++{
++  const gchar *ts =3D "2022-08-17T05:02:28.417+03:00";
++  gint ts_len =3D strlen(ts);
++  _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);
++}
++
+
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_ti=
mezones)
+ {
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
new file mode 100644
index 000000000..cec573fa2
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch
@@ -0,0 +1,47 @@
+From f60dcfa9e094dc9c2a752115ca426159c4ae4192 Mon Sep 17 00:00:00 2001
+From: Laszlo Varady <laszlo.varady@protonmail.com><mailto:laszlo.varady@pr=
otonmail.com>
+Date: Sat, 20 Aug 2022 14:30:51 +0200
+Subject: [PATCH 8/8] timeutils: fix out-of-bounds reading of data buffer
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: L=E1szl=F3 V=E1rady <laszlo.varady@protonmail.com><mailto:l=
aszlo.varady@protonmail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2022-38725
+
+Reference to upstream patch:
+https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e=
4eaf959a044d
+
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com><mailto:ovidiu.p=
anait@windriver.com>
+---
+ lib/timeutils/scan-timestamp.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c
+index 4e618e4..0f7f52e 100644
+--- a/lib/timeutils/scan-timestamp.c
++++ b/lib/timeutils/scan-timestamp.c
+@@ -427,7 +427,7 @@ __parse_bsd_timestamp(const guchar **data, gint *lengt=
h, WallClockTime *wct)
+       if (!scan_pix_timestamp((const gchar **) &src, &left, wct))
+         return FALSE;
+
+-      if (*src =3D=3D ':')
++      if (left && *src =3D=3D ':')
+         {
+           src++;
+           left--;
+@@ -478,7 +478,7 @@ scan_rfc3164_timestamp(const guchar **data, gint *leng=
th, WallClockTime *wct)
+    * looking at you, skip that as well, so we can reliably detect IPv6
+    * addresses as hostnames, which would be using ":" as well. */
+
+-  if (*src =3D=3D ':')
++  if (left && *src =3D=3D ':')
+     {
+       ++src;
+       --left;
+--
+2.37.3
+
+
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/meta-o=
e/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
index 40bbfe495..5fc386e56 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb
@@ -22,6 +22,14 @@ SRC_URI =3D "https://github.com/balabit/syslog-ng/releas=
es/download/${BP}/${BP}.ta
            file://volatiles.03_syslog-ng \
            file://syslog-ng-tmp.conf \
            file://syslog-ng.service-the-syslog-ng-service.patch \
+          file://CVE-2022-38725-0001.patch \
+          file://CVE-2022-38725-0002.patch \
+          file://CVE-2022-38725-0003.patch \
+          file://CVE-2022-38725-0004.patch \
+          file://CVE-2022-38725-0005.patch \
+          file://CVE-2022-38725-0006.patch \
+          file://CVE-2022-38725-0007.patch \
+          file://CVE-2022-38725-0008.patch \
 "

 SRC_URI[sha256sum] =3D "90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f1=
1ff5eea049e60b"
--
2.34.1


Sent from Mail<https://go.microsoft.com/fwlink/?LinkId=3D550986> for Window=
s




-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

Links: You receive all messages sent to this group.

View/Reply Online (#99684): https://lists.openembedded.org/g/openembedded-d=
evel/message/99684

Mute This Topic: https://lists.openembedded.org/mt/95194280/3616765

Group Owner: openembedded-devel+owner@lists.openembedded.org<mailto:openemb=
edded-devel+owner@lists.openembedded.org>

Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ran=
dy.macleod@windriver.com<mailto:randy.macleod@windriver.com>]

-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-





--

# Randy MacLeod

# Wind River Linux


--_000_BL0PR11MB34107DD5DF3BD3449EE2772F9F0F9BL0PR11MB3410namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
pre
	{mso-style-priority:99;
	mso-style-link:"HTML Preformatted Char";
	margin:0cm;
	font-size:10.0pt;
	font-family:"Courier New";}
span.HTMLPreformattedChar
	{mso-style-name:"HTML Preformatted Char";
	mso-style-priority:99;
	mso-style-link:"HTML Preformatted";
	font-family:"Courier New";}
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
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
Fix buffer handling of syslog and timestamp parsers.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-38725">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-38725</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/releases">https://github.=
com/syslog-ng/syslog-ng/releases</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/pull/4110">https://github=
.com/syslog-ng/syslog-ng/pull/4110</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f5=
08436a12e4d4163f94b1b8">https://github.com/syslog-ng/syslog-ng/commit/b5a06=
0f2ebb8d794f508436a12e4d4163f94b1b8</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376=
d3a30f96f51df3f2879f8a">https://github.com/syslog-ng/syslog-ng/commit/81a07=
263f1e522a376d3a30f96f51df3f2879f8a</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8=
751a305eb7eeefab8dc89d">https://github.com/syslog-ng/syslog-ng/commit/4b8dc=
56ca8eaeac4c8751a305eb7eeefab8dc89d</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4=
824baa83a04931279abb37">https://github.com/syslog-ng/syslog-ng/commit/73b5c=
300b8fde5e7a4824baa83a04931279abb37</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4=
f92b9339fe67c6798a0321">https://github.com/syslog-ng/syslog-ng/commit/45f05=
1239312e43bd4f92b9339fe67c6798a0321</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff=
8cbd282cfc866ab56054c4">https://github.com/syslog-ng/syslog-ng/commit/09f48=
9c89c826293ff8cbd282cfc866ab56054c4</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fb=
d464c35f4dac7102235396">https://github.com/syslog-ng/syslog-ng/commit/8c6e2=
c1c41b0fcc5fbd464c35f4dac7102235396</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c=
96607c4b9e4eaf959a044d">https://github.com/syslog-ng/syslog-ng/commit/56f88=
1c5eaa3d8c02c96607c4b9e4eaf959a044d</a><br>
<br>
Signed-off-by: Yogita Urade &lt;yogita.urade@windriver.com&gt;<br>
---<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0001.patch |&nbsp; 67 ++++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0002.patch | 152 +++++++++++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0003.patch |&nbsp; 79 +++++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0004.patch |&nbsp; 40 ++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0005.patch | 213 +++++++++++++++++=
+<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0006.patch | 182 +++++++++++++++<b=
r>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0007.patch |&nbsp; 84 +++++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0008.patch |&nbsp; 47 ++++<br>
&nbsp;.../syslog-ng/syslog-ng_3.36.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +<br>
&nbsp;9 files changed, 872 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0001.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0002.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0003.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0004.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0005.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0006.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0007.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0008.patch<br>
<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch<br>
new file mode 100644<br>
index 000000000..cd6a93d8e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch<br>
@@ -0,0 +1,67 @@<br>
+From c6e7195075fd4fbd3db04e187f6d75030d17cb6b Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady &lt;laszlo.varady@protonmail.com&gt;<br>
+Date: Sat, 20 Aug 2022 12:26:05 +0200<br>
+Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading of data buffe=
r<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady &lt;laszlo.varady@protonmail.com&gt;<br=
>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4=
d4163f94b1b8<br>
+<br>
+Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
+---<br>
+ modules/syslogformat/syslog-format.c | 10 +++++++---<br>
+ 1 file changed, 7 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/s=
yslog-format.c<br>
+index 38bb6f6..9042396 100644<br>
+--- a/modules/syslogformat/syslog-format.c<br>
++++ b/modules/syslogformat/syslog-format.c<br>
+@@ -223,6 +223,9 @@ log_msg_parse_cisco_timestamp_attributes(LogMessage *s=
elf, const guchar **data,<br>
+&nbsp;&nbsp; const guchar *src =3D *data;<br>
+&nbsp;&nbsp; gint left =3D *length;<br>
+ <br>
++&nbsp; if (!left)<br>
++&nbsp;&nbsp;&nbsp; return;<br>
++<br>
+&nbsp;&nbsp; /* Cisco timestamp extensions, the first '*' indicates that t=
he clock is<br>
+&nbsp;&nbsp;&nbsp; * unsynced, '.' if it is known to be synced */<br>
+&nbsp;&nbsp; if (G_UNLIKELY(src[0] =3D=3D '*'))<br>
+@@ -556,7 +559,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; open_sd++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!isascii(*src)=
 || *src =3D=3D '=3D' || *src =3D=3D ' ' || *src =3D=3D ']' || *src =3D=3D =
'&quot;')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!left || !isas=
cii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' || *src =3D=3D ']' || *sr=
c =3D=3D '&quot;')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
oto error;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* read sd_id=
 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos =3D 0;<br=
>
+@@ -589,7 +592,8 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sd_id_len =3D=
 pos;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(sd_val=
ue_name, logmsg_sd_prefix);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strncpy(sd_va=
lue_name + logmsg_sd_prefix_len, sd_id_name, sizeof(sd_value_name) - logmsg=
_sd_prefix_len);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*src =3D=3D ']=
')<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (left &amp;&amp=
; *src =3D=3D ']')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; log_msg_set_value_by_name(self, sd_value_name, &quot;&quot;, 0);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
+@@ -606,7 +610,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; goto error;<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' || *src =
=3D=3D ']' || *src =3D=3D '&quot;')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' |=
| *src =3D=3D ']' || *src =3D=3D '&quot;')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; goto error;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* read sd-param */<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch<br>
new file mode 100644<br>
index 000000000..ac5bc78a5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch<br>
@@ -0,0 +1,152 @@<br>
+From f8f985cd0902e0fa8306f988fb183f1987ab7d3b Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady &lt;laszlo.varady@protonmail.com&gt;<br>
+Date: Sat, 20 Aug 2022 12:22:44 +0200<br>
+Subject: [PATCH 2/8] syslogformat: add bug reproducer test for non-zero<br=
>
+ terminated input<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady &lt;laszlo.varady@protonmail.com&gt;<br=
>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96f5=
1df3f2879f8a<br>
+<br>
+Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
+---<br>
+ modules/syslogformat/CMakeLists.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
+ modules/syslogformat/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +<br>
+ modules/syslogformat/tests/CMakeLists.txt&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
 1 +<br>
+ modules/syslogformat/tests/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 9 +++<br>
+ .../syslogformat/tests/test_syslog_format.c&nbsp;&nbsp; | 72 ++++++++++++=
+++++++<br>
+ 5 files changed, 85 insertions(+)<br>
+ create mode 100644 modules/syslogformat/tests/CMakeLists.txt<br>
+ create mode 100644 modules/syslogformat/tests/Makefile.am<br>
+ create mode 100644 modules/syslogformat/tests/test_syslog_format.c<br>
+<br>
+diff --git a/modules/syslogformat/CMakeLists.txt b/modules/syslogformat/CM=
akeLists.txt<br>
+index 94ee01a..64848ef 100644<br>
+--- a/modules/syslogformat/CMakeLists.txt<br>
++++ b/modules/syslogformat/CMakeLists.txt<br>
+@@ -14,3 +14,4 @@ add_module(<br>
+&nbsp;&nbsp; SOURCES ${SYSLOGFORMAT_SOURCES}<br>
+ )<br>
+ <br>
++add_test_subdirectory(tests)<br>
+diff --git a/modules/syslogformat/Makefile.am b/modules/syslogformat/Makef=
ile.am<br>
+index f13f88c..14cdf58 100644<br>
+--- a/modules/syslogformat/Makefile.am<br>
++++ b/modules/syslogformat/Makefile.am<br>
+@@ -31,3 +31,5 @@ modules_syslogformat_libsyslogformat_la_DEPENDENCIES =3D=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
+ modules/syslogformat modules/syslogformat/ mod-syslogformat: \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modules/syslogformat/libsyslogf=
ormat.la<br>
+ .PHONY: modules/syslogformat/ mod-syslogformat<br>
++<br>
++include modules/syslogformat/tests/Makefile.am<br>
+diff --git a/modules/syslogformat/tests/CMakeLists.txt b/modules/syslogfor=
mat/tests/CMakeLists.txt<br>
+new file mode 100644<br>
+index 0000000..2e45b71<br>
+--- /dev/null<br>
++++ b/modules/syslogformat/tests/CMakeLists.txt<br>
+@@ -0,0 +1 @@<br>
++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS syslogformat)<b=
r>
+diff --git a/modules/syslogformat/tests/Makefile.am b/modules/syslogformat=
/tests/Makefile.am<br>
+new file mode 100644<br>
+index 0000000..7ee66a5<br>
+--- /dev/null<br>
++++ b/modules/syslogformat/tests/Makefile.am<br>
+@@ -0,0 +1,9 @@<br>
++modules_syslogformat_tests_TESTS =3D \<br>
++&nbsp;&nbsp;&nbsp; modules/syslogformat/tests/test_syslog_format<br>
++<br>
++check_PROGRAMS +=3D ${modules_syslogformat_tests_TESTS}<br>
++<br>
++EXTRA_DIST +=3D modules/syslogformat/tests/CMakeLists.txt<br>
++<br>
++modules_syslogformat_tests_test_syslog_format_CFLAGS =3D $(TEST_CFLAGS) -=
I$(top_srcdir)/modules/syslogformat<br>
++modules_syslogformat_tests_test_syslog_format_LDADD =3D $(TEST_LDADD) $(P=
REOPEN_SYSLOGFORMAT)<br>
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/sys=
logformat/tests/test_syslog_format.c<br>
+new file mode 100644<br>
+index 0000000..b247fe3<br>
+--- /dev/null<br>
++++ b/modules/syslogformat/tests/test_syslog_format.c<br>
+@@ -0,0 +1,72 @@<br>
++/*<br>
++ * Copyright (c) 2022 One Identity<br>
++ * Copyright (c) 2022 L=E1szl=F3 V=E1rady<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify i=
t<br>
++ * under the terms of the GNU General Public License version 2 as publish=
ed<br>
++ * by the Free Software Foundation, or (at your option) any later version=
.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; See the<br>
++ * GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA&nbsp; 02110-=
1301&nbsp; USA<br>
++ *<br>
++ * As an additional exemption you are allowed to compile &amp; link again=
st the<br>
++ * OpenSSL libraries as published by the OpenSSL project. See the file<br=
>
++ * COPYING for details.<br>
++ *<br>
++ */<br>
++<br>
++#include &lt;criterion/criterion.h&gt;<br>
++<br>
++#include &quot;apphook.h&quot;<br>
++#include &quot;cfg.h&quot;<br>
++#include &quot;syslog-format.h&quot;<br>
++#include &quot;logmsg/logmsg.h&quot;<br>
++#include &quot;msg-format.h&quot;<br>
++#include &quot;scratch-buffers.h&quot;<br>
++<br>
++#include &lt;string.h&gt;<br>
++<br>
++GlobalConfig *cfg;<br>
++MsgFormatOptions parse_options;<br>
++<br>
++static void<br>
++setup(void)<br>
++{<br>
++&nbsp; app_startup();<br>
++&nbsp; syslog_format_init();<br>
++<br>
++&nbsp; cfg =3D cfg_new_snippet();<br>
++&nbsp; msg_format_options_defaults(&amp;parse_options);<br>
++}<br>
++<br>
++static void<br>
++teardown(void)<br>
++{<br>
++&nbsp; scratch_buffers_explicit_gc();<br>
++&nbsp; app_shutdown();<br>
++&nbsp; cfg_free(cfg);<br>
++}<br>
++<br>
++TestSuite(syslog_format, .init =3D setup, .fini =3D teardown);<br>
++<br>
++Test(syslog_format, parser_should_not_spin_on_non_zero_terminated_input, =
.timeout =3D 10)<br>
++{<br>
++&nbsp; const gchar *data =3D &quot;&lt;182&gt;2022-08-17T05:02:28.217 mym=
achine su: 'su root' failed for lonvick on /dev/pts/8&quot;;<br>
++&nbsp; /* chosen carefully to reproduce a bug */<br>
++&nbsp; gsize data_length =3D 27;<br>
++<br>
++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
++&nbsp; LogMessage *msg =3D msg_format_construct_message(&amp;parse_option=
s, (const guchar *) data, data_length);<br>
++<br>
++&nbsp; gsize problem_position;<br>
++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gu=
char *) data, data_length, &amp;problem_position));<br>
++<br>
++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
++&nbsp; log_msg_unref(msg);<br>
++}<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch<br>
new file mode 100644<br>
index 000000000..34e6b65d2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch<br>
@@ -0,0 +1,79 @@<br>
+From 041ccdf8a4c73cd3138dac0611272361f384fb81 Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady &lt;laszlo.varady@protonmail.com&gt;<br>
+Date: Sun, 21 Aug 2022 18:44:28 +0200<br>
+Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence id out of bo=
unds<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady &lt;laszlo.varady@protonmail.com&gt;<br=
>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7=
eeefab8dc89d<br>
+<br>
+Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
+---<br>
+ modules/syslogformat/syslog-format.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
+ .../syslogformat/tests/test_syslog_format.c&nbsp;&nbsp; | 32 ++++++++++++=
+++++++<br>
+ 2 files changed, 33 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/s=
yslog-format.c<br>
+index 9042396..fe829fb 100644<br>
+--- a/modules/syslogformat/syslog-format.c<br>
++++ b/modules/syslogformat/syslog-format.c<br>
+@@ -207,7 +207,7 @@ log_msg_parse_cisco_sequence_id(LogMessage *self, cons=
t guchar **data, gint *len<br>
+ <br>
+&nbsp;&nbsp; /* if the next char is not space, then we may try to read a d=
ate */<br>
+ <br>
+-&nbsp; if (*src !=3D ' ')<br>
++&nbsp; if (!left || *src !=3D ' ')<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+ <br>
+&nbsp;&nbsp; log_msg_set_value(self, handles.cisco_seqid, (gchar *) *data,=
 *length - left - 1);<br>
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/sys=
logformat/tests/test_syslog_format.c<br>
+index b247fe3..d0f5b40 100644<br>
+--- a/modules/syslogformat/tests/test_syslog_format.c<br>
++++ b/modules/syslogformat/tests/test_syslog_format.c<br>
+@@ -70,3 +70,35 @@ Test(syslog_format, parser_should_not_spin_on_non_zero_=
terminated_input, .timeou<br>
+&nbsp;&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
+&nbsp;&nbsp; log_msg_unref(msg);<br>
+ }<br>
++<br>
++Test(syslog_format, cisco_sequence_id_non_zero_termination)<br>
++{<br>
++&nbsp; const gchar *data =3D &quot;&lt;189&gt;65536: &quot;;<br>
++&nbsp; gsize data_length =3D strlen(data);<br>
++<br>
++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
++&nbsp; LogMessage *msg =3D msg_format_construct_message(&amp;parse_option=
s, (const guchar *) data, data_length);<br>
++<br>
++&nbsp; gsize problem_position;<br>
++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gu=
char *) data, data_length, &amp;problem_position));<br>
++&nbsp; cr_assert_str_eq(log_msg_get_value_by_name(msg, &quot;.SDATA.meta.=
sequenceId&quot;, NULL), &quot;65536&quot;);<br>
++<br>
++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
++&nbsp; log_msg_unref(msg);<br>
++}<br>
++<br>
++Test(syslog_format, minimal_non_zero_terminated_numeric_message_is_parsed=
_as_program_name)<br>
++{<br>
++&nbsp; const gchar *data =3D &quot;&lt;189&gt;65536&quot;;<br>
++&nbsp; gsize data_length =3D strlen(data);<br>
++<br>
++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
++&nbsp; LogMessage *msg =3D msg_format_construct_message(&amp;parse_option=
s, (const guchar *) data, data_length);<br>
++<br>
++&nbsp; gsize problem_position;<br>
++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gu=
char *) data, data_length, &amp;problem_position));<br>
++&nbsp; cr_assert_str_eq(log_msg_get_value_by_name(msg, &quot;PROGRAM&quot=
;, NULL), &quot;65536&quot;);<br>
++<br>
++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
++&nbsp; log_msg_unref(msg);<br>
++}<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch<br>
new file mode 100644<br>
index 000000000..cfad5a378<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch<br>
@@ -0,0 +1,40 @@<br>
+From bea4678261328c841b6062014394e6d3230a2fdb Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady &lt;laszlo.varady@protonmail.com&gt;<br>
+Date: Sat, 20 Aug 2022 12:42:38 +0200<br>
+Subject: [PATCH 4/8] timeutils: fix iterating out of the range of timestam=
p<br>
+ buffer<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady &lt;laszlo.varady@protonmail.com&gt;<br=
>
+Signed-off-by: Balazs Scheidler &lt;bazsi77@gmail.com&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a0=
4931279abb37<br>
+<br>
+Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
+---<br>
+ lib/timeutils/scan-timestamp.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c<br>
+index 2f6a6b7..cb6802d 100644<br>
+--- a/lib/timeutils/scan-timestamp.c<br>
++++ b/lib/timeutils/scan-timestamp.c<br>
+@@ -328,7 +328,7 @@ __parse_usec(const guchar **data, gint *length)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*length)--;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (isdigit(*src))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (*length &gt; 0 &amp;&amp; isdigit(*=
src))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*length)--;<=
br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch<br>
new file mode 100644<br>
index 000000000..487118957<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch<br>
@@ -0,0 +1,213 @@<br>
+From 1f62031101608bee8ad772967eb8151aa33d6e1a Mon Sep 17 00:00:00 2001<br>
+From: Balazs Scheidler &lt;bazsi77@gmail.com&gt;<br>
+Date: Sat, 20 Aug 2022 12:43:42 +0200<br>
+Subject: [PATCH 5/8] timeutils: add tests for non-zero terminated inputs<b=
r>
+<br>
+Signed-off-by: Balazs Scheidler &lt;bazsi77@gmail.com&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339fe=
67c6798a0321<br>
+<br>
+Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
+---<br>
+ lib/timeutils/tests/test_scan-timestamp.c | 126 +++++++++++++++++++---<br=
>
+ 1 file changed, 113 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tes=
ts/test_scan-timestamp.c<br>
+index 2756bf3..da375c8 100644<br>
+--- a/lib/timeutils/tests/test_scan-timestamp.c<br>
++++ b/lib/timeutils/tests/test_scan-timestamp.c<br>
+@@ -49,17 +49,21 @@ fake_time_add(time_t diff)<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])<br>
++_parse_rfc3164(const gchar *ts, gint len, gchar isotimestamp[32])<br>
+ {<br>
+&nbsp;&nbsp; UnixTime stamp;<br>
+-&nbsp; const guchar *data =3D (const guchar *) ts;<br>
+-&nbsp; gint length =3D strlen(ts);<br>
++&nbsp; const guchar *tsu =3D (const guchar *) ts;<br>
++&nbsp; gint tsu_len =3D len &lt; 0 ? strlen(ts) : len;<br>
+&nbsp;&nbsp; GString *result =3D g_string_new(&quot;&quot;);<br>
+&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT;<br>
+ <br>
+-<br>
++&nbsp; const guchar *data =3D tsu;<br>
++&nbsp; gint length =3D tsu_len;<br>
+&nbsp;&nbsp; gboolean success =3D scan_rfc3164_timestamp(&amp;data, &amp;l=
ength, &amp;wct);<br>
+ <br>
++&nbsp; cr_assert(length &gt;=3D 0);<br>
++&nbsp; cr_assert(data =3D=3D &amp;tsu[tsu_len - length]);<br>
++<br>
+&nbsp;&nbsp; unix_time_unset(&amp;stamp);<br>
+&nbsp;&nbsp; convert_wall_clock_time_to_unix_time(&amp;wct, &amp;stamp);<b=
r>
+ <br>
+@@ -70,16 +74,21 @@ _parse_rfc3164(const gchar *ts, gchar isotimestamp[32]=
)<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])<br>
++_parse_rfc5424(const gchar *ts, gint len, gchar isotimestamp[32])<br>
+ {<br>
+&nbsp;&nbsp; UnixTime stamp;<br>
+-&nbsp; const guchar *data =3D (const guchar *) ts;<br>
+-&nbsp; gint length =3D strlen(ts);<br>
++&nbsp; const guchar *tsu =3D (const guchar *) ts;<br>
++&nbsp; gint tsu_len =3D len &lt; 0 ? strlen(ts) : len;<br>
+&nbsp;&nbsp; GString *result =3D g_string_new(&quot;&quot;);<br>
+&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT;<br>
+ <br>
++&nbsp; const guchar *data =3D tsu;<br>
++&nbsp; gint length =3D tsu_len;<br>
+&nbsp;&nbsp; gboolean success =3D scan_rfc5424_timestamp(&amp;data, &amp;l=
ength, &amp;wct);<br>
+ <br>
++&nbsp; cr_assert(length &gt;=3D 0);<br>
++&nbsp; cr_assert(data =3D=3D &amp;tsu[tsu_len - length]);<br>
++<br>
+&nbsp;&nbsp; unix_time_unset(&amp;stamp);<br>
+&nbsp;&nbsp; convert_wall_clock_time_to_unix_time(&amp;wct, &amp;stamp);<b=
r>
+ <br>
+@@ -90,31 +99,60 @@ _parse_rfc5424(const gchar *ts, gchar isotimestamp[32]=
)<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-_rfc3164_timestamp_eq(const gchar *ts, const gchar *expected, gchar conve=
rted[32])<br>
++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar *expected, g=
char converted[32])<br>
+ {<br>
+-&nbsp; cr_assert(_parse_rfc3164(ts, converted));<br>
++&nbsp; cr_assert(_parse_rfc3164(ts, len, converted));<br>
+&nbsp;&nbsp; return strcmp(converted, expected) =3D=3D 0;<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-_rfc5424_timestamp_eq(const gchar *ts, const gchar *expected, gchar conve=
rted[32])<br>
++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar *expected, g=
char converted[32])<br>
+ {<br>
+-&nbsp; cr_assert(_parse_rfc5424(ts, converted));<br>
++&nbsp; cr_assert(_parse_rfc5424(ts, len, converted));<br>
+&nbsp;&nbsp; return strcmp(converted, expected) =3D=3D 0;<br>
+ }<br>
+ <br>
+ #define _expect_rfc3164_timestamp_eq(ts, expected) \<br>
+&nbsp;&nbsp; ({ \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
+-&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, expected, converte=
d), &quot;Parsed RFC3164 timestamp does not equal expected, ts=3D%s, conver=
ted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, -1, expected, conv=
erted), &quot;Parsed RFC3164 timestamp does not equal expected, ts=3D%s, co=
nverted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp; })<br>
++<br>
++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected) \<br>
++&nbsp; ({ \<br>
++&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
++&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, len, expected, con=
verted), &quot;Parsed RFC3164 timestamp does not equal expected, ts=3D%s, c=
onverted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp; })<br>
++<br>
++#define _expect_rfc3164_fails(ts, len) \<br>
++&nbsp; ({&nbsp; \<br>
++&nbsp;&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \<br>
++&nbsp;&nbsp;&nbsp; const guchar *data =3D (guchar *) ts; \<br>
++&nbsp;&nbsp;&nbsp; gint length =3D len &lt; 0 ? strlen(ts) : len; \<br>
++&nbsp;&nbsp;&nbsp; cr_assert_not(scan_rfc3164_timestamp(&amp;data, &amp;l=
ength, &amp;wct)); \<br>
+&nbsp;&nbsp; })<br>
+ <br>
+ #define _expect_rfc5424_timestamp_eq(ts, expected) \<br>
+&nbsp;&nbsp; ({ \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
+-&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, expected, converte=
d), &quot;Parsed RFC5424 timestamp does not equal expected, ts=3D%s, conver=
ted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, -1, expected, conv=
erted), &quot;Parsed RFC5424 timestamp does not equal expected, ts=3D%s, co=
nverted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp; })<br>
++<br>
++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected) \<br>
++&nbsp; ({ \<br>
++&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
++&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, len, expected, con=
verted), &quot;Parsed RFC5424 timestamp does not equal expected, ts=3D%s, c=
onverted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp; })<br>
++<br>
++#define _expect_rfc5424_fails(ts, len) \<br>
++&nbsp; ({&nbsp; \<br>
++&nbsp;&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \<br>
++&nbsp;&nbsp;&nbsp; const guchar *data =3D (guchar *) ts; \<br>
++&nbsp;&nbsp;&nbsp; gint length =3D len &lt; 0 ? strlen(ts) : len; \<br>
++&nbsp;&nbsp;&nbsp; cr_assert_not(scan_rfc5424_timestamp(&amp;data, &amp;l=
ength, &amp;wct)); \<br>
+&nbsp;&nbsp; })<br>
+ <br>
++<br>
+ Test(parse_timestamp, standard_bsd_format)<br>
+ {<br>
+&nbsp;&nbsp; _expect_rfc3164_timestamp_eq(&quot;Oct&nbsp; 1 17:46:12&quot;=
, &quot;2017-10-01T17:46:12.000+02:00&quot;);<br>
+@@ -148,6 +186,68 @@ Test(parse_timestamp, standard_bsd_format_year_in_the=
_past)<br>
+&nbsp;&nbsp; _expect_rfc3164_timestamp_eq(&quot;Dec 31 17:46:12&quot;, &qu=
ot;2017-12-31T17:46:12.000+01:00&quot;);<br>
+ }<br>
+ <br>
++Test(parse_timestamp, non_zero_terminated_rfc3164_iso_input_is_handled_pr=
operly)<br>
++{<br>
++&nbsp; gchar *ts =3D &quot;2022-08-17T05:02:28.417Z whatever&quot;;<br>
++&nbsp; gint ts_len =3D 24;<br>
++<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T=
05:02:28.417+00:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T=
05:02:28.417+00:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:0=
2:28.417+00:00&quot;);<br>
++<br>
++&nbsp; /* no &quot;Z&quot; parsed, timezone defaults to local, forced CET=
 */<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1, &quot;2022-08-17T=
05:02:28.417+02:00&quot;);<br>
++<br>
++&nbsp; /* msec is partially parsed as we trim the string from the right *=
/<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2, &quot;2022-08-17T=
05:02:28.410+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3, &quot;2022-08-17T=
05:02:28.400+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++<br>
++&nbsp; for (gint i =3D 6; i &lt; ts_len; i++)<br>
++&nbsp;&nbsp;&nbsp; _expect_rfc3164_fails(ts, ts_len - i);<br>
++<br>
++}<br>
++<br>
++Test(parse_timestamp, non_zero_terminated_rfc3164_bsd_pix_or_asa_input_is=
_handled_properly)<br>
++{<br>
++&nbsp; gchar *ts =3D &quot;Aug 17 2022 05:02:28: whatever&quot;;<br>
++&nbsp; gint ts_len =3D 21;<br>
++<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:0=
2:28.000+02:00&quot;);<br>
++<br>
++&nbsp; /* no &quot;:&quot; at the end, that's a problem, unrecognized */<=
br>
++&nbsp; _expect_rfc3164_fails(ts, ts_len - 1);<br>
++<br>
++&nbsp; for (gint i =3D 1; i &lt; ts_len; i++)<br>
++&nbsp;&nbsp;&nbsp; _expect_rfc3164_fails(ts, ts_len - i);<br>
++}<br>
++<br>
++Test(parse_timestamp, non_zero_terminated_rfc5424_input_is_handled_proper=
ly)<br>
++{<br>
++&nbsp; gchar *ts =3D &quot;2022-08-17T05:02:28.417Z whatever&quot;;<br>
++&nbsp; gint ts_len =3D 24;<br>
++<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T=
05:02:28.417+00:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T=
05:02:28.417+00:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:0=
2:28.417+00:00&quot;);<br>
++<br>
++&nbsp; /* no &quot;Z&quot; parsed, timezone defaults to local, forced CET=
 */<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1, &quot;2022-08-17T=
05:02:28.417+02:00&quot;);<br>
++<br>
++&nbsp; /* msec is partially parsed as we trim the string from the right *=
/<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2, &quot;2022-08-17T=
05:02:28.410+02:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3, &quot;2022-08-17T=
05:02:28.400+02:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++<br>
++&nbsp; for (gint i =3D 6; i &lt; ts_len; i++)<br>
++&nbsp;&nbsp;&nbsp; _expect_rfc5424_fails(ts, ts_len - i);<br>
++<br>
++}<br>
++<br>
+ <br>
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_ti=
mezones)<br>
+ {<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch<br>
new file mode 100644<br>
index 000000000..e32076ab5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch<br>
@@ -0,0 +1,182 @@<br>
+From 14bcd1596f0f194b28e3f7babc75ad90d39ae7af Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady &lt;laszlo.varady@protonmail.com&gt;<br>
+Date: Sat, 20 Aug 2022 14:29:43 +0200<br>
+Subject: [PATCH 6/8] timeutils: name repeating constant<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady &lt;laszlo.varady@protonmail.com&gt;<br=
>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282cfc=
866ab56054c4<br>
+<br>
+Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
+---<br>
+ lib/timeutils/scan-timestamp.c | 54 ++++++++++++++++++----------------<br=
>
+ 1 file changed, 29 insertions(+), 25 deletions(-)<br>
+<br>
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c<br>
+index cb6802d..197e3ad 100644<br>
+--- a/lib/timeutils/scan-timestamp.c<br>
++++ b/lib/timeutils/scan-timestamp.c<br>
+@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *w=
day)<br>
+ {<br>
+&nbsp;&nbsp; *wday =3D -1;<br>
+ <br>
+-&nbsp; if (*left &lt; 3)<br>
++&nbsp; const gsize abbrev_length =3D 3;<br>
++<br>
++&nbsp; if (*left &lt; abbrev_length)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+ <br>
+&nbsp;&nbsp; switch (**buf)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'S':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Sun&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Sun&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 0;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Sat&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Sat&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 6;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'M':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mon&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mon&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'T':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Tue&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Tue&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Thu&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Thu&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'W':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Wed&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Wed&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'F':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Fri&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Fri&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 5;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *wda=
y)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp; (*buf) +=3D 3;<br>
+-&nbsp; (*left) -=3D 3;<br>
++&nbsp; (*buf) +=3D abbrev_length;<br>
++&nbsp; (*left) -=3D abbrev_length;<br>
+&nbsp;&nbsp; return TRUE;<br>
+ }<br>
+ <br>
+@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint *left, gint =
*mon)<br>
+ {<br>
+&nbsp;&nbsp; *mon =3D -1;<br>
+ <br>
+-&nbsp; if (*left &lt; 3)<br>
++&nbsp; const gsize abbrev_length =3D 3;<br>
++<br>
++&nbsp; if (*left &lt; abbrev_length)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+ <br>
+&nbsp;&nbsp; switch (**buf)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'J':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Jan&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Jan&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 0;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Jun&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Jun&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 5;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Jul&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Jul&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 6;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'F':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Feb&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Feb&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'M':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mar&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mar&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;May&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;May&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'A':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Apr&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Apr&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 3;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Aug&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Aug&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 7;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'S':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Sep&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Sep&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 8;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'O':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Oct&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Oct&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 9;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'N':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Nov&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Nov&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 10;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'D':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Dec&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Dec&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 11;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint *left, gint =
*mon)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp; (*buf) +=3D 3;<br>
+-&nbsp; (*left) -=3D 3;<br>
++&nbsp; (*buf) +=3D abbrev_length;<br>
++&nbsp; (*left) -=3D abbrev_length;<br>
+&nbsp;&nbsp; return TRUE;<br>
+ }<br>
+ <br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch<br>
new file mode 100644<br>
index 000000000..b3135df4e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch<br>
@@ -0,0 +1,84 @@<br>
+From d4c8ba0c513052b5f19c6e989ba31f847f4900d1 Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady &lt;laszlo.varady@protonmail.com&gt;<br>
+Date: Sat, 20 Aug 2022 14:30:22 +0200<br>
+Subject: [PATCH 7/8] timeutils: fix invalid calculation of ISO timestamp<b=
r>
+ length<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady &lt;laszlo.varady@protonmail.com&gt;<br=
>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4d=
ac7102235396<br>
+<br>
+Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
+---<br>
+ lib/timeutils/scan-timestamp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 8 ++++++--<br>
+ lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++<br>
+ 2 files changed, 13 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c<br>
+index 197e3ad..4e618e4 100644<br>
+--- a/lib/timeutils/scan-timestamp.c<br>
++++ b/lib/timeutils/scan-timestamp.c<br>
+@@ -346,19 +346,21 @@ __parse_usec(const guchar **data, gint *length)<br>
+ static gboolean<br>
+ __has_iso_timezone(const guchar *src, gint length)<br>
+ {<br>
+-&nbsp; return (length &gt;=3D 5) &amp;&amp;<br>
++&nbsp; return (length &gt;=3D 6) &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*src =3D=3D '+' ||=
 *src =3D=3D '-') &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit(*(src+1)) &=
amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit(*(src+2)) &=
amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(src+3) =3D=3D ':'=
 &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit(*(src+4)) &=
amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit(*(src+5)) &=
amp;&amp;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !isdigit(*(src+6));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (length &lt; 7 || !isdig=
it(*(src+6)));<br>
+ }<br>
+ <br>
+ static guint32<br>
+ __parse_iso_timezone(const guchar **data, gint *length)<br>
+ {<br>
++&nbsp; g_assert(*length &gt;=3D 6);<br>
++<br>
+&nbsp;&nbsp; gint hours, mins;<br>
+&nbsp;&nbsp; const guchar *src =3D *data;<br>
+&nbsp;&nbsp; guint32 tz =3D 0;<br>
+@@ -368,8 +370,10 @@ __parse_iso_timezone(const guchar **data, gint *lengt=
h)<br>
+&nbsp;&nbsp; hours =3D (*(src + 1) - '0') * 10 + *(src + 2) - '0';<br>
+&nbsp;&nbsp; mins =3D (*(src + 4) - '0') * 10 + *(src + 5) - '0';<br>
+&nbsp;&nbsp; tz =3D sign * (hours * 3600 + mins * 60);<br>
++<br>
+&nbsp;&nbsp; src +=3D 6;<br>
+&nbsp;&nbsp; (*length) -=3D 6;<br>
++<br>
+&nbsp;&nbsp; *data =3D src;<br>
+&nbsp;&nbsp; return tz;<br>
+ }<br>
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tes=
ts/test_scan-timestamp.c<br>
+index da375c8..9b38738 100644<br>
+--- a/lib/timeutils/tests/test_scan-timestamp.c<br>
++++ b/lib/timeutils/tests/test_scan-timestamp.c<br>
+@@ -248,6 +248,13 @@ Test(parse_timestamp, non_zero_terminated_rfc5424_inp=
ut_is_handled_properly)<br>
+ <br>
+ }<br>
+ <br>
++Test(parse_timestamp, non_zero_terminated_rfc5424_timestamp_only)<br>
++{<br>
++&nbsp; const gchar *ts =3D &quot;2022-08-17T05:02:28.417+03:00&quot;;<br>
++&nbsp; gint ts_len =3D strlen(ts);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);<br>
++}<br>
++<br>
+ <br>
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_ti=
mezones)<br>
+ {<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch<br>
new file mode 100644<br>
index 000000000..cec573fa2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch<br>
@@ -0,0 +1,47 @@<br>
+From f60dcfa9e094dc9c2a752115ca426159c4ae4192 Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady &lt;laszlo.varady@protonmail.com&gt;<br>
+Date: Sat, 20 Aug 2022 14:30:51 +0200<br>
+Subject: [PATCH 8/8] timeutils: fix out-of-bounds reading of data buffer<b=
r>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady &lt;laszlo.varady@protonmail.com&gt;<br=
>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e=
4eaf959a044d<br>
+<br>
+Signed-off-by: Ovidiu Panait &lt;ovidiu.panait@windriver.com&gt;<br>
+---<br>
+ lib/timeutils/scan-timestamp.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c<br>
+index 4e618e4..0f7f52e 100644<br>
+--- a/lib/timeutils/scan-timestamp.c<br>
++++ b/lib/timeutils/scan-timestamp.c<br>
+@@ -427,7 +427,7 @@ __parse_bsd_timestamp(const guchar **data, gint *lengt=
h, WallClockTime *wct)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!scan_pix_timestamp((const gchar =
**) &amp;src, &amp;left, wct))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*src =3D=3D ':')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (left &amp;&amp; *src =3D=3D ':')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; left--;<br>
+@@ -478,7 +478,7 @@ scan_rfc3164_timestamp(const guchar **data, gint *leng=
th, WallClockTime *wct)<br>
+&nbsp;&nbsp;&nbsp; * looking at you, skip that as well, so we can reliably=
 detect IPv6<br>
+&nbsp;&nbsp;&nbsp; * addresses as hostnames, which would be using &quot;:&=
quot; as well. */<br>
+ <br>
+-&nbsp; if (*src =3D=3D ':')<br>
++&nbsp; if (left &amp;&amp; *src =3D=3D ':')<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++src;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --left;<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/meta-o=
e/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
index 40bbfe495..5fc386e56 100644<br>
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
@@ -22,6 +22,14 @@ SRC_URI =3D &quot;https://github.com/balabit/syslog-ng/r=
eleases/download/${BP}/${BP}.ta<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://volatiles.03_syslog-ng">file://volatiles.03_syslog-ng</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://syslog-ng-tmp.conf">file://syslog-ng-tmp.conf</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://syslog-ng.service-the-syslog-ng-service.patch">file://syslog-ng.=
service-the-syslog-ng-service.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0001.patch">file://CVE-2022-38725-0001.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0002.patch">file://CVE-2022-38725-0002.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0003.patch">file://CVE-2022-38725-0003.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0004.patch">file://CVE-2022-38725-0004.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0005.patch">file://CVE-2022-38725-0005.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0006.patch">file://CVE-2022-38725-0006.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0007.patch">file://CVE-2022-38725-0007.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0008.patch">file://CVE-2022-38725-0008.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;90a25c9767fe749db50f118ddfc92ec71399763d=
2ecd5ad4f11ff5eea049e60b&quot;<br>
-- <br>
2.34.1<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"mso-element:para-border-div;border:none;border-top:solid #E1E=
1E1 1.0pt;padding:3.0pt 0cm 0cm 0cm">
<p class=3D"MsoNormal" style=3D"border:none;padding:0cm"><b>From: </b><a hr=
ef=3D"mailto:Randy.MacLeod@windriver.com">MacLeod, Randy</a><br>
<b>Sent: </b>24 November 2022 03:16<br>
<b>To: </b><a href=3D"mailto:Yogita.Urade@windriver.com">Urade, Yogita</a>;=
 <a href=3D"mailto:openembedded-devel@lists.openembedded.org">
openembedded-devel@lists.openembedded.org</a><br>
<b>Cc: </b><a href=3D"mailto:Hari.GPillai@windriver.com">G Pillai, Hari</a>=
; <a href=3D"mailto:Narpat.Mali@windriver.com">
Mali, Narpat</a><br>
<b>Subject: </b>Re: [oe] [meta-openembedded][kirkstone][PATCH 1/1] syslog-n=
g: fix CVE-2022-38725</p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">Hi Yogita,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">On 2022-11-21 05:29, Urade, Yogita via lists.openemb=
edded.org wrote:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Issue: LIN1022-1598<o=
:p></o:p></p>
</blockquote>
<p class=3D"MsoNormal">The line above is only for internal WR reviews, plea=
se drop.<br>
<br>
<o:p></o:p></p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
Fix buffer handling of syslog and timestamp parsers.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-38725">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-38725</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/releases">https://github.=
com/syslog-ng/syslog-ng/releases</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/pull/4110">https://github=
.com/syslog-ng/syslog-ng/pull/4110</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f5=
08436a12e4d4163f94b1b8">https://github.com/syslog-ng/syslog-ng/commit/b5a06=
0f2ebb8d794f508436a12e4d4163f94b1b8</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376=
d3a30f96f51df3f2879f8a">https://github.com/syslog-ng/syslog-ng/commit/81a07=
263f1e522a376d3a30f96f51df3f2879f8a</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8=
751a305eb7eeefab8dc89d">https://github.com/syslog-ng/syslog-ng/commit/4b8dc=
56ca8eaeac4c8751a305eb7eeefab8dc89d</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4=
824baa83a04931279abb37">https://github.com/syslog-ng/syslog-ng/commit/73b5c=
300b8fde5e7a4824baa83a04931279abb37</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4=
f92b9339fe67c6798a0321">https://github.com/syslog-ng/syslog-ng/commit/45f05=
1239312e43bd4f92b9339fe67c6798a0321</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff=
8cbd282cfc866ab56054c4">https://github.com/syslog-ng/syslog-ng/commit/09f48=
9c89c826293ff8cbd282cfc866ab56054c4</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fb=
d464c35f4dac7102235396">https://github.com/syslog-ng/syslog-ng/commit/8c6e2=
c1c41b0fcc5fbd464c35f4dac7102235396</a><br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c=
96607c4b9e4eaf959a044d">https://github.com/syslog-ng/syslog-ng/commit/56f88=
1c5eaa3d8c02c96607c4b9e4eaf959a044d</a><br>
<br>
(LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance<o:=
p></o:p></p>
</blockquote>
<p>The line above is only for internal WR reviews, please drop.</p>
<p>Also, this is the upstream for WR Linux, so it's not out of maintenance!=
 ;-)</p>
<p>Other than that, this looks good. </p>
<p>Please send a v2.</p>
<p>Thanks,</p>
<p>../Randy</p>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><br>
Signed-off-by: Yogita Urade <a href=3D"mailto:yogita.urade@windriver.com">&=
lt;yogita.urade@windriver.com&gt;</a><br>
---<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0001.patch |&nbsp; 67 ++++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0002.patch | 152 +++++++++++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0003.patch |&nbsp; 79 +++++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0004.patch |&nbsp; 40 ++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0005.patch | 213 +++++++++++++++++=
+<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0006.patch | 182 +++++++++++++++<b=
r>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0007.patch |&nbsp; 84 +++++++<br>
&nbsp;.../syslog-ng/files/CVE-2022-38725-0008.patch |&nbsp; 47 ++++<br>
&nbsp;.../syslog-ng/syslog-ng_3.36.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 8 +<br>
&nbsp;9 files changed, 872 insertions(+)<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0001.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0002.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0003.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0004.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0005.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0006.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0007.patch<br>
&nbsp;create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2022-3=
8725-0008.patch<br>
<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch<br>
new file mode 100644<br>
index 000000000..cd6a93d8e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0001.patch<br>
@@ -0,0 +1,67 @@<br>
+From c6e7195075fd4fbd3db04e187f6d75030d17cb6b Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady <a href=3D"mailto:laszlo.varady@protonmail.com">&lt;la=
szlo.varady@protonmail.com&gt;</a><br>
+Date: Sat, 20 Aug 2022 12:26:05 +0200<br>
+Subject: [PATCH 1/8] syslogformat: fix out-of-bounds reading of data buffe=
r<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady <a href=3D"mailto:laszlo.varady@protonm=
ail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/b5a060f2ebb8d794f508436a12e4=
d4163f94b1b8<br>
+<br>
+Signed-off-by: Ovidiu Panait <a href=3D"mailto:ovidiu.panait@windriver.com=
">&lt;ovidiu.panait@windriver.com&gt;</a><br>
+---<br>
+ modules/syslogformat/syslog-format.c | 10 +++++++---<br>
+ 1 file changed, 7 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/s=
yslog-format.c<br>
+index 38bb6f6..9042396 100644<br>
+--- a/modules/syslogformat/syslog-format.c<br>
++++ b/modules/syslogformat/syslog-format.c<br>
+@@ -223,6 +223,9 @@ log_msg_parse_cisco_timestamp_attributes(LogMessage *s=
elf, const guchar **data,<br>
+&nbsp;&nbsp; const guchar *src =3D *data;<br>
+&nbsp;&nbsp; gint left =3D *length;<br>
+ <br>
++&nbsp; if (!left)<br>
++&nbsp;&nbsp;&nbsp; return;<br>
++<br>
+&nbsp;&nbsp; /* Cisco timestamp extensions, the first '*' indicates that t=
he clock is<br>
+&nbsp;&nbsp;&nbsp; * unsynced, '.' if it is known to be synced */<br>
+&nbsp;&nbsp; if (G_UNLIKELY(src[0] =3D=3D '*'))<br>
+@@ -556,7 +559,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; open_sd++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!isascii(*src)=
 || *src =3D=3D '=3D' || *src =3D=3D ' ' || *src =3D=3D ']' || *src =3D=3D =
'&quot;')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!left || !isas=
cii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' || *src =3D=3D ']' || *sr=
c =3D=3D '&quot;')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
oto error;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* read sd_id=
 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos =3D 0;<br=
>
+@@ -589,7 +592,8 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sd_id_len =3D=
 pos;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strcpy(sd_val=
ue_name, logmsg_sd_prefix);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strncpy(sd_va=
lue_name + logmsg_sd_prefix_len, sd_id_name, sizeof(sd_value_name) - logmsg=
_sd_prefix_len);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*src =3D=3D ']=
')<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (left &amp;&amp=
; *src =3D=3D ']')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; log_msg_set_value_by_name(self, sd_value_name, &quot;&quot;, 0);=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
<br>
+@@ -606,7 +610,7 @@ log_msg_parse_sd(LogMessage *self, const guchar **data=
, gint *length, const MsgF<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; goto error;<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' || *src =
=3D=3D ']' || *src =3D=3D '&quot;')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; if (!left || !isascii(*src) || *src =3D=3D '=3D' || *src =3D=3D ' ' |=
| *src =3D=3D ']' || *src =3D=3D '&quot;')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; goto error;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* read sd-param */<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch<br>
new file mode 100644<br>
index 000000000..ac5bc78a5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0002.patch<br>
@@ -0,0 +1,152 @@<br>
+From f8f985cd0902e0fa8306f988fb183f1987ab7d3b Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady <a href=3D"mailto:laszlo.varady@protonmail.com">&lt;la=
szlo.varady@protonmail.com&gt;</a><br>
+Date: Sat, 20 Aug 2022 12:22:44 +0200<br>
+Subject: [PATCH 2/8] syslogformat: add bug reproducer test for non-zero<br=
>
+ terminated input<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady <a href=3D"mailto:laszlo.varady@protonm=
ail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/81a07263f1e522a376d3a30f96f5=
1df3f2879f8a<br>
+<br>
+Signed-off-by: Ovidiu Panait <a href=3D"mailto:ovidiu.panait@windriver.com=
">&lt;ovidiu.panait@windriver.com&gt;</a><br>
+---<br>
+ modules/syslogformat/CMakeLists.txt&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<br>
+ modules/syslogformat/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +<br>
+ modules/syslogformat/tests/CMakeLists.txt&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
 1 +<br>
+ modules/syslogformat/tests/Makefile.am&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 9 +++<br>
+ .../syslogformat/tests/test_syslog_format.c&nbsp;&nbsp; | 72 ++++++++++++=
+++++++<br>
+ 5 files changed, 85 insertions(+)<br>
+ create mode 100644 modules/syslogformat/tests/CMakeLists.txt<br>
+ create mode 100644 modules/syslogformat/tests/Makefile.am<br>
+ create mode 100644 modules/syslogformat/tests/test_syslog_format.c<br>
+<br>
+diff --git a/modules/syslogformat/CMakeLists.txt b/modules/syslogformat/CM=
akeLists.txt<br>
+index 94ee01a..64848ef 100644<br>
+--- a/modules/syslogformat/CMakeLists.txt<br>
++++ b/modules/syslogformat/CMakeLists.txt<br>
+@@ -14,3 +14,4 @@ add_module(<br>
+&nbsp;&nbsp; SOURCES ${SYSLOGFORMAT_SOURCES}<br>
+ )<br>
+ <br>
++add_test_subdirectory(tests)<br>
+diff --git a/modules/syslogformat/Makefile.am b/modules/syslogformat/Makef=
ile.am<br>
+index f13f88c..14cdf58 100644<br>
+--- a/modules/syslogformat/Makefile.am<br>
++++ b/modules/syslogformat/Makefile.am<br>
+@@ -31,3 +31,5 @@ modules_syslogformat_libsyslogformat_la_DEPENDENCIES =3D=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
+ modules/syslogformat modules/syslogformat/ mod-syslogformat: \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; modules/syslogformat/libsyslogf=
ormat.la<br>
+ .PHONY: modules/syslogformat/ mod-syslogformat<br>
++<br>
++include modules/syslogformat/tests/Makefile.am<br>
+diff --git a/modules/syslogformat/tests/CMakeLists.txt b/modules/syslogfor=
mat/tests/CMakeLists.txt<br>
+new file mode 100644<br>
+index 0000000..2e45b71<br>
+--- /dev/null<br>
++++ b/modules/syslogformat/tests/CMakeLists.txt<br>
+@@ -0,0 +1 @@<br>
++add_unit_test(CRITERION TARGET test_syslog_format DEPENDS syslogformat)<b=
r>
+diff --git a/modules/syslogformat/tests/Makefile.am b/modules/syslogformat=
/tests/Makefile.am<br>
+new file mode 100644<br>
+index 0000000..7ee66a5<br>
+--- /dev/null<br>
++++ b/modules/syslogformat/tests/Makefile.am<br>
+@@ -0,0 +1,9 @@<br>
++modules_syslogformat_tests_TESTS =3D \<br>
++&nbsp;&nbsp;&nbsp; modules/syslogformat/tests/test_syslog_format<br>
++<br>
++check_PROGRAMS +=3D ${modules_syslogformat_tests_TESTS}<br>
++<br>
++EXTRA_DIST +=3D modules/syslogformat/tests/CMakeLists.txt<br>
++<br>
++modules_syslogformat_tests_test_syslog_format_CFLAGS =3D $(TEST_CFLAGS) -=
I$(top_srcdir)/modules/syslogformat<br>
++modules_syslogformat_tests_test_syslog_format_LDADD =3D $(TEST_LDADD) $(P=
REOPEN_SYSLOGFORMAT)<br>
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/sys=
logformat/tests/test_syslog_format.c<br>
+new file mode 100644<br>
+index 0000000..b247fe3<br>
+--- /dev/null<br>
++++ b/modules/syslogformat/tests/test_syslog_format.c<br>
+@@ -0,0 +1,72 @@<br>
++/*<br>
++ * Copyright (c) 2022 One Identity<br>
++ * Copyright (c) 2022 L=E1szl=F3 V=E1rady<br>
++ *<br>
++ * This program is free software; you can redistribute it and/or modify i=
t<br>
++ * under the terms of the GNU General Public License version 2 as publish=
ed<br>
++ * by the Free Software Foundation, or (at your option) any later version=
.<br>
++ *<br>
++ * This program is distributed in the hope that it will be useful,<br>
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; See the<br>
++ * GNU General Public License for more details.<br>
++ *<br>
++ * You should have received a copy of the GNU General Public License<br>
++ * along with this program; if not, write to the Free Software<br>
++ * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA&nbsp; 02110-=
1301&nbsp; USA<br>
++ *<br>
++ * As an additional exemption you are allowed to compile &amp; link again=
st the<br>
++ * OpenSSL libraries as published by the OpenSSL project. See the file<br=
>
++ * COPYING for details.<br>
++ *<br>
++ */<br>
++<br>
++#include &lt;criterion/criterion.h&gt;<br>
++<br>
++#include &quot;apphook.h&quot;<br>
++#include &quot;cfg.h&quot;<br>
++#include &quot;syslog-format.h&quot;<br>
++#include &quot;logmsg/logmsg.h&quot;<br>
++#include &quot;msg-format.h&quot;<br>
++#include &quot;scratch-buffers.h&quot;<br>
++<br>
++#include &lt;string.h&gt;<br>
++<br>
++GlobalConfig *cfg;<br>
++MsgFormatOptions parse_options;<br>
++<br>
++static void<br>
++setup(void)<br>
++{<br>
++&nbsp; app_startup();<br>
++&nbsp; syslog_format_init();<br>
++<br>
++&nbsp; cfg =3D cfg_new_snippet();<br>
++&nbsp; msg_format_options_defaults(&amp;parse_options);<br>
++}<br>
++<br>
++static void<br>
++teardown(void)<br>
++{<br>
++&nbsp; scratch_buffers_explicit_gc();<br>
++&nbsp; app_shutdown();<br>
++&nbsp; cfg_free(cfg);<br>
++}<br>
++<br>
++TestSuite(syslog_format, .init =3D setup, .fini =3D teardown);<br>
++<br>
++Test(syslog_format, parser_should_not_spin_on_non_zero_terminated_input, =
.timeout =3D 10)<br>
++{<br>
++&nbsp; const gchar *data =3D &quot;&lt;182&gt;2022-08-17T05:02:28.217 mym=
achine su: 'su root' failed for lonvick on /dev/pts/8&quot;;<br>
++&nbsp; /* chosen carefully to reproduce a bug */<br>
++&nbsp; gsize data_length =3D 27;<br>
++<br>
++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
++&nbsp; LogMessage *msg =3D msg_format_construct_message(&amp;parse_option=
s, (const guchar *) data, data_length);<br>
++<br>
++&nbsp; gsize problem_position;<br>
++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gu=
char *) data, data_length, &amp;problem_position));<br>
++<br>
++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
++&nbsp; log_msg_unref(msg);<br>
++}<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch<br>
new file mode 100644<br>
index 000000000..34e6b65d2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0003.patch<br>
@@ -0,0 +1,79 @@<br>
+From 041ccdf8a4c73cd3138dac0611272361f384fb81 Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady <a href=3D"mailto:laszlo.varady@protonmail.com">&lt;la=
szlo.varady@protonmail.com&gt;</a><br>
+Date: Sun, 21 Aug 2022 18:44:28 +0200<br>
+Subject: [PATCH 3/8] syslogformat: fix reading cisco sequence id out of bo=
unds<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady <a href=3D"mailto:laszlo.varady@protonm=
ail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/4b8dc56ca8eaeac4c8751a305eb7=
eeefab8dc89d<br>
+<br>
+Signed-off-by: Ovidiu Panait <a href=3D"mailto:ovidiu.panait@windriver.com=
">&lt;ovidiu.panait@windriver.com&gt;</a><br>
+---<br>
+ modules/syslogformat/syslog-format.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
+ .../syslogformat/tests/test_syslog_format.c&nbsp;&nbsp; | 32 ++++++++++++=
+++++++<br>
+ 2 files changed, 33 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/modules/syslogformat/syslog-format.c b/modules/syslogformat/s=
yslog-format.c<br>
+index 9042396..fe829fb 100644<br>
+--- a/modules/syslogformat/syslog-format.c<br>
++++ b/modules/syslogformat/syslog-format.c<br>
+@@ -207,7 +207,7 @@ log_msg_parse_cisco_sequence_id(LogMessage *self, cons=
t guchar **data, gint *len<br>
+ <br>
+&nbsp;&nbsp; /* if the next char is not space, then we may try to read a d=
ate */<br>
+ <br>
+-&nbsp; if (*src !=3D ' ')<br>
++&nbsp; if (!left || *src !=3D ' ')<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+ <br>
+&nbsp;&nbsp; log_msg_set_value(self, handles.cisco_seqid, (gchar *) *data,=
 *length - left - 1);<br>
+diff --git a/modules/syslogformat/tests/test_syslog_format.c b/modules/sys=
logformat/tests/test_syslog_format.c<br>
+index b247fe3..d0f5b40 100644<br>
+--- a/modules/syslogformat/tests/test_syslog_format.c<br>
++++ b/modules/syslogformat/tests/test_syslog_format.c<br>
+@@ -70,3 +70,35 @@ Test(syslog_format, parser_should_not_spin_on_non_zero_=
terminated_input, .timeou<br>
+&nbsp;&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
+&nbsp;&nbsp; log_msg_unref(msg);<br>
+ }<br>
++<br>
++Test(syslog_format, cisco_sequence_id_non_zero_termination)<br>
++{<br>
++&nbsp; const gchar *data =3D &quot;&lt;189&gt;65536: &quot;;<br>
++&nbsp; gsize data_length =3D strlen(data);<br>
++<br>
++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
++&nbsp; LogMessage *msg =3D msg_format_construct_message(&amp;parse_option=
s, (const guchar *) data, data_length);<br>
++<br>
++&nbsp; gsize problem_position;<br>
++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gu=
char *) data, data_length, &amp;problem_position));<br>
++&nbsp; cr_assert_str_eq(log_msg_get_value_by_name(msg, &quot;.SDATA.meta.=
sequenceId&quot;, NULL), &quot;65536&quot;);<br>
++<br>
++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
++&nbsp; log_msg_unref(msg);<br>
++}<br>
++<br>
++Test(syslog_format, minimal_non_zero_terminated_numeric_message_is_parsed=
_as_program_name)<br>
++{<br>
++&nbsp; const gchar *data =3D &quot;&lt;189&gt;65536&quot;;<br>
++&nbsp; gsize data_length =3D strlen(data);<br>
++<br>
++&nbsp; msg_format_options_init(&amp;parse_options, cfg);<br>
++&nbsp; LogMessage *msg =3D msg_format_construct_message(&amp;parse_option=
s, (const guchar *) data, data_length);<br>
++<br>
++&nbsp; gsize problem_position;<br>
++&nbsp; cr_assert(syslog_format_handler(&amp;parse_options, msg, (const gu=
char *) data, data_length, &amp;problem_position));<br>
++&nbsp; cr_assert_str_eq(log_msg_get_value_by_name(msg, &quot;PROGRAM&quot=
;, NULL), &quot;65536&quot;);<br>
++<br>
++&nbsp; msg_format_options_destroy(&amp;parse_options);<br>
++&nbsp; log_msg_unref(msg);<br>
++}<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch<br>
new file mode 100644<br>
index 000000000..cfad5a378<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0004.patch<br>
@@ -0,0 +1,40 @@<br>
+From bea4678261328c841b6062014394e6d3230a2fdb Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady <a href=3D"mailto:laszlo.varady@protonmail.com">&lt;la=
szlo.varady@protonmail.com&gt;</a><br>
+Date: Sat, 20 Aug 2022 12:42:38 +0200<br>
+Subject: [PATCH 4/8] timeutils: fix iterating out of the range of timestam=
p<br>
+ buffer<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady <a href=3D"mailto:laszlo.varady@protonm=
ail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
+Signed-off-by: Balazs Scheidler <a href=3D"mailto:bazsi77@gmail.com">&lt;b=
azsi77@gmail.com&gt;</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/73b5c300b8fde5e7a4824baa83a0=
4931279abb37<br>
+<br>
+Signed-off-by: Ovidiu Panait <a href=3D"mailto:ovidiu.panait@windriver.com=
">&lt;ovidiu.panait@windriver.com&gt;</a><br>
+---<br>
+ lib/timeutils/scan-timestamp.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c<br>
+index 2f6a6b7..cb6802d 100644<br>
+--- a/lib/timeutils/scan-timestamp.c<br>
++++ b/lib/timeutils/scan-timestamp.c<br>
+@@ -328,7 +328,7 @@ __parse_usec(const guchar **data, gint *length)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*length)--;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (isdigit(*src))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (*length &gt; 0 &amp;&amp; isdigit(*=
src))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*length)--;<=
br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch<br>
new file mode 100644<br>
index 000000000..487118957<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0005.patch<br>
@@ -0,0 +1,213 @@<br>
+From 1f62031101608bee8ad772967eb8151aa33d6e1a Mon Sep 17 00:00:00 2001<br>
+From: Balazs Scheidler <a href=3D"mailto:bazsi77@gmail.com">&lt;bazsi77@gm=
ail.com&gt;</a><br>
+Date: Sat, 20 Aug 2022 12:43:42 +0200<br>
+Subject: [PATCH 5/8] timeutils: add tests for non-zero terminated inputs<b=
r>
+<br>
+Signed-off-by: Balazs Scheidler <a href=3D"mailto:bazsi77@gmail.com">&lt;b=
azsi77@gmail.com&gt;</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/45f051239312e43bd4f92b9339fe=
67c6798a0321<br>
+<br>
+Signed-off-by: Ovidiu Panait <a href=3D"mailto:ovidiu.panait@windriver.com=
">&lt;ovidiu.panait@windriver.com&gt;</a><br>
+---<br>
+ lib/timeutils/tests/test_scan-timestamp.c | 126 +++++++++++++++++++---<br=
>
+ 1 file changed, 113 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tes=
ts/test_scan-timestamp.c<br>
+index 2756bf3..da375c8 100644<br>
+--- a/lib/timeutils/tests/test_scan-timestamp.c<br>
++++ b/lib/timeutils/tests/test_scan-timestamp.c<br>
+@@ -49,17 +49,21 @@ fake_time_add(time_t diff)<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-_parse_rfc3164(const gchar *ts, gchar isotimestamp[32])<br>
++_parse_rfc3164(const gchar *ts, gint len, gchar isotimestamp[32])<br>
+ {<br>
+&nbsp;&nbsp; UnixTime stamp;<br>
+-&nbsp; const guchar *data =3D (const guchar *) ts;<br>
+-&nbsp; gint length =3D strlen(ts);<br>
++&nbsp; const guchar *tsu =3D (const guchar *) ts;<br>
++&nbsp; gint tsu_len =3D len &lt; 0 ? strlen(ts) : len;<br>
+&nbsp;&nbsp; GString *result =3D g_string_new(&quot;&quot;);<br>
+&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT;<br>
+ <br>
+-<br>
++&nbsp; const guchar *data =3D tsu;<br>
++&nbsp; gint length =3D tsu_len;<br>
+&nbsp;&nbsp; gboolean success =3D scan_rfc3164_timestamp(&amp;data, &amp;l=
ength, &amp;wct);<br>
+ <br>
++&nbsp; cr_assert(length &gt;=3D 0);<br>
++&nbsp; cr_assert(data =3D=3D &amp;tsu[tsu_len - length]);<br>
++<br>
+&nbsp;&nbsp; unix_time_unset(&amp;stamp);<br>
+&nbsp;&nbsp; convert_wall_clock_time_to_unix_time(&amp;wct, &amp;stamp);<b=
r>
+ <br>
+@@ -70,16 +74,21 @@ _parse_rfc3164(const gchar *ts, gchar isotimestamp[32]=
)<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-_parse_rfc5424(const gchar *ts, gchar isotimestamp[32])<br>
++_parse_rfc5424(const gchar *ts, gint len, gchar isotimestamp[32])<br>
+ {<br>
+&nbsp;&nbsp; UnixTime stamp;<br>
+-&nbsp; const guchar *data =3D (const guchar *) ts;<br>
+-&nbsp; gint length =3D strlen(ts);<br>
++&nbsp; const guchar *tsu =3D (const guchar *) ts;<br>
++&nbsp; gint tsu_len =3D len &lt; 0 ? strlen(ts) : len;<br>
+&nbsp;&nbsp; GString *result =3D g_string_new(&quot;&quot;);<br>
+&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT;<br>
+ <br>
++&nbsp; const guchar *data =3D tsu;<br>
++&nbsp; gint length =3D tsu_len;<br>
+&nbsp;&nbsp; gboolean success =3D scan_rfc5424_timestamp(&amp;data, &amp;l=
ength, &amp;wct);<br>
+ <br>
++&nbsp; cr_assert(length &gt;=3D 0);<br>
++&nbsp; cr_assert(data =3D=3D &amp;tsu[tsu_len - length]);<br>
++<br>
+&nbsp;&nbsp; unix_time_unset(&amp;stamp);<br>
+&nbsp;&nbsp; convert_wall_clock_time_to_unix_time(&amp;wct, &amp;stamp);<b=
r>
+ <br>
+@@ -90,31 +99,60 @@ _parse_rfc5424(const gchar *ts, gchar isotimestamp[32]=
)<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-_rfc3164_timestamp_eq(const gchar *ts, const gchar *expected, gchar conve=
rted[32])<br>
++_rfc3164_timestamp_eq(const gchar *ts, gint len, const gchar *expected, g=
char converted[32])<br>
+ {<br>
+-&nbsp; cr_assert(_parse_rfc3164(ts, converted));<br>
++&nbsp; cr_assert(_parse_rfc3164(ts, len, converted));<br>
+&nbsp;&nbsp; return strcmp(converted, expected) =3D=3D 0;<br>
+ }<br>
+ <br>
+ static gboolean<br>
+-_rfc5424_timestamp_eq(const gchar *ts, const gchar *expected, gchar conve=
rted[32])<br>
++_rfc5424_timestamp_eq(const gchar *ts, gint len, const gchar *expected, g=
char converted[32])<br>
+ {<br>
+-&nbsp; cr_assert(_parse_rfc5424(ts, converted));<br>
++&nbsp; cr_assert(_parse_rfc5424(ts, len, converted));<br>
+&nbsp;&nbsp; return strcmp(converted, expected) =3D=3D 0;<br>
+ }<br>
+ <br>
+ #define _expect_rfc3164_timestamp_eq(ts, expected) \<br>
+&nbsp;&nbsp; ({ \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
+-&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, expected, converte=
d), &quot;Parsed RFC3164 timestamp does not equal expected, ts=3D%s, conver=
ted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, -1, expected, conv=
erted), &quot;Parsed RFC3164 timestamp does not equal expected, ts=3D%s, co=
nverted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp; })<br>
++<br>
++#define _expect_rfc3164_timestamp_len_eq(ts, len, expected) \<br>
++&nbsp; ({ \<br>
++&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
++&nbsp;&nbsp;&nbsp; cr_expect(_rfc3164_timestamp_eq(ts, len, expected, con=
verted), &quot;Parsed RFC3164 timestamp does not equal expected, ts=3D%s, c=
onverted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp; })<br>
++<br>
++#define _expect_rfc3164_fails(ts, len) \<br>
++&nbsp; ({&nbsp; \<br>
++&nbsp;&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \<br>
++&nbsp;&nbsp;&nbsp; const guchar *data =3D (guchar *) ts; \<br>
++&nbsp;&nbsp;&nbsp; gint length =3D len &lt; 0 ? strlen(ts) : len; \<br>
++&nbsp;&nbsp;&nbsp; cr_assert_not(scan_rfc3164_timestamp(&amp;data, &amp;l=
ength, &amp;wct)); \<br>
+&nbsp;&nbsp; })<br>
+ <br>
+ #define _expect_rfc5424_timestamp_eq(ts, expected) \<br>
+&nbsp;&nbsp; ({ \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
+-&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, expected, converte=
d), &quot;Parsed RFC5424 timestamp does not equal expected, ts=3D%s, conver=
ted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, -1, expected, conv=
erted), &quot;Parsed RFC5424 timestamp does not equal expected, ts=3D%s, co=
nverted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp; })<br>
++<br>
++#define _expect_rfc5424_timestamp_len_eq(ts, len, expected) \<br>
++&nbsp; ({ \<br>
++&nbsp;&nbsp;&nbsp; gchar converted[32]; \<br>
++&nbsp;&nbsp;&nbsp; cr_expect(_rfc5424_timestamp_eq(ts, len, expected, con=
verted), &quot;Parsed RFC5424 timestamp does not equal expected, ts=3D%s, c=
onverted=3D%s, expected=3D%s&quot;, ts, converted, expected); \<br>
++&nbsp; })<br>
++<br>
++#define _expect_rfc5424_fails(ts, len) \<br>
++&nbsp; ({&nbsp; \<br>
++&nbsp;&nbsp;&nbsp; WallClockTime wct =3D WALL_CLOCK_TIME_INIT; \<br>
++&nbsp;&nbsp;&nbsp; const guchar *data =3D (guchar *) ts; \<br>
++&nbsp;&nbsp;&nbsp; gint length =3D len &lt; 0 ? strlen(ts) : len; \<br>
++&nbsp;&nbsp;&nbsp; cr_assert_not(scan_rfc5424_timestamp(&amp;data, &amp;l=
ength, &amp;wct)); \<br>
+&nbsp;&nbsp; })<br>
+ <br>
++<br>
+ Test(parse_timestamp, standard_bsd_format)<br>
+ {<br>
+&nbsp;&nbsp; _expect_rfc3164_timestamp_eq(&quot;Oct&nbsp; 1 17:46:12&quot;=
, &quot;2017-10-01T17:46:12.000+02:00&quot;);<br>
+@@ -148,6 +186,68 @@ Test(parse_timestamp, standard_bsd_format_year_in_the=
_past)<br>
+&nbsp;&nbsp; _expect_rfc3164_timestamp_eq(&quot;Dec 31 17:46:12&quot;, &qu=
ot;2017-12-31T17:46:12.000+01:00&quot;);<br>
+ }<br>
+ <br>
++Test(parse_timestamp, non_zero_terminated_rfc3164_iso_input_is_handled_pr=
operly)<br>
++{<br>
++&nbsp; gchar *ts =3D &quot;2022-08-17T05:02:28.417Z whatever&quot;;<br>
++&nbsp; gint ts_len =3D 24;<br>
++<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T=
05:02:28.417+00:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T=
05:02:28.417+00:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:0=
2:28.417+00:00&quot;);<br>
++<br>
++&nbsp; /* no &quot;Z&quot; parsed, timezone defaults to local, forced CET=
 */<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 1, &quot;2022-08-17T=
05:02:28.417+02:00&quot;);<br>
++<br>
++&nbsp; /* msec is partially parsed as we trim the string from the right *=
/<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 2, &quot;2022-08-17T=
05:02:28.410+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 3, &quot;2022-08-17T=
05:02:28.400+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 4, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len - 5, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++<br>
++&nbsp; for (gint i =3D 6; i &lt; ts_len; i++)<br>
++&nbsp;&nbsp;&nbsp; _expect_rfc3164_fails(ts, ts_len - i);<br>
++<br>
++}<br>
++<br>
++Test(parse_timestamp, non_zero_terminated_rfc3164_bsd_pix_or_asa_input_is=
_handled_properly)<br>
++{<br>
++&nbsp; gchar *ts =3D &quot;Aug 17 2022 05:02:28: whatever&quot;;<br>
++&nbsp; gint ts_len =3D 21;<br>
++<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++&nbsp; _expect_rfc3164_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:0=
2:28.000+02:00&quot;);<br>
++<br>
++&nbsp; /* no &quot;:&quot; at the end, that's a problem, unrecognized */<=
br>
++&nbsp; _expect_rfc3164_fails(ts, ts_len - 1);<br>
++<br>
++&nbsp; for (gint i =3D 1; i &lt; ts_len; i++)<br>
++&nbsp;&nbsp;&nbsp; _expect_rfc3164_fails(ts, ts_len - i);<br>
++}<br>
++<br>
++Test(parse_timestamp, non_zero_terminated_rfc5424_input_is_handled_proper=
ly)<br>
++{<br>
++&nbsp; gchar *ts =3D &quot;2022-08-17T05:02:28.417Z whatever&quot;;<br>
++&nbsp; gint ts_len =3D 24;<br>
++<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, strlen(ts), &quot;2022-08-17T=
05:02:28.417+00:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len + 5, &quot;2022-08-17T=
05:02:28.417+00:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len, &quot;2022-08-17T05:0=
2:28.417+00:00&quot;);<br>
++<br>
++&nbsp; /* no &quot;Z&quot; parsed, timezone defaults to local, forced CET=
 */<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 1, &quot;2022-08-17T=
05:02:28.417+02:00&quot;);<br>
++<br>
++&nbsp; /* msec is partially parsed as we trim the string from the right *=
/<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 2, &quot;2022-08-17T=
05:02:28.410+02:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 3, &quot;2022-08-17T=
05:02:28.400+02:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 4, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len - 5, &quot;2022-08-17T=
05:02:28.000+02:00&quot;);<br>
++<br>
++&nbsp; for (gint i =3D 6; i &lt; ts_len; i++)<br>
++&nbsp;&nbsp;&nbsp; _expect_rfc5424_fails(ts, ts_len - i);<br>
++<br>
++}<br>
++<br>
+ <br>
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_ti=
mezones)<br>
+ {<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch<br>
new file mode 100644<br>
index 000000000..e32076ab5<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0006.patch<br>
@@ -0,0 +1,182 @@<br>
+From 14bcd1596f0f194b28e3f7babc75ad90d39ae7af Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady <a href=3D"mailto:laszlo.varady@protonmail.com">&lt;la=
szlo.varady@protonmail.com&gt;</a><br>
+Date: Sat, 20 Aug 2022 14:29:43 +0200<br>
+Subject: [PATCH 6/8] timeutils: name repeating constant<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady <a href=3D"mailto:laszlo.varady@protonm=
ail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/09f489c89c826293ff8cbd282cfc=
866ab56054c4<br>
+<br>
+Signed-off-by: Ovidiu Panait <a href=3D"mailto:ovidiu.panait@windriver.com=
">&lt;ovidiu.panait@windriver.com&gt;</a><br>
+---<br>
+ lib/timeutils/scan-timestamp.c | 54 ++++++++++++++++++----------------<br=
>
+ 1 file changed, 29 insertions(+), 25 deletions(-)<br>
+<br>
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c<br>
+index cb6802d..197e3ad 100644<br>
+--- a/lib/timeutils/scan-timestamp.c<br>
++++ b/lib/timeutils/scan-timestamp.c<br>
+@@ -34,41 +34,43 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *w=
day)<br>
+ {<br>
+&nbsp;&nbsp; *wday =3D -1;<br>
+ <br>
+-&nbsp; if (*left &lt; 3)<br>
++&nbsp; const gsize abbrev_length =3D 3;<br>
++<br>
++&nbsp; if (*left &lt; abbrev_length)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+ <br>
+&nbsp;&nbsp; switch (**buf)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'S':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Sun&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Sun&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 0;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Sat&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Sat&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 6;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'M':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mon&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mon&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'T':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Tue&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Tue&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Thu&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Thu&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'W':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Wed&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Wed&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 3;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'F':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Fri&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Fri&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *wday =3D 5;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+@@ -77,8 +79,8 @@ scan_day_abbrev(const gchar **buf, gint *left, gint *wda=
y)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp; (*buf) +=3D 3;<br>
+-&nbsp; (*left) -=3D 3;<br>
++&nbsp; (*buf) +=3D abbrev_length;<br>
++&nbsp; (*left) -=3D abbrev_length;<br>
+&nbsp;&nbsp; return TRUE;<br>
+ }<br>
+ <br>
+@@ -87,63 +89,65 @@ scan_month_abbrev(const gchar **buf, gint *left, gint =
*mon)<br>
+ {<br>
+&nbsp;&nbsp; *mon =3D -1;<br>
+ <br>
+-&nbsp; if (*left &lt; 3)<br>
++&nbsp; const gsize abbrev_length =3D 3;<br>
++<br>
++&nbsp; if (*left &lt; abbrev_length)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+ <br>
+&nbsp;&nbsp; switch (**buf)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'J':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Jan&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Jan&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 0;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Jun&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Jun&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 5;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Jul&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Jul&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 6;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'F':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Feb&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Feb&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'M':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mar&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Mar&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;May&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;May&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 4;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'A':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Apr&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Apr&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 3;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Aug&quot;=
, 3) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (strncasecmp(*buf, &quot;Aug&quot;=
, abbrev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 7;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'S':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Sep&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Sep&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 8;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'O':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Oct&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Oct&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 9;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'N':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Nov&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Nov&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 10;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; case 'D':<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Dec&quot;, 3) =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strncasecmp(*buf, &quot;Dec&quot;, abb=
rev_length) =3D=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mon =3D 11;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+@@ -152,8 +156,8 @@ scan_month_abbrev(const gchar **buf, gint *left, gint =
*mon)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+-&nbsp; (*buf) +=3D 3;<br>
+-&nbsp; (*left) -=3D 3;<br>
++&nbsp; (*buf) +=3D abbrev_length;<br>
++&nbsp; (*left) -=3D abbrev_length;<br>
+&nbsp;&nbsp; return TRUE;<br>
+ }<br>
+ <br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch<br>
new file mode 100644<br>
index 000000000..b3135df4e<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0007.patch<br>
@@ -0,0 +1,84 @@<br>
+From d4c8ba0c513052b5f19c6e989ba31f847f4900d1 Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady <a href=3D"mailto:laszlo.varady@protonmail.com">&lt;la=
szlo.varady@protonmail.com&gt;</a><br>
+Date: Sat, 20 Aug 2022 14:30:22 +0200<br>
+Subject: [PATCH 7/8] timeutils: fix invalid calculation of ISO timestamp<b=
r>
+ length<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady <a href=3D"mailto:laszlo.varady@protonm=
ail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/8c6e2c1c41b0fcc5fbd464c35f4d=
ac7102235396<br>
+<br>
+Signed-off-by: Ovidiu Panait <a href=3D"mailto:ovidiu.panait@windriver.com=
">&lt;ovidiu.panait@windriver.com&gt;</a><br>
+---<br>
+ lib/timeutils/scan-timestamp.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; | 8 ++++++--<br>
+ lib/timeutils/tests/test_scan-timestamp.c | 7 +++++++<br>
+ 2 files changed, 13 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c<br>
+index 197e3ad..4e618e4 100644<br>
+--- a/lib/timeutils/scan-timestamp.c<br>
++++ b/lib/timeutils/scan-timestamp.c<br>
+@@ -346,19 +346,21 @@ __parse_usec(const guchar **data, gint *length)<br>
+ static gboolean<br>
+ __has_iso_timezone(const guchar *src, gint length)<br>
+ {<br>
+-&nbsp; return (length &gt;=3D 5) &amp;&amp;<br>
++&nbsp; return (length &gt;=3D 6) &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (*src =3D=3D '+' ||=
 *src =3D=3D '-') &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit(*(src+1)) &=
amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit(*(src+2)) &=
amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *(src+3) =3D=3D ':'=
 &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit(*(src+4)) &=
amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; isdigit(*(src+5)) &=
amp;&amp;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !isdigit(*(src+6));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (length &lt; 7 || !isdig=
it(*(src+6)));<br>
+ }<br>
+ <br>
+ static guint32<br>
+ __parse_iso_timezone(const guchar **data, gint *length)<br>
+ {<br>
++&nbsp; g_assert(*length &gt;=3D 6);<br>
++<br>
+&nbsp;&nbsp; gint hours, mins;<br>
+&nbsp;&nbsp; const guchar *src =3D *data;<br>
+&nbsp;&nbsp; guint32 tz =3D 0;<br>
+@@ -368,8 +370,10 @@ __parse_iso_timezone(const guchar **data, gint *lengt=
h)<br>
+&nbsp;&nbsp; hours =3D (*(src + 1) - '0') * 10 + *(src + 2) - '0';<br>
+&nbsp;&nbsp; mins =3D (*(src + 4) - '0') * 10 + *(src + 5) - '0';<br>
+&nbsp;&nbsp; tz =3D sign * (hours * 3600 + mins * 60);<br>
++<br>
+&nbsp;&nbsp; src +=3D 6;<br>
+&nbsp;&nbsp; (*length) -=3D 6;<br>
++<br>
+&nbsp;&nbsp; *data =3D src;<br>
+&nbsp;&nbsp; return tz;<br>
+ }<br>
+diff --git a/lib/timeutils/tests/test_scan-timestamp.c b/lib/timeutils/tes=
ts/test_scan-timestamp.c<br>
+index da375c8..9b38738 100644<br>
+--- a/lib/timeutils/tests/test_scan-timestamp.c<br>
++++ b/lib/timeutils/tests/test_scan-timestamp.c<br>
+@@ -248,6 +248,13 @@ Test(parse_timestamp, non_zero_terminated_rfc5424_inp=
ut_is_handled_properly)<br>
+ <br>
+ }<br>
+ <br>
++Test(parse_timestamp, non_zero_terminated_rfc5424_timestamp_only)<br>
++{<br>
++&nbsp; const gchar *ts =3D &quot;2022-08-17T05:02:28.417+03:00&quot;;<br>
++&nbsp; gint ts_len =3D strlen(ts);<br>
++&nbsp; _expect_rfc5424_timestamp_len_eq(ts, ts_len, ts);<br>
++}<br>
++<br>
+ <br>
+ Test(parse_timestamp, daylight_saving_behavior_at_spring_with_explicit_ti=
mezones)<br>
+ {<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.pa=
tch b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch<br>
new file mode 100644<br>
index 000000000..cec573fa2<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-support/syslog-ng/files/CVE-2022-38725-0008.patch<br>
@@ -0,0 +1,47 @@<br>
+From f60dcfa9e094dc9c2a752115ca426159c4ae4192 Mon Sep 17 00:00:00 2001<br>
+From: Laszlo Varady <a href=3D"mailto:laszlo.varady@protonmail.com">&lt;la=
szlo.varady@protonmail.com&gt;</a><br>
+Date: Sat, 20 Aug 2022 14:30:51 +0200<br>
+Subject: [PATCH 8/8] timeutils: fix out-of-bounds reading of data buffer<b=
r>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Signed-off-by: L=E1szl=F3 V=E1rady <a href=3D"mailto:laszlo.varady@protonm=
ail.com">&lt;laszlo.varady@protonmail.com&gt;</a><br>
+<br>
+Upstream-Status: Backport<br>
+CVE: CVE-2022-38725<br>
+<br>
+Reference to upstream patch:<br>
+https://github.com/syslog-ng/syslog-ng/commit/56f881c5eaa3d8c02c96607c4b9e=
4eaf959a044d<br>
+<br>
+Signed-off-by: Ovidiu Panait <a href=3D"mailto:ovidiu.panait@windriver.com=
">&lt;ovidiu.panait@windriver.com&gt;</a><br>
+---<br>
+ lib/timeutils/scan-timestamp.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/lib/timeutils/scan-timestamp.c b/lib/timeutils/scan-timestamp=
.c<br>
+index 4e618e4..0f7f52e 100644<br>
+--- a/lib/timeutils/scan-timestamp.c<br>
++++ b/lib/timeutils/scan-timestamp.c<br>
+@@ -427,7 +427,7 @@ __parse_bsd_timestamp(const guchar **data, gint *lengt=
h, WallClockTime *wct)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!scan_pix_timestamp((const gchar =
**) &amp;src, &amp;left, wct))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (*src =3D=3D ':')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (left &amp;&amp; *src =3D=3D ':')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; left--;<br>
+@@ -478,7 +478,7 @@ scan_rfc3164_timestamp(const guchar **data, gint *leng=
th, WallClockTime *wct)<br>
+&nbsp;&nbsp;&nbsp; * looking at you, skip that as well, so we can reliably=
 detect IPv6<br>
+&nbsp;&nbsp;&nbsp; * addresses as hostnames, which would be using &quot;:&=
quot; as well. */<br>
+ <br>
+-&nbsp; if (*src =3D=3D ':')<br>
++&nbsp; if (left &amp;&amp; *src =3D=3D ':')<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++src;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --left;<br>
+-- <br>
+2.37.3<br>
+<br>
+<br>
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb b/meta-o=
e/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
index 40bbfe495..5fc386e56 100644<br>
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.36.1.bb<br>
@@ -22,6 +22,14 @@ SRC_URI =3D &quot;<a href=3D"https://github.com/balabit/=
syslog-ng/releases/download/$">https://github.com/balabit/syslog-ng/release=
s/download/$</a>{BP}/${BP}.ta<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://volatiles.03_syslog-ng">file://volatiles.03_syslog-ng</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://syslog-ng-tmp.conf">file://syslog-ng-tmp.conf</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://syslog-ng.service-the-syslog-ng-service.patch">file://syslog-ng.=
service-the-syslog-ng-service.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0001.patch">file://CVE-2022-38725-0001.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0002.patch">file://CVE-2022-38725-0002.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0003.patch">file://CVE-2022-38725-0003.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0004.patch">file://CVE-2022-38725-0004.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0005.patch">file://CVE-2022-38725-0005.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0006.patch">file://CVE-2022-38725-0006.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0007.patch">file://CVE-2022-38725-0007.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://C=
VE-2022-38725-0008.patch">file://CVE-2022-38725-0008.patch</a> \<br>
&nbsp;&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI[sha256sum] =3D &quot;90a25c9767fe749db50f118ddfc92ec71399763d=
2ecd5ad4f11ff5eea049e60b&quot;<br>
-- <br>
2.34.1<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">Sent from <a href=3D"https://go.microsoft.com/fwlink=
/?LinkId=3D550986">
Mail</a> for Windows<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><br>
<br>
<o:p></o:p></p>
<pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre>
<pre>Links: You receive all messages sent to this group.</pre>
<pre>View/Reply Online (#99684): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/99684">https://lists.openembedded.org/g/openem=
bedded-devel/message/99684</a></pre>
<pre>Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95194280=
/3616765">https://lists.openembedded.org/mt/95194280/3616765</a></pre>
<pre>Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembe=
dded.org">openembedded-devel+owner@lists.openembedded.org</a></pre>
<pre>Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> =
[<a href=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com=
</a>]</pre>
<pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</pre>
<pre><o:p>&nbsp;</o:p></pre>
</blockquote>
<p><o:p>&nbsp;</o:p></p>
<pre>-- </pre>
<pre># Randy MacLeod</pre>
<pre># Wind River Linux</pre>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Co=
urier New&quot;"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_BL0PR11MB34107DD5DF3BD3449EE2772F9F0F9BL0PR11MB3410namp_--

