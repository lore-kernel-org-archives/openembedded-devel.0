Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0B6C54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 23:14:41 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web11.19971.1711235678674911433
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 16:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VhXESLw0;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dbed0710c74so2803260276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 16:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711235678; x=1711840478; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XmxhVUe3eDnfq0ulyMo9c5drjBVJrA+lyhsoCw5+3+o=;
        b=VhXESLw0zI33C7lHpDHyQbHq0Hq2gJ13q3PtRoGmjmntF6/Dl8PIyEd2cCBlV+mofW
         J9+FNtp7CJAepXEt4l/Pc6XjU7qjdc4f2mQud+ByjLp7FORLKLZ4EXRLiM2tt99fBNVp
         dtOUMVymgTA2UxbSR87mCUf+jv6wZrIAscrdelzVGguh8rrbcU+clvkwt1+5S54ys8Id
         t66/e5mpvxruMil1JDi3gHd2Rim3PnBLR5w+xDLKeh+iQpp/SS85PdprTgwuies/sInn
         mBU7jtw2U7AQSVUC3FmQwJxdd7IUWF7EFgBa97hPIIicueitTUqiKiY7LsatEmWNn1T0
         Fexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711235678; x=1711840478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmxhVUe3eDnfq0ulyMo9c5drjBVJrA+lyhsoCw5+3+o=;
        b=V2Zn5lfSfnJsmsf35GmlRusec6ja30pKX+5R0okQmcaLc6W31dDw7npUCTt1p1U2r4
         5b9F8cBHncNvkMzYbjFc6ND/oz5RIK9eQW3xS7iTwBBYSeE6ncEn5f7s3BTGT2ygprfu
         R2+BxtnfJO7dbGm1Bv+J0tSehVGEVneoDYGCitWeB2CtTi2mDvdWw7dIOKTJu0FCPUBj
         Jv29+5J9u3pHsU29LTXDECgLxnQ/R35ov+hKFJxm9oTKFxD3uUb+nbKlvPMU+FKXwPvP
         lOXXZ01CRia/xWttsyqHOZIaDvPfnmUUbMRzXGicsLNE3Os9eUZBEK4Gayv6AJVvuiDB
         XLOw==
X-Gm-Message-State: AOJu0YxAzaqfy3vt60hLivXRLwSj9e5QgD+OQ1kO9Zedj2KkYTWpKsG0
	+grO4Ld6kt6PW7H0wnzwpE8hCMr7PqwS0TnE2XaSUtZKqFb5d4ECxty3JmQNKUl/QHDyPkxIPD/
	WffpifeuKBXuq+fWm+5hR4fx51PU=
X-Google-Smtp-Source: AGHT+IFlsgZa5l397fDHVXuY/LoOk75EioD3ZovVTPh5yVLm8iPEZmC06bbjCRMwwuoE6kExZILyeUvDOejV6IjHtVM=
X-Received: by 2002:a25:5f44:0:b0:dcc:7af5:97b4 with SMTP id
 h4-20020a255f44000000b00dcc7af597b4mr2178693ybm.12.1711235677642; Sat, 23 Mar
 2024 16:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230609144646.1977-1-jermain.horsman@nedap.com> <20230609144646.1977-3-jermain.horsman@nedap.com>
In-Reply-To: <20230609144646.1977-3-jermain.horsman@nedap.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sat, 23 Mar 2024 16:14:26 -0700
Message-ID: <CANx9H-DSMeHjAyVTeLKzPCxEd9UASas5nO4tdctN7H2HTeFERg@mail.gmail.com>
Subject: Re: [oe] [meta-java][PATCH 3/3] rxtx: Remove obsolete rename of libtool
To: jermain.horsman@nedap.com
Cc: openembedded-devel@lists.openembedded.org, henning@itconsulting-heinold.de, 
	otavio@ossystems.com.br, richard.leitner@skidata.com
Content-Type: multipart/mixed; boundary="000000000000b1f67d06145c1a2b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 23:14:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109555

--000000000000b1f67d06145c1a2b
Content-Type: multipart/alternative; boundary="000000000000b1f67b06145c1a29"

