Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B9EC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 06:37:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.67457.1670913419118460300
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 22:37:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=T8Mvzy8r;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93463ef6ab=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BD6G1Q3002832
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 06:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=60Qz+Ib/BKMxxOnK6Rd1JFIoBop2uv7qj8Mbrufsb6U=;
 b=T8Mvzy8rkOw+V1XMuaeKfaJr0rqENd7cKRbSQWl4/EhNIaSBvDL9ondpPAhX+Cy8JRe/
 riDqx1i4+GS9hcLU/DhVLGeaES3u0pSX/W3eYDkPvfg6VN/bH38XuozWsdf7ezRgG7n+
 7/LiYcTTx0nbFV7gpANTF9kERcGxIXEXfKaOoyswa/A7O3K4D5lj7XdJ3/VeXbEIoi+C
 Azo9ETT7zz13MiAjDBK6xJior4Q1c+ZgFJRGpredViElmggBTTj8XHZRJ/0kgI14uXwj
 AU6G/xNWSrJZWaGyHiEE+XeafLmKLGUW8i28nPHDSNGF5b2Yf6E53K8wrAFBrrKidmwy fA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3me1v7gsvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 06:36:57 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BD6avZq009404
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 06:36:57 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3me1v7gsvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Dec 2022 06:36:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9u7SO0q5KVVbbqHSlriL+fpMs3/i1MldpfLH86OlJtl/GQirb+3x+fhB/XJcBUJ2L9OoiyfB1EolESfRVWtIhWulGU5v7GvK3sKV7dp3esUSikIxqv0jeR+nRCD2rOrmzEMWjoLWUUrTsfh1EuPh+Af6JYEYL48GU9T81RD5nofIEd2l+v3Eh8c0DDEQQ2ceakX/u/UnIkMUg+B4h9jVVI4ssofvte1XrhsUMttzy47Ks+tEqUeOOc0NUrT3N1NaaTtEpjmukmH+UubVqtVyLjNDbuM7uoU+p3OFIQ+DD/EJF+GieKOCKBRV8mGBYWC8cTViQTOV7jxbGwbS3luaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60Qz+Ib/BKMxxOnK6Rd1JFIoBop2uv7qj8Mbrufsb6U=;
 b=FrWtrLMhp7tRtip04ODdXSq2avl3tEaAVZGaz7EHKkl+dM2iFUlnqCwM4/PvdWtodDmdjkpGMgrMA79v7psDdizNkMHmQBFB2dWriHYKi4GzPnwaQi1oXqJCZCO42+y2Qx14PZgjXlKioZU3ICSvDkwhMBqy7IrJvsMOnG6NSM6SzVMDJHP16n+gu1JPtnzTiqUdgfVwiaQEda48Od2lDGN6uI7NC4ybgOYJK8p+tWIxzGfhbxP5CgppNmtQtbYHZbkU8jmyPNWqPewIHUT0Hm9QVSf5DoCPWgiJf5iu9P5bx64HgccHdnXyKTrHx2HVn0rhRy1IqCtCOQNvXyXMiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by CH3PR11MB7868.namprd11.prod.outlook.com (2603:10b6:610:12e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 06:36:54 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::efde:3b28:b807:1f8c]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::efde:3b28:b807:1f8c%5]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 06:36:53 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        Armin Kuster
	<akuster808@gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: fix
 CVE-2022-45062
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: fix
 CVE-2022-45062
Thread-Index: AQHZCtMn8wEXfuhw5kutF549tDpi0K5qqlyAgAC6RzU=
Date: Tue, 13 Dec 2022 06:36:53 +0000
Message-ID: 
 <MW4PR11MB5822F2A59251355468FC100584E39@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20221208070305.1138128-1-archana.polampalli@windriver.com>
 <8ac2cffc-e10c-c4bf-5e53-052398a80264@windriver.com>
