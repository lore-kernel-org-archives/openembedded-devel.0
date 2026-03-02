Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21528EA4E23
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 15:26:36 +0000 (UTC)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.163006.1772465192428091829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 07:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BFkBxRt4;
 spf=pass (domain: gmail.com, ip: 74.125.224.43, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ad019bbd4so3956686d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 07:26:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772465191; cv=none;
        d=google.com; s=arc-20240605;
        b=OjFsTIyOm77eXtx7Nr6ePyyNNeN+VymsZGGDQ/MnU3CaCRri82Xb9zqJjR7waFjfso
         R20PV9kFDlt78swmRZc+bZs5VIygTJuUJbdQ8gJHD3HC8Qa6fpe0FFSi6oSQ4sWny5CT
         ZQ8Esk6+QeD7IkDeU1/lFip/iXIMORQyy1WUTwAUMNj0OjijNwQSHke8jeutYw6QQ2Mx
         6h2vLmTy+9h8ZONSzc+zsqh35yKSjEsjkOBHLhSS9CwbuMN26ad9qBAM7ZsLRLOUUWwC
         2M0WQQ6hfQ1y9D1CpS4We77aNLFEyF1GUSHfCyhgj5+VUCESja7bXeBsjDs80cyjaXrT
         abSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PAXsaqzHyGtx/09edCAWWkZVMYYWs2IGgf5XA93mKxU=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=Gh9z4K/bFuCxjO0WcguKj3HIWH2wO3Al5K5apjW47PooV4gqCd9YsuIYz8/gYt8V5W
         fFnem8JSi8dakbcIvTFgQWpplySHQcdALu1A3TbN6T07XNsLSFOEFyj2Or0elJaevZby
         IMqQxLJzZMDmsrvY7IIkiWsN8+nkfvA8lWWM8sElhctycXm2AWuBB2uLKY6UVoGMx1tR
         xqFNFOdg1Qi4onDpV1JSe9K0oOgl4SlbmDY6rm4LcPlPBuUvhkaH3cyva1Sj3vFQAqyX
         9W5reyAM61V5LmFIpkUZuGWriCcy0FbYFRcmwWcs+/PmfQvD7SEnpedUGBKyrCYOe1Co
         WtBA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772465191; x=1773069991; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PAXsaqzHyGtx/09edCAWWkZVMYYWs2IGgf5XA93mKxU=;
        b=BFkBxRt42gDUWQwpS6++rr5FzhhzB9oIydfL4ArKqhboEjCzzEHTyfA5620lxAfnDw
         d81UgnioOZOvC1wU7vXKssnE9pc4efLiW+7Iau1V4xOIW12riP3lwfHXiGObz4AWI3Z1
         KQ8uFkqTYqsCh9bx85axSNINW73gLFKB84mSHVnicre7mjKmDaUiZQG8q8p1ouDvztNa
         thYdS7u+qD70oyKdsDjAXKLIuJCiqXhr9bZUKITXtuK3tLoz9fWLOp7DWmLAcHmTTckC
         P62Ietkxm3gy2XU7fWff6gFB7s2ikGWDg3V76VauYiGIT4oiKgTXvsZIg+a731/TDxcQ
         gU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772465191; x=1773069991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAXsaqzHyGtx/09edCAWWkZVMYYWs2IGgf5XA93mKxU=;
        b=j/1WfQXdz7RApHCq3OJlMoNyCcjLld4t92TRIQ3WTTsDgE6xdHHEQB7aukK9dHX/Ht
         X3UnD3WLCTM7hKMfzhly9NP8nD6s/nCUFy+YQ8Weuk6OR26n14383uyxQhdGANtVAZUA
         AZau0Ws/T7Cq2rAVob7XX4iXabGNHk2bbIeDWOJ2Rg6WMsepjqQRUdJUCsAmtSz5er8H
         mnz/sIKqTPK2S67G/9SHk3lIykoHON7plgZNJ2yGGrnERtWOaM8ql84STb+LuW6cGFga
         i5idmiao8f8Al2EnbbeOe5g4LW5UKyVXLVt6asEDH/NUu1KgwxH/ImNCp4wRRd8Yk6oX
         FVWw==
X-Gm-Message-State: AOJu0YwN8GiT/pJdAOiEkuq303idQ9QDzcBHT6vN45Usblg3PtQAKWg/
	4nlrVz/mVfAePTA5oaauQUk1vlo5PhfW/VferPpYaXgZ+3wzgElx49QGkMLD9m4Yv3rghznRaaH
	wxRbdSsHrMMGZxuMi+5ZBoBX5bBySGC0=
X-Gm-Gg: ATEYQzx3rTbIom8iK/pa6VgcgcIeSNHBFUZgWqML1PeeRhI6M0KLsQXYZ+0o8Bu/L9o
	8eTdv4S0p48M7K00eg2CAuYu61n3JA/z4+/chjSRj9+s0rLPGUtVDawc84dbmS88q8E4tih7wjh
	qRFKelAFp0/VP4nP1LbZscZ/mqJ6USqy7Ef1cqEzV7Jsm0Yj/ojkACE9rviE6nAq+RLHyfrLQKk
	605Wk6ILdIMkDIrC/D7ouI/CyzWWpNXGykcVR0RNbcp89BtsWurPLBq8sWlivA2g2vswJiy2pv/
	8uBN/gpg7EYEvx/q6Wx15B9HYJBwAwDjh7VdizT9JIf8OMDfByYggEnbivEqFb0THRfTdJ3IGpY
	OsEa5Wt9LaoG81IbkeMfyLO5uB7+ChdQlmxA=
X-Received: by 2002:a53:ac9d:0:b0:64c:e749:15e9 with SMTP id
 956f58d0204a3-64ce749196bmr995235d50.68.1772465191223; Mon, 02 Mar 2026
 07:26:31 -0800 (PST)
MIME-Version: 1.0
References: <20260227101327.1432-1-wangmy@fujitsu.com> <20260227101327.1432-47-wangmy@fujitsu.com>
In-Reply-To: <20260227101327.1432-47-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Mar 2026 07:26:04 -0800
X-Gm-Features: AaiRm50AZI646he0H9nh3JGgpr-v1c3nODSOfr3kg1O9P7iaemRGdaHKW4qFi1Y
Message-ID: <CAMKF1sqLB2woUFbQj8cw9Eh0o0=jEWxQjC68d9KQeeBa6TFMeg@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH 47/52] valijson: upgrade 1.0.6 -> 1.1.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001987f3064c0c36e5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 15:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124814

