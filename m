Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 562B5C3064D
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 02:07:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web10.160936.1719281238853992442
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 19:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=OqgSg33f;
 spf=pass (domain: mvista.com, ip: 209.85.208.177, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso58317891fa.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 19:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1719281237; x=1719886037; darn=lists.openembedded.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Hq38ADpEAxPk/eNisa7tvsa7Uhtmy60cy+oDFNrZWc=;
        b=OqgSg33figc/dfr95DVMqzvGk9tiyrX6owuwtXNL5EtXBEZZRqA9HPDdpPRciaHKQN
         N+zRZUdDrgAseSztr7cYu3Ibsqzb+WQ77Zxf5N5aGQcuXmf2gVTsjv0/weXizEM1KdMs
         uP9bw/3zRwuD7kNIZoPf2yMVoVMmiy5xzkuy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719281237; x=1719886037;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Hq38ADpEAxPk/eNisa7tvsa7Uhtmy60cy+oDFNrZWc=;
        b=RaQ71wKIwFQdv2q9wMcRNFC646fXBOe0cfOcnesKyFszG9Mf2wTajTq14QffvaS5FQ
         auxOhDCi+oLdQGiC7jpT8tdzuBhOeChnLKWWrWXAaNh6wB63Q+LwOU+0KVQHO10kosxe
         bgo95GGleV/1ONTomG4I4IlAYDKVzjCOye/KHxjS2Da51hdQbK4cqpZgXLMKtjmJjZuo
         KO+MkzDnsvZA5qpYinqPtpYa78wQ0YnwFU8GAd+wZW6DPluQUGaSVISYuSw6MPD0p0E0
         qm/wvsWldGeDfuPDfPcozlLWoaQSQOHjR63FWcZnR4WN5iBLT5kt+xDfSulsKRRI4945
         oi+w==
X-Gm-Message-State: AOJu0YybYbc47Gdkmv/SCjjUQfOtJoqZH639Y6w9fvxYEG5NtfXLdSjN
	ej4eePbVA9ZrLauezVaZi2KxSgixL96qfJQ5Uzue2CJBP4eKAPAC1XCktJh8tyz80ErkfQAYd5m
	VlEEotZ4YJEQpNTmMkMVDoDkxImAZa4bD9cCsT1AHil1SmCkdjKU=
X-Google-Smtp-Source: AGHT+IGXNHGxJziXI6XEmW5d3Eg01x81ppqmlF/63ceSQgg7/4oNxlZr6qgQk1YiRe5HZ3/PFyy2xgzTVvGjptn7mZg=
X-Received: by 2002:a2e:870a:0:b0:2ec:50fa:1e3e with SMTP id
 38308e7fff4ca-2ec593d8fa3mr37820211fa.18.1719281236499; Mon, 24 Jun 2024
 19:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240604035527.9937-1-vanusuri@mvista.com>
In-Reply-To: <20240604035527.9937-1-vanusuri@mvista.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 25 Jun 2024 07:37:04 +0530
Message-ID: <CANQUz19Ri-n+LpNBdmQ-PVZUxE0N-kYmvP+NH2iBE8toc+rhJA@mail.gmail.com>
Subject: Re: [meta-oe][kirkstone][PATCH v2] yajl: backport Debian patch for CVE-2022-24795
To: openembedded-devel@lists.openembedded.org, 
	Armin Kuster <akuster808@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000005efaec061bad5b88"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 02:07:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111010

--0000000000005efaec061bad5b88
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Any update on this?

Thanks & Regards,
Vijay

On Tue, Jun 4, 2024 at 9:25=E2=80=AFAM <vanusuri@mvista.com> wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
>
> import patch from ubuntu to fix
>  CVE-2022-24795
>
> Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/yajl/tree/debian/patches/?h=3Dub=
untu%2Ffocal-security
> Upstream commit
>
> https://github.com/ppisar/yajl/commit/23cea2d7677e396efed78bbf1bf153961fa=
b6bad
> ]
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../yajl/yajl/CVE-2022-24795.patch            | 61 +++++++++++++++++++
>  meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb   |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.pat=
ch
>
> diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
> b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
> new file mode 100644
> index 000000000..4de46e699
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch
> @@ -0,0 +1,61 @@
> +From 23cea2d7677e396efed78bbf1bf153961fab6bad Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Petr=3D20P=3DC3=3DADsa=3DC5=3D99?=3D <ppisar@redhat.co=
m>
> +Date: Thu, 7 Apr 2022 17:29:54 +0200
> +Subject: [PATCH] Fix CVE-2022-24795
> +
> +There was an integer overflow in yajl_buf_ensure_available() leading
> +to allocating less memory than requested. Then data were written past
> +the allocated heap buffer in yajl_buf_append(), the only caller of
> +yajl_buf_ensure_available(). Another result of the overflow was an
> +infinite loop without a return from yajl_buf_ensure_available().
> +
> +yajl-ruby project, which bundles yajl, fixed it
> +<https://github.com/brianmario/yajl-ruby/pull/211> by checking for the
> +integer overflow, fortifying buffer allocations, and report the
> +failures to a caller. But then the caller yajl_buf_append() skips
> +a memory write if yajl_buf_ensure_available() failed leading to a data
> +corruption.
> +
> +A yajl fork mainter recommended calling memory allocation callbacks with
> +the large memory request and let them to handle it. But that has the
> +problem that it's not possible pass the overely large size to the
> +callbacks.
> +
> +This patch catches the integer overflow and terminates the process
> +with abort().
> +
> +https://github.com/lloyd/yajl/issues/239
> +
> https://github.com/brianmario/yajl-ruby/security/advisories/GHSA-jj47-x69=
x-mxrm
> +
> +Upstream-Status: Backport [import from ubuntu
> https://git.launchpad.net/ubuntu/+source/yajl/tree/debian/patches/CVE-202=
2-24795.patch
> +Upstream commit
> +
> https://github.com/ppisar/yajl/commit/23cea2d7677e396efed78bbf1bf153961fa=
b6bad
> ]
> +CVE: CVE-2022-24795
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + src/yajl_buf.c | 12 +++++++++++-
> + 1 file changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/yajl_buf.c b/src/yajl_buf.c
> +index 1aeafde0..55c11add 100644
> +--- a/src/yajl_buf.c
> ++++ b/src/yajl_buf.c
> +@@ -45,7 +45,17 @@ void yajl_buf_ensure_available(yajl_buf buf, size_t
> want)
> +
> +     need =3D buf->len;
> +
> +-    while (want >=3D (need - buf->used)) need <<=3D 1;
> ++    if (((buf->used > want) ? buf->used : want) > (size_t)(buf->used +
> want)) {
> ++        /* We cannot allocate more memory than SIZE_MAX. */
> ++        abort();
> ++    }
> ++    while (want >=3D (need - buf->used)) {
> ++        if (need >=3D (size_t)((size_t)(-1)<<1)>>1) {
> ++            /* need would overflow. */
> ++            abort();
> ++        }
> ++        need <<=3D 1;
> ++    }
> +
> +     if (need !=3D buf->len) {
> +         buf->data =3D (unsigned char *) YA_REALLOC(buf->alloc, buf->dat=
a,
> need);
> diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> index 697f54d9f..eca709cc1 100644
> --- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> +++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
> @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D39af6eb42999852bdd3ea00ad120a36d"
>
>  SRC_URI =3D "git://github.com/lloyd/yajl;branch=3Dmaster;protocol=3Dhttp=
s \
>             file://CVE-2023-33460.patch \
> +           file://CVE-2022-24795.patch \
>            "
>  SRCREV =3D "a0ecdde0c042b9256170f2f8890dd9451a4240aa"
>
> --
> 2.25.1
>
>

--0000000000005efaec061bad5b88
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Armin,</div><div><br></div><div>Any update on this=
?<br><br></div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
Jun 4, 2024 at 9:25=E2=80=AFAM &lt;<a href=3D"mailto:vanusuri@mvista.com">v=
anusuri@mvista.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">From: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista=
.com" target=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
<br>
import patch from ubuntu to fix<br>
=C2=A0CVE-2022-24795<br>
<br>
Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launch=
pad.net/ubuntu/+source/yajl/tree/debian/patches/?h=3Dubuntu%2Ffocal-securit=
y" rel=3D"noreferrer" target=3D"_blank">https://git.launchpad.net/ubuntu/+s=
ource/yajl/tree/debian/patches/?h=3Dubuntu%2Ffocal-security</a><br>
Upstream commit<br>
<a href=3D"https://github.com/ppisar/yajl/commit/23cea2d7677e396efed78bbf1b=
f153961fab6bad" rel=3D"noreferrer" target=3D"_blank">https://github.com/ppi=
sar/yajl/commit/23cea2d7677e396efed78bbf1bf153961fab6bad</a>]<br>
<br>
Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" tar=
get=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../yajl/yajl/CVE-2022-24795.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 61 +++++++++++++++++++<br>
=C2=A0meta-oe/recipes-devtools/yajl/<a href=3D"http://yajl_2.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">yajl_2.1.0.bb</a>=C2=A0 =C2=A0|=C2=A0 1 +<br=
>
=C2=A02 files changed, 62 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.=
patch<br>
<br>
diff --git a/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch b/meta=
-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch<br>
new file mode 100644<br>
index 000000000..4de46e699<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-devtools/yajl/yajl/CVE-2022-24795.patch<br>
@@ -0,0 +1,61 @@<br>
+From 23cea2d7677e396efed78bbf1bf153961fab6bad Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Petr=3D20P=3DC3=3DADsa=3DC5=3D99?=3D &lt;<a href=3D"mail=
to:ppisar@redhat.com" target=3D"_blank">ppisar@redhat.com</a>&gt;<br>
+Date: Thu, 7 Apr 2022 17:29:54 +0200<br>
+Subject: [PATCH] Fix CVE-2022-24795<br>
+<br>
+There was an integer overflow in yajl_buf_ensure_available() leading<br>
+to allocating less memory than requested. Then data were written past<br>
+the allocated heap buffer in yajl_buf_append(), the only caller of<br>
+yajl_buf_ensure_available(). Another result of the overflow was an<br>
+infinite loop without a return from yajl_buf_ensure_available().<br>
+<br>
+yajl-ruby project, which bundles yajl, fixed it<br>
+&lt;<a href=3D"https://github.com/brianmario/yajl-ruby/pull/211" rel=3D"no=
referrer" target=3D"_blank">https://github.com/brianmario/yajl-ruby/pull/21=
1</a>&gt; by checking for the<br>
+integer overflow, fortifying buffer allocations, and report the<br>
+failures to a caller. But then the caller yajl_buf_append() skips<br>
+a memory write if yajl_buf_ensure_available() failed leading to a data<br>
+corruption.<br>
+<br>
+A yajl fork mainter recommended calling memory allocation callbacks with<b=
r>
+the large memory request and let them to handle it. But that has the<br>
+problem that it&#39;s not possible pass the overely large size to the<br>
+callbacks.<br>
+<br>
+This patch catches the integer overflow and terminates the process<br>
+with abort().<br>
+<br>
+<a href=3D"https://github.com/lloyd/yajl/issues/239" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/lloyd/yajl/issues/239</a><br>
+<a href=3D"https://github.com/brianmario/yajl-ruby/security/advisories/GHS=
A-jj47-x69x-mxrm" rel=3D"noreferrer" target=3D"_blank">https://github.com/b=
rianmario/yajl-ruby/security/advisories/GHSA-jj47-x69x-mxrm</a><br>
+<br>
+Upstream-Status: Backport [import from ubuntu <a href=3D"https://git.launc=
hpad.net/ubuntu/+source/yajl/tree/debian/patches/CVE-2022-24795.patch" rel=
=3D"noreferrer" target=3D"_blank">https://git.launchpad.net/ubuntu/+source/=
yajl/tree/debian/patches/CVE-2022-24795.patch</a><br>
+Upstream commit<br>
+<a href=3D"https://github.com/ppisar/yajl/commit/23cea2d7677e396efed78bbf1=
bf153961fab6bad" rel=3D"noreferrer" target=3D"_blank">https://github.com/pp=
isar/yajl/commit/23cea2d7677e396efed78bbf1bf153961fab6bad</a>]<br>
+CVE: CVE-2022-24795<br>
+Signed-off-by: Vijay Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" ta=
rget=3D"_blank">vanusuri@mvista.com</a>&gt;<br>
+---<br>
+ src/yajl_buf.c | 12 +++++++++++-<br>
+ 1 file changed, 11 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/src/yajl_buf.c b/src/yajl_buf.c<br>
+index 1aeafde0..55c11add 100644<br>
+--- a/src/yajl_buf.c<br>
++++ b/src/yajl_buf.c<br>
+@@ -45,7 +45,17 @@ void yajl_buf_ensure_available(yajl_buf buf, size_t wan=
t)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0need =3D buf-&gt;len;<br>
+ <br>
+-=C2=A0 =C2=A0 while (want &gt;=3D (need - buf-&gt;used)) need &lt;&lt;=3D=
 1;<br>
