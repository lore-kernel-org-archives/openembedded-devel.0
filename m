Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078B6E9A052
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 17:09:36 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19147.1771520974339064195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Feb 2026 09:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YeKQGUrx;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso1299408a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 09:09:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771520973; cv=none;
        d=google.com; s=arc-20240605;
        b=guhgqQlNs6W9kEwe54uxVvXizUTRwOMjtYUnoC9B+dsORtlEwQOcNSPAVz0YkbcWKJ
         ox8SryIuluEtfu/xL3DAQCqAyluh4+XfnIt5Fgsmp3uP7R/pZqWMbrT7s0AkFp3wUXfo
         aLnssMncZhjqzrWRIYYtlObYOX6gnm/KFSNXCGYNXGvNgcntsdkmtim7GcJ6tBID8kh7
         wOEBWSpbYg9Y4nYJ2cbbRhFgubOWqHFMbjbZ3UJuIyqMals04a1EqZNVGhfwxpRYQW+H
         8vL0lSC2Gy8vOhd+PKWB+8mSvWrVrw8HuCevgWRpz5A8hY/3n0zFzIq9N++CsbX2Tb/a
         Vu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ifGmec2tUCZGjF5zJG6GPNB5n8e67hdTqv9uxjBeiDs=;
        fh=0BoCo2gaYzbD1zbJySBY1Ze/tAy13qECAGmNsJAAfyY=;
        b=j/YNFvpntaNu3krXrYAY+kqBN2l5huH4ayjc+MY02cXscDv+R1vT56Zrp7xPM9Jt2Z
         RztjdYFuCdg2q5OQCH01ebVrkrvOvDZvrRxe6uHPFr8Dakd3YpHT0GcvUPGyj4JEgjfU
         kwP/3SuXwawPa63sj86AbY97H61sulevwcOqi9jHH47SydEP5NMLyktkqCnarPNCfG7g
         nP6KmhdbbO79fmqT21SdzYHuqz2raCTtSoWdHbxKAjYn/0LlxgzRNRp3vZ+rSgiW37mb
         PV7ITNi/VZ73Sta9jjIMi9jcI7BphishwFB0OSyhyeY89y74Rpo1/lxlutvqDSdvkq1P
         UU/g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771520973; x=1772125773; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ifGmec2tUCZGjF5zJG6GPNB5n8e67hdTqv9uxjBeiDs=;
        b=YeKQGUrxyYHRTNXve8BXqlq5BB48+dTMf6Gpcg9dDUhrhVhrMlzhahIZ+ky3wApQ/z
         z5CQeZOAVXyULg9SkjLXSkAfAMiJz7xsRmNRNKQJBRzClhXTn5wpwlmCnprC1t7U2bfv
         rL1p94WtHUzLTu6CSGMYpFXvWkUo4c8fKjrBmnoFOZryouT+UQLkBKrgAVuvAUwCjCW7
         9f/Rq9bJNecpM9wVSBslCbZlF6aLRYr4TIxmvnjBIWjNWJfc3xPatnzbejuzLOLjFjBc
         1D9nRSpnyntfFketl9g2p3M5mJ9k2eM7Z/TQzSug3Adk3X/v4UShk6HJsi+XArYzAZ5N
         5MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771520973; x=1772125773;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifGmec2tUCZGjF5zJG6GPNB5n8e67hdTqv9uxjBeiDs=;
        b=CcVQ2xfruwm632PyJkCk+Vi2NU6TE3NDHDtS01y9/iTmdaBVa3ktjIdd+7LNJ5e+P7
         fEEB5g6NmF+T/teX9VTWUkSb3GRG3jnC7WafMv0a+3E/+cEXXpnRtWB5va63LaDmLIPQ
         eXgb+DUsIeAQ7wWc3pksqYZiyyenVuIGqexR4uHO6B0Hflyr3jVHruZrxvgfB/YQ50wh
         jqJ2il9ElhkG+/bjVYWDwjfCfXkF5VwURDKMtHtPooKNqp7bX01jgF3idHgSGdQ2xS2E
         V8Oc5cUd37rrxBWvGBYmTlOpVokfrhClJQRQQAc0UiWbjVuyzKc6PRi5doHLbsM0kym3
         0D3g==
X-Gm-Message-State: AOJu0YzfL944QomU+kuHXo+8oA86GLF9PGs+26zWpkCYO6jPaZLBIPtq
	YA6HH5NXUvrs+raXg/jWFJfXF+j7SMzc7b1iS9J8kDwEuPJXDGoHV6RiEd0xNTxtkkyd224OPL5
	+qdpyn5gJLyANh91gBL9gObCzNzbT04A=
