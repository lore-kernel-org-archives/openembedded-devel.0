Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4122ACA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 05:01:57 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7016.1791781312379394163
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Oct 2026 22:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dpbdSK43;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8acda240937so9048567b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Oct 2026 22:01:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781311; cv=none;
        d=google.com; s=arc-20260327;
        b=dyHqBak3CKj38/AIpxS036lRJfDhYGmW9HKUuujcXsnbg2Lmk1DeEn4lmCHvjD9CuO
         6hkJaUL7LkEKTTFkpWImhFdlWIByB3nPDXsZYKnf3mohT/C3DEJivowl9rTMHqJPWDo4
         mo2i1eNNYWihWR/5qMl1PpHFxCzddpf8B3GBx9R5Wht1eB7aoFRh10xlecMQLQZtD1cu
         iRpnBck8Y0MpxNxOZmFpjb+WgJ9SYguDHZypEXX+/0tvd70dTigokWgJb7WkwvhtUoz6
         HTlM39c/JwtQXXdXK9xThyXr7rd8+L7ujmF33XfEMess4K89Eo/1y/VS3mbds/moOvx5
         RkaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qz9TUoxVcYEsif3ERro4BMuwOi4QwwgGAjfmBSLtRYU=;
        fh=n0ZnAkKOhGDmrf8RLpwnC7FQ6xmEY5rofL6wXnjsXjs=;
        b=RZqLUnGRGlD0wSTtTDZLMK74SgEEsGx7zDNaK5dR7LBUS2GlKdn+a8KGYdw1217YaV
         chWhj4u+kiDnztnOUvRl6AFgLcreRBB/LNqI0Fqg0UEPJQgz4LEXf5W/XQ9+ugZ0b3ae
         0V2c+mcXuQKwP3Dl+ZdCNAjPtoYfVAamAQ3/ocGJqYiPbnrqSOhKAlzqbivd25WcBX8T
         PiKpZgcH3tb6Ont/BavoO0qYu9/DLtU9WwFsov/93Ix1FaZpdOhUCOe6Iha0urWRrZWY
         yCDxbpWG6vF+COzYWvACHCFBh6akzQHTMhpbWc9wzXJuQK+89nQbcn3FkdFIsOmS/pIk
         M6ZQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781311; x=1792386111; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qz9TUoxVcYEsif3ERro4BMuwOi4QwwgGAjfmBSLtRYU=;
        b=dpbdSK43M5We+YM3smSsXXRCen+KVsE/lmgzsPB4M8585h9YdKdnabbxw7hh1sZ3Y8
         dG+g42CCL5p1ertJf6YHw5OXtHrceI6CTv6uMbSeRsoaJl1hrrY6iUU39w43/A/eMg5T
         de7Me821JY/oXTBix7gm6wBP7S7H8FXAP9UwzxO/Qi/F0TrHO/9S6uOI+JZwEsGYznnd
         7v883wZ9WA82VI3eoIK+HRoKlWgApg9fWLnNqf0F+see8Vm9gTkN5QSPN102BZ+1qYcv
         zGkQ16E3ThHv7So6b8ufvd1rOTjctrYOt2EE10HzTpkcv3WG+sulQdO2NvwdcyAHIHY5
         T2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781311; x=1792386111;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qz9TUoxVcYEsif3ERro4BMuwOi4QwwgGAjfmBSLtRYU=;
        b=TWOer7iiynVJY9Tyq1Z0yYhJ38wrd+rNH6lQxHG7e55ek61MNNQBGB9aJ07Da1kAiU
         U613a7pDGbLLSffXMwuwdrjf7GlzY2rbxgkN1s6diHJhwnvRt/6QDXnqH+HcpOK5qj3k
         ksRGR9lxmhnGKFNDoY49+b9MA2cfgKBBm9F8okILwqGeV4krdAsOz/UtwBzsEDjRE/jH
         NQFIcCKUaMBBu5EyDV97ErNcXX0lamiPyvW0dKqKwU0CtcglpFw/HEV4R1DqtRl8BGvD
         aY/SsbRBPdRbE1tLUDhdgPuDYKs8zqDxJnHLeMTgmnUT7XT3FhjIRL7/nEpkoHn3IAB3
         WSvQ==
X-Gm-Message-State: AFq9FYJzEr6iuQzMZ+zqJgz1ImbOJCu5542yVeIb3tUAtMLw3k6JQtYo
	vOlHeAxLpHe7jpkEuNBJK7ukJ1omWGklKrEp6+j4in2IUml1kK4otTgx7mvbZvRHGNVQq4QosPM
	G9Ye5cqF++k2sZ38lenOjy6Kfd64u5vE=
X-Gm-Gg: AYBFou1/umI0YtkL3E8knI7FPMki/Nt+aGyAeclm3dPppUJGrtck8VcdEFERZ/yISDu
	Am5azM+V2TcagrFK2heh6f6g98kdZmAYYCZiJp6ADmywI1fCclNsJHBCgzLYf9SCdbjc69AH6Ty
	2kSu+b+KYXeWCIfASm5EHd9EU6Vns3vZGwDc7hm773hs2vvXW74EE7Ogn3iSPWYjEiDEz8keVBZ
	ObAMiqO9CwbZcuaTFHDDM8MMbj1HuQ7RsZhJHiblb9MGnBDC7REuzANPThP5M2GBHTik64pDxyS
	AAoAGLxSA3lscawUjL2dIPl6kRnm5Jc19KA2v8bsWajm4F/mtLsT8eZmprX+XnZenxppwscVpPK
	KzQR8xbmSWdGJUV+OTMyw5N8r0D/U7oHhnercM1tHpvFICxKH40kAVvnHAgvPvWMt+9fdHACfej
	mZOWrgTUpUUof0fD9iA6A3/1lNGbJ0S55EUuCmC6wfsQbflgzcNwq7hhcUnbnwB3I9aKk7QnbGb
	WX9XF/JzfI8147iQL48ptPDJzI1R/QKtpkmI1tfM1kZHCUD3sEhBtHDA7w617dkUfzQP0KT1+qc
	5hV8FpEJtAdqoSY3bf6/KUJY/Pf1yDIU5xUwR7BUUnBhU3rDQzw=
