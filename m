Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8BBD1D862
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:33:32 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35455.1764822809599502540
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:33:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I9m/QkFK;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-786d1658793so4528607b3.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 20:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822809; x=1765427609; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YhZDUKDSj+p9jEH3nEdF+67/7lfRWPoBouQKbQ8BqXg=;
        b=I9m/QkFKaLuUytnyfDIBnu85XN1Zo3UnAVfUu2UEvzlfri6aztLcAcqj46jjM69JGq
         IyRN0VSTig7vbUzBS089Ae+PwxsFpY0fTWNTNmmEX35OPiyIqAm3azb/TDRB1GkDtcDv
         1poxzoAWpGUIjPYifNBigjZt0oDfv7ngeRyughMaoa9zt8S1Mnx1a0xSkhBhSNqmh0jl
         OB0KdjwuicEJiVT1NCMD4XGQ4YLERQZs6sNAmvLp5LOK2vjGAMOch5d59lZ8Xlsh7iDN
         Z+jSMOA11TjkZKWUSMLcvCQt01FPTpDR+a8zQQ0Sb7qcDr1w+TW9xWOn1Gqu7D95uvVH
         4zIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822809; x=1765427609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhZDUKDSj+p9jEH3nEdF+67/7lfRWPoBouQKbQ8BqXg=;
        b=IMtkUn1qh0ILq7XkG41jbH4wq2iJ+2x2dFaNv4T1D/meG7KWqzvSuXvvZ/XQigVnmT
         CPUv0Sv4WqKNUjLTIcD0fiJJCbhopch4fKaEKscC+xOaW/kDnw5TuMHhJGDn779PBMbN
         yKxfQ71F+QflHl+Y1jrHU0OgHFJWVOBN+sN3TYiS9PFJ+7WBrvLOo1ZIYI7gtmq3ZaQt
         Ur5qmrVs2ca0XgShESvPq+E3bPiaNeQ8qh3uLLj3WIou7UzpjdlIQM7/Avi4d65wp65o
         0PSs2Hxlr5PDua82QD+xwNYfuaK/vDkEXAowoLvI18/pXrIy5BQclELpGoH5gXoM67M1
         bcTg==
X-Gm-Message-State: AOJu0Yxp+Fq+EoN7tVL+7+3xKyhTb26N51RLVgaI56JoR2YansijT3JP
	UgdiI7oA8RDWqSrIcpGIBWyB8sbf0m2vM1LkDcLMsso2Otvk+PkbfDB5pSPHQ9la8vvO07pu1G0
	ePFRE147LDmPFBvt+xKPVMeXjI+MVI9Y/lBSUbe8=
X-Gm-Gg: ASbGncus0bDKOrmI6i1m1SX0h2XP7b833GZUVdIAgxG9ptBqEFklIRB7yXZvwgtVmqI
	h8F7jSZyKtmXb7/nGsgpcW9NzdMSTDtjI0RpTb7mXXZNJKkYE+e5/Ts6IwwmvgrXHBJrg79Tmgg
	tHA+p392E26YmtoIu3oHyuUWiSY+e0S1FJktAahg/jnUU+Im1Ml9vJ0kMB0gKVBR6Zp4/bN7MmW
	Bm5dZTEirHGu/MZckis02VALobBF406UGePA6ko7EwUTMXSeWqlwLiSZdyGfN09Xo3I96VomAiS
	figl2+MIEXyTMxmFoZ+iNXnQldd2bWRF4VLwwQGONdKawPVczkg27KXXUuC4iwrkw0PY8sqHs0k
	I1HSwauyDrzqF
X-Google-Smtp-Source: AGHT+IHc8xLVxZlSvZyHKbVAhoztFht2AmxhNpOOm6/7sz/B512LvkTd6u8CN0RHVZViiDQd1JqaSDm6Tw6Phse70bM=
X-Received: by 2002:a05:690c:7208:b0:783:6f8d:e7a6 with SMTP id
 00721157ae682-78c1890b51amr25315087b3.51.1764822808508; Wed, 03 Dec 2025
 20:33:28 -0800 (PST)
MIME-Version: 1.0
References: <20251203221541.2247324-1-peter.marko@siemens.com>
In-Reply-To: <20251203221541.2247324-1-peter.marko@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Dec 2025 20:33:02 -0800
X-Gm-Features: AWmQ_bkG-4LMcs2jE9E94bFBkYKO-WGNvytsar5vSSfS0mZZKX-eowFx_jCRPtc
Message-ID: <CAMKF1so1WDamJ=kmkbAGto5FpHP67yXPi04V_jpAk7DqjoW82g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] libcoap: upgrade 4.3.5 -> 4.3.5a
To: peter.marko@siemens.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000097bd48064518d4cf"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Dec 2025 04:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122299

