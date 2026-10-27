Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23743.1793120252591084651
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 09:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=iggPK1v+;
 spf=pass (domain: gmail.com, ip: 209.85.128.170, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ac9d666d4eso36171777b3.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 09:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793120251; cv=none;
        d=google.com; s=arc-20260327;
        b=hTEe2i+NIHcxJj8HXBk1z6oCOEojn86xpdBvPtOD49Gu536/m8ci+nTjG1mcH5LeoZ
         4w4FDXW0tlu06Kn2u9ZnJ3apxZWeW45yjzj1g5NTQ5BdykiyKqjfVQpAEhzNRuCA1Y71
         Ou2dVWDpwlmyB+uxjux+yBhVsYT5Z/RgkeZ7ZrypUgSNocV/NEA+dAAGFNh/vU8UTyRK
         vKoegiAlGUaWFiWIqCtb5lj+wQGwyq+gfijdR4vsjObnll1jfuc9YJMoPVH/oTRbv0nY
         8C4FomlVjPJu5zJ08v3cwQWL5TENSj2LxOnj2zc5eJH+l/HLRtJyMxraq9mA+SwDa0UI
         mtbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IMnNOsgRYuyZGOcZEPX37hqJSCea1Ia7kwxmiegqIOI=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=Ig0i3FC4okf5FftSr4GnDNHi4MoSaPDnB+MOkRl5ndGLjts4GqKv3/w/6tBvLWYqkQ
         QQO1+5oAEDmfquT3R9J0h1mSLYr0dK1i8mmZrCCRpwh7CPn8zqK5KRDRAB+1b5wPl7cm
         Fp/sA7+fVJUjWgRaK71yyAjTsYMnH16kN3fymBw3aq/p+f5Wq3oK8wchNYxIt1x/iZmT
         t6bSekHCwo0UC300hf6APgaBEkttNwcsEJx6PPhwBru9zxUtlD9Z9/0c/PTvuS9FlHhQ
         WA23/VbqvxyuBJMa6pWlMO1IBWeasJD+YPshohKDQxBVRET5UIoNtih+LtWst77XsV8q
         4trA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793120251; x=1793725051; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMnNOsgRYuyZGOcZEPX37hqJSCea1Ia7kwxmiegqIOI=;
        b=iggPK1v+RJSay/hOh8RKXxY+e0c4PXaO3piopTlpdQvT3r7LmKKv9cK0jGljFtqhNd
         e/h41r0zRaQEhZfa+TuGbMTJsJnAyzbzbQkfLCF5xOpFsN6MRXvdLRtelJTVMINB/Zib
         Awf+gjiBWtmWqZgMILexyEGeqgliLjzLLV7ph/zTJ+mHNIPSdootj2ysntM3Jf1pehx4
         nWNWYSvXAiPJMOXGWOgfcmMaP+0YehZodbvSAwWo1Lt3pel8F1DRS8igTrWEfbLYr4xe
         CaiVFpo5mE8Et6dzYv6f5ZX9YEG9ZR/wRsfXRoYockr9ZXuC7zaEzhfCcIsgW+1zescv
         5CHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793120251; x=1793725051;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IMnNOsgRYuyZGOcZEPX37hqJSCea1Ia7kwxmiegqIOI=;
        b=sEvq7NUmgmd+/vEzvfBp8cZ6jPnpqhk3CpwlW/X4Xul4iDJoehwqYfiK0BJ+wuJSEk
         03DDC594xo2f8B3YjHa8HdjaGa9V0+86r5XfP5BDF/YK1p4JcZ+mcWT55Jr/LT8O2/hd
         gDMeIwd0ZBT5MSgybT6Rt7YsV43iKWd7dbo5g61vSTLxPCVNUr69YuuGW4lQ6ICeVvyD
         SSfEZ+nJy8yuZP/0pqZE0NpeMuRV0CM5M6tLrU9WbHD6NvQF2U9rv+UrJdcxGCdh5MZI
         bLZ+Sr7hqV+xYiO2B6wpLoePIQGwz9OR/7GNblpRjQB0OLH6A0+zokl+eCjjMbuMStwu
         fwoA==
X-Gm-Message-State: AFq9FYJ4qmXVw7kJFWS8XrRtOUcvUQQ2ZaB+krJYdghU1Ns0cp1DjxFt
	+9V562m1U7NToDaKTBo3pZ8SNdqd80OH3CW/GTpc0a2NbIZvfHdYhwqi+BPcH0Ugx1GVcI82nU2
	49afOf2rOkd0ChPO68VAnDj6NpbJVVJs=
X-Gm-Gg: AYBFou2DYn33TVv4kTtIKLPOLUqAsnvDRgi9uimkaA6KUIJQ0z5WB9LMBd3oZFNnrdW
	9sU6rSibbg9fR6VXiOxPxYc1vTBDfXJybWMOHDbNO74TSNhvI+m8OMCcs0tsGsuxSB2el/nmVOe
	3RU+KowkgXnd5+JDZ+SSW1HVVe6v30v0IzkPgqtm/7xYvc6sF7mt3LwqbjBGohdigTtD3ROxcZo
	/4rpMcF8ENNChnz2umOASTHlz2LKRXd19Uo0YGUCsJvp5lQnpidH9s1JHxJaQyjUIwp7lk+p/vf
	XcozyikFU91TD2qWqt/u3siODbzCGZg12TeaNHotkJausXOLNvC9LtNgR2Yi17SCjoaUhktV7IY
	/HkJCBQh4ZrvUO5j5n9hstkYZcfMPiOXZoIw7RxhYWn0L/DAKs3nII6LjpK+dOpwcN4afONeASH
	eRHk8pK0qu4EkCA45KAK+Tyg6LwwL99nNqEggBEqZEKEC0FOFWjx9I1bG9JR+/syrh5le/sqvGQ
	Vdj6ihCdboID7WIjfaA7onht6XEdj4E5BIImUK5OCZkOI2iGxDYlXnvAvfK5VpOZpjNcUq+o2xp
	AlL/9PzghOrvMwP0VJ6lnBcxk+tRLEE/ZbUnf/Nlu2rwQvsfrEx7eTMSow88f8vx
X-Received: by 2002:a05:690c:d86:b0:8b0:e10d:1975 with SMTP id
 00721157ae682-8b166ba7f1emr58742237b3.29.1793120251534; Tue, 27 Oct 2026
 09:57:31 -0700 (PDT)
MIME-Version: 1.0
References: <20261027092028.782979-1-leon.anavi@konsulko.com> <20261027092028.782979-9-leon.anavi@konsulko.com>
In-Reply-To: <20261027092028.782979-9-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Oct 2026 09:57:04 -0700
X-Gm-Features: AclHuK8W2n5HStIGVBLSFUHtI_eiUaqnQvl8gz1kftgLWGCvuuoOMQNnYsBNRLc
Message-ID: <CAMKF1sqrUV_MxStm2f-DcPKNgUf4stADDbrtzZOjVzNqL-e0PQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 09/61] python3-jsonpatch: Upgrade 1.33
 -> 1.37
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a1e4f3065ed557d3"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 16:57:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131542

