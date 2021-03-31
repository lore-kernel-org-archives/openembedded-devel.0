Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.87])
 by mx.groups.io with SMTP id smtpd.web11.9039.1617206685497401730
 for <Openembedded-devel@lists.openembedded.org>;
 Wed, 31 Mar 2021 09:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=DBef+CnC;
 spf=pass (domain: kpit.com, ip: 40.107.139.87, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/Bh1Ra4oppftKT0qpoLJF9ENmF7qCuUC/mifxVCJL3jS6RHJhY8n4oUo9q8+AxewGEC/WbqAJXszvLVIjQMxsqCSSTANx3xAugqTLhB2zM3GQyzl4Wt8QwMgLIjeqiUcwcQQhHvUgbOabLmRrSgP5deqblFZHDg0UiL50NXrGJc17BratViaZwm7YlpM0ySZRX7zRbbfLv/Y+awdrJyAGOCnGSRw4BGsu3ewj366JV/8w9y6nEIXhztbYwptiBD83ay6dfV6QTKJhnWsQcpjergFbJS80EvwRyLDtWaSiksrn1m862jVaMjk7mnXHM/QCvomiJDbsN8fVaMkGqyUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1HTY34WSoVbxckUJG1Y+vkVPZyjg2iaEBLL4WhSCoI=;
 b=HfSY5if/QLx3vXPGZSOTbuQqqGKLBqgKPszvCmC1j/Mlp7xR7RMOr5qRH30ZRWfLT3k/jraEjTYStpNMMPivy9E/gzLaLepFQGCLWMMIJL8O6p5ygqfJYWh0pCKZkaU6v0/Bn3DuQrN4RpSfQcfYoCoXndFby+6Ngd4xkwRxW/+ifcedJpJK5OMxA4bbgDvFm3J/Q/Wr7jznB6DDPOT4qwU5HJ/KpKdu2zcwK/STiRA5EwMTnWKmX3ntyz1iviVSPpL6Jeuf3LewfBnXSRNmAfPf/RoafIYnmc65NB3kMfaFd4zic4b4robzhJxvOzpVNgpPbrC5QbLcBhkazvy2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1HTY34WSoVbxckUJG1Y+vkVPZyjg2iaEBLL4WhSCoI=;
 b=DBef+CnChSeeBtAlU+JcGJlRkhLitFQpYBTCtEgjDJPw0ZBmJHVTU3SO1X2dxOdfJWYKDUk96xxHyrU/CdimVLM0yBkYVhVCzCwLmWuwsjvMzoTqQNp36uIoDDoNZLBdts7MV9EN9jp3S5Bg9LNhlMdKgKFq/az3k84xNWkWUpU=
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BM1PR0101MB1763.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:28::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Wed, 31 Mar
 2021 16:04:35 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 16:04:35 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Harpritkaur Bhandari
	<Harpritkaur.Bhandari@kpit.com>
Subject: Re: [meta-networking][meta-oe][dunfell][PATCH] dnsmasq: Add fixes for CVEs reported for dnsmasq
Thread-Topic: [meta-networking][meta-oe][dunfell][PATCH] dnsmasq: Add fixes
 for CVEs reported for dnsmasq
Thread-Index: AQHXG7WQPIA6yfIkU0u4Ln7Dfo+i36qeV38n
Date: Wed, 31 Mar 2021 16:04:33 +0000
Message-ID: 
 <BMXPR01MB32218FDFE45798C3EFEB9193997C9@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
References: <20210318051406.3607-1-Sana.Kazi@kpit.com>
In-Reply-To: <20210318051406.3607-1-Sana.Kazi@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
x-originating-ip: [2401:4900:5020:ea34:c967:f6eb:e575:7c30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34e96d00-b868-4803-a0b3-08d8f45eadb9
x-ms-traffictypediagnostic: BM1PR0101MB1763:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR0101MB17634EF22710E67E5B697FC5997C9@BM1PR0101MB1763.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 p57vIyMzsGtN9H0YuxmIzUK1rKGB4cyTUbdclnDRTizdvZ6bfl7Qj1s8T/SwP0I4lGZUSbaXyqyw2p4zuC/wHmUnCddBdKxyi277L8EXsEGvXTVgR7Y9S0WLhdGQdopb4mRXY7Q5C+mzrDD9T4kaPUZq3buW4nFLa/XeBYKNN5TM1kvqnYimfHXMIBDM443AnsIaNk8HJf8M4TlHudmcTmpGviEv4sRBKgDgDiPYD1wFNZTaSp75CzrCAEXSWTmva7bh61FV8WupS3g7JT15xsCPCncVrPMdAECEbhQvtI9G19sug2zQgiIghHqHy6JgTlno+XWowBR2xyLJupQUPBtg/a1UuEC4Bldxw4TOJCT3d7Lqd2jxrXcKXsjoktq2ErGNasX5m9AwX7ecMmY3OPF7hFj644Rdmv+zV7QE+VPX1DOLu+rL6tIXs9/hKGTB75P84jbN2TgNpRR3nx3cGHsu2I+4vyXTSmToueFE6lBoVrsSQKAPoqqy+9N3B907S8cNQkhKj5ABdygSAoHPpxyTVei/3LVrz0CUS/eqgTmslS3wajDdnVDPwJpcoq9/bS+eTx/BC2cWHZR8Uz8jwQZyjXVfSKl70o1f3VzT0DaevPGK31DC77J1XRARvVTV2esWOpBPKTWK6bPI/pmqRCjPCoFMbDwOmYcj/m5oX87qGImGovyp+UCsRVcw/Q9uxYOMK/EOQA2UBqisVVnb91r9drw7EJJ0ga8Jfs6lfB+VGArvq9UiU09EeVvNTo6r
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39850400004)(54906003)(166002)(6506007)(8936002)(53546011)(55016002)(83380400001)(86362001)(316002)(5660300002)(8676002)(7696005)(107886003)(2906002)(9686003)(4326008)(30864003)(19627405001)(478600001)(66574015)(33656002)(71200400001)(52536014)(66476007)(66946007)(64756008)(76116006)(66446008)(91956017)(66556008)(110136005)(186003)(38100700001)(966005)(2004002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?PljVH+S3C6TPbTQMk8J/nwKKZHWwRP996GXZ/OUhjvYtjQUOxZlK4lBVM1jU?=
 =?us-ascii?Q?SHyfD0Iu1vpw9hHbe3OmIhUVgIfyS0YFsSjO1fDhswenCo8scDNoSz7Nutkr?=
 =?us-ascii?Q?rcZP+gbG5+hqvfZHtfXIOd57qFiljnW48SN6DEYRpgngYiYTMKo3DlDrFmXF?=
 =?us-ascii?Q?aTa95htsiY3KpeTjgpmcQe7MBQImEVe5NDNEA7Cwkk0smdXrWqo4JMCFdk2L?=
 =?us-ascii?Q?uXdPcg9jDo3AeF69yH2l01XBxTQMu3SFO6taRViF8R6MMrov4e8lXKTHJB98?=
 =?us-ascii?Q?GKJWIJVKwWEliy8ZpDBxisRoHLxlxSRI2v/B/2Nqb1c07SJRoX2fLg3pvOUR?=
 =?us-ascii?Q?qPXA0Uh7hzVbPnjZoTvY4Az9BnJh82FYHgm/w/9X7GfgqCR+CmTdhqioaby9?=
 =?us-ascii?Q?Zs4eMY+nWDLzimjCuFnuspOJRXRTEAvA5hDuLM7/eFVBUXdl6AUIqLfroHHH?=
 =?us-ascii?Q?wPHEWHOPqQ8l3+os6Bu7EXR7GBgDqJzxvx1D6xdxLFbatHKUg/+GefVPCtqu?=
 =?us-ascii?Q?1KUrKl1BxRHNzarK5pdElEgGctX0Vglnxv0SxsJUtBOHEtL+Pq08kwyUaRsf?=
 =?us-ascii?Q?FzOdWZB5z0FFxvTxY8Edj9Hmmge/JyehAaM8krlo8Gn71Qodf9v9ewA9nnt6?=
 =?us-ascii?Q?7DjyfFDP6zO3H2L63/Vb7tIviA41NXy8dm+1OCBnslBHddx11TYp77KzmdND?=
 =?us-ascii?Q?MhMRP3S3mF/IX2yoHdrOo1r8W53ABbb72cfmrSj73oWZUs9ANSHHMUnwV2N3?=
 =?us-ascii?Q?4dr9nBZ8FmkUJC4V84qxr7yCCr6gP2TFYKbugNZj8iJZgjpOcR4gvctp3EN+?=
 =?us-ascii?Q?45h789azqzD0l2Ml2sOdZrE5bOay9BD5XI1krx0HS1O69NKyzWYAJRfBiQNm?=
 =?us-ascii?Q?DkgwuFYh6lqwVPzkkTnY2fvcnAOrrLuEo1DGUaiLkXD7TAmn9b5gSTPBhC5h?=
 =?us-ascii?Q?sf/XmsdVp1ln8JVzq28EdnvcLHBPz4tw3UaJCK6jmphvgfpxAje+c+XwDUjH?=
 =?us-ascii?Q?dAL4vdGPhtL66X8p2BUhFLmg1WQNI0J2aJuzreAFGxKPVlq9Px3lIX+K3aO2?=
 =?us-ascii?Q?8BGKQiWgVM3bbAZ7ooMOHLRAkju6oSt2A7hyyWSfkgjh5ezmQ60FvGgdVZGq?=
 =?us-ascii?Q?+CW4kAlk5S891xdpfjQ3wWpqx7TihIB0kvYzKyxx5kd1KB/sR00LtVuDrSGb?=
 =?us-ascii?Q?I1nOVcMoj8+lc27dFofxVagI7fbicKa2OivpbJqN1PnZ5byxctq9IG2s82/o?=
 =?us-ascii?Q?KWJpnIJDpZbMgr0GfCNx+QqsoBojYLEqKlMO2NQU9CMbgNg7h3j7nPjXF673?=
 =?us-ascii?Q?F7dWGZC9YK4zDoge3O7YQLPorfVqyGDoLNvtdIPhor1NKEtHYZffVt0+II6W?=
 =?us-ascii?Q?WINYUnsZ5HUSHjs5dCEWTPqtdNc9?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e96d00-b868-4803-a0b3-08d8f45eadb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2021 16:04:33.9399
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtjLdneBCb6Si71uFGF3FJ/+Heh/sMIsWcHRcJHZEu7c+dzawsDMnlMmUNODGcgf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1763
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB32218FDFE45798C3EFEB9193997C9BMXPR01MB3221INDP_"

--_000_BMXPR01MB32218FDFE45798C3EFEB9193997C9BMXPR01MB3221INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Could you please review below patch to be upstreamed for dnsmasq?

 Thanks & Regards,

 Sana Kazi
 KPIT Technologies Limited

________________________________
From: Sana Kazi <Sana.Kazi@kpit.com>
Sent: Thursday, March 18, 2021 10:44 AM
To: Openembedded-devel@lists.openembedded.org <Openembedded-devel@lists.ope=
nembedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Harpritkaur Bhandari <Harprit=
kaur.Bhandari@kpit.com>
Subject: [meta-networking][meta-oe][dunfell][PATCH] dnsmasq: Add fixes for =
CVEs reported for dnsmasq

Applied single patch for below listed CVEs which avoids remote
attacker to overwrite memory:
CVE-2020-25681
CVE-2020-25682
CVE-2020-25683
CVE-2020-25687
as they are fixed by single commit
http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dcommit;h=3D4e96a4be685=
c9e4445f6ee79ad0b36b9119b502a
Link: https://www.openwall.com/lists/oss-security/2021/01/19/1

Also, applied patch for below listed CVEs:

CVE-2020-25684
CVE-2020-25685
CVE-2020-25686

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
---
 .../recipes-support/dnsmasq/dnsmasq_2.81.bb   |   7 +-
 .../dnsmasq/files/CVE-2020-25681.patch        | 373 +++++++++++
 .../dnsmasq/files/CVE-2020-25684.patch        | 100 +++
 .../dnsmasq/files/CVE-2020-25685-1.patch      | 590 ++++++++++++++++++
 .../dnsmasq/files/CVE-2020-25685-2.patch      | 201 ++++++
 .../dnsmasq/files/CVE-2020-25686-1.patch      | 335 ++++++++++
 .../dnsmasq/files/CVE-2020-25686-2.patch      |  66 ++
 7 files changed, 1671 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25681.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25684.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25685-1.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25685-2.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25686-1.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2020-=
25686-2.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta=
-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
index 92415386c..a1dc0f3a0 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb
@@ -4,5 +4,10 @@ SRC_URI[dnsmasq-2.81.md5sum] =3D "e43808177a773014b5892ccb=
a238f7a8"
 SRC_URI[dnsmasq-2.81.sha256sum] =3D "3c28c68c6c2967c3a96e9b432c0c046a5df17=
a426d3a43cffe9e693cf05804d0"
 SRC_URI +=3D "\
     file://lua.patch \
+    file://CVE-2020-25681.patch \
+    file://CVE-2020-25684.patch \
+    file://CVE-2020-25685-1.patch \
+    file://CVE-2020-25685-2.patch \
+    file://CVE-2020-25686-1.patch \
+    file://CVE-2020-25686-2.patch \
 "
-
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.p=
atch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch
new file mode 100644
index 000000000..cab734ed1
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch
@@ -0,0 +1,373 @@
+From 4e96a4be685c9e4445f6ee79ad0b36b9119b502a Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 11 Nov 2020 23:25:04 +0000
+Subject: [PATCH] Fix remote buffer overflow CERT VU#434904
+
+The problem is in the sort_rrset() function and allows a remote
+attacker to overwrite memory. Any dnsmasq instance with DNSSEC
+enabled is vulnerable.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ CHANGELOG    |   7 +-
+ src/dnssec.c | 273 ++++++++++++++++++++++++++++-----------------------
+ 2 files changed, 158 insertions(+), 122 deletions(-)
+
+CVE: CVE-2020-25681
+CVE: CVE-2020-25682
+CVE: CVE-2020-25683
+CVE: CVE-2020-25687
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dpatch;h=3D4e96a4be685c9e4445f6ee79ad0b36b9119b502a]
+Comment: No change in any hunk
+
+diff --git a/src/dnssec.c b/src/dnssec.c
+index db5c2d1..e95aa34 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -223,138 +223,147 @@ static int check_date_range(unsigned long curtime,=
 u32 date_start, u32 date_end)
+     && serial_compare_32(curtime, date_end) =3D=3D SERIAL_LT;
+ }
+
+-/* Return bytes of canonicalised rdata, when the return value is zero, th=
e remaining
+-   data, pointed to by *p, should be used raw. */
+-static int get_rdata(struct dns_header *header, size_t plen, unsigned cha=
r *end, char *buff, int bufflen,
+-                   unsigned char **p, u16 **desc)
++/* Return bytes of canonicalised rrdata one by one.
++   Init state->ip with the RR, and state->end with the end of same.
++   Init state->op to NULL.
++   Init state->desc to RR descriptor.
++   Init state->buff with a MAXDNAME * 2 buffer.
++
++   After each call which returns 1, state->op points to the next byte of =
data.
++   On returning 0, the end has been reached.
++*/
++struct rdata_state {
++  u16 *desc;
++  size_t c;
++  unsigned char *end, *ip, *op;
++  char *buff;
++};
++
++static int get_rdata(struct dns_header *header, size_t plen, struct rdata=
_state *state)
+ {
+-  int d =3D **desc;
++  int d;
+
+-  /* No more data needs mangling */
+-  if (d =3D=3D (u16)-1)
++  if (state->op && state->c !=3D 1)
+     {
+-      /* If there's more data than we have space for, just return what fi=
ts,
+-       we'll get called again for more chunks */
+-      if (end - *p > bufflen)
+-      {
+-        memcpy(buff, *p, bufflen);
+-        *p +=3D bufflen;
+-        return bufflen;
+-      }
+-
+-      return 0;
++      state->op++;
++      state->c--;
++      return 1;
+     }
+-
+-  (*desc)++;
+-
+-  if (d =3D=3D 0 && extract_name(header, plen, p, buff, 1, 0))
+-    /* domain-name, canonicalise */
+-    return to_wire(buff);
+-  else
+-    {
+-      /* plain data preceding a domain-name, don't run off the end of the=
 data */
+-      if ((end - *p) < d)
+-      d =3D end - *p;
++
++  while (1)
++    {
++      d =3D *(state->desc);
+
+-      if (d !=3D 0)
++      if (d =3D=3D (u16)-1)
+        {
+-        memcpy(buff, *p, d);
+-        *p +=3D d;
++        /* all the bytes to the end. */
++        if ((state->c =3D state->end - state->ip) !=3D 0)
++          {
++            state->op =3D state->ip;
++            state->ip =3D state->end;;
++          }
++        else
++          return 0;
++      }
++      else
++      {
++        state->desc++;
++
++        if (d =3D=3D (u16)0)
++          {
++            /* domain-name, canonicalise */
++            int len;
++
++            if (!extract_name(header, plen, &state->ip, state->buff, 1, 0=
) ||
++                (len =3D to_wire(state->buff)) =3D=3D 0)
++              continue;
++
++            state->c =3D len;
++            state->op =3D (unsigned char *)state->buff;
++          }
++        else
++          {
++            /* plain data preceding a domain-name, don't run off the end =
of the data */
++            if ((state->end - state->ip) < d)
++              d =3D state->end - state->ip;
++
++            if (d =3D=3D 0)
++              continue;
++
++            state->op =3D state->ip;
++            state->c =3D d;
++            state->ip +=3D d;
++          }
+        }
+
+-      return d;
++      return 1;
+     }
+ }
+
+-/* Bubble sort the RRset into the canonical order.
+-   Note that the byte-streams from two RRs may get unsynced: consider
+-   RRs which have two domain-names at the start and then other data.
+-   The domain-names may have different lengths in each RR, but sort equal
+-
+-   ------------
+-   |abcde|fghi|
+-   ------------
+-   |abcd|efghi|
+-   ------------
+-
+-   leaving the following bytes as deciding the order. Hence the nasty lef=
t1 and left2 variables.
+-*/
++/* Bubble sort the RRset into the canonical order. */
+
+ static int sort_rrset(struct dns_header *header, size_t plen, u16 *rr_des=
c, int rrsetidx,
+                      unsigned char **rrset, char *buff1, char *buff2)
+ {
+-  int swap, quit, i, j;
++  int swap, i, j;
+
+   do
+     {
+       for (swap =3D 0, i =3D 0; i < rrsetidx-1; i++)
+        {
+-        int rdlen1, rdlen2, left1, left2, len1, len2, len, rc;
+-        u16 *dp1, *dp2;
+-        unsigned char *end1, *end2;
++        int rdlen1, rdlen2;
++        struct rdata_state state1, state2;
++
+          /* Note that these have been determined to be OK previously,
+             so we don't need to check for NULL return here. */
+-        unsigned char *p1 =3D skip_name(rrset[i], header, plen, 10);
+-        unsigned char *p2 =3D skip_name(rrset[i+1], header, plen, 10);
+-
+-        p1 +=3D 8; /* skip class, type, ttl */
+-        GETSHORT(rdlen1, p1);
+-        end1 =3D p1 + rdlen1;
+-
+-        p2 +=3D 8; /* skip class, type, ttl */
+-        GETSHORT(rdlen2, p2);
+-        end2 =3D p2 + rdlen2;
++        state1.ip =3D skip_name(rrset[i], header, plen, 10);
++        state2.ip =3D skip_name(rrset[i+1], header, plen, 10);
++        state1.op =3D state2.op =3D NULL;
++        state1.buff =3D buff1;
++        state2.buff =3D buff2;
++        state1.desc =3D state2.desc =3D rr_desc;
+
+-        dp1 =3D dp2 =3D rr_desc;
++        state1.ip +=3D 8; /* skip class, type, ttl */
++        GETSHORT(rdlen1, state1.ip);
++        if (!CHECK_LEN(header, state1.ip, plen, rdlen1))
++          return rrsetidx; /* short packet */
++        state1.end =3D state1.ip + rdlen1;
+
+-        for (quit =3D 0, left1 =3D 0, left2 =3D 0, len1 =3D 0, len2 =3D 0=
; !quit;)
++        state2.ip +=3D 8; /* skip class, type, ttl */
++        GETSHORT(rdlen2, state2.ip);
++        if (!CHECK_LEN(header, state2.ip, plen, rdlen2))
++          return rrsetidx; /* short packet */
++        state2.end =3D state2.ip + rdlen2;
++
++        while (1)
+            {
+-            if (left1 !=3D 0)
+-              memmove(buff1, buff1 + len1 - left1, left1);
++            int ok1, ok2;
+
+-            if ((len1 =3D get_rdata(header, plen, end1, buff1 + left1, (M=
AXDNAME * 2) - left1, &p1, &dp1)) =3D=3D 0)
+-              {
+-                quit =3D 1;
+-                len1 =3D end1 - p1;
+-                memcpy(buff1 + left1, p1, len1);
+-              }
+-            len1 +=3D left1;
+-
+-            if (left2 !=3D 0)
+-              memmove(buff2, buff2 + len2 - left2, left2);
+-
+-            if ((len2 =3D get_rdata(header, plen, end2, buff2 + left2, (M=
AXDNAME *2) - left2, &p2, &dp2)) =3D=3D 0)
+-              {
+-                quit =3D 1;
+-                len2 =3D end2 - p2;
+-                memcpy(buff2 + left2, p2, len2);
+-              }
+-            len2 +=3D left2;
+-
+-            if (len1 > len2)
+-              left1 =3D len1 - len2, left2 =3D 0, len =3D len2;
+-            else
+-              left2 =3D len2 - len1, left1 =3D 0, len =3D len1;
+-
+-            rc =3D (len =3D=3D 0) ? 0 : memcmp(buff1, buff2, len);
+-
+-            if (rc > 0 || (rc =3D=3D 0 && quit && len1 > len2))
+-              {
+-                unsigned char *tmp =3D rrset[i+1];
+-                rrset[i+1] =3D rrset[i];
+-                rrset[i] =3D tmp;
+-                swap =3D quit =3D 1;
+-              }
+-            else if (rc =3D=3D 0 && quit && len1 =3D=3D len2)
++            ok1 =3D get_rdata(header, plen, &state1);
++            ok2 =3D get_rdata(header, plen, &state2);
++
++            if (!ok1 && !ok2)
+                {
+                  /* Two RRs are equal, remove one copy. RFC 4034, para 6.=
3 */
+                  for (j =3D i+1; j < rrsetidx-1; j++)
+                    rrset[j] =3D rrset[j+1];
+                  rrsetidx--;
+                  i--;
++                break;
++              }
++            else if (ok1 && (!ok2 || *state1.op > *state2.op))
++              {
++                unsigned char *tmp =3D rrset[i+1];
++                rrset[i+1] =3D rrset[i];
++                rrset[i] =3D tmp;
++                swap =3D 1;
++                break;
+                }
+-            else if (rc < 0)
+-              quit =3D 1;
++            else if (ok2 && (!ok1 || *state2.op > *state1.op))
++              break;
++
++            /* arrive here when bytes are equal, go round the loop again
++               and compare the next ones. */
+            }
+        }
+     } while (swap);
+@@ -569,15 +578,18 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in
+       wire_len =3D to_wire(keyname);
+       hash->update(ctx, (unsigned int)wire_len, (unsigned char*)keyname);
+       from_wire(keyname);
++
++#define RRBUFLEN 300 /* Most RRs are smaller than this. */
+
+       for (i =3D 0; i < rrsetidx; ++i)
+        {
+-        int seg;
+-        unsigned char *end, *cp;
+-        u16 len, *dp;
++        int j;
++        struct rdata_state state;
++        u16 len;
++        unsigned char rrbuf[RRBUFLEN];
+
+          p =3D rrset[i];
+-
++
+          if (!extract_name(header, plen, &p, name, 1, 10))
+            return STAT_BOGUS;
+
+@@ -586,12 +598,11 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in
+          /* if more labels than in RRsig name, hash *.<no labels in rrsig=
 labels field>  4035 5.3.2 */
+          if (labels < name_labels)
+            {
+-            int k;
+-            for (k =3D name_labels - labels; k !=3D 0; k--)
++            for (j =3D name_labels - labels; j !=3D 0; j--)
+                {
+                  while (*name_start !=3D '.' && *name_start !=3D 0)
+                    name_start++;
+-                if (k !=3D 1 && *name_start =3D=3D '.')
++                if (j !=3D 1 && *name_start =3D=3D '.')
+                    name_start++;
+                }
+
+@@ -612,24 +623,44 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in
+          if (!CHECK_LEN(header, p, plen, rdlen))
+            return STAT_BOGUS;
+
+-        end =3D p + rdlen;
++        /* canonicalise rdata and calculate length of same, use
++           name buffer as workspace for get_rdata. */
++        state.ip =3D p;
++        state.op =3D NULL;
++        state.desc =3D rr_desc;
++        state.buff =3D name;
++        state.end =3D p + rdlen;
+
+-        /* canonicalise rdata and calculate length of same, use name buff=
er as workspace.
+-           Note that name buffer is twice MAXDNAME long in DNSSEC mode. *=
/
+-        cp =3D p;
+-        dp =3D rr_desc;
+-        for (len =3D 0; (seg =3D get_rdata(header, plen, end, name, MAXDN=
AME * 2, &cp, &dp)) !=3D 0; len +=3D seg);
+-        len +=3D end - cp;
+-        len =3D htons(len);
++        for (j =3D 0; get_rdata(header, plen, &state); j++)
++          if (j < RRBUFLEN)
++            rrbuf[j] =3D *state.op;
++
++        len =3D htons((u16)j);
+          hash->update(ctx, 2, (unsigned char *)&len);
++
++        /* If the RR is shorter than RRBUFLEN (most of them, in practice)
++           then we can just digest it now. If it exceeds RRBUFLEN we have=
 to
++           go back to the start and do it in chunks. */
++        if (j >=3D RRBUFLEN)
++          {
++            state.ip =3D p;
++            state.op =3D NULL;
++            state.desc =3D rr_desc;
++
++            for (j =3D 0; get_rdata(header, plen, &state); j++)
++              {
++                 rrbuf[j] =3D *state.op;
++
++                 if (j =3D=3D RRBUFLEN - 1)
++                   {
++                     hash->update(ctx, RRBUFLEN, rrbuf);
++                     j =3D -1;
++                   }
++              }
++          }
+
+-        /* Now canonicalise again and digest. */
+-        cp =3D p;
+-        dp =3D rr_desc;
+-        while ((seg =3D get_rdata(header, plen, end, name, MAXDNAME * 2, =
&cp, &dp)))
+-          hash->update(ctx, seg, (unsigned char *)name);
+-        if (cp !=3D end)
+-          hash->update(ctx, end - cp, cp);
++        if (j !=3D 0)
++          hash->update(ctx, j, rrbuf);
+        }
+
+       hash->digest(ctx, hash->digest_size, digest);
+--
+2.20.1
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.p=
atch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch
new file mode 100644
index 000000000..64ebed257
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch
@@ -0,0 +1,100 @@
+From 257ac0c5f7732cbc6aa96fdd3b06602234593aca Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Thu, 12 Nov 2020 18:49:23 +0000
+Subject: [PATCH] Check destination of DNS UDP query replies.
+
+At any time, dnsmasq will have a set of sockets open, bound to
+random ports, on which it sends queries to upstream nameservers.
+This patch fixes the existing problem that a reply for ANY in-flight
+query would be accepted via ANY open port, which increases the
+chances of an attacker flooding answers "in the blind" in an
+attempt to poison the DNS cache. CERT VU#434904 refers.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ CHANGELOG     |  6 +++++-
+ src/forward.c | 37 ++++++++++++++++++++++++++++---------
+ 2 files changed, 33 insertions(+), 10 deletions(-)
+
+CVE: CVE-2020-25684
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dpatch;h=3D257ac0c5f7732cbc6aa96fdd3b06602234593aca]
+Comment: No change in any hunk
+
+diff --git a/src/forward.c b/src/forward.c
+index 9c2b2c6..134e0fc 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -16,7 +16,7 @@
+
+ #include "dnsmasq.h"
+
+-static struct frec *lookup_frec(unsigned short id, void *hash);
++static struct frec *lookup_frec(unsigned short id, int fd, int family, vo=
id *hash);
+ static struct frec *lookup_frec_by_sender(unsigned short id,
+                                          union mysockaddr *addr,
+                                          void *hash);
+@@ -805,7 +805,7 @@ void reply_query(int fd, int family, time_t now)
+   crc =3D questions_crc(header, n, daemon->namebuff);
+ #endif
+
+-  if (!(forward =3D lookup_frec(ntohs(header->id), hash)))
++  if (!(forward =3D lookup_frec(ntohs(header->id), fd, family, hash)))
+     return;
+
+ #ifdef HAVE_DUMPFILE
+@@ -2339,14 +2339,25 @@ struct frec *get_new_frec(time_t now, int *wait, s=
truct frec *force)
+ }
+
+ /* crc is all-ones if not known. */
+-static struct frec *lookup_frec(unsigned short id, void *hash)
++static struct frec *lookup_frec(unsigned short id, int fd, int family, vo=
id *hash)
+ {
+   struct frec *f;
+
+   for(f =3D daemon->frec_list; f; f =3D f->next)
+     if (f->sentto && f->new_id =3D=3D id &&
+        (!hash || memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0))
+-      return f;
++      {
++      /* sent from random port */
++      if (family =3D=3D AF_INET && f->rfd4 && f->rfd4->fd =3D=3D fd)
++        return f;
++
++      if (family =3D=3D AF_INET6 && f->rfd6 && f->rfd6->fd =3D=3D fd)
++        return f;
++
++      /* sent to upstream from bound socket. */
++      if (f->sentto->sfd && f->sentto->sfd->fd =3D=3D fd)
++        return f;
++      }
+
+   return NULL;
+ }
+@@ -2407,12 +2418,20 @@ void server_gone(struct server *server)
+ static unsigned short get_id(void)
+ {
+   unsigned short ret =3D 0;
++  struct frec *f;
+
+-  do
+-    ret =3D rand16();
+-  while (lookup_frec(ret, NULL));
+-
+-  return ret;
++  while (1)
++    {
++      ret =3D rand16();
++
++      /* ensure id is unique. */
++      for (f =3D daemon->frec_list; f; f =3D f->next)
++      if (f->sentto && f->new_id =3D=3D ret)
++        break;
++
++      if (!f)
++      return ret;
++    }
+ }
+
+
+--
+2.20.1
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.pat=
ch
new file mode 100644
index 000000000..a8d9b7e3f
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.patch
@@ -0,0 +1,590 @@
+From 2d765867c597db18be9d876c9c17e2c0fe1953cd Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Thu, 12 Nov 2020 22:06:07 +0000
+Subject: [PATCH] Use SHA-256 to provide security against DNS cache poisoni=
ng.
+
+Use the SHA-256 hash function to verify that DNS answers
+received are for the questions originally asked. This replaces
+the slightly insecure SHA-1 (when compiled with DNSSEC) or
+the very insecure CRC32 (otherwise). Refer: CERT VU#434904.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ CHANGELOG            |   5 +
+ Makefile             |   3 +-
+ bld/Android.mk       |   2 +-
+ src/dnsmasq.h        |  11 +-
+ src/dnssec.c         |  31 -----
+ src/forward.c        |  43 ++-----
+ src/hash_questions.c | 281 +++++++++++++++++++++++++++++++++++++++++++
+ src/rfc1035.c        |  49 --------
+ 8 files changed, 301 insertions(+), 124 deletions(-)
+ create mode 100644 src/hash_questions.c
+
+CVE: CVE-2020-25685
+Upstream-Status: Backport []http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dcommit;h=3D2d765867c597db18be9d876c9c17e2c0fe1953cd]
+Comment: No change in any hunk
+
+diff --git a/Makefile b/Makefile
+index 78e25f0..0354e0f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -77,7 +77,8 @@ objs =3D cache.o rfc1035.o util.o option.o forward.o net=
work.o \
+        helper.o tftp.o log.o conntrack.o dhcp6.o rfc3315.o \
+        dhcp-common.o outpacket.o radv.o slaac.o auth.o ipset.o \
+        domain.o dnssec.o blockdata.o tables.o loop.o inotify.o \
+-       poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o metrics.o
++       poll.o rrfilter.o edns0.o arp.o crypto.o dump.o ubus.o \
++       metrics.o hash_questions.o
+
+ hdrs =3D dnsmasq.h config.h dhcp-protocol.h dhcp6-protocol.h \
+        dns-protocol.h radv-protocol.h ip6addr.h metrics.h
+diff --git a/bld/Android.mk b/bld/Android.mk
+index 080a615..f924be9 100644
+--- a/bld/Android.mk
++++ b/bld/Android.mk
+@@ -11,7 +11,7 @@ LOCAL_SRC_FILES :=3D  bpf.c cache.c dbus.c dhcp.c dnsmas=
q.c \
+                    radv.c slaac.c auth.c ipset.c domain.c \
+                    dnssec.c dnssec-openssl.c blockdata.c tables.c \
+                    loop.c inotify.c poll.c rrfilter.c edns0.c arp.c \
+-                  crypto.c dump.c ubus.c
++                  crypto.c dump.c ubus.c metrics.c hash_questions.c
+
+ LOCAL_MODULE :=3D dnsmasq
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 4d78c37..0a7639f 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -655,11 +655,7 @@ struct hostsfile {
+ #define FREC_TEST_PKTSZ       256
+ #define FREC_HAS_EXTRADATA    512
+
+-#ifdef HAVE_DNSSEC
+-#define HASH_SIZE 20 /* SHA-1 digest size */
+-#else
+-#define HASH_SIZE sizeof(int)
+-#endif
++#define HASH_SIZE 32 /* SHA-256 digest size */
+
+ struct frec {
+   union mysockaddr source;
+@@ -1229,7 +1225,6 @@ int check_for_bogus_wildcard(struct dns_header *head=
er, size_t qlen, char *name,
+                             struct bogus_addr *baddr, time_t now);
+ int check_for_ignored_address(struct dns_header *header, size_t qlen, str=
uct bogus_addr *baddr);
+ int check_for_local_domain(char *name, time_t now);
+-unsigned int questions_crc(struct dns_header *header, size_t plen, char *=
name);
+ size_t resize_packet(struct dns_header *header, size_t plen,
+                  unsigned char *pheader, size_t hlen);
+ int add_resource_record(struct dns_header *header, char *limit, int *trun=
cp,
+@@ -1254,9 +1249,11 @@ int dnssec_validate_reply(time_t now, struct dns_he=
ader *header, size_t plen, ch
+                          int check_unsigned, int *neganswer, int *nons, i=
nt *nsec_ttl);
+ int dnskey_keytag(int alg, int flags, unsigned char *key, int keylen);
+ size_t filter_rrsigs(struct dns_header *header, size_t plen);
+-unsigned char* hash_questions(struct dns_header *header, size_t plen, cha=
r *name);
+ int setup_timestamp(void);
+
++/* hash_questions.c */
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name);
++
+ /* crypto.c */
+ const struct nettle_hash *hash_find(char *name);
+ int hash_init(const struct nettle_hash *hash, void **ctxp, unsigned char =
**digestp);
+diff --git a/src/dnssec.c b/src/dnssec.c
+index e95aa34..9410a7e 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -2087,35 +2087,4 @@ size_t dnssec_generate_query(struct dns_header *hea=
der, unsigned char *end, char
+   return ret;
+ }
+
+-unsigned char* hash_questions(struct dns_header *header, size_t plen, cha=
r *name)
+-{
+-  int q;
+-  unsigned int len;
+-  unsigned char *p =3D (unsigned char *)(header+1);
+-  const struct nettle_hash *hash;
+-  void *ctx;
+-  unsigned char *digest;
+-
+-  if (!(hash =3D hash_find("sha1")) || !hash_init(hash, &ctx, &digest))
+-    return NULL;
+-
+-  for (q =3D ntohs(header->qdcount); q !=3D 0; q--)
+-    {
+-      if (!extract_name(header, plen, &p, name, 1, 4))
+-      break; /* bad packet */
+-
+-      len =3D to_wire(name);
+-      hash->update(ctx, len, (unsigned char *)name);
+-      /* CRC the class and type as well */
+-      hash->update(ctx, 4, p);
+-
+-      p +=3D 4;
+-      if (!CHECK_LEN(header, p, plen, 0))
+-      break; /* bad packet */
+-    }
+-
+-  hash->digest(ctx, hash->digest_size, digest);
+-  return digest;
+-}
+-
+ #endif /* HAVE_DNSSEC */
+diff --git a/src/forward.c b/src/forward.c
+index 134e0fc..4f9a963 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -256,19 +256,16 @@ static int forward_query(int udpfd, union mysockaddr=
 *udpaddr,
+   union all_addr *addrp =3D NULL;
+   unsigned int flags =3D 0;
+   struct server *start =3D NULL;
+-#ifdef HAVE_DNSSEC
+   void *hash =3D hash_questions(header, plen, daemon->namebuff);
++#ifdef HAVE_DNSSEC
+   int do_dnssec =3D 0;
+-#else
+-  unsigned int crc =3D questions_crc(header, plen, daemon->namebuff);
+-  void *hash =3D &crc;
+ #endif
+   unsigned int gotname =3D extract_request(header, plen, daemon->namebuff=
, NULL);
+   unsigned char *oph =3D find_pseudoheader(header, plen, NULL, NULL, NULL=
, NULL);
+   (void)do_bit;
+
+   /* may be no servers available. */
+-  if (forward || (hash && (forward =3D lookup_frec_by_sender(ntohs(header=
->id), udpaddr, hash))))
++  if (forward || (forward =3D lookup_frec_by_sender(ntohs(header->id), ud=
paddr, hash)))
+     {
+       /* If we didn't get an answer advertising a maximal packet in EDNS,
+         fall back to 1280, which should work everywhere on IPv6.
+@@ -769,9 +766,6 @@ void reply_query(int fd, int family, time_t now)
+   size_t nn;
+   struct server *server;
+   void *hash;
+-#ifndef HAVE_DNSSEC
+-  unsigned int crc;
+-#endif
+
+   /* packet buffer overwritten */
+   daemon->srv_save =3D NULL;
+@@ -798,12 +792,7 @@ void reply_query(int fd, int family, time_t now)
+   if (difftime(now, server->pktsz_reduced) > UDP_TEST_TIME)
+     server->edns_pktsz =3D daemon->edns_pktsz;
+
+-#ifdef HAVE_DNSSEC
+   hash =3D hash_questions(header, n, daemon->namebuff);
+-#else
+-  hash =3D &crc;
+-  crc =3D questions_crc(header, n, daemon->namebuff);
+-#endif
+
+   if (!(forward =3D lookup_frec(ntohs(header->id), fd, family, hash)))
+     return;
+@@ -1115,8 +1104,7 @@ void reply_query(int fd, int family, time_t now)
+                        log_query(F_NOEXTRA | F_DNSSEC | F_IPV6, daemon->k=
eyname, (union all_addr *)&(server->addr.in6.sin6_addr),
+                                  querystr("dnssec-query", querytype));
+
+-                    if ((hash =3D hash_questions(header, nn, daemon->name=
buff)))
+-                      memcpy(new->hash, hash, HASH_SIZE);
++                    memcpy(new->hash, hash_questions(header, nn, daemon->=
namebuff), HASH_SIZE);
+                      new->new_id =3D get_id();
+                      header->id =3D htons(new->new_id);
+                      /* Save query for retransmission */
+@@ -1970,15 +1958,9 @@ unsigned char *tcp_request(int confd, time_t now,
+              if (!flags && last_server)
+                {
+                  struct server *firstsendto =3D NULL;
+-#ifdef HAVE_DNSSEC
+-                unsigned char *newhash, hash[HASH_SIZE];
+-                if ((newhash =3D hash_questions(header, (unsigned int)siz=
e, daemon->namebuff)))
+-                  memcpy(hash, newhash, HASH_SIZE);
+-                else
+-                  memset(hash, 0, HASH_SIZE);
+-#else
+-                unsigned int crc =3D questions_crc(header, (unsigned int)=
size, daemon->namebuff);
+-#endif
++                unsigned char hash[HASH_SIZE];
++                memcpy(hash, hash_questions(header, (unsigned int)size, d=
aemon->namebuff), HASH_SIZE);
++
+                  /* Loop round available servers until we succeed in conn=
ecting to one.
+                     Note that this code subtly ensures that consecutive q=
ueries on this connection
+                     which can go to the same server, do so. */
+@@ -2117,20 +2099,11 @@ unsigned char *tcp_request(int confd, time_t now,
+                      /* If the crc of the question section doesn't match =
the crc we sent, then
+                         someone might be attempting to insert bogus value=
s into the cache by
+                         sending replies containing questions and bogus an=
swers. */
+-#ifdef HAVE_DNSSEC
+-                    newhash =3D hash_questions(header, (unsigned int)m, d=
aemon->namebuff);
+-                    if (!newhash || memcmp(hash, newhash, HASH_SIZE) !=3D=
 0)
++                    if (memcmp(hash, hash_questions(header, (unsigned int=
)m, daemon->namebuff), HASH_SIZE) !=3D 0)
+                        {
+                          m =3D 0;
+                          break;
+                        }
+-#else
+-                    if (crc !=3D questions_crc(header, (unsigned int)m, d=
aemon->namebuff))
+-                      {
+-                        m =3D 0;
+-                        break;
+-                      }
+-#endif
+
+                      m =3D process_reply(header, now, last_server, (unsig=
ned int)m,
+                                        option_bool(OPT_NO_REBIND) && !nor=
ebind, no_cache_dnssec, cache_secure, bogusanswer,
+@@ -2345,7 +2318,7 @@ static struct frec *lookup_frec(unsigned short id, i=
nt fd, int family, void *has
+
+   for(f =3D daemon->frec_list; f; f =3D f->next)
+     if (f->sentto && f->new_id =3D=3D id &&
+-      (!hash || memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0))
++      (memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0))
+       {
+        /* sent from random port */
+        if (family =3D=3D AF_INET && f->rfd4 && f->rfd4->fd =3D=3D fd)
+diff --git a/src/hash_questions.c b/src/hash_questions.c
+new file mode 100644
+index 0000000..ae112ac
+--- /dev/null
++++ b/src/hash_questions.c
+@@ -0,0 +1,281 @@
++/* Copyright (c) 2012-2020 Simon Kelley
++
++   This program is free software; you can redistribute it and/or modify
++   it under the terms of the GNU General Public License as published by
++   the Free Software Foundation; version 2 dated June, 1991, or
++   (at your option) version 3 dated 29 June, 2007.
++
++   This program is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++   GNU General Public License for more details.
++
++   You should have received a copy of the GNU General Public License
++   along with this program.  If not, see <http://www.gnu.org/licenses/>.
++*/
++
++
++/* Hash the question section. This is used to safely detect query
++   retransmission and to detect answers to questions we didn't ask, which
++   might be poisoning attacks. Note that we decode the name rather
++   than CRC the raw bytes, since replies might be compressed differently.
++   We ignore case in the names for the same reason.
++
++   The hash used is SHA-256. If we're building with DNSSEC support,
++   we use the Nettle cypto library. If not, we prefer not to
++   add a dependency on Nettle, and use a stand-alone implementaion.
++*/
++
++#include "dnsmasq.h"
++
++#ifdef HAVE_DNSSEC
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)
++{
++  int q;
++  unsigned char *p =3D (unsigned char *)(header+1);
++  const struct nettle_hash *hash;
++  void *ctx;
++  unsigned char *digest;
++
++  if (!(hash =3D hash_find("sha256")) || !hash_init(hash, &ctx, &digest))
++    {
++      /* don't think this can ever happen. */
++      static unsigned char dummy[HASH_SIZE];
++      static int warned =3D 0;
++
++      if (warned)
++      my_syslog(LOG_ERR, _("Failed to create SHA-256 hash object"));
++      warned =3D 1;
++
++      return dummy;
++    }
++
++  for (q =3D ntohs(header->qdcount); q !=3D 0; q--)
++    {
++      char *cp, c;
++
++      if (!extract_name(header, plen, &p, name, 1, 4))
++      break; /* bad packet */
++
++      for (cp =3D name; (c =3D *cp); cp++)
++       if (c >=3D 'A' && c <=3D 'Z')
++         *cp +=3D 'a' - 'A';
++
++      hash->update(ctx, cp - name, (unsigned char *)name);
++      /* CRC the class and type as well */
++      hash->update(ctx, 4, p);
++
++      p +=3D 4;
++      if (!CHECK_LEN(header, p, plen, 0))
++      break; /* bad packet */
++    }
++
++  hash->digest(ctx, hash->digest_size, digest);
++  return digest;
++}
++
++#else /* HAVE_DNSSEC */
++
++#define SHA256_BLOCK_SIZE 32            // SHA256 outputs a 32 byte diges=
t
++typedef unsigned char BYTE;             // 8-bit byte
++typedef unsigned int  WORD;             // 32-bit word, change to "long" =
for 16-bit machines
++
++typedef struct {
++  BYTE data[64];
++  WORD datalen;
++  unsigned long long bitlen;
++  WORD state[8];
++} SHA256_CTX;
++
++static void sha256_init(SHA256_CTX *ctx);
++static void sha256_update(SHA256_CTX *ctx, const BYTE data[], size_t len)=
;
++static void sha256_final(SHA256_CTX *ctx, BYTE hash[]);
++
++
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)
++{
++  int q;
++  unsigned char *p =3D (unsigned char *)(header+1);
++  SHA256_CTX ctx;
++  static BYTE digest[SHA256_BLOCK_SIZE];
++
++  sha256_init(&ctx);
++
++  for (q =3D ntohs(header->qdcount); q !=3D 0; q--)
++    {
++      char *cp, c;
++
++      if (!extract_name(header, plen, &p, name, 1, 4))
++      break; /* bad packet */
++
++      for (cp =3D name; (c =3D *cp); cp++)
++       if (c >=3D 'A' && c <=3D 'Z')
++         *cp +=3D 'a' - 'A';
++
++      sha256_update(&ctx, (BYTE *)name, cp - name);
++      /* CRC the class and type as well */
++      sha256_update(&ctx, (BYTE *)p, 4);
++
++      p +=3D 4;
++      if (!CHECK_LEN(header, p, plen, 0))
++      break; /* bad packet */
++    }
++
++  sha256_final(&ctx, digest);
++  return (unsigned char *)digest;
++}
++
++/* Code from here onwards comes from https://github.com/B-Con/crypto-algo=
rithms
++   and was written by Brad Conte (brad@bradconte.com), to whom all credit=
 is given.
++
++   This code is in the public domain, and the copyright notice at the hea=
d of this
++   file does not apply to it.
++*/
++
++
++/****************************** MACROS ******************************/
++#define ROTLEFT(a,b) (((a) << (b)) | ((a) >> (32-(b))))
++#define ROTRIGHT(a,b) (((a) >> (b)) | ((a) << (32-(b))))
++
++#define CH(x,y,z) (((x) & (y)) ^ (~(x) & (z)))
++#define MAJ(x,y,z) (((x) & (y)) ^ ((x) & (z)) ^ ((y) & (z)))
++#define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))
++#define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))
++#define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) >> 3))
++#define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) >> 10))
++
++/**************************** VARIABLES *****************************/
++static const WORD k[64] =3D {
++                         0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x39=
56c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
++                         0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72=
be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
++                         0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2d=
e92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
++                         0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6=
e00bf3,0xd5a79147,0x06ca6351,0x14292967,
++                         0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x65=
0a7354,0x766a0abb,0x81c2c92e,0x92722c85,
++                         0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd1=
92e819,0xd6990624,0xf40e3585,0x106aa070,
++                         0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x39=
1c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
++                         0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90=
befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2
++};
++
++/*********************** FUNCTION DEFINITIONS ***********************/
++static void sha256_transform(SHA256_CTX *ctx, const BYTE data[])
++{
++  WORD a, b, c, d, e, f, g, h, i, j, t1, t2, m[64];
++
++  for (i =3D 0, j =3D 0; i < 16; ++i, j +=3D 4)
++    m[i] =3D (data[j] << 24) | (data[j + 1] << 16) | (data[j + 2] << 8) |=
 (data[j + 3]);
++  for ( ; i < 64; ++i)
++    m[i] =3D SIG1(m[i - 2]) + m[i - 7] + SIG0(m[i - 15]) + m[i - 16];
++
++  a =3D ctx->state[0];
++  b =3D ctx->state[1];
++  c =3D ctx->state[2];
++  d =3D ctx->state[3];
++  e =3D ctx->state[4];
++  f =3D ctx->state[5];
++  g =3D ctx->state[6];
++  h =3D ctx->state[7];
++
++  for (i =3D 0; i < 64; ++i)
++    {
++      t1 =3D h + EP1(e) + CH(e,f,g) + k[i] + m[i];
++      t2 =3D EP0(a) + MAJ(a,b,c);
++      h =3D g;
++      g =3D f;
++      f =3D e;
++      e =3D d + t1;
++      d =3D c;
++      c =3D b;
++      b =3D a;
++      a =3D t1 + t2;
++    }
++
++  ctx->state[0] +=3D a;
++  ctx->state[1] +=3D b;
++  ctx->state[2] +=3D c;
++  ctx->state[3] +=3D d;
++  ctx->state[4] +=3D e;
++  ctx->state[5] +=3D f;
++  ctx->state[6] +=3D g;
++  ctx->state[7] +=3D h;
++}
++
++static void sha256_init(SHA256_CTX *ctx)
++{
++  ctx->datalen =3D 0;
++  ctx->bitlen =3D 0;
++  ctx->state[0] =3D 0x6a09e667;
++  ctx->state[1] =3D 0xbb67ae85;
++  ctx->state[2] =3D 0x3c6ef372;
++  ctx->state[3] =3D 0xa54ff53a;
++  ctx->state[4] =3D 0x510e527f;
++  ctx->state[5] =3D 0x9b05688c;
++  ctx->state[6] =3D 0x1f83d9ab;
++  ctx->state[7] =3D 0x5be0cd19;
++}
++
++static void sha256_update(SHA256_CTX *ctx, const BYTE data[], size_t len)
++{
++  WORD i;
++
++  for (i =3D 0; i < len; ++i)
++    {
++      ctx->data[ctx->datalen] =3D data[i];
++      ctx->datalen++;
++      if (ctx->datalen =3D=3D 64) {
++      sha256_transform(ctx, ctx->data);
++      ctx->bitlen +=3D 512;
++      ctx->datalen =3D 0;
++      }
++    }
++}
++
++static void sha256_final(SHA256_CTX *ctx, BYTE hash[])
++{
++  WORD i;
++
++  i =3D ctx->datalen;
++
++  // Pad whatever data is left in the buffer.
++  if (ctx->datalen < 56)
++    {
++      ctx->data[i++] =3D 0x80;
++      while (i < 56)
++      ctx->data[i++] =3D 0x00;
++    }
++  else
++    {
++      ctx->data[i++] =3D 0x80;
++      while (i < 64)
++      ctx->data[i++] =3D 0x00;
++      sha256_transform(ctx, ctx->data);
++      memset(ctx->data, 0, 56);
++    }
++
++  // Append to the padding the total message's length in bits and transfo=
rm.
++  ctx->bitlen +=3D ctx->datalen * 8;
++  ctx->data[63] =3D ctx->bitlen;
++  ctx->data[62] =3D ctx->bitlen >> 8;
++  ctx->data[61] =3D ctx->bitlen >> 16;
++  ctx->data[60] =3D ctx->bitlen >> 24;
++  ctx->data[59] =3D ctx->bitlen >> 32;
++  ctx->data[58] =3D ctx->bitlen >> 40;
++  ctx->data[57] =3D ctx->bitlen >> 48;
++  ctx->data[56] =3D ctx->bitlen >> 56;
++  sha256_transform(ctx, ctx->data);
++
++  // Since this implementation uses little endian byte ordering and SHA u=
ses big endian,
++  // reverse all the bytes when copying the final state to the output has=
h.
++  for (i =3D 0; i < 4; ++i)
++    {
++      hash[i]      =3D (ctx->state[0] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 4]  =3D (ctx->state[1] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 8]  =3D (ctx->state[2] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 12] =3D (ctx->state[3] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 16] =3D (ctx->state[4] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 20] =3D (ctx->state[5] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 24] =3D (ctx->state[6] >> (24 - i * 8)) & 0x000000ff;
++      hash[i + 28] =3D (ctx->state[7] >> (24 - i * 8)) & 0x000000ff;
++    }
++}
++
++#endif
+diff --git a/src/rfc1035.c b/src/rfc1035.c
+index fefe63d..a8cdc6e 100644
+--- a/src/rfc1035.c
++++ b/src/rfc1035.c
+@@ -333,55 +333,6 @@ unsigned char *skip_section(unsigned char *ansp, int =
count, struct dns_header *h
+   return ansp;
+ }
+
+-/* CRC the question section. This is used to safely detect query
+-   retransmission and to detect answers to questions we didn't ask, which
+-   might be poisoning attacks. Note that we decode the name rather
+-   than CRC the raw bytes, since replies might be compressed differently.
+-   We ignore case in the names for the same reason. Return all-ones
+-   if there is not question section. */
+-#ifndef HAVE_DNSSEC
+-unsigned int questions_crc(struct dns_header *header, size_t plen, char *=
name)
+-{
+-  int q;
+-  unsigned int crc =3D 0xffffffff;
+-  unsigned char *p1, *p =3D (unsigned char *)(header+1);
+-
+-  for (q =3D ntohs(header->qdcount); q !=3D 0; q--)
+-    {
+-      if (!extract_name(header, plen, &p, name, 1, 4))
+-      return crc; /* bad packet */
+-
+-      for (p1 =3D (unsigned char *)name; *p1; p1++)
+-      {
+-        int i =3D 8;
+-        char c =3D *p1;
+-
+-        if (c >=3D 'A' && c <=3D 'Z')
+-          c +=3D 'a' - 'A';
+-
+-        crc ^=3D c << 24;
+-        while (i--)
+-          crc =3D crc & 0x80000000 ? (crc << 1) ^ 0x04c11db7 : crc << 1;
+-      }
+-
+-      /* CRC the class and type as well */
+-      for (p1 =3D p; p1 < p+4; p1++)
+-      {
+-        int i =3D 8;
+-        crc ^=3D *p1 << 24;
+-        while (i--)
+-          crc =3D crc & 0x80000000 ? (crc << 1) ^ 0x04c11db7 : crc << 1;
+-      }
+-
+-      p +=3D 4;
+-      if (!CHECK_LEN(header, p, plen, 0))
+-      return crc; /* bad packet */
+-    }
+-
+-  return crc;
+-}
+-#endif
+-
+ size_t resize_packet(struct dns_header *header, size_t plen, unsigned cha=
r *pheader, size_t hlen)
+ {
+   unsigned char *ansp =3D skip_questions(header, plen);
+--
+2.20.1
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.pat=
ch
new file mode 100644
index 000000000..6f60b36ed
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.patch
@@ -0,0 +1,201 @@
+From 2024f9729713fd657d65e64c2e4e471baa0a3e5b Mon Sep 17 00:00:00 2001
+From: =3D?utf8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D <pemensik@redhat.co=
m>
+Date: Wed, 25 Nov 2020 17:18:55 +0100
+Subject: [PATCH] Support hash function from nettle (only)
+
+Unlike COPTS=3D-DHAVE_DNSSEC, allow usage of just sha256 function from
+nettle, but keep DNSSEC disabled at build time. Skips use of internal
+hash implementation without support for validation built-in.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ Makefile             |  8 +++++---
+ bld/pkg-wrapper      | 41 ++++++++++++++++++++++-------------------
+ src/config.h         |  8 ++++++++
+ src/crypto.c         |  7 +++++++
+ src/dnsmasq.h        |  2 +-
+ src/hash_questions.c |  2 +-
+ 6 files changed, 44 insertions(+), 24 deletions(-)
+
+CVE: CVE-2020-25685
+Upstream-Status: Backport [https://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dpatch;h=3D2024f9729713fd657d65e64c2e4e471baa0a3e5b]
+Comment: No change in any hunk
+
+diff --git a/Makefile b/Makefile
+index 0354e0f..7d2afd1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -53,7 +53,7 @@ top?=3D$(CURDIR)
+
+ dbus_cflags =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DBUS $(PKG=
_CONFIG) --cflags dbus-1`
+ dbus_libs =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DBUS $(PKG=
_CONFIG) --libs dbus-1`
+-ubus_libs =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_UBUS "" --=
copy -lubox -lubus`
++ubus_libs =3D     `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_UBUS "" --=
copy '-lubox -lubus'`
+ idn_cflags =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_=
CONFIG) --cflags libidn`
+ idn_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_IDN $(PKG_=
CONFIG) --libs libidn`
+ idn2_cflags =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LIBIDN2 $(=
PKG_CONFIG) --cflags libidn2`
+@@ -61,8 +62,10 @@
+ ct_libs =3D       `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_CONNTRACK =
$(PKG_CONFIG) --libs libnetfilter_conntrack`
+ lua_cflags =3D    `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT =
$(PKG_CONFIG) --cflags lua`
+ lua_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_LUASCRIPT =
$(PKG_CONFIG) --libs lua`
+-nettle_cflags =3D `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(P=
KG_CONFIG) --cflags nettle hogweed`
+-nettle_libs =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(P=
KG_CONFIG) --libs nettle hogweed`
++nettle_cflags =3D `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC    =
 $(PKG_CONFIG) --cflags 'nettle hogweed' \
++                                                        HAVE_NETTLEHASH $=
(PKG_CONFIG) --cflags nettle`
++nettle_libs =3D   `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC    =
 $(PKG_CONFIG) --libs 'nettle hogweed' \
++                                                        HAVE_NETTLEHASH $=
(PKG_CONFIG) --libs nettle`
+ gmp_libs =3D      `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC NO_=
GMP --copy -lgmp`
+ sunos_libs =3D    `if uname | grep SunOS >/dev/null 2>&1; then echo -lsoc=
ket -lnsl -lposix4; fi`
+ version =3D     -DVERSION=3D'\"`$(top)/bld/get-version $(top)`\"'
+diff --git a/bld/pkg-wrapper b/bld/pkg-wrapper
+index 704bdd3..89713b4 100755
+--- a/bld/pkg-wrapper
++++ b/bld/pkg-wrapper
+@@ -1,35 +1,37 @@
+ #!/bin/sh
+
+-search=3D$1
+-shift
+-pkg=3D$1
+-shift
+-op=3D$1
+-shift
+-
+ in=3D`cat`
+
+-if grep "^\#[[:space:]]*define[[:space:]]*$search" config.h >/dev/null 2>=
&1 || \
+-    echo $in | grep $search >/dev/null 2>&1; then
++search()
++{
++    grep "^\#[[:space:]]*define[[:space:]]*$1" config.h >/dev/null 2>&1 |=
| \
++    echo $in | grep $1 >/dev/null 2>&1
++}
++
++while [ "$#" -gt 0 ]; do
++    search=3D$1
++    pkg=3D$2
++    op=3D$3
++    lib=3D$4
++    shift 4
++if search "$search"; then
++
+ # Nasty, nasty, in --copy, arg 2 (if non-empty) is another config to sear=
ch for, used with NO_GMP
+     if [ $op =3D "--copy" ]; then
+        if [ -z "$pkg" ]; then
+-          pkg=3D"$*"
+-      elif grep "^\#[[:space:]]*define[[:space:]]*$pkg" config.h >/dev/nu=
ll 2>&1 || \
+-               echo $in | grep $pkg >/dev/null 2>&1; then
++          pkg=3D"$lib"
++      elif search "$pkg"; then
+            pkg=3D""
+        else
+-          pkg=3D"$*"
++          pkg=3D"$lib"
+        fi
+-    elif grep "^\#[[:space:]]*define[[:space:]]*${search}_STATIC" config.=
h >/dev/null 2>&1 || \
+-           echo $in | grep ${search}_STATIC >/dev/null 2>&1; then
+-      pkg=3D`$pkg  --static $op $*`
++    elif search "${search}_STATIC"; then
++      pkg=3D`$pkg  --static $op $lib`
+     else
+-      pkg=3D`$pkg $op $*`
++      pkg=3D`$pkg $op $lib`
+     fi
+
+-    if grep "^\#[[:space:]]*define[[:space:]]*${search}_STATIC" config.h =
>/dev/null 2>&1 || \
+-         echo $in | grep ${search}_STATIC >/dev/null 2>&1; then
++    if search "${search}_STATIC"; then
+        if [ $op =3D "--libs" ] || [ $op =3D "--copy" ]; then
+            echo "-Wl,-Bstatic $pkg -Wl,-Bdynamic"
+        else
+@@ -40,3 +42,4 @@ if grep "^\#[[:space:]]*define[[:space:]]*$search" confi=
g.h >/dev/null 2>&1 || \
+     fi
+ fi
+
++done
+diff --git a/src/config.h b/src/config.h
+index 7187ffa..e71a117 100644
+--- a/src/config.h
++++ b/src/config.h
+@@ -120,6 +120,9 @@ HAVE_AUTH
+    define this to include the facility to act as an authoritative DNS
+    server for one or more zones.
+
++HAVE_NETTLEHASH
++   include just hash function from nettle, but no DNSSEC.
++
+ HAVE_DNSSEC
+    include DNSSEC validator.
+
+@@ -187,6 +190,7 @@ RESOLVFILE
+ /* #define HAVE_IDN */
+ /* #define HAVE_LIBIDN2 */
+ /* #define HAVE_CONNTRACK */
++/* #define HAVE_NETTLEHASH */
+ /* #define HAVE_DNSSEC */
+
+
+@@ -420,6 +424,10 @@ static char *compile_opts =3D
+ "no-"
+ #endif
+ "auth "
++#if !defined(HAVE_NETTLEHASH) && !defined(HAVE_DNSSEC)
++"no-"
++#endif
++"nettlehash "
+ #ifndef HAVE_DNSSEC
+ "no-"
+ #endif
+diff --git a/src/crypto.c b/src/crypto.c
+index ca63111..09525d2 100644
+--- a/src/crypto.c
++++ b/src/crypto.c
+@@ -25,6 +25,9 @@
+ #if NETTLE_VERSION_MAJOR =3D=3D 3 && NETTLE_VERSION_MINOR >=3D 6
+ #  include <nettle/gostdsa.h>
+ #endif
++#endif
++
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)
+ #include <nettle/nettle-meta.h>
+ #include <nettle/bignum.h>
+
+@@ -167,6 +170,10 @@ int hash_init(const struct nettle_hash *hash, void **=
ctxp, unsigned char **diges
+
+   return 1;
+ }
++
++#endif
++
++#ifdef HAVE_DNSSEC
+
+ static int dnsmasq_rsa_verify(struct blockdata *key_data, unsigned int ke=
y_len, unsigned char *sig, size_t sig_len,
+                              unsigned char *digest, size_t digest_len, in=
t algo)
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 9f74c7a..914f469 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -157,7 +157,7 @@ extern int capget(cap_user_header_t header, cap_user_d=
ata_t data);
+ #include <priv.h>
+ #endif
+
+-#ifdef HAVE_DNSSEC
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)
+ #  include <nettle/nettle-meta.h>
+ #endif
+
+diff --git a/src/hash_questions.c b/src/hash_questions.c
+index ae112ac..917c18e 100644
+--- a/src/hash_questions.c
++++ b/src/hash_questions.c
+@@ -28,7 +28,7 @@
+
+ #include "dnsmasq.h"
+
+-#ifdef HAVE_DNSSEC
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)
+ unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)
+ {
+   int q;
+--
+2.20.1
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.pat=
ch
new file mode 100644
index 000000000..b07ab6045
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.patch
@@ -0,0 +1,335 @@
+From 15b60ddf935a531269bb8c68198de012a4967156 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Wed, 18 Nov 2020 18:34:55 +0000
+Subject: [PATCH] Handle multiple identical near simultaneous DNS queries
+ better.
+
+Previously, such queries would all be forwarded
+independently. This is, in theory, inefficent but in practise
+not a problem, _except_ that is means that an answer for any
+of the forwarded queries will be accepted and cached.
+An attacker can send a query multiple times, and for each repeat,
+another {port, ID} becomes capable of accepting the answer he is
+sending in the blind, to random IDs and ports. The chance of a
+succesful attack is therefore multiplied by the number of repeats
+of the query. The new behaviour detects repeated queries and
+merely stores the clients sending repeats so that when the
+first query completes, the answer can be sent to all the
+clients who asked. Refer: CERT VU#434904.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ CHANGELOG     |  16 +++++-
+ src/dnsmasq.h |  19 ++++---
+ src/forward.c | 142 ++++++++++++++++++++++++++++++++++++++++++--------
+ 3 files changed, 147 insertions(+), 30 deletions(-)
+
+CVE: CVE-2020-25686
+Upstream-Status: Backport [http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.gi=
t;a=3Dcommit;h=3D15b60ddf935a531269bb8c68198de012a4967156]
+Comment: No change in any hunk
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 0a7639f..fa8c5ea 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -653,19 +653,24 @@ struct hostsfile {
+ #define FREC_DO_QUESTION       64
+ #define FREC_ADDED_PHEADER    128
+ #define FREC_TEST_PKTSZ       256
+-#define FREC_HAS_EXTRADATA    512
++#define FREC_HAS_EXTRADATA    512
++#define FREC_HAS_PHEADER     1024
+
+ #define HASH_SIZE 32 /* SHA-256 digest size */
+
+ struct frec {
+-  union mysockaddr source;
+-  union all_addr dest;
++  struct frec_src {
++    union mysockaddr source;
++    union all_addr dest;
++    unsigned int iface, log_id;
++    unsigned short orig_id;
++    struct frec_src *next;
++  } frec_src;
+   struct server *sentto; /* NULL means free */
+   struct randfd *rfd4;
+   struct randfd *rfd6;
+-  unsigned int iface;
+-  unsigned short orig_id, new_id;
+-  int log_id, fd, forwardall, flags;
++  unsigned short new_id;
++  int fd, forwardall, flags;
+   time_t time;
+   unsigned char *hash[HASH_SIZE];
+ #ifdef HAVE_DNSSEC
+@@ -1093,6 +1098,8 @@ extern struct daemon {
+   int back_to_the_future;
+ #endif
+   struct frec *frec_list;
++  struct frec_src *free_frec_src;
++  int frec_src_count;
+   struct serverfd *sfds;
+   struct irec *interfaces;
+   struct listener *listeners;
+diff --git a/src/forward.c b/src/forward.c
+index 50da095..d9b32b3 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -20,6 +20,8 @@ static struct frec *lookup_frec(unsigned short id, int f=
d, int family, void *has
+ static struct frec *lookup_frec_by_sender(unsigned short id,
+                                          union mysockaddr *addr,
+                                          void *hash);
++static struct frec *lookup_frec_by_query(void *hash, unsigned int flags);
++
+ static unsigned short get_id(void);
+ static void free_frec(struct frec *f);
+
+@@ -255,6 +257,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,
+   int type =3D SERV_DO_DNSSEC, norebind =3D 0;
+   union all_addr *addrp =3D NULL;
+   unsigned int flags =3D 0;
++  unsigned int fwd_flags =3D 0;
+   struct server *start =3D NULL;
+   void *hash =3D hash_questions(header, plen, daemon->namebuff);
+ #ifdef HAVE_DNSSEC
+@@ -263,7 +266,18 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,
+   unsigned int gotname =3D extract_request(header, plen, daemon->namebuff=
, NULL);
+   unsigned char *oph =3D find_pseudoheader(header, plen, NULL, NULL, NULL=
, NULL);
+   (void)do_bit;
+-
++
++  if (header->hb4 & HB4_CD)
++    fwd_flags |=3D FREC_CHECKING_DISABLED;
++  if (ad_reqd)
++    fwd_flags |=3D FREC_AD_QUESTION;
++  if (oph)
++    fwd_flags |=3D FREC_HAS_PHEADER;
++#ifdef HAVE_DNSSEC
++  if (do_bit)
++    fwd_flags |=3D FREC_DO_QUESTION;
++#endif
++
+   /* may be no servers available. */
+   if (forward || (forward =3D lookup_frec_by_sender(ntohs(header->id), ud=
paddr, hash)))
+     {
+@@ -336,6 +350,39 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,
+     }
+   else
+     {
++      /* Query from new source, but the same query may be in progress
++       from another source. If so, just add this client to the
++       list that will get the reply.
++
++       Note that is the EDNS client subnet option is in use, we can't do =
this,
++       as the clients (and therefore query EDNS options) will be differen=
t
++       for each query. The EDNS subnet code has checks to avoid
++       attacks in this case. */
++      if (!option_bool(OPT_CLIENT_SUBNET) && (forward =3D lookup_frec_by_=
query(hash, fwd_flags)))
++      {
++        /* Note whine_malloc() zeros memory. */
++        if (!daemon->free_frec_src &&
++            daemon->frec_src_count < daemon->ftabsize &&
++            (daemon->free_frec_src =3D whine_malloc(sizeof(struct frec_sr=
c))))
++          daemon->frec_src_count++;
++
++        /* If we've been spammed with many duplicates, just drop the quer=
y. */
++        if (daemon->free_frec_src)
++          {
++            struct frec_src *new =3D daemon->free_frec_src;
++            daemon->free_frec_src =3D new->next;
++            new->next =3D forward->frec_src.next;
++            forward->frec_src.next =3D new;
++            new->orig_id =3D ntohs(header->id);
++            new->source =3D *udpaddr;
++            new->dest =3D *dst_addr;
++            new->log_id =3D daemon->log_id;
++            new->iface =3D dst_iface;
++          }
++
++        return 1;
++      }
++
+       if (gotname)
+        flags =3D search_servers(now, &addrp, gotname, daemon->namebuff, &=
type, &domain, &norebind);
+
+@@ -343,22 +390,22 @@ static int forward_query(int udpfd, union mysockaddr=
 *udpaddr,
+       do_dnssec =3D type & SERV_DO_DNSSEC;
+ #endif
+       type &=3D ~SERV_DO_DNSSEC;
+-
++
+       if (daemon->servers && !flags)
+        forward =3D get_new_frec(now, NULL, NULL);
+       /* table full - flags =3D=3D 0, return REFUSED */
+
+       if (forward)
+        {
+-        forward->source =3D *udpaddr;
+-        forward->dest =3D *dst_addr;
+-        forward->iface =3D dst_iface;
+-        forward->orig_id =3D ntohs(header->id);
++        forward->frec_src.source =3D *udpaddr;
++        forward->frec_src.orig_id =3D ntohs(header->id);
++        forward->frec_src.dest =3D *dst_addr;
++        forward->frec_src.iface =3D dst_iface;
+          forward->new_id =3D get_id();
+          forward->fd =3D udpfd;
+          memcpy(forward->hash, hash, HASH_SIZE);
+          forward->forwardall =3D 0;
+-        forward->flags =3D 0;
++        forward->flags =3D fwd_flags;
+          if (norebind)
+            forward->flags |=3D FREC_NOREBIND;
+          if (header->hb4 & HB4_CD)
+@@ -413,9 +460,9 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,
+       unsigned char *pheader;
+
+       /* If a query is retried, use the log_id for the retry when logging=
 the answer. */
+-      forward->log_id =3D daemon->log_id;
++      forward->frec_src.log_id =3D daemon->log_id;
+
+-      plen =3D add_edns0_config(header, plen, ((unsigned char *)header) +=
 PACKETSZ, &forward->source, now, &subnet);
++      plen =3D add_edns0_config(header, plen, ((unsigned char *)header) +=
 PACKETSZ, &forward->frec_src.source, now, &subnet);
+
+       if (subnet)
+        forward->flags |=3D FREC_HAS_SUBNET;
+@@ -552,7 +599,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,
+        return 1;
+
+       /* could not send on, prepare to return */
+-      header->id =3D htons(forward->orig_id);
++      header->id =3D htons(forward->frec_src.orig_id);
+       free_frec(forward); /* cancel */
+     }
+
+@@ -804,8 +851,8 @@ void reply_query(int fd, int family, time_t now)
+
+   /* log_query gets called indirectly all over the place, so
+      pass these in global variables - sorry. */
+-  daemon->log_display_id =3D forward->log_id;
+-  daemon->log_source_addr =3D &forward->source;
++  daemon->log_display_id =3D forward->frec_src.log_id;
++  daemon->log_source_addr =3D &forward->frec_src.source;
+
+   if (daemon->ignore_addr && RCODE(header) =3D=3D NOERROR &&
+       check_for_ignored_address(header, n, daemon->ignore_addr))
+@@ -1080,6 +1127,7 @@ void reply_query(int fd, int family, time_t now)
+                      new->sentto =3D server;
+                      new->rfd4 =3D NULL;
+                      new->rfd6 =3D NULL;
++                    new->frec_src.next =3D NULL;
+                      new->flags &=3D ~(FREC_DNSKEY_QUERY | FREC_DS_QUERY =
| FREC_HAS_EXTRADATA);
+                      new->forwardall =3D 0;
+
+@@ -1215,9 +1263,11 @@ void reply_query(int fd, int family, time_t now)
+
+       if ((nn =3D process_reply(header, now, forward->sentto, (size_t)n, =
check_rebind, no_cache_dnssec, cache_secure, bogusanswer,
+                              forward->flags & FREC_AD_QUESTION, forward->=
flags & FREC_DO_QUESTION,
+-                            forward->flags & FREC_ADDED_PHEADER, forward-=
>flags & FREC_HAS_SUBNET, &forward->source)))
++                            forward->flags & FREC_ADDED_PHEADER, forward-=
>flags & FREC_HAS_SUBNET, &forward->frec_src.source)))
+        {
+-        header->id =3D htons(forward->orig_id);
++        struct frec_src *src;
++
++        header->id =3D htons(forward->frec_src.orig_id);
+          header->hb4 |=3D HB4_RA; /* recursion if available */
+ #ifdef HAVE_DNSSEC
+          /* We added an EDNSO header for the purpose of getting DNSSEC RR=
s, and set the value of the UDP payload size
+@@ -1233,13 +1283,26 @@ void reply_query(int fd, int family, time_t now)
+            }
+ #endif
+
++        for (src =3D &forward->frec_src; src; src =3D src->next)
++          {
++            header->id =3D htons(src->orig_id);
++
+ #ifdef HAVE_DUMPFILE
+-        dump_packet(DUMP_REPLY, daemon->packet, (size_t)nn, NULL, &forwar=
d->source);
++            dump_packet(DUMP_REPLY, daemon->packet, (size_t)nn, NULL, &sr=
c->source);
+ #endif
+-
+-        send_from(forward->fd, option_bool(OPT_NOWILD) || option_bool (OP=
T_CLEVERBIND), daemon->packet, nn,
+-                  &forward->source, &forward->dest, forward->iface);
++
++            send_from(forward->fd, option_bool(OPT_NOWILD) || option_bool=
 (OPT_CLEVERBIND), daemon->packet, nn,
++                      &src->source, &src->dest, src->iface);
++
++            if (option_bool(OPT_EXTRALOG) && src !=3D &forward->frec_src)
++              {
++                daemon->log_display_id =3D src->log_id;
++                daemon->log_source_addr =3D &src->source;
++                log_query(F_UPSTREAM, "query", NULL, "duplicate");
++              }
++          }
+        }
++
+       free_frec(forward); /* cancel */
+     }
+ }
+@@ -2202,6 +2265,17 @@ void free_rfd(struct randfd *rfd)
+
+ static void free_frec(struct frec *f)
+ {
++  struct frec_src *src, *tmp;
++
++   /* add back to freelist of not the record builtin to every frec. */
++  for (src =3D f->frec_src.next; src; src =3D tmp)
++    {
++      tmp =3D src->next;
++      src->next =3D daemon->free_frec_src;
++      daemon->free_frec_src =3D src;
++    }
++
++  f->frec_src.next =3D NULL;
+   free_rfd(f->rfd4);
+   f->rfd4 =3D NULL;
+   f->sentto =3D NULL;
+@@ -2342,17 +2416,39 @@ static struct frec *lookup_frec_by_sender(unsigned=
 short id,
+                                          void *hash)
+ {
+   struct frec *f;
++  struct frec_src *src;
++
++  for (f =3D daemon->frec_list; f; f =3D f->next)
++    if (f->sentto &&
++      !(f->flags & (FREC_DNSKEY_QUERY | FREC_DS_QUERY)) &&
++      memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0)
++      for (src =3D &f->frec_src; src; src =3D src->next)
++      if (src->orig_id =3D=3D id &&
++          sockaddr_isequal(&src->source, addr))
++        return f;
++
++  return NULL;
++}
++
++static struct frec *lookup_frec_by_query(void *hash, unsigned int flags)
++{
++  struct frec *f;
++
++  /* FREC_DNSKEY and FREC_DS_QUERY are never set in flags, so the test be=
low
++     ensures that no frec created for internal DNSSEC query can be return=
ed here. */
++
++#define FLAGMASK (FREC_CHECKING_DISABLED | FREC_AD_QUESTION | FREC_DO_QUE=
STION \
++                | FREC_HAS_PHEADER | FREC_DNSKEY_QUERY | FREC_DS_QUERY)
+
+   for(f =3D daemon->frec_list; f; f =3D f->next)
+     if (f->sentto &&
+-      f->orig_id =3D=3D id &&
+-      memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0 &&
+-      sockaddr_isequal(&f->source, addr))
++      (f->flags & FLAGMASK) =3D=3D flags &&
++      memcmp(hash, f->hash, HASH_SIZE) =3D=3D 0)
+       return f;
+-
++
+   return NULL;
+ }
+-
++
+ /* Send query packet again, if we can. */
+ void resend_query()
+ {
+--
+2.20.1
+
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.pat=
ch
new file mode 100644
index 000000000..4e03dd92b
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.patch
@@ -0,0 +1,66 @@
+From 6a6e06fbb0d4690507ceaf2bb6f0d8910f3d4914 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Fri, 4 Dec 2020 18:35:11 +0000
+Subject: [PATCH] Small cleanups in frec_src datastucture handling.
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ src/forward.c | 22 +++++++++++++---------
+ 1 file changed, 13 insertions(+), 9 deletions(-)
+
+CVE: CVE-2020-25686
+Upstream-Status: Backport [http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.gi=
t;a=3Dcommit;h=3D6a6e06fbb0d4690507ceaf2bb6f0d8910f3d4914]
+Comment: No change in any hunk
+
+diff --git a/src/forward.c b/src/forward.c
+index 70b84d7..f94c4cf 100644
+--- a/src/forward.c
++++ b/src/forward.c
+@@ -361,7 +361,10 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,
+          if (!daemon->free_frec_src &&
+              daemon->frec_src_count < daemon->ftabsize &&
+              (daemon->free_frec_src =3D whine_malloc(sizeof(struct frec_s=
rc))))
+-          daemon->frec_src_count++;
++          {
++            daemon->frec_src_count++;
++            daemon->free_frec_src->next =3D NULL;
++          }
+
+          /* If we've been spammed with many duplicates, just drop the que=
ry. */
+          if (daemon->free_frec_src)
+@@ -398,6 +401,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,
+          forward->frec_src.orig_id =3D ntohs(header->id);
+          forward->frec_src.dest =3D *dst_addr;
+          forward->frec_src.iface =3D dst_iface;
++        forward->frec_src.next =3D NULL;
+          forward->new_id =3D get_id();
+          forward->fd =3D udpfd;
+          memcpy(forward->hash, hash, HASH_SIZE);
+@@ -2265,16 +2265,16 @@
+
+ static void free_frec(struct frec *f)
+ {
+-  struct frec_src *src, *tmp;
+-
+-   /* add back to freelist of not the record builtin to every frec. */
+-  for (src =3D f->frec_src.next; src; src =3D tmp)
++  struct frec_src *last;
++
++  /* add back to freelist if not the record builtin to every frec. */
++  for (last =3D f->frec_src.next; last && last->next; last =3D last->next=
) ;
++  if (last)
+     {
+-      tmp =3D src->next;
+-      src->next =3D daemon->free_frec_src;
+-      daemon->free_frec_src =3D src;
++      last->next =3D daemon->free_frec_src;
++      daemon->free_frec_src =3D f->frec_src.next;
+     }
+-
++
+   f->frec_src.next =3D NULL;
+   free_rfd(f->rfd4);
+   f->rfd4 =3D NULL;
+--
+2.20.1
+
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB32218FDFE45798C3EFEB9193997C9BMXPR01MB3221INDP_
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
: 12pt; color: rgb(0, 0, 0);">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Could you please review below patch to be upstreamed for dnsmasq?</div>
<div>
<div id=3D"Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
<span style=3D"color:rgb(81,167,249)"></span></div>
<div></div>
<div style=3D"text-align:start; background-color:rgb(255,255,255); font-siz=
e:11pt; font-family:Calibri,sans-serif; margin:0px">
<span lang=3D"en-IN" style=3D"margin:0px; font-size:9pt; font-family:Arial,=
sans-serif; color:rgb(81,167,249); background-color:white"></span><span sty=
le=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; background-=
color:white"><span style=3D"color:black; margin:0px; font-size:10pt; backgr=
ound-color:white">&nbsp;</span><span style=3D"margin:0px; font-size:10pt; b=
ackground-color:white"><font color=3D"#003366">Thanks
 &amp; Regards,</font></span></span><span style=3D"margin:0px; font-size:12=
pt; font-family:Arial,sans-serif; color:black; background-color:white"></sp=
an></div>
<div style=3D"margin:0px; font-size:15px; text-align:start; background-colo=
r:rgb(255,255,255)">
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0px"><sp=
an style=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; color=
:black; background-color:white">&nbsp;</span><span style=3D"margin:0px; fon=
t-size:10pt; font-family:Arial,sans-serif; color:rgb(0,51,102); background-=
color:white">Sana
 Kazi<br>
<span style=3D"color:rgb(0,51,102); font-family:Arial,sans-serif; font-size=
:10pt">&nbsp;KPIT Technologies Limited</span><br>
</span></p>
</div>
<div><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sana Kazi &lt;Sana.Ka=
zi@kpit.com&gt;<br>
<b>Sent:</b> Thursday, March 18, 2021 10:44 AM<br>
<b>To:</b> Openembedded-devel@lists.openembedded.org &lt;Openembedded-devel=
@lists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<=
br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Harpritkaur Bhan=
dari &lt;Harpritkaur.Bhandari@kpit.com&gt;<br>
<b>Subject:</b> [meta-networking][meta-oe][dunfell][PATCH] dnsmasq: Add fix=
es for CVEs reported for dnsmasq</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Applied single patch for below listed CVEs which a=
voids remote<br>
attacker to overwrite memory:<br>
CVE-2020-25681<br>
CVE-2020-25682<br>
CVE-2020-25683<br>
CVE-2020-25687<br>
as they are fixed by single commit<br>
<a href=3D"http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dcommit;h=3D=
4e96a4be685c9e4445f6ee79ad0b36b9119b502a">http://thekelleys.org.uk/gitweb/?=
p=3Ddnsmasq.git;a=3Dcommit;h=3D4e96a4be685c9e4445f6ee79ad0b36b9119b502a</a>=
<br>
Link: <a href=3D"https://www.openwall.com/lists/oss-security/2021/01/19/1">=
https://www.openwall.com/lists/oss-security/2021/01/19/1</a><br>
<br>
Also, applied patch for below listed CVEs:<br>
<br>
CVE-2020-25684<br>
CVE-2020-25685<br>
CVE-2020-25686<br>
<br>
Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
---<br>
&nbsp;.../recipes-support/dnsmasq/dnsmasq_2.81.bb&nbsp;&nbsp; |&nbsp;&nbsp;=
 7 +-<br>
&nbsp;.../dnsmasq/files/CVE-2020-25681.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 373 +++++++++++<br>
&nbsp;.../dnsmasq/files/CVE-2020-25684.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; | 100 +++<br>
&nbsp;.../dnsmasq/files/CVE-2020-25685-1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 590 ++++++++++++++++++<br>
&nbsp;.../dnsmasq/files/CVE-2020-25685-2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 201 ++++++<br>
&nbsp;.../dnsmasq/files/CVE-2020-25686-1.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 335 ++++++++++<br>
&nbsp;.../dnsmasq/files/CVE-2020-25686-2.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp; 66 ++<br>
&nbsp;7 files changed, 1671 insertions(+), 1 deletion(-)<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2020-25681.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2020-25684.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2020-25685-1.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2020-25685-2.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2020-25686-1.patch<br>
&nbsp;create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-=
2020-25686-2.patch<br>
<br>
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb b/meta=
-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb<br>
index 92415386c..a1dc0f3a0 100644<br>
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb<br>
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.81.bb<br>
@@ -4,5 +4,10 @@ SRC_URI[dnsmasq-2.81.md5sum] =3D &quot;e43808177a773014b58=
92ccba238f7a8&quot;<br>
&nbsp;SRC_URI[dnsmasq-2.81.sha256sum] =3D &quot;3c28c68c6c2967c3a96e9b432c0=
c046a5df17a426d3a43cffe9e693cf05804d0&quot;<br>
&nbsp;SRC_URI +=3D &quot;\<br>
&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://lua.patch">file://lua.patch</a> =
\<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-25681.patch">file://CVE-2020=
-25681.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-25684.patch">file://CVE-2020=
-25684.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-25685-1.patch">file://CVE-20=
20-25685-1.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-25685-2.patch">file://CVE-20=
20-25685-2.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-25686-1.patch">file://CVE-20=
20-25686-1.patch</a> \<br>
+&nbsp;&nbsp;&nbsp; <a href=3D"file://CVE-2020-25686-2.patch">file://CVE-20=
20-25686-2.patch</a> \<br>
&nbsp;&quot;<br>
-<br>
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.p=
atch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch<b=
r>
new file mode 100644<br>
index 000000000..cab734ed1<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25681.patch<br=
>
@@ -0,0 +1,373 @@<br>
+From 4e96a4be685c9e4445f6ee79ad0b36b9119b502a Mon Sep 17 00:00:00 2001<br>
+From: Simon Kelley &lt;simon@thekelleys.org.uk&gt;<br>
+Date: Wed, 11 Nov 2020 23:25:04 +0000<br>
+Subject: [PATCH] Fix remote buffer overflow CERT VU#434904<br>
+<br>
+The problem is in the sort_rrset() function and allows a remote<br>
+attacker to overwrite memory. Any dnsmasq instance with DNSSEC<br>
+enabled is vulnerable.<br>
+<br>
+Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
+---<br>
+ CHANGELOG&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 7 +-<br>
+ src/dnssec.c | 273 ++++++++++++++++++++++++++++-----------------------<br=
>
+ 2 files changed, 158 insertions(+), 122 deletions(-)<br>
+<br>
+CVE: CVE-2020-25681<br>
+CVE: CVE-2020-25682<br>
+CVE: CVE-2020-25683<br>
+CVE: CVE-2020-25687<br>
+Upstream-Status: Backport [<a href=3D"https://thekelleys.org.uk/gitweb/?p=
=3Ddnsmasq.git;a=3Dpatch;h=3D4e96a4be685c9e4445f6ee79ad0b36b9119b502a">http=
s://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dpatch;h=3D4e96a4be685c9e4=
445f6ee79ad0b36b9119b502a</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/dnssec.c b/src/dnssec.c<br>
+index db5c2d1..e95aa34 100644<br>
+--- a/src/dnssec.c<br>
++++ b/src/dnssec.c<br>
+@@ -223,138 +223,147 @@ static int check_date_range(unsigned long curtime,=
 u32 date_start, u32 date_end)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; &amp;&amp; serial_compare_32(curtime, date_end) =
=3D=3D SERIAL_LT;<br>
+ }<br>
+ <br>
+-/* Return bytes of canonicalised rdata, when the return value is zero, th=
e remaining
<br>
+-&nbsp;&nbsp; data, pointed to by *p, should be used raw. */<br>
+-static int get_rdata(struct dns_header *header, size_t plen, unsigned cha=
r *end, char *buff, int bufflen,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char **p, u16 **desc)<br>
++/* Return bytes of canonicalised rrdata one by one.<br>
++&nbsp;&nbsp; Init state-&gt;ip with the RR, and state-&gt;end with the en=
d of same.<br>
++&nbsp;&nbsp; Init state-&gt;op to NULL.<br>
++&nbsp;&nbsp; Init state-&gt;desc to RR descriptor.<br>
++&nbsp;&nbsp; Init state-&gt;buff with a MAXDNAME * 2 buffer.<br>
++&nbsp;&nbsp; <br>
++&nbsp;&nbsp; After each call which returns 1, state-&gt;op points to the =
next byte of data.<br>
++&nbsp;&nbsp; On returning 0, the end has been reached.<br>
++*/<br>
++struct rdata_state {<br>
++&nbsp; u16 *desc;<br>
++&nbsp; size_t c;<br>
++&nbsp; unsigned char *end, *ip, *op;<br>
++&nbsp; char *buff;<br>
++};<br>
++<br>
++static int get_rdata(struct dns_header *header, size_t plen, struct rdata=
_state *state)<br>
+ {<br>
+-&nbsp; int d =3D **desc;<br>
++&nbsp; int d;<br>
+&nbsp;&nbsp; <br>
+-&nbsp; /* No more data needs mangling */<br>
+-&nbsp; if (d =3D=3D (u16)-1)<br>
++&nbsp; if (state-&gt;op &amp;&amp; state-&gt;c !=3D 1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If there's more data than we have space=
 for, just return what fits,<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; we'll get called again for more chun=
ks */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (end - *p &gt; bufflen)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(buff, *p, bufflen);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *p +=3D bufflen;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return bufflen;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;op++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;c--;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+- <br>
+-&nbsp; (*desc)++;<br>
+-&nbsp; <br>
+-&nbsp; if (d =3D=3D 0 &amp;&amp; extract_name(header, plen, p, buff, 1, 0=
))<br>
+-&nbsp;&nbsp;&nbsp; /* domain-name, canonicalise */<br>
+-&nbsp;&nbsp;&nbsp; return to_wire(buff);<br>
+-&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp; { <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* plain data preceding a domain-name, don=
't run off the end of the data */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((end - *p) &lt; d)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D end - *p;<br>
++<br>
++&nbsp; while (1)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D *(state-&gt;desc);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (d !=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (d =3D=3D (u16)-1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(buff, *p, d);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *p +=3D d;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* all the bytes to the end. *=
/<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((state-&gt;c =3D state-&gt=
;end - state-&gt;ip) !=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-=
&gt;op =3D state-&gt;ip;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-=
&gt;ip =3D state-&gt;end;;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-&gt;desc++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (d =3D=3D (u16)0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* dom=
ain-name, canonicalise */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int le=
n;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!e=
xtract_name(header, plen, &amp;state-&gt;ip, state-&gt;buff, 1, 0) ||<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; (len =3D to_wire(state-&gt;buff)) =3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; continue;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-=
&gt;c =3D len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-=
&gt;op =3D (unsigned char *)state-&gt;buff;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* pla=
in data preceding a domain-name, don't run off the end of the data */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((s=
tate-&gt;end - state-&gt;ip) &lt; d)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; d =3D state-&gt;end - state-&gt;ip;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (d =
=3D=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; continue;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-=
&gt;op =3D state-&gt;ip;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-=
&gt;c =3D d;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state-=
&gt;ip +=3D d;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return d;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+ <br>
+-/* Bubble sort the RRset into the canonical order. <br>
+-&nbsp;&nbsp; Note that the byte-streams from two RRs may get unsynced: co=
nsider <br>
+-&nbsp;&nbsp; RRs which have two domain-names at the start and then other =
data.<br>
+-&nbsp;&nbsp; The domain-names may have different lengths in each RR, but =
sort equal<br>
+-<br>
+-&nbsp;&nbsp; ------------<br>
+-&nbsp;&nbsp; |abcde|fghi|<br>
+-&nbsp;&nbsp; ------------<br>
+-&nbsp;&nbsp; |abcd|efghi|<br>
+-&nbsp;&nbsp; ------------<br>
+-<br>
+-&nbsp;&nbsp; leaving the following bytes as deciding the order. Hence the=
 nasty left1 and left2 variables.<br>
+-*/<br>
++/* Bubble sort the RRset into the canonical order. */<br>
+ <br>
+ static int sort_rrset(struct dns_header *header, size_t plen, u16 *rr_des=
c, int rrsetidx,
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char **rrset,=
 char *buff1, char *buff2)<br>
+ {<br>
+-&nbsp; int swap, quit, i, j;<br>
++&nbsp; int swap, i, j;<br>
+&nbsp;&nbsp; <br>
+&nbsp;&nbsp; do<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (swap =3D 0, i =3D 0; i &lt; rrse=
tidx-1; i++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rdlen1, rdlen2, left1, lef=
t2, len1, len2, len, rc;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 *dp1, *dp2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *end1, *end2;<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rdlen1, rdlen2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct rdata_state state1, sta=
te2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Note that these =
have been determined to be OK previously,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
o we don't need to check for NULL return here. */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *p1 =3D skip_nam=
e(rrset[i], header, plen, 10);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *p2 =3D skip_nam=
e(rrset[i+1], header, plen, 10);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p1 +=3D 8; /* skip class, type=
, ttl */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GETSHORT(rdlen1, p1);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end1 =3D p1 + rdlen1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p2 +=3D 8; /* skip class, type=
, ttl */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GETSHORT(rdlen2, p2);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end2 =3D p2 + rdlen2; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state1.ip =3D skip_name(rrset[=
i], header, plen, 10);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state2.ip =3D skip_name(rrset[=
i+1], header, plen, 10);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state1.op =3D state2.op =3D NU=
LL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state1.buff =3D buff1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state2.buff =3D buff2;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state1.desc =3D state2.desc =
=3D rr_desc;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dp1 =3D dp2 =3D rr_desc;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state1.ip +=3D 8; /* skip clas=
s, type, ttl */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GETSHORT(rdlen1, state1.ip);<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!CHECK_LEN(header, state1.=
ip, plen, rdlen1))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rrsetidx; /=
* short packet */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state1.end =3D state1.ip + rdl=
en1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (quit =3D 0, left1 =3D 0, =
left2 =3D 0, len1 =3D 0, len2 =3D 0; !quit;)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state2.ip +=3D 8; /* skip clas=
s, type, ttl */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GETSHORT(rdlen2, state2.ip);<b=
r>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!CHECK_LEN(header, state2.=
ip, plen, rdlen2))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rrsetidx; /=
* short packet */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state2.end =3D state2.ip + rdl=
en2; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (1)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (le=
ft1 !=3D 0)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memmove(buff1, buff1 + len1 - left1, left1);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ok=
1, ok2;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((l=
en1 =3D get_rdata(header, plen, end1, buff1 + left1, (MAXDNAME * 2) - left1=
, &amp;p1, &amp;dp1)) =3D=3D 0)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; quit =3D 1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; len1 =3D end1 - p1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; memcpy(buff1 + left1, p1, len1);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len1 +=
=3D left1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (le=
ft2 !=3D 0)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; memmove(buff2, buff2 + len2 - left2, left2);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((l=
en2 =3D get_rdata(header, plen, end2, buff2 + left2, (MAXDNAME *2) - left2,=
 &amp;p2, &amp;dp2)) =3D=3D 0)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; quit =3D 1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; len2 =3D end2 - p2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; memcpy(buff2 + left2, p2, len2);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len2 +=
=3D left2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (le=
n1 &gt; len2)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; left1 =3D len1 - len2, left2 =3D 0, len =3D len2;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<b=
r>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; left2 =3D len2 - len1, left1 =3D 0, len =3D len1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D=
 (len =3D=3D 0) ? 0 : memcmp(buff1, buff2, len);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc=
 &gt; 0 || (rc =3D=3D 0 &amp;&amp; quit &amp;&amp; len1 &gt; len2))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; unsigned char *tmp =3D rrset[i+1];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; rrset[i+1] =3D rrset[i];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; rrset[i] =3D tmp;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; swap =3D quit =3D 1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else i=
f (rc =3D=3D 0 &amp;&amp; quit &amp;&amp; len1 =3D=3D len2)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok1 =
=3D get_rdata(header, plen, &amp;state1);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ok2 =
=3D get_rdata(header, plen, &amp;state2);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!o=
k1 &amp;&amp; !ok2)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Two RRs are equal, remove one copy. RFC 403=
4, para 6.3 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D i+1; j &lt; rrsetidx-1; j++)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rrset[j] =3D rrset[j+1];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; rrsetidx--;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; i--;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; break;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else i=
f (ok1 &amp;&amp; (!ok2 || *state1.op &gt; *state2.op)) <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; unsigned char *tmp =3D rrset[i+1];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; rrset[i+1] =3D rrset[i];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; rrset[i] =3D tmp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; swap =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else i=
f (rc &lt; 0)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; quit =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else i=
f (ok2 &amp;&amp; (!ok1 || *state2.op &gt; *state1.op))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; break;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* arr=
ive here when bytes are equal, go round the loop again<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; and compare the next ones. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp; } while (swap);<br>
+@@ -569,15 +578,18 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wire_len =3D to_wire(keyname);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ctx, (unsigned int)wi=
re_len, (unsigned char*)keyname);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from_wire(keyname);<br>
++<br>
++#define RRBUFLEN 300 /* Most RRs are smaller than this. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; rrsetidx; ++i)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int seg;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *end, *cp;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 len, *dp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int j;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct rdata_state state;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 len;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char rrbuf[RRBUFLEN];=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p =3D rrset[i];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!extract_name(h=
eader, plen, &amp;p, name, 1, 10)) <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
STAT_BOGUS;<br>
+ <br>
+@@ -586,12 +598,11 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* if more labels t=
han in RRsig name, hash *.&lt;no labels in rrsig labels field&gt;&nbsp; 403=
5 5.3.2 */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (labels &lt; nam=
e_labels)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int k;=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (k=
 =3D name_labels - labels; k !=3D 0; k--)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j=
 =3D name_labels - labels; j !=3D 0; j--)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; while (*name_start !=3D '.' &amp;&amp; *name_s=
tart !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name_start++;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (k !=3D 1 &amp;&amp; *name_start =3D=3D '.')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if (j !=3D 1 &amp;&amp; *name_start =3D=3D '.')<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name_start++;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; <br>
+@@ -612,24 +623,44 @@ static int validate_rrset(time_t now, struct dns_hea=
der *header, size_t plen, in<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!CHECK_LEN(head=
er, p, plen, rdlen))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return =
STAT_BOGUS; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end =3D p + rdlen;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* canonicalise rdata and calc=
ulate length of same, use <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; name buffer =
as workspace for get_rdata. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state.ip =3D p;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state.op =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state.desc =3D rr_desc;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state.buff =3D name;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state.end =3D p + rdlen;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* canonicalise rdata and calc=
ulate length of same, use name buffer as workspace.<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Note that na=
me buffer is twice MAXDNAME long in DNSSEC mode. */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp =3D p;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dp =3D rr_desc;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (len =3D 0; (seg =3D get_r=
data(header, plen, end, name, MAXDNAME * 2, &amp;cp, &amp;dp)) !=3D 0; len =
+=3D seg);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len +=3D end - cp;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D htons(len);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j =3D 0; get_rdata(header=
, plen, &amp;state); j++)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (j &lt; RRBUFLE=
N)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rrbuf[=
j] =3D *state.op;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D htons((u16)j);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ctx=
, 2, (unsigned char *)&amp;len); <br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If the RR is shorter than R=
RBUFLEN (most of them, in practice)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; then we can =
just digest it now. If it exceeds RRBUFLEN we have to<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; go back to t=
he start and do it in chunks. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (j &gt;=3D RRBUFLEN)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state.=
ip =3D p;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state.=
op =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state.=
desc =3D rr_desc;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (j=
 =3D 0; get_rdata(header, plen, &amp;state); j++)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; rrbuf[j] =3D *state.op;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; if (j =3D=3D RRBUFLEN - 1)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ctx, RRBUFL=
EN, rrbuf);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; j =3D -1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Now canonicalise again and =
digest. */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp =3D p;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dp =3D rr_desc;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while ((seg =3D get_rdata(head=
er, plen, end, name, MAXDNAME * 2, &amp;cp, &amp;dp)))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ct=
x, seg, (unsigned char *)name);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (cp !=3D end)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ct=
x, end - cp, cp);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (j !=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ct=
x, j, rrbuf);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;digest(ctx, hash-&gt;digest_=
size, digest);<br>
+-- <br>
+2.20.1<br>
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.p=
atch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch<b=
r>
new file mode 100644<br>
index 000000000..64ebed257<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25684.patch<br=
>
@@ -0,0 +1,100 @@<br>
+From 257ac0c5f7732cbc6aa96fdd3b06602234593aca Mon Sep 17 00:00:00 2001<br>
+From: Simon Kelley &lt;simon@thekelleys.org.uk&gt;<br>
+Date: Thu, 12 Nov 2020 18:49:23 +0000<br>
+Subject: [PATCH] Check destination of DNS UDP query replies.<br>
+<br>
+At any time, dnsmasq will have a set of sockets open, bound to<br>
+random ports, on which it sends queries to upstream nameservers.<br>
+This patch fixes the existing problem that a reply for ANY in-flight<br>
+query would be accepted via ANY open port, which increases the<br>
+chances of an attacker flooding answers &quot;in the blind&quot; in an<br>
+attempt to poison the DNS cache. CERT VU#434904 refers.<br>
+<br>
+Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
+---<br>
+ CHANGELOG&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 +++++-<br>
+ src/forward.c | 37 ++++++++++++++++++++++++++++---------<br>
+ 2 files changed, 33 insertions(+), 10 deletions(-)<br>
+<br>
+CVE: CVE-2020-25684<br>
+Upstream-Status: Backport [<a href=3D"https://thekelleys.org.uk/gitweb/?p=
=3Ddnsmasq.git;a=3Dpatch;h=3D257ac0c5f7732cbc6aa96fdd3b06602234593aca">http=
s://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dpatch;h=3D257ac0c5f7732cb=
c6aa96fdd3b06602234593aca</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/forward.c b/src/forward.c<br>
+index 9c2b2c6..134e0fc 100644<br>
+--- a/src/forward.c<br>
++++ b/src/forward.c<br>
+@@ -16,7 +16,7 @@<br>
+ <br>
+ #include &quot;dnsmasq.h&quot;<br>
+ <br>
+-static struct frec *lookup_frec(unsigned short id, void *hash);<br>
++static struct frec *lookup_frec(unsigned short id, int fd, int family, vo=
id *hash);<br>
+ static struct frec *lookup_frec_by_sender(unsigned short id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; union mysockaddr *addr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; void *hash);<br>
+@@ -805,7 +805,7 @@ void reply_query(int fd, int family, time_t now)<br>
+&nbsp;&nbsp; crc =3D questions_crc(header, n, daemon-&gt;namebuff);<br>
+ #endif<br>
+&nbsp;&nbsp; <br>
+-&nbsp; if (!(forward =3D lookup_frec(ntohs(header-&gt;id), hash)))<br>
++&nbsp; if (!(forward =3D lookup_frec(ntohs(header-&gt;id), fd, family, ha=
sh)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+&nbsp;&nbsp; <br>
+ #ifdef HAVE_DUMPFILE<br>
+@@ -2339,14 +2339,25 @@ struct frec *get_new_frec(time_t now, int *wait, s=
truct frec *force)<br>
+ }<br>
+ <br>
+ /* crc is all-ones if not known. */<br>
+-static struct frec *lookup_frec(unsigned short id, void *hash)<br>
++static struct frec *lookup_frec(unsigned short id, int fd, int family, vo=
id *hash)<br>
+ {<br>
+&nbsp;&nbsp; struct frec *f;<br>
+ <br>
+&nbsp;&nbsp; for(f =3D daemon-&gt;frec_list; f; f =3D f-&gt;next)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (f-&gt;sentto &amp;&amp; f-&gt;new_id =3D=3D i=
d &amp;&amp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!hash || memcmp(hash, f-&gt;ha=
sh, HASH_SIZE) =3D=3D 0))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return f;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* sent from random port */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (family =3D=3D AF_INET &amp;&amp; f-&gt=
;rfd4 &amp;&amp; f-&gt;rfd4-&gt;fd =3D=3D fd)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return f;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (family =3D=3D AF_INET6 &amp;&amp; f-&g=
t;rfd6 &amp;&amp; f-&gt;rfd6-&gt;fd =3D=3D fd)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return f;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* sent to upstream from bound socket. */<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (f-&gt;sentto-&gt;sfd &amp;&amp; f-&gt;=
sentto-&gt;sfd-&gt;fd =3D=3D fd)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return f;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp; return NULL;<br>
+ }<br>
+@@ -2407,12 +2418,20 @@ void server_gone(struct server *server)<br>
+ static unsigned short get_id(void)<br>
+ {<br>
+&nbsp;&nbsp; unsigned short ret =3D 0;<br>
++&nbsp; struct frec *f;<br>
+&nbsp;&nbsp; <br>
+-&nbsp; do <br>
+-&nbsp;&nbsp;&nbsp; ret =3D rand16();<br>
+-&nbsp; while (lookup_frec(ret, NULL));<br>
+-&nbsp; <br>
+-&nbsp; return ret;<br>
++&nbsp; while (1)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D rand16();<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* ensure id is unique. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (f =3D daemon-&gt;frec_list; f; f =3D =
f-&gt;next)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (f-&gt;sentto &amp;&amp; f-&gt;new_id =
=3D=3D ret)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!f)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
++&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+ <br>
+ <br>
+--<br>
+2.20.1<br>
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.pat=
ch<br>
new file mode 100644<br>
index 000000000..a8d9b7e3f<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-1.patch<=
br>
@@ -0,0 +1,590 @@<br>
+From 2d765867c597db18be9d876c9c17e2c0fe1953cd Mon Sep 17 00:00:00 2001<br>
+From: Simon Kelley &lt;simon@thekelleys.org.uk&gt;<br>
+Date: Thu, 12 Nov 2020 22:06:07 +0000<br>
+Subject: [PATCH] Use SHA-256 to provide security against DNS cache poisoni=
ng.<br>
+<br>
+Use the SHA-256 hash function to verify that DNS answers<br>
+received are for the questions originally asked. This replaces<br>
+the slightly insecure SHA-1 (when compiled with DNSSEC) or<br>
+the very insecure CRC32 (otherwise). Refer: CERT VU#434904.<br>
+<br>
+Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
+---<br>
+ CHANGELOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; |&nbsp;&nbsp; 5 +<br>
+ Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp;&nbsp; 3 +-<br>
+ bld/Android.mk&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-<br>
+ src/dnsmasq.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 11 +-<br>
+ src/dnssec.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 31 -=
----<br>
+ src/forward.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 43 ++----=
-<br>
+ src/hash_questions.c | 281 +++++++++++++++++++++++++++++++++++++++++++<br=
>
+ src/rfc1035.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 49 ------=
--<br>
+ 8 files changed, 301 insertions(+), 124 deletions(-)<br>
+ create mode 100644 src/hash_questions.c<br>
+<br>
+CVE: CVE-2020-25685<br>
+Upstream-Status: Backport []http://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.g=
it;a=3Dcommit;h=3D2d765867c597db18be9d876c9c17e2c0fe1953cd]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 78e25f0..0354e0f 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -77,7 +77,8 @@ objs =3D cache.o rfc1035.o util.o option.o forward.o net=
work.o \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; helper.o tftp.o log.o conntrack=
.o dhcp6.o rfc3315.o \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dhcp-common.o outpacket.o radv.=
o slaac.o auth.o ipset.o \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; domain.o dnssec.o blockdata.o t=
ables.o loop.o inotify.o \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; poll.o rrfilter.o edns0.o arp.o cryp=
to.o dump.o ubus.o metrics.o<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; poll.o rrfilter.o edns0.o arp.o cryp=
to.o dump.o ubus.o \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; metrics.o hash_questions.o<br>
+ <br>
+ hdrs =3D dnsmasq.h config.h dhcp-protocol.h dhcp6-protocol.h \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dns-protocol.h radv-protocol.h =
ip6addr.h metrics.h<br>
+diff --git a/bld/Android.mk b/bld/Android.mk<br>
+index 080a615..f924be9 100644<br>
+--- a/bld/Android.mk<br>
++++ b/bld/Android.mk<br>
+@@ -11,7 +11,7 @@ LOCAL_SRC_FILES :=3D&nbsp; bpf.c cache.c dbus.c dhcp.c d=
nsmasq.c \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radv.c slaac.c auth.c ipset.c doma=
in.c \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dnssec.c dnssec-openssl.c blockdat=
a.c tables.c \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; loop.c inotify.c poll.c rrfilter.c=
 edns0.c arp.c \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crypto.c dump.c ubus.c<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crypto.c dump.c ubus.c metrics.c hash_questio=
ns.c<br>
+ <br>
+ LOCAL_MODULE :=3D dnsmasq<br>
+ <br>
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h<br>
+index 4d78c37..0a7639f 100644<br>
+--- a/src/dnsmasq.h<br>
++++ b/src/dnsmasq.h<br>
+@@ -655,11 +655,7 @@ struct hostsfile {<br>
+ #define FREC_TEST_PKTSZ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 256<br>
+ #define FREC_HAS_EXTRADATA&nbsp;&nbsp;&nbsp; 512&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <br>
+ <br>
+-#ifdef HAVE_DNSSEC<br>
+-#define HASH_SIZE 20 /* SHA-1 digest size */<br>
+-#else<br>
+-#define HASH_SIZE sizeof(int)<br>
+-#endif<br>
++#define HASH_SIZE 32 /* SHA-256 digest size */<br>
+ <br>
+ struct frec {<br>
+&nbsp;&nbsp; union mysockaddr source;<br>
+@@ -1229,7 +1225,6 @@ int check_for_bogus_wildcard(struct dns_header *head=
er, size_t qlen, char *name,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; struct bogus_addr *baddr, time_t now);<br>
+ int check_for_ignored_address(struct dns_header *header, size_t qlen, str=
uct bogus_addr *baddr);<br>
+ int check_for_local_domain(char *name, time_t now);<br>
+-unsigned int questions_crc(struct dns_header *header, size_t plen, char *=
name);<br>
+ size_t resize_packet(struct dns_header *header, size_t plen, <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *pheader, size_t hlen);<br>
+ int add_resource_record(struct dns_header *header, char *limit, int *trun=
cp,<br>
+@@ -1254,9 +1249,11 @@ int dnssec_validate_reply(time_t now, struct dns_he=
ader *header, size_t plen, ch<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; int check_unsigned, int *neganswer, int *nons, int *nsec_ttl);<br>
+ int dnskey_keytag(int alg, int flags, unsigned char *key, int keylen);<br=
>
+ size_t filter_rrsigs(struct dns_header *header, size_t plen);<br>
+-unsigned char* hash_questions(struct dns_header *header, size_t plen, cha=
r *name);<br>
+ int setup_timestamp(void);<br>
+ <br>
++/* hash_questions.c */<br>
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name);<br>
++<br>
+ /* crypto.c */<br>
+ const struct nettle_hash *hash_find(char *name);<br>
+ int hash_init(const struct nettle_hash *hash, void **ctxp, unsigned char =
**digestp);<br>
+diff --git a/src/dnssec.c b/src/dnssec.c<br>
+index e95aa34..9410a7e 100644<br>
+--- a/src/dnssec.c<br>
++++ b/src/dnssec.c<br>
+@@ -2087,35 +2087,4 @@ size_t dnssec_generate_query(struct dns_header *hea=
der, unsigned char *end, char<br>
+&nbsp;&nbsp; return ret;<br>
+ }<br>
+ <br>
+-unsigned char* hash_questions(struct dns_header *header, size_t plen, cha=
r *name)<br>
+-{<br>
+-&nbsp; int q;<br>
+-&nbsp; unsigned int len;<br>
+-&nbsp; unsigned char *p =3D (unsigned char *)(header+1);<br>
+-&nbsp; const struct nettle_hash *hash;<br>
+-&nbsp; void *ctx;<br>
+-&nbsp; unsigned char *digest;<br>
+-&nbsp; <br>
+-&nbsp; if (!(hash =3D hash_find(&quot;sha1&quot;)) || !hash_init(hash, &a=
mp;ctx, &amp;digest))<br>
+-&nbsp;&nbsp;&nbsp; return NULL;<br>
+-&nbsp; <br>
+-&nbsp; for (q =3D ntohs(header-&gt;qdcount); q !=3D 0; q--) <br>
+-&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!extract_name(header, plen, &amp;p, na=
me, 1, 4))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; /* bad packet */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len =3D to_wire(name);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ctx, len, (unsigned char *=
)name);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* CRC the class and type as well */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ctx, 4, p);<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p +=3D 4;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!CHECK_LEN(header, p, plen, 0))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; /* bad packet */<br>
+-&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp; <br>
+-&nbsp; hash-&gt;digest(ctx, hash-&gt;digest_size, digest);<br>
+-&nbsp; return digest;<br>
+-}<br>
+-<br>
+ #endif /* HAVE_DNSSEC */<br>
+diff --git a/src/forward.c b/src/forward.c<br>
+index 134e0fc..4f9a963 100644<br>
+--- a/src/forward.c<br>
++++ b/src/forward.c<br>
+@@ -256,19 +256,16 @@ static int forward_query(int udpfd, union mysockaddr=
 *udpaddr,<br>
+&nbsp;&nbsp; union all_addr *addrp =3D NULL;<br>
+&nbsp;&nbsp; unsigned int flags =3D 0;<br>
+&nbsp;&nbsp; struct server *start =3D NULL;<br>
+-#ifdef HAVE_DNSSEC<br>
+&nbsp;&nbsp; void *hash =3D hash_questions(header, plen, daemon-&gt;namebu=
ff);<br>
++#ifdef HAVE_DNSSEC<br>
+&nbsp;&nbsp; int do_dnssec =3D 0;<br>
+-#else<br>
+-&nbsp; unsigned int crc =3D questions_crc(header, plen, daemon-&gt;namebu=
ff);<br>
+-&nbsp; void *hash =3D &amp;crc;<br>
+ #endif<br>
+&nbsp;&nbsp; unsigned int gotname =3D extract_request(header, plen, daemon=
-&gt;namebuff, NULL);<br>
+&nbsp;&nbsp; unsigned char *oph =3D find_pseudoheader(header, plen, NULL, =
NULL, NULL, NULL);<br>
+&nbsp;&nbsp; (void)do_bit;<br>
+ <br>
+&nbsp;&nbsp; /* may be no servers available. */<br>
+-&nbsp; if (forward || (hash &amp;&amp; (forward =3D lookup_frec_by_sender=
(ntohs(header-&gt;id), udpaddr, hash))))<br>
++&nbsp; if (forward || (forward =3D lookup_frec_by_sender(ntohs(header-&gt=
;id), udpaddr, hash)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If we didn't get an answer adverti=
sing a maximal packet in EDNS,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fall back to 1280, which =
should work everywhere on IPv6.<br>
+@@ -769,9 +766,6 @@ void reply_query(int fd, int family, time_t now)<br>
+&nbsp;&nbsp; size_t nn;<br>
+&nbsp;&nbsp; struct server *server;<br>
+&nbsp;&nbsp; void *hash;<br>
+-#ifndef HAVE_DNSSEC<br>
+-&nbsp; unsigned int crc;<br>
+-#endif<br>
+ <br>
+&nbsp;&nbsp; /* packet buffer overwritten */<br>
+&nbsp;&nbsp; daemon-&gt;srv_save =3D NULL;<br>
+@@ -798,12 +792,7 @@ void reply_query(int fd, int family, time_t now)<br>
+&nbsp;&nbsp; if (difftime(now, server-&gt;pktsz_reduced) &gt; UDP_TEST_TIM=
E)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; server-&gt;edns_pktsz =3D daemon-&gt;edns_pktsz;<=
br>
+ <br>
+-#ifdef HAVE_DNSSEC<br>
+&nbsp;&nbsp; hash =3D hash_questions(header, n, daemon-&gt;namebuff);<br>
+-#else<br>
+-&nbsp; hash =3D &amp;crc;<br>
+-&nbsp; crc =3D questions_crc(header, n, daemon-&gt;namebuff);<br>
+-#endif<br>
+&nbsp;&nbsp; <br>
+&nbsp;&nbsp; if (!(forward =3D lookup_frec(ntohs(header-&gt;id), fd, famil=
y, hash)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
+@@ -1115,8 +1104,7 @@ void reply_query(int fd, int family, time_t now)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; log_query(=
F_NOEXTRA | F_DNSSEC | F_IPV6, daemon-&gt;keyname, (union all_addr *)&amp;(=
server-&gt;addr.in6.sin6_addr),<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; querystr(&quot;dnssec-que=
ry&quot;, querytype));<br>
+&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((hash =3D hash_questions(head=
er, nn, daemon-&gt;namebuff)))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(new-&gt;hash, =
hash, HASH_SIZE);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(new-&gt;hash, hash_questio=
ns(header, nn, daemon-&gt;namebuff), HASH_SIZE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&gt;new_id =3D get=
_id();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header-&gt;id =3D hton=
s(new-&gt;new_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Save query for retr=
ansmission */<br>
+@@ -1970,15 +1958,9 @@ unsigned char *tcp_request(int confd, time_t now,<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; if (!flags &amp;&amp; last_server)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; struct server *firstsendto =3D NULL;<br>
+-#ifdef HAVE_DNSSEC<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; unsigned char *newhash, hash[HASH_SIZE];<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; if ((newhash =3D hash_questions(header, (unsigned int)siz=
e, daemon-&gt;namebuff)))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(hash, newhash, HASH_SIZE);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(hash, 0, HASH_SIZE);<br>
+-#else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; unsigned int crc =3D questions_crc(header, (unsigned int)=
size, daemon-&gt;namebuff);<br>
+-#endif&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; unsigned char hash[HASH_SIZE];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; memcpy(hash, hash_questions(header, (unsigned int)size, d=
aemon-&gt;namebuff), HASH_SIZE);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Loop round available servers until we succe=
ed in connecting to one.<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Note that this code subtly e=
nsures that consecutive queries on this connection<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; which can go to the same ser=
ver, do so. */<br>
+@@ -2117,20 +2099,11 @@ unsigned char *tcp_request(int confd, time_t now,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If the crc of the q=
uestion section doesn't match the crc we sent, then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; some=
one might be attempting to insert bogus values into the cache by
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send=
ing replies containing questions and bogus answers. */<br>
+-#ifdef HAVE_DNSSEC<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; newhash =3D hash_questions(header=
, (unsigned int)m, daemon-&gt;namebuff);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!newhash || memcmp(hash, newh=
ash, HASH_SIZE) !=3D 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (memcmp(hash, hash_questions(h=
eader, (unsigned int)m, daemon-&gt;namebuff), HASH_SIZE) !=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; m =3D 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; break;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-#else&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (crc !=3D questions_crc(header=
, (unsigned int)m, daemon-&gt;namebuff))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m =3D 0;<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br=
>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-#endif<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m =3D process_reply(he=
ader, now, last_server, (unsigned int)m,
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; option_bool(OPT_NO_REBIND) &amp;&amp; !norebind, no_cache_dnssec=
, cache_secure, bogusanswer,<br>
+@@ -2345,7 +2318,7 @@ static struct frec *lookup_frec(unsigned short id, i=
nt fd, int family, void *has<br>
+ <br>
+&nbsp;&nbsp; for(f =3D daemon-&gt;frec_list; f; f =3D f-&gt;next)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (f-&gt;sentto &amp;&amp; f-&gt;new_id =3D=3D i=
d &amp;&amp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (!hash || memcmp(hash, f-&gt;hash, HASH_SI=
ZE) =3D=3D 0))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (memcmp(hash, f-&gt;hash, HASH_SIZE) =3D=
=3D 0))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* sent from random port */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (family =3D=3D AF_INET &amp;=
&amp; f-&gt;rfd4 &amp;&amp; f-&gt;rfd4-&gt;fd =3D=3D fd)<br>
+diff --git a/src/hash_questions.c b/src/hash_questions.c<br>
+new file mode 100644<br>
+index 0000000..ae112ac<br>
+--- /dev/null<br>
++++ b/src/hash_questions.c<br>
+@@ -0,0 +1,281 @@<br>
++/* Copyright (c) 2012-2020 Simon Kelley<br>
++<br>
++&nbsp;&nbsp; This program is free software; you can redistribute it and/o=
r modify<br>
++&nbsp;&nbsp; it under the terms of the GNU General Public License as publ=
ished by<br>
++&nbsp;&nbsp; the Free Software Foundation; version 2 dated June, 1991, or=
<br>
++&nbsp;&nbsp; (at your option) version 3 dated 29 June, 2007.<br>
++<br>
++&nbsp;&nbsp; This program is distributed in the hope that it will be usef=
ul,<br>
++&nbsp;&nbsp; but WITHOUT ANY WARRANTY; without even the implied warranty =
of<br>
++&nbsp;&nbsp; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nbsp; S=
ee the<br>
++&nbsp;&nbsp; GNU General Public License for more details.<br>
++<br>
++&nbsp;&nbsp; You should have received a copy of the GNU General Public Li=
cense<br>
++&nbsp;&nbsp; along with this program.&nbsp; If not, see &lt;<a href=3D"ht=
tp://www.gnu.org/licenses/">http://www.gnu.org/licenses/</a>&gt;.<br>
++*/<br>
++<br>
++<br>
++/* Hash the question section. This is used to safely detect query<br>
++&nbsp;&nbsp; retransmission and to detect answers to questions we didn't =
ask, which<br>
++&nbsp;&nbsp; might be poisoning attacks. Note that we decode the name rat=
her<br>
++&nbsp;&nbsp; than CRC the raw bytes, since replies might be compressed di=
fferently.<br>
++&nbsp;&nbsp; We ignore case in the names for the same reason.<br>
++<br>
++&nbsp;&nbsp; The hash used is SHA-256. If we're building with DNSSEC supp=
ort,<br>
++&nbsp;&nbsp; we use the Nettle cypto library. If not, we prefer not to<br=
>
++&nbsp;&nbsp; add a dependency on Nettle, and use a stand-alone implementa=
ion.<br>
++*/<br>
++<br>
++#include &quot;dnsmasq.h&quot;<br>
++<br>
++#ifdef HAVE_DNSSEC<br>
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)<br>
++{<br>
++&nbsp; int q;<br>
++&nbsp; unsigned char *p =3D (unsigned char *)(header+1);<br>
++&nbsp; const struct nettle_hash *hash;<br>
++&nbsp; void *ctx;<br>
++&nbsp; unsigned char *digest;<br>
++&nbsp; <br>
++&nbsp; if (!(hash =3D hash_find(&quot;sha256&quot;)) || !hash_init(hash, =
&amp;ctx, &amp;digest))<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* don't think this can ever happen. */<br=
>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static unsigned char dummy[HASH_SIZE];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; static int warned =3D 0;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (warned)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; my_syslog(LOG_ERR, _(&quot;Failed to creat=
e SHA-256 hash object&quot;));<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; warned =3D 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return dummy;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; <br>
++&nbsp; for (q =3D ntohs(header-&gt;qdcount); q !=3D 0; q--)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *cp, c;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!extract_name(header, plen, &amp;p, na=
me, 1, 4))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; /* bad packet */<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (cp =3D name; (c =3D *cp); cp++)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c &gt;=3D 'A' &amp;&amp; c &lt;=
=3D 'Z')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *cp +=3D 'a' - 'A';<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ctx, cp - name, (unsigned =
char *)name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* CRC the class and type as well */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash-&gt;update(ctx, 4, p);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p +=3D 4;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!CHECK_LEN(header, p, plen, 0))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; /* bad packet */<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; <br>
++&nbsp; hash-&gt;digest(ctx, hash-&gt;digest_size, digest);<br>
++&nbsp; return digest;<br>
++}<br>
++<br>
++#else /* HAVE_DNSSEC */<br>
++<br>
++#define SHA256_BLOCK_SIZE 32&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; // SHA256 outputs a 32 byte digest<br>
++typedef unsigned char BYTE;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; // 8-bit byte<br>
++typedef unsigned int&nbsp; WORD;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // 32-bit word, change to &quot;long&quot; =
for 16-bit machines<br>
++<br>
++typedef struct {<br>
++&nbsp; BYTE data[64];<br>
++&nbsp; WORD datalen;<br>
++&nbsp; unsigned long long bitlen;<br>
++&nbsp; WORD state[8];<br>
++} SHA256_CTX;<br>
++<br>
++static void sha256_init(SHA256_CTX *ctx);<br>
++static void sha256_update(SHA256_CTX *ctx, const BYTE data[], size_t len)=
;<br>
++static void sha256_final(SHA256_CTX *ctx, BYTE hash[]);<br>
++<br>
++<br>
++unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)<br>
++{<br>
++&nbsp; int q;<br>
++&nbsp; unsigned char *p =3D (unsigned char *)(header+1);<br>
++&nbsp; SHA256_CTX ctx;<br>
++&nbsp; static BYTE digest[SHA256_BLOCK_SIZE];<br>
++&nbsp; <br>
++&nbsp; sha256_init(&amp;ctx);<br>
++&nbsp;&nbsp;&nbsp; <br>
++&nbsp; for (q =3D ntohs(header-&gt;qdcount); q !=3D 0; q--)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *cp, c;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!extract_name(header, plen, &amp;p, na=
me, 1, 4))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; /* bad packet */<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (cp =3D name; (c =3D *cp); cp++)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c &gt;=3D 'A' &amp;&amp; c &lt;=
=3D 'Z')<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *cp +=3D 'a' - 'A';<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha256_update(&amp;ctx, (BYTE *)name, cp -=
 name);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* CRC the class and type as well */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha256_update(&amp;ctx, (BYTE *)p, 4);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p +=3D 4;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!CHECK_LEN(header, p, plen, 0))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; /* bad packet */<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; <br>
