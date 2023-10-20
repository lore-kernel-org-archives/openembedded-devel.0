Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE23CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:57:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.50205.1697792216580055479
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UFG5Hza3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86572e0271=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39K8kl3o025631
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 08:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=l7rqSbvVV5WmbV8nZc
	J5TGI3IX7pit2nLe27R47+32o=; b=UFG5Hza3kh6bXrVJZW0UzP69/IxQ1ZpGG+
	rRTdSq5ioc8B55KcqQw/3/9SZSt5fhg1Qr9Ic6jCKYdT4h5ddqyyIO9X0CAretgq
	7OcsjF7crB5TyfpUdqQFvkdo9SMEvLzb87AkVFIJYZBpPQc2xYrtWiCAqe8EOPFF
	CRuz8gCchi1f0oD6hRJ1OZ5jdNH2SM1vjjRUj31fCSPzSF6MWT5pklps2eK9O2m/
	yQ2lo3QLyqOvRYrSvhT78XhCBmGCPPQhgIIKKv5w+ieSDlZY6lPIRj3Gcsx81FMX
	0xIHKjFfUZzhNg0U97zXQuDvC+RPurOrJ1FXBJg75mu+WBP0Rq6A==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tuevt8bhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 08:56:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvCNPo2U1tHhp2e6eCgSk0zyOxZZzJ8apngPqEkGRwYKn9ciuurapXKGr+/Q+JYae/qNL28pTRza/xYR2uX325+tjbC2uO4x/GdF6aZHBcHvghnV/BaenrpWBnVUBEZzOgVjo5jm/Ybpag7+Ap5/W6WdwKil7Q39Z2FK6ow9eF9cL2Pj4ToqgGt4nPskmRCllVD3v0XvM1txQMD2LS8qz/nscY6CxJOofCZAUglHeg1fnaNTReoClbOLpjYryPsNuSYNH7/kial3Q7LzERMaMbfbdhpCaG6APoB/0Yzw3odI9xOD6kdmNHnB88hNWjfQgtYGdF53Dwi3maytwuftWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l7rqSbvVV5WmbV8nZcJ5TGI3IX7pit2nLe27R47+32o=;
 b=U9XdHtBcbqkr9cFQDfFxIpXbBaCD0LHoe/o1CWieZi78iDxHiLQLe+cOkXeze2NpsLoJFlip2da9pQBkgaMt3Csf8PlEPCDg5zFJC1RGnKPWWI3jLlzXKVNJ/InzZ+LczqOmH5aQfVlQXS7yvpIuVRwXTSPIVTFeZF4Ocxa9IuV4i9P3uKgxXILEd13DGvy0XygNdVciGOClPHAhfNuHMgZyeIrmEcigWeF37Ke9lV1YHSBc2PizxEcyOWxTzgZlk11+CYFwAV2EcKKSsgXIOApKJj0JmlwBmuNikWZ8bo0lbc0mj4/4AT/LDiPqqrr0hcdTwdKtmfWmq2L4Af5Xbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 08:56:52 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::226:904a:7463:daba]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::226:904a:7463:daba%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:56:52 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Polampalli, Archana"
	<Archana.Polampalli@windriver.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH V2 1/3] samba: fix
 CVE-2023-34966
Thread-Topic: [oe][meta-networking][kirkstone][PATCH V2 1/3] samba: fix
 CVE-2023-34966
Thread-Index: AQHZ8vyApL01vchNZ0mVbFkzLYdO/rBSgLPl
Date: Fri, 20 Oct 2023 08:56:52 +0000
Message-ID: 
 <MW4PR11MB58221299399CAFA00A08146F84DBA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <17896F9527EEE865.9230@lists.openembedded.org>
