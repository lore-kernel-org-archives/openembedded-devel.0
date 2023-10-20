Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6C27CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:53:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.50300.1697791994109522484
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:53:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MpprRDyk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86572e0271=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K7u3ZK015021
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 01:53:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=3K2JdncthvfpxmpcYk
	PCCnrcHt396PvlW6qNwB3wfHw=; b=MpprRDyk/PCfZRPq5To8kHH+T9REaFqAf1
	zXIJSmjtxgHW7YL6GAnK26IU6vZnAFUqgG/9RoBhNHRftMTr+l+tinIhkTxhMUZ2
	aZYMOS7aMb8gBMOaVtPAm+k3YVYtApVrWN9AXE9lN4iX2B5U9W28kevNBzr9g4ka
	Gwz25la8xyckJR+MUvtCD5A/FYWFSsw+BoHQchObAZmnDW7sdUv/Cc/5qd3m40eC
	/1SXb8/GxHYzVZB6hiSubqt3zmW1vFATodJNPK0L8/d+Bkkf3nhUxaULhWTeyTB+
	owvcAJKilViSL7aLEQoLF2bUdzNA5/7zXnwIyabvMlfgbxj4/vmw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuews0b37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 01:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTHA1y3p0G90tD0XWKs5pLQdMtYs7ZRYdRRkeA9vI2PWqIiPBmdWlcYZ2o5oq+VozqNj6NcskEKzh6ce1RtMAe7GqoQAAi8F8PVfjH+qS3u+Ud5jtT2fQCeU5NmPgUijm5TnXZx6fwCqxIWGT4sWhbbmAMY6rU4JNPiPFpvbGWx/+p8hGOORHPCME/ReOcvVo9+9RT2GkpA7kw8aN299eyoiTAtGYXujKJP3jUwgK8Yy9CMTgr0TZQZYoAq644XDWH1/UzWFYSWw/G91j6axXH2rgDVtbWi2V3Wo+6YHNe+scQ3wUcG7IgGZHb8VPk1u8wPjBO6SQZm/nZrTmbIAZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K2JdncthvfpxmpcYkPCCnrcHt396PvlW6qNwB3wfHw=;
 b=Ui4QMsHisko+mfJpJC+9opRFGBHQ2nd3/mm76uXZaY6WsvkJ8RWLYKZEl5B52+Gdm7Xuxph5hq1V5jxdffI8De6sjJ3p5YKpgFeKfOr1s1SxhbA/tC2i3Nk81xkv/OFsYfBDCEsh3yb+QLAlOmlHim7bvGdk5vyD1a7xXpB4WINt85shl9CH19AUg1UBWPwXYG24sm6/ecLi1Jq6yFZbk113xAXLOcVfHo31jha6U/W1Hsv1kiJzd74j3hhRn5u/Fhe6yKZWhG53CDRUhMICDJtzpji0HjcMC46uDjcJPfRrcuZ74A3gmtn3B+4s48lDQl133MBsDXB0E65dZdJdHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 08:53:06 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::226:904a:7463:daba]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::226:904a:7463:daba%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:53:06 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH V2 2/3] samba: fix
 CVE-2022-2127
Thread-Topic: [oe][meta-networking][kirkstone][PATCH V2 2/3] samba: fix
 CVE-2022-2127
Thread-Index: AQHZ8vyUEWC3zgQojE+lQ7Xc9HUm7LBSf6L/
Date: Fri, 20 Oct 2023 08:53:06 +0000
Message-ID: 
 <MW4PR11MB58224362D6576E3B143CBBE384DBA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20230929174321.3060914-1-archana.polampalli@windriver.com>
 <17896F958DB5C179.9230@lists.openembedded.org>
