Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AC2C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 13:48:12 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.6366.1659448089619490557
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:48:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eu0hAmuM;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id e15so11984889lfs.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Aug 2022 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Q1en7rHHOnMIzO3UCFLta/g56YLOn3MVSU3D/kMISCY=;
        b=Eu0hAmuMPYCUoI7RbHORlL4P97jSR2bBYK9H2UFrtLFV8qdeITRIZcdgu/ys8N3AF7
         ONQh+f0dO3Q/qfLZckSUkHXTl8OQyryopTp07Jweu9ygt/RseW7ZmGAGNSP4JM3/FfLN
         feC6rpapoY76YspunaaLcg0SHB76zOlOZT9NckdUtYRupYuQ2erDxQOM4mIjRy2SJeW0
         bXQ3rSLVQU8c0HvI2rMwsZmCK4jOgIhX2MT9Aosasv1g+cwnahjgwF+WQEeg+mleJ20E
         wfLTF1ccxft4uO0RAmtnrXANSJoePwrVkaP8p2bfud0uaAt40OKmJCS4eN2aVQPSfV7m
         LAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Q1en7rHHOnMIzO3UCFLta/g56YLOn3MVSU3D/kMISCY=;
        b=MCNdyzEyOAwExlz/LUwDsG9lnGUCIPFjSaQbHi/99V3BqaYfQYnAdKKeyDDPNqsiF7
         wHBb381v3wj7Dr9HmcHoziNB+dZiixz3VbPxzVp7v5SrBOscHZH7z5jAqLf4+0gJEJjc
         fmZz2sPXvWiWP+wuqtYQtvz6CiwGyAMB9BMqiTlU8cJFek2kMvK1I4+nadlExFmNfLCc
         7f+adMqSeIDQoocIw2DaK6a5vNaiFsk+2dteIruF0afxbukvYq/LR0+qnhoROr4xA9jY
         Fk9QVPmpRJs4AFrgI5m0SyvD9QNLXJ5qUCfdBm8INIlb2LWXlHIryqhDAS9FV82t0WG4
         DFWg==
X-Gm-Message-State: ACgBeo0uzRkMPw1732czUFWKJpOe/l2WDOggieqXGs8vQbu5nZjVix89
	iqo886rrjJ2Y4V3mHbWuflSmGRVi9enJhSO71b0=
X-Google-Smtp-Source: 
 AA6agR6SVYMwT79ouK5AgiyFmpXGujgOBZb/6bBFeBDUCkkejXic9vJcc3X6BVSzR1GlIc40S8lRLUt1baEBtVi0ZJ4=
X-Received: by 2002:a05:6512:3ba9:b0:48a:e66b:77c3 with SMTP id
 g41-20020a0565123ba900b0048ae66b77c3mr6103572lfv.204.1659448087815; Tue, 02
 Aug 2022 06:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220802132727.1505-1-sam.van.den.berge@gmail.com>
In-Reply-To: <20220802132727.1505-1-sam.van.den.berge@gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 2 Aug 2022 14:47:56 +0100
Message-ID: 
 <CANPvuRnhrbiv9QuOQRiVbO1iynRLiFhprsAWf381YwiMh0T_=g@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-jsonrpcserver: add patch to use
 importlib.resources instead of pkg_resources
To: Sam Van Den Berge <sam.van.den.berge@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cc2aab05e5425ddb"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Aug 2022 13:48:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98099

--000000000000cc2aab05e5425ddb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

Sam Van Den Berge <sam.van.den.berge@gmail.com> escreveu no dia ter=C3=A7a,
2/08/2022 =C3=A0(s) 14:27:

