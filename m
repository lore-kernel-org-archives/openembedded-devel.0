Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ADCC3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 05:24:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.8819.1721280243777123067
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jul 2024 22:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NP69PNmT;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70b0ebd1ef9so239146b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jul 2024 22:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721280243; x=1721885043; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QpdI0xuzTbEji0SWFcwdDhCKEtntZHnQg7FF0GcEvY4=;
        b=NP69PNmToyJp+hZP3Gqd0XlIaZi3GDuO9/hr9wiyxgKPnltfYFvjoOP23aL9z8V2Dw
         VzO3iDVvWCllUr+b4CY9JLp45zYUP7xuL2WrT0WdPeHZp834geA4YUHHF5c4Vq91N9l2
         YYUyJZWI3Cl1WrchMK7nZsJIt3dYIP1D4iOVRPnaXr8mwPm64ewI43d5hIMWsxTNTy8q
         osxLQoolWtQ/BMhV/z+MwgJGsKIWGf2GhUbxua3I26WeV/O499/Xd4sipo+2gbrC4N2h
         LzDi8pRJBBY5SD3uycBxeLVRrG5h4A+hvp1kzsNlmaKoURZy0m0pfGdZ+vWRoOaaKVBO
         sDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721280243; x=1721885043;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpdI0xuzTbEji0SWFcwdDhCKEtntZHnQg7FF0GcEvY4=;
        b=Pe68N6XW/4FGQ43GkGvHpwvxxwyxQYT46Xv9VIX71q1z88itZgmeUJub0QWDdLOYrZ
         dFBsTpkcaWhpBlMNvm+AGbFlvTOumHQQSGDxKqF0UtYNVP/tEYWomZt8TQclQiQizPQI
         pGas620rqdO4CziktwwRGFDWf6UbYA9GIicCiR8iXD2mMvdAAx1bHAzH7klvPwFIroqn
         O5Wyn51xZYvX5ZAaTEsqtQPVK6RGiIbH/tRQKcaJ0gEJzX87ZsyM3+k662SHuvF9VzQy
         njsQ1dX6IuiIDhMEwh9pRAaMC2p6Tsey6F5uYUtXvXYkNvGsQ1yU6R5PXJ7zUnQso9vI
         cU0w==
X-Forwarded-Encrypted: i=1; AJvYcCXEJu1DexOc7tsPnexGzLEM9hcdV3wBguUvkqbD/0I3tq44Oz+s4AnTuG3SdnHlWEEXHzIbyTz6N5ZMiZl2Et+NPMQVx95IiwMax1iJ93y0i1F+yUQiOi2JLA==
X-Gm-Message-State: AOJu0Yxguse33GWteDbE9n6uN7PPzpGMKIswhVZS7PVVVO9HRh7GgmPX
	NcCFNmGnPNURwecASyNTP01l2fPWiREqAdf494cRxV+4sf9OlaKsPQWjOyF22wTSQlZxBpoIxri
	jb+cr50wlCxhnu1BsUfcEhvviXDY=
X-Google-Smtp-Source: AGHT+IHBbVDsPfMecmujH8uEQ4XQgZuL1mfvobAv4LxZhZGjvHoRNau4Ewan8FAgG9vcztJ1dAYF1BcPhxqAsnwugMg=
X-Received: by 2002:a05:6a20:7f93:b0:1c3:ff33:2837 with SMTP id
 adf61e73a8af0-1c3ff3328dbmr3226949637.54.1721280242949; Wed, 17 Jul 2024
 22:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240717063948.18385-1-shin.matsunaga@fujitsu.com>
 <CAApg2=TuR+LmcZsop056LF41v+3ONTQpqxpq3+mhvx4F6VfSRg@mail.gmail.com> <TY3PR01MB117885964FA803063255439C792AC2@TY3PR01MB11788.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB117885964FA803063255439C792AC2@TY3PR01MB11788.jpnprd01.prod.outlook.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 18 Jul 2024 07:23:51 +0200
Message-ID: <CAApg2=RozV0zAswXmGpSa5a8U-eRB2Ajjf4ZTh+VJ5FBTGaS2g@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] audit: Add linux_audit to CVE_PRODUCT
To: "Shinji Matsunaga (Fujitsu)" <shin.matsunaga@fujitsu.com>
Cc: "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
	"Shunsuke Tokumoto (Fujitsu)" <s-tokumoto@fujitsu.com>
Content-Type: multipart/alternative; boundary="00000000000070a99c061d7ec9bc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Jul 2024 05:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111391

