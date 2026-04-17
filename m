Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519BAF4368F
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 11:05:10 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42337.1776423903308861711
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Apr 2026 04:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=a+2Y6k/Q;
 spf=pass (domain: mvista.com, ip: 209.85.208.42, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6712fd40860so867689a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 04:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776423901; cv=none;
        d=google.com; s=arc-20240605;
        b=kx4Ay4mS4R52bGprQefX7BG2XMFqnGk4/Ve0KL00hM09BxNRgBKafSWmBmSGl0mrOo
         lHGbBvabszKlHT+B86PI7SSc7kbicCF7C72jKiE9f3wmwzog5UihVsX4B7yffgPumCyb
         OStBIpM2Ydby2BgSUwLokkUCx0eSs9fAHV+eiwIs9i7BZtFFDY55ZUrv73gz80PkUsCl
         pKYiLoYL9qXkyZ4Nni/vkVBtTq4chSr6nTPW8cuNShV1Kpm6xLMTLKue+6n4aIsVzbwf
         1W36/VqE0Py+l5PGqGpyJEN5CFK+8NJ4hlygWl0/OA19BODYP0HZaY+T8Nh0i3bYRisn
         pkKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=w5vf4m+PCB3GMl1DyL8bixdsIlbRe+oe3Zi+tmjDdnE=;
        fh=0o8T1UwYufgAJuQ2aJ1FnAjBKcQ9cY25RMo3GCwk7qk=;
        b=HGZiVLlbZ8vrTVyQzPnL+fMhQhBr+XOLh+xSRj0i3RC+RMLBjS8mXgMCDDkXkqCuN8
         luku5PSGaPWokDVoGABeuc++ANnDg11wqBGIti+Fyh4ikT1drRBod9tI7LFyQqJVzGPx
         7KrnEvbh4wqtTA8vXdRfJqtK6L7skDmS0vrlNCvJCGTvNtYqbop24yI5bURMafmOCAOS
         UJ4SvgMVqSvFouXh/n3x7wV+HPLfnDJ4vTD3aD1VorjUMPC/y1H92QeMwf7BBhjDEPnm
         KNLilUXO9ormtprI3lNXtHkjOkZ/e845N10pj8IQ0OdZvisgCDQnx19QyFm6aAGoI7d0
         /Tcg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1776423901; x=1777028701; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5vf4m+PCB3GMl1DyL8bixdsIlbRe+oe3Zi+tmjDdnE=;
        b=a+2Y6k/QuGBcIDj+a0A/FVZUCUEbQ7QaHpJuHgWM4+iCYTB2c4MO9qOEgG0uj+T2f2
         xtctlWen2r+mjvsmlk5iIOu/2G+GDAZxMZHcYNRkkkW/BRk+HSG3ky/R6X5zKmaq6tJO
         v+pykbQH8XA+cf94t9Ma/FOpvqwuecYszNV9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776423901; x=1777028701;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w5vf4m+PCB3GMl1DyL8bixdsIlbRe+oe3Zi+tmjDdnE=;
        b=mqGewNWhLh7VoL6VsJkI/IKmNb2H6rQZrThs0xqFAgyv/K5u3IHh0fHlkgRxgwR2u3
         zLtIRCAmUjG0C7MTWVHgC0Gkrw6PyvpXc+DpS1rrT7wY6ZWEj6b0N192OiWoUzwtRC/Y
         6m8y2dawKoonZnIynTnhVdt0Vz8gRpofVdH7jZNUh0LgAGNR0oz47AbOb8fA2bPLnhff
         S59a8aswQ5pbLBLobceSN/DE6V1yFAQesGpT4N3xhMYqv7gi2kjVkpH2caiCaMtoJMtr
         3lAQ6Li2/0fZHYnfvmaPm3GqEGa4YOivu8pnn1skGVhTeUHVqhuzNZhJFlhbRnX0dqX1
         5WsA==
X-Gm-Message-State: AOJu0Yxmfdhd6o8yoWhWhLSZnQEqVfHRGogOd7huZaIVnOzea+gbC/zL
	eI6cnoc3GGtQAoKTr3mwmV6rodNoj5KZGgsydWj/u10TBWKdD219vXtmIEj91zbphH74Ppx9n2A
	idDR+Z518dyIuybqaZmcADmYVQLwA+sN97/1RAHba1yLxx04VvtRCtAg=
X-Gm-Gg: AeBDietvIucTmoXmnpiRvHxOKmv9tPx5QxC/NY3OtS6gHqDGQazZib088/haoOSQcdc
	eY15fKsREj1lL9w2XWUb+E4cBlLCmtWznkbPP2/ypEEC3B6bTAOs/eUauObHyYO6J5B7x5W0WOj
	wIq91EzsYN5yVknZ5c+qJANgnWcn2GKFOhzC7xt2RCalf/cxtjW158GZ8fDlHmNHrx0rClboCPq
	EIro7T+RV+dC7yrRmCIJ6oTfcF739LXXD5PGbeG7Yxnal0yYX7/dpfH2CIOxMGFUsWGm/8K4j3r
	dM4Pif5AxnVxyixL0M6iYZfwxZJU5g==
X-Received: by 2002:a05:6402:90a:b0:65f:71ed:7ab9 with SMTP id
 4fb4d7f45d1cf-672bfddf0e0mr1139307a12.22.1776423900416; Fri, 17 Apr 2026
 04:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260402035053.69593-1-vanusuri@mvista.com>
In-Reply-To: <20260402035053.69593-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Fri, 17 Apr 2026 16:34:48 +0530
X-Gm-Features: AQROBzD0dLI-ZKnk9prXNz0hnKj1gpDt_0t_5yiVxgXuxZ_21eTWzpOWNeq71Ek
Message-ID: <CANQUz19-1_+PGS_yyq+jQaiBAh6Mhi0+Zc7rD3Qte31tMCwv6g@mail.gmail.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH] strongswan: Fix CVE-2026-25075
To: openembedded-devel@lists.openembedded.org, 
	Gyorgy Sarvari <skandigraun@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008e2861064fa5eb5e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Apr 2026 11:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126434

