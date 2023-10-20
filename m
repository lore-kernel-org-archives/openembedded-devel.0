Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14FACDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:53:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.50303.1697792020327248608
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:53:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SVYOiAnt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=86572e0271=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K7LK1Y017622
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 01:53:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=fNe3ySMPCfnxB/wM5I
	rjGTZ2yn0UClBVqGaphQgGY4s=; b=SVYOiAntwTZwXobkxQWpmPnSb++Oh0mOb2
	24yMMBc5f7hE9JxKk8pXHcCMypaUtuX4BOpM8bj83poBVCCkjlRja0W7uE7qb/ul
	4PVEaxVPnCrsRWpHns7cFF4NIFXPSdf6qoMhwunT2QWiTmK4zdmEUay99NwTdOTY
	n7itp8vUHdGQxaLv0kw/Ex+XxtGRd2F2yzFYB45VgyDfUQ0Oq5TSF00Zy7/1MPtx
	cHKTRSiQcK0Hb8ofHfgyrUieptcjOR+y3x/bNMph7szX7WpOIUzM4vRKQa4Wg/wA
	H/s8+hy+bbqQZb+l5cInXO7b++iPQu8uUNCBBJEPR3XUPgsnIbxA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuews0b3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 01:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iK38M38xTq6J9yId8CsUUbQKnyvDNOitqBwJV2Rv9JC+dlF5MGYpREdPy40xMz4kne37hcyXb/Sn/pvuH3yCi4VsuymlYHO3dbtciBTffwXq7DGNoZuT+QSRhjEggSB5CoB6muWdCst7vYHXg5Xlr8nhjP1wiImcgop7fPsRN0W3ImnfZuN1viVlkyAOhLkX77u0lhYxdAJdwrUiSRuKi9eXuZ85L8AwhTc+MRAvgh/rflxCDyBBIvxKGcXFID15HhDtTPeBbqoJkCuhnyCDtt6qt+M27qP/HsZmSMI5+qNpJPk0lNlMB+k/Jfl/bvYLIPwFgt6lDbcghuRbO9KInQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNe3ySMPCfnxB/wM5IrjGTZ2yn0UClBVqGaphQgGY4s=;
 b=eTnfdx+nUFsghNE96bcWVVSfxVv4wf878gaxajlhwnntsAmmlhch6PcCWH9dXFQL+FAEX3VzupB9wIQf09GwcwOwoG7Eqjpy7Re8Su8+QVxo7P9E0odNwGtjFYt98h61BlYIcDzBLxQvbHE6QVLmaIKP+OdX0tBRQJg+F6deRsAaGK5Z6v7uRhB9gBXLM3fyJZI/4IBVk15bUlaOnOqhp63NuzcIxOmvWgH8d9U6Qk//O4GW6GDh3D0XflcVc5UPjyI9hxuwsMxq1DH4ROicLYo9nGpLVGQgP0BuKnEu1YA4CXgO+PFZHhZRYCAjHhKiCPQTTdZF2SCaoO0Pjicc0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 08:53:37 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::226:904a:7463:daba]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::226:904a:7463:daba%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:53:36 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH V2 3/3] samba:fix
 CVE-2023-34967
Thread-Topic: [oe][meta-networking][kirkstone][PATCH V2 3/3] samba:fix
 CVE-2023-34967
Thread-Index: AQHZ8vycxh56w58UKEmC2KY2h42PGLBSf86t
Date: Fri, 20 Oct 2023 08:53:36 +0000
Message-ID: 
 <MW4PR11MB5822CBF706C2C5BD9DFC877684DBA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20230929174321.3060914-1-archana.polampalli@windriver.com>
 <17896F95F91E203B.31348@lists.openembedded.org>