++&nbsp; sha256_final(&amp;ctx, digest);<br>
++&nbsp; return (unsigned char *)digest;<br>
++}<br>
++<br>
++/* Code from here onwards comes from <a href=3D"https://github.com/B-Con/=
crypto-algorithms">
https://github.com/B-Con/crypto-algorithms</a><br>
++&nbsp;&nbsp; and was written by Brad Conte (brad@bradconte.com), to whom =
all credit is given.<br>
++<br>
++&nbsp;&nbsp; This code is in the public domain, and the copyright notice =
at the head of this<br>
++&nbsp;&nbsp; file does not apply to it.<br>
++*/<br>
++<br>
++<br>
++/****************************** MACROS ******************************/<br=
>
++#define ROTLEFT(a,b) (((a) &lt;&lt; (b)) | ((a) &gt;&gt; (32-(b))))<br>
++#define ROTRIGHT(a,b) (((a) &gt;&gt; (b)) | ((a) &lt;&lt; (32-(b))))<br>
++<br>
++#define CH(x,y,z) (((x) &amp; (y)) ^ (~(x) &amp; (z)))<br>
++#define MAJ(x,y,z) (((x) &amp; (y)) ^ ((x) &amp; (z)) ^ ((y) &amp; (z)))<=
br>
++#define EP0(x) (ROTRIGHT(x,2) ^ ROTRIGHT(x,13) ^ ROTRIGHT(x,22))<br>
++#define EP1(x) (ROTRIGHT(x,6) ^ ROTRIGHT(x,11) ^ ROTRIGHT(x,25))<br>
++#define SIG0(x) (ROTRIGHT(x,7) ^ ROTRIGHT(x,18) ^ ((x) &gt;&gt; 3))<br>
++#define SIG1(x) (ROTRIGHT(x,17) ^ ROTRIGHT(x,19) ^ ((x) &gt;&gt; 10))<br>
++<br>
++/**************************** VARIABLES *****************************/<br=
>
++static const WORD k[64] =3D {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x4=
28a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0=
xab1c5ed5,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xd=
807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0=
xc19bf174,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xe=
49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0=
x76f988da,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x9=
83e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0=
x14292967,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x2=
7b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0=
x92722c85,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0xa=
2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0=
x106aa070,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x1=
9a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0=
x682e6ff3,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x7=
48f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0=
xc67178f2<br>
++};<br>
++<br>
++/*********************** FUNCTION DEFINITIONS ***********************/<br=
>
++static void sha256_transform(SHA256_CTX *ctx, const BYTE data[])<br>
++{<br>
++&nbsp; WORD a, b, c, d, e, f, g, h, i, j, t1, t2, m[64];<br>
++&nbsp; <br>
++&nbsp; for (i =3D 0, j =3D 0; i &lt; 16; ++i, j +=3D 4)<br>
++&nbsp;&nbsp;&nbsp; m[i] =3D (data[j] &lt;&lt; 24) | (data[j + 1] &lt;&lt;=
 16) | (data[j + 2] &lt;&lt; 8) | (data[j + 3]);<br>
++&nbsp; for ( ; i &lt; 64; ++i)<br>
++&nbsp;&nbsp;&nbsp; m[i] =3D SIG1(m[i - 2]) + m[i - 7] + SIG0(m[i - 15]) +=
 m[i - 16];<br>
++<br>
++&nbsp; a =3D ctx-&gt;state[0];<br>
++&nbsp; b =3D ctx-&gt;state[1];<br>
++&nbsp; c =3D ctx-&gt;state[2];<br>
++&nbsp; d =3D ctx-&gt;state[3];<br>
++&nbsp; e =3D ctx-&gt;state[4];<br>
++&nbsp; f =3D ctx-&gt;state[5];<br>
++&nbsp; g =3D ctx-&gt;state[6];<br>
++&nbsp; h =3D ctx-&gt;state[7];<br>
++<br>
++&nbsp; for (i =3D 0; i &lt; 64; ++i)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t1 =3D h + EP1(e) + CH(e,f,g) + k[i] + m[i=
];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t2 =3D EP0(a) + MAJ(a,b,c);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; h =3D g;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g =3D f;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f =3D e;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e =3D d + t1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d =3D c;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c =3D b;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; b =3D a;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; a =3D t1 + t2;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; <br>
++&nbsp; ctx-&gt;state[0] +=3D a;<br>
++&nbsp; ctx-&gt;state[1] +=3D b;<br>
++&nbsp; ctx-&gt;state[2] +=3D c;<br>
++&nbsp; ctx-&gt;state[3] +=3D d;<br>
++&nbsp; ctx-&gt;state[4] +=3D e;<br>
++&nbsp; ctx-&gt;state[5] +=3D f;<br>
++&nbsp; ctx-&gt;state[6] +=3D g;<br>
++&nbsp; ctx-&gt;state[7] +=3D h;<br>
++}<br>
++<br>
++static void sha256_init(SHA256_CTX *ctx)<br>
++{<br>
++&nbsp; ctx-&gt;datalen =3D 0;<br>
++&nbsp; ctx-&gt;bitlen =3D 0;<br>
++&nbsp; ctx-&gt;state[0] =3D 0x6a09e667;<br>
++&nbsp; ctx-&gt;state[1] =3D 0xbb67ae85;<br>
++&nbsp; ctx-&gt;state[2] =3D 0x3c6ef372;<br>
++&nbsp; ctx-&gt;state[3] =3D 0xa54ff53a;<br>
++&nbsp; ctx-&gt;state[4] =3D 0x510e527f;<br>
++&nbsp; ctx-&gt;state[5] =3D 0x9b05688c;<br>
++&nbsp; ctx-&gt;state[6] =3D 0x1f83d9ab;<br>
++&nbsp; ctx-&gt;state[7] =3D 0x5be0cd19;<br>
++}<br>
++<br>
++static void sha256_update(SHA256_CTX *ctx, const BYTE data[], size_t len)=
<br>
++{<br>
++&nbsp; WORD i;<br>
++&nbsp; <br>
++&nbsp; for (i =3D 0; i &lt; len; ++i)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;data[ctx-&gt;datalen] =3D data[i];=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;datalen++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ctx-&gt;datalen =3D=3D 64) {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha256_transform(ctx, ctx-&gt;data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;bitlen +=3D 512;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;datalen =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp; }<br>
++}<br>
++<br>
++static void sha256_final(SHA256_CTX *ctx, BYTE hash[])<br>
++{<br>
++&nbsp; WORD i;<br>
++&nbsp; <br>
++&nbsp; i =3D ctx-&gt;datalen;<br>
++<br>
++&nbsp; // Pad whatever data is left in the buffer.<br>
++&nbsp; if (ctx-&gt;datalen &lt; 56)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;data[i++] =3D 0x80;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (i &lt; 56)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;data[i++] =3D 0x00;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; else<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;data[i++] =3D 0x80;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (i &lt; 64)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx-&gt;data[i++] =3D 0x00;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sha256_transform(ctx, ctx-&gt;data);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(ctx-&gt;data, 0, 56);<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; <br>
++&nbsp; // Append to the padding the total message's length in bits and tr=
ansform.<br>
++&nbsp; ctx-&gt;bitlen +=3D ctx-&gt;datalen * 8;<br>
++&nbsp; ctx-&gt;data[63] =3D ctx-&gt;bitlen;<br>
++&nbsp; ctx-&gt;data[62] =3D ctx-&gt;bitlen &gt;&gt; 8;<br>
++&nbsp; ctx-&gt;data[61] =3D ctx-&gt;bitlen &gt;&gt; 16;<br>
++&nbsp; ctx-&gt;data[60] =3D ctx-&gt;bitlen &gt;&gt; 24;<br>
++&nbsp; ctx-&gt;data[59] =3D ctx-&gt;bitlen &gt;&gt; 32;<br>
++&nbsp; ctx-&gt;data[58] =3D ctx-&gt;bitlen &gt;&gt; 40;<br>
++&nbsp; ctx-&gt;data[57] =3D ctx-&gt;bitlen &gt;&gt; 48;<br>
++&nbsp; ctx-&gt;data[56] =3D ctx-&gt;bitlen &gt;&gt; 56;<br>
++&nbsp; sha256_transform(ctx, ctx-&gt;data);<br>
++&nbsp; <br>
++&nbsp; // Since this implementation uses little endian byte ordering and =
SHA uses big endian,<br>
++&nbsp; // reverse all the bytes when copying the final state to the outpu=
t hash.<br>
++&nbsp; for (i =3D 0; i &lt; 4; ++i)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash[i]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D =
(ctx-&gt;state[0] &gt;&gt; (24 - i * 8)) &amp; 0x000000ff;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash[i + 4]&nbsp; =3D (ctx-&gt;state[1] &g=
t;&gt; (24 - i * 8)) &amp; 0x000000ff;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash[i + 8]&nbsp; =3D (ctx-&gt;state[2] &g=
t;&gt; (24 - i * 8)) &amp; 0x000000ff;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash[i + 12] =3D (ctx-&gt;state[3] &gt;&gt=
; (24 - i * 8)) &amp; 0x000000ff;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash[i + 16] =3D (ctx-&gt;state[4] &gt;&gt=
; (24 - i * 8)) &amp; 0x000000ff;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash[i + 20] =3D (ctx-&gt;state[5] &gt;&gt=
; (24 - i * 8)) &amp; 0x000000ff;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash[i + 24] =3D (ctx-&gt;state[6] &gt;&gt=
; (24 - i * 8)) &amp; 0x000000ff;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hash[i + 28] =3D (ctx-&gt;state[7] &gt;&gt=
; (24 - i * 8)) &amp; 0x000000ff;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++}<br>
++<br>
++#endif<br>
+diff --git a/src/rfc1035.c b/src/rfc1035.c<br>
+index fefe63d..a8cdc6e 100644<br>
+--- a/src/rfc1035.c<br>
++++ b/src/rfc1035.c<br>
+@@ -333,55 +333,6 @@ unsigned char *skip_section(unsigned char *ansp, int =
count, struct dns_header *h<br>
+&nbsp;&nbsp; return ansp;<br>
+ }<br>
+ <br>
+-/* CRC the question section. This is used to safely detect query <br>
+-&nbsp;&nbsp; retransmission and to detect answers to questions we didn't =
ask, which <br>
+-&nbsp;&nbsp; might be poisoning attacks. Note that we decode the name rat=
her <br>
+-&nbsp;&nbsp; than CRC the raw bytes, since replies might be compressed di=
fferently. <br>
+-&nbsp;&nbsp; We ignore case in the names for the same reason. Return all-=
ones<br>
+-&nbsp;&nbsp; if there is not question section. */<br>
+-#ifndef HAVE_DNSSEC<br>
+-unsigned int questions_crc(struct dns_header *header, size_t plen, char *=
name)<br>
+-{<br>
+-&nbsp; int q;<br>
+-&nbsp; unsigned int crc =3D 0xffffffff;<br>
+-&nbsp; unsigned char *p1, *p =3D (unsigned char *)(header+1);<br>
+-<br>
+-&nbsp; for (q =3D ntohs(header-&gt;qdcount); q !=3D 0; q--) <br>
+-&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!extract_name(header, plen, &amp;p, na=
me, 1, 4))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return crc; /* bad packet */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (p1 =3D (unsigned char *)name; *p1; p1=
++)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 8;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char c =3D *p1;<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (c &gt;=3D 'A' &amp;&amp; c=
 &lt;=3D 'Z')<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c +=3D 'a' - 'A';<=
