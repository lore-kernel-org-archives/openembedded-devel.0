Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4C0C433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 01:02:06 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.3287.1635814923392416130
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 18:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iXX29WmB;
 spf=pass (domain: gmail.com, ip: 209.85.160.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id j1so10330655qtq.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 18:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VcU1kgh4OPRBM/baUtAKg03zaC/G1nkPiVqTv1EZ5Wo=;
        b=iXX29WmBUc+5yAV+vr0fRMZwoTc6mkfYoqMxvfwrEYnrM1WcZ9UtzcKAMur7ExLUeP
         DKUNCM2eHB/y44zml3MjxwjR3biSc8tSFkudf676roosDDEHdTRC9W1fK7q3lRdokvjk
         lth365RKU0D14KLRFasfQsQgVbGHb8VJuoSotbeo9Ao/v5MClp7TOeQIH6+Vx5enhwSY
         2VpT6tPR+RSvmC8NULuXBWmmjDzKeTIn3/g2D5x239q1eoGz1opNrSZ2EKpJFdGgtatJ
         Lsdtny9Ufi3PMFxqv3Ggpm0FOYiHnRmvnMi2o8xgOzFVXTn9yGvdxUcTW1DW+5JuoP5V
         jztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VcU1kgh4OPRBM/baUtAKg03zaC/G1nkPiVqTv1EZ5Wo=;
        b=yLFFe0zhQ72cM9nrtlJ0kumQMAO5RPrKenVZqiNvWdduv9dO5cIUMpZmhD2HiCAbtB
         p8vnvj06CV9FdlcCg+J6cfHOx19w8a9/sL1o/ovLWIGF+Dpirxfocg6WvHivPqPonuam
         0x5kfjHLkzPxjfXVDUp/oLTCgYFgXQ5nJoiVTsArcb9Uh8Y4Oz9HEvSBAEhg62PJJ8NH
         3v/QPvMOgLpu6EVRHjPFjhD6CZXC3BbcSVhOmKWl3E4G2r2jTEtqG3wRcgSXFbxIa/RG
         w1JBIQ0247xmk90kKvMaozbokEOJSosNUwwCbYFOdWAXVkAj3OYrszRYqLtNgOtnKlv5
         VXHw==
X-Gm-Message-State: AOAM532YCya0GDohGH9orwQiNVnorZfV3lDimGzlzMAmgWNpo40Nlzlp
	LEJ4w5KG/xAzzzRZxNi7ii7P8wzYicPp9KSL90MDR7te
X-Google-Smtp-Source: 
 ABdhPJymU3bcvM6XnN9vVsvnKcSqYjMA1fw9Be0nZP77bpQwHy+ctdNLnzz4a6ML2OfGU1UVI7jDlv/pbZkcpZbaX7k=
X-Received: by 2002:ac8:7087:: with SMTP id y7mr35085215qto.112.1635814922333;
 Mon, 01 Nov 2021 18:02:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211102005253.38996-1-changqing.li@windriver.com>
In-Reply-To: <20211102005253.38996-1-changqing.li@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 1 Nov 2021 18:01:50 -0700
Message-ID: 
 <CAMKF1sp-ds+shTRHyeS3aeNFiwZyOwqWcq+q4ayxQ_jdZYg55w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mozjs: fix powerpc compile failure
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000005d321e05cfc3d783"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 01:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93762

--0000000000005d321e05cfc3d783
Content-Type: text/plain; charset="UTF-8"

Can you rebase it on top of master-next and resend please

On Mon, Nov 1, 2021 at 5:54 PM Changqing Li <changqing.li@windriver.com>
wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> powerpc disable jit by default and also have compile failure:
> WasmFrame.cpp:57:76: error: static assertion failed: Aligned after pushing
> DebugFrame
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
> index f308b4863..cc2673e74 100644
> ---
> a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch
> @@ -15,7 +15,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    protected:
>   #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \
>  +    (defined(JS_CODEGEN_NONE) && \
> -+     (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__)) || \
> ++     (defined(__riscv) && __riscv_xlen == 32) || defined(__mips__) ||
> defined(__powerpc__)) || \
>       defined(JS_CODEGEN_X86) || defined(__wasi__)
>     // See alignmentStaticAsserts().  For MIPS32, ARM32 and X86 DebugFrame
> is only
>     // 4-byte aligned, so we add another word to get up to 8-byte
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93761):
> https://lists.openembedded.org/g/openembedded-devel/message/93761
> Mute This Topic: https://lists.openembedded.org/mt/86756698/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000005d321e05cfc3d783
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you rebase it on top of master-next and resend please=
=C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Mon, Nov 1, 2021 at 5:54 PM Changqing Li &lt;<a href=3D"mailt=
o:changqing.li@windriver.com">changqing.li@windriver.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">From: Changqing Li &lt;<a href=3D"mail=
to:changqing.li@windriver.com" target=3D"_blank">changqing.li@windriver.com=
</a>&gt;<br>
<br>
powerpc disable jit by default and also have compile failure:<br>
WasmFrame.cpp:57:76: error: static assertion failed: Aligned after pushing =
DebugFrame<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">changqing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../recipes-extended/mozjs/mozjs/nojit-32bit-arch-fix.patch=C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozj=
s/nojit-32bit-arch-fix.patch b/meta-oe/dynamic-layers/meta-python/recipes-e=
xtended/mozjs/mozjs/nojit-32bit-arch-fix.patch<br>
index f308b4863..cc2673e74 100644<br>
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit=
-32bit-arch-fix.patch<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs/nojit=
-32bit-arch-fix.patch<br>
@@ -15,7 +15,7 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gm=
ail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0 =C2=A0protected:<br>
=C2=A0 #if defined(JS_CODEGEN_MIPS32) || defined(JS_CODEGEN_ARM) || \<br>
=C2=A0+=C2=A0 =C2=A0 (defined(JS_CODEGEN_NONE) &amp;&amp; \<br>
-+=C2=A0 =C2=A0 =C2=A0(defined(__riscv) &amp;&amp; __riscv_xlen =3D=3D 32) =
|| defined(__mips__)) || \<br>
++=C2=A0 =C2=A0 =C2=A0(defined(__riscv) &amp;&amp; __riscv_xlen =3D=3D 32) =
|| defined(__mips__) || defined(__powerpc__)) || \<br>
=C2=A0 =C2=A0 =C2=A0 defined(JS_CODEGEN_X86) || defined(__wasi__)<br>
=C2=A0 =C2=A0 // See alignmentStaticAsserts().=C2=A0 For MIPS32, ARM32 and =
X86 DebugFrame is only<br>
=C2=A0 =C2=A0 // 4-byte aligned, so we add another word to get up to 8-byte=
<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#93761): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/93761" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/93761</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86756698/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/86756698/1997914</a><br>
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

--0000000000005d321e05cfc3d783--

