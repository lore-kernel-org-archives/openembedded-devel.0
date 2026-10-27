Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28296.1793131871613792509
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 13:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=OOAUu03G;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ad98c3fb15so2032677b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 13:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793131871; cv=none;
        d=google.com; s=arc-20260327;
        b=gLFS/E9pmYpn3JkFcoEl7xDEmnOKXqwyBKYQmSsRFDxpNet1RLtYqVFRJ9iYQV8SSU
         miFFW8Xv8e3w+CNOZZhEScqH2/Yned+y9f/2Gn8ffg3IDa1mfmpHi965W5uf8t5VJtFb
         Yme87vxKH47QYzNuiWUj/xzvPBqXk6015+td+wURcyu9/3fNAOG5OlGFAP9Cuit/RFeh
         BUkF+Q77w4NIa7sFJTGnDpcb2c3mSLTzLkFuUCs1mzEuGrGykkdCvQJRzD55CBqurkHo
         lKLRHq7KTF1z1CZCR/ZPKyf4PMnUKDg24zmMeobs4B/YhywFuer15SjpN1Q0N/LYTOu2
         poGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3AEThivOXlLzfyvlDEqbzQq3D5lCjUYrfmNmhYJUAwQ=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=D1lm3jweL2xgPWKH7u7fcZ6w9jDz+o6up+J1kYfHGv030hnLZzJ87h8Eg0/6cwSj4A
         5QXOIIryfpJznei/V2ZNxH07h517g/ibRNAInyR2rGeMdNFQ3bFwTU0nHoe4n9Dvufrs
         HRzHUolXxYaVtqip9ld21Ke95UAItuggjdCziItCy5Ou+qKn99ScWHaMLMrgwalrVP05
         z1OaylkV34IP72LfpzGuVm5bu5vROAuqYL5sYcT0WWsy0ztgu03wbY7M9/lrFPBG1fAx
         2SWh8FHg0tgEqljepTS+tx37M5gCr0vBwPxhRLJAZlp6ZtGLjFstHqv5hYWN+xc3KREF
         d+jw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793131870; x=1793736670; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3AEThivOXlLzfyvlDEqbzQq3D5lCjUYrfmNmhYJUAwQ=;
        b=OOAUu03GaKObjCNajrE5OGGOG2JTyPuRpWgDa+9ohGeKVNCZvyhVeci9uFcOCB+ze7
         dr67FbthOfR97ATsqpndP3JU/LVnqJRM6d7G2tIBnNe/SOViiI64sMbDq8JmN5HM1m5U
         91BGXtk79VRbHb2V0CmrJhQc41KBOM2qentIFKpq15FbqKk59alMH0QpKnzGbrqXvF+Z
         0os3fAD1/kVXnd6yvPEHurMUdRwGy/9N0WWtlmm3WBFQCV9IGXzk4NJmkrOjfctw3XZZ
         IcNq015Vnv5cEMVokCNjzb/hXM+g6LdoRDSwD4HOlJBUt6CYpj9p5BuRsy9ZalfvNY6F
         QT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793131870; x=1793736670;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3AEThivOXlLzfyvlDEqbzQq3D5lCjUYrfmNmhYJUAwQ=;
        b=lrz+eLcpSMk4GuO3dAWHXWuDXPMXrf1aaiBmwTa0zbOGXAZBi9einytUH12ECEQqLg
         CQ7VzHMj+byYN53fcopNadhrqH54ogj7DzG9WANVWWbXsq6tV/ZfwxQe3X6rdEfFVSSF
         LchTXy0foR9BjLkzA4secR4sa+fMYZEVAREzXzHRLcUXODto63wKJWkSmplTQHhh/wPa
         Eoj9nS2F9XnOUF6CJ7R5jZMHE/fu86+Kx1mr1jaPOvxVfNDeAnNfcJMA+Uph0Tw26xbT
         kDI03F6BkMWDS8p2/ufi69BkaFyonf+kLZJ/qREviAmalNX2WslxdLu0E/G26yuW1fCM
         JM1Q==
X-Gm-Message-State: AFq9FYLyhWL/s6sLeQd53Sogn6zkhSRXegx8f06v9HOlCztTd+ok0dPD
	4ZilqxDub2sjUf4x5gKuKDjDm/DKwnqeprUxJ9hSM+cv4PMFdMGLb4qIScKD40WdG+dZP5BzD3v
	HQq++SjTShwJD2kgffNSWp5NoSO0SunE=
X-Gm-Gg: AYBFou0P/qTQiHvpx+sANrtz9I7MK0Q4+PYKx1/96ZITXFHUP8rSSarfkmMqONbhvzw
	NTvQR3Kqn1W4uQY6DWoUsZTQwlbaPrDqz0uFqrWLYYXus9XLnJCr7x7pgkzPi6zdo0xzitJ4WQL
	Mpebl3MSJuy1ksmnFJdVxd6R7PWDi0USLX23bDRfhG84ZOY9E8DLsU+JNLYKZVMKpfYnU0YTKRS
	7XS3NK0tm1Drg8nzbsXXnF8w3KLaRpRf1k6sCqlMOYmx1DucQMrJl+PBHUGUjq9De/EKlYr7goJ
	CVcKpffpn7e1FEqFpEJTMce7E8om3mss5GNcf1y4rIVskgienGqD/mMed4FuZt7IY2VmTzt5wXK
	9vYGMSMH3azQWrFKK1xnkHuxqNvDSzCWhf5ujSSYdi7gsGTv/3QMB49Xei+zJlT4LgsHwn+/9t8
	1/G4Uaq2mc7v4fUcOdKHn32M3xC5La7sH3y+T4sBPDH3YVGlPm+uxA6oAN+/HjTdQZOMgc6uoNk
	hDRGHfazwNSQ5VYOhQjFVPClipDjirTxqxKBM6A46/+fDHpxuKVMo3+L6gtMzdr2fjYYc60Bpx0
	m01ufLjt9Pa0A3p24z2OBUZXctdU7k8lq42S1bdrsvVwx10Ww9MG2PmL2uuQOSWgJNaW90NKMaR
	nHgCJYfLtiQ==
