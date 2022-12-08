Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31AD0C3A5A7
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 07:15:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7763.1670483726778900811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Dec 2022 23:15:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fJ++pOOG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93412dbd35=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B86ho8n017543
	for <openembedded-devel@lists.openembedded.org>; Thu, 8 Dec 2022 07:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=/WR/bizC56Upzy7giWVCHuXRVfVGKSWzjFnkBc3lLbc=;
 b=fJ++pOOGANlkFKs9fTw+KlipKKhjCKwQiFVfBmCK5OqvIY4R2ou4oL0koSaDELreKKNj
 7FkDm+u7S5jp0I2yb57vEiYgXWkS9on4h6mU5R5oIJnjpYlcdUGeJDd0xBeJf98yVS4q
 Zj7ONBN1auOjvt04g4hzXPteWj3iGOz8QH71y9S/jvdxPpf4DRmvaCZbqam/q1gfNAQk
 lNmuE9TtLPOP7YOjmsJFsZWLPPuNMyYlpr9Z+HxaebEAVDM8EEil3Au4X7q7PsIWwksz
 TkBvabwkJHIQeZh/Wjs6cHhcAxF095vCtNviS+xqgiRgKEV9SeUY2rccfVgBiG2iYcwA Fg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7we94704-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 07:15:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7AONtONyWNR2qlgZcVibZWYmOXOO8n1wAQRwlyK3cEU/82Lee269BQ+JyYtOmj3ThHZaxMUxzdZOg4Bu5pe2OnqUfYB+VTpo3z/SnQ0tVT+Uzn3hpEbvWq0Jvq9cMy+yiWmfixOMwfU4YzwVPmR5F14gVEGD0p1eOvzZngI74t5YNV0bXxOJS2m1p5DKFxiqRZZECIBVkt/SBwY1vGh/YvZkoqhS9yIhROWzcbPjPA7wXVZn5hTCONJ5w/IP0ZAp8pcF/iYK824QoXGR3KDjZwG9gtL1B8DuGeYkOaryhAkxWNfxf3GIa+2Ue0gmshSkR91WOE5NsztQWnSinRiIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/WR/bizC56Upzy7giWVCHuXRVfVGKSWzjFnkBc3lLbc=;
 b=CLsNm5N5gVBTNZXRLZhP7fWoPNjDJq+g3EN1auAV9U/hrXpYUyAgNAeBo3FBDMl1VrVi5UwixgkxM+X4w4gyHmWe33dGn3uTqbbvMEhD2YsBCTFbPwugvEX4bPfk+0AZfAJa3t8AWUM0YqK/cyS7buCQuvVFbHjk34nT+GPq8jjN73fn0nqGzRbYJX1eWPnsQSfkl6IdLLlUitMSR7BhI5Iy2Q6djVxshYOoNwmZGLy92I07OHmVpa3vXS1fs9NCQGha/ZbfDhrNfHzADmbV5CXSb0Ihb2U6yXpC2mpWRJdkxfNHnEDl/f+zVH40KueZRCIFdjk9LGtbpPboZHasKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Thu, 8 Dec
 2022 07:15:20 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::6e39:7412:ab42:ea9a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::6e39:7412:ab42:ea9a%3]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 07:15:20 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>,
        "Mali, Narpat"
	<Narpat.Mali@windriver.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: Fix
 CVE-2022-45062
Thread-Topic: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: Fix
 CVE-2022-45062
Thread-Index: AQHZCYvc2zVpLr6/lUmkPSEMpnITO65jlmpK
Date: Thu, 8 Dec 2022 07:15:19 +0000
Message-ID: 
 <MW4PR11MB5822797EDBD52380B5FF2E5E841D9@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20221206160016.4029521-1-archana.polampalli@windriver.com>