--00000000000097bd48064518d4cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 2:15=E2=80=AFPM Peter Marko via lists.openembedded.o=
rg
<peter.marko=3Dsiemens.com@lists.openembedded.org> wrote:

> From: Peter Marko <peter.marko@siemens.com>
>
> Changelog [1]:
>   * Fixes the following CVEs
>     CVE-2025-59391
>     CVE-2025-65494
>     CVE-2025-65495
>     CVE-2025-65496
>     CVE-2025-65497
>     CVE-2025-65498
>     CVE-2025-65499
>     CVE-2025-65500
>     CVE-2025-65501
>   * CVE-2025-50518 not fixed as user application error.
>   * Support for Mbed TLS 3.6.3.
>   * Support for RIOT update changes.
>   * Fixes for later CI environment builds.
>   * Critical reported bugs fixed.
>
> Add tag to SRC_URI for hash verification.
>
> License-Update: copyright years refreshed [2]
>
> [1] https://github.com/obgm/libcoap/blob/v4.3.5a/ChangeLog
> [2]
> https://github.com/obgm/libcoap/commit/993c12ac92ce6a24a409924fe78a5c0fe7=
246699
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../libcoap/{libcoap_4.3.5.bb =3D> libcoap_4.3.5a.bb}         | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.5.bb =3D>
> libcoap_4.3.5a.bb} (93%)
>
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
> similarity index 93%
> rename from meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> rename to meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
> index a4e5f5ca46..0a8dacc377 100644
> --- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5.bb
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5a.bb
> @@ -5,12 +5,12 @@ RF range, memory, bandwith, or network packet sizes."
>  HOMEPAGE =3D "https://libcoap.net/"
>
>  LICENSE =3D "BSD-2-Clause & BSD-3-Clause"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9aa68c0f6785376aa8ec7f4f1aa6a=
e3c"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D05d17535846895e23ea4c79b16a9e=
904"
>
> -SRC_URI =3D "git://github.com/obgm/libcoap.git;branch=3Dmain;protocol=3D=
https \
> +SRC_URI =3D "git://
> github.com/obgm/libcoap.git;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}
> <http://github.com/obgm/libcoap.git;branch=3Dmain;protocol=3Dhttps;tag=3D=
v$%7BPV%7D>
> \
>

This fails to fetch because the commit it not on main branch but
on release-4.3.5-patches branch
see
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4396669/raw_inlin=
e

I think bitbake -ccleanall <recipe> && bitbake <recipe>

should reveal it

            file://run-ptest \