--00000000000070a99c061d7ec9bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
I am not aware of any CVE in the linux_audit project since 2018. There are
fixes that are well worth a CVE in my opinion (even from this year). My
suggestion is more to be future-proof. The name is generic and there will
be a project with a similar name getting a CVE one day.

Kind regards,
Marta

On Thu, Jul 18, 2024 at 6:38=E2=80=AFAM Shinji Matsunaga (Fujitsu) <
shin.matsunaga@fujitsu.com> wrote:

> Hello,
>
> Are not there any vulnerabilities where the vendor is other than
> linux_audit_project?
>
>
>
> Kind regards,
>
> Shinji
>
> *From:* Marta Rybczynska <rybczynska@gmail.com>
> *Sent:* Wednesday, July 17, 2024 8:57 PM
> *To:* Matsunaga, Shinji/=E6=9D=BE=E6=B0=B8 =E6=85=8E=E5=8F=B8 <shin.matsu=
naga@fujitsu.com>
> *Cc:* raj.khem@gmail.com; openembedded-devel@lists.openembedded.org;
> Tokumoto, Shunsuke/=E5=BE=B3=E6=9C=AC =E4=BF=8A=E4=BB=8B <s-tokumoto@fuji=
tsu.com>
> *Subject:* Re: [oe] [PATCH 2/2] audit: Add linux_audit to CVE_PRODUCT
>
>
>
>
>
>
>
> On Wed, Jul 17, 2024 at 8:39=E2=80=AFAM Matsunaga-Shinji via
> lists.openembedded.org <shin.matsunaga=3Dfujitsu.com@lists.openembedded.o=
rg>
> wrote:
>
> linux_audit is also a valid CVE_PRODUCT for audit,
> e.g., https://nvd.nist.gov/vuln/detail/CVE-2015-5186.
>
> Signed-off-by: Shinji Matsunaga <shin.matsunaga@fujitsu.com>
> Signed-off-by: Shunsuke Tokumoto <s-tokumoto@fujitsu.com>
> ---
>  meta-oe/recipes-security/audit/audit_4.0.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb
> b/meta-oe/recipes-security/audit/audit_4.0.1.bb
> index bd8f8cc31..0b5857cbf 100644
> --- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
> +++ b/meta-oe/recipes-security/audit/audit_4.0.1.bb
> @@ -102,4 +102,4 @@ do_install:append() {
>      install -d -m 0700 ${D}${localstatedir}/spool/audit
>  }
>
> -CVE_PRODUCT =3D "linux:audit"
> +CVE_PRODUCT =3D "linux:audit linux_audit"
>
>
>
> Hello,
>
> I think it will be better to put linux_audit_project:linux_audit
>
>
>
> What do you think?
>
>
>
> Kind regards,
>
> Marta
>

--00000000000070a99c061d7ec9bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>I am not aware of any CVE in the lin=
ux_audit project since 2018. There are fixes that are well worth a CVE in m=
y opinion (even from this year). My suggestion is more to be future-proof. =
The name is generic and there will be a project with a similar name getting=
 a CVE one day.</div><div><br></div><div>Kind regards,</div><div>Marta <br>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Thu, Jul 18, 2024 at 6:38=E2=80=AFAM Shinji Matsunaga (Fujitsu) &lt;<a h=