--000000000000b1f67b06145c1a29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Still seeing a do_compile failure (attached)

Can you investigate and send a revised solution?

On Fri, Jun 9, 2023 at 7:48=E2=80=AFAM Jermain Horsman <jermain.horsman@ned=
ap.com>
wrote:

> From: Jermain Horsman <jermain.horsman@nedap.com>
>
> Autoconf no longer generates libtool with a host alias prefix,
> this causes do_compile to fail as it is unable to find libtool
> without the prefix.
>
> Since the rename is no longer needed the edit in the do_configure
> step can be removed.
>
> Signed-off-by: Jermain Horsman <jermain.horsman@nedap.com>
> ---
>  recipes-extended/rxtx/rxtx_2.2.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/rxtx/rxtx_2.2.0.bb b/recipes-extended/rxtx/
> rxtx_2.2.0.bb
> index 27935bc..a74f11e 100644
> --- a/recipes-extended/rxtx/rxtx_2.2.0.bb
> +++ b/recipes-extended/rxtx/rxtx_2.2.0.bb
> @@ -40,7 +40,7 @@ do_configure:prepend() {
>      # Ugly but don't complain to me, but upstream ;-)
>      sed -e 's,bin/javah,bin/gjavah,g' \
>          -e 's,bin/jar,bin/fastjar,g' \
> -        -e 's,\$(TOP)/libtool,\$(TOP)/\${host_alias}-libtool,g' -i ${S}/
> configure.in
> +        -i ${S}/configure.in
>      rm -f ${S}/acinclude.m4 \
>            ${S}/aclocal.m4 \
>            ${S}/ltconfig \
> --
> 2.39.2.windows.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103203):
> https://lists.openembedded.org/g/openembedded-devel/message/103203
> Mute This Topic: https://lists.openembedded.org/mt/99429856/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b1f67b06145c1a29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Still seeing a do_compile failure (attached)<div><br></div=
><div>Can you investigate and send a revised solution?</div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 9, =
2023 at 7:48=E2=80=AFAM Jermain Horsman &lt;<a href=3D"mailto:jermain.horsm=
an@nedap.com" target=3D"_blank">jermain.horsman@nedap.com</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Jermain Hors=
man &lt;<a href=3D"mailto:jermain.horsman@nedap.com" target=3D"_blank">jerm=
ain.horsman@nedap.com</a>&gt;<br>
<br>
Autoconf no longer generates libtool with a host alias prefix,<br>
this causes do_compile to fail as it is unable to find libtool<br>
without the prefix.<br>
<br>
Since the rename is no longer needed the edit in the do_configure<br>
step can be removed.<br>
<br>
Signed-off-by: Jermain Horsman &lt;<a href=3D"mailto:jermain.horsman@nedap.=
com" target=3D"_blank">jermain.horsman@nedap.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/rxtx/<a href=3D"http://rxtx_2.2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">rxtx_2.2.0.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-extended/rxtx/<a href=3D"http://rxtx_2.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">rxtx_2.2.0.bb</a> b/recipes-extended/rxtx/<a =
href=3D"http://rxtx_2.2.0.bb" rel=3D"noreferrer" target=3D"_blank">rxtx_2.2=
.0.bb</a><br>
index 27935bc..a74f11e 100644<br>
--- a/recipes-extended/rxtx/<a href=3D"http://rxtx_2.2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">rxtx_2.2.0.bb</a><br>
+++ b/recipes-extended/rxtx/<a href=3D"http://rxtx_2.2.0.bb" rel=3D"norefer=
rer" target=3D"_blank">rxtx_2.2.0.bb</a><br>
@@ -40,7 +40,7 @@ do_configure:prepend() {<br>
=C2=A0 =C2=A0 =C2=A0# Ugly but don&#39;t complain to me, but upstream ;-)<b=
r>
=C2=A0 =C2=A0 =C2=A0sed -e &#39;s,bin/javah,bin/gjavah,g&#39; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,bin/jar,bin/fastjar,g&#39; \<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 -e &#39;s,\$(TOP)/libtool,\$(TOP)/\${host_alia=
s}-libtool,g&#39; -i ${S}/<a href=3D"http://configure.in" rel=3D"noreferrer=
" target=3D"_blank">configure.in</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 -i ${S}/<a href=3D"http://configure.in" rel=3D=
"noreferrer" target=3D"_blank">configure.in</a><br>
=C2=A0 =C2=A0 =C2=A0rm -f ${S}/acinclude.m4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/aclocal.m4 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/ltconfig \<br>
-- <br>
2.39.2.windows.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103203): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103203" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103203</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99429856/9247=
29" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt/=
99429856/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000b1f67b06145c1a29--