In-Reply-To: <17896F9527EEE865.9230@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|BY1PR11MB8029:EE_
x-ms-office365-filtering-correlation-id: 5cbfa95c-f5fa-4536-cacf-08dbd14a80e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mRElCLH8MUvKQICCLtoi38HPcxzKn4kB8A+I/sUo9DVt28Vr33DX8cNRFMWphkjfOw3Ae/3ll2wyv7W6RyAUn25yFF3kkeGZNDfxMUUh9ywxhAgLnC/icYREk0hWbuBn8cv7vCuI+88cf6z0r2da8Gb1SbPupYYCk/rTCYCDnw1XkNY93b+4COcMse0reSx2LRf+2VixRqK2fBANDF3rmlIvpUo8XaeV4RM0hVFEOiPANtI529luhZIEMNs6I2hsFeH0v+0yDAIFxOL/ftAi4KN3P0L7jsioHl/VI1TRSc0ayUavJSlLoQqCST1wC3AbOUmKlM2z6zS6LeZVzK4FfN0fJY7f5M+DWBOGUODAuQ/5/OwFiOk+l61PSW0uCUMn18ruImRl+4OccUUagfH6+p+i84qY0zQEkFwKEKD+Xjblu9F52jbWYrDJcQRMwm0bVXbmwDYJsK/JRc9JGgsZbUY4g1ts/SBGkPFkfYohJjcrsr/3fwxpsazqxkX8SixFa6gZmyYQOvpMsPGr4x5n1O22XqP0vgLT+hSJEWauP6BsMlGmijqGolgVr71UxWfJfQVkCl1FuBWkxIT7/WVshNY30dvF9yx3fDjJNeeUtUR4BN656x+QNyyACxAOcRrg48Y01M44s5HshAEU/BFn9w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(396003)(346002)(366004)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(19627405001)(33656002)(55016003)(38070700009)(91956017)(316002)(66556008)(66946007)(64756008)(66446008)(66476007)(166002)(86362001)(38100700002)(76116006)(122000001)(110136005)(83380400001)(71200400001)(9686003)(7696005)(6506007)(8936002)(2906002)(478600001)(41300700001)(8676002)(966005)(5660300002)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sqh8fusz10U8z/Vj6vyhofFOg/85nW8id/TxHmUzgd0FHhkpHEy3kfREvuSe?=
 =?us-ascii?Q?rJ5dqRD1J8wW/1Bcyd0muR5OHRo4UqQfeP3KoetPOGjryOLezY8tjzZmvWET?=
 =?us-ascii?Q?0zgEtYslaKA33Ilb0aUM+/+gd3YtQkvHznX3YwBvLD9C8XJda8K5Xz53OcJ7?=
 =?us-ascii?Q?7OnGfCjSjs3PX2TIRAvYVJMZMVTnkETjamGSoO/i8rUUuBz/gXVSdbyoWEXr?=
 =?us-ascii?Q?U4aoMteqCQ7LobmNs0BuvklRwGdLHm/bWQf7WKRvyY0uR23zHpK4Lg5SXmf1?=
 =?us-ascii?Q?Ucf2KEqieDOS9FxD19jHeEMIQSYxeWlDcoplTrdoq7gUW3W8rlpZDstv47LH?=
 =?us-ascii?Q?kukxMRangppWLacCndthSNiDD+msQRNIga9g/G7t0ZhuX299zhDbf1pj50RP?=
 =?us-ascii?Q?oF9vs3jEMFsz+jOmYCTeO5OM65V74XPRYTcW2GrSu2XYi6AlGk0iFrjwpaWh?=
 =?us-ascii?Q?Rsfz7JWaV1aBOpylQyu0Uy7AJrYSIHGk42Di2HD/r8i5UlWOnLLolwjc4yl4?=
 =?us-ascii?Q?SF9wvVjpzuQMWIoGCcwiHHDd8fJuvKUPk5ee2xKmn1qCtulubCs8YQ3sQ6kk?=
 =?us-ascii?Q?bCvUVbEzkxr9khEaxKRY6w4aWwU+ED8SElzZa7r6No909+T+B0ACzTZAyuoB?=
 =?us-ascii?Q?tt75EbMawDRNtJ0kfmkiHlTpJsutUT9ejDKZqh+kG4jiswqsaswgjVTTC8Hs?=
 =?us-ascii?Q?mJPRnJpYe5D7UW4SQElGjdZbigAnzz0lMwvrxUxMKBAW04AN+YekQdjD6GPs?=
 =?us-ascii?Q?HzFsoFrhe8sVliuIoEOwxxw/4ZKJouO9Y8JI/+VKz1eITeTZvk1o67CVWrpf?=
 =?us-ascii?Q?WFxxi/0ocjuUAuWtsYVl+31EhgWCI52xMCdH2yCWGEyR3BjLZ5Y9JeWSg6t/?=
 =?us-ascii?Q?XkL8Fw+lQHIJA/njXTy14OJobv3WUgMY/iPRtnrNlblSXYtq/I7h6fHPchRn?=
 =?us-ascii?Q?Fy/SoLf2xlq6GWqZZCNHXxCFgjt/3pcGosmOG0iMDB3BkziilabLqaXDLizo?=
 =?us-ascii?Q?fAAdMfekLaaKZAaFPJkmiRewcrEt1XzEQxkNR1SijwSNmOln6Aleaw1uqv8/?=
 =?us-ascii?Q?AjmzIFvkEhHFfEZ0Dw9J744CdiTiitJRtR7gflUTaIa7JhPDYzySktv1ewRD?=
 =?us-ascii?Q?/5Y62aEdqsTZqmvd0Y+PaFpgKkBLqa8aDd4SR58RTQuJxPMDoYCZRvoPIPI/?=
 =?us-ascii?Q?TSJJbWBneA+oiUmA4J0YEdf0bzhkszTkgvIc9312nvqW89Tw0uIjw5ktWsCQ?=
 =?us-ascii?Q?ugAlI/4hl1Pc2wbP7GmBVQib0mrwQmSCrTLS2ZCmjcmlMdZUV613kNJFY07y?=
 =?us-ascii?Q?B49iTVymcTXjNRCyVSQCVq15+R9aQwhIoIW893rp58Y3j2ACOc2KY9uS6FWV?=
 =?us-ascii?Q?m/zQ8oveg9VT0yhwS4mI/CdK+KW957UlEwA6bUjOvOqcTkfhQ0kI/GB76fzq?=
 =?us-ascii?Q?KUUSK4GuiZEDnEOk2iZL09ldI+8o9ndCK8XMwFpKaxQV+2tySyNphLi+i54d?=
 =?us-ascii?Q?rWuvV19umPYbG9AOmrtej+iZh/f1UQq6CFebm3h7wu7M3rQqPzJxc7x9cEza?=
 =?us-ascii?Q?dVeeW/zIINhW1tHxaKo7e1SjmJ2UEFhPtQ2mpeGOGRK5xh8H6K3jvPde3QWo?=
 =?us-ascii?Q?Jg86KynhDcN5oT55BPr09XdAukEh6SW6isJ2zT8xVLqUY6wjRY6wL5Kx3dI1?=
 =?us-ascii?Q?6BSGGQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB58221299399CAFA00A08146F84DBAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbfa95c-f5fa-4536-cacf-08dbd14a80e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 08:56:52.3021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GEhLZZWrYvfO+JgMNZ9/3Ek9jGQ4B1/mRg478wq86I7hxO/OJNXAMzp6eZzO+ndGtrhQcuaZiu8Z4Cl8UTCJZ422M6yDxWlfMxXOqSfFLi9H5cnzmhiOmz2oHnaYy2fZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
