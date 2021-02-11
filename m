Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.899.1613070515381384201
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Feb 2021 11:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=koSzSF0G;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id t63so6335945qkc.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Feb 2021 11:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v1RMLAftMVN9ttGGIsQNHPxbkOHP3AG7xFezhKkSM/0=;
        b=koSzSF0GTWEhWIao0s48OFX9Km+vxjLhdBpCR789xNM9VCTpP4Ao19V3n3qT5wkmnA
         6FjJo+wdwzYUrsclZM6GEwXClEE2WlS8TV2m94F+KtxKjoB3EQyBwQg9GZKQSN1sq15w
         lNMckkK3nRvU0SrmjbUqtIkmhCFn2LOIYgNpoZuOreRQMGBUYIBnd2TLyxprn43qf8Ff
         6GvQY0ghAxQxkwVeMrLPcnpZtTRWN3Ou+wwBfIeM8MmLYsDDY8iR4wqKi8maHNY+q7Qy
         0r8obViUB75wRsLUmp85QDpodnjfet7CINYKERPKk+N7R6oOJ3GdtUtr58EUMvrwGFFW
         NBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v1RMLAftMVN9ttGGIsQNHPxbkOHP3AG7xFezhKkSM/0=;
        b=erBuIAumF6ed1HpRRsO9NvGYRFwwZRSai4bprJbwb7/UYSMqQ8djfvTSQL8mezXhMw
         RV3c2pUJMvi2KNU0OG7eqpdxEViJUmQn1MzZOA8Tnm95kXXam6bZeAT9XEUy2tuQ9aDp
         nUiasgx5BDnuy+qCoQc9Fxqf97RJtYlsDokwqhNYA54T5jTn/MzEuDuuc5Zj4Rzbrz1Q
         mNHZaUZE7T93KAAUgPA7ad/wsiuaVQHrqbnPMszAslSAv54rKU4BENu48tgmSerlA7BZ
         VJLhNJkruq6AV3tWg8zL77+qlQJ7C8ix32hBfRGJvuvl+EQxDQChi4uzZSbv/l4Oj8W6
         buXQ==
X-Gm-Message-State: AOAM530TOi6WC149liwrRB2l1MhPy1XEjipLSkRJFQh+84pnnKTtmtA9
	Vns+RMARIDKjoyBI2k+PRn37Q31IdKj8OECKJ+OwZ/PTMl8=
X-Google-Smtp-Source: ABdhPJz4frmgATdRiw2PqdZFuf4AYxo5n51OhH3fZcNQAVRrVttNx06uHwxtxfnCPcwLjdXGwIDpXIa0lKajJANVv94=
X-Received: by 2002:a05:620a:2211:: with SMTP id m17mr9808868qkh.9.1613070514477;
 Thu, 11 Feb 2021 11:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20210211184415.2232107-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210211184415.2232107-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Feb 2021 11:08:23 -0800
Message-ID: <CAMKF1sqLzJhJDQhYWpbRqOsWvKKYE0evzsezXU8yiNdUKKAMiA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] ceres-solver: update to 2.0.0
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000035d1805bb143f35"

--000000000000035d1805bb143f35
Content-Type: text/plain; charset="UTF-8"

I see that license Added are apache and MIT for those files should this
reflect in recipe as well perhaps yes

On Thu, Feb 11, 2021 at 10:44 AM Oleksandr Kravchuk <
open.source@oleksandr-kravchuk.com> wrote:

> License-Update: license of subcomponent was added:
> https://github.com/ceres-solver/ceres-solver/commits/master/LICENSE
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  .../{ceres-solver_1.14.0.bb => ceres-solver_2.0.0.bb}         | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-support/ceres-solver/{ceres-solver_1.14.0.bb =>
> ceres-solver_2.0.0.bb} (92%)
>
> diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
> b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
> similarity index 92%
> rename from meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
> rename to meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
> index ac463038a..28d0868c4 100644
> --- a/meta-oe/recipes-support/ceres-solver/ceres-solver_1.14.0.bb
> +++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.0.0.bb
> @@ -2,12 +2,12 @@ DESCRIPTION = "Ceres Solver is an open source C++
> library for modeling and solvi
>  AUTHOR = "Sameer Agarwal and Keir Mierle and Others"
>  HOMEPAGE = "http://ceres-solver.org/"
>  LICENSE = "BSD-3-Clause"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=35e00f0c4c96a0820a03e0b31e6416be"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=bb761279816b72be19d7ce646e4e2a14"
>
>  DEPENDS = "libeigen glog"
>
>  SRC_URI = "git://github.com/ceres-solver/ceres-solver.git"
> -SRCREV = "facb199f3eda902360f9e1d5271372b7e54febe1"
> +SRCREV = "399cda773035d99eaf1f4a129a666b3c4df9d1b1"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> 
>
>

