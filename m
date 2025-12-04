Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D86D206AA
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 14:16:16 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44798.1764857769776226953
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 06:16:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G9plCL2K;
 spf=pass (domain: gmail.com, ip: 209.85.208.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so1692281a12.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 06:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764857768; x=1765462568; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WR8OJK+kYin/SodLKDzQE/0udTz/6SRgdeLU3tnqX5U=;
        b=G9plCL2KgPDTHdCb99jQqm/BhwCatzjrRKWszVm3Nyh+SQe/Y8Fu3bcu6NNCynzU9y
         F77nJpC83sZoN1WlZfw/WQIM3b/+BZDKYIiZxQWohQCNxKC8pX8uA8Veh++U1N9lWi6q
         LUY2FqHTFaf/Wix0rVG7Bn3caSQ5bGXGa2n3Lxfce2rMYtdfFFE6kB0B97A0f3vos6VZ
         u1ibAH3yH4QjW+W3tGwj9GAcSU95/zs0cTO1WKHy3rfcqujpAw/sHWexcMBRe0D82jWL
         ZxQ/e3Lw8PFiCadawHUNl0zY+7/R6AEQRPVps5jgY755JjF3y6vZUVh0IXPfyWHeYZct
         k2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764857768; x=1765462568;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WR8OJK+kYin/SodLKDzQE/0udTz/6SRgdeLU3tnqX5U=;
        b=KF+JZhEL4UZKkGBemLB4lgDemCT880m4zEiYfASXk3AzzCUUOTrPL58LKUpjTDzCno
         qzhPk5jn43TRJxOcAlY99mSNlc6xk1G3IZ7StBif/ooU7rI+cP2h0vvozo8e1nnng+tT
         SJqeG+INBzFrMlZ9k7Czq6J0aRbkavvgxsyc+RFH5DMD79nV2m0KguYbq7VdfnsjEOAc
         a1DUob4mG4zLfxvErqnKlxuoeJr8WnUDQhKYZ77BU82LPVe51+zFIk0rWRqoiXumWo4b
         XWCDTl3J1/m8JZgwbcWytBxx2xj7BfCsmGzAF54jCx78v7lC255LwCvCWwztqJiF3jYE
         /TKw==
X-Gm-Message-State: AOJu0YzZngepBOOiXwLS8KalLN8BAsBaWgEEn7LzD3m+XFKEL9cLC+tR
	qEoQCkrsawrUM8Vk5mPvYDHhOkCCMfAreNXxBEhyyBzwetXh7WsyJU8DFYAtaaoCunJ4pUeIbCd
	ymivTVZ1xrV4iCBvczvUJFbPwH7NpI23dlk91zIc=
X-Gm-Gg: ASbGncs2m8vziflGHB3bCfAcer9VrOmB1LEyLg+r8hDK8u3cju7Uy+Tq8dX3Pk8Ozx4
	zn1goLYAg009LLqMT/nKFxnngO+BhlIY/iStxCOyGwY3ihkzinOWpihJl+5+u+H9432CDwX2LgP
	v027BWY5/slahkrw0Q6vxP+bNoIO/AKi7M3qIXZ54cXaaJIDUAcbOhTHNABcsD5i/PtezleWeZb
	MverLoaVJwx6r0g3zoMqFlfnriJ/9CxDMFjFVYyABfdAqP1OygZIdnHrW513qPy4nqUUsajJ7EQ
	8UWHXt/Mlc8w/cqPkrIXk2+PfGZ9bTlnDK6wNVNSzVAlPLjyqudx+cA4bGa71l/JOQ+V0sqzS7m
	UIWX0J4dhtsayVHMeqVlRDWM=
X-Google-Smtp-Source: AGHT+IG0H2FPBP7j92bamPM1lXcQJiy98hbyDxA7dTmL0GKNmzk9wD1kpLnHj1eyuggI6k9Wt0IGyu6VxeV/uXkl5lw=
X-Received: by 2002:a05:6402:354b:b0:633:d0b7:d6d2 with SMTP id
 4fb4d7f45d1cf-647abdd58efmr2931542a12.18.1764857767828; Thu, 04 Dec 2025
 06:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20251203221541.2247324-1-peter.marko@siemens.com>
 <CAMKF1so1WDamJ=kmkbAGto5FpHP67yXPi04V_jpAk7DqjoW82g@mail.gmail.com> <AS1PR10MB5697FF46DF975BB93873E971FDA6A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697FF46DF975BB93873E971FDA6A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Dec 2025 06:15:38 -0800
X-Gm-Features: AWmQ_bl_JbdHbvyC1of98L9ljajKQi5-8umxjNPL49n2sRavD6V65T14hnoMiT4
Message-ID: <CAMKF1sqdOWtJVyGQ+ufCu9DAcM7wvugYha1BpNUk7hq1hPuPMA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] libcoap: upgrade 4.3.5 -> 4.3.5a
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000054a0a4064520f89f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 14:16:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122323