X-Proofpoint-ORIG-GUID: 5PMTmbdLMJmNJBJV7iUiUk4tvHQ1OV9C
X-Proofpoint-GUID: 5PMTmbdLMJmNJBJV7iUiUk4tvHQ1OV9C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2310170000
 definitions=main-2310200074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Oct 2023 08:57:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105620

--_000_MW4PR11MB58221299399CAFA00A08146F84DBAMW4PR11MB5822namp_
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
Subject: [oe][meta-networking][kirkstone][PATCH V2 1/3] samba: fix CVE-2023=
-34966

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../samba/samba/CVE-2023-34966_0001.patch     |  78 ++++++++++
 .../samba/samba/CVE-2023-34966_0002.patch     | 140 ++++++++++++++++++
 .../samba/samba_4.14.14.bb                    |   2 +
 3 files changed, 220 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34966_0001.patch
 create mode 100644 meta-networking/recipes-connectivity/samba/samba/CVE-20=
23-34966_0002.patch

diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
6_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
966_0001.patch
new file mode 100644
index 000000000..77a383f09
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.=
patch
@@ -0,0 +1,78 @@
+From 38664163fcac985d87e4274d198568e0fe88595e Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Fri, 26 May 2023 13:06:19 +0200
+Subject: [PATCH] CVE-2023-34966: mdssvc: harden sl_unpack_loop()
+
+A malicious client could send a packet where subcount is zero, leading to =
a busy
+loop because
+
+    count -=3D subcount
+=3D>  count -=3D 0
+=3D>  while (count > 0)
+
+loops forever.
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15340
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/3866=
4163fcac985d87e4274d198568e0fe88595e]
+
+CVE: CVE-2023-34966
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source3/rpc_server/mdssvc/marshalling.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/source3/rpc_server/mdssvc/marshalling.c b/source3/rpc_server/=
mdssvc/marshalling.c
+index 9ba6ef571f2..d794ba15838 100644
+--- a/source3/rpc_server/mdssvc/marshalling.c
++++ b/source3/rpc_server/mdssvc/marshalling.c
+@@ -1119,7 +1119,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+                       sl_nil_t nil =3D 0;
+
+                       subcount =3D tag.count;
+-                      if (subcount > count) {
++                      if (subcount < 1 || subcount > count) {
+                               return -1;
+                       }
+                       for (i =3D 0; i < subcount; i++) {
+@@ -1147,7 +1147,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+
+               case SQ_TYPE_INT64:
+                       subcount =3D sl_unpack_ints(query, buf, offset, buf=
size, encoding);
+-                      if (subcount =3D=3D -1 || subcount > count) {
++                      if (subcount < 1 || subcount > count) {
+                               return -1;
+                       }
+                       offset +=3D tag.size;
+@@ -1156,7 +1156,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+
+               case SQ_TYPE_UUID:
+                       subcount =3D sl_unpack_uuid(query, buf, offset, buf=
size, encoding);
+-                      if (subcount =3D=3D -1 || subcount > count) {
++                      if (subcount < 1 || subcount > count) {
+                               return -1;
+                       }
+                       offset +=3D tag.size;
+@@ -1165,7 +1165,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+
+               case SQ_TYPE_FLOAT:
+                       subcount =3D sl_unpack_floats(query, buf, offset, b=
ufsize, encoding);
+-                      if (subcount =3D=3D -1 || subcount > count) {
++                      if (subcount < 1 || subcount > count) {
+                               return -1;
+                       }
+                       offset +=3D tag.size;
+@@ -1174,7 +1174,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,
+
+               case SQ_TYPE_DATE:
+                       subcount =3D sl_unpack_date(query, buf, offset, buf=
size, encoding);
+-                      if (subcount =3D=3D -1 || subcount > count) {
++                      if (subcount < 1 || subcount > count) {
+                               return -1;
+                       }
+                       offset +=3D tag.size;
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
6_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
966_0002.patch
new file mode 100644
index 000000000..a86d1729c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.=
patch
@@ -0,0 +1,140 @@
+From 10b6890d26b3c7a829a9e9a05ad1d1ff54daeca9 Mon Sep 17 00:00:00 2001
+From: Ralph Boehme <slow@samba.org>
+Date: Wed, 31 May 2023 15:34:26 +0200
+Subject: [PATCH] CVE-2023-34966: CI: test for sl_unpack_loop()
+
+Send a maliciously crafted packet where a nil type has a subcount of 0. Th=
is
+triggers an endless loop in mdssvc sl_unpack_loop().
+
+BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15340
+
+Signed-off-by: Ralph Boehme <slow@samba.org>
+
+Upstream-Status: Backport [https://github.com/samba-team/samba/commit/10b6=
890d26b3c7a829a9e9a05ad1d1ff54daeca9]
+
+CVE: CVE-2023-34966
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ source4/torture/rpc/mdssvc.c | 100 +++++++++++++++++++++++++++++++++++
+ 1 file changed, 100 insertions(+)
+
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c
+index 2d2a8306412..a9956ef8f1d 100644
+--- a/source4/torture/rpc/mdssvc.c
++++ b/source4/torture/rpc/mdssvc.c
+@@ -581,6 +581,102 @@ done:
+       return ok;
+ }
+
++static uint8_t test_sl_unpack_loop_buf[] =3D {
++      0x34, 0x33, 0x32, 0x31, 0x33, 0x30, 0x64, 0x6d,
++      0x1d, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, 0x00,
++      0x01, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, 0x00,
++      0x01, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, 0x00,
++      0x01, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, 0x00,
++      0x06, 0x00, 0x00, 0x07, 0x04, 0x00, 0x00, 0x00,
++      0x66, 0x65, 0x74, 0x63, 0x68, 0x41, 0x74, 0x74,
++      0x72, 0x69, 0x62, 0x75, 0x74, 0x65, 0x73, 0x3a,
++      0x66, 0x6f, 0x72, 0x4f, 0x49, 0x44, 0x41, 0x72,
++      0x72, 0x61, 0x79, 0x3a, 0x63, 0x6f, 0x6e, 0x74,
++      0x65, 0x78, 0x74, 0x3a, 0x00, 0x00, 0x00, 0xea,
++      0x02, 0x00, 0x00, 0x84, 0x02, 0x00, 0x00, 0x00,
++      0x0a, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++      0x01, 0x00, 0x00, 0x02, 0x04, 0x00, 0x00, 0x00,
++      0x01, 0x00, 0x00, 0x02, 0x05, 0x00, 0x00, 0x00,
++      0x03, 0x00, 0x00, 0x07, 0x03, 0x00, 0x00, 0x00,
++      0x6b, 0x4d, 0x44, 0x49, 0x74, 0x65, 0x6d, 0x50,
++      0x61, 0x74, 0x68, 0x00, 0x00, 0x00, 0x00, 0x00,
++      0x01, 0x00, 0x00, 0x02, 0x06, 0x00, 0x00, 0x00,
++      0x03, 0x00, 0x00, 0x87, 0x08, 0x00, 0x00, 0x00,
++      0x01, 0x00, 0xdd, 0x0a, 0x20, 0x00, 0x00, 0x6b,
++      0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++      0x07, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, 0x00,
++      0x02, 0x00, 0x00, 0x0a, 0x03, 0x00, 0x00, 0x00,
++      0x03, 0x00, 0x00, 0x0a, 0x03, 0x00, 0x00, 0x00,
++      0x04, 0x00, 0x00, 0x0c, 0x04, 0x00, 0x00, 0x00,
++      0x0e, 0x00, 0x00, 0x0a, 0x01, 0x00, 0x00, 0x00,
++      0x0f, 0x00, 0x00, 0x0c, 0x03, 0x00, 0x00, 0x00,
++      0x13, 0x00, 0x00, 0x1a, 0x00, 0x00, 0x00, 0x00,
++      0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
++      0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00,
++      0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
++      0x00, 0x00, 0x00, 0x00
++};
++
++static bool test_mdssvc_sl_unpack_loop(struct torture_context *tctx,
++                                     void *data)
++{
++      struct torture_mdsscv_state *state =3D talloc_get_type_abort(
++              data, struct torture_mdsscv_state);
++      struct dcerpc_binding_handle *b =3D state->p->binding_handle;
++      struct mdssvc_blob request_blob;
++      struct mdssvc_blob response_blob;
++      uint32_t device_id;
++      uint32_t unkn2;
++      uint32_t unkn9;
++      uint32_t fragment;
++      uint32_t flags;
++      NTSTATUS status;
++      bool ok =3D true;
++
++      device_id =3D UINT32_C(0x2f000045);
++      unkn2 =3D 23;
++      unkn9 =3D 0;
++      fragment =3D 0;
++      flags =3D UINT32_C(0x6b000001);
++
++      request_blob.spotlight_blob =3D test_sl_unpack_loop_buf;
++      request_blob.size =3D sizeof(test_sl_unpack_loop_buf);
++      request_blob.length =3D sizeof(test_sl_unpack_loop_buf);
++
++      response_blob.spotlight_blob =3D talloc_array(state,
++                                                  uint8_t,
++                                                  0);
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
++              "dcerpc_mdssvc_unknown1 failed\n");
++
++done:
++      return ok;
++}
++
+ static bool test_mdssvc_invalid_ph_close(struct torture_context *tctx,
+                                        void *data)
+ {
+@@ -856,5 +952,9 @@ struct torture_suite *torture_rpc_mdssvc(TALLOC_CTX *m=
em_ctx)
+                                     "fetch_unknown_cnid",
+                                     test_mdssvc_fetch_attr_unknown_cnid);
+
++      torture_tcase_add_simple_test(tcase,
++                                    "mdssvc_sl_unpack_loop",
++                                    test_mdssvc_sl_unpack_loop);
++
+       return suite;
+ }
+--
+2.40.0
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
index 72021745b..11b6ade40 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
@@ -33,6 +33,8 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
            file://CVE-2022-45142.patch;patchdir=3Dsource4/heimdal \
            file://CVE-2022-41916.patch;patchdir=3Dsource4/heimdal \
            file://CVE-2021-44758.patch;patchdir=3Dsource4/heimdal \
+           file://CVE-2023-34966_0001.patch \
+           file://CVE-2023-34966_0002.patch \
            "

 SRC_URI:append:libc-musl =3D " \
--
2.40.0


--_000_MW4PR11MB58221299399CAFA00A08146F84DBAMW4PR11MB5822namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Reminder!</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
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
<b>Subject:</b> [oe][meta-networking][kirkstone][PATCH V2 1/3] samba: fix C=
VE-2023-34966</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Signed-off-by: Archana Polampalli &lt;archana.pola=
mpalli@windriver.com&gt;<br>
---<br>
&nbsp;.../samba/samba/CVE-2023-34966_0001.patch&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 78 ++++++++++<br>
&nbsp;.../samba/samba/CVE-2023-34966_0002.patch&nbsp;&nbsp;&nbsp;&nbsp; | 1=
40 ++++++++++++++++++<br>
&nbsp;.../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp;&nbsp; 2 +<br>
&nbsp;3 files changed, 220 insertions(+)<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34966_0001.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-connectivity/samba/samba/C=
VE-2023-34966_0002.patch<br>
<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
6_0001.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
966_0001.patch<br>
new file mode 100644<br>
index 000000000..77a383f09<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0001.=
patch<br>
@@ -0,0 +1,78 @@<br>
+From 38664163fcac985d87e4274d198568e0fe88595e Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Fri, 26 May 2023 13:06:19 +0200<br>
+Subject: [PATCH] CVE-2023-34966: mdssvc: harden sl_unpack_loop()<br>
+<br>
+A malicious client could send a packet where subcount is zero, leading to =
a busy<br>
+loop because<br>
+<br>
+&nbsp;&nbsp;&nbsp; count -=3D subcount<br>
+=3D&gt;&nbsp; count -=3D 0<br>
+=3D&gt;&nbsp; while (count &gt; 0)<br>
+<br>
+loops forever.<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15340">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15340</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/38664163fcac985d87e4274d198568e0fe88595e">https://github.com/samba-t=
eam/samba/commit/38664163fcac985d87e4274d198568e0fe88595e</a>]<br>
+<br>
+CVE: CVE-2023-34966<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source3/rpc_server/mdssvc/marshalling.c | 10 +++++-----<br>
+ 1 file changed, 5 insertions(+), 5 deletions(-)<br>
+<br>
+diff --git a/source3/rpc_server/mdssvc/marshalling.c b/source3/rpc_server/=
mdssvc/marshalling.c<br>
+index 9ba6ef571f2..d794ba15838 100644<br>
+--- a/source3/rpc_server/mdssvc/marshalling.c<br>
++++ b/source3/rpc_server/mdssvc/marshalling.c<br>
+@@ -1119,7 +1119,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sl_nil_t nil =3D=
 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subcount =3D tag=
.count;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount &gt; cou=
nt) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount &lt; 1 |=
| subcount &gt; count) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i =
&lt; subcount; i++) {<br>
+@@ -1147,7 +1147,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SQ_TYPE_INT64:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subcount =3D sl_=
unpack_ints(query, buf, offset, bufsize, encoding);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount =3D=3D -=
1 || subcount &gt; count) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount &lt; 1 |=
| subcount &gt; count) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset +=3D tag.=
size;<br>
+@@ -1156,7 +1156,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SQ_TYPE_UUID:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subcount =3D sl_=
unpack_uuid(query, buf, offset, bufsize, encoding);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount =3D=3D -=
1 || subcount &gt; count) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount &lt; 1 |=
| subcount &gt; count) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset +=3D tag.=
size;<br>
+@@ -1165,7 +1165,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SQ_TYPE_FLOAT:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subcount =3D sl_=
unpack_floats(query, buf, offset, bufsize, encoding);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount =3D=3D -=
1 || subcount &gt; count) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount &lt; 1 |=
| subcount &gt; count) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset +=3D tag.=
size;<br>
+@@ -1174,7 +1174,7 @@ static ssize_t sl_unpack_loop(DALLOC_CTX *query,<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; case SQ_TYPE_DATE:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; subcount =3D sl_=
unpack_date(query, buf, offset, bufsize, encoding);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount =3D=3D -=
1 || subcount &gt; count) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subcount &lt; 1 |=
| subcount &gt; count) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset +=3D tag.=
size;<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-2023-3496=
6_0002.patch b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34=
966_0002.patch<br>
new file mode 100644<br>
index 000000000..a86d1729c<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-34966_0002.=
patch<br>
@@ -0,0 +1,140 @@<br>
+From 10b6890d26b3c7a829a9e9a05ad1d1ff54daeca9 Mon Sep 17 00:00:00 2001<br>
+From: Ralph Boehme &lt;slow@samba.org&gt;<br>
+Date: Wed, 31 May 2023 15:34:26 +0200<br>
+Subject: [PATCH] CVE-2023-34966: CI: test for sl_unpack_loop()<br>
+<br>
+Send a maliciously crafted packet where a nil type has a subcount of 0. Th=
is<br>
+triggers an endless loop in mdssvc sl_unpack_loop().<br>
+<br>
+BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15340">https:=
//bugzilla.samba.org/show_bug.cgi?id=3D15340</a><br>
+<br>
+Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/samba-team/samba/=
commit/10b6890d26b3c7a829a9e9a05ad1d1ff54daeca9">https://github.com/samba-t=
eam/samba/commit/10b6890d26b3c7a829a9e9a05ad1d1ff54daeca9</a>]<br>
+<br>
+CVE: CVE-2023-34966<br>
+<br>
+Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;=
<br>
+---<br>
+ source4/torture/rpc/mdssvc.c | 100 +++++++++++++++++++++++++++++++++++<br=
>
+ 1 file changed, 100 insertions(+)<br>
+<br>
+diff --git a/source4/torture/rpc/mdssvc.c b/source4/torture/rpc/mdssvc.c<b=
r>
+index 2d2a8306412..a9956ef8f1d 100644<br>
+--- a/source4/torture/rpc/mdssvc.c<br>
++++ b/source4/torture/rpc/mdssvc.c<br>
+@@ -581,6 +581,102 @@ done:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ok;<br>
+ }<br>
+<br>
++static uint8_t test_sl_unpack_loop_buf[] =3D {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x34, 0x33, 0x32, 0x31, 0x33, 0x30, 0x64, =
0x6d,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1d, 0x00, 0x00, 0x00, 0x16, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01, 0x00, 0x00, 0x02, 0x01, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01, 0x00, 0x00, 0x02, 0x02, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01, 0x00, 0x00, 0x02, 0x03, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x06, 0x00, 0x00, 0x07, 0x04, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x66, 0x65, 0x74, 0x63, 0x68, 0x41, 0x74, =
0x74,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x72, 0x69, 0x62, 0x75, 0x74, 0x65, 0x73, =
0x3a,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x66, 0x6f, 0x72, 0x4f, 0x49, 0x44, 0x41, =
0x72,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x72, 0x61, 0x79, 0x3a, 0x63, 0x6f, 0x6e, =
0x74,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x65, 0x78, 0x74, 0x3a, 0x00, 0x00, 0x00, =
0xea,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x02, 0x00, 0x00, 0x84, 0x02, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0a, 0x50, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01, 0x00, 0x00, 0x02, 0x04, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01, 0x00, 0x00, 0x02, 0x05, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x03, 0x00, 0x00, 0x07, 0x03, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x6b, 0x4d, 0x44, 0x49, 0x74, 0x65, 0x6d, =
0x50,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x61, 0x74, 0x68, 0x00, 0x00, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01, 0x00, 0x00, 0x02, 0x06, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x03, 0x00, 0x00, 0x87, 0x08, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01, 0x00, 0xdd, 0x0a, 0x20, 0x00, 0x00, =
0x6b,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x07, 0x00, 0x00, 0x88, 0x00, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x02, 0x00, 0x00, 0x0a, 0x03, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x03, 0x00, 0x00, 0x0a, 0x03, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x04, 0x00, 0x00, 0x0c, 0x04, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0e, 0x00, 0x00, 0x0a, 0x01, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0f, 0x00, 0x00, 0x0c, 0x03, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x13, 0x00, 0x00, 0x1a, 0x00, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, =
0x00,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x00, 0x00, 0x00, 0x00<br>
++};<br>
++<br>
++static bool test_mdssvc_sl_unpack_loop(struct torture_context *tctx,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *=
data)<br>
++{<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct torture_mdsscv_state *state =3D tal=
loc_get_type_abort(<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; data, struct torture_mdsscv_state);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dcerpc_binding_handle *b =3D state-=
&gt;p-&gt;binding_handle;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob request_blob;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mdssvc_blob response_blob;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t device_id;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t unkn2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t unkn9;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t fragment;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t flags;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ok =3D true;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; device_id =3D UINT32_C(0x2f000045);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unkn2 =3D 23;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unkn9 =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fragment =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags =3D UINT32_C(0x6b000001);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.spotlight_blob =3D test_sl_un=
pack_loop_buf;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.size =3D sizeof(test_sl_unpac=
k_loop_buf);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; request_blob.length =3D sizeof(test_sl_unp=
ack_loop_buf);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; response_blob.spotlight_blob =3D talloc_ar=
ray(state,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uin=
t8_t,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0);=
<br>
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
nbsp; &quot;dcerpc_mdssvc_unknown1 failed\n&quot;);<br>
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
+@@ -856,5 +952,9 @@ struct torture_suite *torture_rpc_mdssvc(TALLOC_CTX *m=
em_ctx)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;f=
etch_unknown_cnid&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_md=
ssvc_fetch_attr_unknown_cnid);<br>
+<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_tcase_add_simple_test(tcase,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;mdssvc=
_sl_unpack_loop&quot;,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_mdssvc_=
sl_unpack_loop);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return suite;<br>
+ }<br>
+--<br>
+2.40.0<br>
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/=
meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
index 72021745b..11b6ade40 100644<br>
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
@@ -33,6 +33,8 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-${PV}.tar.=
gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-45142.patch;patchdir=3Dsource4/heimdal">file://CVE-2022=
-45142.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-41916.patch;patchdir=3Dsource4/heimdal">file://CVE-2022=
-41916.patch;patchdir=3Dsource4/heimdal</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2021-44758.patch;patchdir=3Dsource4/heimdal">file://CVE-2021=
-44758.patch;patchdir=3Dsource4/heimdal</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34966_0001.patch">file://CVE-2023-34966_0001.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2023-34966_0002.patch">file://CVE-2023-34966_0002.patch</a> \<br>
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

--_000_MW4PR11MB58221299399CAFA00A08146F84DBAMW4PR11MB5822namp_--