In-Reply-To: <20221206160016.4029521-1-archana.polampalli@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|CY8PR11MB6866:EE_
x-ms-office365-filtering-correlation-id: 76fb2d44-5f44-4c5e-5320-08dad8ebf6da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 9q4q5HpXcxOt2NILD8rZlhjCzrH+lDUFaWwGLngrSmoGC4dd72oV6ShpLv3IfCNv/xO1X9rhWHMLXmpGMN5c6fY2N5AUm4AjX8bLwku0xAfOOUzJ3TmD0OGuT+d9eSV0F1H3Yo8eGtrfPeY5OW5eWGj1H06l7ECTmmalOZSJ4ytDV34TNFH7AEouzmHaDALz9kfaHcG9qDh3NSyvad6GGvQ1RewehHs+c0YQubyXt6jByNbBwa/MaX36fffAIkr0XQHAlBbB1RJI8pGDWLTmGJD9z+YOAKq/Yh6jTRWSj2fjRhJKmDFM+OQ9682nuXVoqqFUVFxt3pNYsa3IarJxyEe5VUxXSVrr+WcgDp1iODvp/tFb1kg58ncdpDLHTtxdDIHAD2q+nUSUgSup7gNZluUcQu4xkHAyKXhS5SfzKz/Mb8twXXok6iuULJpqzNHmI78jOp/+26iQ5YGj9sEbFVNU1sk1YzxgyxJZavph5cKzsQLZtXZ7e3JQS07urofG7d+PsSxUZ1rxyYHLYGnNEB2Ps/t0NGO16CV49A3L2T//VufH2bdH2RELKN+QihMeNxrkk3UFedaZjjKJ3Pev11Q5558gD9aX5ouDToVLQb31BGZngsW8AiYf8b5fbtRaevFT2wUNKGApQs1tuV9YGZpnVzOEDYqlbW8dcv8IdxRZ69TB5hnjJyulNzMroXJwdsZZGDFhoHGUT4xrYXkR8dubMccXTUBOlIvVAXNzBYYyGCAenjQZW34qRSmzRZr9u/l+klTceeq5SJnK6fUZXPAdzM3xwwQhmmkHDvC8amY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(376002)(346002)(136003)(396003)(451199015)(41300700001)(966005)(38100700002)(38070700005)(107886003)(64756008)(66446008)(19627405001)(66556008)(66476007)(122000001)(71200400001)(316002)(86362001)(8936002)(5660300002)(33656002)(54906003)(478600001)(2906002)(6916009)(6506007)(83380400001)(166002)(8676002)(53546011)(7696005)(186003)(52536014)(76116006)(91956017)(18265965005)(55016003)(4326008)(9686003)(26005)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wfvsCGHLmixyYcrP5yKKmvPVyMEmk6SY9pXQqwWwEQTJvkGQrW7CA+QO+CeB?=
 =?us-ascii?Q?AYPlW4XzjHoQ8O1JVMTfgieNSrTTqcQYOhreZAH+qWJFFuYv1k9b9bdNNqVM?=
 =?us-ascii?Q?FVR6BK0W4bmNDcFEXG8wcArLlxVsa57kU3fFq6Mqs92zZzYrK3MgMdnsb2ou?=
 =?us-ascii?Q?dpwSa7uMvwvewKq7PXU6zkTZZXddc4pGY8q/aKLNytfjt8lDIomN2E3A00wK?=
 =?us-ascii?Q?02SHN9RV0nKyT7JElu6qEoZ4mU0SDTfLXWT514TJ1NXhSGAWAMek94YejXVB?=
 =?us-ascii?Q?lOpw6Sj8xcbqfNzyHvyur9s22ft5ExikMT+CA+gm8rllBnl6ypXz/cIKRHUd?=
 =?us-ascii?Q?1rthaYMg9QOf4kdS5ZB0VzcMqhrKzPDuWdwntHryVoPulX3XSJr8WYkDOQ9W?=
 =?us-ascii?Q?yohIzCvcun21h9ajsiULn88aTaCOkSU8tUKXREGqa+7N+5A61rsIRHlkX1rl?=
 =?us-ascii?Q?uG7yKoFL95sn4V2oZceuxSiRJPJCPkjeXLibp5LsYGqF2+1rn6XMH/dWpqGP?=
 =?us-ascii?Q?nf41BDA1G5pVPZqSAaS13XzXZqs4t4SVo2sDfVdFD3gPwQw6v4+7YBGECTVM?=
 =?us-ascii?Q?q07qH0ER/7Xc6xvgoaP5RLOLdGfIBJcZFTYoe0w/7jVb7gftFbLw2soNNp7D?=
 =?us-ascii?Q?bHcY2Fh5XBHFAnwASA0HBWalf2FOY4RLoQ1/4koozJS8yORMlvLWOJBU7Qsd?=
 =?us-ascii?Q?2bfKnPbe8PDRDEpxuH7zzTqvsPe5J5xn8+b+06ZzJMQEoJ8r4TK8vRXlXC9S?=
 =?us-ascii?Q?975OkFUUYR0g2l9GM+PI9OE/Hcz90cmPTGsmGRZwhgIc6l6NnQQz1mldSbzR?=
 =?us-ascii?Q?sUt85gc09XfiLJ76pvvST3P5AsjMPLBzWPvQcWEASnN1EjFGIZhlpJOp2PJM?=
 =?us-ascii?Q?DP7L6bUlB5bnUxdBww45edmRXh4vJGVNzM8It+hv/aJ0RvgGysQT6cZLCP55?=
 =?us-ascii?Q?RHAdoUlvlNIevvKjZv1n0pHgNyvTlP9Ar6cnMVj1ZkBt2MFcVoJOqE1RzCDL?=
 =?us-ascii?Q?9p1b2onurR5AKW8K4coVHh0hlKRmqJwynn2Y9hTsC+nQnx4470LOQ4iFAR9E?=
 =?us-ascii?Q?2KsQc3tTGiF+Kth59G+bHJtCAHUBV7KBf8bPKO3HfkzhjsVNmar4Vib5qg4c?=
 =?us-ascii?Q?lM8rb4kHZseqA7PWbKFpoJuULCFezH7SqrUFfumY8EUsJD5bJdMWjNiFBqCK?=
 =?us-ascii?Q?rzYLp60GyZyUHIm1aTGpfzCDgsPXHo7u18ttmjbj0dyv+7F5diXT8DSAoe3W?=
 =?us-ascii?Q?+KojXTGYdc4qMxnoBhSR+5er6qASZjfd2d6QtHe+GfFmzcBVD+McBJtD/o+3?=
 =?us-ascii?Q?1FKu/5OLS9DSlDo+1Mf/6rUYvltF4bdEMsJC9RDDc6uhh0TPqrfGOjOzxMGt?=
 =?us-ascii?Q?QBa+JMz1CuNTis55Nxrvvkv68rpEAKYGNHHpw0zMDp0demmZt3dFc71/kkuD?=
 =?us-ascii?Q?1nRBtwTPWMkF4AC7+hLaxvKh3uVTHEY+tW0MtAUEBilrulT3vzPTbmj5aVj3?=
 =?us-ascii?Q?5wmPc2E0/IqKX/duzlPSkn1o/1xSccfPyx+w1ig2S8taVcMuiqhvED2bhKHD?=
 =?us-ascii?Q?TPyjli7j1OWVaN7P4OQfywKzXhALeOUuUM0vW4gKWj7wgIxQnjblU90YLFcA?=
 =?us-ascii?Q?GA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822797EDBD52380B5FF2E5E841D9MW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76fb2d44-5f44-4c5e-5320-08dad8ebf6da
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 07:15:19.6451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wwq/RVy6+Tdh/1Af3AGKxZKGtHzY5EvweenMpJJsL/0BxBtnocw7VxjPXe0ezLpIl3bgNSeuxqYWxBcVueTTAoLuSU4zhaUvji9H7VjGfpQrn9bPQb5JE8Wue1Uhts60
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
X-Proofpoint-GUID: Ev512N4LXkyGq9FEUeWrK_wHWV_T-Uxk
X-Proofpoint-ORIG-GUID: Ev512N4LXkyGq9FEUeWrK_wHWV_T-Uxk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_04,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=975 mlxscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Dec 2022 07:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99992