--0000000000001987f3064c0c36e5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This causes sysdig build failure

../recipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:241:24:
error: no template named 'optional' in namespace 'std'
  241 |             const std::optional<Array> array =3D
m_value.getArrayOptional();
      |                   ~~~~~^
../recipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:259:24:
error: no template named 'optional' in namespace 'std'
  259 |             const std::optional<Object> object =3D
m_value.getObjectOptional();
      |                   ~~~~~^
../recipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:501:28:
error: no template named 'optional' in namespace 'std'
  501 |                 const std::optional<ArrayType> array =3D
m_value.getArrayOptional();
      |                       ~~~~~^
../recipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:511:28:
error: no template named 'optional' in namespace 'std'
  511 |                 const std::optional<ObjectType> object =3D
m_value.getObjectOptional();
      |                       ~~~~~^
../recipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:540:14:
error: no member named 'optional' in namespace 'std'
  540 |         std::optional<ArrayType> arrayValue =3D
m_value.getArrayOptional();
      |              ^~~~~~~~
../recipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:540:23:
error: 'ArrayType' does not refer to a value
  540 |         std::optional<ArrayType> arrayValue =3D
m_value.getArrayOptional();
      |                       ^
../recipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:79:14:
note: declared here
   79 |     typename ArrayType,
      |              ^
../recipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:540:34:
error: use of undeclared identifier 'arrayValue'; did you mean
'Json::arrayValue'?
  540 |         std::optional<ArrayType> arrayValue =3D
m_value.getArrayOptional();
      |                                  ^~~~~~~~~~
../recipe-sysroot/usr/include/json/value.h:115:3: note: 'Json::arrayValue'
declared here
  115 |   arrayValue,    ///< array value (ordered list)
      |   ^


here is full log

https://termbin.com/y3j0