br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crc ^=3D c &lt;&lt; 24;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (i--)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crc =3D crc &amp; =
0x80000000 ? (crc &lt;&lt; 1) ^ 0x04c11db7 : crc &lt;&lt; 1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* CRC the class and type as well */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (p1 =3D p; p1 &lt; p+4; p1++)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i =3D 8;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crc ^=3D *p1 &lt;&lt; 24;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (i--)<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crc =3D crc &amp; =
0x80000000 ? (crc &lt;&lt; 1) ^ 0x04c11db7 : crc &lt;&lt; 1;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p +=3D 4;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!CHECK_LEN(header, p, plen, 0))<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return crc; /* bad packet */<br>
+-&nbsp;&nbsp;&nbsp; }<br>
+-<br>
+-&nbsp; return crc;<br>
+-}<br>
+-#endif<br>
+-<br>
+ size_t resize_packet(struct dns_header *header, size_t plen, unsigned cha=
r *pheader, size_t hlen)<br>
+ {<br>
+&nbsp;&nbsp; unsigned char *ansp =3D skip_questions(header, plen);<br>
+--<br>
+2.20.1<br>
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.pat=
ch<br>
new file mode 100644<br>
index 000000000..6f60b36ed<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25685-2.patch<=
br>
@@ -0,0 +1,201 @@<br>
+From 2024f9729713fd657d65e64c2e4e471baa0a3e5b Mon Sep 17 00:00:00 2001<br>
+From: =3D?utf8?q?Petr=3D20Men=3DC5=3DA1=3DC3=3DADk?=3D &lt;pemensik@redhat=
.com&gt;<br>
+Date: Wed, 25 Nov 2020 17:18:55 +0100<br>
+Subject: [PATCH] Support hash function from nettle (only)<br>
+<br>
+Unlike COPTS=3D-DHAVE_DNSSEC, allow usage of just sha256 function from<br>
+nettle, but keep DNSSEC disabled at build time. Skips use of internal<br>
+hash implementation without support for validation built-in.<br>
+<br>
+Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
+---<br>
+ Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; 8 +++++---<br>
+ bld/pkg-wrapper&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 41 ++++++++++++++++++++++=
-------------------<br>
+ src/config.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++=
++++++<br>
+ src/crypto.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 7 ++=
+++++<br>
+ src/dnsmasq.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br>
+ src/hash_questions.c |&nbsp; 2 +-<br>
+ 6 files changed, 44 insertions(+), 24 deletions(-)<br>
+<br>
+CVE: CVE-2020-25685<br>
+Upstream-Status: Backport [<a href=3D"https://thekelleys.org.uk/gitweb/?p=
=3Ddnsmasq.git;a=3Dpatch;h=3D2024f9729713fd657d65e64c2e4e471baa0a3e5b">http=
s://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dpatch;h=3D2024f9729713fd6=
57d65e64c2e4e471baa0a3e5b</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/Makefile b/Makefile<br>
+index 0354e0f..7d2afd1 100644<br>
+--- a/Makefile<br>
++++ b/Makefile<br>
+@@ -53,7 +53,7 @@ top?=3D$(CURDIR)<br>
+ <br>
+ dbus_cflags =3D&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_=
DBUS $(PKG_CONFIG) --cflags dbus-1`
<br>
+ dbus_libs =3D&nbsp;&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wra=
pper HAVE_DBUS $(PKG_CONFIG) --libs dbus-1`
<br>
+-ubus_libs =3D&nbsp;&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wra=
pper HAVE_UBUS &quot;&quot; --copy -lubox -lubus`<br>
++ubus_libs =3D&nbsp;&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wra=
pper HAVE_UBUS &quot;&quot; --copy '-lubox -lubus'`<br>
+ idn_cflags =3D&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wrapper =
HAVE_IDN $(PKG_CONFIG) --cflags libidn`
<br>
+ idn_libs =3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pk=
g-wrapper HAVE_IDN $(PKG_CONFIG) --libs libidn`
<br>
+ idn2_cflags =3D&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_=
LIBIDN2 $(PKG_CONFIG) --cflags libidn2`<br>
+@@ -61,8 +62,10 @@<br>
+ ct_libs =3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/b=
ld/pkg-wrapper HAVE_CONNTRACK $(PKG_CONFIG) --libs libnetfilter_conntrack`<=
br>
+ lua_cflags =3D&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wrapper =
HAVE_LUASCRIPT $(PKG_CONFIG) --cflags lua`<br>
+ lua_libs =3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pk=
g-wrapper HAVE_LUASCRIPT $(PKG_CONFIG) --libs lua`<br>
+-nettle_cflags =3D `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC $(P=
KG_CONFIG) --cflags nettle hogweed`<br>
+-nettle_libs =3D&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_=
DNSSEC $(PKG_CONFIG) --libs nettle hogweed`<br>
++nettle_cflags =3D `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_DNSSEC&nbs=
p;&nbsp;&nbsp;&nbsp; $(PKG_CONFIG) --cflags 'nettle hogweed' \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HAVE_NETTLEHASH $(PKG_CONFIG) --cflags net=
tle`<br>
++nettle_libs =3D&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pkg-wrapper HAVE_=
DNSSEC&nbsp;&nbsp;&nbsp;&nbsp; $(PKG_CONFIG) --libs 'nettle hogweed' \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; HAVE_NETTLEHASH $(PKG_CONFIG) --libs nettl=
e`<br>
+ gmp_libs =3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; `echo $(COPTS) | $(top)/bld/pk=
g-wrapper HAVE_DNSSEC NO_GMP --copy -lgmp`<br>
+ sunos_libs =3D&nbsp;&nbsp;&nbsp; `if uname | grep SunOS &gt;/dev/null 2&g=
t;&amp;1; then echo -lsocket -lnsl -lposix4; fi`<br>
+ version =3D&nbsp;&nbsp;&nbsp;&nbsp; -DVERSION=3D'\&quot;`$(top)/bld/get-v=
ersion $(top)`\&quot;'<br>
+diff --git a/bld/pkg-wrapper b/bld/pkg-wrapper<br>
+index 704bdd3..89713b4 100755<br>
+--- a/bld/pkg-wrapper<br>
++++ b/bld/pkg-wrapper<br>
+@@ -1,35 +1,37 @@<br>
+ #!/bin/sh<br>
+ <br>
+-search=3D$1<br>
+-shift<br>
+-pkg=3D$1<br>
+-shift<br>
+-op=3D$1<br>
+-shift<br>
+-<br>
+ in=3D`cat`<br>
+ <br>
+-if grep &quot;^\#[[:space:]]*define[[:space:]]*$search&quot; config.h &gt=
;/dev/null 2&gt;&amp;1 || \<br>
+-&nbsp;&nbsp;&nbsp; echo $in | grep $search &gt;/dev/null 2&gt;&amp;1; the=
n<br>
++search()<br>
++{<br>
++&nbsp;&nbsp;&nbsp; grep &quot;^\#[[:space:]]*define[[:space:]]*$1&quot; c=
onfig.h &gt;/dev/null 2&gt;&amp;1 || \<br>
++&nbsp;&nbsp;&nbsp; echo $in | grep $1 &gt;/dev/null 2&gt;&amp;1<br>
++}<br>
++<br>
++while [ &quot;$#&quot; -gt 0 ]; do<br>
++&nbsp;&nbsp;&nbsp; search=3D$1<br>
++&nbsp;&nbsp;&nbsp; pkg=3D$2<br>
++&nbsp;&nbsp;&nbsp; op=3D$3<br>
++&nbsp;&nbsp;&nbsp; lib=3D$4<br>
++&nbsp;&nbsp;&nbsp; shift 4<br>
++if search &quot;$search&quot;; then<br>
++<br>
+ # Nasty, nasty, in --copy, arg 2 (if non-empty) is another config to sear=
ch for, used with NO_GMP<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if [ $op =3D &quot;--copy&quot; ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ -z &quot;$pkg&quot; ]; the=
n<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D&quot;$*&quo=
t;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif grep &quot;^\#[[:space:]]*define[[:sp=
ace:]]*$pkg&quot; config.h &gt;/dev/null 2&gt;&amp;1 || \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; echo $in | grep $pkg &gt;/dev/null 2&gt;&amp;1; then<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D&quot;$lib&q=
uot;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; elif search &quot;$pkg&quot;; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D&=
quot;&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D&quot;$*&quo=
t;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D&quot;$lib&q=
uot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+-&nbsp;&nbsp;&nbsp; elif grep &quot;^\#[[:space:]]*define[[:space:]]*${sea=
rch}_STATIC&quot; config.h &gt;/dev/null 2&gt;&amp;1 || \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo $in | g=
rep ${search}_STATIC &gt;/dev/null 2&gt;&amp;1; then<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D`$pkg&nbsp; --static $op $*`<br>
++&nbsp;&nbsp;&nbsp; elif search &quot;${search}_STATIC&quot;; then<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D`$pkg&nbsp; --static $op $lib`<br>
+&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D`$pkg $op $*`<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pkg=3D`$pkg $op $lib`<br>
+&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp; if grep &quot;^\#[[:space:]]*define[[:space:]]*${searc=
h}_STATIC&quot; config.h &gt;/dev/null 2&gt;&amp;1 || \<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo $in | grep ${search=
}_STATIC &gt;/dev/null 2&gt;&amp;1; then<br>
++&nbsp;&nbsp;&nbsp; if search &quot;${search}_STATIC&quot;; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if [ $op =3D &quot;--libs&quot;=
 ] || [ $op =3D &quot;--copy&quot; ]; then<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; echo &q=
uot;-Wl,-Bstatic $pkg -Wl,-Bdynamic&quot;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
+@@ -40,3 +42,4 @@ if grep &quot;^\#[[:space:]]*define[[:space:]]*$search&q=
uot; config.h &gt;/dev/null 2&gt;&amp;1 || \<br>
+&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
+ fi<br>
+ <br>
++done<br>
+diff --git a/src/config.h b/src/config.h<br>
+index 7187ffa..e71a117 100644<br>
+--- a/src/config.h<br>
++++ b/src/config.h<br>
+@@ -120,6 +120,9 @@ HAVE_AUTH<br>
+&nbsp;&nbsp;&nbsp; define this to include the facility to act as an author=
itative DNS<br>
+&nbsp;&nbsp;&nbsp; server for one or more zones.<br>
+ <br>
++HAVE_NETTLEHASH<br>
++&nbsp;&nbsp; include just hash function from nettle, but no DNSSEC.<br>
++<br>
+ HAVE_DNSSEC<br>
+&nbsp;&nbsp;&nbsp; include DNSSEC validator.<br>
+ <br>
+@@ -187,6 +190,7 @@ RESOLVFILE<br>
+ /* #define HAVE_IDN */<br>
+ /* #define HAVE_LIBIDN2 */<br>
+ /* #define HAVE_CONNTRACK */<br>
++/* #define HAVE_NETTLEHASH */<br>
+ /* #define HAVE_DNSSEC */<br>
+ <br>
+ <br>
+@@ -420,6 +424,10 @@ static char *compile_opts =3D<br>
+ &quot;no-&quot;<br>
+ #endif<br>
+ &quot;auth &quot;<br>
++#if !defined(HAVE_NETTLEHASH) &amp;&amp; !defined(HAVE_DNSSEC)<br>
++&quot;no-&quot;<br>
++#endif<br>
++&quot;nettlehash &quot;<br>
+ #ifndef HAVE_DNSSEC<br>
+ &quot;no-&quot;<br>
+ #endif<br>
+diff --git a/src/crypto.c b/src/crypto.c<br>
+index ca63111..09525d2 100644<br>
+--- a/src/crypto.c<br>
++++ b/src/crypto.c<br>
+@@ -25,6 +25,9 @@<br>
+ #if NETTLE_VERSION_MAJOR =3D=3D 3 &amp;&amp; NETTLE_VERSION_MINOR &gt;=3D=
 6<br>
+ #&nbsp; include &lt;nettle/gostdsa.h&gt;<br>
+ #endif<br>
++#endif<br>
++<br>
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)<br>
+ #include &lt;nettle/nettle-meta.h&gt;<br>
+ #include &lt;nettle/bignum.h&gt;<br>
+ <br>
+@@ -167,6 +170,10 @@ int hash_init(const struct nettle_hash *hash, void **=
ctxp, unsigned char **diges<br>
+ <br>
+&nbsp;&nbsp; return 1;<br>
+ }<br>
++<br>
++#endif<br>
++<br>
++#ifdef HAVE_DNSSEC<br>
+&nbsp;&nbsp; <br>
+ static int dnsmasq_rsa_verify(struct blockdata *key_data, unsigned int ke=
y_len, unsigned char *sig, size_t sig_len,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *digest, size_t digest_len, int alg=
o)<br>
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h<br>
+index 9f74c7a..914f469 100644<br>
+--- a/src/dnsmasq.h<br>
++++ b/src/dnsmasq.h<br>
+@@ -157,7 +157,7 @@ extern int capget(cap_user_header_t header, cap_user_d=
ata_t data);<br>
+ #include &lt;priv.h&gt;<br>
+ #endif<br>
+ <br>
+-#ifdef HAVE_DNSSEC<br>
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)<br>
+ #&nbsp; include &lt;nettle/nettle-meta.h&gt;<br>
+ #endif<br>
+ <br>
+diff --git a/src/hash_questions.c b/src/hash_questions.c<br>
+index ae112ac..917c18e 100644<br>
+--- a/src/hash_questions.c<br>
++++ b/src/hash_questions.c<br>
+@@ -28,7 +28,7 @@<br>
+ <br>
+ #include &quot;dnsmasq.h&quot;<br>
+ <br>
+-#ifdef HAVE_DNSSEC<br>
++#if defined(HAVE_DNSSEC) || defined(HAVE_NETTLEHASH)<br>
+ unsigned char *hash_questions(struct dns_header *header, size_t plen, cha=
r *name)<br>
+ {<br>
+&nbsp;&nbsp; int q;<br>
+-- <br>
+2.20.1<br>
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.pat=
ch<br>
new file mode 100644<br>
index 000000000..b07ab6045<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-1.patch<=
br>
@@ -0,0 +1,335 @@<br>
+From 15b60ddf935a531269bb8c68198de012a4967156 Mon Sep 17 00:00:00 2001<br>
+From: Simon Kelley &lt;simon@thekelleys.org.uk&gt;<br>
+Date: Wed, 18 Nov 2020 18:34:55 +0000<br>
+Subject: [PATCH] Handle multiple identical near simultaneous DNS queries<b=
r>
+ better.<br>
+<br>
+Previously, such queries would all be forwarded<br>
+independently. This is, in theory, inefficent but in practise<br>
+not a problem, _except_ that is means that an answer for any<br>
+of the forwarded queries will be accepted and cached.<br>
+An attacker can send a query multiple times, and for each repeat,<br>
+another {port, ID} becomes capable of accepting the answer he is<br>
+sending in the blind, to random IDs and ports. The chance of a<br>
+succesful attack is therefore multiplied by the number of repeats<br>
+of the query. The new behaviour detects repeated queries and<br>
+merely stores the clients sending repeats so that when the<br>
+first query completes, the answer can be sent to all the<br>
+clients who asked. Refer: CERT VU#434904.<br>
+<br>
+Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
+---<br>
+ CHANGELOG&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 16 +++++-<br>
+ src/dnsmasq.h |&nbsp; 19 ++++---<br>
+ src/forward.c | 142 ++++++++++++++++++++++++++++++++++++++++++--------<br=
>
+ 3 files changed, 147 insertions(+), 30 deletions(-)<br>
+<br>
+CVE: CVE-2020-25686<br>
+Upstream-Status: Backport [<a href=3D"http://thekelleys.org.uk/gitweb/?p=
=3Ddnsmasq.git;a=3Dcommit;h=3D15b60ddf935a531269bb8c68198de012a4967156">htt=
p://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dcommit;h=3D15b60ddf935a53=
1269bb8c68198de012a4967156</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h<br>
+index 0a7639f..fa8c5ea 100644<br>
+--- a/src/dnsmasq.h<br>
++++ b/src/dnsmasq.h<br>
+@@ -653,19 +653,24 @@ struct hostsfile {<br>
+ #define FREC_DO_QUESTION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 64<br>
+ #define FREC_ADDED_PHEADER&nbsp;&nbsp;&nbsp; 128<br>
+ #define FREC_TEST_PKTSZ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 256<br>
+-#define FREC_HAS_EXTRADATA&nbsp;&nbsp;&nbsp; 512&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; <br>
++#define FREC_HAS_EXTRADATA&nbsp;&nbsp;&nbsp; 512<br>
++#define FREC_HAS_PHEADER&nbsp;&nbsp;&nbsp;&nbsp; 1024<br>
+ <br>
+ #define HASH_SIZE 32 /* SHA-256 digest size */<br>
+ <br>
+ struct frec {<br>
+-&nbsp; union mysockaddr source;<br>
+-&nbsp; union all_addr dest;<br>
++&nbsp; struct frec_src {<br>
++&nbsp;&nbsp;&nbsp; union mysockaddr source;<br>
++&nbsp;&nbsp;&nbsp; union all_addr dest;<br>
++&nbsp;&nbsp;&nbsp; unsigned int iface, log_id;<br>
++&nbsp;&nbsp;&nbsp; unsigned short orig_id;<br>
++&nbsp;&nbsp;&nbsp; struct frec_src *next;<br>
++&nbsp; } frec_src;<br>
+&nbsp;&nbsp; struct server *sentto; /* NULL means free */<br>
+&nbsp;&nbsp; struct randfd *rfd4;<br>
+&nbsp;&nbsp; struct randfd *rfd6;<br>
+-&nbsp; unsigned int iface;<br>
+-&nbsp; unsigned short orig_id, new_id;<br>
+-&nbsp; int log_id, fd, forwardall, flags;<br>
++&nbsp; unsigned short new_id;<br>
++&nbsp; int fd, forwardall, flags;<br>
+&nbsp;&nbsp; time_t time;<br>
+&nbsp;&nbsp; unsigned char *hash[HASH_SIZE];<br>
+ #ifdef HAVE_DNSSEC <br>
+@@ -1093,6 +1098,8 @@ extern struct daemon {<br>
+&nbsp;&nbsp; int back_to_the_future;<br>
+ #endif<br>
+&nbsp;&nbsp; struct frec *frec_list;<br>
++&nbsp; struct frec_src *free_frec_src;<br>
++&nbsp; int frec_src_count;<br>
+&nbsp;&nbsp; struct serverfd *sfds;<br>
+&nbsp;&nbsp; struct irec *interfaces;<br>
+&nbsp;&nbsp; struct listener *listeners;<br>
+diff --git a/src/forward.c b/src/forward.c<br>
+index 50da095..d9b32b3 100644<br>
+--- a/src/forward.c<br>
++++ b/src/forward.c<br>
+@@ -20,6 +20,8 @@ static struct frec *lookup_frec(unsigned short id, int f=
d, int family, void *has<br>
+ static struct frec *lookup_frec_by_sender(unsigned short id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; union mysockaddr *addr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; void *hash);<br>
++static struct frec *lookup_frec_by_query(void *hash, unsigned int flags);=
<br>
++<br>
+ static unsigned short get_id(void);<br>
+ static void free_frec(struct frec *f);<br>
+ <br>
+@@ -255,6 +257,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,<br>
+&nbsp;&nbsp; int type =3D SERV_DO_DNSSEC, norebind =3D 0;<br>
+&nbsp;&nbsp; union all_addr *addrp =3D NULL;<br>
+&nbsp;&nbsp; unsigned int flags =3D 0;<br>
++&nbsp; unsigned int fwd_flags =3D 0;<br>
+&nbsp;&nbsp; struct server *start =3D NULL;<br>
+&nbsp;&nbsp; void *hash =3D hash_questions(header, plen, daemon-&gt;namebu=
ff);<br>
+ #ifdef HAVE_DNSSEC<br>
+@@ -263,7 +266,18 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,<br>
+&nbsp;&nbsp; unsigned int gotname =3D extract_request(header, plen, daemon=
-&gt;namebuff, NULL);<br>
+&nbsp;&nbsp; unsigned char *oph =3D find_pseudoheader(header, plen, NULL, =
NULL, NULL, NULL);<br>
+&nbsp;&nbsp; (void)do_bit;<br>
+-<br>
++&nbsp; <br>
++&nbsp; if (header-&gt;hb4 &amp; HB4_CD)<br>
++&nbsp;&nbsp;&nbsp; fwd_flags |=3D FREC_CHECKING_DISABLED;<br>
++&nbsp; if (ad_reqd)<br>
++&nbsp;&nbsp;&nbsp; fwd_flags |=3D FREC_AD_QUESTION;<br>
++&nbsp; if (oph)<br>
++&nbsp;&nbsp;&nbsp; fwd_flags |=3D FREC_HAS_PHEADER;<br>
++#ifdef HAVE_DNSSEC<br>
++&nbsp; if (do_bit)<br>
++&nbsp;&nbsp;&nbsp; fwd_flags |=3D FREC_DO_QUESTION;<br>
++#endif<br>
++&nbsp; <br>
+&nbsp;&nbsp; /* may be no servers available. */<br>
+&nbsp;&nbsp; if (forward || (forward =3D lookup_frec_by_sender(ntohs(heade=
r-&gt;id), udpaddr, hash)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+@@ -336,6 +350,39 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp; else <br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Query from new source, but the same que=
ry may be in progress<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from another source. If so, just add=
 this client to the<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list that will get the reply.<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Note that is the EDNS client subnet =
option is in use, we can't do this,<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; as the clients (and therefore query =
EDNS options) will be different<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for each query. The EDNS subnet code=
 has checks to avoid<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; attacks in this case. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!option_bool(OPT_CLIENT_SUBNET) &amp;&=
amp; (forward =3D lookup_frec_by_query(hash, fwd_flags)))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Note whine_malloc() zeros m=
emory. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!daemon-&gt;free_frec_src =
&amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon=
-&gt;frec_src_count &lt; daemon-&gt;ftabsize &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (daemo=
n-&gt;free_frec_src =3D whine_malloc(sizeof(struct frec_src))))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon-&gt;frec_sr=
c_count++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If we've been spammed with =
many duplicates, just drop the query. */<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (daemon-&gt;free_frec_src)<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct=
 frec_src *new =3D daemon-&gt;free_frec_src;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon=
-&gt;free_frec_src =3D new-&gt;next;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&g=
t;next =3D forward-&gt;frec_src.next;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forwar=
d-&gt;frec_src.next =3D new;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&g=
t;orig_id =3D ntohs(header-&gt;id);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&g=
t;source =3D *udpaddr;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&g=
t;dest =3D *dst_addr;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&g=
t;log_id =3D daemon-&gt;log_id;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&g=
t;iface =3D dst_iface;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gotname)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags =3D search_servers(now, &=
amp;addrp, gotname, daemon-&gt;namebuff, &amp;type, &amp;domain, &amp;noreb=
ind);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+@@ -343,22 +390,22 @@ static int forward_query(int udpfd, union mysockaddr=
 *udpaddr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; do_dnssec =3D type &amp; SERV_DO_DNSS=
EC;<br>
+ #endif<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; type &amp;=3D ~SERV_DO_DNSSEC;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; <br>
+-<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (daemon-&gt;servers &amp;&amp; !fl=
ags)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward =3D get_new_frec(now, N=
ULL, NULL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* table full - flags =3D=3D 0, retur=
n REFUSED */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (forward)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;source =3D *udpadd=
r;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;dest =3D *dst_addr=
;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;iface =3D dst_ifac=
e;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;orig_id =3D ntohs(=
header-&gt;id);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_src.source =
=3D *udpaddr;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_src.orig_id =
=3D ntohs(header-&gt;id);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_src.dest =3D =
*dst_addr;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_src.iface =3D=
 dst_iface;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;new_id =
=3D get_id();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;fd =3D =
udpfd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(forward-&gt;=
hash, hash, HASH_SIZE);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;forward=
all =3D 0;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;flags =3D 0;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;flags =3D fwd_flag=
s;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (norebind)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward=
-&gt;flags |=3D FREC_NOREBIND;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (header-&gt;hb4 =
&amp; HB4_CD)<br>
+@@ -413,9 +460,9 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char *pheader;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If a query is retried, use the log=
_id for the retry when logging the answer. */<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;log_id =3D daemon-&gt;log_id;<=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_src.log_id =3D daemon-&gt=
;log_id;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plen =3D add_edns0_config(header, plen, ((=
unsigned char *)header) + PACKETSZ, &amp;forward-&gt;source, now, &amp;subn=
et);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plen =3D add_edns0_config(header, plen, ((=
unsigned char *)header) + PACKETSZ, &amp;forward-&gt;frec_src.source, now, =
&amp;subnet);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (subnet)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;flags |=3D FREC_HAS=
_SUBNET;<br>
+@@ -552,7 +599,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* could not send on, prepare to retu=
rn */ <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header-&gt;id =3D htons(forward-&gt;orig_i=
d);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header-&gt;id =3D htons(forward-&gt;frec_s=
rc.orig_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_frec(forward); /* cancel */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp; <br>
+&nbsp;&nbsp; <br>
+@@ -804,8 +851,8 @@ void reply_query(int fd, int family, time_t now)<br>
+ <br>
+&nbsp;&nbsp; /* log_query gets called indirectly all over the place, so <b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pass these in global variables - sorry. */<=
br>
+-&nbsp; daemon-&gt;log_display_id =3D forward-&gt;log_id;<br>
+-&nbsp; daemon-&gt;log_source_addr =3D &amp;forward-&gt;source;<br>
++&nbsp; daemon-&gt;log_display_id =3D forward-&gt;frec_src.log_id;<br>
++&nbsp; daemon-&gt;log_source_addr =3D &amp;forward-&gt;frec_src.source;<b=
r>
+&nbsp;&nbsp; <br>
+&nbsp;&nbsp; if (daemon-&gt;ignore_addr &amp;&amp; RCODE(header) =3D=3D NO=
ERROR &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; check_for_ignored_address(header, n, =
daemon-&gt;ignore_addr))<br>
+@@ -1080,6 +1127,7 @@ void reply_query(int fd, int family, time_t now)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&gt;sentto =3D ser=
ver;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&gt;rfd4 =3D NULL;=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&gt;rfd6 =3D NULL;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&gt;frec_src.next =3D NULL;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&gt;flags &amp;=3D=
 ~(FREC_DNSKEY_QUERY | FREC_DS_QUERY | FREC_HAS_EXTRADATA);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new-&gt;forwardall =3D=
 0;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+@@ -1215,9 +1263,11 @@ void reply_query(int fd, int family, time_t now)<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((nn =3D process_reply(header, now=
, forward-&gt;sentto, (size_t)n, check_rebind, no_cache_dnssec, cache_secur=
e, bogusanswer,
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;flags &amp; FREC_AD_QUESTION, forward=
-&gt;flags &amp; FREC_DO_QUESTION,
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; forward-&gt;flags &amp; FREC_ADDED_PHEADER, forward-&gt;flag=
s &amp; FREC_HAS_SUBNET, &amp;forward-&gt;source)))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; forward-&gt;flags &amp; FREC_ADDED_PHEADER, forward-&gt;flag=
s &amp; FREC_HAS_SUBNET, &amp;forward-&gt;frec_src.source)))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header-&gt;id =3D htons(forwar=
d-&gt;orig_id);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct frec_src *src;<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header-&gt;id =3D htons(forwar=
d-&gt;frec_src.orig_id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header-&gt;hb4 |=3D=
 HB4_RA; /* recursion if available */<br>
+ #ifdef HAVE_DNSSEC<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We added an EDNS=
O header for the purpose of getting DNSSEC RRs, and set the value of the UD=
P payload size<br>
+@@ -1233,13 +1283,26 @@ void reply_query(int fd, int family, time_t now)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ #endif<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (src =3D &amp;forward-&gt;=
frec_src; src; src =3D src-&gt;next)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; header=
-&gt;id =3D htons(src-&gt;orig_id);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+ #ifdef HAVE_DUMPFILE<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dump_packet(DUMP_REPLY, daemon=
-&gt;packet, (size_t)nn, NULL, &amp;forward-&gt;source);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dump_p=
acket(DUMP_REPLY, daemon-&gt;packet, (size_t)nn, NULL, &amp;src-&gt;source)=
;<br>
+ #endif<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send_from(forward-&gt;fd, opti=
on_bool(OPT_NOWILD) || option_bool (OPT_CLEVERBIND), daemon-&gt;packet, nn,
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;forward-&gt;source, &amp;forward-&gt;des=
t, forward-&gt;iface);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; send_f=
rom(forward-&gt;fd, option_bool(OPT_NOWILD) || option_bool (OPT_CLEVERBIND)=
, daemon-&gt;packet, nn,
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;src-&gt;source, =
&amp;src-&gt;dest, src-&gt;iface);<br>
++<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (op=
tion_bool(OPT_EXTRALOG) &amp;&amp; src !=3D &amp;forward-&gt;frec_src)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; daemon-&gt;log_display_id =3D src-&gt;log_id;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; daemon-&gt;log_source_addr =3D &amp;src-&gt;source;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; log_query(F_UPSTREAM, &quot;query&quot;, NULL, &quot;dupl=
icate&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; }<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free_frec(forward); /* cancel */<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+ }<br>
+@@ -2202,6 +2265,17 @@ void free_rfd(struct randfd *rfd)<br>
+ <br>
+ static void free_frec(struct frec *f)<br>
+ {<br>
++&nbsp; struct frec_src *src, *tmp;<br>
++<br>
++&nbsp;&nbsp; /* add back to freelist of not the record builtin to every f=
rec. */<br>
++&nbsp; for (src =3D f-&gt;frec_src.next; src; src =3D tmp)<br>
++&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D src-&gt;next;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src-&gt;next =3D daemon-&gt;free_frec_src;=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon-&gt;free_frec_src =3D src;<br>
++&nbsp;&nbsp;&nbsp; }<br>
++&nbsp; <br>
++&nbsp; f-&gt;frec_src.next =3D NULL;<br>
+&nbsp;&nbsp; free_rfd(f-&gt;rfd4);<br>
+&nbsp;&nbsp; f-&gt;rfd4 =3D NULL;<br>
+&nbsp;&nbsp; f-&gt;sentto =3D NULL;<br>
+@@ -2342,17 +2416,39 @@ static struct frec *lookup_frec_by_sender(unsigned=
 short id,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; void *hash)<br>
+ {<br>
+&nbsp;&nbsp; struct frec *f;<br>
++&nbsp; struct frec_src *src;<br>
++<br>
++&nbsp; for (f =3D daemon-&gt;frec_list; f; f =3D f-&gt;next)<br>
++&nbsp;&nbsp;&nbsp; if (f-&gt;sentto &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !(f-&gt;flags &amp; (FREC_DNSKEY_QUERY | F=
REC_DS_QUERY)) &amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcmp(hash, f-&gt;hash, HASH_SIZE) =3D=3D=
 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (src =3D &amp;f-&gt;frec_src; src; src=
 =3D src-&gt;next)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (src-&gt;orig_id =3D=3D id &amp;&amp; <=
br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sockaddr_isequal(&=
amp;src-&gt;source, addr))<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return f;<br>
++&nbsp; <br>
++&nbsp; return NULL;<br>
++}<br>
++<br>
++static struct frec *lookup_frec_by_query(void *hash, unsigned int flags)<=
br>
++{<br>
++&nbsp; struct frec *f;<br>
++<br>
++&nbsp; /* FREC_DNSKEY and FREC_DS_QUERY are never set in flags, so the te=
st below<br>
++&nbsp;&nbsp;&nbsp;&nbsp; ensures that no frec created for internal DNSSEC=
 query can be returned here. */<br>
++<br>
++#define FLAGMASK (FREC_CHECKING_DISABLED | FREC_AD_QUESTION | FREC_DO_QUE=
STION \<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; | FREC_HAS_PHEADER | FREC_DNSKEY_QUERY | FREC_DS_QUERY)<b=
r>
+&nbsp;&nbsp; <br>
+&nbsp;&nbsp; for(f =3D daemon-&gt;frec_list; f; f =3D f-&gt;next)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; if (f-&gt;sentto &amp;&amp;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f-&gt;orig_id =3D=3D id &amp;&amp; <br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcmp(hash, f-&gt;hash, HASH_SIZE) =3D=3D=
 0 &amp;&amp;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sockaddr_isequal(&amp;f-&gt;source, addr))=
<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (f-&gt;flags &amp; FLAGMASK) =3D=3D flags =
&amp;&amp;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcmp(hash, f-&gt;hash, HASH_SIZE) =3D=3D=
 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return f;<br>
+-&nbsp;&nbsp; <br>
++&nbsp; <br>
+&nbsp;&nbsp; return NULL;<br>
+ }<br>
+- <br>
++<br>
+ /* Send query packet again, if we can. */<br>
+ void resend_query()<br>
+ {<br>
+--<br>
+2.20.1<br>
+<br>
diff --git a/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2=
.patch b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.pat=
ch<br>
new file mode 100644<br>
index 000000000..4e03dd92b<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/dnsmasq/files/CVE-2020-25686-2.patch<=
br>
@@ -0,0 +1,66 @@<br>
+From 6a6e06fbb0d4690507ceaf2bb6f0d8910f3d4914 Mon Sep 17 00:00:00 2001<br>
+From: Simon Kelley &lt;simon@thekelleys.org.uk&gt;<br>
+Date: Fri, 4 Dec 2020 18:35:11 +0000<br>
+Subject: [PATCH] Small cleanups in frec_src datastucture handling.<br>
+<br>
+Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
+---<br>
+ src/forward.c | 22 +++++++++++++---------<br>
+ 1 file changed, 13 insertions(+), 9 deletions(-)<br>
+<br>
+CVE: CVE-2020-25686<br>
+Upstream-Status: Backport [<a href=3D"http://thekelleys.org.uk/gitweb/?p=
=3Ddnsmasq.git;a=3Dcommit;h=3D6a6e06fbb0d4690507ceaf2bb6f0d8910f3d4914">htt=
p://thekelleys.org.uk/gitweb/?p=3Ddnsmasq.git;a=3Dcommit;h=3D6a6e06fbb0d469=
0507ceaf2bb6f0d8910f3d4914</a>]<br>
+Comment: No change in any hunk<br>
+<br>
+diff --git a/src/forward.c b/src/forward.c<br>
+index 70b84d7..f94c4cf 100644<br>
+--- a/src/forward.c<br>
++++ b/src/forward.c<br>
+@@ -361,7 +361,10 @@ static int forward_query(int udpfd, union mysockaddr =
*udpaddr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!daemon-&gt;fre=
e_frec_src &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; daemon-&gt;frec_src_count &lt; daemon-&gt;ftabsize &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; (daemon-&gt;free_frec_src =3D whine_malloc(sizeof(struct frec_src))))<=
br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon-&gt;frec_sr=
c_count++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon=
-&gt;frec_src_count++;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon=
-&gt;free_frec_src-&gt;next =3D NULL;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* If we've been sp=
ammed with many duplicates, just drop the query. */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (daemon-&gt;free=
_frec_src)<br>
+@@ -398,6 +401,7 @@ static int forward_query(int udpfd, union mysockaddr *=
udpaddr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_sr=
c.orig_id =3D ntohs(header-&gt;id);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_sr=
c.dest =3D *dst_addr;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_sr=
c.iface =3D dst_iface;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;frec_src.next =3D =
NULL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;new_id =
=3D get_id();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; forward-&gt;fd =3D =
udpfd;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(forward-&gt;=
hash, hash, HASH_SIZE);<br>
+@@ -2265,16 +2265,16 @@<br>
+ <br>
+ static void free_frec(struct frec *f)<br>
+ {<br>
+-&nbsp; struct frec_src *src, *tmp;<br>
+-<br>
+-&nbsp;&nbsp; /* add back to freelist of not the record builtin to every f=
rec. */<br>
+-&nbsp; for (src =3D f-&gt;frec_src.next; src; src =3D tmp)<br>
++&nbsp; struct frec_src *last;<br>
++&nbsp; <br>
++&nbsp; /* add back to freelist if not the record builtin to every frec. *=
/<br>
++&nbsp; for (last =3D f-&gt;frec_src.next; last &amp;&amp; last-&gt;next; =
last =3D last-&gt;next) ;<br>
++&nbsp; if (last)<br>
+&nbsp;&nbsp;&nbsp;&nbsp; {<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp =3D src-&gt;next;<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; src-&gt;next =3D daemon-&gt;free_frec_src;=
<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon-&gt;free_frec_src =3D src;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; last-&gt;next =3D daemon-&gt;free_frec_src=
;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; daemon-&gt;free_frec_src =3D f-&gt;frec_sr=
c.next;<br>
+&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+-&nbsp; <br>
++&nbsp;&nbsp;&nbsp; <br>
+&nbsp;&nbsp; f-&gt;frec_src.next =3D NULL;<br>
+&nbsp;&nbsp; free_rfd(f-&gt;rfd4);<br>
+&nbsp;&nbsp; f-&gt;rfd4 =3D NULL;<br>
+--<br>
+2.20.1<br>
+<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BMXPR01MB32218FDFE45798C3EFEB9193997C9BMXPR01MB3221INDP_--
