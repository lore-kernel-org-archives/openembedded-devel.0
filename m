Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ED1C88E4B
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 05:56:03 +0000 (UTC)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14027.1769406958408436074
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 21:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QvtrruTX;
 spf=pass (domain: gmail.com, ip: 209.85.128.174, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78fc4425b6bso34530577b3.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 21:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769406957; cv=none;
        d=google.com; s=arc-20240605;
        b=iyA6b2b/VfAK+vzWmfaGp9SP71EYpVTI/bbm6Ia3AwfUPxZheHMZ6hd4nRbJF8B6ht
         4fhLoxYX4InV0J03g5lr+fM0g0a6lMXEKed5ZtdLtUHw72YPt1KF1nkrjZV5oYUHBF1m
         VY5A+13U9W2yG5oRZwxgQJgnwrxP0dSmYJs1E60+biG1bu1rpgoqKBCiVTZd6V9z5AKc
         0fMSQStDmmpVV/rgXmgxQP1Ii1DoAUCihxScWkeNoCGq7OJ+XPATJ6i2EPZHCgiAZe0T
         7Lpesu4z/JZnZES58ddhTG4zElYjvs3QzC18S+zsOoF59eGt0BIXqGgze4aIVIz0jD/z
         2BkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AIiIdatfRfXjMuuCm8b7sPKsRfGg1sj3WFXUiTscxHY=;
        fh=QFtMqrIdjzOKHaITdvKZ+wpntbozyWF0P4sFxCPpKwk=;
        b=Z7FeVSQsVo26XW/8px0v/spm5qQl1gaPpwTwX4foroJBD4RNMX7nzsaZsv7KZgRYYO
         CGhcmyj+iJhtu0Us9r7HbQOeNMTSp0zMvylaIsVXG99qc9hKy/we8ONSt53twPz49zUi
         AgT93Wh6uDsZlQmC/dlS/2e+AeExki/tEUaXnh0Xj/CtOACzPXdTSmxC5e9B8favA6TE
         t9ZFEigxs8OdpFv/BsgXgG2qe0mXuIipCE06PECbDSdLSRbamHDmQPagLiX3q5KzDse3
         KvQgyvEmdm1BjAf2QGMOX+O5azO40fBLKLxoGBo2aXIDALuww1LSOko6WhiNtRl2EjbQ
         K1Wg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769406957; x=1770011757; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AIiIdatfRfXjMuuCm8b7sPKsRfGg1sj3WFXUiTscxHY=;
        b=QvtrruTX1Ci+nYGnWaVa3Gbu1/58QGBQQ9T0NeFMR+ly28SbGUZgB1uUjLclFAmWhN
         BDi9S9SgeamU037B6wljTLEunUfE8kN4k/eMqIhvKt0wcJ0PtkQgS+TIvV6OZ1mCO6ys
         51NDAiBFvuo6Dr0oPiZaceGvYZ7lTPyxvhOrEQ05lxJe9kV54AwbYsuNBE0/kLaamZqt
         +cnP+yI1yFdks8qBbfzlr8blWvq1//Qacb7Z6+bC5I4TNqADN8GzBGe9npMSwJkNpOeS
         SrjWkW2JvyDQZpWKDIBT8G/KytVNi3zqP+FbOKcxw/aUghRxMRdntDnL5mcCwJfzx+FN
         4zVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769406957; x=1770011757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIiIdatfRfXjMuuCm8b7sPKsRfGg1sj3WFXUiTscxHY=;
        b=pk5r3D15MM9FSej4viBrwXMmQgfqIlnZmMZpRhC8QK+2U+/Ba0x5mXoO7CA0Hy4u41
         zah47APInAUREJuR9Y1NHOdKTUO1c8+Bp1zKPnjZIc92MAj9lLvE6SBpLA7v3LKBsLBG
         9H5nQVRFvAYrLmAA9nuEDHO1WPKAD73e7lT5zhB34HyPgQ0IYW37j44tiPOvyRri/7sH
         7qnsf+UtmuuTwtjvUmXjFS+XeSDEUQtjmfOvaO7nm8NXGxJthwsCumPlTZ17EPmefRnG
         IHQYMLhUkGdxRsDgB+sikcGG9bRYaROR5etCIMNBovXjn25yU9FGauZOUPmlN9KnZ/sy
         EhAA==
X-Gm-Message-State: AOJu0YxNZ8iIVkC3KWtQ3t/plZaYAS4DQWlBJkFNS7w/EaDXazuXduLG
	XFxfEdqzdt/7KijCXXWXN/aQDj/avIMVhL5wmUyMKDX4crkNKZHAhBhvr8UvexUSVvUQ9Hqb3j1
	0XH/JtopOF7rQKUzWIKSl3fRiZz02+b6sktDFlQ74ag==
X-Gm-Gg: AZuq6aKtn6qgubHCYaQwPbxyqeliVhCTeAqwghf3/26+QLCwadara5RSULi18wjPGF4
	U3fNrFujWTfgMDBO7DiMRv8za9Vy+fBXid0k/RjajcdQhVmUBibtL9AxHlVCJ83Jgunw7vXJCEV
	Z8jpsfOQ4M/E3Y4Ni2RIgw1LCM2uFDo0dNnlHfJDlMd4AqpB6G67kzBvnbgnDuWTR1ntn18rxBZ
	8EQ5Yv/SW1WeLO/Xphpqyci9EQUrz59dIAV9iCK+aicKK1+hvfX8ht3ZZGsEzf/zKhcyilCG/xd
	6qvRn4uMbqDY+blH9vS+C0mNC+2Ae2+hSytgGKYprvH1Iem7T/Nk9xX5CNl08Xd+69PSnsAU7FI
	Pr9v5/nWgCs3nw9AiQjDUcIr380AiQZx1efRm5A==
X-Received: by 2002:a05:690c:6986:b0:792:7675:f5bc with SMTP id
 00721157ae682-7945a84fc9emr23536097b3.17.1769406957464; Sun, 25 Jan 2026
 21:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20260123074225.1538346-1-yi.zhao@windriver.com>
In-Reply-To: <20260123074225.1538346-1-yi.zhao@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 Jan 2026 21:55:30 -0800
X-Gm-Features: AZwV_Qi9dqgm7ETSa9GQfGIBMDgDRvwJ8atpVF2r1GbW_LOpKepbHI5ijVN8pPY
Message-ID: <CAMKF1srLXMxMyBB_+SK4oyM22e+ss871=fV-zNz+X++zfvLZCg@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] net-snmp: remove des from default packageconfig
To: yi.zhao@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000029b093064944296f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123849

