Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC263D2CDE0
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 22:19:20 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56567.1764886753366274818
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Dec 2025 14:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W89iQtX1;
 spf=pass (domain: gmail.com, ip: 209.85.128.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-787df0d729dso15526977b3.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 14:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764886752; x=1765491552; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=meeddWagFinLEquIPI4FdIxJAIqjA76r0H6NxJIWq3o=;
        b=W89iQtX1uypYGb9z4fMhE0enXozA1K8+JjZUVj1AsIqxbI/bahQy7qR1B9TrToxK8F
         i8k9h8w6xC++0RLQblO6FFsDAo5PLggA+Cgfkza774PMpV4ozcrrx5DulZOD7tWWhSeh
         m11aNfysPInlCv5TcRzSuscAv6GbxrOvVuXQMl1ZOBRw/0SWgoPq+DkZP/qmhO27iDqu
         LwFYToXCHew+YccOSUgFFymDmN6qXkjw3ZVs+4lsQx2tbB5/qO5uwBDz1fbbXtrLL/wI
         03cEhQNIL1HGkCaq0GYIQREgUvYaHE0bYONaB1AzViOLD9JoCfrQ8eHk2DuBw6QM/X0G
         UBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764886752; x=1765491552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meeddWagFinLEquIPI4FdIxJAIqjA76r0H6NxJIWq3o=;
        b=jYZy3nNrASxpQ4taBzJXGz6eGUY39eMvT1AiAlmLJB4zQH/wW4ZBGiunOQc7ogH4m0
         v1nONO1TwidwyORPUtfcCJ0Plz/7YBJfXHKDh7F/BDNrZzrTBTLhYATtRECuZLen3WyC
         x6resZL/EgWamBEK/DoB0OrKIE7W6IhxLeyY9zK5+2YDzcP2H2WFEooVzW6y4Zs9nYvm
         +m/S7nGTpjtgYGqspTOGciUIaRsDf5/4QMm+wkqb02Uj2tU2BLnYFu+t6z6VVoj4yLGL
         L+bAAQSgQe9cf/JV7TYO/g77HSAYTbBP47t7bhM2UDh8d86pvsnrPV7nNK1UuXiExEpY
         z63Q==
X-Gm-Message-State: AOJu0Yw+WOPVQteG8AmU47MdZ3IgYvniXXdHmvdlWmECgk9h5L2FI5fA
	VklGvU7PbMF5wfbEnsMBZ7LpDTLExNBe+au/kqYF8isDbA9PE8S/GNcf8ftR3FyvZ4cmYJbfkth
	5C4luqYngU+CGfSRSh2gCkWiwiSN6Bd4=
X-Gm-Gg: ASbGncuHAMcY1luFurbxewYVG4bRmzscgSLZUqX/qL3i4iyrg5a4CiVv/9LZOWhc8DM
	LI7f3XFAYNPo+9DXPBUmpm9x6tNKx4MFolqglAPCrpa9ezjhGYXHACfWNGcoQre9Qf9xDPhy1Zk
	zHaxXt4zQF0OTmdNnfwRWMtKVO3II13DbEk8AryxfBHidROiBbadtdR+nMklgch+EIqMkcalqdR
	PsRq5caZAE9QXgVwsFLb6sA/tg4hc/8Iwc/Y0WsfBzlt7YZip5Wng4YPO30Fw1AwnA0FbAs8AWY
	bCokOtL9eVXdhfIIGEGcej2xmLz+21ljdDdj+synvjntn0EqFqPY7AdNowHsgUPBdTF+2lFVa3o
	j5iaIVboThEQPUlbrpYQfLPIBfJOWalLtYgoTFcbt6/4=
X-Google-Smtp-Source: AGHT+IHZezhczHPeukPhS0NJHZLg4gFXUoUPREXRS3ssX7qjd2jqKTiaS0AMYfxSAt9/cZn1PltPLKJj1SwlXFnWfGI=
X-Received: by 2002:a05:690c:3707:b0:786:6467:23f0 with SMTP id
 00721157ae682-78c0c1e6692mr64301527b3.64.1764886752331; Thu, 04 Dec 2025
 14:19:12 -0800 (PST)
MIME-Version: 1.0
References: <20251204102556.1702492-1-leon.anavi@konsulko.com> <20251204102556.1702492-2-leon.anavi@konsulko.com>
In-Reply-To: <20251204102556.1702492-2-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Dec 2025 14:18:46 -0800
X-Gm-Features: AWmQ_bn-9qDabXXbTf-g-1yRl0dh8VT_vmYqWzVkW_l1wDN7uP8cfSQaR3ZT1aM
Message-ID: <CAMKF1spvg6nB_qZAG17ZbJnn=v-MswWeLTXvz-8Ab-kkqSt=MQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 2/3] python3-autobahn: Upgrade 24.4.2 -> 25.11.1
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f10a94064527b792"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 22:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122331