On Fri, Feb 27, 2026 at 2:15=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Issues fixed in this release:
> -----------------------------
> Update bundle.sh to include regex.hpp
> Fix copy-paste error message
> Ensure nlohmann/json non-finite floats are interpreted as null when
> validating
> Ensure tests are built in oss-fuzz build
>
> Other changes include:
> ----------------------
> Added support for JSON pointer paths in validation errors
> Added a validation benchmark example
> Added design and architecture docs
> Removed compatibility shim for std::optional
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../valijson/{valijson_1.0.6.bb =3D> valijson_1.1.0.bb}           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-devtools/valijson/{valijson_1.0.6.bb =3D>
> valijson_1.1.0.bb} (93%)
>
> diff --git a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
> b/meta-oe/recipes-devtools/valijson/valijson_1.1.0.bb
> similarity index 93%
> rename from meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
> rename to meta-oe/recipes-devtools/valijson/valijson_1.1.0.bb
> index 4e5f02746c..b7e45c3057 100644
> --- a/meta-oe/recipes-devtools/valijson/valijson_1.0.6.bb
> +++ b/meta-oe/recipes-devtools/valijson/valijson_1.1.0.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D5c4583a434195e4f3b418e17c8ca2=
daf"
>
>  SRC_URI =3D "git://
> github.com/tristanpenman/valijson.git;branch=3Dmaster;protocol=3Dhttps;ta=
g=3Dv${PV}
> <http://github.com/tristanpenman/valijson.git;branch=3Dmaster;protocol=3D=
https;tag=3Dv$%7BPV%7D>
> "
> -SRCREV =3D "4edda758546436462da479bb8c8514f8a95c35ad"
> +SRCREV =3D "b12841e3fa23a8cc477179face0a5ce5f80b64ab"
>
>
>  inherit cmake
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124747):
> https://lists.openembedded.org/g/openembedded-devel/message/124747
> Mute This Topic: https://lists.openembedded.org/mt/118027942/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001987f3064c0c36e5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This causes sysdig build failure<div><br></div><div>../rec=
ipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:241:24: error: =
no template named &#39;optional&#39; in namespace &#39;std&#39;<br>=C2=A0 2=
41 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const std::optional&lt;Array=
&gt; array =3D m_value.getArrayOptional();<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~^<br>../recip=
e-sysroot/usr/include/valijson/internal/basic_adapter.hpp:259:24: error: no=
 template named &#39;optional&#39; in namespace &#39;std&#39;<br>=C2=A0 259=
 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const std::optional&lt;Object&=
gt; object =3D m_value.getObjectOptional();<br>=C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~^<br>../re=
cipe-sysroot/usr/include/valijson/internal/basic_adapter.hpp:501:28: error:=
 no template named &#39;optional&#39; in namespace &#39;std&#39;<br>=C2=A0 =
501 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const std::op=
tional&lt;ArrayType&gt; array =3D m_value.getArrayOptional();<br>=C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 ~~~~~^<br>../recipe-sysroot/usr/include/valijson/internal/ba=
sic_adapter.hpp:511:28: error: no template named &#39;optional&#39; in name=
space &#39;std&#39;<br>=C2=A0 511 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 const std::optional&lt;ObjectType&gt; object =3D m_value.=
getObjectOptional();<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~~~~~^<br>../recipe-sysroo=
t/usr/include/valijson/internal/basic_adapter.hpp:540:14: error: no member =
named &#39;optional&#39; in namespace &#39;std&#39;<br>=C2=A0 540 | =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 std::optional&lt;ArrayType&gt; arrayValue =3D m_value.=
getArrayOptional();<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0^~~~~~~~<br>../recipe-sysroot/usr/include/valijson/inte=
rnal/basic_adapter.hpp:540:23: error: &#39;ArrayType&#39; does not refer to=
 a value<br>=C2=A0 540 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::optional&lt;Array=
Type&gt; arrayValue =3D m_value.getArrayOptional();<br>=C2=A0 =C2=A0 =C2=A0=
 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ^<br>../recipe-sysroot/usr/include/valijson/internal/basic_adapter.h=
