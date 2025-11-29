Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B9CCFD376
	for <webhook@archiver.kernel.org>; Sat, 29 Nov 2025 03:34:03 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8922.1764387234894850989
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 19:33:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JPU/+ohq;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-640c857ce02so2213247d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 19:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764387234; x=1764992034; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NL3VBm/fkbbOtqU4zMDW/h4SKUXnbHNenGoTvRTPj+A=;
        b=JPU/+ohq65CAVgTLhZd+u8sh3jIYlIdWWwrEWMYkGv7UzcZ3Quqwdzh/7T78QpinQm
         EO6nnvNBz5LiPqQEHMFFm+g9juRaMXiPiJeHVS6Maf2ieCK2wLYB0FQSk/ThWkKbn1OH
         eqgXM8gSTGFsQptuUiWEzVwrUzQ0AkkPitv81LGZxof+hlq4WEBm8KPGjvujutocMzCl
         fwExL7Ueos3DSyBa7cxTeeYSCODjR84BCd9/rtPj/P6NKO15seJota6T04gQXqL1cMAw
         J9shWtpXxFhnoxy2e1qvRoUDDZjdTBVE6vqY1t8woaIiPc+acuZdDtBsWPRtD+EFAHqs
         0FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764387234; x=1764992034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NL3VBm/fkbbOtqU4zMDW/h4SKUXnbHNenGoTvRTPj+A=;
        b=nt7ICwFM9eyR25r60Gc34wbKuAQM1uAIXeHEVq1Ak8Z4z30S3iqYo67RaQTWMtr+7H
         VkEHgFsTwnh9VpON14XxqvinlNdRj5oZi30l/1lFuV5PRGB6sc/0UWgIB0VBz+TCIrGf
         cRjVLT6QM2jYnS/nNJnXahJUV5QJdI9mMUuVk9eDg6Hyol33Bvi6IY7OrD4SlTqkAiNk
         IULBCF4f9GUo2bt71Pubj51Wbew13t7ak9bQV8sJQB79XM2YaozQ04/D74gXc7ThafTq
         Sb0Gvca10UREXjx9/2RsQFplgTsJjXKydumQbIFqD7IORBiKZdPXoEKSh1srr+FtDCqp
         nGnw==
X-Gm-Message-State: AOJu0YxovLBNZoGRG2P87kjJ/hSo8PIa1PzPBV2FfAJFWtnaTwV77ncy
	fpb5aAfUag+rDPInVU+IcHvMKKSD5O3AJiviErJBdd4itulWQLS5sTA90/TmbLGiPVxZy+3i+rV
	98fCcHLQ/zCRxPfxAQQtczeWspv9LVUc=
X-Gm-Gg: ASbGncutFvAzOn764iqksHJb7slVnLEfHMU3of/F916L/2wB/IDUiNh10ZHT3R7tuqD
	CzOL0cKsVKldpKh5X5wIfHolu5XY13WAWZlAhsA8HbTXsj48PSFFmp4memdGu67DeNZc7lnp5nS
	B/UId16a2EjZfllF3yILe1100nfp1Zy04mYbeRhjJAloTOwvV+2FX/eChM5aZ/2/4W/QJYmEajX
	4as1mq75obxKE+7c76lvoTbCDmMpE4zRnqXegI2GTfVV3ysVU011jZwifDc2fo4l1tdLklPG04l
	HULqOPbIyg1LGmtc+EXpHezwEpUxHmtwfu3mWdoNVz7VxXkpvPwE8Q9Np5plEzoxEluCStpfYY2
	L/yxBjK6ir7ReWIllWPNpTPIX2RvJ7ekyhquu6A==
X-Google-Smtp-Source: AGHT+IHv0bGxSqE0M/L9HQ7G11TiKv8l1fyan0dSiGETL5ciUSjihnMCthFHazcl5bwZtZGxIQFiqRm1s5bXWfpRoxA=
X-Received: by 2002:a05:690c:6c0e:b0:788:1cde:cad4 with SMTP id
 00721157ae682-78a8b4720c1mr252898667b3.19.1764387233958; Fri, 28 Nov 2025
 19:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20251128195553.1313662-1-alperyasinak1@gmail.com>
