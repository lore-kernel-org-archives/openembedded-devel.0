Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12663.1792627659526638397
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 17:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ri4P8GG3;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d126f631so12014207b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 17:07:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792627658; cv=none;
        d=google.com; s=arc-20260327;
        b=ew59dOSB06V/2YzZpEDK0CHi+SrdH1mnBINn6nsYjabNXNOXN6Q4fD0Y8LUETM/yqc
         cINIVzbzx8Pa46yf/Xr6UkH/2niNA73X4yL8W+2kU8tu3W/KyhYfUjtPCuIwLVobzT0o
         gzc63n5faIe8XfSLXuX0dtCG30GBjcjykt7s9xTxjQmuLB9IonZaHMMOrcd+yr7dpk81
         p1LPeM3OoCRG29C1nTQDoH30d1ETbqHTKQXnmEqICs80s04HdzKrx7XamCvFGAYhhSte
         O264dHnwvrHf6zZKqRtoB6JjarJZRJl/P3Ej9gRKOy2lt7+u3QbGz+KPf07qxIBpfGiQ
         BeKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b3qrJAb1d2pVsC6+mYqQ1MnNHUyGlVrZ77xYciFazq0=;
        fh=2nN/GzVxUjERD0LNgf9vNaPM58ZIkCHYlMJQEwcNq0M=;
        b=Xlh8MRxEQqVBqmO6ZLzyba3vj6WW6kGKruhD7TLg38WdTwW2M3hulbsoTUndJB+3lH
         zquSzt7+wPBaZMFr5njDLIiT+cg5juynNhNbAIhnkfkywvhrSzSnjLoJTNp/SDXKXjjW
         brkuPHFu8bRMQeOwwX1mxy1rmzDGfNrg6iLSVOLUdeS2OC4kPzt7bkOQJwj1ffwA1U49
         cecQj5R49TBe4VRnNNdUAKkHGa4PpuNf12wS9Vrwab5DiNmBV7iEON0CoBDrQr5PNs08
         F7oCIcQEAV02/tW1dZnv3Y8RHRHyDENcKtVX0h9szZgF7sN4XCW9ldYmGx3saNbdjm4E
         jjJQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792627658; x=1793232458; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b3qrJAb1d2pVsC6+mYqQ1MnNHUyGlVrZ77xYciFazq0=;
        b=Ri4P8GG3H61m/KCK3cfz9+EZTlmFoQXXyCKUodUVodfF1pgizTe5oX5ST8hqg54g1G
         +TPPdMjCQO9TggvOPdSxvIU9kyY7R8K58xBILqR8Myd73MsDwtsmJrOWFgViFRV0XTe3
         21K6IjYiChkmj7fjOp+ahBNZcGDX38qijwHYhewpvcpl6O5d1JMcd94uRTki3QUyJglJ
         9zthHELgc5yE0wdRs4tOmJh762JMirDD0zPLYYZ+MRrFvfnMLk9795PAvsbKmHyxTMOF
         gByzZhq+TxSzRwMDvJMFyepFepHfDQu7QKt4hQgWK8kEz46afYiJn+LkpATpx6l39C+2
         GrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792627658; x=1793232458;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b3qrJAb1d2pVsC6+mYqQ1MnNHUyGlVrZ77xYciFazq0=;
        b=c5YeVlD5lxh9BtMM2Hf7V1Qk3PI4SiCHf4giTDAQ4Um6P0Ou6b0Khfn0Yh8EhtMsIH
         spjlHSCBDUpwXlpo39K0nx2SDtUYVInkd2/b3yfUl1NjE+ya1omWjfVm70KUiTIa6D4X
         OzxTgZoPfYB7gt+AL3+rGuRHxINOPjvaKtkifLWf51+GMHw6yip24oAG2WLJfchg3MBq
         LwIPL6UHfQuvyStgLT8qoeibkZ8AQr1nlAAyMrap9wXUT9xfOYWXMh0bLi1q99VltUEQ
         is0Uzpf4exNNnItTqtn4uUw94oeZY/wTawjc1U8L8joGKh/18yNKDtDuVBW+dWh/SGuS
         iVCw==