In-Reply-To: <17896F95F91E203B.31348@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|BY1PR11MB8029:EE_
x-ms-office365-filtering-correlation-id: 02a3b41c-a2d9-4fd0-b783-08dbd14a0c61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nB33Q27eJz+uYYzwK+GS4wei890oOGw72fMkDWYflIDRbqIrkU8eF23Xq1b7hPzZY5KeyeWH7ICNJW/EL1Q6bAVx/wA1SisEHmlkp6V2SQZrHPjbbEPHOWjvNlIvlwR0N0QRJSYXtmRApMY9J2lfh2ufSNzsKLpYR0ST2W5pARESfyVHFsqEM1mvkFVKZlgUnNw3P7szIo0Jifka5vnsh37R4c84Bc5b9JprojVUJced9B1hbgpVZ57RXHenC+qE+zRu1pk9I46PxnSFYsj/MwnJgBcNRUlklnjst1JDcGuQFfZ+GS9gQbxvbVILY/heSzTvvUJKIibVY7XsIEbl+w6Q3rYmtfx9wYhCpHOt1zMC413GgyTYBo6zD90QIuPUghhv6/bAn7CmYQR4t/GDh6NOb9/jBsUaeNbnL33T+o+ANZNXuw5EbzrNVdeosxDBnL/FFRSHXJwovXj4irYuMhCVgM/mJhWX7eInlTDnAyWjN4tEoft8BrD103vG11oVgUqArgYhAQgFA85DEoT+JmlJBLNsOPVgYVXxnWKjUlFKCK7Wr70t9GOXzUnP2xEiWFy6GoSTn4dUUhu+CtlCHu0dhrhHJ1/xnZYXVc/3GDJoi750uXvTy9Nb2Y7mwpLMXwDzDWcXlkDF8L/a/KVUTQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(346002)(366004)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(19627405001)(33656002)(55016003)(38070700009)(91956017)(316002)(66556008)(66946007)(64756008)(66446008)(66476007)(166002)(86362001)(38100700002)(76116006)(122000001)(110136005)(83380400001)(71200400001)(9686003)(7696005)(6506007)(8936002)(30864003)(2906002)(478600001)(41300700001)(8676002)(966005)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ebBaMocA65vKJwctkmmOnKD2WKjysngukevPO9RwAhlgbqaKth2RMq3zc28t?=
 =?us-ascii?Q?gwqBpqe1bPJo4E0tzjGIfop2NpiBExSmoo6nG4cpNejQkQDTnNw4M8yU7iP6?=
 =?us-ascii?Q?qxxoARg9ZV5NYrIaTuzM8JQxxNaB287ryhk2RHdbBGnVcwz2qGlD72WBygVr?=
 =?us-ascii?Q?KA/TNC1DGfD2AQHEWEDpLbnnPbrbe0Y7CH8S5VLUkaZ8Ymz49mG0r7nI0icd?=
 =?us-ascii?Q?Bvsj3wqr7gbDUnavvWiZS9Fi/7lQ4JvLs2xggx/Kq3hUzjSHPS2zXQkmqp0S?=
 =?us-ascii?Q?doP+7rw9rtdB05vugGaiwjXD9rLU0I2rNGULkmc+ahc4AVjTTpSDf99Ub69g?=
 =?us-ascii?Q?USTWyhQztZ+Vq5pxrzBvQuev6SKmC9Q5kb6FlIoWQCGA8Oiht5pHgUA2fKat?=
 =?us-ascii?Q?/Jg6XYq6TmsDWjo2XqG5y3coNblY43YT0Cje7pAZYhwjUfeitX0qOwIzvlAo?=
 =?us-ascii?Q?1p35OfT/H3LQ93/0043pscA2VLQr+FJvPz28z0/7GjQKOXkIrsLk4e5O/7QO?=
 =?us-ascii?Q?TrzOvZDEg6VXB3DhiUm79JjEsCbeZo0dAoP3Kb7bz4mA49fjqT4Ww5Hodosf?=
 =?us-ascii?Q?5JMtLa5lR++gm+2Ka1dPOI5rzYdRy038V5Ahj/PWPOkVP5/M7ku7DDrogjVM?=
 =?us-ascii?Q?Xd/Y4uX1yniaP3EC5YomblydT/YITWORDxhXT3PdErfoAmUeRICb5XbZvUdb?=
 =?us-ascii?Q?0cTwN28dRRXPkQ48aUj/I4FwNBXE0AnbQnK04lTmJ7tuMSKQm0qnReVXbB2N?=
 =?us-ascii?Q?J7yIuhLrdbJaarGMET7wwjExA0+2B+8rnUCOM7Y3FpEnWP6tfasqHgB5xMYl?=
 =?us-ascii?Q?RE8T7+XjmslBC93c8azzIVTvIW/sDRWsOXEAzSWc4QzaawjG/tcRqwCGw82z?=
 =?us-ascii?Q?4BcB1YE8tx83B0EYmvTG+lDzItIXFnEK8iswNmOiPULZEG5+DYsmEaWW/Yz+?=
 =?us-ascii?Q?fXNKYoGptfui0BvbfKaIjqTXug7Iiu27P2BwOR4ChXlyOtqm4ZdHehIGQgfw?=
 =?us-ascii?Q?SypEJL4NErM3SkRps9AhfyBC61A4Grm6QZUhAmdAECFE7s5XtptzsRu6VAK8?=
 =?us-ascii?Q?fSo6cT9DPXUz8gW2eBwZPlzUBSTYSP3/qjltiFSqnyabLRT5y3T5p1ftB80o?=
 =?us-ascii?Q?NX0Z7lICmeb33oFwDjyinQ4fOcSpB8lyfmEAqrYNzhRVexs0XUzv3myzS/sF?=
 =?us-ascii?Q?qIrQzmhYduM8N40cYdxKNlpt8i2H4+7hpMfRmTSlQReunplrnb1AMwpxhpme?=
 =?us-ascii?Q?DFCzLLeNSgFvo+o3cFZv/Vtke4TUfY+Ib+R1ptg7kBE2mkFAqXY8zy15hL98?=
 =?us-ascii?Q?dY3v2qG6o/I0uO406P0F2M8Afj/sQkDfIDWhv8p8oHat3j2cPTHFEoSwPEDB?=
 =?us-ascii?Q?Vbj1GYyEvI6ojALYaJsz73gBpVjl20o90mz7GOGVl0vTT5Ej72G4Kc4qNF70?=
 =?us-ascii?Q?ewjXlSt1JxFta9kLhK/6LlcEvwII5fjKIMlP+hLj6KpQgrt9lSyCZMfUCju5?=
 =?us-ascii?Q?BQbQGvTkDd2UcsjjS8z50cIPXr7d/w06voCw1r53NmYSyVXHHB+uq/ErY4LE?=
 =?us-ascii?Q?U2NPvJ+XexhlK0IZIviM5MV+h7VIlaGLLJ86lEuQlcF4K/oR3t55ODZ7mMgv?=
 =?us-ascii?Q?EYsoAw40GFX71g2T9+/aSPkSLicrwTnjQS4fHdt84EYIHrhRF3s0SvfiBBBN?=
 =?us-ascii?Q?kCbAhw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822CBF706C2C5BD9DFC877684DBAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a3b41c-a2d9-4fd0-b783-08dbd14a0c61
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 08:53:36.8390
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zoqrsNgo+JizAd/pRfGEa/YkUMTmVFQNAKWA01p9GNRmxHKkX5vYqdTswEAHuELKCmXTTY18lMcANGRSF2gGrzeItq531Nc9M3tiXWoaWxvajMBXPMSXMmtshE1lbvtY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
X-Proofpoint-GUID: rWDMmQFoHZMdLqXTlOB58anu8bNEafEO
X-Proofpoint-ORIG-GUID: rWDMmQFoHZMdLqXTlOB58anu8bNEafEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310200074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 08:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105618

