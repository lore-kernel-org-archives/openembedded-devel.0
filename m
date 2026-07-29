Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFEA4C53219
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 00:51:46 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1419.1785286300703085761
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Jul 2026 17:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gmt/sreL;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6685483aad2so479151d50.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Jul 2026 17:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785286299; cv=none;
        d=google.com; s=arc-20260327;
        b=FfdZdKNlg/awsmPrHj/F/NXK+l8m5BjyZVrJ6ewCCYrV3jXmhghUvpa7B02Tn2B4el
         lQuLc5WHM0OzX9GXx+PgOsCvhUJojDDe4KV5ydfoNDOOdALf0tF0AqnfOqeVeapvh8WK
         dDHSK0JRPrP+mXC4fZBkh6J8Q/1UrI7RrgZzVaM/sddn+m/S8TV4zSuVO7SpUVQ7ZbeO
         syVZVdlweOALl3MoYcY+VD4PWnyYKvAOu+9EAQIxWKrIdmYzMApgqGI1VKdKDkr9C8k+
         f2C4Shj3ktB0F/cwrFvHdGpWt2BokGcngyUoLWe2YqdVM6RDuRfz7ZfTcnQ7E3AV81AJ
         +ZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Mld0CcVogtlAXbQwQ+8PjcDEC6LAJ6Aq1Ul0qnL45VM=;
        fh=xc7Pw1C2r64/D3IAczFTr6Vs+3vKL6I7LfJKgO2Lfwc=;
        b=O5JzoPk1vnMjpSPIQhtuoBU7QfO6EounCCk99OsPd8cJ71h/6lDDjZXhT6zuxp3uFa
         MLGmQ3xJQr/6Nhf0Dp7WbQqSpE6oolaI5zTTrm0/s9TiIbz/ppZOjgm/mu2JK/4v5z/W
         s2XDJi60MInSOJeO2j7muIoAnooxVhr5K0u9jkxjNiyWszwUy7sCAN4IVsmpqlYsskRl
         rYrPCw+3E5Bp+gk4gJb7WGXJ7Sd7KibDPX/ptASr0/Bk3iA3+TwBpOCr3JWMWgph3Mbj
         Wu343kkd4xUidTpSUphPje1/A/TFSMQB5NZWY5Qxgf+lfK/sRKE98kO9yDgjPzCjlBS3
         8XeQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785286299; x=1785891099; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mld0CcVogtlAXbQwQ+8PjcDEC6LAJ6Aq1Ul0qnL45VM=;
        b=gmt/sreLFURrMaByK9qo8cq0aDm5mF3Dt6Fjg2DvTYbU3IBohpI1l86B82cqJWmiL7
         GqNmAzyGZRbbVbwSRxq+8k8hMW5h7ptOgDjUwztcVgOx+FEpUbyTFUQh3w3aQGFH8yNY
         Vwp5bSSAgfb8PcT2MLkWsy1ZLmhZniXbWmgBp2D9Y8kIbRc5O2viUX4shySwrDyn6qio
         ny0tI/sNLBtwfPcV0jFQBctSEAzl2dFgvOQ4Yi7/ZfN6zJSj3RnVrOlRAK3yzEuY5JZk
         T5wQN5A+CvN6wD18/mUDz6gSYMRiV8p4tMT/XNtWXh21QcltOknBISOOmEONJNZ7I6ii
         pnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286299; x=1785891099;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Mld0CcVogtlAXbQwQ+8PjcDEC6LAJ6Aq1Ul0qnL45VM=;
        b=KBFlSHvSSXt/zYCMPHE047tcY+8W+ixci/cJwsX2x/FMjYoSXA9Damh2OxGsproOZM
         C7vplvGb47dEYMIZJmYLOseLdhzLxAAIZm43zzy+Tayi6c+7B06dDpzAKpJ+SosR02Dm
         CJ8OYn9Z+Kh3NTOSacftPbfb/slE2yQbLPg55nmqIh1RY0M8EcstgB7sJHYzvQ5WeHIX
         fMGmMGhAKxP0VdKcyMS2FUuAt4ZJ8nQB35Kx2yaEykTJkl9E1xe1pF2htjLcnqWVnWVn
         UW4fEfj6EnzovJLqCZvq2qmBzvo58RQ7JjRF8bjL25Sb6Kobp5ONfOhHsXF1rgouxQoQ
         mA7w==
