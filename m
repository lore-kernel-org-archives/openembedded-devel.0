Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AADEC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 14:27:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11412.1679312026758684415
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 04:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cU0mWJWp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=24432b7103=manojsingh.saun@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32KBDv2T027150
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 11:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=A6uREsMRD7y3KdVM1zAipfC6gDHkS17Jq1fVPPZmAIY=;
 b=cU0mWJWpikPu+745jbsUc3U0KU7PZyr1AeTaTR20Cz4GQ5DbkZnKI+Y/4gWhN7tp1dR7
 Rki6dZj8w4cF0LZTHNQukJHX9Cjigr9SQv3u/zIXxf27dlbNDwAJpjDNFzXUefBKmyii
 zyMBafR9MKw9NahRyNK4YffbY6kxAPzWdaEYAxv8e6/ACjOpaTn+AcAqlWClwUFcKXbF
 tApdh0gE3lur4WrOgQWd4iUuWG4pArgsjU/fjZ7qvC67Z8I5HmTCe/HGxmfdbxRFoEV8
 1JbquMMGDsRSssipatloDpGTpsYmB1SK6XR3Vai3sK5YKszsDI8j4cFlaN70MfEP1RYS RA== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2043.outbound.protection.outlook.com [104.47.57.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pd49asryk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 11:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/ISi4kxWnXJ+PD7wECPqf906hTzFsZrtF3ac/UtXPHSc3fYcQrE1tHgcQNUralXZojkvMB8I+Q0V5CWxNYdQGKwLKnZU0n2FyVudRO+1nyr2pgdhzXcqa49EjGSqIGP8fCuCcYrMPpdmBEwKtnjpFnCKM+xl/UJGU5LS40byAfjHWaP87yXh3rN3G4e+GdphKxNErhcB7Okh27QlFFvBZ36pADtPQEwpxWqW9026ezCXa/d6xeROEA85bcEmaR1rozg5mldM4c3yqpcOlwoIXcTa7tejeZJ3rGLOehFzKU/PsPy+ZgtdVVU5EElkgCXxprzQ9Vq9vd6eRz0rIdpZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A6uREsMRD7y3KdVM1zAipfC6gDHkS17Jq1fVPPZmAIY=;
 b=M0E0KtR3aoUlfN7Mlkmx19FgsXMCid+41RdkkHLqwB9p3yLUAr3HysL03PMWD7EZntGBf2LLfWTMiQ4VFTaqez1OXGzv+8aic7D9+mBhjB25bjePT94wCPmFvM5nQG8chLefccn9jUXu8Im1dDHFIc3U1iQrlytHF8xhrL8tfJxDuVOn7Wzw7q7VdOEIamo5dnMNYzLDRRAWXJjBv8Rxu+Aj4wpjhckhvjSWQKNh+GK5XvUlDxb0NlJOrLomIMqn2t5zkSNQPV8J3pnb6RuKmyAL87yuQjKUQZ+o71eBWxBxpAyA0eIL8JXIIeEz1pOGUvGGJTQceZN177dfhDrcTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BN6PR11MB1924.namprd11.prod.outlook.com (2603:10b6:404:105::9)
 by BL1PR11MB5479.namprd11.prod.outlook.com (2603:10b6:208:317::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 11:33:41 +0000
Received: from BN6PR11MB1924.namprd11.prod.outlook.com
 ([fe80::2e88:b038:f38e:40ea]) by BN6PR11MB1924.namprd11.prod.outlook.com
 ([fe80::2e88:b038:f38e:40ea%7]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 11:33:37 +0000
From: "Manoj Saun" <manojsingh.saun@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Mali, Narpat" <Narpat.Mali@windriver.com>,
        "G Pillai, Hari"
	<Hari.GPillai@windriver.com>,
        "Kang, Kai" <Kai.Kang@windriver.com>
Subject: Re: [oe][meta-webserver][PATCH 1/1] nginx: fix-CVE-2022-41741, CVE-2022-41742
Thread-Topic: [oe][meta-webserver][PATCH 1/1] nginx: fix-CVE-2022-41741,
 CVE-2022-41742
Thread-Index: AQHZTPJOEJXNeFlKiEq74zP1hjYR3K8DpaQD
Date: Mon, 20 Mar 2023 11:33:36 +0000
Message-ID: 
 <BN6PR11MB1924DF0751010B40365B5BEFE0809@BN6PR11MB1924.namprd11.prod.outlook.com>
References: <20230302103226.1888266-1-manojsingh.saun@windriver.com>
In-Reply-To: <20230302103226.1888266-1-manojsingh.saun@windriver.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1924:EE_|BL1PR11MB5479:EE_
x-ms-office365-filtering-correlation-id: eb83b72a-a94c-46c5-9d54-08db2936f217
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 L+YjYjHs+22CRIkvYNQHUCVuvP03uHqLdsPxiZ4QA0KqXCuA+18EhCJc1CYm3SHDj2y53IYuDjiNTMUpPJBCzyR4sibK9QlyzOm+Jdldzm5redIU5TeV4/j/lMXjkN0HjgXY70oOK4n5pnriOn4/Yw4To/6y0SLX9gYfkiIF60A+TIqlb5TF0MXgIQEhSvq5I4zj17FNj6Mwm/P0eQKUzGFcyxWasYcgE2qF96858Vqik6UZLxtxv/9ZdVZWaDxo8T8UxtckCqbtO/4xvV55Cz3viYUp050MHnS4ge6A7wShCPBzYL0DIGsohewsmyqfbV0QDGJDxA7w8rExY8D/DivgeWQdxMCGxwNdq4pbe9laP6kfa7LCle+YU0ycuX37SWlNddtAHIvYADcJ2IMXVa4UFbSeXPRUOJX3QXMsXyIK9XPy3GqZm3ZWALWFopFrWLrMlTJneQdfe6Je5IANYKwRrVtMx9EXsvITIWplS2xObbGW/WB8OYR97oSgV8j5N2bIItcE9nEQ77X15INoomtw0UcB5cjpaoc3shuCmjTTA37tX6tI5+f5rmNzRmElciEa0pp2s72VLJueWXoiNKQTrSFdesHK3B+hrye8Mta4Q0mQ9w7r9CaU7/VWy9QnijClVMc6yH6wxVOvldPe4M0YnTTKC9+6Uo2w+06sv2QXF/XsqmKGfVpAcVGrHVpbthh5JvRJAd8gPG25ViHKmyKwr4iUJ9cOs1QPx+Zc0BdCjMPOezf4ib3qT8m2rRNF
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1924.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(39850400004)(366004)(346002)(376002)(136003)(451199018)(33656002)(26005)(53546011)(6506007)(9686003)(107886003)(19627405001)(966005)(316002)(83380400001)(6916009)(4326008)(64756008)(8676002)(66446008)(7696005)(186003)(66556008)(54906003)(478600001)(66946007)(66476007)(91956017)(8936002)(52536014)(5660300002)(30864003)(2906002)(41300700001)(122000001)(166002)(76116006)(38070700005)(71200400001)(38100700002)(18265965005)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LTamn4stfXLoWkWXwxE/ZjRKNDRruXSHFjFBZGtTqk3jKGvYWontjAdTzeBq?=
 =?us-ascii?Q?nlb1RA/P9SDuZ27y1JChzhVmjTbp/ZPP49DjP0CBE2auwZQRv88kUy9Fr7MZ?=
 =?us-ascii?Q?mpKhY7pMlKCTolqgfbclk/hWI3VwUO/9DOwxKopo+Pciek3YxbAA9rdxj9Xq?=
 =?us-ascii?Q?LUptV7MteYYgKwF2lgxEG5OPZStMxNJ50rbGqUGs5dNJjTv+F15YVUAnL6vA?=
 =?us-ascii?Q?SBWVV9e0uGwePxhipmHCWQEBI1cY8Bdb6Qt1ZDnAT17ig+2CjFnat+bo08nu?=
 =?us-ascii?Q?y9c5uoybbS9UgSIXT/glz4LLDCltVjsqg0dp54NI+fT/BYyd+s9outoQKW2N?=
 =?us-ascii?Q?pH/n73zAcHG+wwgg/9iTNpNcWh3oOVY7Gm43a3fd4SLo5DgSQ4+SAauLmN7Y?=
 =?us-ascii?Q?wvm/evyPtZxBj3vBzuKv9WD2RQUXAZg8c1cJHd1cMc+/2oLzgjXr0bplXwJP?=
 =?us-ascii?Q?VRtAyt/k4N4Pd2w8Bw9QLVTru3IIbGr911tfQ1VukaJ7WACkdmq5GcOOd7O7?=
 =?us-ascii?Q?IJALGeQkA3jvKHJuuxMh9gZCjgCbLMsNGXcbQxekRHMj0STFF1p7EUKVVuIk?=
 =?us-ascii?Q?sj8w/XLuG5hM/ulcULjnmD/3gK+IEtj/lZiSNbYKUSgmKz7mLnXLLmIA7MvK?=
 =?us-ascii?Q?AtMJKN9xFlx+B/aunxlwIaLoCaf2azs2CfoXILMnFUn6PXES0wJnckQXO3jz?=
 =?us-ascii?Q?qaGlzGJa3wKCBtrzwlubEA8RB2Kup/3M3zWuSr+q7HEZSnJmP2AnPCy+yOMc?=
 =?us-ascii?Q?VZb6+y9iK00F+BVBHCDzCJC+DxndX0CESOOs55uFSoIdxwebL0QQNlOew4PF?=
 =?us-ascii?Q?gBM5a5/7Ccaj4LLlShTkdva8VwyHABJ3SIevjb1zKrDV9jgfff7oRxhhGhmj?=
 =?us-ascii?Q?WIoDfF0yAM8FuEnc40Sn7fHneZ5Wc93lNvmsuEVyPvEVT3kWjRMOohuEdY59?=
 =?us-ascii?Q?l501nIbp7pn0heUJef2neCiTqoreHc8Pnthqxk11Yu+ATkbQEEIdrzLQzvi4?=
 =?us-ascii?Q?Em2YWJK2gUcTQj+La+x3k9+SyxJCgdOivIfl1woRhaRouR4CVq5vDu6HJZne?=
 =?us-ascii?Q?uOZdxkuw5PLaloSm1Yx7HNVJlu+xeCQSbAkaCja5yzjn0qO6d12AQIXmwQGu?=
 =?us-ascii?Q?nx6BbkSwUG3J13n+7QuujHXJcLfiia5+KgttqKljuhdLCjffQLvuTARu2BuB?=
 =?us-ascii?Q?DmMNBMB0DKoXhkZz8vS5F+rtv3qTKjXOvR1WtzYund2Ou6k3rCyLq/30+fn/?=
 =?us-ascii?Q?pmwguAVs8F2EfBiFpBweSjOA1JXGMaaNXZqo4UOrUeVNbqNBsex1inhe51NE?=
 =?us-ascii?Q?g7Gybp/HjQ5S0ddrTpm7dEptn+rM99SasKn/tIgtfWVTNwtU9LamkBz/K7BP?=
 =?us-ascii?Q?8wTMd34g+91eL7ljSOePx3aPxL3QASgaT3QLsHJ3L5yidDNvJF2OKXhL2wmV?=
 =?us-ascii?Q?xg4GN/A8yIr7Z/PMNJq0qRe2WRptUOynvUkI5GKjl81Lju5zrNQxEx8Z4Ghx?=
 =?us-ascii?Q?BTdrzfVt0yJpf+hqhvbNbH2qBAeZ3k5lRH7GKKRtUixVfGegPYOoiIxNHdt+?=
 =?us-ascii?Q?GCcNVmZZyTcLHszGQNznZhhR8ViiKHa5n3mmEv6H/EAxqO2qMfAug9oMFNSx?=
 =?us-ascii?Q?aA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1924.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb83b72a-a94c-46c5-9d54-08db2936f217
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2023 11:33:36.9351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMEy3n9Cbh4fw29yqGJ9aD2h4h5x7mPHBhKE7cxR8UM33IGcyGQy9h9OEvqQAgrEO5K8GBusOF/Urut2QdGjaEZSzjniMl5eGeS9cI4Y8Os=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5479
X-Proofpoint-ORIG-GUID: vyYtW7ErvVya7kDqV4DTilmAFzxVdRhF
X-Proofpoint-GUID: vyYtW7ErvVya7kDqV4DTilmAFzxVdRhF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_08,2023-03-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200098
Content-Language: en-GB
Content-Type: multipart/alternative;
	boundary="_000_BN6PR11MB1924DF0751010B40365B5BEFE0809BN6PR11MB1924namp_"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 14:27:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101606

--_000_BN6PR11MB1924DF0751010B40365B5BEFE0809BN6PR11MB1924namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

A gentle reminder.

Thanks
Manoj Saun
________________________________
From: Manoj Saun <manojsingh.saun@windriver.com>
Sent: 02 March 2023 16:02
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: Mali, Narpat <Narpat.Mali@windriver.com>; G Pillai, Hari <Hari.GPillai@=
windriver.com>; Kang, Kai <Kai.Kang@windriver.com>; Saun, Manoj Singh <Mano=
jSingh.Saun@windriver.com>
Subject: [oe][meta-webserver][PATCH 1/1] nginx: fix-CVE-2022-41741, CVE-202=
2-41742

nginx: Memory corruption in the ngx_http_mp4_module

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41741
https://nvd.nist.gov/vuln/detail/CVE-2022-41742

Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
---
 .../files/CVE-2022-41741-CVE-2022-41742.patch | 319 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.20.1.bb       |   4 +-
 2 files changed, 322 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741=
-CVE-2022-41742.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-20=
22-41742.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CV=
E-2022-41742.patch
new file mode 100644
index 000000000..d151256b3
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-4174=
2.patch
@@ -0,0 +1,319 @@
+From 91a3b5302d6a2467df70d3b43450991a53f9946b Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Wed, 16 Nov 2022 11:24:25 +0530
+Subject: [PATCH] CVE-2022-41741, CVE-2022-41742
+
+Mp4: disabled duplicate atoms.
+
+Most atoms should not appear more than once in a container.  Previously,
+this was not enforced by the module, which could result in worker process
+crash, memory corruption and disclosure.
+
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/6b022a555=
6af22b6e18532e547a6ae46b0d8c6ea]
+
+CVE: CVE-2022-41741 CVE-2022-41742
+
+Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
+---
+ src/http/modules/ngx_http_mp4_module.c | 147 +++++++++++++++++++++++++
+ 1 file changed, 147 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx=
_http_mp4_module.c
+index 0e93fbd..4f4d89d 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -1070,6 +1070,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+         return NGX_ERROR;
+     }
+
++    if (mp4->ftyp_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 ftyp atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     atom_size =3D sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size=
;
+
+     ftyp_atom =3D ngx_palloc(mp4->request->pool, atom_size);
+@@ -1128,6 +1134,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+         return NGX_DECLINED;
+     }
+
++    if (mp4->moov_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 moov atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     conf =3D ngx_http_get_module_loc_conf(mp4->request, ngx_http_mp4_modu=
le);
+
+     if (atom_data_size > mp4->buffer_size) {
+@@ -1195,6 +1207,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mdat atom")=
;
+
++    if (mp4->mdat_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdat atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     data =3D &mp4->mdat_data_buf;
+     data->file =3D &mp4->file;
+     data->in_file =3D 1;
+@@ -1321,6 +1339,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mvhd atom")=
;
+
++    if (mp4->mvhd_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mvhd atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     atom_header =3D ngx_mp4_atom_header(mp4);
+     mvhd_atom =3D (ngx_mp4_mvhd_atom_t *) atom_header;
+     mvhd64_atom =3D (ngx_mp4_mvhd64_atom_t *) atom_header;
+@@ -1586,6 +1610,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+     atom_size =3D sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size=
;
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_TKHD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 tkhd atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     trak->tkhd_size =3D atom_size;
+
+     ngx_mp4_set_32value(tkhd_atom->size, atom_size);
+@@ -1624,6 +1655,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     trak =3D ngx_mp4_last_trak(mp4);
+
++    if (trak->out[NGX_HTTP_MP4_MDIA_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdia atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     atom =3D &trak->mdia_atom_buf;
+     atom->temporary =3D 1;
+     atom->pos =3D atom_header;
+@@ -1747,6 +1784,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+     atom_size =3D sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size=
;
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_MDHD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdhd atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     trak->mdhd_size =3D atom_size;
+     trak->timescale =3D timescale;
+
+@@ -1789,6 +1833,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     trak =3D ngx_mp4_last_trak(mp4);
+
++    if (trak->out[NGX_HTTP_MP4_HDLR_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 hdlr atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     atom =3D &trak->hdlr_atom_buf;
+     atom->temporary =3D 1;
+     atom->pos =3D atom_header;
+@@ -1817,6 +1867,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     trak =3D ngx_mp4_last_trak(mp4);
+
++    if (trak->out[NGX_HTTP_MP4_MINF_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 minf atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     atom =3D &trak->minf_atom_buf;
+     atom->temporary =3D 1;
+     atom->pos =3D atom_header;
+@@ -1860,6 +1916,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     trak =3D ngx_mp4_last_trak(mp4);
+
++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom =3D &trak->vmhd_atom_buf;
+     atom->temporary =3D 1;
+     atom->pos =3D atom_header;
+@@ -1891,6 +1956,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     trak =3D ngx_mp4_last_trak(mp4);
+
++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom =3D &trak->smhd_atom_buf;
+     atom->temporary =3D 1;
+     atom->pos =3D atom_header;
+@@ -1922,6 +1996,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     trak =3D ngx_mp4_last_trak(mp4);
+
++    if (trak->out[NGX_HTTP_MP4_DINF_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 dinf atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     atom =3D &trak->dinf_atom_buf;
+     atom->temporary =3D 1;
+     atom->pos =3D atom_header;
+@@ -1950,6 +2030,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     trak =3D ngx_mp4_last_trak(mp4);
+
++    if (trak->out[NGX_HTTP_MP4_STBL_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stbl atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     atom =3D &trak->stbl_atom_buf;
+     atom->temporary =3D 1;
+     atom->pos =3D atom_header;
+@@ -2018,6 +2104,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+
+     trak =3D ngx_mp4_last_trak(mp4);
+
++    if (trak->out[NGX_HTTP_MP4_STSD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsd atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     atom =3D &trak->stsd_atom_buf;
+     atom->temporary =3D 1;
+     atom->pos =3D atom_header;
+@@ -2086,6 +2178,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+     atom_end =3D atom_table + entries * sizeof(ngx_mp4_stts_entry_t);
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STTS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stts atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     trak->time_to_sample_entries =3D entries;
+
+     atom =3D &trak->stts_atom_buf;
+@@ -2291,6 +2390,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+                    "sync sample entries:%uD", entries);
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stss atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     trak->sync_samples_entries =3D entries;
+
+     atom_table =3D atom_header + sizeof(ngx_http_mp4_stss_atom_t);
+@@ -2489,6 +2595,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+                    "composition offset entries:%uD", entries);
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_CTTS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 ctts atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     trak->composition_offset_entries =3D entries;
+
+     atom_table =3D atom_header + sizeof(ngx_mp4_ctts_atom_t);
+@@ -2692,6 +2805,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+     atom_end =3D atom_table + entries * sizeof(ngx_mp4_stsc_entry_t);
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSC_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsc atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     trak->sample_to_chunk_entries =3D entries;
+
+     atom =3D &trak->stsc_atom_buf;
+@@ -3024,6 +3144,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+                    "sample uniform size:%uD, entries:%uD", size, entries)=
;
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSZ_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsz atom in \"%s\"", mp4->file.name=
.data);
++        return NGX_ERROR;
++    }
++
+     trak->sample_sizes_entries =3D entries;
+
+     atom_table =3D atom_header + sizeof(ngx_mp4_stsz_atom_t);
+@@ -3207,6 +3334,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+     atom_end =3D atom_table + entries * sizeof(uint32_t);
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stco/co64 atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->chunks =3D entries;
+
+     atom =3D &trak->stco_atom_buf;
+@@ -3413,6 +3550,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)
+     atom_end =3D atom_table + entries * sizeof(uint64_t);
+
+     trak =3D ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stco/co64 atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->chunks =3D entries;
+
+     atom =3D &trak->co64_atom_buf;
+--
+2.25.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webs=
erver/recipes-httpd/nginx/nginx_1.20.1.bb
index d686c627f..e2d0443c6 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb
@@ -1,6 +1,8 @@
 require nginx.inc

-SRC_URI +=3D "file://CVE-2021-3618.patch"
+SRC_URI +=3D "file://CVE-2021-3618.patch \
+            file://CVE-2022-41741-CVE-2022-41742.patch \
+           "

 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D206629dc7c7b3e87acb31162363ae50=
5"

--
2.34.1


--_000_BN6PR11MB1924DF0751010B40365B5BEFE0809BN6PR11MB1924namp_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi All,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
A gentle reminder.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Manoj Saun</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Manoj Saun &lt;manojs=
ingh.saun@windriver.com&gt;<br>
<b>Sent:</b> 02 March 2023 16:02<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> Mali, Narpat &lt;Narpat.Mali@windriver.com&gt;; G Pillai, Hari &=
lt;Hari.GPillai@windriver.com&gt;; Kang, Kai &lt;Kai.Kang@windriver.com&gt;=
; Saun, Manoj Singh &lt;ManojSingh.Saun@windriver.com&gt;<br>
<b>Subject:</b> [oe][meta-webserver][PATCH 1/1] nginx: fix-CVE-2022-41741, =
CVE-2022-41742</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">nginx: Memory corruption in the ngx_http_mp4_modul=
e<br>
<br>
References: <br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-41741">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-41741</a><br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-41742">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-41742</a><br>
<br>
Signed-off-by: Manoj Saun &lt;manojsingh.saun@windriver.com&gt;<br>
---<br>
&nbsp;.../files/CVE-2022-41741-CVE-2022-41742.patch | 319 +++++++++++++++++=
+<br>
&nbsp;.../recipes-httpd/nginx/nginx_1.20.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 4 +-<br>
&nbsp;2 files changed, 322 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2022-=
41741-CVE-2022-41742.patch<br>
<br>
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-20=
22-41742.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CV=
E-2022-41742.patch<br>
new file mode 100644<br>
index 000000000..d151256b3<br>
--- /dev/null<br>
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2022-41741-CVE-2022-4174=
2.patch<br>
@@ -0,0 +1,319 @@<br>
+From 91a3b5302d6a2467df70d3b43450991a53f9946b Mon Sep 17 00:00:00 2001<br>
+From: Hitendra Prajapati &lt;hprajapati@mvista.com&gt;<br>
+Date: Wed, 16 Nov 2022 11:24:25 +0530<br>
+Subject: [PATCH] CVE-2022-41741, CVE-2022-41742<br>
+<br>
+Mp4: disabled duplicate atoms.<br>
+<br>
+Most atoms should not appear more than once in a container.&nbsp; Previous=
ly,<br>
+this was not enforced by the module, which could result in worker process<=
br>
+crash, memory corruption and disclosure.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/nginx/nginx/commi=
t/6b022a5556af22b6e18532e547a6ae46b0d8c6ea">https://github.com/nginx/nginx/=
commit/6b022a5556af22b6e18532e547a6ae46b0d8c6ea</a>]<br>
+<br>
+CVE: CVE-2022-41741 CVE-2022-41742<br>
+<br>
+Signed-off-by: Manoj Saun &lt;manojsingh.saun@windriver.com&gt;<br>
+---<br>
+ src/http/modules/ngx_http_mp4_module.c | 147 +++++++++++++++++++++++++<br=
>
+ 1 file changed, 147 insertions(+)<br>
+<br>
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx=
_http_mp4_module.c<br>
+index 0e93fbd..4f4d89d 100644<br>
+--- a/src/http/modules/ngx_http_mp4_module.c<br>
++++ b/src/http/modules/ngx_http_mp4_module.c<br>
+@@ -1070,6 +1070,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (mp4-&gt;ftyp_atom.buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 f=
typ atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_size =3D sizeof(ngx_mp4_atom_header_t) + (si=
ze_t) atom_data_size;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; ftyp_atom =3D ngx_palloc(mp4-&gt;request-&gt;pool=
, atom_size);<br>
+@@ -1128,6 +1134,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_DECLINED;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (mp4-&gt;moov_atom.buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 m=
oov atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; conf =3D ngx_http_get_module_loc_conf(mp4-&gt;req=
uest, ngx_http_mp4_module);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (atom_data_size &gt; mp4-&gt;buffer_size) {<br=
>
+@@ -1195,6 +1207,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4-&gt;file.l=
og, 0, &quot;mp4 mdat atom&quot;);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (mp4-&gt;mdat_atom.buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 m=
dat atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; data =3D &amp;mp4-&gt;mdat_data_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;file =3D &amp;mp4-&gt;file;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;in_file =3D 1;<br>
+@@ -1321,6 +1339,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4-&gt;file.l=
og, 0, &quot;mp4 mvhd atom&quot;);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (mp4-&gt;mvhd_atom.buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 m=
vhd atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_header =3D ngx_mp4_atom_header(mp4);<br>
+&nbsp;&nbsp;&nbsp;&nbsp; mvhd_atom =3D (ngx_mp4_mvhd_atom_t *) atom_header=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; mvhd64_atom =3D (ngx_mp4_mvhd64_atom_t *) atom_he=
ader;<br>
+@@ -1586,6 +1610,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_size =3D sizeof(ngx_mp4_atom_header_t) + (si=
ze_t) atom_data_size;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_TKHD_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 t=
khd atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;tkhd_size =3D atom_size;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; ngx_mp4_set_32value(tkhd_atom-&gt;size, atom_size=
);<br>
+@@ -1624,6 +1655,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_MDIA_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 m=
dia atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;mdia_atom_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;temporary =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;pos =3D atom_header;<br>
+@@ -1747,6 +1784,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_size =3D sizeof(ngx_mp4_atom_header_t) + (si=
ze_t) atom_data_size;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_MDHD_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 m=
dhd atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;mdhd_size =3D atom_size;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;timescale =3D timescale;<br>
+ <br>
+@@ -1789,6 +1833,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_HDLR_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 h=
dlr atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;hdlr_atom_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;temporary =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;pos =3D atom_header;<br>
+@@ -1817,6 +1867,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_MINF_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 m=
inf atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;minf_atom_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;temporary =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;pos =3D atom_header;<br>
+@@ -1860,6 +1916,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_VMHD_ATOM].buf<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || trak-&gt;out[NGX_HTTP_MP4_S=
MHD_ATOM].buf)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 v=
mhd/smhd atom in \&quot;%s\&quot;&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mp4-&gt;file.name.dat=
a);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;vmhd_atom_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;temporary =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;pos =3D atom_header;<br>
+@@ -1891,6 +1956,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_VMHD_ATOM].buf<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || trak-&gt;out[NGX_HTTP_MP4_S=
MHD_ATOM].buf)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 v=
mhd/smhd atom in \&quot;%s\&quot;&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mp4-&gt;file.name.dat=
a);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;smhd_atom_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;temporary =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;pos =3D atom_header;<br>
+@@ -1922,6 +1996,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_DINF_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 d=
inf atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;dinf_atom_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;temporary =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;pos =3D atom_header;<br>
+@@ -1950,6 +2030,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_STBL_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 s=
tbl atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;stbl_atom_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;temporary =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;pos =3D atom_header;<br>
+@@ -2018,6 +2104,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
+ <br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_STSD_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 s=
tsd atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;stsd_atom_buf;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;temporary =3D 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom-&gt;pos =3D atom_header;<br>
+@@ -2086,6 +2178,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_end =3D atom_table + entries * sizeof(ngx_mp=
4_stts_entry_t);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_STTS_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 s=
tts atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;time_to_sample_entries =3D entries;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;stts_atom_buf;<br>
+@@ -2291,6 +2390,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sync sample entries:%uD&quot=
;, entries);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_STSS_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 s=
tss atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;sync_samples_entries =3D entries;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_table =3D atom_header + sizeof(ngx_http_mp4_=
stss_atom_t);<br>
+@@ -2489,6 +2595,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;composition offset entries:%=
uD&quot;, entries);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_CTTS_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 c=
tts atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;composition_offset_entries =3D entries;<=
br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_table =3D atom_header + sizeof(ngx_mp4_ctts_=
atom_t);<br>
+@@ -2692,6 +2805,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_end =3D atom_table + entries * sizeof(ngx_mp=
4_stsc_entry_t);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_STSC_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 s=
tsc atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;sample_to_chunk_entries =3D entries;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;stsc_atom_buf;<br>
+@@ -3024,6 +3144,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;sample uniform size:%uD, ent=
ries:%uD&quot;, size, entries);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_STSZ_ATOM].buf) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 s=
tsz atom in \&quot;%s\&quot;&quot;, mp4-&gt;file.name.data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;sample_sizes_entries =3D entries;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_table =3D atom_header + sizeof(ngx_mp4_stsz_=
atom_t);<br>
+@@ -3207,6 +3334,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_end =3D atom_table + entries * sizeof(uint32=
_t);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_STCO_ATOM].buf<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || trak-&gt;out[NGX_HTTP_MP4_C=
O64_ATOM].buf)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 s=
tco/co64 atom in \&quot;%s\&quot;&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mp4-&gt;file.name.dat=
a);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;chunks =3D entries;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;stco_atom_buf;<br>
+@@ -3413,6 +3550,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp=
4, uint64_t atom_data_size)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom_end =3D atom_table + entries * sizeof(uint64=
_t);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak =3D ngx_mp4_last_trak(mp4);<br>
++<br>
++&nbsp;&nbsp;&nbsp; if (trak-&gt;out[NGX_HTTP_MP4_STCO_ATOM].buf<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; || trak-&gt;out[NGX_HTTP_MP4_C=
O64_ATOM].buf)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ngx_log_error(NGX_LOG_ERR, mp4=
-&gt;file.log, 0,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;duplicate mp4 s=
tco/co64 atom in \&quot;%s\&quot;&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mp4-&gt;file.name.dat=
a);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return NGX_ERROR;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp; trak-&gt;chunks =3D entries;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp; atom =3D &amp;trak-&gt;co64_atom_buf;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb b/meta-webs=
erver/recipes-httpd/nginx/nginx_1.20.1.bb<br>
index d686c627f..e2d0443c6 100644<br>
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb<br>
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.20.1.bb<br>
@@ -1,6 +1,8 @@<br>
&nbsp;require nginx.inc<br>
&nbsp;<br>
-SRC_URI +=3D &quot;<a href=3D"file://CVE-2021-3618.patch">file://CVE-2021-=
3618.patch</a>&quot;<br>
+SRC_URI +=3D &quot;<a href=3D""></a>file://CVE-2021-3618.patch \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-41741-CVE-2022-41742.patch">file://CVE-2022-41741-CVE-2=
022-41742.patch</a> \
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE;md5=3D206629dc7c=
7b3e87acb31162363ae505">file://LICENSE;md5=3D206629dc7c7b3e87acb31162363ae5=
05</a>&quot;<br>
&nbsp;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR11MB1924DF0751010B40365B5BEFE0809BN6PR11MB1924namp_--