--000000000000b1f67d06145c1a2b
Content-Type: application/octet-stream; name="log.do_compile"
Content-Disposition: attachment; filename="log.do_compile"
Content-Transfer-Encoding: base64
Content-ID: <f_lu4phi0k0>
X-Attachment-Id: f_lu4phi0k0

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gYXV0b3Rvb2xzX2FjbG9jYWxzCkRFQlVH
OiBTSVRFIGZpbGVzIFsnZW5kaWFuLWxpdHRsZScsICdjb21tb24tbGludXgnLCAnY29tbW9uLWds
aWJjJywgJ2JpdC02NCcsICd4ODZfNjQtbGludXgnLCAnY29tbW9uJ10KREVCVUc6IFB5dGhvbiBm
dW5jdGlvbiBhdXRvdG9vbHNfYWNsb2NhbHMgZmluaXNoZWQKREVCVUc6IEV4ZWN1dGluZyBzaGVs
bCBmdW5jdGlvbiBkb19jb21waWxlCk5PVEU6IG1ha2UgLWogMTYgUlhUWF9QQVRIPS9idWlsZC90
bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvaW1hZ2UvdXNyL2xpYi9qbmkg
SkhPTUU9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9pbWFn
ZS91c3Ivc2hhcmUvamF2YS9leHQKKAkJCQkJCQkJXAoJCQkJCQkJXApjZCB4ODZfNjQtcG9reS1s
aW51eC1nbnU7IAkJCQkJCQlcCi9iaW4vYmFzaCAvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMi94ODZfNjQtcG9reS1saW51eC1saWJ0b29s
IC0tbW9kZT1jb21waWxlIHg4Nl82NC1wb2t5LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIg
LW10dW5lPWNvcmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25n
ICAtTzIgLURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vy
cm9yPWZvcm1hdC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBv
a3ktbGludXgvcnh0eC8yLjIuMC9yZWNpcGUtc3lzcm9vdCAtSS9idWlsZC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcnh0eC0yLjJwcmUyIC1JeDg2XzY0LXBva3ktbGlu
dXgtZ251IC1JLiAtSS9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvY2FjYW8tbmF0aXZlL2dp
dC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2luY2x1ZGUgLUkvYnVpbGQvdG1wL3dvcmsveDg2
XzY0LWxpbnV4L2NhY2FvLW5hdGl2ZS9naXQvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNs
dWRlLyAgLU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZmNhbm9u
LXByZWZpeC1tYXAgIC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMj0vdXNyL3NyYy9kZWJ1Zy9yeHR4LzIu
Mi4wICAtZmRlYnVnLXByZWZpeC1tYXA9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgvcnh0eC8yLjIuMC9yeHR4LTIuMnByZTI9L3Vzci9zcmMvZGVidWcvcnh0eC8yLjIuMCAgLWZt
YWNyby1wcmVmaXgtbWFwPS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgv
Mi4yLjAvcnh0eC0yLjJwcmUyPS91c3Ivc3JjL2RlYnVnL3J4dHgvMi4yLjAgIC1mZGVidWctcHJl
Zml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3J4
dHgtMi4ycHJlMj0vdXNyL3NyYy9kZWJ1Zy9yeHR4LzIuMi4wICAtZmRlYnVnLXByZWZpeC1tYXA9
L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yZWNpcGUtc3lz
cm9vdD0gIC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC9yeHR4LzIuMi4wL3JlY2lwZS1zeXNyb290PSAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9idWls
ZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlPSAgLURfUE9TSVhfU09VUkNFIC1EX0JTRF9TT1VSQ0UgLURfTk9fUE9TSVg9MSAtRF9O
T19YT1BFTjQ9MSAgLWMgL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8y
LjIuMC9yeHR4LTIuMnByZTIvLi9zcmMvU2VyaWFsSW1wLmMgLW8JCQlcCgkvYnVpbGQvdG1wL3dv
cmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMi94ODZfNjQtcG9r
eS1saW51eC1nbnUvU2VyaWFsSW1wLmxvOwkJXAppZiBbICJTZXJpYWwiID0gIlNlcmlhbCIgXTsg
dGhlbiAJCQkJCVwKCS9iaW4vYmFzaCAvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51
eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMi94ODZfNjQtcG9reS1saW51eC1saWJ0b29sIC0tbW9k
ZT1jb21waWxlIHg4Nl82NC1wb2t5LWxpbnV4LWdjYyAgLW02NCAtbWFyY2g9Y29yZTIgLW10dW5l
PWNvcmUyIC1tc3NlMyAtbWZwbWF0aD1zc2UgLWZzdGFjay1wcm90ZWN0b3Itc3Ryb25nICAtTzIg
LURfRk9SVElGWV9TT1VSQ0U9MiAtV2Zvcm1hdCAtV2Zvcm1hdC1zZWN1cml0eSAtV2Vycm9yPWZv
cm1hdC1zZWN1cml0eSAtLXN5c3Jvb3Q9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgvcnh0eC8yLjIuMC9yZWNpcGUtc3lzcm9vdCAtSS9idWlsZC90bXAvd29yay9jb3JlMi02NC1w
b2t5LWxpbnV4L3J4dHgvMi4yLjAvcnh0eC0yLjJwcmUyIC1JeDg2XzY0LXBva3ktbGludXgtZ251
IC1JLiAtSS9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvY2FjYW8tbmF0aXZlL2dpdC9yZWNp
cGUtc3lzcm9vdC1uYXRpdmUvdXNyL2luY2x1ZGUgLUkvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxp
bnV4L2NhY2FvLW5hdGl2ZS9naXQvcmVjaXBlLXN5c3Jvb3QtbmF0aXZlL3Vzci9pbmNsdWRlLyAg
LU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZmNhbm9uLXByZWZp
eC1tYXAgIC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMj0vdXNyL3NyYy9kZWJ1Zy9yeHR4LzIuMi4wICAt
ZmRlYnVnLXByZWZpeC1tYXA9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0
eC8yLjIuMC9yeHR4LTIuMnByZTI9L3Vzci9zcmMvZGVidWcvcnh0eC8yLjIuMCAgLWZtYWNyby1w
cmVmaXgtbWFwPS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAv
cnh0eC0yLjJwcmUyPS91c3Ivc3JjL2RlYnVnL3J4dHgvMi4yLjAgIC1mZGVidWctcHJlZml4LW1h
cD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4y
cHJlMj0vdXNyL3NyYy9kZWJ1Zy9yeHR4LzIuMi4wICAtZmRlYnVnLXByZWZpeC1tYXA9L2J1aWxk
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yZWNpcGUtc3lzcm9vdD0g
IC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9y
eHR4LzIuMi4wL3JlY2lwZS1zeXNyb290PSAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9idWlsZC90bXAv
d29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZl
PSAgLURfUE9TSVhfU09VUkNFIC1EX0JTRF9TT1VSQ0UgLURfTk9fUE9TSVg9MSAtRF9OT19YT1BF
TjQ9MSAgLWMgL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9y
eHR4LTIuMnByZTIvLi9zcmMvZnVzZXJJbXAuYyAtbwkJXAoJCS9idWlsZC90bXAvd29yay9jb3Jl
Mi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcnh0eC0yLjJwcmUyL3g4Nl82NC1wb2t5LWxpbnV4
LWdudS9mdXNlckltcC5sbzsJXAoJL2Jpbi9iYXNoIC9idWlsZC90bXAvd29yay9jb3JlMi02NC1w
b2t5LWxpbnV4L3J4dHgvMi4yLjAvcnh0eC0yLjJwcmUyL3g4Nl82NC1wb2t5LWxpbnV4LWxpYnRv
b2wgLS1tb2RlPWxpbmsgeDg2XzY0LXBva3ktbGludXgtZ2NjICAtbTY0IC1tYXJjaD1jb3JlMiAt
bXR1bmU9Y29yZTIgLW1zc2UzIC1tZnBtYXRoPXNzZSAtZnN0YWNrLXByb3RlY3Rvci1zdHJvbmcg
IC1PMiAtRF9GT1JUSUZZX1NPVVJDRT0yIC1XZm9ybWF0IC1XZm9ybWF0LXNlY3VyaXR5IC1XZXJy
b3I9Zm9ybWF0LXNlY3VyaXR5IC0tc3lzcm9vdD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC9yeHR4LzIuMi4wL3JlY2lwZS1zeXNyb290IC1PMiAtcGlwZSAtZyAtZmVsaW1pbmF0
ZS11bnVzZWQtZGVidWctdHlwZXMgLWZjYW5vbi1wcmVmaXgtbWFwICAtZm1hY3JvLXByZWZpeC1t
YXA9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yeHR4LTIu
MnByZTI9L3Vzci9zcmMvZGVidWcvcnh0eC8yLjIuMCAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9idWls
ZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcnh0eC0yLjJwcmUyPS91
c3Ivc3JjL2RlYnVnL3J4dHgvMi4yLjAgIC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dv
cmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMj0vdXNyL3NyYy9k
ZWJ1Zy9yeHR4LzIuMi4wICAtZmRlYnVnLXByZWZpeC1tYXA9L2J1aWxkL3RtcC93b3JrL2NvcmUy
LTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yeHR4LTIuMnByZTI9L3Vzci9zcmMvZGVidWcvcnh0
eC8yLjIuMCAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5
LWxpbnV4L3J4dHgvMi4yLjAvcmVjaXBlLXN5c3Jvb3Q9ICAtZm1hY3JvLXByZWZpeC1tYXA9L2J1
aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yZWNpcGUtc3lzcm9v
dD0gIC1mZGVidWctcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51
eC9yeHR4LzIuMi4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZT0gIC1EX1BPU0lYX1NPVVJDRSAtRF9C
U0RfU09VUkNFIC1EX05PX1BPU0lYPTEgLURfTk9fWE9QRU40PTEgLVdsLC1PMSAtV2wsLS1oYXNo
LXN0eWxlPWdudSAtV2wsLS1hcy1uZWVkZWQgLWZjYW5vbi1wcmVmaXgtbWFwICAtZm1hY3JvLXBy
ZWZpeC1tYXA9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9y
eHR4LTIuMnByZTI9L3Vzci9zcmMvZGVidWcvcnh0eC8yLjIuMCAgLWZkZWJ1Zy1wcmVmaXgtbWFw
PS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcnh0eC0yLjJw
cmUyPS91c3Ivc3JjL2RlYnVnL3J4dHgvMi4yLjAgIC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQv
dG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMj0vdXNy
L3NyYy9kZWJ1Zy9yeHR4LzIuMi4wICAtZmRlYnVnLXByZWZpeC1tYXA9L2J1aWxkL3RtcC93b3Jr
L2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yeHR4LTIuMnByZTI9L3Vzci9zcmMvZGVi
dWcvcnh0eC8yLjIuMCAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9idWlsZC90bXAvd29yay9jb3JlMi02
NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcmVjaXBlLXN5c3Jvb3Q9ICAtZm1hY3JvLXByZWZpeC1t
YXA9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yZWNpcGUt
c3lzcm9vdD0gIC1mZGVidWctcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9r
eS1saW51eC9yeHR4LzIuMi4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZT0gIC1XbCwteixyZWxybywt
eixub3cgLXJlbGVhc2UgMi4ycHJlMSAtbyBsaWJyeHR4U2VyaWFsLmxhIC1ycGF0aCAvYnVpbGQv
dG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL2ltYWdlL3Vzci9saWIvam5p
IC9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcnh0eC0yLjJw
cmUyL3g4Nl82NC1wb2t5LWxpbnV4LWdudS9TZXJpYWxJbXAubG8gIAlcCgkJL2J1aWxkL3RtcC93
b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yeHR4LTIuMnByZTIveDg2XzY0LXBv
a3ktbGludXgtZ251L2Z1c2VySW1wLmxvOyAJXAplbHNlCQkJCQkJCQlcCgkvYmluL2Jhc2ggL2J1
aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yeHR4LTIuMnByZTIv
eDg2XzY0LXBva3ktbGludXgtbGlidG9vbCAtLW1vZGU9bGluayB4ODZfNjQtcG9reS1saW51eC1n
Y2MgIC1tNjQgLW1hcmNoPWNvcmUyIC1tdHVuZT1jb3JlMiAtbXNzZTMgLW1mcG1hdGg9c3NlIC1m
c3RhY2stcHJvdGVjdG9yLXN0cm9uZyAgLU8yIC1EX0ZPUlRJRllfU09VUkNFPTIgLVdmb3JtYXQg
LVdmb3JtYXQtc2VjdXJpdHkgLVdlcnJvcj1mb3JtYXQtc2VjdXJpdHkgLS1zeXNyb290PS9idWls
ZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcmVjaXBlLXN5c3Jvb3Qg
LU8yIC1waXBlIC1nIC1mZWxpbWluYXRlLXVudXNlZC1kZWJ1Zy10eXBlcyAtZmNhbm9uLXByZWZp
eC1tYXAgIC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMj0vdXNyL3NyYy9kZWJ1Zy9yeHR4LzIuMi4wICAt
ZmRlYnVnLXByZWZpeC1tYXA9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0
eC8yLjIuMC9yeHR4LTIuMnByZTI9L3Vzci9zcmMvZGVidWcvcnh0eC8yLjIuMCAgLWZtYWNyby1w
cmVmaXgtbWFwPS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAv
cnh0eC0yLjJwcmUyPS91c3Ivc3JjL2RlYnVnL3J4dHgvMi4yLjAgIC1mZGVidWctcHJlZml4LW1h
cD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4y
cHJlMj0vdXNyL3NyYy9kZWJ1Zy9yeHR4LzIuMi4wICAtZmRlYnVnLXByZWZpeC1tYXA9L2J1aWxk
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yZWNpcGUtc3lzcm9vdD0g
IC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9y
eHR4LzIuMi4wL3JlY2lwZS1zeXNyb290PSAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9idWlsZC90bXAv
d29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcmVjaXBlLXN5c3Jvb3QtbmF0aXZl
PSAgLURfUE9TSVhfU09VUkNFIC1EX0JTRF9TT1VSQ0UgLURfTk9fUE9TSVg9MSAtRF9OT19YT1BF
TjQ9MSAtV2wsLU8xIC1XbCwtLWhhc2gtc3R5bGU9Z251IC1XbCwtLWFzLW5lZWRlZCAtZmNhbm9u
LXByZWZpeC1tYXAgIC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQt
cG9reS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMj0vdXNyL3NyYy9kZWJ1Zy9yeHR4LzIu
Mi4wICAtZmRlYnVnLXByZWZpeC1tYXA9L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgvcnh0eC8yLjIuMC9yeHR4LTIuMnByZTI9L3Vzci9zcmMvZGVidWcvcnh0eC8yLjIuMCAgLWZt
YWNyby1wcmVmaXgtbWFwPS9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgv
Mi4yLjAvcnh0eC0yLjJwcmUyPS91c3Ivc3JjL2RlYnVnL3J4dHgvMi4yLjAgIC1mZGVidWctcHJl
Zml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3J4
dHgtMi4ycHJlMj0vdXNyL3NyYy9kZWJ1Zy9yeHR4LzIuMi4wICAtZmRlYnVnLXByZWZpeC1tYXA9
L2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yZWNpcGUtc3lz
cm9vdD0gIC1mbWFjcm8tcHJlZml4LW1hcD0vYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1s
aW51eC9yeHR4LzIuMi4wL3JlY2lwZS1zeXNyb290PSAgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9idWls
ZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcmVjaXBlLXN5c3Jvb3Qt
bmF0aXZlPSAgLVdsLC16LHJlbHJvLC16LG5vdyAtcmVsZWFzZSAyLjJwcmUxIC1vIGxpYnJ4dHhT
ZXJpYWwubGEgLXJwYXRoIC9idWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgv
Mi4yLjAvaW1hZ2UvdXNyL2xpYi9qbmkgL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGlu
dXgvcnh0eC8yLjIuMC9yeHR4LTIuMnByZTIveDg2XzY0LXBva3ktbGludXgtZ251L1NlcmlhbElt
cC5sbzsgCVwKZmk7CQkJCQkJCQlcCikKL2Jpbi9iYXNoOiAvYnVpbGQvdG1wL3dvcmsvY29yZTIt
NjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3J4dHgtMi4ycHJlMi94ODZfNjQtcG9reS1saW51eC1s
aWJ0b29sOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Ci9iaW4vYmFzaDogL2J1aWxkL3RtcC93
b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC9yeHR4LTIuMnByZTIveDg2XzY0LXBv
a3ktbGludXgtbGlidG9vbDogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQovYmluL2Jhc2g6IC9i
dWlsZC90bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvcnh0eC0yLjJwcmUy
L3g4Nl82NC1wb2t5LWxpbnV4LWxpYnRvb2w6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKbWFr
ZTogKioqIFtNYWtlZmlsZTo4MjQ6IHg4Nl82NC1wb2t5LWxpbnV4LWdudS9saWJyeHR4U2VyaWFs
LmxhXSBFcnJvciAxMjcKRVJST1I6IG9lX3J1bm1ha2UgZmFpbGVkCldBUk5JTkc6IC9idWlsZC90
bXAvd29yay9jb3JlMi02NC1wb2t5LWxpbnV4L3J4dHgvMi4yLjAvdGVtcC9ydW4uZG9fY29tcGls
ZS4zMDkxOTU2OjE4NiBleGl0IDEgZnJvbSAnZXhpdCAxJwpXQVJOSU5HOiBCYWNrdHJhY2UgKEJC
IGdlbmVyYXRlZCBzY3JpcHQpOiAKCSMxOiBiYmZhdGFsX2xvZywgL2J1aWxkL3RtcC93b3JrL2Nv
cmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC90ZW1wL3J1bi5kb19jb21waWxlLjMwOTE5NTYs
IGxpbmUgMTg2CgkjMjogZGllLCAvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9y
eHR4LzIuMi4wL3RlbXAvcnVuLmRvX2NvbXBpbGUuMzA5MTk1NiwgbGluZSAxNzAKCSMzOiBvZV9y
dW5tYWtlLCAvYnVpbGQvdG1wL3dvcmsvY29yZTItNjQtcG9reS1saW51eC9yeHR4LzIuMi4wL3Rl
bXAvcnVuLmRvX2NvbXBpbGUuMzA5MTk1NiwgbGluZSAxNjUKCSM0OiBhdXRvdG9vbHNfZG9fY29t
cGlsZSwgL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC90ZW1w
L3J1bi5kb19jb21waWxlLjMwOTE5NTYsIGxpbmUgMTYwCgkjNTogZG9fY29tcGlsZSwgL2J1aWxk
L3RtcC93b3JrL2NvcmUyLTY0LXBva3ktbGludXgvcnh0eC8yLjIuMC90ZW1wL3J1bi5kb19jb21w
aWxlLjMwOTE5NTYsIGxpbmUgMTU1CgkjNjogbWFpbiwgL2J1aWxkL3RtcC93b3JrL2NvcmUyLTY0
LXBva3ktbGludXgvcnh0eC8yLjIuMC90ZW1wL3J1bi5kb19jb21waWxlLjMwOTE5NTYsIGxpbmUg
MTk5Cg==
--000000000000b1f67d06145c1a2b--

