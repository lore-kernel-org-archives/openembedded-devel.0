Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B808CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 15:44:04 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78626.1778600633817154204
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 08:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HHr9nPQ2;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-65dd9b25829so1409739d50.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:43:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778600633; cv=none;
        d=google.com; s=arc-20240605;
        b=EnXl7eVy4ey5HePNMlm7LmEgyCebOJ6o1hiFSrQpvCznZOT/03LHict+4hAqbTv+18
         6tiCnIrdAD5nEmIkIDuYkummlEpma3/TyAbKvZIEXrh5KFA3410BCf5uAFJkclny5BVx
         6IgJ/qYeKWU6UEdkR20JIeqbVcs0xho+kUu2V61u6gH6WSgOQj9uA4gTfDPx3rt8q8Ze
         5Dem+J/h+3MLckicYQIOEd+YBpmkUg9S/rPdHs7lXFktuHNx88Byt3ExAPvkzx8yhWR1
         pxqIs4QglOXga04g8EkD9S43oeUcHR90whLks//3x7g6EvKnq/ZKwbFx+v4ruRQe0nlt
         F7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jsTIlMeshHDALKxfGInkABmOGqO7H3ZbO/PiDJi0eHE=;
        fh=9c84kwx8N4yOyDjJlzZK/THMrbmx080KJxW2xNX3I8s=;
        b=YymPoePTdI2pDG5ODnS9XRNYQYT7GHIupiIgV/EjR/dGFm8h0QTtKBUcqjYsJgg0NR
         Q+ikcuOO0pN25Uy27JLvw3AUxUDQw4LEo99L541ZNogTsaLbMHqq/dFHfMOeiqBB4H4N
         L0m46wdI70AdHk6dtP7/HJNjeHQldAKMonU3X93tUyjfi9aVgV97BDWiYdgTiEIhF0R/
         oOAahenDrnRBAoofdN44t+8hUTuPlm5dLSbfUONa2+nkS/ewt7SyfcVXST2+pxRDtuKL
         4av4fwjiUSA6J9ZPmR24HLbAxe5g8wjPF63XUJNgcXs6rxPkQ+Lse4D/StQzt1RMOjeY
         tSKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778600633; x=1779205433; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jsTIlMeshHDALKxfGInkABmOGqO7H3ZbO/PiDJi0eHE=;
        b=HHr9nPQ2L4ZbxZ19LiG4Kf9Biwl9D+F7+K5Lin8P5fmvWKczOZRIBnqbYyhmaZvNZV
         LS+rL0ziIcet+EReHtZATDc62JCwzkPPSJ3DtVfREOoYUDuy9NtYvV0gfcYAgNpNpJfY
         qy0bobGHoPBi+e/OXEreNylCky9nCTtkLKeGUhp3e3RENYmXBhYQxBcSQfxa/olVhpl6
         WUcvwbATgnxF/EJypOViGpizkeq4vyl3i5kiwYlNWwP0KUe0VZaBgc2zn3VAwgp7ejGC
         juKpzSkBb/1LrKmKPNrNYCxL2iRP7XcyXhxmYtEmh+wWFfdQN6zF1vcenYozq/egm35w
         dC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600633; x=1779205433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsTIlMeshHDALKxfGInkABmOGqO7H3ZbO/PiDJi0eHE=;
        b=sYZjlbQLXT64DasuS03OLne+4oOMhcjscOHlxKEEBB96kFN6/nOm8CWIsMP8l1pmiB
         qJnCSfvWD/h8iXlDT+VGbOt9g0ZLWGjRvJuqg7xMB/U+38PV4cA7bcRkutb8DFWSUOB+
         C2D2gsloF5om6wJleZPsKUPGRC5SZJcUjZZX0zn3KoFWFoK6MgulwVCPM/YMwcY6tY0F
         SSV4TQGWg+q6dfllmCQdB43rEdntCLQOu408LmKrLRF7nA1LpCrdsaLCWKe/4aKEkjST
         32GCRYlloOuwdm0Ff+kkbk2aUZNw7GxIFJR13Mm4kHe5nqQ+bUF5ts7wLfKchrQMVD5S
         grOw==
X-Gm-Message-State: AOJu0Yz3heUmolO1Sxo5IkHZ7u4UEqqcCis4CX/qMFhLkWMxpFx3iZ5I
	svvNgGDiV+cqJ69dpo0Hjh0JiAGU23m5MM24qsain9eUrlXq0RjyDpVDGvzMLeAKF7WOkSyGGdC
	jwPMWPZQL+DuCyXR23BkgrhS7tDk6j5I=