--00000000000029b093064944296f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this breaks openhpi recipe

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5110186/raw_inlin=
e

On Thu, Jan 22, 2026 at 11:42=E2=80=AFPM Yi Zhao via lists.openembedded.org
<yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:

> The DES algorithm is considered weak and outdated. Remove des from
> default PACKAGECONFIG to disable it.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-protocols/net-snmp/
> net-snmp_5.9.5.2.bb b/meta-networking/recipes-protocols/net-snmp/
> net-snmp_5.9.5.2.bb
> index b7c9607b3b..d467bf56d3 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.9.5.2.bb
> @@ -41,7 +41,7 @@ PARALLEL_MAKE =3D ""
>  CCACHE =3D ""
>  CLEANBROKEN =3D "1"
>
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd=
',
> d)} des smux"
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 systemd=
',
> d)} smux"
>  PACKAGECONFIG[des] =3D "--enable-des, --disable-des"
>  PACKAGECONFIG[elfutils] =3D "--with-elf, --without-elf, elfutils"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6, --disable-ipv6"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123770):
> https://lists.openembedded.org/g/openembedded-devel/message/123770
> Mute This Topic: https://lists.openembedded.org/mt/117414670/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000029b093064944296f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this breaks openhpi recipe=C2=A0<div><br></div><div><a hre=
f=3D"https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5110186/raw_=
inline">https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/5110186/r=
aw_inline</a></div></div><br><div class=3D"gmail_quote gmail_quote_containe=
r"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 22, 2026 at 11:42=E2=
=80=AFPM Yi Zhao via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;yi.zhao=3D<a href=3D"mailto:eng.windriver.com@lists.open=
embedded.org">eng.windriver.com@lists.openembedded.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">The DES algorithm is =
considered weak and outdated. Remove des from<br>
default PACKAGECONFIG to disable it.<br>
<br>
Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@windriver.com" target=
=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.5.2.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.5.2.bb</a> |=
 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://n=
et-snmp_5.9.5.2.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.5.2.b=
b</a> b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-sn=
mp_5.9.5.2.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.5.2.bb</a>=
<br>
index b7c9607b3b..d467bf56d3 100644<br>
--- a/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.5.2.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.5.2.bb</a><b=
r>
+++ b/meta-networking/recipes-protocols/net-snmp/<a href=3D"http://net-snmp=
_5.9.5.2.bb" rel=3D"noreferrer" target=3D"_blank">net-snmp_5.9.5.2.bb</a><b=
r>
@@ -41,7 +41,7 @@ PARALLEL_MAKE =3D &quot;&quot;<br>
=C2=A0CCACHE =3D &quot;&quot;<br>
=C2=A0CLEANBROKEN =3D &quot;1&quot;<br>
<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;ipv6 systemd&#39;, d)} des smux&quot;<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &#=
39;ipv6 systemd&#39;, d)} smux&quot;<br>
=C2=A0PACKAGECONFIG[des] =3D &quot;--enable-des, --disable-des&quot;<br>
=C2=A0PACKAGECONFIG[elfutils] =3D &quot;--with-elf, --without-elf, elfutils=
&quot;<br>
=C2=A0PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6, --disable-ipv6&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#123770): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123770" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/123770</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117414670/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117414670/1997914</a><br>
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

--00000000000029b093064944296f--

