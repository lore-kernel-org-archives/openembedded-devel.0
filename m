Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252F9CD5BAA
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 11:07:57 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.6798.1725534473964189948
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 04:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=T9zb5mQ5;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374c6187b6eso404357f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725534472; x=1726139272; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhIlsPKlJsgSFQmD1Mt9o+ptc/TuUamqtbWk9o5yfMo=;
        b=T9zb5mQ58x4OjhiWnCGg7MfbpuemVI8+T7oiqeW9qpq60glYQXCwHAlD2eVaLbl96T
         WCrkQf+BQzT96yK64jNvIeeg9vv54lbbgB2teEF1Tw3hUyWXNOYnISsBhSQqqrJD0Aqx
         4/Pg4cbns3OZoSKBr/VuF7o0la1Fdk73laLYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725534472; x=1726139272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhIlsPKlJsgSFQmD1Mt9o+ptc/TuUamqtbWk9o5yfMo=;
        b=PkCzYVoZ4xdPDNIEGqr7t9+w50/l8TAEZLHO1l0e/HqZSysEI0FNg/PmnWEuvepNke
         IoFSX5WrkaGZHGMjkulLM4/gwyKB2SrGhfaboxAeFcR8VlO/VxBflTOb0mS3KsrqbAiq
         LP81/q+mV2JQ4fMkD0KHEh5YcHxl/vV9c4SyoIliMqmXMp6XK8lwZ/YMgd6r0soF2aWg
         Qdem3ZE6QHsSvpe199815eT7TzkSUIJ/nv3vrTz/nIjGRWqty3NSjEi8K2f8YPtay+BU
         Y+51yvGShORrnQm8beSbwOFzuefLz/Ft2OA9S0kfxYCE2ALNHY9nm5ZO1EbUYa/xLgUt
         nTAA==
X-Gm-Message-State: AOJu0YzRFWLNaiSAm4xL1MV5uipE346zfCKYgdLvQS6EJolaVd1s1vTV
	blqDXUAcGCrfoGs08MkSE1Ghx1fKYPWoc40bnl+xe0tUBIt0UlEhyMljA0TelK0/L3IHWmsflMM
	0UMqBaQEGIsyfR3RWYyg6XqEiSXhgET9/oxTuGA==
X-Google-Smtp-Source: AGHT+IGdOQovO1+gvutAFugSrScgAyHGnidaadZTJbfp4D6AfqdUo8xjNV0ot8oiyhW06WujrTavUbWyqn/tkB7A1x8=
X-Received: by 2002:adf:e9c4:0:b0:374:bad0:2b72 with SMTP id
 ffacd0b85a97d-374bad02cdfmr11247948f8f.11.1725534471413; Thu, 05 Sep 2024
 04:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240905093005.2731956-1-yoann.congal@smile.fr> <CANNYZj8WR11Cm+Chio-FeS-tpS3Ydi=MTM1ivVTuNXZ6eXktLw@mail.gmail.com>
In-Reply-To: <CANNYZj8WR11Cm+Chio-FeS-tpS3Ydi=MTM1ivVTuNXZ6eXktLw@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Thu, 5 Sep 2024 13:07:25 +0200
Message-ID: <CAMSfU+6NAhDtNwYgGXibbR7u1cVTE7snm3+2yAunmHYUxAEAtA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] polkit: Switch PAM files to common-*
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003776dc06215d4d2f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 11:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112102

--0000000000003776dc06215d4d2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 5 sept. 2024 =C3=A0 12:16, Alexander Kanavin <alex.kanavin@gmail.co=
m> a
=C3=A9crit :

> Should we rather define =E2=80=98openembedded=E2=80=99 as an option and s=
ubmit that
> upstream?
>
You mean submit the patch in v1 upstream?
https://lists.openembedded.org/g/openembedded-devel/message/112093

Why not! I'll do it, let's see what upstream says.

Thanks!