X-Received: by 2002:a05:690c:e643:b0:8af:de3f:dbef with SMTP id
 00721157ae682-8b07edcd11fmr14364207b3.49.1791781311375; Sun, 11 Oct 2026
 22:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261012001007.2541673-1-ankur.tyagi85@gmail.com> <20261012001007.2541673-18-ankur.tyagi85@gmail.com>
In-Reply-To: <20261012001007.2541673-18-ankur.tyagi85@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Oct 2026 22:01:24 -0700
X-Gm-Features: AclHuK_6qdkFTem7D581rI-vv6eEV8eeuGw0kio7AfuRrxgyXRJXFyYdf7hoHI0
Message-ID: <CAMKF1sppXBtPARRGX48+TFpxbE1Fvm72fJQipnH5t8Tu5MN1mA@mail.gmail.com>
Subject: Re: [oe][meta-multimedia][PATCH 18/28] libde265: patch CVE-2026-54240
 and CVE-2026-54241
To: ankur.tyagi85@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000946fc8065d9d9837"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 05:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130754

--000000000000946fc8065d9d9837
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 5:11=E2=80=AFPM Ankur Tyagi via lists.openembedded.=
org
<ankur.tyagi85=3Dgmail.com@lists.openembedded.org> wrote:

> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Debian identified same commit as fix for both CVEs[1][2].
>
> Details:
> https://nvd.nist.gov/vuln/detail/cve-2026-54240
> https://nvd.nist.gov/vuln/detail/cve-2026-54241
>
> [1]https://security-tracker.debian.org/tracker/CVE-2026-54240
> [2]https://security-tracker.debian.org/tracker/CVE-2026-54241
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-multimedia/recipes-multimedia/libde265/
> libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/
> libde265_1.0.19.bb
> index a02d6dd5d8..8e145cf8dd 100644
> --- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
> +++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
> @@ -12,6 +12,7 @@ SRC_URI =3D "git://
> github.com/strukturag/libde265.git;branch=3Dmaster;protocol=3Dhttps
>             file://CVE-2026-49295.patch \
>             file://CVE-2026-49337.patch \
>             file://CVE-2026-49346.patch \
> +           file://CVE-2026-54240-CVE-2026-54241.patch \
>

did you miss adding the patchfile ?


>  "
>  SRCREV =3D "824b4138ecd51611d7073f1b50d5d6f982609b06"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130743):
> https://lists.openembedded.org/g/openembedded-devel/message/130743
> Mute This Topic: https://lists.openembedded.org/mt/121708410/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000946fc8065d9d9837
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Oct 11,=
 2026 at 5:11=E2=80=AFPM Ankur Tyagi via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;ankur.tyagi85=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ankur=
 Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" target=3D"_blank">ank=
ur.tyagi85@gmail.com</a>&gt;<br>
<br>
Debian identified same commit as fix for both CVEs[1][2].<br>
<br>
Details:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-54240" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/cve-2026-54240</a><b=
r>
<a href=3D"https://nvd.nist.gov/vuln/detail/cve-2026-54241" rel=3D"noreferr=
er" target=3D"_blank">https://nvd.nist.gov/vuln/detail/cve-2026-54241</a><b=
r>
<br>
[1]<a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-54240" r=
el=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/tra=
cker/CVE-2026-54240</a><br>
[2]<a href=3D"https://security-tracker.debian.org/tracker/CVE-2026-54241" r=
el=3D"noreferrer" target=3D"_blank">https://security-tracker.debian.org/tra=
cker/CVE-2026-54241</a><br>
<br>
Signed-off-by: Ankur Tyagi &lt;<a href=3D"mailto:ankur.tyagi85@gmail.com" t=
arget=3D"_blank">ankur.tyagi85@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-multimedia/recipes-multimedia/libde265/<a href=3D"http://libde26=
5_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.19.bb</a> | =
1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta-multimedia/recipes-multimedia/libde265/<a href=3D"http://=
libde265_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.19.bb=
</a> b/meta-multimedia/recipes-multimedia/libde265/<a href=3D"http://libde2=
65_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.19.bb</a><b=
r>
index a02d6dd5d8..8e145cf8dd 100644<br>
--- a/meta-multimedia/recipes-multimedia/libde265/<a href=3D"http://libde26=
5_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.19.bb</a><br=
>
+++ b/meta-multimedia/recipes-multimedia/libde265/<a href=3D"http://libde26=
5_1.0.19.bb" rel=3D"noreferrer" target=3D"_blank">libde265_1.0.19.bb</a><br=
>
@@ -12,6 +12,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/stru=
kturag/libde265.git;branch=3Dmaster;protocol=3Dhttps" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/strukturag/libde265.git;branch=3Dmaster;protocol=
=3Dhttps</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-49295.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-49337.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2026-49346.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2026-54240-CVE-2026-54=
241.patch \<br></blockquote><div><br></div><div>did you miss adding the pat=
chfile=C2=A0?</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
=C2=A0&quot;<br>
=C2=A0SRCREV =3D &quot;824b4138ecd51611d7073f1b50d5d6f982609b06&quot;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130743): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130743" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130743</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121708410/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121708410/1997914</a><br>
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

--000000000000946fc8065d9d9837--

