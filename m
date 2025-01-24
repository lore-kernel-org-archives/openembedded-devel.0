Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE553C02181
	for <webhook@archiver.kernel.org>; Fri, 24 Jan 2025 17:12:34 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.17925.1737738749137170816
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Jan 2025 09:12:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i1rVpnON;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29f7b5fbc9aso856353fac.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 09:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737738748; x=1738343548; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tfh+qmzr0QwZztXHe33UDO9Z5HQ3636ZBFAH/5R6cU8=;
        b=i1rVpnONQpiYQKBS6shmRyA78g9MgiEpIsX03+e7lGBitYytR16lEcQG50IAaFxfol
         6BYdV1cCE+w6wOToP9R2cbKLrmeTo+IDvRtMC1WWi3RkTh75REGxB1iwS0hZ9umNLGbB
         ncMdGVNIDc5EdbTQZ6jhl5R4OBvZlbOoZmVlOs7Z7nJHLAAYYUPCrnuW/WsLI3XEjsiV
         RMqomSX1C/Zk0eYnJm8L1mM0lHF4B66LLugofTUk2W7NmiSkEoLTS8EpVh5dX3PftI9d
         FrRd/h8VCDwnyi9SLl+Vb+QJVy4xqdMwA3NisMrUd1iBG1khk3ge1wUWfdpof68VAzzS
         MmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737738748; x=1738343548;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tfh+qmzr0QwZztXHe33UDO9Z5HQ3636ZBFAH/5R6cU8=;
        b=MLo2i8ZZhgJAr3cJANdsQF0I7hOVk1f5eo5U6tfX/hhmlI/OiqY0EbDJHrNFABcmBT
         7AkefxhMnWafr3ceGm2HKc3yvp4gDYbS8zi2ROkuLUevTmKXfTLjrWBVMCqLk0VwriND
         CJBn8aymu+PM45gzt2e/h6j5mBFbpTsHenP/IHUkuGHnt1f6tO3Lmd7XMnq6ek15TZGy
         8CIlyGKCI9JgsIcd2sh7CXi9HBWIJ4RvVNSD2bq0kH3ZZebZjkbJL5upbE74SoKs0lpk
         Nmq/q815N8uu2kOyNvx1p6gBkwytnxWbB/z6ByY+ZXm/K8R51nNmkGZP2c7c17cWzMBN
         i/xw==
X-Gm-Message-State: AOJu0YwPc7HCFeF3Chg0ZDlpBXMonBzvBjFK5r5szXijr6SPpH6jpB7w
	+hQjuw5pYAJc3ulO/Nzi3X7Hh9DhoQg1JTS5CZ/ZgTUelSVaDnKhkBZ9xmdKCwWFBFJ95CooYOE
	cT7moFwItECThTJUZLOIuRTmcVDo=
X-Gm-Gg: ASbGncuE3t1xMOzR/ljDt6vdK8KrVwIiQLfcngIoNZ5GUX30cI3sDP1yltjVtUbFl2O
	IizIgyfHhwNxajnG9nbvFNssEAza85kU5vZizWsWpGOaQem5nJFRIzUKxKXEFtM80H/hfsA5rVa
	CgR/jwCG/kmsol8qB4gg==
X-Google-Smtp-Source: AGHT+IEyybFK/roUUQUUiT9TIvXG5Ojb/ZVq77YB2P9S9YyFvzQeWM8NBAfVpmrqQL92am2ymH8EiPKi7LUB9mWA3P0=
X-Received: by 2002:a05:6871:a917:b0:296:c3cf:39ed with SMTP id
 586e51a60fabf-2b1c0ce70a4mr17172608fac.38.1737738748298; Fri, 24 Jan 2025
 09:12:28 -0800 (PST)
MIME-Version: 1.0
References: <20250124143401.1635224-1-ross.burton@arm.com> <20250124143401.1635224-4-ross.burton@arm.com>
In-Reply-To: <20250124143401.1635224-4-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jan 2025 09:12:17 -0800
X-Gm-Features: AWEUYZkEoVmo1X5TiQ1hGzjiaWX26fBp8HQpAL2k56cLJ6_8AwBm1ntbxmHE2ws
Message-ID: <CAMKF1sqVG+O1-5M611OipKDkLB37XSfG3o8Z1d7tvWex-spQbw@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/4] ntp: set CONFIG_SITE in do_compile
To: ross.burton@arm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ce2666062c76d4b2"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jan 2025 17:12:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115067