ref=3D"mailto:shin.matsunaga@fujitsu.com">shin.matsunaga@fujitsu.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"JA">
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E6=B8=B8=
=E3=82=B4=E3=82=B7=E3=83=83=E3=82=AF" lang=3D"EN-US">Hello,
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E6=B8=B8=
=E3=82=B4=E3=82=B7=E3=83=83=E3=82=AF" lang=3D"EN-US">Are not there any vuln=
erabilities where the vendor is other than linux_audit_project?</span><span=
 lang=3D"EN-US">
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E6=B8=B8=
=E3=82=B4=E3=82=B7=E3=83=83=E3=82=AF" lang=3D"EN-US">Kind regards,<u></u><u=
></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11pt;font-family:=E6=B8=B8=
=E3=82=B4=E3=82=B7=E3=83=83=E3=82=AF" lang=3D"EN-US">Shinji<u></u><u></u></=
span></p>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0mm 0mm"=
>
<p class=3D"MsoNormal"><b><span style=3D"font-size:11pt;font-family:&quot;C=
alibri&quot;,sans-serif" lang=3D"EN-US">From:</span></b><span style=3D"font=
-size:11pt;font-family:&quot;Calibri&quot;,sans-serif" lang=3D"EN-US"> Mart=
a Rybczynska &lt;<a href=3D"mailto:rybczynska@gmail.com" target=3D"_blank">=
rybczynska@gmail.com</a>&gt;
<br>
<b>Sent:</b> Wednesday, July 17, 2024 8:57 PM<br>
<b>To:</b> Matsunaga, Shinji/</span><span style=3D"font-size:11pt">=E6=9D=
=BE=E6=B0=B8</span><span style=3D"font-size:11pt;font-family:&quot;Calibri&=
quot;,sans-serif">
</span><span style=3D"font-size:11pt">=E6=85=8E=E5=8F=B8</span><span style=
=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif" lang=3D"EN-U=
S"> &lt;<a href=3D"mailto:shin.matsunaga@fujitsu.com" target=3D"_blank">shi=
n.matsunaga@fujitsu.com</a>&gt;<br>
<b>Cc:</b> <a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem=
@gmail.com</a>; <a href=3D"mailto:openembedded-devel@lists.openembedded.org=
" target=3D"_blank">openembedded-devel@lists.openembedded.org</a>; Tokumoto=
, Shunsuke/</span><span style=3D"font-size:11pt">=E5=BE=B3=E6=9C=AC</span><=
span style=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif">
</span><span style=3D"font-size:11pt">=E4=BF=8A=E4=BB=8B</span><span style=
=3D"font-size:11pt;font-family:&quot;Calibri&quot;,sans-serif" lang=3D"EN-U=
S"> &lt;<a href=3D"mailto:s-tokumoto@fujitsu.com" target=3D"_blank">s-tokum=
oto@fujitsu.com</a>&gt;<br>
<b>Subject:</b> Re: [oe] [PATCH 2/2] audit: Add linux_audit to CVE_PRODUCT<=
u></u><u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
<div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On Wed, Jul 17, 2024 at 8:39</s=
pan><span style=3D"font-family:&quot;Cambria Math&quot;,serif" lang=3D"EN-U=
S">=E2=80=AF</span><span lang=3D"EN-US">AM Matsunaga-Shinji via
<a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembed=
ded.org</a> &lt;shin.matsunaga=3D<a href=3D"mailto:fujitsu.com@lists.openem=
bedded.org" target=3D"_blank">fujitsu.com@lists.openembedded.org</a>&gt; wr=
ote:<u></u><u></u></span></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0mm 0mm 0mm 6pt;margin-left:4.8pt;margin-right:0mm">
<p class=3D"MsoNormal"><span lang=3D"EN-US">linux_audit is also a valid CVE=
_PRODUCT for audit,<br>
e.g., <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2015-5186" target=3D"=
_blank">https://nvd.nist.gov/vuln/detail/CVE-2015-5186</a>.<br>
<br>
Signed-off-by: Shinji Matsunaga &lt;<a href=3D"mailto:shin.matsunaga@fujits=
u.com" target=3D"_blank">shin.matsunaga@fujitsu.com</a>&gt;<br>
Signed-off-by: Shunsuke Tokumoto &lt;<a href=3D"mailto:s-tokumoto@fujitsu.c=
om" target=3D"_blank">s-tokumoto@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-security/audit/<a href=3D"http://audit_4.0.1.bb" targ=
et=3D"_blank">audit_4.0.1.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-security/audit/<a href=3D"http://audit_4.0.1.b=
b" target=3D"_blank">audit_4.0.1.bb</a> b/meta-oe/recipes-security/audit/<a=
 href=3D"http://audit_4.0.1.bb" target=3D"_blank">audit_4.0.1.bb</a><br>
index bd8f8cc31..0b5857cbf 100644<br>
--- a/meta-oe/recipes-security/audit/<a href=3D"http://audit_4.0.1.bb" targ=
et=3D"_blank">audit_4.0.1.bb</a><br>
+++ b/meta-oe/recipes-security/audit/<a href=3D"http://audit_4.0.1.bb" targ=
et=3D"_blank">audit_4.0.1.bb</a><br>
@@ -102,4 +102,4 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0install -d -m 0700 ${D}${localstatedir}/spool/audit<br>
=C2=A0}<br>
<br>
-CVE_PRODUCT =3D &quot;linux:audit&quot;<br>
+CVE_PRODUCT =3D &quot;linux:audit linux_audit&quot;<u></u><u></u></span></=
p>
</blockquote>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hello,<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I think it will be better to pu=
t linux_audit_project:linux_audit<u></u><u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">What do you think?<u></u><u></u=
></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><u></u>=C2=A0<u></u></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Kind regards,<u></u><u></u></sp=
an></p>
</div>
<div>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Marta<u></u><u></u></span></p>
</div>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--00000000000070a99c061d7ec9bc--