>             "
> -SRCREV =3D "7cf7465b784baded4de183290c547d582becfd28"
> +SRCREV =3D "e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9"
>
>
>  inherit autotools manpages pkgconfig ptest
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122293):
> https://lists.openembedded.org/g/openembedded-devel/message/122293
> Mute This Topic: https://lists.openembedded.org/mt/116602955/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000097bd48064518d4cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 3, =
2025 at 2:15=E2=80=AFPM Peter Marko via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;peter.marko=3D<a href=3D"mailto:sieme=
ns.com@lists.openembedded.org">siemens.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Pete=
r Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D"_blank">pe=
ter.marko@siemens.com</a>&gt;<br>
<br>
Changelog [1]:<br>
=C2=A0 * Fixes the following CVEs<br>
=C2=A0 =C2=A0 CVE-2025-59391<br>
=C2=A0 =C2=A0 CVE-2025-65494<br>
=C2=A0 =C2=A0 CVE-2025-65495<br>
=C2=A0 =C2=A0 CVE-2025-65496<br>
=C2=A0 =C2=A0 CVE-2025-65497<br>
=C2=A0 =C2=A0 CVE-2025-65498<br>
=C2=A0 =C2=A0 CVE-2025-65499<br>
=C2=A0 =C2=A0 CVE-2025-65500<br>
=C2=A0 =C2=A0 CVE-2025-65501<br>
=C2=A0 * CVE-2025-50518 not fixed as user application error.<br>
=C2=A0 * Support for Mbed TLS 3.6.3.<br>
=C2=A0 * Support for RIOT update changes.<br>
=C2=A0 * Fixes for later CI environment builds.<br>
=C2=A0 * Critical reported bugs fixed.<br>
<br>
Add tag to SRC_URI for hash verification.<br>
<br>
License-Update: copyright years refreshed [2]<br>
<br>
[1] <a href=3D"https://github.com/obgm/libcoap/blob/v4.3.5a/ChangeLog" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/obgm/libcoap/blob/v4.3=
.5a/ChangeLog</a><br>
[2] <a href=3D"https://github.com/obgm/libcoap/commit/993c12ac92ce6a24a4099=
24fe78a5c0fe7246699" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/obgm/libcoap/commit/993c12ac92ce6a24a409924fe78a5c0fe7246699</a><br>
<br>
Signed-off-by: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" t=
arget=3D"_blank">peter.marko@siemens.com</a>&gt;<br>
---<br>
=C2=A0.../libcoap/{<a href=3D"http://libcoap_4.3.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">libcoap_4.3.5.bb</a> =3D&gt; <a href=3D"http://libcoap_4.3=
.5a.bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5a.bb</a>}=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 6 +++---<br>
=C2=A01 file changed, 3 insertions(+), 3 deletions(-)<br>
=C2=A0rename meta-networking/recipes-devtools/libcoap/{<a href=3D"http://li=
bcoap_4.3.5.bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5.bb</a> =
=3D&gt; <a href=3D"http://libcoap_4.3.5a.bb" rel=3D"noreferrer" target=3D"_=
blank">libcoap_4.3.5a.bb</a>} (93%)<br>
<br>
diff --git a/meta-networking/recipes-devtools/libcoap/<a href=3D"http://lib=
coap_4.3.5.bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5.bb</a> b/=
meta-networking/recipes-devtools/libcoap/<a href=3D"http://libcoap_4.3.5a.b=
b" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5a.bb</a><br>
similarity index 93%<br>
rename from meta-networking/recipes-devtools/libcoap/<a href=3D"http://libc=
oap_4.3.5.bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5.bb</a><br>
rename to meta-networking/recipes-devtools/libcoap/<a href=3D"http://libcoa=
p_4.3.5a.bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5a.bb</a><br>
index a4e5f5ca46..0a8dacc377 100644<br>
--- a/meta-networking/recipes-devtools/libcoap/<a href=3D"http://libcoap_4.=
3.5.bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5.bb</a><br>
+++ b/meta-networking/recipes-devtools/libcoap/<a href=3D"http://libcoap_4.=
3.5a.bb" rel=3D"noreferrer" target=3D"_blank">libcoap_4.3.5a.bb</a><br>
@@ -5,12 +5,12 @@ RF range, memory, bandwith, or network packet sizes.&quot=
;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://libcoap.net/" rel=3D"noreferrer=
" target=3D"_blank">https://libcoap.net/</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;BSD-2-Clause &amp; BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D9aa68c0f6785376aa8ec7f4f1a=
a6ae3c&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D05d17535846895e23ea4c79b16=
a9e904&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/obgm/libcoap.git;bran=
ch=3Dmain;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">github.com=
/obgm/libcoap.git;branch=3Dmain;protocol=3Dhttps</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/obgm/libcoap.git;bran=
ch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D"_=
blank">github.com/obgm/libcoap.git;branch=3Dmain;protocol=3Dhttps;tag=3Dv${=
PV}</a> \<br></blockquote><div><br></div><div>This fails to fetch because t=
he commit it not on main branch but on=C2=A0release-4.3.5-patches branch</d=
iv><div>see=C2=A0</div><div><a href=3D"https://autobuilder.yoctoproject.org=
/valkyrie/api/v2/logs/4396669/raw_inline">https://autobuilder.yoctoproject.=
org/valkyrie/api/v2/logs/4396669/raw_inline</a></div><div><br></div><div>I =
think bitbake -ccleanall=C2=A0&lt;recipe&gt; &amp;&amp; bitbake &lt;recipe&=
gt;</div><div><br></div><div>should reveal it</div><div><br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRCREV =3D &quot;7cf7465b784baded4de183290c547d582becfd28&quot;<br>
+SRCREV =3D &quot;e3fdcdcfbd1588754fe9dd4b754ac9397260f0f9&quot;<br>
<br>
<br>
=C2=A0inherit autotools manpages pkgconfig ptest<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122293): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122293" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122293</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116602955/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116602955/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000097bd48064518d4cf--