--000000000000ce2666062c76d4b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 24, 2025 at 6:34=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:

> Recent changes in to the autotools class in core means that it no longer
> sets CONFIG_SITE for compile tasks.  However, ntp decides to reconfigure
> itself mid-build, so the CONFIG_SITE values are lost.
>

This looks ok but larger question is have we looked at other recipes which
maybe doing this eg I remember gcc and binutils do call configure scripts
doing make

What is the advantage of hiding site config from compile tasks ?

>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
> b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
> index 302cf9915f..6fae993482 100644
> --- a/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
> +++ b/meta-networking/recipes-support/ntp/ntp_4.2.8p18.bb
> @@ -55,6 +55,11 @@ CVE_STATUS_NTP =3D " \
>
>  inherit autotools update-rc.d useradd systemd pkgconfig
>
> +# For some reason this recipe reconfigures the nested configure.ac files
> in
> +# do_compile because libtool.m4 is newer than aclocal.m4, and that then
> +# doesn't know about the site configuration.
> +do_compile[prefuncs] +=3D "autotools_sitefiles"
> +
>  # The ac_cv_header_readline_history is to stop ntpdc depending on either
>  # readline or curses
>  EXTRA_OECONF +=3D "--with-net-snmp-config=3Dno \
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115065):
> https://lists.openembedded.org/g/openembedded-devel/message/115065
> Mute This Topic: https://lists.openembedded.org/mt/110790899/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ce2666062c76d4b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 24, 2025 at 6:34=E2=80=AFAM=
 Ross Burton via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.o=
rg">arm.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Recent changes in to the autotools class in core means that =
it no longer<br>
sets CONFIG_SITE for compile tasks.=C2=A0 However, ntp decides to reconfigu=
re<br>
itself mid-build, so the CONFIG_SITE values are lost.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">This looks ok bu=
t larger question is have we looked at other recipes which maybe doing this=
 eg I remember gcc and binutils do call configure scripts doing make=C2=A0<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">What is the advantage of=
 hiding site config from compile tasks ?</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
"><br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.com" targe=
t=3D"_blank">ross.burton@arm.com</a>&gt;<br>
---<br>
=C2=A0meta-networking/recipes-support/ntp/<a href=3D"http://ntp_4.2.8p18.bb=
" rel=3D"noreferrer" target=3D"_blank">ntp_4.2.8p18.bb</a> | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta-networking/recipes-support/ntp/<a href=3D"http://ntp_4.2.=
8p18.bb" rel=3D"noreferrer" target=3D"_blank">ntp_4.2.8p18.bb</a> b/meta-ne=
tworking/recipes-support/ntp/<a href=3D"http://ntp_4.2.8p18.bb" rel=3D"nore=
ferrer" target=3D"_blank">ntp_4.2.8p18.bb</a><br>
index 302cf9915f..6fae993482 100644<br>
--- a/meta-networking/recipes-support/ntp/<a href=3D"http://ntp_4.2.8p18.bb=
" rel=3D"noreferrer" target=3D"_blank">ntp_4.2.8p18.bb</a><br>
+++ b/meta-networking/recipes-support/ntp/<a href=3D"http://ntp_4.2.8p18.bb=
" rel=3D"noreferrer" target=3D"_blank">ntp_4.2.8p18.bb</a><br>
@@ -55,6 +55,11 @@ CVE_STATUS_NTP =3D &quot; \<br>
<br>
=C2=A0inherit autotools update-rc.d useradd systemd pkgconfig<br>
<br>
+# For some reason this recipe reconfigures the nested <a href=3D"http://co=
nfigure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a> files in<=
br>
+# do_compile because libtool.m4 is newer than aclocal.m4, and that then<br=
>
+# doesn&#39;t know about the site configuration.<br>
+do_compile[prefuncs] +=3D &quot;autotools_sitefiles&quot;<br>
+<br>
=C2=A0# The ac_cv_header_readline_history is to stop ntpdc depending on eit=
her<br>
=C2=A0# readline or curses<br>
=C2=A0EXTRA_OECONF +=3D &quot;--with-net-snmp-config=3Dno \<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#115065): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/115065" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/115065</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/110790899/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/110790899/1997914</a><br>
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

--000000000000ce2666062c76d4b2--

