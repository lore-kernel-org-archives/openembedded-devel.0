Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C58C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 22:34:32 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.1270.1709937268046642053
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 14:34:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ldiFVUkv;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso2525962276.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 14:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709937267; x=1710542067; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lIH2iMnE8dw1ulrxWng3iUt5DsBzjBpjYjFG3/fg5Bs=;
        b=ldiFVUkvib8z9y5Fz6WKxV3EhfgoIMQqyXX/XD0ksYDKRAxyZw52bKTzLZc9YzgRIy
         g+f3x+pkgSu+pdUMuUlDBPn4tdfJomdXM44qKjtdnbGuaNg1z7f0zOvdCQkbFGwbZSww
         0P+rD10lNDS5xuCPk+Iylt4UgahqNGDAFSUhiOP4LL/BvbZUeKAN3s+LEw9rEkHd9E7Z
         rToZCqmS8Hc4HQTd5xW4tC6cSjgYwrItkICVcjH/msLTYrAgvGxOS2Fem53TcDh/HFbU
         l2zM1KLPIIYJR/Ry1bycqGuYGl8CJtIx7rQGDhx9O5E/nfxTtEeUHYxj5o2mSbUyogbf
         BZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709937267; x=1710542067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lIH2iMnE8dw1ulrxWng3iUt5DsBzjBpjYjFG3/fg5Bs=;
        b=UVcjchmm/g88vGe5pL9dnSnebghc/OVgFcsh0VsesTnzNdOQV63u9qFmboO+qOWNgs
         /uOeZR6YOO2YDIZdQLmw0fSBvmKpFZY3JhukWRv8PxIR5oypcYm+KvnUK20VA+Lzaw/1
         /H0pGLJHnoY9g+bxMbHVix98ELg5sSryxX+DOT4wrVk9kYJjlfPN7jx52NzkRAcCRYaa
         fh2ajehH09YtxyENKHs6MtDxUt1KwnLL/pmrqYhWW9/5LSWeOAElrPqz3ub1c53DdK7x
         OTeDPIfzbhnOWHdGjvcLbTzS6MXYUevU5Pr1pkPqCktIJxVsg1MsI9vsuPhKPft3Wc+B
         Xy3g==
X-Gm-Message-State: AOJu0Yzf6k+/QRivwgCcyQKYZ4id86Y6N0OEhXHdCxJXn8AeD2ALsmVZ
	HrADjTQdrKrsPkxpk7RtFRzHRnzMUjskPyXw/JvhuQSu3hUmlI74m9VKQLIpwstZUCkJZ1F4E0k
	TaLrtbGCr4ZMUsqzSlbaazoSJIiE=
X-Google-Smtp-Source: AGHT+IG/+63wG4NAFQJ1xSzYiQ5xOnx9b29PhM7Nxu3pP5rF8JWJvMlP8aDhjgIO3GCs5/X2FnRnU7mwu1nx8JFHZtM=
X-Received: by 2002:a25:684f:0:b0:dcc:e9d:4a22 with SMTP id
 d76-20020a25684f000000b00dcc0e9d4a22mr307698ybc.12.1709937267089; Fri, 08 Mar
 2024 14:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20240308195504.3199754-1-alperyasinak1@gmail.com>
In-Reply-To: <20240308195504.3199754-1-alperyasinak1@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 8 Mar 2024 14:34:09 -0800
Message-ID: <CANx9H-CSrpLgaQBS2ks+2F6ZoWMPHYnLJ7QTb=oB00jgQttHHA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-wsproto: added recipe which is
 also include ptest
To: Alper Ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000064ab6b06132dcbd7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 22:34:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109242

--00000000000064ab6b06132dcbd7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You can trim your subject line a little bit (in the future) to something
like:

python3-wsproto: add recipe and enable ptest

On Fri, Mar 8, 2024 at 11:55=E2=80=AFAM Alper Ak <alperyasinak1@gmail.com> =
wrote:

> This package is a pure-Python implementation of a WebSocket protocol
> stack. It=E2=80=99s written from the ground up to be embeddable in whatev=
er program
> you choose to use, ensuring that you can communicate via WebSockets, as
> defined in RFC6455, regardless of your programming paradigm.
>
> * Ptest and library example tested on qemux86-64 and qemuarm64
>
> * Add ptest into PTESTS_FAST_META_PYTHON
>
> Ptest result:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> qemux86-64:
>
> Testsuite summary
> TOTAL: 230
> PASS: 230
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 18
> END: /usr/lib/python3-wsproto/ptest
> 2024-03-08T19:45
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> qemuarm64:
>
> Testsuite summary
> TOTAL: 230
> PASS: 230
> SKIP: 0
> XFAIL: 0
> FAIL: 0
> XPASS: 0
> ERROR: 0
> DURATION: 15
> END: /usr/lib/python3-wsproto/ptest
> 2024-03-08T19:40
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: alperak <alperyasinak1@gmail.com>
> ---
>  .../ptest-packagelists-meta-python.inc        |  1 +
>  .../python/python3-wsproto/run-ptest          |  3 +++
>  .../python/python3-wsproto_1.2.0.bb           | 27 +++++++++++++++++++
>  3 files changed, 31 insertions(+)
>  create mode 100644
> meta-python/recipes-devtools/python/python3-wsproto/run-ptest
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-wsproto_1.2.0.bb
>
> diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> index acfe28039..5ace8a9a2 100644
> --- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
> +++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
> @@ -71,6 +71,7 @@ PTESTS_FAST_META_PYTHON =3D "\
>      python3-unidiff \
>      python3-uritemplate \
>      python3-wrapt \
> +    python3-wsproto \
>      python3-xlrd \
>      python3-xmltodict \
>      python3-xxhash \
> diff --git a/meta-python/recipes-devtools/python/python3-wsproto/run-ptes=
t
> b/meta-python/recipes-devtools/python/python3-wsproto/run-ptest
> new file mode 100644
> index 000000000..8d2017d39
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wsproto/run-ptest
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +pytest --automake
> diff --git a/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
> b/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
> new file mode 100644
> index 000000000..09f5565a9
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-wsproto_1.2.0.bb
> @@ -0,0 +1,27 @@
> +SUMMARY =3D "WebSockets state-machine based protocol implementation"
> +HOMEPAGE =3D "https://github.com/python-hyper/wsproto/"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D69fabf732409f4ac61875827b258c=
aaf"
> +
> +inherit pypi setuptools3 ptest
> +
> +SRC_URI[sha256sum] =3D
> "ad565f26ecb92588a3e43bc3d96164de84cd9902482b130d0ddbaa9664a85065"
> +
> +SRC_URI +=3D " \
> +        file://run-ptest \
> +"
> +
> +RDEPENDS:${PN}-ptest +=3D " \
> +        python3-pytest \
> +        python3-unittest-automake-output \
> +"
> +
> +do_install_ptest() {
> +        install -d ${D}${PTEST_PATH}/tests
> +        cp -rf ${S}/test/* ${D}${PTEST_PATH}/tests/
> +}
> +
> +RDEPENDS:${PN} +=3D " \
> +        python3-h11 \
> +        python3-netclient \
> +"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109240):
> https://lists.openembedded.org/g/openembedded-devel/message/109240
> Mute This Topic: https://lists.openembedded.org/mt/104816145/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000064ab6b06132dcbd7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You can trim your subject line a little bit (in the f=
uture) to something like:</div><div><br></div><div>python3-wsproto: add rec=
ipe and enable ptest<br></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Fri, Mar 8, 2024 at 11:55=E2=80=AFAM Alper Ak &l=
t;<a href=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pa=
ckage is a pure-Python implementation of a WebSocket protocol stack. It=E2=
=80=99s written from the ground up to be embeddable in whatever program you=
 choose to use, ensuring that you can communicate via WebSockets, as define=
d in RFC6455, regardless of your programming paradigm.<br>
<br>
* Ptest and library example tested on qemux86-64 and qemuarm64<br>
<br>
* Add ptest into PTESTS_FAST_META_PYTHON<br>
<br>
Ptest result:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
qemux86-64:<br>
<br>
Testsuite summary<br>
TOTAL: 230<br>
PASS: 230<br>
SKIP: 0<br>
XFAIL: 0<br>
FAIL: 0<br>
XPASS: 0<br>
ERROR: 0<br>
DURATION: 18<br>
END: /usr/lib/python3-wsproto/ptest<br>
2024-03-08T19:45<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 0<br>
<br>
qemuarm64:<br>
<br>
Testsuite summary<br>
TOTAL: 230<br>
PASS: 230<br>
SKIP: 0<br>
XFAIL: 0<br>
FAIL: 0<br>
XPASS: 0<br>
ERROR: 0<br>
DURATION: 15<br>
END: /usr/lib/python3-wsproto/ptest<br>
2024-03-08T19:40<br>
STOP: ptest-runner<br>
TOTAL: 1 FAIL: 0<br>
<br>
Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.com" targe=
t=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 1 +<br>
=C2=A0.../python/python3-wsproto/run-ptest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 3 +++<br>
=C2=A0.../python/<a href=3D"http://python3-wsproto_1.2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-wsproto_1.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 27 +++++++++++++++++++<br>
=C2=A03 files changed, 31 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-wsprot=
o/run-ptest<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-wsproto_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
wsproto_1.2.0.bb</a><br>
<br>
diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/=
meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
index acfe28039..5ace8a9a2 100644<br>
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc<br>
@@ -71,6 +71,7 @@ PTESTS_FAST_META_PYTHON =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0python3-unidiff \<br>
=C2=A0 =C2=A0 =C2=A0python3-uritemplate \<br>
=C2=A0 =C2=A0 =C2=A0python3-wrapt \<br>
+=C2=A0 =C2=A0 python3-wsproto \<br>
=C2=A0 =C2=A0 =C2=A0python3-xlrd \<br>
=C2=A0 =C2=A0 =C2=A0python3-xmltodict \<br>
=C2=A0 =C2=A0 =C2=A0python3-xxhash \<br>
diff --git a/meta-python/recipes-devtools/python/python3-wsproto/run-ptest =
b/meta-python/recipes-devtools/python/python3-wsproto/run-ptest<br>
new file mode 100644<br>
index 000000000..8d2017d39<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/python3-wsproto/run-ptest<br>
@@ -0,0 +1,3 @@<br>
+#!/bin/sh<br>
+<br>
+pytest --automake<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
wsproto_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-wsproto_1.2.=
0.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-ws=
proto_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-wsproto_1.2.0.=
bb</a><br>
new file mode 100644<br>
index 000000000..09f5565a9<br>
--- /dev/null<br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-wsproto=
_1.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-wsproto_1.2.0.bb</a=
><br>
@@ -0,0 +1,27 @@<br>
+SUMMARY =3D &quot;WebSockets state-machine based protocol implementation&q=
uot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/python-hyper/wsproto/" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/python-hyper/wsproto/=
</a>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D69fabf732409f4ac61875827b2=
58caaf&quot;<br>
+<br>
+inherit pypi setuptools3 ptest<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;ad565f26ecb92588a3e43bc3d96164de84cd9902482b1=
30d0ddbaa9664a85065&quot;<br>
+<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
+&quot;<br>
+<br>
+RDEPENDS:${PN}-ptest +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pytest \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-unittest-automake-output \<br>
+&quot;<br>
+<br>
+do_install_ptest() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/tests<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -rf ${S}/test/* ${D}${PTEST_PATH}/tests/<br=
>
+}<br>
+<br>
+RDEPENDS:${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-h11 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-netclient \<br>
+&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109240): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109240" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109240</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104816145/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104816145/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000064ab6b06132dcbd7--