X-Gm-Message-State: AFq9FYKrfAaUuOlSWIKUspRGpo9Rsxhrra74RpdDcTJKenw9NpY/uQkm
	9jeTo2CViVASYnrsQGiQEtLsKvY4gczg6wTsnQvkByIyWfY+lHm8Zb4AEgya/AnJlupBak9AaLb
	ubt94ebRKxqeyrDACllmXkrcFQHI62kU=
X-Gm-Gg: AYBFou34BQebtSMg3ZZi9vHoNFYZaYheZ0avq085j5RhcnOcg/MXbztGPugkV9s0OdU
	AFSW+T7uSFJBTrYuGmYwpMvxt6MdKeVj0MO6dJPRdgYp2YO4sGmqUyaL1BC//dIicYubvhOEogF
	pVnNRDyFam0ag/VQwe9WoLG/92nYI0uG1xukZ4QZqPOBR/Jz1OTxPC7p2QyWJCmAoswPXm353Xa
	ALNcCU+qHhcZR51z878xIqgs2hEzeiWkCEroCMCaJHiQoBD+dEFxgIjxJBWsS1ur3EFwYXt9q4Y
	aeF+OJRqixY2F+HQ3Vw58VgyksAvFK+mKsIgasScOzN/yeyAkYIEWBKZLJgF2XWHOAeKS1oEcUc
	Y09mj0BmnvZTcGNlYpG1UCiwV2AubrY/Z+LHz1oU3VFufJ/1IKPtNM1STQ5ecdGEZp/WEZywxRm
	0MY8Qd+ih0qYyqQKv33PF/LSzTI9tJfuf9uQY0PNrUGNJlOieYug+kRhzKvwjv1E8eH46vI4M1A
	AWiltY+yugWsxuto0IchdkqZacegn5DqktS4IiFgWBKtNerQTwAAiq7bxjKkHP0FgIK9JnXDHFl
	nZ6kSw1ymoguJ/oTnyAiLl9UgGLRoZo4s4yZ6X7/7PBqnLEyFefaiGRvLez0/Ng2mBGEGIrA2ck
	rEMYEyEBUJXrH
X-Received: by 2002:a05:690c:6612:b0:8b1:233d:704d with SMTP id
 00721157ae682-8b133cab05fmr22223657b3.15.1792627657959; Wed, 21 Oct 2026
 17:07:37 -0700 (PDT)
MIME-Version: 1.0
References: <20261021110103.1943456-1-leon.anavi@konsulko.com> <20261021110103.1943456-24-leon.anavi@konsulko.com>
In-Reply-To: <20261021110103.1943456-24-leon.anavi@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Oct 2026 17:07:11 -0700
X-Gm-Features: AclHuK8cCvYwfQ0TXxisD3JqzVvWTpfJ5hvf6MokMtTF15wq4URWbX3TvWe4DOU
Message-ID: <CAMKF1spJxn4gC-bwC+Jdt38R9AUDZ31wK-QCqq5MP2LNApeeEw@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 24/36] python3-jsonpatch: Upgrade 1.33
 -> 1.36
To: leon.anavi@konsulko.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c46fc9065e62a615"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 00:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131305

--000000000000c46fc9065e62a615
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am seeing this warning

stdio: WARNING: python3-jsonpatch-1.36-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml specifying backend
setuptools.build_meta, use the correct class [pep517-backend]

Please take a look.

On Wed, Oct 21, 2026 at 4:01=E2=80=AFAM Leon Anavi via lists.openembedded.o=
rg
<leon.anavi=3Dkonsulko.com@lists.openembedded.org> wrote:

> Upgrade to release 1.36:
>
> - Honor optimization=3DFalse when generating patches
> - Preserve the original file when in-place CLI replacement fails
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>  .../{python3-jsonpatch_1.33.bb =3D> python3-jsonpatch_1.36.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-devtools/python/{python3-jsonpatch_1.33.bb =
=3D>
> python3-jsonpatch_1.36.bb} (80%)
>
> diff --git a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.b=
b
> b/meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
> similarity index 80%
> rename from meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
> rename to meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
> index 6a1715c6df..3107eddb52 100644
> --- a/meta-python/recipes-devtools/python/python3-jsonpatch_1.33.bb
> +++ b/meta-python/recipes-devtools/python/python3-jsonpatch_1.36.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3D4f81c84f9a053e31fe9402a2a4e78864"
>
>  inherit pypi setuptools3
>
> -SRC_URI[sha256sum] =3D
> "9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee731d004e212e1ee5030c"
> +SRC_URI[sha256sum] =3D
> "7e110cb3c5a1c8768f7170bf8fb9887c4aa575fba74c95239e868b494bd9a522"
>
>  RDEPENDS:${PN} +=3D " \
>      python3-json \
> --
> 2.47.3
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#131283):
> https://lists.openembedded.org/g/openembedded-devel/message/131283
> Mute This Topic: https://lists.openembedded.org/mt/121864686/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c46fc9065e62a615
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am seeing this warning<div><br></div><div>stdio: WARNING=
: python3-jsonpatch-1.36-r0 do_check_backend: QA Issue: inherits setuptools=
3 but has pyproject.toml specifying backend setuptools.build_meta, use the =
correct class [pep517-backend]<br></div><div><br></div><div>Please take a l=
ook.</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Wed, Oct 21, 2026 at 4:01=E2=80=AFAM Leo=
n Anavi via <a href=3D"http://lists.openembedded.org">lists.openembedded.or=
g</a> &lt;leon.anavi=3D<a href=3D"mailto:konsulko.com@lists.openembedded.or=
g">konsulko.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Upgrade to release 1.36:<br>
<br>
- Honor optimization=3DFalse when generating patches<br>
- Preserve the original file when in-place CLI replacement fails<br>
<br>
Signed-off-by: Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsulko.com" ta=
rget=3D"_blank">leon.anavi@konsulko.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-jsonpatch_1.33.bb" rel=3D"noreferrer" =
target=3D"_blank">python3-jsonpatch_1.33.bb</a> =3D&gt; <a href=3D"http://p=
ython3-jsonpatch_1.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-json=
patch_1.36.bb</a>}=C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"http://python3=
-jsonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_=
1.33.bb</a> =3D&gt; <a href=3D"http://python3-jsonpatch_1.36.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-jsonpatch_1.36.bb</a>} (80%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1=
.33.bb</a> b/meta-python/recipes-devtools/python/<a href=3D"http://python3-=
jsonpatch_1.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1=
.36.bb</a><br>
similarity index 80%<br>
rename from meta-python/recipes-devtools/python/<a href=3D"http://python3-j=
sonpatch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.=
33.bb</a><br>
rename to meta-python/recipes-devtools/python/<a href=3D"http://python3-jso=
npatch_1.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.36=
.bb</a><br>
index 6a1715c6df..3107eddb52 100644<br>
--- a/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.33.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.33.bb<=
/a><br>
+++ b/meta-python/recipes-devtools/python/<a href=3D"http://python3-jsonpat=
ch_1.36.bb" rel=3D"noreferrer" target=3D"_blank">python3-jsonpatch_1.36.bb<=
/a><br>
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D4f81c84f9a0=
53e31fe9402a2a4e78864&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-SRC_URI[sha256sum] =3D &quot;9fcd4009c41e6d12348b4a0ff2563ba56a2923a7dfee7=
31d004e212e1ee5030c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;7e110cb3c5a1c8768f7170bf8fb9887c4aa575fba74c9=
5239e868b494bd9a522&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0python3-json \<br>
-- <br>
2.47.3<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#131283): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/131283" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/131283</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121864686/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121864686/1997914</a><br>
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

--000000000000c46fc9065e62a615--