In-Reply-To: <8ac2cffc-e10c-c4bf-5e53-052398a80264@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|CH3PR11MB7868:EE_
x-ms-office365-filtering-correlation-id: 1aa72712-c8c5-4259-51f4-08dadcd46c73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 X5Adk1LJ+qEi+anGDpueR/aDmrSRAhis79+QcZNVGWzAd7P+Cu3wSeGoz1QLUEsNsjITKpRDaUkuyaTtPFUQPo+NtkBVTeaXB+Y9x27WBYafK0yRWe78+m7O8J3OAFbcJZ377vsU85o5eK5hoyeMmvCxEJtse6/T9sQ6a9fDlgJqE4D/C9p9kRGKtr3IXNuN1T9XrVrXjFtx0v/uud63Jm0raQhQxeY1/mnN85iS5Th1h6sNx2++wCaWdAgyhLqnhf+BUUYJrLoaEw7I2Xvwy56iIWstWBzLRoscjSZl0LKT5X1Ctkm42Mc0RDatJXzIpxEpk2eIfyP/2f+Pljgsh0hRy7kVebZBNdrltG8n6Kd+xgTtcErUiFhJZ/GFsTC3IZK449qbAvdNXG2UAX9e7ZdxhTpAlZ8hWjpNz20xrTShS2EVE6FqSwuLNyYamSxfSwBQ/B/+Yd3O0/B++uauayTSQV0BTiFVS2aboHHcRTia0tenyhE830p/S8yBNA/WZTW1jTFyrnSagjgUI8Pct6RPeZDkpicvDrC4fKrJJt93CwntTjs8PkeFg8vu8tNhIFFUilM1mTW2yOylT7QqKDHvzrcsxrFcLwRds80ssNpM0y80fCsSEZeR+WiNbkOo5ka5Y8/rmimxQlu/Lw2C//7dijmjVxj6AIyXptp+ryvjXhoqO/hAJntI22uAwI/Ri1KgSt8EgxTvg1SsAjFStoaY38E7zYs8uNhIMHaXwhAr/s7tdN1YAHnkDYnBxUFcZQLH1AdbEXoLDvuzQNRl+g==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(366004)(396003)(346002)(376002)(451199015)(38070700005)(33656002)(2906002)(478600001)(55016003)(71200400001)(966005)(41300700001)(166002)(38100700002)(122000001)(86362001)(5660300002)(91956017)(66556008)(8676002)(19627405001)(53546011)(66899015)(52536014)(316002)(110136005)(8936002)(66446008)(66476007)(76116006)(66946007)(6506007)(83380400001)(26005)(9686003)(64756008)(186003)(7696005)(66574015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?b0e//3Bpeye2p83ODx3fHZ2gObR0XyWB3QEnjDGrrG17Aewi9rrn0vClw7?=
 =?iso-8859-1?Q?EOvc+Wx2DcpgppxRsf50TQYLJRnIfJKIfAdWTudqZGsdfIneIN8Gs1N1XB?=
 =?iso-8859-1?Q?hKtFz5CrAnUKr5M1Pq9iO9R1jRn5NvbolaCzSYYoAp2B0TBFTKsw0V9X3Y?=
 =?iso-8859-1?Q?8PJGg9Q1NeAV7EbwP9QWGkGgRQ5ircUTp01y3Jht+uzlmI90ITWOvC6nJU?=
 =?iso-8859-1?Q?dmRR/WduhIX5bz2lq0n+gk3OWyNeuCriAWw+DH/s8uq3PUxcPIraSMiDJf?=
 =?iso-8859-1?Q?WvurzZqDZYx5DqAzXNyDmKXc+qAn41R7ynK8dVJgxrvEKDJqWak9wDKTIU?=
 =?iso-8859-1?Q?n4opbdvphnLNCYggD/ghUWXP2Cq6zMjFYED10AEt9EKZWWImE8sxn5M86O?=
 =?iso-8859-1?Q?0wwAH/AhRU7lR/vNQFcLkig6xapPmuM4Yr1MuLgMZZbYluEkrCQAKfiADV?=
 =?iso-8859-1?Q?G+qeA01DppqIO7CUb2/e36772Rm//77/GIewavlsUK0+FE4OWNAPqTmlVo?=
 =?iso-8859-1?Q?EpbqowmKKZwr4M4hSQ8Ve5mkXbG06VXqUWm8H5Hj0HmzPu+DP2xQz5I268?=
 =?iso-8859-1?Q?8baCV5YxdO5wr7omKjv5RHTpc24LAqTFwyJGHSnBYtuz7s6hT4hluNknCL?=
 =?iso-8859-1?Q?8n69s8Om2+eopnEhHaAEksfZgD4MZqr2EDvC3rCaDwhFWBr2DNdtmsSRpS?=
 =?iso-8859-1?Q?HPPxat+tz0AQysgYl5I2QaKRv2OsRodZSWU5YYdsFH6VlonYSdethtIGYz?=
 =?iso-8859-1?Q?3Geu6/jfZh7o3Vnx+fUxOi72BCJiMduV7aKDHWvgrum1EBnmf02d3sufaS?=
 =?iso-8859-1?Q?mu9XnkRq69tq0ZzovJjxo1pLQSR7sRY0/m4Qo7c3gST9YGMPC6mj7v63Xw?=
 =?iso-8859-1?Q?rJTfRXszypVEbbfsMK7v9fSo1kr9i+THMBtDSjOLgwsqdp+frjoEqeLlHP?=
 =?iso-8859-1?Q?mcjFYlBt+yKImXpqSbL5tsDfT+9o7Ma2JFBI4wxD0QkGMEunU8AQoN/M1D?=
 =?iso-8859-1?Q?P2MSr8em0yZy6h3+dXo2EUxq7Kwkre4AOMt6bES/FS2bTW6Sp4/u23Y9CC?=
 =?iso-8859-1?Q?gb2hXoRYZ3nvXeJfLdx4YVLl05gjAgj+NuOeIukwYUn1iQHnPHdd6kIqOl?=
 =?iso-8859-1?Q?8CvphSHqbcw66KDvclJk2YgaP/dLiDsoSA6ywdYkMqEjnq53gECoGZCKbv?=
 =?iso-8859-1?Q?6i1yDgIbGRfqrXv0KAtQxcKYoCx4yQbt14Wk0v+xGLdYAkPdbO0fSf5oty?=
 =?iso-8859-1?Q?hjRhR9VJOUbnXI5UOwv1Cta1J9bhMokH1Ea5alS8smmn+CEwNqdGYg/sa8?=
 =?iso-8859-1?Q?HefdobgB4aq+7iGIWrMWghkHzLimzlheR92junoto2G1vC+rMTmk4IAupU?=
 =?iso-8859-1?Q?g/Yxf7JtHNWse6PkWTBCYl44h/maC08FT2csYQac3r9RcFWaf8+eQKTs3M?=
 =?iso-8859-1?Q?EeUI5mHpiz+tP3rTQTm17/1e0Twni6JK3O0FMBBEsSHqxMs2CDS5Vi7h3n?=
 =?iso-8859-1?Q?GSszyYhOE05+IgUPlJ7BaDrNN1v63jG4sizdQV/y9PbhdxykCTIwTK+8Ym?=
 =?iso-8859-1?Q?M+6qOXEeZMGO3wgrAiEtllaVGeVv9FJaWRt5yTcd3vR7knQOvaSugSG/MP?=
 =?iso-8859-1?Q?a6UwkzV+Uw0pxYYmttVd6us060hIK/BWBijWwqFfYVgUedQvZsaiaDwg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822F2A59251355468FC100584E39MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aa72712-c8c5-4259-51f4-08dadcd46c73
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2022 06:36:53.6396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lYSnF/q9H1KMoGSyIFY39RMs68qj7HKR5rY4eqpxDtK8r+p8PnEXpuY9PRX7pv4dscolDIfRmcF2eH880kr11pw8loYTy9o7iwRRch5zD+34NQq41oMikZJnU0O+16o/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7868
X-Proofpoint-ORIG-GUID: 5KksQ6T0dgK2Rf0clkai6wqUXQYrtoAP
X-Proofpoint-GUID: rCqPYMWnHaGF1rCvLUmS0N18XkGtQIuP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-13_02,2022-12-12_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212130059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Dec 2022 06:37:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100068