In-Reply-To: <17896F958DB5C179.9230@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|BY1PR11MB8029:EE_
x-ms-office365-filtering-correlation-id: 011764dd-e54c-4453-825a-08dbd149fa38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 B+W3cnQrXg8jwjxOR60sqS8sRBak5AHWq+McX67awt1Z2qmL+ZJ3sz3xUOWiq7/3stBHdC9URrVERXcGW3dYYMzIwdAf5VE09Fc0o6aIVCd1YvbMaQsGyBhGVYsV45z4OVhflWj3fVXQvGvjKAWvgmTv2RMXUn8M84Ja9+cJT8wX2NLlQs6igWEocGbLlymyd5vlitojj9KZh8mWcqejMwVuR1mENSztRNYW33lGXvRJ9G9d0UBlE1sbKlNKi/0oNS/vyGS/5dpoFEWhIA+tiqAqZq1nacSa2TVwy6ofLWJ5f4+zJBCU6ojQ0F1OnGB0K8LYo5MiSDwBjhqHis46K1iwxZ/22mKRWDqom0D/11KOFmnfyU1flxaEXw3Lb3Q1O/wk6o8JXxTDIs16ZLDvoBA8ZjfTfU/I9WJhEYx8P3aKiRFHtgrzB9wiD7EIKrigIXMAQMMw7m1d/a0zFdzbbO9gXwPjuLNWTFlZKUvwJHWgsen0VE/aod5RZq00XsR9gDQJVJH8K+XcfOK+UQAVr7oyXyEr/Tqj42g9w2SGWMdqiVYnt3put+No+KuR6/oLK3hgmDzQqfJyzP6KpcO/UwPZEHsjakoWUWxxgNa4194=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(346002)(366004)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(19627405001)(33656002)(55016003)(38070700009)(91956017)(316002)(66556008)(66946007)(64756008)(66446008)(66476007)(166002)(86362001)(38100700002)(76116006)(122000001)(110136005)(83380400001)(71200400001)(9686003)(7696005)(6506007)(8936002)(2906002)(478600001)(41300700001)(8676002)(966005)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?WZQcuYXzs9hH+RgZVaU++i6MJxfCsY8yEXvQSoNxFaXyU9gHHcAH30D4Fs47?=
 =?us-ascii?Q?EsBaC6U+SUq1tirFMi3CbUEIT95RZCgx5mVl+sxlgPJLZWQ4yJFS+Q1IG5WU?=
 =?us-ascii?Q?0uCQ819Q0ZX4IQCPSktC4i82tsVeoOFgS62ADK9sI26zKKirHXz363lbYA+r?=
 =?us-ascii?Q?WqhtTj5CK8/CH2kwfPpjOT0hDX5LE3v3PZJvxSwuBo4OYqz54T70v6EFaanK?=
 =?us-ascii?Q?rwedhYw+0P8DJ8MiiGeWf2j+/Fl30cTc6lLy935BYgkhYCIsCDFyc9GzJFf/?=
 =?us-ascii?Q?rn6/nCSX1iU9hsie3uv4+u0L1bNLuGcKtlon5dU1G3YVcUjwSr2uoLr4SGPt?=
 =?us-ascii?Q?l/fOtCMd/6gh54r31a6IqICGry983GB1YWy0ypFfr377VNt/sH181r+FRcU8?=
 =?us-ascii?Q?T70F5ggNDq7LXIUsxPOGQ1KOKsQIM1UxMHSRAlxE568qKF0XmtuBU81ljSPO?=
 =?us-ascii?Q?FQw4+NuhkFb/U5TSP6PgOw5SaTDzRO2BwW7hyFBYX7nDFaW14iBG1KFS7Sgq?=
 =?us-ascii?Q?5aAgj9uuVWTDQZGe9y66OoIgdGwqmX6uG+b4McqYgjgUFa1Kk8duHUssonDc?=
 =?us-ascii?Q?OkNxBNa8sdAViOn4tmm1NvzXiB5gYK7VrBRlCrpIMmJqI6d+lxAREfJREDLE?=
 =?us-ascii?Q?PI2Kj02ZAabw5dZ5ndfugqlnlbPQc9yUg2tCT10wF1+GcJsq404fUaFMOvD1?=
 =?us-ascii?Q?plA8u9aL7ui7goKHBei1+LMh3b6WaXb7RqgtC8GdnwUfPa8UmvZHSUKxHXfd?=
 =?us-ascii?Q?BSy6w2LyYZ5eQIiOAM5T3Ytr8eKx57iygmeutN3YmWCmqNPa0PdSfR/25nG2?=
 =?us-ascii?Q?uK3vEhC0x5UHDFKNskTPSeYltIrrLg2aqBP2FCys+pTDNW8gKFUglBOVAxVq?=
 =?us-ascii?Q?+afNILVeIfzp0/6OE693oowX63Bvy1hPv1XeD3uf5MidTOWbzJiV96U6IN7I?=
 =?us-ascii?Q?wo0xrzd/StMStfvNhsyb8bTzW6yBtoLFDhmgccsmFEfaRRudCdHauPfzj9L/?=
 =?us-ascii?Q?Gtd1wwZIqRNBbKmsREyTrVNJCbScj2hyyyQ88H1qn+9+hLzRgBFaLPzmN0f0?=
 =?us-ascii?Q?7ZKbwn7mctE0VusyOzI9MzSiiEPxxdHLl7JoWmaXqStR//BkW46/8ucQWjbU?=
 =?us-ascii?Q?CiFUUm9VVLw0mVcnGsle/+k88pMHyLG7bjSoENcyvan9Gf6wq7i00CCu7cdf?=
 =?us-ascii?Q?PoEV6F3wpAMi/SfjjvQctiGNkFPsnq3FFBtA1fs5s75bn/Q665fkNj/Dkjov?=
 =?us-ascii?Q?gL4onn5sxYoJJU2ejEHi7wWxmCMEEAD/0iKeApUQjhBL0uXNmOxYwDiZ8l2G?=
 =?us-ascii?Q?c2NXhl9gaaOFeZlKuKAUorlG9RgP9fO+vhLOVxhjBPOMHNGgl49ofl51MrOw?=
 =?us-ascii?Q?jMvP3dHtWqsqhCjpc3jsfpflTHWM/1SxgBh69gkBkAfA10V5AqzqRRYXVkNn?=
 =?us-ascii?Q?IwecAGwf6bbPnpKa0bn+T9leNxOzy5U7FX+LHa7yKFxyFp65O/Uxwdk/uT35?=
 =?us-ascii?Q?1My9+xQp8U2xh/KPFwPEzB33DHmij7Jhhe+qEjosCJF1W6eCV9U4wLxAQKWD?=
 =?us-ascii?Q?fZnSm+7Y0dze6/CiGuU4cEPT+EWSJzbKR1YtnU3MwJ65c//NTqx2BFJGUHAs?=
 =?us-ascii?Q?nU1LZloxJVMnJHhCl85T78Zd+6mOADJflGfQDO0hH9QjH4EfA7iATfp2N6qA?=
 =?us-ascii?Q?azyOLQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58224362D6576E3B143CBBE384DBAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011764dd-e54c-4453-825a-08dbd149fa38
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 08:53:06.3149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IY+F0Yu8OLdL70bckmyTzz/bQc19eO1wb6PrmMq0tRNn3lPWwzVybs/ntqACohQ/rHIkZ5JVMa0A6J+f8tMqPxZZYdyqEOua1znwKpInoR6MjVd/yYoEg6yhvqsfPtl3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
X-Proofpoint-GUID: Ue9VnEXC0vPJJxX4bHATLkINfqVtgbB2
X-Proofpoint-ORIG-GUID: Ue9VnEXC0vPJJxX4bHATLkINfqVtgbB2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310200074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 08:53:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105617

