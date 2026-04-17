Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE69F43693
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 11:45:11 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42947.1776426306384931969
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 04:45:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FlMxsQaz;
 spf=pass (domain: mvista.com, ip: 209.85.208.47, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-671d60ef9c6so750967a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 04:45:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776426305; cv=none;
        d=google.com; s=arc-20240605;
        b=JLeSjxIMfYA1C+6YGTiiszdols9Gm/Q77rxQc7mSXok0Y0lqe3QxW7SrhiMUImrO0V
         fE/uoLEKlzoXtd515UgCdNSYACDNcVaL8lwlxc8MyndxqfnCUI/ly+2l3lB0bxxa5MbB
         fYJXhcuFC/Q1G8uznvfZCXSfdmbvz6oszMoGIA/5mYbhl9ZVKUYTWJosCdFg2MYt5Fwq
         bQ8dCdxkzaFIzOssR7aDq8VoiKY+qQF2U8oMgxgAqR7SS+RO4ZBTsOkLoj5b5B5fechR
         5gBbPB+dlQtuWrJW/8xWomsPysseljWQauc0onlYq4s+xh7tZodEPq3UgoFSEz4Fu0Ag
         gXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AT0mgUONSLupJJ2yAGHgAYxof9Q7RqWDIaWKg5NCCHU=;
        fh=/Zfoi4o9G9NEfOtGJ0LSUrfiVhZcuLLzOVZQmzCL8qM=;
        b=W+HRvdEbf2VCwwaLeFWfnopBiy07L7Gazb3oU+Sk4ngJ77glM920MsUeeD1k/un2Ph
         bC2d8XaRpAj4Prd8WFp+r/uYAKqRDg4B0BMzCLbtbfnz2BGZebpAQFxgp52F0AQk1jYq
         usz55lJlFmRN4eMU+MOqn+lR8Oj6xM6jgo64BSyR3jp9emcgr5ScFoK8nxsa6/GO3N6+
         WUdeWfOzbm4RpPtXgHdgwlvooVEL6G+Ar5YFpCbXJ86yn2uWngX1R8FRzdmMpwZPJBcY
         sZeQiHzzKXsHRRDWOtKPCNEnDL/dNYicWf6920ieF1ophusZ/PudcdQ5EDy53Ym2x7D/
         f4Bg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1776426305; x=1777031105; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AT0mgUONSLupJJ2yAGHgAYxof9Q7RqWDIaWKg5NCCHU=;
        b=FlMxsQaztpwidXIqliydJ7LOLeaqL3Ci9k8Si4WucQFuWcgoRyKnSF3QScg/IHBz8z
         MHs8jr1wNwBszoAn59NXshvT1/7YdmYuoCdu1w0QEet2kzi5ePP6gDHDx/xdn+J8qoKs
         GGj+p8rHlu1qonYQZS6fl56UM1f07mL1x5fKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426305; x=1777031105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AT0mgUONSLupJJ2yAGHgAYxof9Q7RqWDIaWKg5NCCHU=;
        b=RltaX+v4b2AKyPQ37P+TpU0WFEFYMUJ1QglUEKJswL/DoGZXIHMhC+fEEEI1oshSpw
         SUfC2TkReYYcnv5nlEsOrIsUu/qO8s/22Dhbcw4sca/xvyTH/NQoGkIK3VAAS5bSdxG1
         FDE2cyyfGDQDpR8in+dVgqg8t947/VCt9sohzfLi07BrttgzqXedSefgcSmCJObTxtd0
         np1Ufia1NV8xLe86F34YTvpUEND0HHRvlPgbLsz6MUsYFq/TXnXBJXVA2QZ4S1CsykYK
         al29+TAcX9IvtOu2au5Umf5WF8wUL6wTGIaAnybTUtPlrctzjRSGrGljDx1uuhDWnKWL
         HmwA==
X-Gm-Message-State: AOJu0YwOFyoIQF4a0YyUa87NX1uvNlwcoaXJfoCL1/I+V2q3VdFibw6G
	R0YmWSTfv60Kv5WH2ogEHfnQZC3b410ystYZ/AT5YmIZe1pLfAmj27mlIQ4YxN9WXn8Rrdefm0X
	bt2XT1/oq9U8dbmjt8wcr6X340XmC5LYC0a1Uf3FSQA==
X-Gm-Gg: AeBDiet+Blv9LG/Eh3cSLGNAXnQF0EAEg16UuG6UOEuquHd9thKq9z9MDA2vxUUHwWa
	bufI7eTUnbFkqj3FXZmVcmWe01HEkYkyHF7oIDj6DG6XSDvob1UQ/oD0NVLul4DDEp3gAv/E5nd
	1kgYLWAUmg89G7PGnQsKDPHQNskii7LTbaVSEgtbhtV1Hy8entz9pYpAiSz5PLE2RoxjiL2/nMm
	/YpWhTJYWpsdft6iedeAwEZg3G6GQph/MoDkqC+m41fRmtrhYMWptFzsoyY1fETMD5zwY5DFAm0
	7Tt+o9AlntaAGR/h+0E=
X-Received: by 2002:aa7:cb49:0:b0:672:75b2:e8dc with SMTP id
 4fb4d7f45d1cf-672bfde2481mr908422a12.24.1776426304309; Fri, 17 Apr 2026
 04:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260402035053.69593-1-vanusuri@mvista.com> <CANQUz19-1_+PGS_yyq+jQaiBAh6Mhi0+Zc7rD3Qte31tMCwv6g@mail.gmail.com>
 <c42bb2c3-9def-4677-bfa3-acf5b65a915d@gmail.com>
In-Reply-To: <c42bb2c3-9def-4677-bfa3-acf5b65a915d@gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 17 Apr 2026 17:14:52 +0530
X-Gm-Features: AQROBzAtM4d05xyBDYp2y8kvuwCZrThyqFbOtUknjw5KqZyxFAdYIpcbD2lUzkU
Message-ID: <CANQUz1_5mCh40ngEk9vDbpqOaZjCL-w6qMCZwCDS98zvTa+J9Q@mail.gmail.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH] strongswan: Fix CVE-2026-25075
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d69f0a064fa67aa6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 11:45:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126436