X-Gm-Message-State: AOJu0YzIyT8ymquAOii4GhitxkvRguoKsZ+CYVBf1w+0ZyzgcdOqRxLE
	ndYzLYV26Hn5bfKD8PrFiauZwcF9H4gzwHJepW6ZQcVf4Wb9ztaBOc0EA5qCV50JLkX97E4yZ6T
	EuOpbvycZOAvwLq/iBSE5YRxrgdYPeI8=
X-Gm-Gg: AR+sD13oQSy/HsD2yVfC6ZZoMPVIBPKl3+dmcR2w2HVOpOHox1lmVHujLsRMCQ6JUhu
	Nl2KWTxr8hq8goXnsszYJBZLoY5Sk4G7djKGcWgq1egI7FY1ojaKgFzgP5wGMDrs/d2RfiCQ11y
	RlnvCiWU+cQdC71T2d/l82Sgn4ar+5dMdHua7PM7DKReb6gTjx6ces3TZAiGA2rPUfdoucUKQR0
	qP9FGK9WjHdePcARds0uPTqe6vgegZT0wyYcLOG0cE1ciJ0Ftitnqpox/xU3RcowykNOLrLnXTK
	nB5fmRN2B6hJzPgSw/GdAcwxsdlDxlc4HC0kYEUP2Xk6AF6MeiNJEnmf0BrB/w/uljMj0D6Ts6v
	zk3TxPu53CQXlNLsIcwMiaIS8WvADERxOIY5+gpD0YOJI0YoQVw91ysPXKr2gKzh/Yj05ywR2Dl
	GbFAZEtYHYFyeDPDCdcsuvnLVJMEmyvfNOHrMyUBpvoA==
X-Received: by 2002:a05:690e:25e6:b0:667:8b91:2419 with SMTP id
 956f58d0204a3-6690587b56cmr1604632d50.96.1785286299519; Tue, 28 Jul 2026
 17:51:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260715103914.2120-1-wangmy@fujitsu.com> <20260715103914.2120-28-wangmy@fujitsu.com>
In-Reply-To: <20260715103914.2120-28-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Jul 2026 17:51:13 -0700
X-Gm-Features: AUfX_mxhE3TCzk8F5tC8PvVMqytG47dsRGHNzKmceTvUiw1rY6HqABbl4yyDzgQ
Message-ID: <CAMKF1soY1LGg-wZNrW=_RJYHn6OSF_bV38h+9bSYwsh3f5U06Q@mail.gmail.com>
Subject: Re: [oe] [meta-python] [PATCH 28/44] python3-thrift: upgrade 0.23.0
 -> 0.24.0
To: wangmy@fujitsu.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b48ea90657b55bd2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 00:51:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128514

--000000000000b48ea90657b55bd2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This has a QA error

stdio: WARNING: python3-thrift-0.24.0-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with
setuptools.build_meta, use the correct class [pep517-backend]


see if you can fix it via a followup on top.