--000000000000a1e4f3065ed557d3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Leon,

This is the third time for this patch that I am reporting the same problem,
this patch keeps coming as part of different PRs. Can you address it please
?
bitbake -ccleanall python3-jsonpatch && bitbake python3-jsonpatch should
show it.

WARNING: python3-jsonpatch-1.37-r0 do_check_backend: QA Issue: inherits
setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

see AB logs -
https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1903/ste=
ps/17/logs/warnings



On Tue, Oct 27, 2026 at 2:20=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 1.37:
>
> - Clean up in-place output after write errors
> - Reject invalid patch document containers
> - Use UTF-8 for JSON command-line file I/O
> - Handle source pointer objects in move location helpers
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-jsonpatch_1.33.bb =3D> python3-jsonpatch_1.37.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.33.bb =
=3D>
> python3-jsonpatch_1.37.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.b=
b
> b/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
> index 6a1715c6df..62c12327a2 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.37.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D4f81c84f9a053e31fe9402a2a4e78864"
>
>  inherit pypi setuptools3
>
> -SRC_URI[sha256sum] =3D
> "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
> +SRC_URI[sha256sum] =3D
> "04288ef93e60084bcb118101cd9d53424e627b91bb47ec5a95c02ec3795f6d23"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-json \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131473):
> https://lists.openembedded.org/g/openembedded-devel/message/131473
> Mute This Topic: https://lists.openembedded.org/mt/121956748/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a1e4f3065ed557d3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Leon,</div><div><br></div><div>This is the third time=
 for this patch that I am reporting the same problem, this patch keeps comi=
ng as part of different PRs. Can you address it please ?</div><div>bitbake =
-ccleanall=C2=A0<span style=3D"background-color:transparent">python3-jsonpa=
tch &amp;&amp; bitbake=C2=A0</span><span style=3D"background-color:transpar=
ent">python3-jsonpatch should show it.</span></div><div><br></div><div>WARN=
ING: python3-jsonpatch-1.37-r0 do_check_backend: QA Issue: inherits setupto=
ols3 but has pyproject.toml specifying backend setuptools.build_meta, use t=
he correct class [pep517-backend]<br></div><div><br></div><div>see AB logs =
-=C2=A0<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/=
81/builds/1903/steps/17/logs/warnings">https://autobuilder.yoctoproject.org=
/valkyrie/#/builders/81/builds/1903/steps/17/logs/warnings</a></div><div><b=
r></div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Oct 27, 2026 at 2:20=E2=80=AFAM Leon Anavi v=
ia <a href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openem=
bedded.org</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openem=
bedded.org" target=3D"_blank">konsulko.com@lists.openembedded.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Upgrade to=
 release 1.37:<br>
<br>
- Clean up in-place output after write errors<br>
- Reject invalid patch document containers<br>
- Use UTF-8 for JSON command-line file I/O<br>
- Handle source pointer objects in move location helpers<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-jsonpatch_1.33.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-jsonpatch_1.33.bb</a> =3D&gt; <a href=3D"http://p=
ython3-jsonpatch_1.37.bb" rel=3D"noreferrer" target=3D"_blank">python3-json=
patch_1.37.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-jsonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_=
1.33.bb</a> =3D&gt; <a href=3D"http://python3-jsonpatch_1.37.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-jsonpatch_1.37.bb</a>} (80%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1=
.33.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpatch_1.37.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1=
.37.bb</a><br>
similarity index 80%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-j=
sonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.=
33.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-jso=
npatch_1.37.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.37=
.bb</a><br>
index 6a1715c6df..62c12327a2 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.33.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.37.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.37.bb<=
/a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4f81c84f9a0=
53e31fe9402a2a4e78864&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-SRC_URI[sha256sum] =3D &quot;9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee7=
31d004e212e1ee5030c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;04288ef93e60084bcb118101cd9d53424e627b91bb47e=
c5a95c02ec3795f6d23&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-json \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131473): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131473" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131473</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121956748/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121956748/1997914</a><br>
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

--000000000000a1e4f3065ed557d3--