X-Gm-Gg: AZuq6aLZ2LI1IJb+xm4zRKqB3jPtTKT8GG8v5GaUD86JWoGf8QZqmdOmpXFzdNLcMqP
	lk9MtHkXFOVUOZf/Iik4fXObzjVdK++2aNw4rfVK6I01yRZeTeA05OenB8BZ6/NwrKzawX4j9Wa
	WIdoNJjXch7Savu0Fo+UQLf0vZT1fdVZum/QMuh1c9IQHD7yAgPwGENkiCgud4IE/0mZ3M3W/AW
	EjnNxBJBTt5JPmzdFGCqzjscUQJm9j2MDnbKxn0gURdvA1z07yxG9YBxSUu3uZV6P6AwAbCIcbH
	ckVomHowZNy2d+iPHHKb
X-Received: by 2002:a17:907:988:b0:b8e:7d43:ede9 with SMTP id
 a640c23a62f3a-b904dea75ffmr216222666b.44.1771520972260; Thu, 19 Feb 2026
 09:09:32 -0800 (PST)
MIME-Version: 1.0
References: <20260219163051.3809204-1-viswanath.kraleti@oss.qualcomm.com>
In-Reply-To: <20260219163051.3809204-1-viswanath.kraleti@oss.qualcomm.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 19 Feb 2026 17:09:21 +0000
X-Gm-Features: AaiRm50VllO2wcvXYwTcAvb3txiP9D8MUd-tzs76K5_9rh4H1GAO7KLkSad35Vc
Message-ID: <CANPvuRnFKX=yP9+_6_VhKGFvrSAACLjDJQW1EPTxs4kXioGZ6w@mail.gmail.com>
Subject: Re: [oe] [OE-core][meta][PATCH] uki.bbclass: make DTB packaging optional
To: viswanath.kraleti@oss.qualcomm.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004388c5064b305ee5"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Feb 2026 17:09:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124511

--0000000000004388c5064b305ee5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Viswanath;

Wrong mailing list, it should be: openembedded-core@lists.openembedded.org

Jose

Viswanath Kraleti via lists.openembedded.org <viswanath.kraleti=3D
oss.qualcomm.com@lists.openembedded.org> escreveu (quinta, 19/02/2026 =C3=
=A0(s)
16:31):