--000000000000035d1805bb143f35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div dir=3D"auto">I see that license Added are apache and MI=
T for those files should this reflect in recipe as well perhaps yes=C2=A0</=
div><div dir=3D"auto"><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Feb 11, 2021 at 10:44 AM Oleksandr K=
ravchuk &lt;<a href=3D"mailto:open.source@oleksandr-kravchuk.com">open.sour=
ce@oleksandr-kravchuk.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">License-Update: license of subcomponent was added:<br>
<a href=3D"https://github.com/ceres-solver/ceres-solver/commits/master/LIC=
ENSE" rel=3D"noreferrer" target=3D"_blank">https://github.com/ceres-solver/=
ceres-solver/commits/master/LICENSE</a><br>
<br>
Signed-off-by: Oleksandr Kravchuk &lt;<a href=3D"mailto:open.source@oleksa=
ndr-kravchuk.com" target=3D"_blank">open.source@oleksandr-kravchuk.com</a>&=
gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://ceres-solver_1.14.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">ceres-solver_1.14.0.bb</a> =3D&gt; <a href=3D"http://ceres-=
solver_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ceres-solver_2.0.0.bb=
</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/ceres-solver/{<a href=3D"http://ceres=
-solver_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">ceres-solver_1.14.0=
.bb</a> =3D&gt; <a href=3D"http://ceres-solver_2.0.0.bb" rel=3D"noreferrer"=
 target=3D"_blank">ceres-solver_2.0.0.bb</a>} (92%)<br>
<br>
diff --git a/meta-oe/recipes-support/ceres-solver/<a href=3D"http://ceres-=
solver_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">ceres-solver_1.14.0.=
bb</a> b/meta-oe/recipes-support/ceres-solver/<a href=3D"http://ceres-solve=
r_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ceres-solver_2.0.0.bb</a><=
br>
similarity index 92%<br>
rename from meta-oe/recipes-support/ceres-solver/<a href=3D"http://ceres-s=
olver_1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">ceres-solver_1.14.0.b=
b</a><br>
rename to meta-oe/recipes-support/ceres-solver/<a href=3D"http://ceres-sol=
ver_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ceres-solver_2.0.0.bb</a=
><br>
index ac463038a..28d0868c4 100644<br>
--- a/meta-oe/recipes-support/ceres-solver/<a href=3D"http://ceres-solver_=
1.14.0.bb" rel=3D"noreferrer" target=3D"_blank">ceres-solver_1.14.0.bb</a><=
br>
+++ b/meta-oe/recipes-support/ceres-solver/<a href=3D"http://ceres-solver_=
2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">ceres-solver_2.0.0.bb</a><br=
>
@@ -2,12 +2,12 @@ DESCRIPTION =3D &quot;Ceres Solver is an open source C++=
 library for modeling and solvi<br>
=C2=A0AUTHOR =3D &quot;Sameer Agarwal and Keir Mierle and Others&quot;<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://ceres-solver.org/" rel=3D"noref=
errer" target=3D"_blank">http://ceres-solver.org/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;BSD-3-Clause&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D35e00f0c4c96a0820a03e0b31=
e6416be&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dbb761279816b72be19d7ce646=
e4e2a14&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot;libeigen glog&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/ceres-solver/ce=
res-solver.git" rel=3D"noreferrer" target=3D"_blank">github.com/ceres-solve=
r/ceres-solver.git</a>&quot;<br>
-SRCREV =3D &quot;facb199f3eda902360f9e1d5271372b7e54febe1&quot;<br>
+SRCREV =3D &quot;399cda773035d99eaf1f4a129a666b3c4df9d1b1&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div></div>

--000000000000035d1805bb143f35--