--00000000000054a0a4064520f89f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

perhaps

BB_GIT_SHALLOW =3D "1"

might help.

On Wed, Dec 3, 2025 at 11:25=E2=80=AFPM Marko, Peter <Peter.Marko@siemens.c=
om>
wrote:

> I=E2=80=99m not sure what=E2=80=99s with my local downloads cache setup, =
but even cleanall
> didn=E2=80=99t help and it succeeded.
>
> Anyway I have sent a v2 with corrected branch now.
>
>
>
> Peter
>
>
>
>
>
> *From:* Khem Raj <raj.khem@gmail.com>
> *Sent:* Thursday, December 4, 2025 5:33
> *To:* Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> *Cc:* openembedded-devel@lists.openembedded.org
> *Subject:* Re: [oe] [meta-networking][PATCH] libcoap: upgrade 4.3.5 ->
> 4.3.5a
>
>
>
>
>
>
>
> On Wed, Dec 3, 2025 at 2:15=E2=80=AFPM Peter Marko via lists.openembedded=
.org
> <peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:
>
> From: Peter Marko <peter.marko@siemens.com>
>
> Changelog [1]:
>   * Fixes the following CVEs
>     CVE-2025-59391
>     CVE-2025-65494
>     CVE-2025-65495
>     CVE-2025-65496
>     CVE-2025-65497
>     CVE-2025-65498
>     CVE-2025-65499
>     CVE-2025-65500
>     CVE-2025-65501
>   * CVE-2025-50518 not fixed as user application error.
>   * Support for Mbed TLS 3.6.3.
>   * Support for RIOT update changes.
>   * Fixes for later CI environment builds.
>   * Critical reported bugs fixed.
>
> Add tag to SRC_URI for hash verification.
>
> License-Update: copyright years refreshed [2]
>
> [1] https://github.com/obgm/libcoap/blob/v4.3.5a/ChangeLog
> [2]
> https://github.com/obgm/libcoap/commit/993c12ac92ce6a24a409924fe78a5c0fe7=
246699
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../libcoap/{libcoap_4.3.5.bb =3D> libcoap_4.3.5a.bb}         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.5.bb =3D>
> libcoap_4.3.5a.bb} (93%)
>
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
> similarity index 93%
> rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
> index a4e5f5ca46..0a8dacc377 100644
> --- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
> @@ -5,12 +5,12 @@ RF range, memory, bandwith, or network packet sizes."
>  HOMEPAGE =3D "https://libcoap.net/"
>
>  LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9aa68c0f6785376aa8ec7f4f1aa6a=
e3c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D05d17535846895e23ea4c79b16a9e=
904"
>
> -SRC_URI =3D "git://github.com/obgm/libcoap.git;branch=3Dmain;protocol=3D=
https \
> +SRC_URI =3D "git://
> github.com/obgm/libcoap.git;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}
> <http://github.com/obgm/libcoap.git;branch=3Dmain;protocol=3Dhttps;tag=3D=
v$%7BPV%7D>
> \
>
>
>
> This fails to fetch because the commit it not on main branch but
> on release-4.3.5-patches branch
>
> see
>
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4396669/raw_inl=
ine
>
>
>
> I think bitbake -ccleanall <recipe> && bitbake <recipe>
>
>
>
> should reveal it
>
>
>
>             file://run-ptest \
>             "
> -SRCREV =3D "7cf7465b784baded4de183290c547d582becfd28"
> +SRCREV =3D "e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9"
>
>
>  inherit autotools manpages pkgconfig ptest
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122293):
> https://lists.openembedded.org/g/openembedded-devel/message/122293
> Mute This Topic: https://lists.openembedded.org/mt/116602955/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000054a0a4064520f89f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>perhaps=C2=A0</div><div><br></div><div>BB_GIT_SHALLOW=
 =3D &quot;1&quot;</div><div><br></div><div>might help.=C2=A0</div><br><div=
 class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Dec 3, 2025 at 11:25=E2=80=AFPM Marko, Peter &lt;<a href=3D=