--_000_MW4PR11MB5822CBF706C2C5BD9DFC877684DBAMW4PR11MB5822namp_
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
Subject: [oe][meta-networking][kirkstone][PATCH V2 3/3] samba:fix CVE-2023-=
34967

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-34967_0001.patch     | 178 ++++++++++++++++++
 .../samba/samba/CVE-2023-34967_0002.patch     | 125 ++++++++++++
 .../samba/samba_4.14.14.bb                    |   2 +
 3 files changed, 305 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34967_0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34967_0002.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
7_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
967_0001.patch
new file mode 100644
index 000000000..e30e54ab9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.=
patch
@@ -0,0 +1,178 @@
+From 3b3c30e2acfb00d04c4013e32343bc277d5b1aa8 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Wed, 31 May 2023 16:26:14 +0200
+Subject: [PATCH] CVE-2023-34967: CI: add a test for type checking of
+ dalloc_value_for_key()
+
+Sends a maliciously crafted packet where the value in a key/value style
+dictionary for the "scope" key is a simple string object whereas the serve=
r
+expects an array. As the server doesn't perform type validation on the val=
ue, it
+crashes when trying to use the "simple" object as a "complex" one.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15341
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/3b3c=
30e2acfb00d04c4013e32343bc277d5b1aa8]
+
+CVE: CVE-2023-34967
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source4/torture/rpc/mdssvc.c | 134 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 134 insertions(+)
+
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c
+index f5f5939..1dce403 100644
+--- a/source4/torture/rpc/mdssvc.c
++++ b/source4/torture/rpc/mdssvc.c
+@@ -666,6 +666,136 @@ done:
+       return ok;
+ }
+
++static bool test_sl_dict_type_safety(struct torture_context *tctx,
++                                   void *data)
++{
++      struct torture_mdsscv_state *state =3D talloc_get_type_abort(
++              data, struct torture_mdsscv_state);
++      struct dcerpc_binding_handle *b =3D state->p->binding_handle;
++      struct mdssvc_blob request_blob;
++      struct mdssvc_blob response_blob;
++      uint64_t ctx1 =3D 0xdeadbeef;
++      uint64_t ctx2 =3D 0xcafebabe;
++      uint32_t device_id;
++      uint32_t unkn2;
++      uint32_t unkn9;
++      uint32_t fragment;
++      uint32_t flags;
++      DALLOC_CTX *d =3D NULL;
++      sl_array_t *array1 =3D NULL, *array2 =3D NULL;
++      sl_dict_t *arg =3D NULL;
++      int result;
++      NTSTATUS status;
++      bool ok =3D true;
++
++      device_id =3D UINT32_C(0x2f000045);
++      unkn2 =3D 23;
++      unkn9 =3D 0;
++      fragment =3D 0;
++      flags =3D UINT32_C(0x6b000001);
++
++      d =3D dalloc_new(tctx);
++      torture_assert_not_null_goto(tctx, d,
++                                   ok, done, "dalloc_new failed\n");
++
++      array1 =3D dalloc_zero(d, sl_array_t);
++      torture_assert_not_null_goto(tctx, array1,
++                                   ok, done, "dalloc_zero failed\n");
++
++      array2 =3D dalloc_zero(d, sl_array_t);
++      torture_assert_not_null_goto(tctx, array2,
++                                   ok, done, "dalloc_new failed\n");
++
++      result =3D dalloc_stradd(array2, "openQueryWithParams:forContext:")=
;
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_stradd failed\n");
++
++      result =3D dalloc_add_copy(array2, &ctx1, uint64_t);
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_stradd failed\n");
++
++      result =3D dalloc_add_copy(array2, &ctx2, uint64_t);
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_stradd failed\n");
++
++      arg =3D dalloc_zero(array1, sl_dict_t);
++      torture_assert_not_null_goto(tctx, d,
++                                   ok, done, "dalloc_zero failed\n");
++
++      result =3D dalloc_stradd(arg, "kMDQueryString");
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_stradd failed\n");
++
++      result =3D dalloc_stradd(arg, "*");
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_stradd failed\n");
++
++      result =3D dalloc_stradd(arg, "kMDScopeArray");
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_stradd failed\n");
++
++      result =3D dalloc_stradd(arg, "AAAABBBB");
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_stradd failed\n");
++
++      result =3D dalloc_add(array1, array2, sl_array_t);
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_add failed\n");
++
++      result =3D dalloc_add(array1, arg, sl_dict_t);
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_add failed\n");
++
++      result =3D dalloc_add(d, array1, sl_array_t);
++      torture_assert_goto(tctx, result =3D=3D 0,
++                          ok, done, "dalloc_add failed\n");
++
++      torture_comment(tctx, "%s", dalloc_dump(d, 0));
++
++      request_blob.spotlight_blob =3D talloc_array(tctx,
++                                                 uint8_t,
++                                                 64 * 1024);
++      torture_assert_not_null_goto(tctx, request_blob.spotlight_blob,
++                                   ok, done, "dalloc_new failed\n");
++      request_blob.size =3D 64 * 1024;
++
++      request_blob.length =3D sl_pack(d,
++                                    (char *)request_blob.spotlight_blob,
++                                    request_blob.size);
++      torture_assert_goto(tctx, request_blob.length > 0,
++                          ok, done, "sl_pack failed\n");
++
++      response_blob.spotlight_blob =3D talloc_array(state, uint8_t, 0);
++      torture_assert_not_null_goto(tctx, response_blob.spotlight_blob,
++                                   ok, done, "dalloc_zero failed\n");
++      response_blob.size =3D 0;
++
++      status =3D dcerpc_mdssvc_cmd(b,
++                                 state,
++                                 &state->ph,
++                                 0,
++                                 device_id,
++                                 unkn2,
++                                 0,
++                                 flags,
++                                 request_blob,
++                                 0,
++                                 64 * 1024,
++                                 1,
++                                 64 * 1024,
++                                 0,
++                                 0,
++                                 &fragment,
++                                 &response_blob,
++                                 &unkn9);
++      torture_assert_ntstatus_ok_goto(
++              tctx, status, ok, done,
++              "dcerpc_mdssvc_cmd failed\n");
++
++done:
++      return ok;
++}
++
+ static bool test_mdssvc_invalid_ph_close(struct torture_context *tctx,
+                                        void *data)
+ {
+@@ -940,6 +1070,10 @@ struct torture_suite *torture_rpc_mdssvc(TALLOC_CTX =
*mem_ctx)
+       torture_tcase_add_simple_test(tcase,
+                                     "mdssvc_sl_unpack_loop",
+                                     test_mdssvc_sl_unpack_loop);
++      torture_tcase_add_simple_test(tcase,
++                                    "sl_dict_type_safety",
++                                    test_sl_dict_type_safety);
++
+
+       return suite;
+ }
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
7_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
967_0002.patch
new file mode 100644
index 000000000..2e4907ab6
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.=
patch
@@ -0,0 +1,125 @@
+From 049c13245649fab412b61a5b55e5a7dea72d7c72 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Fri, 26 May 2023 15:06:38 +0200
+Subject: [PATCH] CVE-2023-34967: mdssvc: add type checking to
+ dalloc_value_for_key()
+
+Change the dalloc_value_for_key() function to require an additional final
+argument which denotes the expected type of the value associated with a ke=
y. If
+the types don't match, return NULL.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15341
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/4c60=
e35add4a1abd04334012a8d6edf1c3f396ba]
+
+CVE: CVE-2023-34967
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/dalloc.c | 14 ++++++++++----
+ source3/rpc_server/mdssvc/mdssvc.c | 17 +++++++++++++----
+ 2 files changed, 23 insertions(+), 8 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/dalloc.c b/source3/rpc_server/mdssv=
c/dalloc.c
+index 007702d..8b79b41 100644
+--- a/source3/rpc_server/mdssvc/dalloc.c
++++ b/source3/rpc_server/mdssvc/dalloc.c
+@@ -159,7 +159,7 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)
+       int result =3D 0;
+       void *p =3D NULL;
+       va_list args;
+-      const char *type;
++      const char *type =3D NULL;
+       int elem;
+       size_t array_len;
+
+@@ -170,7 +170,6 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)
+               array_len =3D talloc_array_length(d->dd_talloc_array);
+               elem =3D va_arg(args, int);
+               if (elem >=3D array_len) {
+-                      va_end(args);
+                       result =3D -1;
+                       goto done;
+               }
+@@ -178,8 +177,6 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)
+               type =3D va_arg(args, const char *);
+       }
+
+-      va_end(args);
+-
+       array_len =3D talloc_array_length(d->dd_talloc_array);
+
+       for (elem =3D 0; elem + 1 < array_len; elem +=3D 2) {
+@@ -192,8 +189,17 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)
+                       break;
+               }
+       }
++      if (p =3D=3D NULL) {
++              goto done;
++      }
++
++      type =3D va_arg(args, const char *);
++      if (strcmp(talloc_get_name(p), type) !=3D 0) {
++              p =3D NULL;
++      }
+
+ done:
++      va_end(args);
+       if (result !=3D 0) {
+               p =3D NULL;
+       }
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c
+index a983a88..fe6e0c2 100644
+--- a/source3/rpc_server/mdssvc/mdssvc.c
++++ b/source3/rpc_server/mdssvc/mdssvc.c
+@@ -884,7 +884,8 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+
+       querystring =3D dalloc_value_for_key(query, "DALLOC_CTX", 0,
+                                          "DALLOC_CTX", 1,
+-                                         "kMDQueryString");
++                                         "kMDQueryString",
++                                         "char *");
+       if (querystring =3D=3D NULL) {
+               DEBUG(1, ("missing kMDQueryString\n"));
+               goto error;
+@@ -924,8 +925,11 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+       slq->ctx2 =3D *uint64p;
+
+       path_scope =3D dalloc_value_for_key(query, "DALLOC_CTX", 0,
+-                                        "DALLOC_CTX", 1, "kMDScopeArray")=
;
++                                          "DALLOC_CTX", 1,
++                                        "kMDScopeArray",
++                                        "sl_array_t");
+       if (path_scope =3D=3D NULL) {
++              DBG_ERR("missing kMDScopeArray\n");
+               goto error;
+       }
+
+@@ -940,8 +944,11 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+       }
+
+       reqinfo =3D dalloc_value_for_key(query, "DALLOC_CTX", 0,
+-                                     "DALLOC_CTX", 1, "kMDAttributeArray"=
);
++                                     "DALLOC_CTX", 1,
++                                     "kMDAttributeArray",
++                                     "sl_array_t");
+       if (reqinfo =3D=3D NULL) {
++              DBG_ERR("missing kMDAttributeArray\n");
+               goto error;
+       }
+
+@@ -949,7 +956,9 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,
+       DEBUG(10, ("requested attributes: %s", dalloc_dump(reqinfo, 0)));
+
+       cnids =3D dalloc_value_for_key(query, "DALLOC_CTX", 0,
+-                                   "DALLOC_CTX", 1, "kMDQueryItemArray");
++                                   "DALLOC_CTX", 1,
++                                   "kMDQueryItemArray",
++                                   "sl_array_t");
+       if (cnids) {
+               ok =3D sort_cnids(slq, cnids->ca_cnids);
+               if (!ok) {
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index b71c4b3fc..73e8a82e8 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -36,6 +36,8 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2023-34966_0001.patch \
            file://CVE-2023-34966_0002.patch \
            file://CVE-2022-2127.patch \
+           file://CVE-2023-34967_0001.patch \
+           file://CVE-2023-34967_0002.patch \
            "

 SRC_URI:append:libc-musl =3D " \
--
2.40.0


--_000_MW4PR11MB5822CBF706C2C5BD9DFC877684DBAMW4PR11MB5822namp_
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
<b>Subject:</b> [oe][meta-networking][kirkstone][PATCH V2 3/3] samba:fix CV=
E-2023-34967</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Archana Polampalli &lt;archana.pola=
mpalli@windriver.com&gt;<br>
---<br>
&nbsp;.../samba/samba/CVE-2023-34967_0001.patch&nbsp;&nbsp;&nbsp;&nbsp; | 1=
78 ++++++++++++++++++<br>
&nbsp;.../samba/samba/CVE-2023-34967_0002.patch&nbsp;&nbsp;&nbsp;&nbsp; | 1=
25 ++++++++++++<br>
&nbsp;.../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 +<br>
&nbsp;3 files changed, 305 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34967_0001.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34967_0002.patch<br>
<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
7_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
967_0001.patch<br>
new file mode 100644<br>
index 000000000..e30e54ab9<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0001.=
patch<br>
@@ -0,0 +1,178 @@<br>
+From 3b3c30e2acfb00d04c4013e32343bc277d5b1aa8 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Wed, 31 May 2023 16:26:14 +0200<br>
+Subject: [PATCH] CVE-2023-34967: CI: add a test for type checking of<br>
+ dalloc_value_for_key()<br>
+<br>
+Sends a maliciously crafted packet where the value in a key/value style<br=
>
+dictionary for the &quot;scope&quot; key is a simple string object whereas=
 the server<br>
+expects an array. As the server doesn't perform type validation on the val=
ue, it<br>
+crashes when trying to use the &quot;simple&quot; object as a &quot;comple=
x&quot; one.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15341">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15341</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/3b3c30e2acfb00d04c4013e32343bc277d5b1aa8">https://github.com/samba-t=
eam/samba/commit/3b3c30e2acfb00d04c4013e32343bc277d5b1aa8</a>]<br>
+<br>
+CVE: CVE-2023-34967<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source4/torture/rpc/mdssvc.c | 134 +++++++++++++++++++++++++++++++++++<br=
>
+ 1 file changed, 134 insertions(+)<br>
+<br>
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c<b=
r>
+index f5f5939..1dce403 100644<br>
+--- a/source4/torture/rpc/mdssvc.c<br>
++++ b/source4/torture/rpc/mdssvc.c<br>
+@@ -666,6 +666,136 @@ done:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ok;<br>
+ }<br>
+<br>
++static bool test_sl_dict_type_safety(struct torture_context *tctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *data)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct torture_mdsscv_state *state =3D tal=
loc_get_type_abort(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; data, struct torture_mdsscv_state);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dcerpc_binding_handle *b =3D state-=
&gt;p-&gt;binding_handle;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob request_blob;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob response_blob;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t ctx1 =3D 0xdeadbeef;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t ctx2 =3D 0xcafebabe;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t device_id;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t unkn2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t unkn9;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t fragment;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DALLOC_CTX *d =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_array_t *array1 =3D NULL, *array2 =3D N=
ULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_dict_t *arg =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int result;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok =3D true;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_id =3D UINT32_C(0x2f000045);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unkn2 =3D 23;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unkn9 =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fragment =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags =3D UINT32_C(0x6b000001);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D dalloc_new(tctx);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, d,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_new failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; array1 =3D dalloc_zero(d, sl_array_t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, array1,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_zero failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; array2 =3D dalloc_zero(d, sl_array_t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, array2,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_new failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_stradd(array2, &quot;ope=
nQueryWithParams:forContext:&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_stradd failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_add_copy(array2, &amp;ct=
x1, uint64_t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_stradd failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_add_copy(array2, &amp;ct=
x2, uint64_t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_stradd failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; arg =3D dalloc_zero(array1, sl_dict_t);<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, d,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_zero failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_stradd(arg, &quot;kMDQue=
ryString&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_stradd failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_stradd(arg, &quot;*&quot=
;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_stradd failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_stradd(arg, &quot;kMDSco=
peArray&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_stradd failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_stradd(arg, &quot;AAAABB=
BB&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_stradd failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_add(array1, array2, sl_a=
rray_t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_add failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_add(array1, arg, sl_dict=
_t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_add failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D dalloc_add(d, array1, sl_array_=
t);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, result =3D=3D 0,=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;dalloc_add failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_comment(tctx, &quot;%s&quot;, dall=
oc_dump(d, 0));<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.spotlight_blob =3D talloc_arr=
ay(tctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint8_t,<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64 * 1024=
);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, request=
_blob.spotlight_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_new failed\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D 64 * 1024;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.length =3D sl_pack(d,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (char *)requ=
est_blob.spotlight_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob=
.size);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, request_blob.len=
gth &gt; 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ok, done, &quot;sl_pack failed\n&quot;);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.spotlight_blob =3D talloc_ar=
ray(state, uint8_t, 0);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_not_null_goto(tctx, respons=
e_blob.spotlight_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok, done, &quot;da=
lloc_zero failed\n&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.size =3D 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D dcerpc_mdssvc_cmd(b,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;state-&gt;ph,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_id,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unkn2,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64 * 1024,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64 * 1024,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;fragment,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;response_blob,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;unkn9);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; tctx, status, ok, done,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; &quot;dcerpc_mdssvc_cmd failed\n&quot;);<br>
++<br>
++done:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ok;<br>
++}<br>
++<br>
+ static bool test_mdssvc_invalid_ph_close(struct torture_context *tctx,<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; void *data)<br>
+ {<br>
+@@ -940,6 +1070,10 @@ struct torture_suite *torture_rpc_mdssvc(TALLOC_CTX =
*mem_ctx)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_tcase_add_simple_test(tcase,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;m=
dssvc_sl_unpack_loop&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_md=
ssvc_sl_unpack_loop);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_tcase_add_simple_test(tcase,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sl_dic=
t_type_safety&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_sl_dict=
_type_safety);<br>
++<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return suite;<br>
+ }<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
7_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
967_0002.patch<br>
new file mode 100644<br>
index 000000000..2e4907ab6<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34967_0002.=
patch<br>
@@ -0,0 +1,125 @@<br>
+From 049c13245649fab412b61a5b55e5a7dea72d7c72 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Fri, 26 May 2023 15:06:38 +0200<br>
+Subject: [PATCH] CVE-2023-34967: mdssvc: add type checking to<br>
+ dalloc_value_for_key()<br>
+<br>
+Change the dalloc_value_for_key() function to require an additional final<=
br>
+argument which denotes the expected type of the value associated with a ke=
y. If<br>
+the types don't match, return NULL.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15341">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15341</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/4c60e35add4a1abd04334012a8d6edf1c3f396ba">https://github.com/samba-t=
eam/samba/commit/4c60e35add4a1abd04334012a8d6edf1c3f396ba</a>]<br>
+<br>
+CVE: CVE-2023-34967<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpc_server/mdssvc/dalloc.c | 14 ++++++++++----<br>
+ source3/rpc_server/mdssvc/mdssvc.c | 17 +++++++++++++----<br>
+ 2 files changed, 23 insertions(+), 8 deletions(-)<br>
+<br>
+diff --git a/source3/rpc_server/mdssvc/dalloc.c b/source3/rpc_server/mdssv=
c/dalloc.c<br>
+index 007702d..8b79b41 100644<br>
+--- a/source3/rpc_server/mdssvc/dalloc.c<br>
++++ b/source3/rpc_server/mdssvc/dalloc.c<br>
+@@ -159,7 +159,7 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int result =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *p =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va_list args;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *type;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *type =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int elem;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t array_len;<br>
+<br>
+@@ -170,7 +170,6 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; array_len =3D talloc_array_length(d-&gt;dd_talloc_array);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; elem =3D va_arg(args, int);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (elem &gt;=3D array_len) {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va_end(args);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D -1;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto done;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+@@ -178,8 +177,6 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; type =3D va_arg(args, const char *);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va_end(args);<br>
+-<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; array_len =3D talloc_array_length(d-&=
gt;dd_talloc_array);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (elem =3D 0; elem + 1 &lt; array_=
len; elem +=3D 2) {<br>
+@@ -192,8 +189,17 @@ void *dalloc_value_for_key(const DALLOC_CTX *d, ...)<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (p =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; goto done;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type =3D va_arg(args, const char *);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (strcmp(talloc_get_name(p), type) !=3D =
0) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; p =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+ done:<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; va_end(args);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (result !=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; p =3D NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+diff --git a/source3/rpc_server/mdssvc/mdssvc.c b/source3/rpc_server/mdssv=
c/mdssvc.c<br>
+index a983a88..fe6e0c2 100644<br>
+--- a/source3/rpc_server/mdssvc/mdssvc.c<br>
++++ b/source3/rpc_server/mdssvc/mdssvc.c<br>
+@@ -884,7 +884,8 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,<=
br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; querystring =3D dalloc_value_for_key(=
query, &quot;DALLOC_CTX&quot;, 0,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; &quot;DALLOC_CTX&quot;, 1,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;kMDQueryString&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;kMDQueryString&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; &quot;char *&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (querystring =3D=3D NULL) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DEBUG(1, (&quot;missing kMDQueryString\n&quot;));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto error;<br>
+@@ -924,8 +925,11 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; slq-&gt;ctx2 =3D *uint64p;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; path_scope =3D dalloc_value_for_key(q=
uery, &quot;DALLOC_CTX&quot;, 0,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;DALLOC_CTX&quot;, 1, &quot;kMDScopeArray&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &quot;DALLOC_CTX&quot;, 1,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;kMDScopeArray&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; &quot;sl_array_t&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (path_scope =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;missing kMDScopeArray\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto error;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+@@ -940,8 +944,11 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reqinfo =3D dalloc_value_for_key(quer=
y, &quot;DALLOC_CTX&quot;, 0,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
DALLOC_CTX&quot;, 1, &quot;kMDAttributeArray&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
DALLOC_CTX&quot;, 1,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
kMDAttributeArray&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;=
sl_array_t&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (reqinfo =3D=3D NULL) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; DBG_ERR(&quot;missing kMDAttributeArray\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto error;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+@@ -949,7 +956,9 @@ static bool slrpc_open_query(struct mds_ctx *mds_ctx,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DEBUG(10, (&quot;requested attributes=
: %s&quot;, dalloc_dump(reqinfo, 0)));<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cnids =3D dalloc_value_for_key(query,=
 &quot;DALLOC_CTX&quot;, 0,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DALLOC_CTX&q=
uot;, 1, &quot;kMDQueryItemArray&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;DALLOC_CTX&q=
uot;, 1,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;kMDQueryItem=
Array&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sl_array_t&q=
uot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cnids) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; ok =3D sort_cnids(slq, cnids-&gt;ca_cnids);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (!ok) {<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
index b71c4b3fc..73e8a82e8 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
@@ -36,6 +36,8 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar.=
gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-34966_0001.patch">file://CVE-2023-34966_0001.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-34966_0002.patch">file://CVE-2023-34966_0002.patch</a> =
\<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-2127.patch">file://CVE-2022-2127.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34967_0001.patch">file://CVE-2023-34967_0001.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34967_0002.patch">file://CVE-2023-34967_0002.patch</a> \<br>
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

--_000_MW4PR11MB5822CBF706C2C5BD9DFC877684DBAMW4PR11MB5822namp_--