--000000000000f10a94064527b792
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing

stdio: WARNING: python3-autobahn-25.11.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with setuptools.build_meta, use
the correct class [pep517-backend]

While at it, Would you address this as well please?

On Thu, Dec 4, 2025 at 2:26=E2=80=AFAM Leon Anavi via lists.openembedded.or=
g
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 25.11.1:
>
> - WAMP Flatbuffers serialization test coverage; WAMP message
>   classes refactoring
> - Add WAMP serdes functional and benchmark testing;
>   WAMP-Flatbuffers; WAMP Serializer Composition (transport/payload)
> - Add vendored Flatbuffers
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-autobahn_24.4.2.bb =3D> python3-autobahn_25.11.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-autobahn_24.4.2.bb
> =3D> python3-autobahn_25.11.1.bb} (84%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-autobahn_24.4.2.bb b/meta-python/recipes-devtools/python/
> python3-autobahn_25.11.1.bb
> similarity index 84%
> rename from meta-python/recipes-devtools/python/python3-autobahn_24.4.2.b=
b
> rename to meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
> index d785a76cc7..69613313d7 100644
> --- a/meta-python/recipes-devtools/python/python3-autobahn_24.4.2.bb
> +++ b/meta-python/recipes-devtools/python/python3-autobahn_25.11.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://crossbar.io/autobahn"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D588502cb4ffc65da2b26780d6baa5=
a40"
>
> -SRC_URI[sha256sum] =3D
> "a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9"
> +SRC_URI[sha256sum] =3D
> "52e62b9cc80c3e989b182952a60fd25c9a69afb00854a925a2b185f7b1f73cf1"
>
>  inherit pypi setuptools3
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122316):
> https://lists.openembedded.org/g/openembedded-devel/message/122316
> Mute This Topic: https://lists.openembedded.org/mt/116609979/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f10a94064527b792
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am seeing<div><br></div><div>stdio: WARNING: python3-aut=
obahn-25.11.1-r0 do_check_backend: QA Issue: inherits setuptools3 but has p=
yproject.toml with setuptools.build_meta, use the correct class [pep517-bac=
kend]<br></div><div><br></div><div>While at it, Would you address this as w=
ell please?</div></div><br><div class=3D"gmail_quote gmail_quote_container"=
><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 4, 2025 at 2:26=E2=80=AF=
AM Leon Anavi via <a href=3D"http://lists.openembedded.org">lists.openembed=
ded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembed=
ded.org">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Upgrade to release 25.11.1:<br>
<br>
- WAMP Flatbuffers serialization test coverage; WAMP message<br>
=C2=A0 classes refactoring<br>
- Add WAMP serdes functional and benchmark testing;<br>
=C2=A0 WAMP-Flatbuffers; WAMP Serializer Composition (transport/payload)<br=
>
- Add vendored Flatbuffers<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-autobahn_24.4.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">python3-autobahn_24.4.2.bb</a> =3D&gt; <a href=3D"http:/=
/python3-autobahn_25.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
autobahn_25.11.1.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-autobahn_24.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobahn_=
24.4.2.bb</a> =3D&gt; <a href=3D"http://python3-autobahn_25.11.1.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-autobahn_25.11.1.bb</a>} (84%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
autobahn_24.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobahn_2=
4.4.2.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python=
3-autobahn_25.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobah=
n_25.11.1.bb</a><br>
similarity index 84%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-a=
utobahn_24.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobahn_24=
.4.2.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-aut=
obahn_25.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobahn_25.=
11.1.bb</a><br>
index d785a76cc7..69613313d7 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-autobah=
n_24.4.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobahn_24.4.2.b=
b</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-autobah=
n_25.11.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-autobahn_25.11.1=
.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"http://crossbar.io/autobahn" =
rel=3D"noreferrer" target=3D"_blank">http://crossbar.io/autobahn</a>&quot;<=
br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D588502cb4ffc65da2b267=
80d6baa5a40&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2=
ea7d823796642ee92c9&quot;<br>
+SRC_URI[sha256sum] =3D &quot;52e62b9cc80c3e989b182952a60fd25c9a69afb00854a=
925a2b185f7b1f73cf1&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122316): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122316" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122316</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116609979/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116609979/1997914</a><br>
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

--000000000000f10a94064527b792--