> According to the Unified Kernel Image (UKI) specification [1], including
> a compiled device tree in the .dtb section of a UKI is optional. However,
> the current implementation always packages device trees listed in
> KERNEL_DEVICETREE into the UKI by default. This makes uki.bbclass
> unsuitable for systems that rely on firmware-provided DTBs and do not
> want a DTB embedded in the UKI.
>
> Fix this by introducing a new UKI_DEVICETREE variable to control device
> tree packaging. The dtb section is now populated from UKI_DEVICETREE
> instead of KERNEL_DEVICETREE. Users who do not want DTBs included in the
> UKI can override UKI_DEVICETREE to an empty value from their recipes.
>
> [1] https://uapi-group.org/specifications/specs/unified_kernel_image/
>
> Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
> ---
>  meta/classes-recipe/uki.bbclass | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes-recipe/uki.bbclass
> b/meta/classes-recipe/uki.bbclass
> index ea449540db..326697a066 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -80,6 +80,7 @@ UKI_CONFIG_FILE ?=3D "${UNPACKDIR}/uki.conf"
>  UKI_FILENAME ?=3D "uki.efi"
>  UKI_KERNEL_FILENAME ?=3D "${KERNEL_IMAGETYPE}"
>  UKI_CMDLINE ?=3D "rootwait root=3DLABEL=3Droot"
> +UKI_DEVICETREE ?=3D "${KERNEL_DEVICETREE}"
>  # secure boot keys and cert, needs sbsign-tools-native (meta-secure-core=
)
>  #UKI_SB_KEY ?=3D ""
>  #UKI_SB_CERT ?=3D ""
> @@ -149,8 +150,9 @@ python do_uki() {
>          ukify_cmd +=3D " --cmdline=3D'%s'" % (cmdline)
>
>      # dtb
> -    if d.getVar('KERNEL_DEVICETREE'):
> -        for dtb in d.getVar('KERNEL_DEVICETREE').split():
> +    uki_devicetree =3D d.getVar('UKI_DEVICETREE')
> +    if uki_devicetree:
> +        for dtb in uki_devicetree.split():
>              # DTBs are without sub-directories in deploy_dir
>              dtb_name =3D os.path.basename(dtb)
>              dtb_path =3D "%s/%s" % (deploy_dir_image, dtb_name)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124510):
> https://lists.openembedded.org/g/openembedded-devel/message/124510
> Mute This Topic: https://lists.openembedded.org/mt/117894999/5052612
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000004388c5064b305ee5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Viswanath;<br><br>Wrong mailing list, =
it should be: <a href=3D"mailto:openembedded-core@lists.openembedded.org">o=
penembedded-core@lists.openembedded.org</a><br><br>Jose</div><br><div class=
=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr=
">Viswanath Kraleti via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;viswanath.kraleti=3D<a href=3D"mailto:oss.qualcomm.co=
m@lists.openembedded.org">oss.qualcomm.com@lists.openembedded.org</a>&gt; e=
screveu (quinta, 19/02/2026 =C3=A0(s) 16:31):<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">According to the Unified Kernel Image (UKI) s=
pecification [1], including<br>
a compiled device tree in the .dtb section of a UKI is optional. However,<b=
r>
the current implementation always packages device trees listed in<br>
KERNEL_DEVICETREE into the UKI by default. This makes uki.bbclass<br>
unsuitable for systems that rely on firmware-provided DTBs and do not<br>
want a DTB embedded in the UKI.<br>
<br>
Fix this by introducing a new UKI_DEVICETREE variable to control device<br>
tree packaging. The dtb section is now populated from UKI_DEVICETREE<br>
instead of KERNEL_DEVICETREE. Users who do not want DTBs included in the<br=
>
UKI can override UKI_DEVICETREE to an empty value from their recipes.<br>
<br>
[1] <a href=3D"https://uapi-group.org/specifications/specs/unified_kernel_i=
mage/" rel=3D"noreferrer" target=3D"_blank">https://uapi-group.org/specific=
ations/specs/unified_kernel_image/</a><br>
<br>
Signed-off-by: Viswanath Kraleti &lt;<a href=3D"mailto:viswanath.kraleti@os=
s.qualcomm.com" target=3D"_blank">viswanath.kraleti@oss.qualcomm.com</a>&gt=
;<br>
---<br>
=C2=A0meta/classes-recipe/uki.bbclass | 6 ++++--<br>
=C2=A01 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bbcl=
ass<br>
index ea449540db..326697a066 100644<br>
--- a/meta/classes-recipe/uki.bbclass<br>
+++ b/meta/classes-recipe/uki.bbclass<br>
@@ -80,6 +80,7 @@ UKI_CONFIG_FILE ?=3D &quot;${UNPACKDIR}/uki.conf&quot;<br=
>
=C2=A0UKI_FILENAME ?=3D &quot;uki.efi&quot;<br>
=C2=A0UKI_KERNEL_FILENAME ?=3D &quot;${KERNEL_IMAGETYPE}&quot;<br>
=C2=A0UKI_CMDLINE ?=3D &quot;rootwait root=3DLABEL=3Droot&quot;<br>
+UKI_DEVICETREE ?=3D &quot;${KERNEL_DEVICETREE}&quot;<br>
=C2=A0# secure boot keys and cert, needs sbsign-tools-native (meta-secure-c=
ore)<br>
=C2=A0#UKI_SB_KEY ?=3D &quot;&quot;<br>
=C2=A0#UKI_SB_CERT ?=3D &quot;&quot;<br>
@@ -149,8 +150,9 @@ python do_uki() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ukify_cmd +=3D &quot; --cmdline=3D&#39;%s=
&#39;&quot; % (cmdline)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# dtb<br>
-=C2=A0 =C2=A0 if d.getVar(&#39;KERNEL_DEVICETREE&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dtb in d.getVar(&#39;KERNEL_DEVICETREE&#39=
;).split():<br>
+=C2=A0 =C2=A0 uki_devicetree =3D d.getVar(&#39;UKI_DEVICETREE&#39;)<br>
+=C2=A0 =C2=A0 if uki_devicetree:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dtb in uki_devicetree.split():<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# DTBs are without sub-dire=
ctories in deploy_dir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_name =3D os.path.basena=
me(dtb)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dtb_path =3D &quot;%s/%s&qu=
ot; % (deploy_dir_image, dtb_name)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#124510): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/124510" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/124510</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117894999/505=
2612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117894999/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--0000000000004388c5064b305ee5--