--000000000000d69f0a064fa67aa6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I missed checking the Kirkstone nut. Thanks for the update.

Thanks & Regards,
Vijay

On Fri, Apr 17, 2026 at 4:36=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> On 4/17/26 13:04, Vijay Anusuri wrote:
> > Hi Team,
> >
> > Any update on this ?
> >
>
> It's in my staging repo:
>
> https://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Dstable=
/kirkstone-nut&id=3De2988d39a10153b78906c103d84f402acf176f86
>
> Planned to be included in the last PR.
>
>
> > Thanks & Regards,
> > Vijay
> >
> > On Thu, Apr 2, 2026 at 9:21=E2=80=AFAM <vanusuri@mvista.com
> > <mailto:vanusuri@mvista.com>> wrote:
> >
> >     From: Vijay Anusuri <vanusuri@mvista.com <mailto:vanusuri@mvista.co=
m
> >>
> >
> >     Pick patch according to [1]
> >
> >     [1] https://download.strongswan.org/security/CVE-2026-25075/
> >     <https://download.strongswan.org/security/CVE-2026-25075/>
> >     [2] https://www.strongswan.org/blog/2026/03/23/strongswan-
> >     vulnerability-(cve-2026-25075).html <https://www.strongswan.org/
> >     blog/2026/03/23/strongswan-vulnerability-(cve-2026-25075).html>
> >
> >     Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
> >     <mailto:vanusuri@mvista.com>>
> >     ---
> >      .../strongswan/files/CVE-2026-25075.patch     | 50
> +++++++++++++++++++
> >      .../strongswan/strongswan_5.9.13.bb <http://strongswan_5.9.13.bb>
> >              |  1 +
> >      2 files changed, 51 insertions(+)
> >      create mode 100644 meta-networking/recipes-support/strongswan/
> >     files/CVE-2026-25075.patch
> >
> >     diff --git a/meta-networking/recipes-support/strongswan/files/
> >     CVE-2026-25075.patch b/meta-networking/recipes-support/strongswan/
> >     files/CVE-2026-25075.patch
> >     new file mode 100644
> >     index 0000000000..3b38a099a2
> >     --- /dev/null
> >     +++ b/meta-networking/recipes-support/strongswan/files/
> >     CVE-2026-25075.patch
> >     @@ -0,0 +1,50 @@
> >     +From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00
> 2001
> >     +From: Tobias Brunner <tobias@strongswan.org
> >     <mailto:tobias@strongswan.org>>
> >     +Date: Thu, 5 Mar 2026 12:43:12 +0100
> >     +Subject: [PATCH] eap-ttls: Prevent crash if AVP length header fiel=
d
> >     is invalid
> >     +
> >     +The length field in the AVP header includes the 8 bytes of the
> header
> >     +itself.  Not checking for that and later subtracting it causes an
> >     +integer underflow that usually triggers a crash when accessing a
> >     +NULL pointer that resulted from the failing chunk_alloc() call
> because
> >     +of the high value.
> >     +
> >     +The attempted allocations for invalid lengths (0-7) are 0xfffffff8=
,
> >     +0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't
> result
> >     +in a buffer overflow even if the allocation succeeds.
> >     +
> >     +Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS=
")
> >     +Fixes: CVE-2026-25075
> >     +
> >     +Upstream-Status: Backport [https://download.strongswan.org/
> >     security/CVE-2026-25075/
> >     strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch <https://
> >     download.strongswan.org/security/CVE-2026-25075/
> >     strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch>]
> >     +CVE: CVE-2026-25075
> >     +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com
> >     <mailto:vanusuri@mvista.com>>
> >     +---
> >     + src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
> >     + 1 file changed, 2 insertions(+), 2 deletions(-)
> >     +
> >     +diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/
> >     libcharon/plugins/eap_ttls/eap_ttls_avp.c
> >     +index 06389f7..2983bd0 100644
> >     +--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> >     ++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> >     +@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
> >     +               chunk_free(&this->input);
> >     +               this->inpos =3D 0;
> >     +
> >     +-              if (!success)
> >     ++              if (!success || avp_len < AVP_HEADER_LEN)
> >     +               {
> >     +                       DBG1(DBG_IKE, "received invalid AVP header"=
);
> >     +                       return FAILED;
> >     +@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
> >     +                       return FAILED;
> >     +               }
> >     +               this->process_header =3D FALSE;
> >     +-              this->data_len =3D avp_len - 8;
> >     ++              this->data_len =3D avp_len - AVP_HEADER_LEN;
> >     +               this->input =3D chunk_alloc(this->data_len + (4 -
> >     avp_len) % 4);
> >     +       }
> >     +
> >     +--
> >     +2.25.1
> >     +
> >     diff --git a/meta-networking/recipes-support/strongswan/
> >     strongswan_5.9.13.bb <http://strongswan_5.9.13.bb> b/meta-
> >     networking/recipes-support/strongswan/strongswan_5.9.13.bb <http://
> >     strongswan_5.9.13.bb>
> >     index 4c10636871..6a2b219275 100644
> >     --- a/meta-networking/recipes-support/strongswan/
> >     strongswan_5.9.13.bb <http://strongswan_5.9.13.bb>
> >     +++ b/meta-networking/recipes-support/strongswan/
> >     strongswan_5.9.13.bb <http://strongswan_5.9.13.bb>
> >     @@ -10,6 +10,7 @@ DEPENDS:append =3D
> >     "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
> >
> >      SRC_URI =3D "https://download.strongswan.org/strongswan-${PV}.tar.=
bz2
> >     <https://download.strongswan.org/strongswan-$%7BPV%7D.tar.bz2> \
> >                 file://CVE-2025-62291.patch \
> >     +           file://CVE-2026-25075.patch \
> >                 "
> >
> >      SRC_URI[sha256sum] =3D
> >     "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
> >     --
> >     2.25.1
> >
>
>