X-Received: by 2002:a05:690c:f14:b0:8b1:7054:a5b6 with SMTP id
 00721157ae682-8b1b5c212d2mr1137537b3.27.1793131870544; Tue, 27 Oct 2026
 13:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261020123226.4033600-1-leon.anavi@konsulko.com> <20261020123226.4033600-10-leon.anavi@konsulko.com>
In-Reply-To: <20261020123226.4033600-10-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 27 Oct 2026 13:10:42 -0700
X-Gm-Features: AclHuK9yU_kkq5FW01wX0i2ntoZLNqTRYoqbYG39XxVlpEcvEk8ytxIGofvnCA8
Message-ID: <CAMKF1sqvcE7dKSTqXJCYgu3kagm9_9jbUQOQ3UEwXgLrEQPBrg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 10/14] python3-fastapi-cli: Upgrade
 0.0.27 -> 0.0.32
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002de7c8065ed80c04"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 20:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131548

--0000000000002de7c8065ed80c04
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

  I am seeing python3-fastapi ptests fails not sure if this is the cause.
Please validate

On Tue, Oct 20, 2026 at 5:32=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 0.0.32:
>
> - Set FASTAPI_ENV when running fastapi dev.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  ...hon3-fastapi-cli_0.0.27.bb =3D> python3-fastapi-cli_0.0.32.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-fastapi-cli_0.0.27.b=
b
> =3D> python3-fastapi-cli_0.0.32.bb} (81%)
>
> diff --git a/meta-python/recipes-devtools/python/
> python3-fastapi-cli_0.0.27.bb b/meta-python/recipes-devtools/python/
> python3-fastapi-cli_0.0.32.bb
> similarity index 81%
> rename from meta-python/recipes-devtools/python/
> python3-fastapi-cli_0.0.27.bb
> rename to meta-python/recipes-devtools/python/
> python3-fastapi-cli_0.0.32.bb
> index 94609b2b0f..33a441e1e9 100644
> --- a/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.27.bb
> +++ b/meta-python/recipes-devtools/python/python3-fastapi-cli_0.0.32.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://fastapi.tiangolo.com/"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De0cf8d811ea2046529403707b266f=
b5a"
>
> -SRC_URI[sha256sum] =3D
> "1dffb1e40c0c88f2e0171a8a252a2b615c1e63ff8c05626649e4badd6a84336a"
> +SRC_URI[sha256sum] =3D
> "38024d2345275e1b37ce8848727a580d84901b570e96b3256d9d36a9a5039424"
>
>  inherit pypi python_pdm
>
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131168):
> https://lists.openembedded.org/g/openembedded-devel/message/131168
> Mute This Topic: https://lists.openembedded.org/mt/121847932/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000002de7c8065ed80c04
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0 I am seeing=C2=A0python3-fastapi ptests fails not s=
ure if this is the cause. Please validate<div></div></div><br><div class=3D=
"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Tue, Oct 20, 2026 at 5:32=E2=80=AFAM Leon Anavi via <a href=3D"http://lis=
ts.openembedded.org">lists.openembedded.org</a> &lt;leon.anavi=3D<a href=3D=
"mailto:konsulko.com@lists.openembedded.org">konsulko.com@lists.openembedde=
d.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Upgrade to release 0.0.32:<br>
<br>
- Set FASTAPI_ENV when running fastapi dev.<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0...<a href=3D"http://hon3-fastapi-cli_0.0.27.bb" rel=3D"noreferrer" t=
arget=3D"_blank">hon3-fastapi-cli_0.0.27.bb</a> =3D&gt; <a href=3D"http://p=
ython3-fastapi-cli_0.0.32.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
fastapi-cli_0.0.32.bb</a>} | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-fastapi-cli_0.0.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastap=
i-cli_0.0.27.bb</a> =3D&gt; <a href=3D"http://python3-fastapi-cli_0.0.32.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-fastapi-cli_0.0.32.bb</a>} (=
81%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
fastapi-cli_0.0.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi=
-cli_0.0.27.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://=
python3-fastapi-cli_0.0.32.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-fastapi-cli_0.0.32.bb</a><br>
similarity index 81%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-f=
astapi-cli_0.0.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi-=
cli_0.0.27.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-fas=
tapi-cli_0.0.32.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi-cl=
i_0.0.32.bb</a><br>
index 94609b2b0f..33a441e1e9 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-fastapi=
-cli_0.0.27.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi-cli_0.=
0.27.bb</a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-fastapi=
-cli_0.0.32.bb" rel=3D"noreferrer" target=3D"_blank">python3-fastapi-cli_0.=
0.32.bb</a><br>
@@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://fastapi.tiangolo.com/=
" rel=3D"noreferrer" target=3D"_blank">https://fastapi.tiangolo.com/</a>&qu=
ot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3De0cf8d811ea2046529403=
707b266fb5a&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;1dffb1e40c0c88f2e0171a8a252a2b615c1e63ff8c056=
26649e4badd6a84336a&quot;<br>
+SRC_URI[sha256sum] =3D &quot;38024d2345275e1b37ce8848727a580d84901b570e96b=
3256d9d36a9a5039424&quot;<br>
<br>
=C2=A0inherit pypi python_pdm<br>
<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131168): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131168" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131168</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121847932/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121847932/1997914</a><br>
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

--0000000000002de7c8065ed80c04--