--0000000000008e2861064fa5eb5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Team,

Any update on this ?

Thanks & Regards,
Vijay

On Thu, Apr 2, 2026 at 9:21=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> Pick patch according to [1]
>
> [1] https://download.strongswan.org/security/CVE-2026-25075/
> [2]
> https://www.strongswan.org/blog/2026/03/23/strongswan-vulnerability-(cve-=
2026-25075).html
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../strongswan/files/CVE-2026-25075.patch     | 50 +++++++++++++++++++
>  .../strongswan/strongswan_5.9.13.bb           |  1 +
>  2 files changed, 51 insertions(+)
>  create mode 100644
> meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch
>
> diff --git
> a/meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch
> b/meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch
> new file mode 100644
> index 0000000000..3b38a099a2
> --- /dev/null
> +++ b/meta-networking/recipes-support/strongswan/files/CVE-2026-25075.pat=
ch
> @@ -0,0 +1,50 @@
> +From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001
> +From: Tobias Brunner <tobias@strongswan.org>
> +Date: Thu, 5 Mar 2026 12:43:12 +0100
> +Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field is
> invalid
> +
> +The length field in the AVP header includes the 8 bytes of the header
> +itself.  Not checking for that and later subtracting it causes an
> +integer underflow that usually triggers a crash when accessing a
> +NULL pointer that resulted from the failing chunk_alloc() call because
> +of the high value.
> +
> +The attempted allocations for invalid lengths (0-7) are 0xfffffff8,
> +0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn't result
> +in a buffer overflow even if the allocation succeeds.
> +
> +Fixes: 79f2102cb442 ("implemented server side support for EAP-TTLS")
> +Fixes: CVE-2026-25075
> +
> +Upstream-Status: Backport [
> https://download.strongswan.org/security/CVE-2026-25075/strongswan-4.5.0-=
6.0.4_eap_ttls_avp_len.patch
> ]
> +CVE: CVE-2026-25075
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> +index 06389f7..2983bd0 100644
> +--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> ++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c
> +@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
> +               chunk_free(&this->input);
> +               this->inpos =3D 0;
> +
> +-              if (!success)
> ++              if (!success || avp_len < AVP_HEADER_LEN)
> +               {
> +                       DBG1(DBG_IKE, "received invalid AVP header");
> +                       return FAILED;
> +@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,
> +                       return FAILED;
> +               }
> +               this->process_header =3D FALSE;
> +-              this->data_len =3D avp_len - 8;
> ++              this->data_len =3D avp_len - AVP_HEADER_LEN;
> +               this->input =3D chunk_alloc(this->data_len + (4 - avp_len=
) %
> 4);
> +       }
> +
> +--
> +2.25.1
> +
> diff --git a/meta-networking/recipes-support/strongswan/
> strongswan_5.9.13.bb b/meta-networking/recipes-support/strongswan/
> strongswan_5.9.13.bb
> index 4c10636871..6a2b219275 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.13.bb
> @@ -10,6 +10,7 @@ DEPENDS:append =3D
> "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
>
>  SRC_URI =3D "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
>             file://CVE-2025-62291.patch \
> +           file://CVE-2026-25075.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "56e30effb578fd9426d8457e3b76c8c3728cd8a5589594b55649b2719308ba55"
> --
> 2.25.1
>
>