--_000_MW4PR11MB58224362D6576E3B143CBBE384DBAMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reminder!

-Archana
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Polampalli, Archana via lists.openembedded.or=
g <archana.polampalli=3Dwindriver.com@lists.openembedded.org>
Sent: 29 September 2023 23:13
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-networking][kirkstone][PATCH V2 2/3] samba: fix CVE-2022=
-2127

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2022-2127.patch           | 44 +++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
22-2127.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127=
.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.pat=
ch
new file mode 100644
index 000000000..e94d5d538
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch
@@ -0,0 +1,44 @@
+From 53838682570135b753fa622dfcde111528563c2d Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Fri, 16 Jun 2023 12:28:47 +0200
+Subject: [PATCH] CVE-2022-2127: ntlm_auth: cap lanman response length valu=
e
+
+We already copy at most sizeof(request.data.auth_crap.lm_resp) bytes to th=
e
+lm_resp buffer, but we don't cap the length indicator.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15072
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+CVE: CVE-2022-2127
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/5383=
8682570135b753fa622dfcde111528563c2d]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/utils/ntlm_auth.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/source3/utils/ntlm_auth.c b/source3/utils/ntlm_auth.c
+index 02a2379..c82ea45 100644
+--- a/source3/utils/ntlm_auth.c
++++ b/source3/utils/ntlm_auth.c
+@@ -574,10 +574,14 @@ NTSTATUS contact_winbind_auth_crap(const char *usern=
ame,
+       memcpy(request.data.auth_crap.chal, challenge->data, MIN(challenge-=
>length, 8));
+
+       if (lm_response && lm_response->length) {
++              size_t capped_lm_response_len =3D MIN(
++                      lm_response->length,
++                      sizeof(request.data.auth_crap.lm_resp));
++
+               memcpy(request.data.auth_crap.lm_resp,
+                      lm_response->data,
+-                     MIN(lm_response->length, sizeof(request.data.auth_cr=
ap.lm_resp)));
+-              request.data.auth_crap.lm_resp_len =3D lm_response->length;
++                     capped_lm_response_len);
++              request.data.auth_crap.lm_resp_len =3D capped_lm_response_l=
en;
+       }
+
+       if (nt_response && nt_response->length) {
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 11b6ade40..b71c4b3fc 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -35,6 +35,7 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2021-44758.patch;patchdir=3Dsource4/heimdal \
            file://CVE-2023-34966_0001.patch \
            file://CVE-2023-34966_0002.patch \
+           file://CVE-2022-2127.patch \
            "

 SRC_URI:append:libc-musl =3D " \
--
2.40.0


--_000_MW4PR11MB58224362D6576E3B143CBBE384DBAMW4PR11MB5822namp_
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
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Reminder!</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
-Archana</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Polampalli, Archana via lists.openembedded.org
 &lt;archana.polampalli=3Dwindriver.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> 29 September 2023 23:13<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-networking][kirkstone][PATCH V2 2/3] samba: fix C=
