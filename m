Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49731D3B9AD
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 23:13:48 +0000 (UTC)
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1378.1765322025378217015
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 15:13:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T4wwcWpP;
 spf=pass (domain: gmail.com, ip: 74.125.224.46, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-640e065991dso4883381d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765322024; x=1765926824; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A8XcLg0F8u+FyqHFcZE77PC/PK1gD3ipinBI9EhnGdw=;
        b=T4wwcWpPjmgtXDBpXNST1H22l9OLYbQIa0Cc9Sor8QsHLHnC2YzUXFwKrqYyqlxObE
         rrHZ8yQRCG6XYqllT4alBw3ya5nlAHWTniJOtmKq9Qbn4EvhqURJHmN/5u5qnAzol2I9
         b3RJq87T1YSt7y/Rpnnfs4iFS9NX4Z2b1TZvGd2U7YNE4mODyvIwjgKM2tOSx9OhhLu5
         kLMKay9puK4VZy+W8FBrenm3OQxNdYOxyr6J7mGkKWr6TTvNEIWEu7l2qFgJ5GeiaqtI
         YqmENuzxp673ewJT55xg7WP6kJAVJsRst3SYCR4hlNGtHD9J/f7HEAe+cy4ayoQoBXF5
         Q8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765322024; x=1765926824;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8XcLg0F8u+FyqHFcZE77PC/PK1gD3ipinBI9EhnGdw=;
        b=cijE6TzPYpBSV7K6V3iqrhk3OR16ucBYZFH1SgmQHaskT+CjAFcrrVBHA0Gc1EV1qr
         EwNeNTMpOt9TJHzOYGpfRDL7s2WsXwYg1opok93F8tPtr5SIv94ei5oU45C8XbUf/4C7
         ZmsIthsUCFkQPk3giwL69KiwLa7ZMViroexwSOxWiuv17zbx8cNeyzyknbOjvWxEjt0i
         NNadY1UQ+xOkuoKJgXfz2IEzHHvDob/D7PiB9vyZoFc7RHOw2fIT/w7Mb86fRCjEZB3Y
         hgcmtMN8gWZmopqC/Pcpzg2TDDgf7fe60Ca6hFEHyAuhWOk15I0YeJkeNMDEhN/V6Fvp
         77Cw==
X-Gm-Message-State: AOJu0Yz3x9UYu4o8LtO6A3WBne9sRaQah060ZbWu9i9RuptE8wsFXqxA
	RixhXmpE8tuF69XKOZH85Y8Y9TD/8LLVPN/dSR4AIL4afWYdArqcHe+K4v8yfZZENwzZaej5DZu
	FVLqEKCXjt08EhVIZ2ko8QCmQ3yAQW61OuB/HFEg=
X-Gm-Gg: AY/fxX76fkxzDxxpOyzww2Dfs8NSxXxluBJ/mEHL3JvnPy6PMn/Q+yOwwC85nfJIsaa
	mBErVhlqVT0TYrmTGPnvGM7wURAUTLWdTwAzy/gt6FkgLQL9+JpWIp2DL6Y5WxYlEHFCvE1cC9B
	BeFdL6lxQx48Aw7qj5kHjPic78wFQRtlOhBq2lJvvs566HG2nN2JS/Hnv8n+RumUX01kQhgRWgd
	3c/SBLJUeGd/d6FbtgkgejcswkNT361Jfk5cVZS8CHuGLrmQeCeyu0OiUDPhSiALrKo8pPDH8Fa
	VVvkmrcisJ7Qm9giSdovV4juMx0j+lI9JhyoYnaEqCZlAbaF/XasKB3EHIb/QhWm/+IQWeYsdw5
	YOxLH2zl0wFWufs+tHBBO6GJmeNzaAfDj8Le7QJ7naiHndw==
X-Google-Smtp-Source: AGHT+IEoEp1uBBw9iROC42LICnoe/X9kUOcuuiR0sfF/69rruW6dLO5AG9E4jpqgqOYdRZJwn4Xz+LQPyd3i0VyjaUo=
X-Received: by 2002:a05:690e:2518:b0:63f:b444:da92 with SMTP id
 956f58d0204a3-6446e98bc22mr448712d50.31.1765322024329; Tue, 09 Dec 2025
 15:13:44 -0800 (PST)
MIME-Version: 1.0
References: <20251209095552.690-1-wangmy@fujitsu.com> <20251209095552.690-11-wangmy@fujitsu.com>
In-Reply-To: <20251209095552.690-11-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Dec 2025 15:13:18 -0800
X-Gm-Features: AQt7F2oWyggX2Ggfxt_yEurdaKsJGIhOxKlK0Bmlc38fCwCiKbRhyY_meuSkW8E
Message-ID: <CAMKF1sqZ4SEhJOeRtuHTpp2nbNNYK9WG94KF25_fqL=AwPGc=A@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 11/38] libyang: upgrade 3.13.6 -> 4.2.2
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002ca61f06458d1050"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 23:13:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122479

--0000000000002ca61f06458d1050
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

frr is only consumer of this recipe atleast in meta-openembedded repo and
it is not yet ported to libyang4 until then lets stick to libyang 3

| lib/northbound.c: In function 'nb_config_diff':
| lib/northbound.c:641:36: error: 'LYD_PRINT_WITHSIBLINGS' undeclared
(first use in this function); did you mean 'LYD_PRINT_SIBLINGS'?
|   641 |                                    LYD_PRINT_WITHSIBLINGS |
LYD_PRINT_WD_ALL)) {
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~
|       |                                    LYD_PRINT_SIBLINGS
| lib/northbound.c:641:36: note: each undeclared identifier is
reported only once for each function it appears in
| lib/northbound.c: In function 'nb_cb_operation_is_valid':
| lib/northbound.c:2273:29: error: invalid operands to binary || (have
'int' and 'struct lysc_value')
|  2273 |                             || sleaf->dflt)
|       |                             ^~ ~~~~~~~~~~~
|       |                                     |
|       |                                     struct lysc_value