X-Gm-Gg: Acq92OGy4cdf1iJrB4x66WPyYcvuQWEim/ZG8KyNsyi9SyJN6hX7JlIedZ8sl4Z+404
	oxDGYoknMUkmWhY7lbt0vAUjB7iHLT4OXpcEcdkF860TDk33CFBNrhHpPM2z/8lvsXJ++R+riZP
	CNd4ZXVvlVIblHvkboBzTMQOcPRoHBeh98la59sMy3mrx1irgTzF90DIyrkJZ4lMamFcCm2UaNE
	USJRLOyfomKvrgjkaogayk9d4B9ZTsl4b6XALrOO11knSnxowyiMIIOLlW+k3RgwY7eoNstKf40
	/uNuH6dZu6r1UnG9rAWtSzpuoj467cRIzqYsqB88tG4rcLmlVMQ0vjDFox3l+ITgzBCKii9sbve
	c4nj333SsPqkN2fRyMF9NqpzBJRb4PyiFK+P4mrnytEM3HCnhlpMcW03TMS23hk2e1dTYFpyTDQ
	nz9xRMc2A=
X-Received: by 2002:a05:690e:1282:b0:65c:ed33:bda5 with SMTP id
 956f58d0204a3-65d94901e32mr19207154d50.0.1778600632695; Tue, 12 May 2026
 08:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260512083810.1201751-1-hongxu.jia@windriver.com>
In-Reply-To: <20260512083810.1201751-1-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 May 2026 08:43:26 -0700
X-Gm-Features: AVHnY4KFevPFiIa0Ww5oLdXpHV0PzxyL1p4K_5keulfi1-_GZUeOCZ1P9SjmSro
Message-ID: <CAMKF1soKibpQ_e2fKO5divt3npzH7LYBxNurgN4jyCZ-KajhWQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] thin-provisioning-tools: fix compile
 failure on 32bit x86
To: hongxu.jia@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e8c0f20651a0ba5e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 15:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126871

--000000000000e8c0f20651a0ba5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 1:38=E2=80=AFAM hongxu via lists.openembedded.org
<hongxu.jia=3Dwindriver.com@lists.openembedded.org> wrote:

> $ echo 'MACHINE =3D "qemux86"' >> conf/local.conf
> $ bitbake thin-provisioning-tools
> ```
> error[E0080]: index out of bounds: the length is 1 but the index is 4
>  -->
> tmp/work/core2-32-wrs-linux/thin-provisioning-tools/1.3.1/build/target/re=
lease/build/devicemapper-sys-f88f57f28cd965d2/out/dm-bindings.rs:3:8718
>   |
> 3 | ...usize] ; ["Alignment of dm_ioctl"] [:: std :: mem :: align_of :: <
> dm_ioctl > () - 4usize] ; ["Offset of field: dm_ioctl::version"...
>   |
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^
> evaluation of `_` failed here
> ```
>
> Tweak filter condition on TUNE_FEATURES to add m32,mx32 for 32bit x86
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../thin-provisioning-tools/thin-provisioning-tools_1.3.1.bb    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/thin-provisioning-tools/
> thin-provisioning-tools_1.3.1.bb
> b/meta-oe/recipes-support/thin-provisioning-tools/
> thin-provisioning-tools_1.3.1.bb
> index 4d8d2a04df..6a58d090e8 100644
> --- a/meta-oe/recipes-support/thin-provisioning-tools/
> thin-provisioning-tools_1.3.1.bb
> +++ b/meta-oe/recipes-support/thin-provisioning-tools/
> thin-provisioning-tools_1.3.1.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D " \
>      git://
> github.com/device-mapper-utils/thin-provisioning-tools;branch=3Dmain;prot=
ocol=3Dhttps;tag=3Dv${PV}
> <http://github.com/device-mapper-utils/thin-provisioning-tools;branch=3Dm=
ain;protocol=3Dhttps;tag=3Dv$%7BPV%7D>
> \
>      file://0001-Use-portable-atomics-crate.patch \
>      file://disable-cargo-metadata.patch \
> -    ${@bb.utils.contains('TUNE_FEATURES', '32', \
> +    ${@bb.utils.contains_any('TUNE_FEATURES', '32 m32 mx32', \
>
>  'file://dms-no-layout-check.patch;patchdir=3D${CARGO_VENDORING_DIRECTORY=
}/devicemapper-sys-0.3.3',
> \
>          '', d)} \
>

would something like
${@oe.utils.conditional('SITEINFO_BITS', '32',
'file://dms-no-layout-check.patch;patchdir=3D${CARGO_VENDORING_DIRECTORY}/d=
evicemapper-sys-0.3.3',
'', d)}
 cover all 32bit cases ?

>      "
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126864):
> https://lists.openembedded.org/g/openembedded-devel/message/126864
> Mute This Topic: https://lists.openembedded.org/mt/119271402/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e8c0f20651a0ba5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 12,=
 2026 at 1:38=E2=80=AFAM hongxu via <a href=3D"http://lists.openembedded.or=