On Wed, Jul 15, 2026 at 3:40=E2=80=AFAM wangmy via lists.openembedded.org <=
wangmy=3D
fujitsu.com@lists.openembedded.org> wrote:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-thrift_0.23.0.bb =3D> python3-thrift_0.24.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-python/recipes-connectivity/python-thrift/{
> python3-thrift_0.23.0.bb =3D> python3-thrift_0.24.0.bb} (85%)
>
> diff --git a/meta-python/recipes-connectivity/python-thrift/
> python3-thrift_0.23.0.bb b/meta-python/recipes-connectivity/python-thrift=
/
> python3-thrift_0.24.0.bb
> similarity index 85%
> rename from meta-python/recipes-connectivity/python-thrift/
> python3-thrift_0.23.0.bb
> rename to meta-python/recipes-connectivity/python-thrift/
> python3-thrift_0.24.0.bb
> index aed56e00e7..f59a38a4eb 100644
> --- a/meta-python/recipes-connectivity/python-thrift/
> python3-thrift_0.23.0.bb
> +++ b/meta-python/recipes-connectivity/python-thrift/
> python3-thrift_0.24.0.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "Python bindings for the Apache Thrift RPC
> system"
>  LICENSE =3D "Apache-2.0"
>  LIC_FILES_CHKSUM =3D
> "file://PKG-INFO;beginline=3D8;endline=3D8;md5=3D7145f7cdd263359b62d342a0=
2f005515"
>
> -SRC_URI[sha256sum] =3D
> "5f43448a92c36ed6a450048355d10e231a1787e4c28965f08fabac0eb978914c"
> +SRC_URI[sha256sum] =3D
> "9ef601c49e988475ff0e741d8e1b45feec23b48514e524341efc274191f1789c"
>
>  inherit pypi setuptools3
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#128201):
> https://lists.openembedded.org/g/openembedded-devel/message/128201
> Mute This Topic: https://lists.openembedded.org/mt/120278938/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b48ea90657b55bd2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This has a QA error<div><pre class=3D"gmail-bb-log-preview=
-contents gmail-select-content gmail-log" style=3D"box-sizing:border-box;fo=
nt-family:SFMono-Regular,Menlo,Monaco,Consolas,&quot;Liberation Mono&quot;,=
&quot;Courier New&quot;,monospace;font-size:0.875em;margin-top:0px;margin-b=
ottom:0px;overflow:auto;padding:9.5px;background-color:rgb(0,0,0);color:rgb=
(238,238,238)"><div class=3D"gmail-logline" style=3D"box-sizing:border-box"=
><span class=3D"gmail-log_o" style=3D"box-sizing:border-box"><span style=3D=
"box-sizing:border-box">stdio: WARNING: python3-thrift-0.24.0-r0 do_check_b=
ackend: QA Issue: inherits setuptools3 but has pyproject.toml with setuptoo=
ls.build_meta, use the correct class [pep517-backend]</span></span></div></=
pre><br class=3D"gmail-Apple-interchange-newline"></div><div>see if you can=
 fix it via a followup on top.</div></div><br><div class=3D"gmail_quote gma=
il_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 15, 2=
026 at 3:40=E2=80=AFAM wangmy via <a href=3D"http://lists.openembedded.org"=
>lists.openembedded.org</a> &lt;wangmy=3D<a href=3D"mailto:fujitsu.com@list=
s.openembedded.org">fujitsu.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &lt=
;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com=
</a>&gt;<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://python3-thrift_0.23.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">python3-thrift_0.23.0.bb</a> =3D&gt; <a href=3D"http://pyt=
hon3-thrift_0.24.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-thrift_=
0.24.0.bb</a>}=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta-python/recipes-connectivity/python-thrift/{<a href=3D"htt=
p://python3-thrift_0.23.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
thrift_0.23.0.bb</a> =3D&gt; <a href=3D"http://python3-thrift_0.24.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-thrift_0.24.0.bb</a>} (85%)<br>
<br>
diff --git a/meta-python/recipes-connectivity/python-thrift/<a href=3D"http=
://python3-thrift_0.23.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-t=
hrift_0.23.0.bb</a> b/meta-python/recipes-connectivity/python-thrift/<a hre=
f=3D"http://python3-thrift_0.24.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-thrift_0.24.0.bb</a><br>
similarity index 85%<br>
rename from meta-python/recipes-connectivity/python-thrift/<a href=3D"http:=
//python3-thrift_0.23.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-th=
rift_0.23.0.bb</a><br>
rename to meta-python/recipes-connectivity/python-thrift/<a href=3D"http://=
python3-thrift_0.24.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-thri=
ft_0.24.0.bb</a><br>
index aed56e00e7..f59a38a4eb 100644<br>
--- a/meta-python/recipes-connectivity/python-thrift/<a href=3D"http://pyth=
on3-thrift_0.23.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-thrift_0=
.23.0.bb</a><br>
+++ b/meta-python/recipes-connectivity/python-thrift/<a href=3D"http://pyth=
on3-thrift_0.24.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-thrift_0=
.24.0.bb</a><br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;Python bindings for the Apache Thrift RPC=
 system&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://PKG-INFO;beginline=3D8;endline=3D8;=
md5=3D7145f7cdd263359b62d342a02f005515&quot;<br>
<br>
-SRC_URI[sha256sum] =3D &quot;5f43448a92c36ed6a450048355d10e231a1787e4c2896=
5f08fabac0eb978914c&quot;<br>
+SRC_URI[sha256sum] =3D &quot;9ef601c49e988475ff0e741d8e1b45feec23b48514e52=
4341efc274191f1789c&quot;<br>
<br>
=C2=A0inherit pypi setuptools3<br>
<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#128201): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/128201" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/128201</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/120278938/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/120278938/1997914</a><br>
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

--000000000000b48ea90657b55bd2--