Alex
>
> On Thu 5. Sep 2024 at 11.30, Yoann Congal via lists.openembedded.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
>
>> From: Yoann Congal <yoann.congal@smile.fr>
>>
>> Polkit meson.build tries to autodetect host OS to change PAM include
>> file to match distro. Force the distro to Suse which happens to match
>> OE-Core libpam configuration.
>>
>> NB: This also may fix a non-reproducibility bug.
>>
>> Fixes: https://github.com/openembedded/meta-openembedded/issues/860
>>
>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
>> ---
>> v1->v2: removed patch and switch to the preexisting "Suse" OS config.
>> ---
>>  meta-oe/recipes-extended/polkit/polkit_125.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb
>> b/meta-oe/recipes-extended/polkit/polkit_125.bb
>> index fe1ee467c3..54a2b3636f 100644
>> --- a/meta-oe/recipes-extended/polkit/polkit_125.bb
>> +++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
>> @@ -16,6 +16,10 @@ inherit meson pkgconfig useradd systemd gettext
>> gobject-introspection features_c
>>
>>  REQUIRED_DISTRO_FEATURES =3D "polkit"
>>
>> +# meson.build try to autodetect host OS to change PAM include file to
>> match distro.
>> +# Force the distro to Suse which happens to match OE-Core libpam
>> configuration.
>> +EXTRA_OEMESON =3D "-Dos_type=3Dsuse"
>> +
>>  PACKAGECONFIG =3D " \
>>         ${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>>         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd',
>> 'consolekit', d)} \
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#112099):
>> https://lists.openembedded.org/g/openembedded-devel/message/112099
>> Mute This Topic: https://lists.openembedded.org/mt/108281789/1686489
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> alex.kanavin@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--0000000000003776dc06215d4d2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0jeu. 5 sept. 2024 =C3=A0=C2=A012:=
16, Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.ka=
navin@gmail.com</a>&gt; a =C3=A9crit=C2=A0:</div><div class=3D"gmail_quote"=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto">Should=
 we rather define =E2=80=98openembedded=E2=80=99 as an option and submit th=
at upstream?</div></blockquote><div>You mean submit the patch in v1 upstrea=
m?</div><div><a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/message/112093">https://lists.openembedded.org/g/openembedded-devel/messag=
e/112093</a></div><div><br></div><div>Why not! I&#39;ll do it, let&#39;s se=
e what upstream says.</div><div><br></div><div>Thanks!</div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"></div><=
div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu 5. Sep 2024 at 11.30, Yoann Congal via <a =
href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedded=
.org</a> &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.o=
rg" target=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">From: Yoann Congal &lt=
;<a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@sm=
ile.fr</a>&gt;<br>
<br>
Polkit meson.build tries to autodetect host OS to change PAM include<br>
file to match distro. Force the distro to Suse which happens to match<br>
OE-Core libpam configuration.<br>
<br>
NB: This also may fix a non-reproducibility bug.<br>
<br>
Fixes: <a href=3D"https://github.com/openembedded/meta-openembedded/issues/=
860" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedded/m=
eta-openembedded/issues/860</a><br>
<br>
Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.fr" ta=
rget=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
---<br>
v1-&gt;v2: removed patch and switch to the preexisting &quot;Suse&quot; OS =
config.<br>
---<br>
=C2=A0meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_125.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.b=
b" rel=3D"noreferrer" target=3D"_blank">polkit_125.bb</a> b/meta-oe/recipes=
-extended/polkit/<a href=3D"http://polkit_125.bb" rel=3D"noreferrer" target=
=3D"_blank">polkit_125.bb</a><br>
index fe1ee467c3..54a2b3636f 100644<br>
--- a/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_125.bb</a><br>
+++ b/meta-oe/recipes-extended/polkit/<a href=3D"http://polkit_125.bb" rel=
=3D"noreferrer" target=3D"_blank">polkit_125.bb</a><br>
@@ -16,6 +16,10 @@ inherit meson pkgconfig useradd systemd gettext gobject-=
introspection features_c<br>
<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;polkit&quot;<br>
<br>
+# meson.build try to autodetect host OS to change PAM include file to matc=
h distro.<br>
+# Force the distro to Suse which happens to match OE-Core libpam configura=
tion.<br>
+EXTRA_OEMESON =3D &quot;-Dos_type=3Dsuse&quot;<br>
+<br>
=C2=A0PACKAGECONFIG =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;pam&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;systemd&#39;, &#39;systemd&#39;, &#39;consolekit&#39;, d)} \<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#112099): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/112099" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/112099</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/108281789/168=
6489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/108281789/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000003776dc06215d4d2f--