> From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
>
> Currently jsonrpcserver has a runtime dependency to setuptools because
> it uses pkg_resources. Setuptools however is not listed in the RDEPENDS
> of python3-jsonrpcserver. We could add setuptools to RDEPENDS but since
> pkg_resources is discouraged anyway [1], I posted a patch upstream to
> replace pkg_resources by importlib.resources.
>
> Until the upstream patch is accepted and released, add it here as a
> patch so python3-jsonrpcserver is usable without the setuptools
> dependency.
>
> Upstream-Status: Submitted [
> https://github.com/explodinglabs/jsonrpcserver/pull/235]


Thanks for the patch but the Upstream-Status is placed on the commit of the
attached patch
and not here.



Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> ---
>  ...b.resources-instead-of-pkg_resources.patch | 44 +++++++++++++++++++
>  .../python/python3-jsonrpcserver_%.bbappend   |  5 +++
>  2 files changed, 49 insertions(+)
>  create mode 100644
> recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resource=
s-instead-of-pkg_resources.patch
>  create mode 100644
> recipes-devtools/python/python3-jsonrpcserver_%.bbappend
>
> diff --git
> a/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resour=
ces-instead-of-pkg_resources.patch
> b/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resour=
ces-instead-of-pkg_resources.patch
> new file mode 100644
> index 0000000..2d1a8c9
> --- /dev/null
> +++
> b/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.resour=
ces-instead-of-pkg_resources.patch
> @@ -0,0 +1,44 @@
> +From 4220c6a02bc03ff8c6cc4b3bee168a1351a3ce39 Mon Sep 17 00:00:00 2001
> +From: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> +Date: Fri, 29 Jul 2022 15:53:37 +0200
> +Subject: [PATCH] Use importlib.resources instead of pkg_resources
> +
> +From the setuptools website [1]:
> +
> +Use of pkg_resources is discouraged in favor of importlib.resources,
> +importlib.metadata, and their backports (importlib_resources,
> +importlib_metadata). Please consider using those libraries instead of
> +pkg_resources.
> +
> +[1]: https://setuptools.pypa.io/en/latest/pkg_resources.html
> +
>

Upstream-Status: Submitted [
https://github.com/explodinglabs/jsonrpcserver/pull/235]

So it goes here ^

Jose

+Signed-off-by: Sam Van Den Berge <sam.van.den.berge@gmail.com>
> +---
> + jsonrpcserver/main.py | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/jsonrpcserver/main.py b/jsonrpcserver/main.py
> +index 0397a58..ac1855f 100644
> +--- a/jsonrpcserver/main.py
> ++++ b/jsonrpcserver/main.py
> +@@ -13,7 +13,7 @@ from typing import Any, Callable, Dict, List, Optional=
,
> Union, cast
> + import json
> +
> + from jsonschema.validators import validator_for  # type: ignore
> +-from pkg_resources import resource_string
> ++import importlib.resources
> +
> + from .dispatcher import dispatch_to_response_pure, Deserialized
> + from .methods import Methods, global_methods
> +@@ -26,7 +26,7 @@ default_deserializer =3D json.loads
> +
> + # Prepare the jsonschema validator. This is global so it loads only
> once, not every
> + # time dispatch is called.
> +-schema =3D json.loads(resource_string(__name__, "request-schema.json"))
> ++schema =3D json.loads(importlib.resources.read_text(__package__,
> "request-schema.json"))
> + klass =3D validator_for(schema)
> + klass.check_schema(schema)
> + default_validator =3D klass(schema).validate
> +--
> +2.34.1
> +
> diff --git a/recipes-devtools/python/python3-jsonrpcserver_%.bbappend
> b/recipes-devtools/python/python3-jsonrpcserver_%.bbappend
> new file mode 100644
> index 0000000..23cdf07
> --- /dev/null
> +++ b/recipes-devtools/python/python3-jsonrpcserver_%.bbappend
> @@ -0,0 +1,5 @@
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI =3D "\
> +
> file://0001-Use-importlib.resources-instead-of-pkg_resources.patch \
> +"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98082):
> https://lists.openembedded.org/g/openembedded-devel/message/98082
> Mute This Topic: https://lists.openembedded.org/mt/92769960/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cc2aab05e5425ddb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Sam,</div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Sam Van Den Berge &lt;<a href=3D"mailto:sam.v=
an.den.berge@gmail.com">sam.van.den.berge@gmail.com</a>&gt; escreveu no dia=
 ter=C3=A7a, 2/08/2022 =C3=A0(s) 14:27:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">From: Sam Van Den Berge &lt;<a href=3D"mailto:sam.v=
an.den.berge@gmail.com" target=3D"_blank">sam.van.den.berge@gmail.com</a>&g=
t;<br>
<br>
Currently jsonrpcserver has a runtime dependency to setuptools because<br>
it uses pkg_resources. Setuptools however is not listed in the RDEPENDS<br>
of python3-jsonrpcserver. We could add setuptools to RDEPENDS but since<br>
pkg_resources is discouraged anyway [1], I posted a patch upstream to<br>
replace pkg_resources by importlib.resources.<br>
<br>
Until the upstream patch is accepted and released, add it here as a<br>
patch so python3-jsonrpcserver is usable without the setuptools<br>
dependency.<br>
<br>
Upstream-Status: Submitted [<a href=3D"https://github.com/explodinglabs/jso=
nrpcserver/pull/235" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/explodinglabs/jsonrpcserver/pull/235</a>]</blockquote><div><br>Thanks=C2=
=A0for the patch but the Upstream-Status is placed on the commit of the att=
ached patch</div><div>and not here.<br><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Signed-off-by: Sam Van Den Berge &lt;<a href=3D"mailto:sam.van.den.berge@gm=
ail.com" target=3D"_blank">sam.van.den.berge@gmail.com</a>&gt;<br>
---<br>
=C2=A0...b.resources-instead-of-pkg_resources.patch | 44 ++++++++++++++++++=
+<br>
=C2=A0.../python/python3-jsonrpcserver_%.bbappend=C2=A0 =C2=A0|=C2=A0 5 +++=
<br>
=C2=A02 files changed, 49 insertions(+)<br>
=C2=A0create mode 100644 recipes-devtools/python/python3-jsonrpcserver/0001=
-Use-importlib.resources-instead-of-pkg_resources.patch<br>
=C2=A0create mode 100644 recipes-devtools/python/python3-jsonrpcserver_%.bb=
append<br>
<br>
diff --git a/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importl=
ib.resources-instead-of-pkg_resources.patch b/recipes-devtools/python/pytho=
n3-jsonrpcserver/0001-Use-importlib.resources-instead-of-pkg_resources.patc=
h<br>
new file mode 100644<br>
index 0000000..2d1a8c9<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/python3-jsonrpcserver/0001-Use-importlib.reso=
urces-instead-of-pkg_resources.patch<br>
@@ -0,0 +1,44 @@<br>
+From 4220c6a02bc03ff8c6cc4b3bee168a1351a3ce39 Mon Sep 17 00:00:00 2001<br>
+From: Sam Van Den Berge &lt;<a href=3D"mailto:sam.van.den.berge@gmail.com"=
 target=3D"_blank">sam.van.den.berge@gmail.com</a>&gt;<br>
+Date: Fri, 29 Jul 2022 15:53:37 +0200<br>
+Subject: [PATCH] Use importlib.resources instead of pkg_resources<br>
+<br>
+From the setuptools website [1]:<br>
+<br>
+Use of pkg_resources is discouraged in favor of importlib.resources,<br>
+importlib.metadata, and their backports (importlib_resources,<br>
+importlib_metadata). Please consider using those libraries instead of<br>
+pkg_resources.<br>
+<br>
+[1]: <a href=3D"https://setuptools.pypa.io/en/latest/pkg_resources.html" r=
el=3D"noreferrer" target=3D"_blank">https://setuptools.pypa.io/en/latest/pk=
g_resources.html</a><br>
+<br></blockquote><div><br></div><div>Upstream-Status: Submitted [<a href=
=3D"https://github.com/explodinglabs/jsonrpcserver/pull/235" rel=3D"norefer=
rer" target=3D"_blank">https://github.com/explodinglabs/jsonrpcserver/pull/=
235</a>]<br></div><div><br></div><div>So it goes here ^<br><br>Jose<br><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+Signed-off-by: Sam Van Den Berge &lt;<a href=3D"mailto:sam.van.den.berge@g=
mail.com" target=3D"_blank">sam.van.den.berge@gmail.com</a>&gt;<br>
+---<br>
+ jsonrpcserver/main.py | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/jsonrpcserver/main.py b/jsonrpcserver/main.py<br>
+index 0397a58..ac1855f 100644<br>
+--- a/jsonrpcserver/main.py<br>
++++ b/jsonrpcserver/main.py<br>
+@@ -13,7 +13,7 @@ from typing import Any, Callable, Dict, List, Optional, =
Union, cast<br>
+ import json<br>
+ <br>
+ from jsonschema.validators import validator_for=C2=A0 # type: ignore<br>
+-from pkg_resources import resource_string<br>
++import importlib.resources<br>
+ <br>
+ from .dispatcher import dispatch_to_response_pure, Deserialized<br>
+ from .methods import Methods, global_methods<br>
+@@ -26,7 +26,7 @@ default_deserializer =3D json.loads<br>
+ <br>
+ # Prepare the jsonschema validator. This is global so it loads only once,=
 not every<br>
+ # time dispatch is called.<br>
+-schema =3D json.loads(resource_string(__name__, &quot;request-schema.json=
&quot;))<br>
++schema =3D json.loads(importlib.resources.read_text(__package__, &quot;re=
quest-schema.json&quot;))<br>
+ klass =3D validator_for(schema)<br>
+ klass.check_schema(schema)<br>
+ default_validator =3D klass(schema).validate<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/recipes-devtools/python/python3-jsonrpcserver_%.bbappend b/rec=
ipes-devtools/python/python3-jsonrpcserver_%.bbappend<br>
new file mode 100644<br>
index 0000000..23cdf07<br>
--- /dev/null<br>
+++ b/recipes-devtools/python/python3-jsonrpcserver_%.bbappend<br>
@@ -0,0 +1,5 @@<br>
+FILESEXTRAPATHS:prepend :=3D &quot;${THISDIR}/${PN}:&quot;<br>
+<br>
+SRC_URI =3D &quot;\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Use-importlib.resources-instead-of=
-pkg_resources.patch \<br>
+&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98082): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98082" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98082</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/92769960/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/92769960/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000cc2aab05e5425ddb--