pp:79:14: note: declared here<br>=C2=A0 =C2=A079 | =C2=A0 =C2=A0 typename A=
rrayType,<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^<br>../recipe-sysroot/usr/include/valijson/internal/basic_adapte=
r.hpp:540:34: error: use of undeclared identifier &#39;arrayValue&#39;; did=
 you mean &#39;Json::arrayValue&#39;?<br>=C2=A0 540 | =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 std::optional&lt;ArrayType&gt; arrayValue =3D m_value.getArrayOption=
al();<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0^~~~~~~~~~<br>../recipe-sysroot/usr/include/json/value.h:115:3: note: &#=
39;Json::arrayValue&#39; declared here<br>=C2=A0 115 | =C2=A0 arrayValue, =
=C2=A0 =C2=A0///&lt; array value (ordered list)<br>=C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 ^<br></div><div><br></div><div><br></div><div>here is full log</div>=
<div><br></div><div><a href=3D"https://termbin.com/y3j0">https://termbin.co=
m/y3j0</a></div></div><br><div class=3D"gmail_quote gmail_quote_container">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 27, 2026 at 2:15=E2=80=AF=
AM wangmy via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@lists.openembedded.org">=
fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mailto:w=
angmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Issues fixed in this release:<br>
-----------------------------<br>
Update bundle.sh to include regex.hpp<br>
Fix copy-paste error message<br>
Ensure nlohmann/json non-finite floats are interpreted as null when validat=
ing<br>
Ensure tests are built in oss-fuzz build<br>
<br>
Other changes include:<br>
----------------------<br>
Added support for JSON pointer paths in validation errors<br>
Added a validation benchmark example<br>
Added design and architecture docs<br>
Removed compatibility shim for std::optional<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../valijson/{<a href=3D"http://valijson_1.0.6.bb" rel=3D"noreferrer"=
 target=3D"_blank">valijson_1.0.6.bb</a> =3D&gt; <a href=3D"http://valijson=
_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank">valijson_1.1.0.bb</a>}=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-oe/recipes-devtools/valijson/{<a href=3D"http://valijson_=
1.0.6.bb" rel=3D"noreferrer" target=3D"_blank">valijson_1.0.6.bb</a> =3D&gt=
; <a href=3D"http://valijson_1.1.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>valijson_1.1.0.bb</a>} (93%)<br>
<br>
diff --git a/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_1=
.0.6.bb" rel=3D"noreferrer" target=3D"_blank">valijson_1.0.6.bb</a> b/meta-=
oe/recipes-devtools/valijson/<a href=3D"http://valijson_1.1.0.bb" rel=3D"no=
referrer" target=3D"_blank">valijson_1.1.0.bb</a><br>
similarity index 93%<br>
rename from meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_1.=
0.6.bb" rel=3D"noreferrer" target=3D"_blank">valijson_1.0.6.bb</a><br>
rename to meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_1.1.=
0.bb" rel=3D"noreferrer" target=3D"_blank">valijson_1.1.0.bb</a><br>
index 4e5f02746c..b7e45c3057 100644<br>
--- a/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_1.0.6.bb=
" rel=3D"noreferrer" target=3D"_blank">valijson_1.0.6.bb</a><br>
+++ b/meta-oe/recipes-devtools/valijson/<a href=3D"http://valijson_1.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">valijson_1.1.0.bb</a><br>
@@ -4,7 +4,7 @@ LICENSE =3D &quot;BSD-2-Clause&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D5c4583a434195e4f3b418=
e17c8ca2daf&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/tristanpenman/va=
lijson.git;branch=3Dmaster;protocol=3Dhttps;tag=3Dv$%7BPV%7D" rel=3D"norefe=
rrer" target=3D"_blank">github.com/tristanpenman/valijson.git;branch=3Dmast=
er;protocol=3Dhttps;tag=3Dv${PV}</a>&quot;<br>
-SRCREV =3D &quot;4edda758546436462da479bb8c8514f8a95c35ad&quot;<br>
+SRCREV =3D &quot;b12841e3fa23a8cc477179face0a5ce5f80b64ab&quot;<br>
<br>
<br>
=C2=A0inherit cmake<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124747): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124747" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124747</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118027942/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118027942/1997914</a><br>
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

--0000000000001987f3064c0c36e5--