"mailto:Peter.Marko@siemens.com">Peter.Marko@siemens.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D"msg-2=
350133091028474280">





<div lang=3D"EN-US" style=3D"overflow-wrap: break-word;">
<div class=3D"m_-2350133091028474280WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">I=E2=80=99m not sure what=E2=80=99s with my local downloads cache s=
etup, but even cleanall didn=E2=80=99t help and it succeeded.<u></u><u></u>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Anyway I have sent a v2 with corrected branch now.<u></u><u></u></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif">Peter<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10pt;font-family:Arial,sans=
-serif"><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-top:none;border-right:none;border-bottom:none;border-l=
eft:1.5pt solid blue;padding:0in 0in 0in 4pt">
<div>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:Calibri=
,sans-serif">From:</span></b><span style=3D"font-size:11pt;font-family:Cali=
bri,sans-serif"> Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;
<br>
<b>Sent:</b> Thursday, December 4, 2025 5:33<br>
<b>To:</b> Marko, Peter (FT D EU SK BFS1) &lt;<a href=3D"mailto:Peter.Marko=
@siemens.com" target=3D"_blank">Peter.Marko@siemens.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:openembedded-devel@lists.openembedded.org" tar=
get=3D"_blank">openembedded-devel@lists.openembedded.org</a><br>
<b>Subject:</b> Re: [oe] [meta-networking][PATCH] libcoap: upgrade 4.3.5 -&=
gt; 4.3.5a<u></u><u></u></span></p>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Wed, Dec 3, 2025 at 2:15<span style=3D"font-famil=
y:Arial,sans-serif">=E2=80=AF</span>PM Peter Marko via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists.openembed=
ded.org" target=3D"_blank">siemens.com@lists.openembedded.org</a>&gt; wrote=
:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal">From: Peter Marko &lt;<a href=3D"mailto:peter.marko@=
siemens.com" target=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
<br>
Changelog [1]:<br>
=C2=A0 * Fixes the following CVEs<br>
=C2=A0 =C2=A0 CVE-2025-59391<br>
=C2=A0 =C2=A0 CVE-2025-65494<br>
=C2=A0 =C2=A0 CVE-2025-65495<br>
=C2=A0 =C2=A0 CVE-2025-65496<br>
=C2=A0 =C2=A0 CVE-2025-65497<br>
=C2=A0 =C2=A0 CVE-2025-65498<br>
=C2=A0 =C2=A0 CVE-2025-65499<br>
=C2=A0 =C2=A0 CVE-2025-65500<br>
=C2=A0 =C2=A0 CVE-2025-65501<br>
=C2=A0 * CVE-2025-50518 not fixed as user application error.<br>
=C2=A0 * Support for Mbed TLS 3.6.3.<br>
=C2=A0 * Support for RIOT update changes.<br>
=C2=A0 * Fixes for later CI environment builds.<br>
=C2=A0 * Critical reported bugs fixed.<br>
<br>
Add tag to SRC_URI for hash verification.<br>
<br>
License-Update: copyright years refreshed [2]<br>
<br>
[1] <a href=3D"https://github.com/obgm/libcoap/blob/v4.3.5a/ChangeLog" targ=
et=3D"_blank">
https://github.com/obgm/libcoap/blob/v4.3.5a/ChangeLog</a><br>
[2] <a href=3D"https://github.com/obgm/libcoap/commit/993c12ac92ce6a24a4099=
24fe78a5c0fe7246699" target=3D"_blank">
https://github.com/obgm/libcoap/commit/993c12ac92ce6a24a409924fe78a5c0fe724=
6699</a><br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../libcoap/{<a href=3D"http://libcoap_4.3.5.bb" target=3D"_blank">li=
bcoap_4.3.5.bb</a> =3D&gt;
<a href=3D"http://libcoap_4.3.5a.bb" target=3D"_blank">libcoap_4.3.5a.bb</a=
>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-networking/recipes-devtools/libcoap/{<a href=3D"http://li=
bcoap_4.3.5.bb" target=3D"_blank">libcoap_4.3.5.bb</a> =3D&gt;
<a href=3D"http://libcoap_4.3.5a.bb" target=3D"_blank">libcoap_4.3.5a.bb</a=
>} (93%)<br>
<br>
diff --git a/meta-networking/recipes-devtools/libcoap/<a href=3D"http://lib=
coap_4.3.5.bb" target=3D"_blank">libcoap_4.3.5.bb</a> b/meta-networking/rec=
ipes-devtools/libcoap/<a href=3D"http://libcoap_4.3.5a.bb" target=3D"_blank=
">libcoap_4.3.5a.bb</a><br>
similarity index 93%<br>
rename from meta-networking/recipes-devtools/libcoap/<a href=3D"http://libc=
oap_4.3.5.bb" target=3D"_blank">libcoap_4.3.5.bb</a><br>
rename to meta-networking/recipes-devtools/libcoap/<a href=3D"http://libcoa=
p_4.3.5a.bb" target=3D"_blank">libcoap_4.3.5a.bb</a><br>
index a4e5f5ca46..0a8dacc377 100644<br>
--- a/meta-networking/recipes-devtools/libcoap/<a href=3D"http://libcoap_4.=
3.5.bb" target=3D"_blank">libcoap_4.3.5.bb</a><br>
+++ b/meta-networking/recipes-devtools/libcoap/<a href=3D"http://libcoap_4.=
3.5a.bb" target=3D"_blank">libcoap_4.3.5a.bb</a><br>
@@ -5,12 +5,12 @@ RF range, memory, bandwith, or network packet sizes.&quot=
;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://libcoap.net/" target=3D"_blank"=
>https://libcoap.net/</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSE;md5=3D9aa68c0f6785376aa8ec7f4=
f1aa6ae3c</a>&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;<a>file://LICENSE;md5=3D05d17535846895e23ea4c79=
b16a9e904</a>&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/obgm/libcoap.git;bran=
ch=3Dmain;protocol=3Dhttps" target=3D"_blank">github.com/obgm/libcoap.git;b=
ranch=3Dmain;protocol=3Dhttps</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/obgm/libcoap.git;bran=
ch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" target=3D"_blank">github.com/o=
bgm/libcoap.git;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}</a> \<u></u><u>=
</u></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">This fails to fetch because the commit it not on mai=
n branch but on=C2=A0release-4.3.5-patches branch<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">see=C2=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><a href=3D"https://autobuilder.yoctoproject.org/valk=
yrie/api/v2/logs/4396669/raw_inline" target=3D"_blank">https://autobuilder.=
yoctoproject.org/valkyrie/api/v2/logs/4396669/raw_inline</a><u></u><u></u><=
/p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I think bitbake -ccleanall=C2=A0&lt;recipe&gt; &amp;=
&amp; bitbake &lt;recipe&gt;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">should reveal it<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0in 0in 0in 6pt;margin-left:4=
.8pt;margin-right:0in">
<p class=3D"MsoNormal" style=3D"margin-bottom:12pt">=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 <a>
file://run-ptest</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;7cf7465b784baded4de183290c547d582becfd28&quot;<br>
+SRCREV =3D &quot;e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9&quot;<br>
<br>
<br>
=C2=A0inherit autotools manpages pkgconfig ptest<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122293): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122293" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/message/122293</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116602955/199=
7914" target=3D"_blank">
https://lists.openembedded.org/mt/116602955/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">
openembedded-devel+owner@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" target=3D"_blank">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"m=
ailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<u></u><u></u></p>
</blockquote>
</div>
</div>
</div>
</div>
</div>

</div></blockquote></div></div>

--00000000000054a0a4064520f89f--