--0000000000008e2861064fa5eb5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Hi Team,<br><br></div>Any update on this ?<=
br><br></div>Thanks &amp;=C2=A0Regards,<br></div>Vijay</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">On Thu, Apr 2, 2026 at 9:21=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mvi=
sta.com">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanus=
uri@mvista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
Pick patch according to [1]<br>
<br>
[1] <a href=3D"https://download.strongswan.org/security/CVE-2026-25075/" re=
l=3D"noreferrer" target=3D"_blank">https://download.strongswan.org/security=
/CVE-2026-25075/</a><br>
[2] <a href=3D"https://www.strongswan.org/blog/2026/03/23/strongswan-vulner=
ability-(cve-2026-25075).html" rel=3D"noreferrer" target=3D"_blank">https:/=
/www.strongswan.org/blog/2026/03/23/strongswan-vulnerability-(cve-2026-2507=
5).html</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../strongswan/files/CVE-2026-25075.patch=C2=A0 =C2=A0 =C2=A0| 50 +++=
++++++++++++++++<br>
=C2=A0.../strongswan/<a href=3D"http://strongswan_5.9.13.bb" rel=3D"norefer=
rer" target=3D"_blank">strongswan_5.9.13.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 1 +<br>
=C2=A02 files changed, 51 insertions(+)<br>
=C2=A0create mode 100644 meta-networking/recipes-support/strongswan/files/C=
VE-2026-25075.patch<br>
<br>
diff --git a/meta-networking/recipes-support/strongswan/files/CVE-2026-2507=
5.patch b/meta-networking/recipes-support/strongswan/files/CVE-2026-25075.p=
atch<br>
new file mode 100644<br>
index 0000000000..3b38a099a2<br>
--- /dev/null<br>
+++ b/meta-networking/recipes-support/strongswan/files/CVE-2026-25075.patch=
<br>
@@ -0,0 +1,50 @@<br>
+From d4b3c39776f06948d875614a0eddea9561159f2a Mon Sep 17 00:00:00 2001<br>
+From: Tobias Brunner &lt;<a href=3D"mailto:tobias@strongswan.org" target=
=3D"_blank">tobias@strongswan.org</a>&gt;<br>
+Date: Thu, 5 Mar 2026 12:43:12 +0100<br>
+Subject: [PATCH] eap-ttls: Prevent crash if AVP length header field is inv=
alid<br>
+<br>
+The length field in the AVP header includes the 8 bytes of the header<br>
+itself.=C2=A0 Not checking for that and later subtracting it causes an<br>
+integer underflow that usually triggers a crash when accessing a<br>
+NULL pointer that resulted from the failing chunk_alloc() call because<br>
+of the high value.<br>
+<br>
+The attempted allocations for invalid lengths (0-7) are 0xfffffff8,<br>
+0xfffffffc, or 0x100000000 (0 on 32-bit hosts), so this doesn&#39;t result=
<br>
+in a buffer overflow even if the allocation succeeds.<br>
+<br>
+Fixes: 79f2102cb442 (&quot;implemented server side support for EAP-TTLS&qu=
ot;)<br>
+Fixes: CVE-2026-25075<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://download.strongswan.org/secu=
rity/CVE-2026-25075/strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch" rel=3D"n=
oreferrer" target=3D"_blank">https://download.strongswan.org/security/CVE-2=
026-25075/strongswan-4.5.0-6.0.4_eap_ttls_avp_len.patch</a>]<br>
+CVE: CVE-2026-25075<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ src/libcharon/plugins/eap_ttls/eap_ttls_avp.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c b/src/libcharon=
/plugins/eap_ttls/eap_ttls_avp.c<br>
+index 06389f7..2983bd0 100644<br>
+--- a/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c<br>
++++ b/src/libcharon/plugins/eap_ttls/eap_ttls_avp.c<br>
+@@ -119,7 +119,7 @@ METHOD(eap_ttls_avp_t, process, status_t,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chunk_free(&amp;thi=
s-&gt;input);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;inpos =3D =
0;<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!success)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!success || avp_len =
&lt; AVP_HEADER_LEN)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0DBG1(DBG_IKE, &quot;received invalid AVP header&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return FAILED;<br>
+@@ -130,7 +130,7 @@ METHOD(eap_ttls_avp_t, process, status_t,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return FAILED;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;process_he=
ader =3D FALSE;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;data_len =3D av=
p_len - 8;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 this-&gt;data_len =3D av=
p_len - AVP_HEADER_LEN;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this-&gt;input =3D =
chunk_alloc(this-&gt;data_len + (4 - avp_len) % 4);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta-networking/recipes-support/strongswan/<a href=3D"http://s=
trongswan_5.9.13.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_5.9.13=
.bb</a> b/meta-networking/recipes-support/strongswan/<a href=3D"http://stro=
ngswan_5.9.13.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_5.9.13.bb=
</a><br>
index 4c10636871..6a2b219275 100644<br>
--- a/meta-networking/recipes-support/strongswan/<a href=3D"http://strongsw=
an_5.9.13.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_5.9.13.bb</a>=
<br>
+++ b/meta-networking/recipes-support/strongswan/<a href=3D"http://strongsw=
an_5.9.13.bb" rel=3D"noreferrer" target=3D"_blank">strongswan_5.9.13.bb</a>=
<br>
@@ -10,6 +10,7 @@ DEPENDS:append =3D &quot;${@bb.utils.contains(&#39;DISTRO=
_FEATURES&#39;, &#39;tpm2&#39;, &#39;=C2=A0 tpm2-tss&#39;,<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"https://download.strongswan.org/strongsw=
an-$%7BPV%7D.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://download=
.strongswan.org/strongswan-${PV}.tar.bz2</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2025-62291.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-25075.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;56e30effb578fd9426d8457e3b76c8c3728cd8a5=
589594b55649b2719308ba55&quot;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000008e2861064fa5eb5e--