g">lists.openembedded.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:windriver.=
com@lists.openembedded.org">windriver.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">$ echo &#39=
;MACHINE =3D &quot;qemux86&quot;&#39; &gt;&gt; conf/local.conf<br>
$ bitbake thin-provisioning-tools<br>
```<br>
error[E0080]: index out of bounds: the length is 1 but the index is 4<br>
=C2=A0--&gt; tmp/work/core2-32-wrs-linux/thin-provisioning-tools/1.3.1/buil=
d/target/release/build/devicemapper-sys-f88f57f28cd965d2/out/dm-bindings.rs=
:3:8718<br>
=C2=A0 |<br>
3 | ...usize] ; [&quot;Alignment of dm_ioctl&quot;] [:: std :: mem :: align=
_of :: &lt; dm_ioctl &gt; () - 4usize] ; [&quot;Offset of field: dm_ioctl::=
version&quot;...<br>
=C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ evaluation o=
f `_` failed here<br>
```<br>
<br>
Tweak filter condition on TUNE_FEATURES to add m32,mx32 for 32bit x86<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../thin-provisioning-tools/<a href=3D"http://thin-provisioning-tools=
_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">thin-provisioning-tools_1.3=
.1.bb</a>=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-support/thin-provisioning-tools/<a href=3D"htt=
p://thin-provisioning-tools_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">=
thin-provisioning-tools_1.3.1.bb</a> b/meta-oe/recipes-support/thin-provisi=
oning-tools/<a href=3D"http://thin-provisioning-tools_1.3.1.bb" rel=3D"nore=
ferrer" target=3D"_blank">thin-provisioning-tools_1.3.1.bb</a><br>
index 4d8d2a04df..6a58d090e8 100644<br>
--- a/meta-oe/recipes-support/thin-provisioning-tools/<a href=3D"http://thi=
n-provisioning-tools_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">thin-pr=
ovisioning-tools_1.3.1.bb</a><br>
+++ b/meta-oe/recipes-support/thin-provisioning-tools/<a href=3D"http://thi=
n-provisioning-tools_1.3.1.bb" rel=3D"noreferrer" target=3D"_blank">thin-pr=
ovisioning-tools_1.3.1.bb</a><br>
@@ -10,7 +10,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/device-mapper-utils/=
thin-provisioning-tools;branch=3Dmain;protocol=3Dhttps;tag=3Dv$%7BPV%7D" re=
l=3D"noreferrer" target=3D"_blank">github.com/device-mapper-utils/thin-prov=
isioning-tools;branch=3Dmain;protocol=3Dhttps;tag=3Dv${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-Use-portable-atomics-crate.patch \<br>
=C2=A0 =C2=A0 =C2=A0file://disable-cargo-metadata.patch \<br>
-=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;TUNE_FEATURES&#39;, &#39;32&#39;, =
\<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains_any(&#39;TUNE_FEATURES&#39;, &#39;32 m3=
2 mx32&#39;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;file://dms-no-layout-check.patch;pat=
chdir=3D${CARGO_VENDORING_DIRECTORY}/devicemapper-sys-0.3.3&#39;, \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;&#39;, d)} \<br></blockquote><div><b=
r></div><div>would something like</div><div>${@oe.utils.conditional(&#39;SI=
TEINFO_BITS&#39;, &#39;32&#39;, &#39;file://dms-no-layout-check.patch;patch=
dir=3D${CARGO_VENDORING_DIRECTORY}/devicemapper-sys-0.3.3&#39;, &#39;&#39;,=
 d)}</div><div>=C2=A0cover all 32bit cases ?</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126864): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126864" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126864</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/119271402/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/119271402/1997914</a><br>
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

--000000000000e8c0f20651a0ba5e--

