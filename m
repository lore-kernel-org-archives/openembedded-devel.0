Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64528109C035
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 16:35:39 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27300.1774456533933619505
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 09:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ALGem2In;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64ae222d87dso56187d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 09:35:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774456533; cv=none;
        d=google.com; s=arc-20240605;
        b=ZZUQqFeUK0wC8ijSzl9JAbb/ML9MJX+s3eLxHxh4TElSM+rnNcbB4V8iv3eHxEnPQa
         U+ACyf1wt36k0NuyBm9uTiYSYQh6tTFI0r6j8RgzgKuf0tOB3rVrNd5S5elPJ2iHILr3
         6/8/rbaaabk73OH1ui3KnV4jdLsDIjt0KoBZlmigRyh9foI+54YkJNNU5VzFoa6D9oe3
         CepV4Tx2ix+7JbBQcsJKUyBwyUEV9f2GhWzeu9awVM/u+ZhcvOnpZFIu4lHJQMNkLhAf
         GCkSoe9jsnbkVAekfzQPK6eV/oR+riCKU9QV/GAdoQ9yjKQWmda6D61nqIHSF92GfQrl
         sdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qvg2xIPEpWWYAmY/gWxROxYYV6nzm1lYZUi5BDeuBz8=;
        fh=/yAcpjFre3t/rDuybaKUwFk6OnOXdn9Uvl6ped7/4tg=;
        b=GYAlIm4BeC288BA1Swouoq1nmoo/kWwN6XWiMNo5Jmxd5aoS6xreSG69O1eGOzk8Tj
         beufQdvPAbS7/45A/1yImphQjCW1w0R3D/SjrJh0Oin6MsiLcU6gKOghVSPzW1aS/oYp
         QcTeJR9aylnyN07FohYXLkBEefupu64HNixLyPc77WR4txgTIcfjRdbhWjThPdvwipL/
         TbSK750pkyiZcUjDHRmPTGTjQOKhMYdoiIk/QeErqfJDibbBABAfTxolQVPOX/Nzbs2F
         Knl9uyTlQ852VRgtTserhEBywwH5ynnELWaAE63mbfT+a8P5W0AQThK+YeXEP84dDu4s
         LYCg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774456533; x=1775061333; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qvg2xIPEpWWYAmY/gWxROxYYV6nzm1lYZUi5BDeuBz8=;
        b=ALGem2InckYMiB2L6IDyfzeupfC2ElnJKux1HBTM4+swYhfzgHK0dDcNF9O6PiGVv+
         V6H4obAzD7+woedExcrJn1ZkdSsyojxztb7MmcZzlGL8XEgP+jj8zcapvUfTnE3R2xT/
         LCkFpmHsctWwE/jX7oKeSAOghA815r31lgK1Pb1Q7zYoOnV6Eh0kUZbn21jkisC8bvZw
         a8ueDBK82PGq0OgpseIToc/OvcTdm2UcJN38MkBWzQc1fYzjDMZ55MYNnf7wrdk9ouYc
         lEPmkUstWpaDKFiZAflSlKIo2Xib6yw4bXdOXNMWxAbpi/BnUFpQ7y5Q7UyfcqjTsAeu
         pOqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774456533; x=1775061333;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvg2xIPEpWWYAmY/gWxROxYYV6nzm1lYZUi5BDeuBz8=;
        b=CKwycHWi0P5L+YMA51wHRToZnBy/RmSdXwCKdEeiL5jrpsCjdRp67dMOkSuH2aaSGh
         NhTY78MW1JVrUWgxMA5FDJK4s//sVJ9+MM5Av3ljQ391mg7DAcNQuYchrOnbrLa8LVvT
         bgxUvqnegZvKWvP1pZpJaK1Y22U1k82cAwvM+Ovszl7SAoRfpTiGrvXFyioQd5s5Qwsv
         6GFq4hRiA53WnTCkB7xpRQXC+EeDgA5YLRqTtGsXvNL35AqVDPpS0/9PLTqfp0c3JK5u
         KhmHobfuaM56HDvUVg5fRDMgXJqm5BHntG8uAArxHc7W3bHIg5FYtKjrcLnvt7fEbFGv
         nMFA==
X-Gm-Message-State: AOJu0YzhIrdcDwtfqjYZbPjEXClsjjKQE72b9noPFPYPeWmuJdBFq6DP
	BW+PErEkqNdEwrLeRznHcJQYUzn/owsaxCxh1N30tgcUPyomdvQMkdFqct7ZUXtHkrX1dWHR1Ep
	mSgqGxG2igVFMVdK1tDZGOVLYRvkh+Ks=
X-Gm-Gg: ATEYQzxjruZdpeFJ3qj3piEwLXIJe4sL6VmYJyhyYfIRjbVFzq4YErMVkRjyHREL3Rf
	Tc57Y9GmHz3b5SGiZQnN5L5Z33e5hOMrjM/pKDiDWPdmNTc3ryPIiifZxziWTpqytrk1kMNxywp
	DgfbywzKQSI3fE40rKHd2AU3yc8V2vU3U97TVt4giMeKxddEMe6diMgc9eLw4J6wNlGH72H7TDG
	3O1LWXK+SKnTUo/zgFfM+9nG7rNeZeh8Bb0QqWNiLFAYc42lyqWhkhaai8obZcQtQz2jpFI4NDC
	nNm3RNTgrjExhoR9wS2qRsTlo05BMUj3gQWQILFcc4uobbNupaIjO2sYvSjdaNreuM6zcPDzONZ
	D6FORnma5yhySjo/HBh7MAi0u