On Tue, Dec 9, 2025 at 1:56=E2=80=AFAM wangmy via lists.openembedded.org <w=
angmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - new SO version 4
> - major LYB binary format optimizations
> - user-ordered lists diff fixes
> - validation optimizations
> - lots of other bugfixes and improvements
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../libyang/{libyang_3.13.6.bb =3D> libyang_4.2.2.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-extended/libyang/{libyang_3.13.6.bb =3D>
> libyang_4.2.2.bb} (96%)
>
> diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> b/meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> rename to meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
> index 822c30ba24..4b2ceaaa17 100644
> --- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
> +++ b/meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "BSD-3-Clause"
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db69fd3b2815bbf1cef5c97f0eee25=
19a"
>
> -SRCREV =3D "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
> +SRCREV =3D "3d07c3a71534a580c3960907da17568eff7e5c64"
>
>  SRC_URI =3D "git://
> github.com/CESNET/libyang.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv${P=
V}
> <http://github.com/CESNET/libyang.git;branch=3Dmaster;protocol=3Dhttps;ta=
g=3Dv$%7BPV%7D>
> \
>             file://0001-test_context-skip-test-case-test_searchdirs.patch=
 \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122415):
> https://lists.openembedded.org/g/openembedded-devel/message/122415
> Mute This Topic: https://lists.openembedded.org/mt/116691544/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002ca61f06458d1050
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">frr is only consumer of this recipe=C2=A0atleast in meta-o=
penembedded repo and it is not yet ported to libyang4 until then lets stick=
 to libyang 3<div><br></div><div><pre style=3D"color:rgb(0,0,0)">| lib/nort=
hbound.c: In function &#39;nb_config_diff&#39;:
| lib/northbound.c:641:36: error: &#39;LYD_PRINT_WITHSIBLINGS&#39; undeclar=
ed (first use in this function); did you mean &#39;LYD_PRINT_SIBLINGS&#39;?
|   641 |                                    LYD_PRINT_WITHSIBLINGS | LYD_P=
RINT_WD_ALL)) {
|       |                                    ^~~~~~~~~~~~~~~~~~~~~~
|       |                                    LYD_PRINT_SIBLINGS
| lib/northbound.c:641:36: note: each undeclared identifier is reported onl=
y once for each function it appears in
| lib/northbound.c: In function &#39;nb_cb_operation_is_valid&#39;:
| lib/northbound.c:2273:29: error: invalid operands to binary || (have &#39=
;int&#39; and &#39;struct lysc_value&#39;)
|  2273 |                             || sleaf-&gt;dflt)
|       |                             ^~ ~~~~~~~~~~~
|       |                                     |
|       |                                     struct lysc_value
</pre><br class=3D"gmail-Apple-interchange-newline"></div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, Dec 9, 2025 at 1:56=E2=80=AFAM wangmy via <a href=3D"http://li=
sts.openembedded.org">lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"ma=
ilto:fujitsu.com@lists.openembedded.org">fujitsu.com@lists.openembedded.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blan=
k">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
- new SO version 4<br>
- major LYB binary format optimizations<br>
- user-ordered lists diff fixes<br>
- validation optimizations<br>
- lots of other bugfixes and improvements<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../libyang/{<a href=3D"http://libyang_3.13.6.bb" rel=3D"noreferrer" =
target=3D"_blank">libyang_3.13.6.bb</a> =3D&gt; <a href=3D"http://libyang_4=
.2.2.bb" rel=3D"noreferrer" target=3D"_blank">libyang_4.2.2.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-extended/libyang/{<a href=3D"http://libyang_3.=
13.6.bb" rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a> =3D&gt;=
 <a href=3D"http://libyang_4.2.2.bb" rel=3D"noreferrer" target=3D"_blank">l=
ibyang_4.2.2.bb</a>} (96%)<br>
<br>
diff --git a/meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_3.1=
3.6.bb" rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a> b/meta-o=
e/recipes-extended/libyang/<a href=3D"http://libyang_4.2.2.bb" rel=3D"noref=
errer" target=3D"_blank">libyang_4.2.2.bb</a><br>
similarity index 96%<br>
rename from meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_3.13=
.6.bb" rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a><br>
rename to meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_4.2.2.=
bb" rel=3D"noreferrer" target=3D"_blank">libyang_4.2.2.bb</a><br>
index 822c30ba24..4b2ceaaa17 100644<br>
--- a/meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_3.13.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">libyang_3.13.6.bb</a><br>
+++ b/meta-oe/recipes-extended/libyang/<a href=3D"http://libyang_4.2.2.bb" =
rel=3D"noreferrer" target=3D"_blank">libyang_4.2.2.bb</a><br>
@@ -6,7 +6,7 @@ LICENSE =3D &quot;BSD-3-Clause&quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Db69fd3b2815bbf1cef5c9=
7f0eee2519a&quot;<br>
<br>
-SRCREV =3D &quot;c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb&quot;<br>
+SRCREV =3D &quot;3d07c3a71534a580c3960907da17568eff7e5c64&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/CESNET/libyang.g=
it;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/CESNET/libyang.git;branch=3Dmaster;protocol=3Dht=
tps;tag=3Dv${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-test_context-skip-tes=
t-case-test_searchdirs.patch \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122415): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122415" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122415</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116691544/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116691544/1997914</a><br>
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

--0000000000002ca61f06458d1050--