--000000000000d69f0a064fa67aa6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I missed checking the Kirkstone nut. Thanks for the u=
pdate.<br><br></div><div>Thanks &amp;=C2=A0Regards,</div><div>Vijay</div></=
div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Fri, Apr 17, 2026 at 4:36=E2=80=AFPM Gyorgy Sarvari =
&lt;<a href=3D"mailto:skandigraun@gmail.com">skandigraun@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 4/17/2=
6 13:04, Vijay Anusuri wrote:<br>
&gt; Hi Team,<br>
&gt; <br>
&gt; Any update on this ?<br>
&gt; <br>
<br>
It&#39;s in my staging repo:<br>
<a href=3D"https://git.openembedded.org/meta-openembedded-contrib/commit/?h=
=3Dstable/kirkstone-nut&amp;id=3De2988d39a10153b78906c103d84f402acf176f86" =
rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-open=
embedded-contrib/commit/?h=3Dstable/kirkstone-nut&amp;id=3De2988d39a10153b7=
8906c103d84f402acf176f86</a><br>
<br>
Planned to be included in the last PR.<br>
<br>
<br>
&gt; Thanks &amp;=C2=A0Regards,<br>
&gt; Vijay<br>
&gt; <br>
&gt; On Thu, Apr 2, 2026 at 9:21=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@=
mvista.com" target=3D"_blank">vanusuri@mvista.com</a><br>
&gt; &lt;mailto:<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">va=
nusuri@mvista.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@=
mvista.com" target=3D"_blank">vanusuri@mvista.com</a> &lt;mailto:<a href=3D=
"mailto:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;&=
gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Pick patch according to [1]<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[1] <a href=3D"https://download.strongswan.org/secu=
rity/CVE-2026-25075/" rel=3D"noreferrer" target=3D"_blank">https://download=
.strongswan.org/security/CVE-2026-25075/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://download.strongswan.org/secu=
rity/CVE-2026-25075/" rel=3D"noreferrer" target=3D"_blank">https://download=
.strongswan.org/security/CVE-2026-25075/</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0[2] <a href=3D"https://www.strongswan.org/blog/2026=
/03/23/strongswan-" rel=3D"noreferrer" target=3D"_blank">https://www.strong=
swan.org/blog/2026/03/23/strongswan-</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0vulnerability-(cve-2026-25075).html &lt;<a href=3D"=
https://www.strongswan.org/" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.strongswan.org/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0blog/2026/03/23/strongswan-vulnerability-(cve-2026-=
25075).html&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:=
vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vanusuri@mvista.com" t=
arget=3D"_blank">vanusuri@mvista.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../strongswan/files/CVE-2026-25075.patch=C2=
=A0 =C2=A0 =C2=A0| 50 +++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0.../strongswan/<a href=3D"http://strongswan_5=
.9.13.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_5.9.13.bb</a> &lt=
;<a href=3D"http://strongswan_5.9.13.bb" rel=3D"noreferrer" target=3D"_blan=
k">http://strongswan_5.9.13.bb</a>&gt;=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A02 files changed, 51 insertions(+)<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0create mode 100644 meta-networking/recipes-su=
pport/strongswan/<br>
&gt;=C2=A0 =C2=A0 =C2=A0files/CVE-2026-25075.patch<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-networking/recipes-support/strong=
swan/files/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-25075.patch b/meta-networking/recipes-supp=
ort/strongswan/<br>
&gt;=C2=A0 =C2=A0 =C2=A0files/CVE-2026-25075.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 0000000000..3b38a099a2<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-networking/recipes-support/strongswan/fi=
les/<br>
&gt;=C2=A0 =C2=A0 =C2=A0CVE-2026-25075.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -0,0 +1,50 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From d4b3c39776f06948d875614a0eddea9561159f2a Mon =
Sep 17 00:00:00 2001<br>
&gt;=C2=A0 =C2=A0 =C2=A0+From: Tobias Brunner &lt;<a href=3D"mailto:tobias@=
strongswan.org" target=3D"_blank">tobias@strongswan.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:tobias@strongswan.org"=
 target=3D"_blank">tobias@strongswan.org</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Date: Thu, 5 Mar 2026 12:43:12 +0100<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Subject: [PATCH] eap-ttls: Prevent crash if AVP le=