++=C2=A0 =C2=A0 if (((buf-&gt;used &gt; want) ? buf-&gt;used : want) &gt; (=
size_t)(buf-&gt;used + want)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* We cannot allocate more memory than SIZE_M=
AX. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 while (want &gt;=3D (need - buf-&gt;used)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (need &gt;=3D (size_t)((size_t)(-1)&lt;&lt=
;1)&gt;&gt;1) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* need would overflow. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 need &lt;&lt;=3D 1;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (need !=3D buf-&gt;len) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0buf-&gt;data =3D (unsigned char *) YA_RE=
ALLOC(buf-&gt;alloc, buf-&gt;data, need);<br>
diff --git a/meta-oe/recipes-devtools/yajl/<a href=3D"http://yajl_2.1.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">yajl_2.1.0.bb</a> b/meta-oe/recipes-d=
evtools/yajl/<a href=3D"http://yajl_2.1.0.bb" rel=3D"noreferrer" target=3D"=
_blank">yajl_2.1.0.bb</a><br>
index 697f54d9f..eca709cc1 100644<br>
--- a/meta-oe/recipes-devtools/yajl/<a href=3D"http://yajl_2.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">yajl_2.1.0.bb</a><br>
+++ b/meta-oe/recipes-devtools/yajl/<a href=3D"http://yajl_2.1.0.bb" rel=3D=
"noreferrer" target=3D"_blank">yajl_2.1.0.bb</a><br>
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D39af6eb42=
999852bdd3ea00ad120a36d&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/lloyd/yajl;branc=
h=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.co=
m/lloyd/yajl;branch=3Dmaster;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-33460.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2022-24795.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;a0ecdde0c042b9256170f2f8890dd9451a4240aa&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div>

--0000000000005efaec061bad5b88--