--_000_MW4PR11MB5822F2A59251355468FC100584E39MW4PR11MB5822namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Will update to xfce4-settings-4.16.5 and will send patch

Regards,
Archana
________________________________
From: MacLeod, Randy <Randy.MacLeod@windriver.com>
Sent: Tuesday, December 13, 2022 12:59 AM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; Polampalli, Archana <Archana.Polampalli@windriver.com>; Arm=
in Kuster <akuster808@gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: fix CVE-20=
22-45062

On 2022-12-08 02:03, Polampalli, Archana via lists.openembedded.org wrote:

In Xfce xfce4-settings before 4.16.4 and 4.17.x before 4.17.1, there is an
argument injection vulnerability in xfce4-mime-helper.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-45062
https://gitlab.xfce.org/xfce/xfce4-settings/-/issues/390

Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-settings/-/co=
mmit/f1cb5bdafc6b9c71c541de267cc84a8c2ac32049]

CVE: CVE-2022-45062

Hi Archana,

Please update to: xfce4-settings-4.16.5 as was done on master:

commit 83eb9464882752e00746c1da8e3c52f4fc06bbde Author: Kai Kang <kai.kang@=
windriver.com><mailto:kai.kang@windriver.com> Date: Wed Nov 23 01:59:13 202=
2 xfce4-settings: 4.16.3 -> 4.16.5 It fixes CVE-2022-45062 in xfce4-setting=
s 4.16.5. CVE: CVE-2022-45062 Signed-off-by: Kai Kang <kai.kang@windriver.c=
om><mailto:kai.kang@windriver.com> Signed-off-by: Khem Raj <raj.khem@gmail.=
com><mailto:raj.khem@gmail.com>