In-Reply-To: <20251128195553.1313662-1-alperyasinak1@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Nov 2025 19:33:26 -0800
X-Gm-Features: AWmQ_bkfy8YJFuftuUtExeOtbs1TB0E4mPr00MGLM1GllRDqLuWf9h_yThNcsEI
Message-ID: <CAMKF1sqprs8CH6=G1KuWh4Ohw39zdDeVZF+WY9itEi2BgpRSSQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-wxgtk4: Switch to PEP-517 build backend
To: alperyasinak1@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000538f5a0644b36a40"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Nov 2025 03:34:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122156

--000000000000538f5a0644b36a40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this fails

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4346488/raw_inlin=
e

On Fri, Nov 28, 2025 at 11:56=E2=80=AFAM Alper Ak via lists.openembedded.or=
g
<alperyasinak1=3Dgmail.com@lists.openembedded.org> wrote:

> The project has a proper pyproject.toml which declares the
> setuptools.build.meta PEP-517 backend.
>
> Fix:
>
> WARNING: python3-wxgtk4-4.2.4-r0 do_check_backend: QA Issue: inherits
> setuptools3 but has pyproject.toml with setuptools.build_meta, use the
> correct class [pep517-backend]
>
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  .../recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/
> python3-wxgtk4_4.2.4.bb b/meta-python/recipes-devtools/python3-wxgtk4/
> python3-wxgtk4_4.2.4.bb
> index 2899f6909e..81bf69f468 100644
> --- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
> @@ -18,7 +18,7 @@ SRC_URI +=3D "file://add-back-option-build-base.patch \
>             "
>  SRC_URI[sha256sum] =3D
> "2eb123979c87bcb329e8a2452269d60ff8f9f651e9bf25c67579e53c4ebbae3c"
>
> -inherit pypi setuptools3 cython pkgconfig features_check
> +inherit pypi python_setuptools_build_meta cython pkgconfig features_chec=
k
>
>  S =3D "${UNPACKDIR}/wxPython-${PV}"
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122126):
> https://lists.openembedded.org/g/openembedded-devel/message/122126
> Mute This Topic: https://lists.openembedded.org/mt/116518159/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000538f5a0644b36a40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this fails<div><br></div><div><a href=3D"https://autobuild=
er.yoctoproject.org/valkyrie/api/v2/logs/4346488/raw_inline">https://autobu=
ilder.yoctoproject.org/valkyrie/api/v2/logs/4346488/raw_inline</a></div></d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri, Nov 28, 2025 at 11:56=E2=80=AFAM Alper Ak via <a=
 href=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;alpe=
ryasinak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@l=
ists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">The project has a proper pyproject.toml which declares=
 the setuptools.build.meta PEP-517 backend.<br>
<br>
Fix:<br>
<br>
WARNING: python3-wxgtk4-4.2.4-r0 do_check_backend: QA Issue: inherits setup=
tools3 but has pyproject.toml with setuptools.build_meta, use the correct c=
lass [pep517-backend]<br>
<br>
Signed-off-by: Alper Ak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targ=
et=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-devtools/python3-wxgtk4/<a href=3D"http://python3-wxgtk4_=
4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-wxgtk4_4.2.4.bb</a>=
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-python/recipes-devtools/python3-wxgtk4/<a href=3D"http://=
python3-wxgtk4_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-wxgtk=
4_4.2.4.bb</a> b/meta-python/recipes-devtools/python3-wxgtk4/<a href=3D"htt=
p://python3-wxgtk4_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-w=
xgtk4_4.2.4.bb</a><br>
index 2899f6909e..81bf69f468 100644<br>
--- a/meta-python/recipes-devtools/python3-wxgtk4/<a href=3D"http://python3=
-wxgtk4_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-wxgtk4_4.2.4=
.bb</a><br>
+++ b/meta-python/recipes-devtools/python3-wxgtk4/<a href=3D"http://python3=
-wxgtk4_4.2.4.bb" rel=3D"noreferrer" target=3D"_blank">python3-wxgtk4_4.2.4=
.bb</a><br>
@@ -18,7 +18,7 @@ SRC_URI +=3D &quot;file://add-back-option-build-base.patc=
h \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;2eb123979c87bcb329e8a2452269d60ff8f9f651=
e9bf25c67579e53c4ebbae3c&quot;<br>
<br>
-inherit pypi setuptools3 cython pkgconfig features_check<br>
+inherit pypi python_setuptools_build_meta cython pkgconfig features_check<=
br>
<br>
=C2=A0S =3D &quot;${UNPACKDIR}/wxPython-${PV}&quot;<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122126): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122126" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122126</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116518159/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116518159/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000538f5a0644b36a40--