VE-2022-2127</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Archana Polampalli &lt;archana.pola=
mpalli@windriver.com&gt;<br>
---<br>
&nbsp;.../samba/samba/CVE-2022-2127.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 44 +++++++++++++++++++<br>
&nbsp;.../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 1 +<br>
&nbsp;2 files changed, 45 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2022-2127.patch<br>
<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127=
.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.pat=
ch<br>
new file mode 100644<br>
index 000000000..e94d5d538<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2022-2127.patch<=
br>
@@ -0,0 +1,44 @@<br>
+From 53838682570135b753fa622dfcde111528563c2d Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Fri, 16 Jun 2023 12:28:47 +0200<br>
+Subject: [PATCH] CVE-2022-2127: ntlm_auth: cap lanman response length valu=
e<br>
+<br>
+We already copy at most sizeof(request.data.auth_crap.lm_resp) bytes to th=
e<br>
+lm_resp buffer, but we don't cap the length indicator.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15072">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15072</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+<br>
+CVE: CVE-2022-2127<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/53838682570135b753fa622dfcde111528563c2d">https://github.com/samba-t=
eam/samba/commit/53838682570135b753fa622dfcde111528563c2d</a>]<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/utils/ntlm_auth.c | 8 ++++++--<br>
+ 1 file changed, 6 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/source3/utils/ntlm_auth.c b/source3/utils/ntlm_auth.c<br>
+index 02a2379..c82ea45 100644<br>
+--- a/source3/utils/ntlm_auth.c<br>
++++ b/source3/utils/ntlm_auth.c<br>
+@@ -574,10 +574,14 @@ NTSTATUS contact_winbind_auth_crap(const char *usern=
ame,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(request.data.auth_crap.chal, c=
hallenge-&gt;data, MIN(challenge-&gt;length, 8));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (lm_response &amp;&amp; lm_respons=
e-&gt;length) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; size_t capped_lm_response_len =3D MIN(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lm_response-&gt;lengt=
h,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(request.data.a=
uth_crap.lm_resp));<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; memcpy(request.data.auth_crap.lm_resp,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; lm_response-&gt;data,<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MIN(lm_response-&gt;length,=
 sizeof(request.data.auth_crap.lm_resp)));<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; request.data.auth_crap.lm_resp_len =3D lm_response-&gt;length;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; capped_lm_response_len);<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; request.data.auth_crap.lm_resp_len =3D capped_lm_response_len;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (nt_response &amp;&amp; nt_respons=
e-&gt;length) {<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
index 11b6ade40..b71c4b3fc 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
@@ -35,6 +35,7 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar.=
gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2021-44758.patch;patchdir=3Dsource4/heimdal">file://CVE-2021=
-44758.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-34966_0001.patch">file://CVE-2023-34966_0001.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-34966_0002.patch">file://CVE-2023-34966_0002.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2022-2127.patch">file://CVE-2022-2127.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;<br>
&nbsp;SRC_URI:append:libc-musl =3D &quot; \<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB58224362D6576E3B143CBBE384DBAMW4PR11MB5822namp_--