ngth header field<br>
&gt;=C2=A0 =C2=A0 =C2=A0is invalid<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+The length field in the AVP header includes the 8 =
bytes of the header<br>
&gt;=C2=A0 =C2=A0 =C2=A0+itself.=C2=A0 Not checking for that and later subt=
racting it causes an<br>
&gt;=C2=A0 =C2=A0 =C2=A0+integer underflow that usually triggers a crash wh=
en accessing a<br>
&gt;=C2=A0 =C2=A0 =C2=A0+NULL pointer that resulted from the failing chunk_=
alloc() call because<br>
&gt;=C2=A0 =C2=A0 =C2=A0+of the high value.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+The attempted allocations for invalid lengths (0-7=
) are 0xfffffff8,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so=
 this doesn&#39;t result<br>
&gt;=C2=A0 =C2=A0 =C2=A0+in a buffer overflow even if the allocation succee=
ds.<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Fixes: 79f2102cb442 (&quot;implemented server side=
 support for EAP-TTLS&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Fixes: CVE-2026-25075<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Upstream-Status: Backport [<a href=3D"https://down=
load.strongswan.org/" rel=3D"noreferrer" target=3D"_blank">https://download=
.strongswan.org/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0security/CVE-2026-25075/<br>
&gt;=C2=A0 =C2=A0 =C2=A0strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch &lt;h=
ttps://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://download.strongswan.org/security/=
CVE-2026-25075/" rel=3D"noreferrer" target=3D"_blank">download.strongswan.o=
rg/security/CVE-2026-25075/</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch&gt;]<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0+CVE: CVE-2026-25075<br>
&gt;=C2=A0 =C2=A0 =C2=A0+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto=
:vanusuri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:vanusuri@mvista.com" t=
arget=3D"_blank">vanusuri@mvista.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+---<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4=
 ++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+ 1 file changed, 2 insertions(+), 2 deletions(-)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+diff --git a/src/libcharon/plugins/eap_ttls/eap_tt=
ls_avp.c b/src/<br>
&gt;=C2=A0 =C2=A0 =C2=A0libcharon/plugins/eap_ttls/eap_ttls_avp.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+index 06389f7..2983bd0 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.=
c<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process=
, status_t,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0chunk_free(&amp;this-&gt;input);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0this-&gt;inpos =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (!success)<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
if (!success || avp_len &lt; AVP_HEADER_LEN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DBG1(DBG_IKE, &quot;received invalid AVP =
header&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FAILED;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process=
, status_t,<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return FAILED;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0this-&gt;process_header =3D FALSE;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
this-&gt;data_len =3D avp_len - 8;<br>
&gt;=C2=A0 =C2=A0 =C2=A0++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
this-&gt;data_len =3D avp_len - AVP_HEADER_LEN;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0this-&gt;input =3D chunk_alloc(this-&gt;data_len + (4 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0avp_len) % 4);<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0+--<br>
&gt;=C2=A0 =C2=A0 =C2=A0+2.25.1<br>
&gt;=C2=A0 =C2=A0 =C2=A0+<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta-networking/recipes-support/strong=
swan/<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://strongswan_5.9.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">strongswan_5.9.13.bb</a> &lt;<a href=3D"http://st=
rongswan_5.9.13.bb" rel=3D"noreferrer" target=3D"_blank">http://strongswan_=
5.9.13.bb</a>&gt; b/meta-<br>
&gt;=C2=A0 =C2=A0 =C2=A0networking/recipes-support/strongswan/<a href=3D"ht=
tp://strongswan_5.9.13.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_=
5.9.13.bb</a> &lt;http://<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://strongswan_5.9.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">strongswan_5.9.13.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0index 4c10636871..6a2b219275 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta-networking/recipes-support/strongswan/<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://strongswan_5.9.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">strongswan_5.9.13.bb</a> &lt;<a href=3D"http://st=
rongswan_5.9.13.bb" rel=3D"noreferrer" target=3D"_blank">http://strongswan_=
5.9.13.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta-networking/recipes-support/strongswan/<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://strongswan_5.9.13.bb" rel=3D"nore=
ferrer" target=3D"_blank">strongswan_5.9.13.bb</a> &lt;<a href=3D"http://st=
rongswan_5.9.13.bb" rel=3D"noreferrer" target=3D"_blank">http://strongswan_=
5.9.13.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -10,6 +10,7 @@ DEPENDS:append =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;tpm2&#39;, &#39;=C2=A0 tpm2-tss&#39;,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI =3D &quot;<a href=3D"https://download=
.strongswan.org/strongswan-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"=
_blank">https://download.strongswan.org/strongswan-${PV}.tar.bz2</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://download.strongswan.org/stro=
ngswan-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://down=
load.strongswan.org/strongswan-$%7BPV%7D.tar.bz2</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CV=
E-2025-62291.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CV=
E-2026-25075.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0=C2=A0SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;56e30effb578fd9426d8457e3b76c8c3728cd8a558959=
4b55649b2719308ba55&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.25.1<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000d69f0a064fa67aa6--