X-Received: by 2002:a05:690e:1283:b0:64d:6bbd:380a with SMTP id
 956f58d0204a3-64ee6083b54mr3629957d50.7.1774456532779; Wed, 25 Mar 2026
 09:35:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260325122046.1211090-1-zboszor@gmail.com> <20260325122046.1211090-4-zboszor@gmail.com>
In-Reply-To: <20260325122046.1211090-4-zboszor@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Mar 2026 09:35:04 -0700
X-Gm-Features: AaiRm52w8_P19QXkdJ8EX7-OV3GEZKu1MBvhaButiTQF0LNaHDoziO46Cqiv5fc
Message-ID: <CAMKF1sqHJVMypXDWmi0=of8V8iy=U287rB23hE5x-8vCYvoBXg@mail.gmail.com>
Subject: Re: [meta-networking][PATCH 03/15] ntpsec: Support Python freethreading
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Trevor Gamblin <tgamblin@baylibre.com>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004e47cd064ddbdbf2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 16:35:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125626

--0000000000004e47cd064ddbdbf2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You forgot to mark this series as RFC since it is dependent upon another
patch series meant for OE-core. Please ping here once the oe-core one is
merged.

On Wed, Mar 25, 2026 at 5:21=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com>
wrote:

> Use PYTHON_MAINVERSION instead of PYTHON_BASEVERSION because
> the former includes PYTHON_ABI. This makes the python module
> to be installed into the correct location.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> index 9704e2d15e..acde62a493 100644
> --- a/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> +++ b/meta-networking/recipes-support/ntpsec/ntpsec_1.2.4.bb
> @@ -50,8 +50,8 @@ CC[unexport] =3D "1"
>  CFLAGS[unexport] =3D "1"
>  LDFLAGS[unexport] =3D "1"
>
> -export PYTHON_VERSION =3D "${PYTHON_BASEVERSION}"
> -export PYTAG =3D "cpython${@ d.getVar('PYTHON_BASEVERSION').replace('.',
> '')}"
> +export PYTHON_VERSION =3D "${PYTHON_MAINVERSION}"
> +export PYTAG =3D "cpython${@ d.getVar('PYTHON_MAINVERSION').replace('.',
> '')}"
>  export pyext_PATTERN =3D "%s.so"
>  export PYTHON_LDFLAGS =3D "-lpthread -ldl"
>
> --
> 2.53.0
>
>

--0000000000004e47cd064ddbdbf2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You forgot to mark this series as RFC since it is dependen=
t upon another patch series meant for OE-core. Please ping here once the oe=
-core one is merged.=C2=A0</div><br><div class=3D"gmail_quote gmail_quote_c=
ontainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 25, 2026 at 5:2=
1=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto:z=
boszor@gmail.com">zboszor@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Use PYTHON_MAINVERSION instead of PYTHON=
_BASEVERSION because<br>
the former includes PYTHON_ABI. This makes the python module<br>
to be installed into the correct location.<br>
<br>
Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi &lt;<a href=3D"mailto=
:zboszor@gmail.com" target=3D"_blank">zboszor@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpse=
c_1.2.4.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a> b/meta=
-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4.bb" rel=
=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
index 9704e2d15e..acde62a493 100644<br>
--- a/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
+++ b/meta-networking/recipes-support/ntpsec/<a href=3D"http://ntpsec_1.2.4=
.bb" rel=3D"noreferrer" target=3D"_blank">ntpsec_1.2.4.bb</a><br>
@@ -50,8 +50,8 @@ CC[unexport] =3D &quot;1&quot;<br>
=C2=A0CFLAGS[unexport] =3D &quot;1&quot;<br>
=C2=A0LDFLAGS[unexport] =3D &quot;1&quot;<br>
<br>
-export PYTHON_VERSION =3D &quot;${PYTHON_BASEVERSION}&quot;<br>
-export PYTAG =3D &quot;cpython${@ d.getVar(&#39;PYTHON_BASEVERSION&#39;).r=
eplace(&#39;.&#39;, &#39;&#39;)}&quot;<br>
+export PYTHON_VERSION =3D &quot;${PYTHON_MAINVERSION}&quot;<br>
+export PYTAG =3D &quot;cpython${@ d.getVar(&#39;PYTHON_MAINVERSION&#39;).r=
eplace(&#39;.&#39;, &#39;&#39;)}&quot;<br>
=C2=A0export pyext_PATTERN =3D &quot;%s.so&quot;<br>
=C2=A0export PYTHON_LDFLAGS =3D &quot;-lpthread -ldl&quot;<br>
<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div>

--0000000000004e47cd064ddbdbf2--

