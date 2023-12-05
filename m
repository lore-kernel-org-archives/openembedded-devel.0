Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2D7EC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 02:09:15 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.89692.1701742149223819006
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 18:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=h0Hv904g;
 spf=pass (domain: mvista.com, ip: 209.85.167.44, mailfrom: vanusuri@mvista.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50be10acaf9so3112170e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 18:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1701742147; x=1702346947; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9mzq/Uqi4qhaKMYa3konqWiyy/iF9Xtm3H6im+WapGw=;
        b=h0Hv904gyJehAV3i+OzpmB2hx3MqKq99NtXBdzlPUww3oXAFAd2LKkeyn7i/euzwP9
         yOBbt6BsR8JgJ8MbdbbKNigsGEAMevv4CuAI7rxjkvTFAxvoAc6aurDwx0uOMdm/RzY8
         lKeiNUrVhf7O0lPJVSkNW+MSwvWUW5HOQndyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701742147; x=1702346947;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mzq/Uqi4qhaKMYa3konqWiyy/iF9Xtm3H6im+WapGw=;
        b=ty154TRO1W1yMP9XLFtFIncqjZhfjWKYReKLaFfujVd+pN4r4omHUlp5E4rsvBGTgF
         2zzJQgWisvQ2Shm+kR/qKw2hMsOiIkokOvko5ORTb+dRzc8LB8akIG+qar79WzS4ncOl
         EzYJAz5tW44kCYoG4lupW/b+gP6H/XwytL05WvIyTfQML78DdwPWtdeTbBCnmNi2n2aq
         Kjghue4tAr/Xb8pTbZUqvGmDpyjHPtdiSpqUQTAsDUM0BqxLsCMGKPOhqRzzochIlM0C
         mtO2toyW8LsPUoDwh5ywmN2WSa0fioI57+3b4U07to718EQqj57wBFZ6jR17dFKv1HR9
         ZcTA==
X-Gm-Message-State: AOJu0YxGMAEgZbuqcePLgRINKLJaYAJUZuj9eUKIp3Q4OY1G4QfSf6RD
	QONDrUIJUSrUKjqp5mqfSrjbnVjsVi40Cgem1KHutPw2LOzGuauFJQc=
X-Google-Smtp-Source: AGHT+IERG7PM0hY1I7jmXgPjW31pAtOqn69exZ7rUKSO5adFrhuQ5oJ9HSXj2iz5wITYT6SGrSPjRZJkfMF6fnKzQY8=
X-Received: by 2002:a05:6512:3e27:b0:50b:c0f1:f532 with SMTP id
 i39-20020a0565123e2700b0050bc0f1f532mr512136lfv.26.1701742146917; Mon, 04 Dec
 2023 18:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20231121040405.25042-1-vanusuri@mvista.com>
In-Reply-To: <20231121040405.25042-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 5 Dec 2023 07:38:55 +0530
Message-ID: <CANQUz19nTnaVSgVCg_j5aQOHk+ZQtYrkc3d5zfvGuhx_0QMA5g@mail.gmail.com>
Subject: Re: [oe][meta-networking][dunfell][PATCH] traceroute: upgrade 2.1.0
 -> 2.1.3
To: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002aade2060bb9b8c8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 02:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107220

--0000000000002aade2060bb9b8c8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Any update for this patch?

Thanks & Regards,
Vijay

On Tue, Nov 21, 2023 at 9:34=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> This upgrade incorporates the CVE-2023-46316 fix and other bug fixes.
>
> Changelog:
> ----------
> - Interpret ipv4-mapped ipv6 addresses (::ffff:A.B.C.D) as true ipv4.
> - Return back more robast poll(2) loop handling.
> - Fix unprivileged ICMP tracerouting with Linux kernel >=3D 6.1 (Eric
> Dumazet, SF bug #14)
> - Fix command line parsing in wrappers.
>
> References:
> https://security-tracker.debian.org/tracker/CVE-2023-46316
>
> https://sourceforge.net/projects/traceroute/files/traceroute/traceroute-2=
.1.3/
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../traceroute/{traceroute_2.1.0.bb =3D> traceroute_2.1.3.bb}    | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>  rename meta-networking/recipes-support/traceroute/{traceroute_2.1.0.bb
> =3D> traceroute_2.1.3.bb} (92%)
>
> diff --git a/meta-networking/recipes-support/traceroute/
> traceroute_2.1.0.bb b/meta-networking/recipes-support/traceroute/
> traceroute_2.1.3.bb
> similarity index 92%
> rename from meta-networking/recipes-support/traceroute/traceroute_2.1.0.b=
b
> rename to meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
> index 19bbf03f1..c1ad203bc 100644
> --- a/meta-networking/recipes-support/traceroute/traceroute_2.1.0.bb
> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.1.3.bb
> @@ -19,8 +19,7 @@ SRC_URI =3D
> "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
>             file://filter-out-the-patches-from-subdirs.patch \
>  "
>
> -SRC_URI[md5sum] =3D "84d329d67abc3fb83fc8cb12aeaddaba"
> -SRC_URI[sha256sum] =3D
> "3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f2d20d7472e5d81603b6"
> +SRC_URI[sha256sum] =3D
> "05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce8b5d64806459a7e0412"
>
>  EXTRA_OEMAKE =3D "VPATH=3D${STAGING_LIBDIR}"
>
> --
> 2.25.1
>
>

--0000000000002aade2060bb9b8c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Armin,</div><div><br></div><div><span class=3D"gma=
il-im">Any <span class=3D"gmail-il">update</span> for this patch?<br><br></=
span></div><div><span class=3D"gmail-im">Thanks &amp; Regards,</span></div>=
<div><span class=3D"gmail-im">Vijay<br></span></div></div><br><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 21, 2023 at=
 9:34=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blan=
k">vanusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mv=
ista.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
This upgrade incorporates the CVE-2023-46316 fix and other bug fixes.<br>
<br>
Changelog:<br>
----------<br>
- Interpret ipv4-mapped ipv6 addresses (::ffff:A.B.C.D) as true ipv4.<br>
- Return back more robast poll(2) loop handling.<br>
- Fix unprivileged ICMP tracerouting with Linux kernel &gt;=3D 6.1 (Eric Du=
mazet, SF bug #14)<br>
- Fix command line parsing in wrappers.<br>
<br>
References:<br>
<a href=3D"https://security-tracker.debian.org/tracker/CVE-2023-46316" rel=
=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/track=
er/CVE-2023-46316</a><br>
<a href=3D"https://sourceforge.net/projects/traceroute/files/traceroute/tra=
ceroute-2.1.3/" rel=3D"noreferrer" target=3D"_blank">https://sourceforge.ne=
t/projects/traceroute/files/traceroute/traceroute-2.1.3/</a><br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../traceroute/{<a href=3D"http://traceroute_2.1.0.bb" rel=3D"norefer=
rer" target=3D"_blank">traceroute_2.1.0.bb</a> =3D&gt; <a href=3D"http://tr=
aceroute_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">traceroute_2.1.3.bb=
</a>}=C2=A0 =C2=A0 | 3 +--<br>
=C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
=C2=A0rename meta-networking/recipes-support/traceroute/{<a href=3D"http://=
traceroute_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">traceroute_2.1.0.=
bb</a> =3D&gt; <a href=3D"http://traceroute_2.1.3.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">traceroute_2.1.3.bb</a>} (92%)<br>
<br>
diff --git a/meta-networking/recipes-support/traceroute/<a href=3D"http://t=
raceroute_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">traceroute_2.1.0.b=
b</a> b/meta-networking/recipes-support/traceroute/<a href=3D"http://tracer=
oute_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">traceroute_2.1.3.bb</a>=
<br>
similarity index 92%<br>
rename from meta-networking/recipes-support/traceroute/<a href=3D"http://tr=
aceroute_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">traceroute_2.1.0.bb=
</a><br>
rename to meta-networking/recipes-support/traceroute/<a href=3D"http://trac=
eroute_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">traceroute_2.1.3.bb</=
a><br>
index 19bbf03f1..c1ad203bc 100644<br>
--- a/meta-networking/recipes-support/traceroute/<a href=3D"http://tracerou=
te_2.1.0.bb" rel=3D"noreferrer" target=3D"_blank">traceroute_2.1.0.bb</a><b=
r>
+++ b/meta-networking/recipes-support/traceroute/<a href=3D"http://tracerou=
te_2.1.3.bb" rel=3D"noreferrer" target=3D"_blank">traceroute_2.1.3.bb</a><b=
r>
@@ -19,8 +19,7 @@ SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/traceroute/tracer=
oute/${BP}/${BP}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://filter-out-the-patches-fro=
m-subdirs.patch \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;84d329d67abc3fb83fc8cb12aeaddaba&quot;<br>
-SRC_URI[sha256sum] =3D &quot;3669d22a34d3f38ed50caba18cd525ba55c5c00d5465f=
2d20d7472e5d81603b6&quot;<br>
+SRC_URI[sha256sum] =3D &quot;05ebc7aba28a9100f9bbae54ceecbf75c82ccf46bdfce=
8b5d64806459a7e0412&quot;<br>
<br>
=C2=A0EXTRA_OEMAKE =3D &quot;VPATH=3D${STAGING_LIBDIR}&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000002aade2060bb9b8c8--