?

$ git tag --contains f1cb5bdafc6b9c71c541de267cc84a8c2ac32049 xfce4-setting=
s-4.16.5 $ git branch -a --contains f1cb5bdafc6b9c71c541de267cc84a8c2ac3204=
9   remotes/origin/xfce-4.16

An update to the latest 4.16.x stable release will pick that commit up:

$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5 | rg f1cb5=
 f1cb5bda mime-settings: Properly quote command parameters

Also the update seems sensible in that it's only bug fixes and translation =
updates.

$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5
83ea11cf (tag: xfce4-settings-4.16.5) Updates for release
f1cb5bda mime-settings: Properly quote command parameters
f7707d8b Revert "Escape characters which do not belong into an URI/URL (Iss=
ue #390)"
b532324f Back to development
b9729c85 (tag: xfce4-settings-4.16.4) Updates for release
55e3c5fb Escape characters which do not belong into an URI/URL (Issue #390)
7489b73f I18n: Update translation pt (100%).
d314651f I18n: Update translation ja (100%).
51a8327d I18n: Update translation ru (100%).
42aa66d0 I18n: Update translation ru (100%).
341443f8 Prefer full command when basic command is env (Fixes #358)
8d4106b3 Back to development
024399b1 (tag: xfce4-settings-4.16.3) Updates for release
af601e32 build: Fix intltool lock file problem during make distcheck
0875cfba xfsettingsd: Fix recursive lock in libX11 (Fixes #369)
9195b3bd I18n: Update translation el (98%).
bfbe5173 I18n: Update translation el (98%).
222f2d1d I18n: Update translation el (98%).
dbfd87e5 I18n: Update translation el (98%).
4e7af67d I18n: Update translation en_GB (100%).
2ddf22e0 I18n: Update translation el (98%).
48e206d2 I18n: Update translation el (98%).
448f39ec I18n: Update translation el (98%).
127feac8 I18n: Update translation el (94%).
f82ba7dd I18n: Update translation en_GB (99%).
0654def5 I18n: Update translation en_GB (89%).
8cb73fd5 I18n: Update translation ko (99%).
22d9b99d I18n: Update translation en_CA (96%).
f30b6393 I18n: Update translation sv (100%).
2270d3e3 I18n: Update translation sv (100%).
066891c3 I18n: Update translation ko (97%).
08e417b2 I18n: Update translation ro (83%).
5900ff21 I18n: Update translation oc (100%).
dd3de2c9 I18n: Update translation oc (93%).
b220fdc3 I18n: Update translation et (100%).
842986a0 I18n: Update translation oc (88%).
80aac3e8 I18n: Update translation ms (100%).
c9329f00 I18n: Update translation et (99%).
09af4cc7 I18n: Update translation kk (100%).
77bcf8c5 I18n: Update translation id (100%).
1fc2d34a I18n: Update translation hy_AM (99%).
d84f3fdc I18n: Update translation pl (100%).
90b8f2e1 I18n: Update translation gl (100%).
4611d543 I18n: Update translation ca (100%).
c1ee5b28 I18n: Update translation lt (100%).
33a6052e I18n: Update translation be (100%).
a23c5fc5 I18n: Update translation et (98%).
20d866dc Back to development

Armin, or anyone else, any concerns?

../Randy



Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com><mailto=
:archana.polampalli@windriver.com>
---
 .../xfce4-settings/files/CVE-2022-45062.patch | 58 +++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.16.2.bb   |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45=
062.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.pat=
ch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
new file mode 100644
index 000000000..1e999a7c6
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
@@ -0,0 +1,58 @@
+commit f1cb5bdafc6b9c71c541de267cc84a8c2ac32049
+Author: Ga=EBl Bonithon <gael@xfce.org><mailto:gael@xfce.org>
+Date:   Sat Nov 12 22:27:36 2022 +0100
+
+    mime-settings: Properly quote command parameters
+
+    Fixes: #390
+    MR: !85
+
+diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-setti=
ngs/xfce-mime-helper.c
+index 7149951f..b2d8e50d 100644
+--- a/dialogs/mime-settings/xfce-mime-helper.c
++++ b/dialogs/mime-settings/xfce-mime-helper.c
+@@ -453,8 +453,43 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+       /* reset the error */
+       g_clear_error (&err);
+
++      /* prepare the command */
++      if (exo_str_is_empty (real_parameter))
++        command =3D g_strdup (commands[n]);
++      else
++        {
++          /* split command into "quoted"/unquoted parts */
++          gchar **cmd_parts =3D g_regex_split_simple ("(\"[^\"]*\")", com=
mands[n], 0, 0);
++
++          /* walk the part array */
++          for (gchar **cmd_part =3D cmd_parts; *cmd_part !=3D NULL; cmd_p=
art++)
++            {
++              /* quoted part: unquote it, replace %s and re-quote it prop=
erly */
++              if (g_str_has_prefix (*cmd_part, "\"") && g_str_has_suffix =
(*cmd_part, "\""))
++                {
++                  gchar *unquoted =3D g_strndup (*cmd_part + 1, strlen (*=
cmd_part) - 2);
++                  gchar *filled =3D exo_str_replace (unquoted, "%s", real=
_parameter);
++                  gchar *quoted =3D g_shell_quote (filled);
++                  g_free (filled);
++                  g_free (unquoted);
++                  g_free (*cmd_part);
++                  *cmd_part =3D quoted;
++                }
++              /* unquoted part: just replace %s */
++              else
++                {
++                  gchar *filled =3D exo_str_replace (*cmd_part, "%s", rea=
l_parameter);
++                  g_free (*cmd_part);
++                  *cmd_part =3D filled;
++                }
++            }
++
++          /* join parts to reconstitute the command, filled and quoted */
++          command =3D g_strjoinv (NULL, cmd_parts);
++          g_strfreev (cmd_parts);
++        }
++
+       /* parse the command */
+-      command =3D !exo_str_is_empty (real_parameter) ? exo_str_replace (c=
ommands[n], "%s", real_parameter) : g_strdup (commands[n]);
+       succeed =3D g_shell_parse_argv (command, NULL, &argv, &err);
+       g_free (command);
+
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb=
 b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
index aa4265f7b..6757c48f4 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
@@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg

 REQUIRED_DISTRO_FEATURES =3D "x11"

-SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"<file://0=
001-xsettings.xml-Set-default-themes.patch>
+SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch \
+            file://CVE-2022-45062.patch"<file://0001-xsettings.xml-Set-def=
ault-themes.patch\+file://CVE-2022-45062.patch>
 SRC_URI[sha256sum] =3D "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b8=
5be9197da03d7e"

 EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"




-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#99991): https://lists.openembedded.org/g/openembedded-d=
evel/message/99991
Mute This Topic: https://lists.openembedded.org/mt/95517736/3616765
Group Owner: openembedded-devel+owner@lists.openembedded.org<mailto:openemb=
edded-devel+owner@lists.openembedded.org>
Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ran=
dy.macleod@windriver.com<mailto:randy.macleod@windriver.com>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



--
# Randy MacLeod
# Wind River Linux

--_000_MW4PR11MB5822F2A59251355468FC100584E39MW4PR11MB5822namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">Will update to&nbsp;<span =
data-markjs=3D"true" class=3D"mark1t3c55jgh ContentPasted0" data-ogac=3D"" =
data-ogab=3D"" data-ogsc=3D"" data-ogsb=3D"" style=3D"font-size:15px;font-f=
amily:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot=
;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica=
 Neue&quot;, sans-serif;margin:0px;background-color:rgb(255, 255, 255)">xfc=
e4-settings</span><span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Se=
goe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, Blin=
kMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:15=
px;background-color:rgb(255, 255, 255);display:inline !important" class=3D"=
ContentPasted0 elementToProof">-4.16.5
 and will send patch</span></span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof"><span style=3D"font-family=
:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Sego=
e UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue=
&quot;, sans-serif;font-size:15px;background-color:rgb(255, 255, 255);displ=
ay:inline !important" class=3D"ContentPasted0 elementToProof"><br>
</span></span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof"><span style=3D"font-family=
:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Sego=
e UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue=
&quot;, sans-serif;font-size:15px;background-color:rgb(255, 255, 255);displ=
ay:inline !important" class=3D"ContentPasted0 elementToProof">Regards,</spa=
n></span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof"><span style=3D"font-family=
:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Sego=
e UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue=
&quot;, sans-serif;font-size:15px;background-color:rgb(255, 255, 255);displ=
ay:inline !important" class=3D"ContentPasted0 elementToProof">Archana</span=
></span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> MacLeod, Randy &lt;Ra=
ndy.MacLeod@windriver.com&gt;<br>
<b>Sent:</b> Tuesday, December 13, 2022 12:59 AM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; Polampalli, Archana &lt;Archana.Polampalli@win=
driver.com&gt;; Armin Kuster &lt;akuster808@gmail.com&gt;<br>
<b>Subject:</b> Re: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: fix=
 CVE-2022-45062</font>
<div>&nbsp;</div>
</div>
<div>
<div class=3D"x_moz-cite-prefix">On 2022-12-08 02:03, Polampalli, Archana v=
ia lists.openembedded.org wrote:<br>
</div>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">In Xfce xfce4-settings before 4.16.4 and 4.1=
7.x before 4.17.1, there is an
argument injection vulnerability in xfce4-mime-helper.

References:
<a class=3D"x_moz-txt-link-freetext" href=3D"https://nvd.nist.gov/vuln/deta=
il/CVE-2022-45062">https://nvd.nist.gov/vuln/detail/CVE-2022-45062</a>
<a class=3D"x_moz-txt-link-freetext" href=3D"https://gitlab.xfce.org/xfce/x=
fce4-settings/-/issues/390">https://gitlab.xfce.org/xfce/xfce4-settings/-/i=
ssues/390</a>

Upstream-Status: Backport [<a class=3D"x_moz-txt-link-freetext" href=3D"htt=
ps://gitlab.xfce.org/xfce/xfce4-settings/-/commit/f1cb5bdafc6b9c71c541de267=
cc84a8c2ac32049">https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/f1cb5=
bdafc6b9c71c541de267cc84a8c2ac32049</a>]

CVE: CVE-2022-45062</pre>
</blockquote>
<p>Hi Archana,</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
Please update to: xfce4-settings-4.16.5 as was done on master:</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
commit 83eb9464882752e00746c1da8e3c52f4fc06bbde Author: Kai Kang <a class=
=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@windriver.com">
&lt;kai.kang@windriver.com&gt;</a> Date: Wed Nov 23 01:59:13 2022 xfce4-set=
tings: 4.16.3 -&gt; 4.16.5 It fixes CVE-2022-45062 in xfce4-settings 4.16.5=
. CVE: CVE-2022-45062 Signed-off-by: Kai Kang
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:kai.kang@windriver.com"=
>&lt;kai.kang@windriver.com&gt;</a> Signed-off-by: Khem Raj
<a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailto:raj.khem@gmail.com">&lt=
;raj.khem@gmail.com&gt;</a>
</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
?</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
</p>
<p>$ git tag --contains f1cb5bdafc6b9c71c541de267cc84a8c2ac32049 xfce4-sett=
ings-4.16.5 $ git branch -a --contains f1cb5bdafc6b9c71c541de267cc84a8c2ac3=
2049 &nbsp; remotes/origin/xfce-4.16
</p>
<p>An update to the latest 4.16.x stable release will pick that commit up: =
</p>
<p>$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5 | rg f1=
cb5 f1cb5bda mime-settings: Properly quote command parameters</p>
<p></p>
<p></p>
<p>Also the update seems sensible in that it's only bug fixes and translati=
on updates.
</p>
$ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5<br>
83ea11cf (tag: xfce4-settings-4.16.5) Updates for release<br>
f1cb5bda mime-settings: Properly quote command parameters<br>
f7707d8b Revert &quot;Escape characters which do not belong into an URI/URL=
 (Issue #390)&quot;<br>
b532324f Back to development<br>
b9729c85 (tag: xfce4-settings-4.16.4) Updates for release<br>
55e3c5fb Escape characters which do not belong into an URI/URL (Issue #390)=
<br>
7489b73f I18n: Update translation pt (100%).<br>
d314651f I18n: Update translation ja (100%).<br>
51a8327d I18n: Update translation ru (100%).<br>
42aa66d0 I18n: Update translation ru (100%).<br>
341443f8 Prefer full command when basic command is env (Fixes #358)<br>
8d4106b3 Back to development<br>
024399b1 (tag: xfce4-settings-4.16.3) Updates for release<br>
af601e32 build: Fix intltool lock file problem during make distcheck<br>
0875cfba xfsettingsd: Fix recursive lock in libX11 (Fixes #369)<br>
9195b3bd I18n: Update translation el (98%).<br>
bfbe5173 I18n: Update translation el (98%).<br>
222f2d1d I18n: Update translation el (98%).<br>
dbfd87e5 I18n: Update translation el (98%).<br>
4e7af67d I18n: Update translation en_GB (100%).<br>
2ddf22e0 I18n: Update translation el (98%).<br>
48e206d2 I18n: Update translation el (98%).<br>
448f39ec I18n: Update translation el (98%).<br>
127feac8 I18n: Update translation el (94%).<br>
f82ba7dd I18n: Update translation en_GB (99%).<br>
0654def5 I18n: Update translation en_GB (89%).<br>
8cb73fd5 I18n: Update translation ko (99%).<br>
22d9b99d I18n: Update translation en_CA (96%).<br>
f30b6393 I18n: Update translation sv (100%).<br>
2270d3e3 I18n: Update translation sv (100%).<br>
066891c3 I18n: Update translation ko (97%).<br>
08e417b2 I18n: Update translation ro (83%).<br>
5900ff21 I18n: Update translation oc (100%).<br>
dd3de2c9 I18n: Update translation oc (93%).<br>
b220fdc3 I18n: Update translation et (100%).<br>
842986a0 I18n: Update translation oc (88%).<br>
80aac3e8 I18n: Update translation ms (100%).<br>
c9329f00 I18n: Update translation et (99%).<br>
09af4cc7 I18n: Update translation kk (100%).<br>
77bcf8c5 I18n: Update translation id (100%).<br>
1fc2d34a I18n: Update translation hy_AM (99%).<br>
d84f3fdc I18n: Update translation pl (100%).<br>
90b8f2e1 I18n: Update translation gl (100%).<br>
4611d543 I18n: Update translation ca (100%).<br>
c1ee5b28 I18n: Update translation lt (100%).<br>
33a6052e I18n: Update translation be (100%).<br>
a23c5fc5 I18n: Update translation et (98%).<br>
20d866dc Back to development
<p></p>
<p>Armin, or anyone else, any concerns? </p>
<p>../Randy</p>
<p></p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
</p>
<p style=3D"margin-top:0px; margin-bottom:0px; margin-left:0px; margin-righ=
t:0px; text-indent:0px">
</p>
<p><style type=3D"text/css">
<!--
p, li
	{white-space:pre-wrap}
-->
</style></p>
<blockquote type=3D"cite">
<pre class=3D"x_moz-quote-pre">

Signed-off-by: Archana Polampalli <a class=3D"x_moz-txt-link-rfc2396E" href=
=3D"mailto:archana.polampalli@windriver.com">&lt;archana.polampalli@windriv=
er.com&gt;</a>
---
 .../xfce4-settings/files/CVE-2022-45062.patch | 58 +++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.16.2.bb   |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45=
062.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.pat=
ch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
new file mode 100644
index 000000000..1e999a7c6
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
@@ -0,0 +1,58 @@
+commit f1cb5bdafc6b9c71c541de267cc84a8c2ac32049
+Author: Ga=EBl Bonithon <a class=3D"x_moz-txt-link-rfc2396E" href=3D"mailt=
o:gael@xfce.org">&lt;gael@xfce.org&gt;</a>
+Date:   Sat Nov 12 22:27:36 2022 +0100
+
+    mime-settings: Properly quote command parameters
+   =20
+    Fixes: #390
+    MR: !85
+
+diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-setti=
ngs/xfce-mime-helper.c
+index 7149951f..b2d8e50d 100644
+--- a/dialogs/mime-settings/xfce-mime-helper.c
++++ b/dialogs/mime-settings/xfce-mime-helper.c
+@@ -453,8 +453,43 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+       /* reset the error */
+       g_clear_error (&amp;err);
+=20
++      /* prepare the command */
++      if (exo_str_is_empty (real_parameter))
++        command =3D g_strdup (commands[n]);
++      else
++        {
++          /* split command into &quot;quoted&quot;/unquoted parts */
++          gchar **cmd_parts =3D g_regex_split_simple (&quot;(\&quot;[^\&q=
uot;]*\&quot;)&quot;, commands[n], 0, 0);
++
++          /* walk the part array */
++          for (gchar **cmd_part =3D cmd_parts; *cmd_part !=3D NULL; cmd_p=
art++)
++            {
++              /* quoted part: unquote it, replace %s and re-quote it prop=
erly */
++              if (g_str_has_prefix (*cmd_part, &quot;\&quot;&quot;) &amp;=
&amp; g_str_has_suffix (*cmd_part, &quot;\&quot;&quot;))
++                {
++                  gchar *unquoted =3D g_strndup (*cmd_part + 1, strlen (*=
cmd_part) - 2);
++                  gchar *filled =3D exo_str_replace (unquoted, &quot;%s&q=
uot;, real_parameter);
++                  gchar *quoted =3D g_shell_quote (filled);
++                  g_free (filled);
++                  g_free (unquoted);
++                  g_free (*cmd_part);
++                  *cmd_part =3D quoted;
++                }
++              /* unquoted part: just replace %s */
++              else
++                {
++                  gchar *filled =3D exo_str_replace (*cmd_part, &quot;%s&=
quot;, real_parameter);
++                  g_free (*cmd_part);
++                  *cmd_part =3D filled;
++                }
++            }
++
++          /* join parts to reconstitute the command, filled and quoted */
++          command =3D g_strjoinv (NULL, cmd_parts);
++          g_strfreev (cmd_parts);
++        }
++
+       /* parse the command */
+-      command =3D !exo_str_is_empty (real_parameter) ? exo_str_replace (c=
ommands[n], &quot;%s&quot;, real_parameter) : g_strdup (commands[n]);
+       succeed =3D g_shell_parse_argv (command, NULL, &amp;argv, &amp;err)=
;
+       g_free (command);
+=20
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb=
 b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
index aa4265f7b..6757c48f4 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
@@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg
=20
 REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;
=20
-SRC_URI +=3D <a class=3D"x_moz-txt-link-rfc2396E" href=3D"file://0001-xset=
tings.xml-Set-default-themes.patch">&quot;file://0001-xsettings.xml-Set-def=
ault-themes.patch&quot;</a>
+SRC_URI +=3D <a class=3D"x_moz-txt-link-rfc2396E" href=3D"file://0001-xset=
tings.xml-Set-default-themes.patch\+file://CVE-2022-45062.patch">&quot;file=
://0001-xsettings.xml-Set-default-themes.patch \
+            file://CVE-2022-45062.patch&quot;</a>
 SRC_URI[sha256sum] =3D &quot;4dd7cb420860535e687f673c0b5c0274e0d2fb6718128=
1d4b85be9197da03d7e&quot;
=20
 EXTRA_OECONF +=3D &quot;--enable-maintainer-mode --disable-debug&quot;
</pre>
<br>
<fieldset class=3D"x_moz-mime-attachment-header"></fieldset>
<pre class=3D"x_moz-quote-pre">-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-
Links: You receive all messages sent to this group.
View/Reply Online (#99991): <a class=3D"x_moz-txt-link-freetext" href=3D"ht=
tps://lists.openembedded.org/g/openembedded-devel/message/99991">https://li=
sts.openembedded.org/g/openembedded-devel/message/99991</a>
Mute This Topic: <a class=3D"x_moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/95517736/3616765">https://lists.openembedded.org/mt/95=
517736/3616765</a>
Group Owner: <a class=3D"x_moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.op=
enembedded.org</a>
Unsubscribe: <a class=3D"x_moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/=
openembedded-devel/unsub</a> [<a class=3D"x_moz-txt-link-abbreviated" href=
=3D"mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
</blockquote>
<p></p>
<pre class=3D"x_moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
</div>
</body>
</html>

--_000_MW4PR11MB5822F2A59251355468FC100584E39MW4PR11MB5822namp_--