--_000_MW4PR11MB5822797EDBD52380B5FF2E5E841D9MW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this mail,

Regards,
Archana
________________________________
From: Archana Polampalli <archana.polampalli@windriver.com>
Sent: Tuesday, December 6, 2022 9:30 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>; Mali, Narpat <Narpat.Mali@=
windriver.com>; Polampalli, Archana <Archana.Polampalli@windriver.com>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: Fix CVE-2022-4=
5062

Escape characters which do not belong into an URI/URL
In order to prevent argument injection in Xfce xfce4-settings

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-45062

Upstream Status: Backport from
https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/55e3c5fb667e96ad1412cf=
249879262b369d28d7

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../xfce4-settings/files/CVE-2022-45062.patch | 83 +++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.16.2.bb   |  3 +-
 2 files changed, 85 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45=
062.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.pat=
ch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
new file mode 100644
index 000000000..5384617d5
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch
@@ -0,0 +1,83 @@
+commit 55e3c5fb667e96ad1412cf249879262b369d28d7
+Author: Alexander Schwinn <alexxcons@xfce.org>
+Date:   Mon Nov 7 09:56:31 2022 +0100
+
+    Escape characters which do not belong into an URI/URL (Issue #390)
+
+    In order to prevent argument injection
+
+diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-setti=
ngs/xfce-mime-helper.c
+index 7149951f..b797e03b 100644
+--- a/dialogs/mime-settings/xfce-mime-helper.c
++++ b/dialogs/mime-settings/xfce-mime-helper.c
+@@ -415,7 +415,7 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+   gint          status;
+   gint          result;
+   gint          pid;
+-  const gchar  *real_parameter =3D parameter;
++  gchar        *real_parameter =3D NULL;
+
+   // FIXME: startup-notification
+
+@@ -427,23 +427,43 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+   if (G_UNLIKELY (screen =3D=3D NULL))
+     screen =3D gdk_screen_get_default ();
+
+-  /* strip the mailto part if needed */
+-  if (real_parameter !=3D NULL && g_str_has_prefix (real_parameter, "mail=
to:"))
+-    real_parameter =3D parameter + 7;
++  if (parameter !=3D NULL)
++    {
++      if (helper->category =3D=3D XFCE_MIME_HELPER_WEBBROWSER || helper->=
category =3D=3D XFCE_MIME_HELPER_FILEMANAGER)
++        {
++          /* escape characters which do not belong into an URI/URL */
++          real_parameter =3D g_uri_escape_string (parameter, ":/?#[]@!$&'=
()*+,;=3D%", TRUE);
++        }
++      else if (g_str_has_prefix (real_parameter, "mailto:"))
++        {
++          /* strip the mailto part if needed */
++          real_parameter =3D g_strdup (parameter + 7);
++        }
++      else
++        {
++          real_parameter =3D g_strdup (parameter);
++        }
++    }
+
+   /* determine the command set to use */
+-  if (exo_str_is_flag (real_parameter)) {
+-    commands =3D helper->commands_with_flag;
+-  } else if (exo_str_is_empty (real_parameter)) {
+-    commands =3D helper->commands;
+-  } else {
+-    commands =3D helper->commands_with_parameter;
+-  }
++  if (exo_str_is_flag (real_parameter))
++    {
++      commands =3D helper->commands_with_flag;
++    }
++  else if (exo_str_is_empty (real_parameter))
++    {
++      commands =3D helper->commands;
++    }
++  else
++    {
++      commands =3D helper->commands_with_parameter;
++    }
+
+   /* verify that we have atleast one command */
+   if (G_UNLIKELY (*commands =3D=3D NULL))
+     {
+       g_set_error (error, G_SPAWN_ERROR, G_SPAWN_ERROR_INVAL, _("No comma=
nd specified"));
++      g_free (real_parameter);
+       return FALSE;
+     }
+
+@@ -533,6 +553,7 @@ xfce_mime_helper_execute (XfceMimeHelper   *helper,
+   if (G_UNLIKELY (!succeed))
+     g_propagate_error (error, err);
+
++  g_free (real_parameter);
+   return succeed;
+ }
+
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb=
 b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
index aa4265f7b..6757c48f4 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
@@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg

 REQUIRED_DISTRO_FEATURES =3D "x11"

-SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch"
+SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch \
+            file://CVE-2022-45062.patch"
 SRC_URI[sha256sum] =3D "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b8=
5be9197da03d7e"

 EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
--
2.34.1


--_000_MW4PR11MB5822797EDBD52380B5FF2E5E841D9MW4PR11MB5822namp_
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
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">Please ignore this mail,</=
span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">Regards,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Calibri, Arial, H=
elvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0); background-colo=
r: rgb(255, 255, 255);" class=3D"elementToProof">Archana</span></div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Archana Polampalli &l=
t;archana.polampalli@windriver.com&gt;<br>
<b>Sent:</b> Tuesday, December 6, 2022 9:30 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;; Mali, Narpat =
&lt;Narpat.Mali@windriver.com&gt;; Polampalli, Archana &lt;Archana.Polampal=
li@windriver.com&gt;<br>
<b>Subject:</b> [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: Fix CVE=
-2022-45062</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Escape characters which do not belong into an URI/=
URL<br>
In order to prevent argument injection in Xfce xfce4-settings<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-45062">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-45062</a><br>
<br>
Upstream Status: Backport from<br>
<a href=3D"https://gitlab.xfce.org/xfce/xfce4-settings/-/commit/55e3c5fb667=
e96ad1412cf249879262b369d28d7">https://gitlab.xfce.org/xfce/xfce4-settings/=
-/commit/55e3c5fb667e96ad1412cf249879262b369d28d7</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<=
br>
---<br>
&nbsp;.../xfce4-settings/files/CVE-2022-45062.patch | 83 ++++++++++++++++++=
+<br>
&nbsp;.../xfce4-settings/xfce4-settings_4.16.2.bb&nbsp;&nbsp; |&nbsp; 3 +-<=
br>
&nbsp;2 files changed, 85 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/CVE-20=
22-45062.patch<br>
<br>
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.pat=
ch b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch<br>
new file mode 100644<br>
index 000000000..5384617d5<br>
--- /dev/null<br>
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/CVE-2022-45062.patch<br>
@@ -0,0 +1,83 @@<br>
+commit 55e3c5fb667e96ad1412cf249879262b369d28d7<br>
+Author: Alexander Schwinn &lt;alexxcons@xfce.org&gt;<br>
+Date:&nbsp;&nbsp; Mon Nov 7 09:56:31 2022 +0100<br>
+<br>
+&nbsp;&nbsp;&nbsp; Escape characters which do not belong into an URI/URL (=
Issue #390)<br>
+&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp; In order to prevent argument injection<br>
+<br>
+diff --git a/dialogs/mime-settings/xfce-mime-helper.c b/dialogs/mime-setti=
ngs/xfce-mime-helper.c<br>
+index 7149951f..b797e03b 100644<br>
+--- a/dialogs/mime-settings/xfce-mime-helper.c<br>
++++ b/dialogs/mime-settings/xfce-mime-helper.c<br>
+@@ -415,7 +415,7 @@ xfce_mime_helper_execute (XfceMimeHelper&nbsp;&nbsp; *=
helper,<br>
+&nbsp;&nbsp; gint&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; st=
atus;<br>
+&nbsp;&nbsp; gint&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; re=
sult;<br>
+&nbsp;&nbsp; gint&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pi=
d;<br>
+-&nbsp; const gchar&nbsp; *real_parameter =3D parameter;<br>
++&nbsp; gchar&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *real_parameter =
=3D NULL;<br>
+ <br>
+&nbsp;&nbsp; // FIXME: startup-notification<br>
+ <br>
+@@ -427,23 +427,43 @@ xfce_mime_helper_execute (XfceMimeHelper&nbsp;&nbsp;=
 *helper,<br>
+&nbsp;&nbsp; if (G_UNLIKELY (screen =3D=3D NULL))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; screen =3D gdk_screen_get_default ();<br>
+ <br>
+-&nbsp; /* strip the mailto part if needed */<br>
+-&nbsp; if (real_parameter !=3D NULL &amp;&amp; g_str_has_prefix (real_par=
ameter, &quot;<a href=3D"mailto:">mailto:</a>&quot;))<br>
+-&nbsp;&nbsp;&nbsp; real_parameter =3D parameter + 7;<br>
++&nbsp; if (parameter !=3D NULL)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (helper-&gt;category =3D=3D XFCE_MIME_H=
ELPER_WEBBROWSER || helper-&gt;category =3D=3D XFCE_MIME_HELPER_FILEMANAGER=
)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* escape characte=
rs which do not belong into an URI/URL */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; real_parameter =3D=
 g_uri_escape_string (parameter, &quot;:/?#[]@!$&amp;'()*+,;=3D%&quot;, TRU=
E);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (g_str_has_prefix (real_parameter,=
 &quot;<a href=3D"mailto:">mailto:</a>&quot;))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* strip the mailt=
o part if needed */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; real_parameter =3D=
 g_strdup (parameter + 7);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; real_parameter =3D=
 g_strdup (parameter);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp; /* determine the command set to use */<br>
+-&nbsp; if (exo_str_is_flag (real_parameter)) {<br>
+-&nbsp;&nbsp;&nbsp; commands =3D helper-&gt;commands_with_flag;<br>
+-&nbsp; } else if (exo_str_is_empty (real_parameter)) {<br>
+-&nbsp;&nbsp;&nbsp; commands =3D helper-&gt;commands;<br>
+-&nbsp; } else {<br>
+-&nbsp;&nbsp;&nbsp; commands =3D helper-&gt;commands_with_parameter;<br>
+-&nbsp; }<br>
++&nbsp; if (exo_str_is_flag (real_parameter))<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commands =3D helper-&gt;commands_with_flag=
;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; else if (exo_str_is_empty (real_parameter))<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commands =3D helper-&gt;commands;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; else<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; commands =3D helper-&gt;commands_with_para=
meter;<br>
++&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+&nbsp;&nbsp; /* verify that we have atleast one command */<br>
+&nbsp;&nbsp; if (G_UNLIKELY (*commands =3D=3D NULL))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_set_error (error, G_SPAWN_ERROR, G_=
SPAWN_ERROR_INVAL, _(&quot;No command specified&quot;));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g_free (real_parameter);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return FALSE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ <br>
+@@ -533,6 +553,7 @@ xfce_mime_helper_execute (XfceMimeHelper&nbsp;&nbsp; *=
helper,<br>
+&nbsp;&nbsp; if (G_UNLIKELY (!succeed))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; g_propagate_error (error, err);<br>
+ <br>
++&nbsp; g_free (real_parameter);<br>
+&nbsp;&nbsp; return succeed;<br>
+ }<br>
+ <br>
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb=
 b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb<br>
index aa4265f7b..6757c48f4 100644<br>
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb<br>
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb<br>
@@ -8,7 +8,8 @@ inherit xfce features_check mime-xdg<br>
&nbsp;<br>
&nbsp;REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;<br>
&nbsp;<br>
-SRC_URI +=3D &quot;<a href=3D"file://0001-xsettings.xml-Set-default-themes=
.patch">file://0001-xsettings.xml-Set-default-themes.patch</a>&quot;<br>
+SRC_URI +=3D &quot;<a href=3D""></a>file://0001-xsettings.xml-Set-default-=
themes.patch \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2022-45062.patch&quot;">file://CVE-2022-45062.patch&quot;</a=
><br>
&nbsp;SRC_URI[sha256sum] =3D &quot;4dd7cb420860535e687f673c0b5c0274e0d2fb67=
181281d4b85be9197da03d7e&quot;<br>
&nbsp;<br>
&nbsp;EXTRA_OECONF +=3D &quot;--enable-maintainer-mode --disable-debug&quot=
;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822797EDBD52380B5FF2E5E841D9MW4PR11MB5822namp_--

