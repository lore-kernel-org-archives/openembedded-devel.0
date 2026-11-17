Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2979.1794949121634910221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 12:58:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0EbBhjQ5;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-677d35fd1d2so152470d50.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 12:58:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794949120; cv=none;
        d=google.com; s=arc-20260327;
        b=he2ho+YFM+uyEc/baSuzObkl+HyjryEKbwriRMe8F0dvTYfrkLg0dLnXD7e75BzEeR
         wD90Gj98shcYqtgdpwKyZvXj84KX0DgIU3oMZrFwsgk6vgZVLCRS8EODKvT5Oh9dZcZm
         v52O50Cfa2miXmk84BX6QnJ/lvVeieuJfCUTxqJf57b50ovztsgX65OUbckjM+N2bInA
         HST3ewkBBdN9tQsa/XFaZgJuU6vS25hOAi1TqlZhp9+Zj0DmK9QquAc5nSck/JFlHb0F
         6p5PW3VTK2ycanKyZcBKtCswBAu5qtRU+EwgBZJEo+S5PAik65G8HoyAN4ol8l/ALqwn
         FGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=AAp+NISqt4zw1wZsr6IDRyGCbbtQUCN/mual0jDkg1w=;
        fh=3HeG5lByMVOEpobyMX2S2UbVHKrPGnAoodhsw06jBF0=;
        b=SJimwOyCyXA9UsxFOcPA3TbWTX+Ya47qNKXq/QKyzpQhdP3w9wUwQlW7f+ltcr9GQo
         NWlMRwSpsT3HfkXxBguIZeKt/0OUTP2Ot76ZPNH1b0GveLIPcTWUESFw1gqmVdq+e8dA
         bquWDAJcoFWWOeNGhT6wmCE596717sZZcwei4QGu/ZcQ/hjW4jeRraMtO9dZJETfqmom
         Jj9/FHOqjaZfYt55wvJCDnyInmNSd8IKowfNf76yPc763QAORLuVU/6BgBGXRWXP9NL+
         ZhA+Sp/+I9HpVMy/i2BXfyOpIyD4odHLQ4X5cl3WQvdnIgMkSJsMaVN1BywQ25Rl1g0c
         +z2w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794949120; x=1795553920; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAp+NISqt4zw1wZsr6IDRyGCbbtQUCN/mual0jDkg1w=;
        b=0EbBhjQ5VBS67TVZv5Q/bn9jKxm38e4MyYO3OsrxtPzvbCH87EzUkfgAEaMalB9Efq
         flCN/gphWhdwwD2c4hfOIjK6zVYeldy8MEeICFzC3mSmWAmVIXkyTTQRdXOIG2baD919
         uSiPhlV0hRCktZPidwRxww/STVfe/3sZ5ydeKixo10UrIK4DzedokjEuVhwUxZEQpQhg
         AyEGenyQPDrRMZTsqdzYq16DxEiN5/RHAdz4H5XTeYaiVeZR0FFkPe0cBef8AFURVqIm
         Jkb5EUBVqiofStAs0+Mkfx6vlC9j5aVYMJ9Br/bwJ6Y0cV5ma+fFUGAy8rSpvhJo8JsP
         jpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949120; x=1795553920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AAp+NISqt4zw1wZsr6IDRyGCbbtQUCN/mual0jDkg1w=;
        b=L95QCGMou8+Nl7Hv23JLsg9724Hvp93TfA5kvQ8OvrW5qGAHTURcuGO//d05otQQKc
         KbmDatiQWZpGUJoltwacWfRUQ6DoudeiBOjQUHqraEoPHE7tdD8I5VXbQrAPEktp33Ls
         tfmRSCJ277nbmFAUfHJAkm5JkbL5hcRhRynxM3m642YrmKKwGYfq6IOSCpi/oXn1gdkf
         4PzrJJVH1Es2TFXVdeQyOrPoVn27zmpxpMVZso3qYcfoANC2lU9s4nYIQlJGfR+Gely+
         InemMI4okPCc6y2kHocDAZQdTvZbjRTWP9C/roGmxhONRyV7o3JpZevTaKbp6h/bZ49l
         iEbQ==
X-Gm-Message-State: APuU4Z8j8fPWGBorCP3Uq4uT24ua1uPaMXDg0UbSDxoPBwil8S35yyJC
	vX2BkMT/fXC+KvXhXeG7QfZiak2U7+mw+j2CEJwSaZ2XqO33S/ZyKBCcX4FIEgdqlCprkjpQyRy
	Hkeqd42/7DVP/UeQJXEY9Op3htLMT9Fk=
X-Gm-Gg: AZFdTZetSqN0CUUtgih/7erS4VJwefdlaA6ftqeONOA0rrECbYSkAwR00iCVLKZPLR5
	b+QEKWpUs+UU/VsJqLiRZ3+QHJIuRsSPQMBvsNOVmpd51lLkS03ayQPp1Jeah9fx02/XSS27HNh
	/EmLdvvXRXF+ffb62TzNF9A2XJJAqu8VSeAvrtOIyt7Fylx9Rg3qCl3Gkp32hR0hiYI41RzvBh5
	of6zthNoMDvbQwZbGYBEGhnlri2nVxi5RYkqleBmMm8O+MB7fxjEXN4RtfP0ho14vdpoWCkqWXV
	e/ls2FHSqrR9CtGLkMu3Sk/+AkogBLyom59+MzuLot65hFmiAg6HrM01zHJTYDyYxPkLF2oA1fv
	ppR/O3tuEDbJ5QB5eREW1ogLfCezc5kkQP+AGrBJtJGSC8NoNZnCLGD5KBSiniuc3KaRi+ZbjYT
	CF9wp9NFLjA9dU57PPH3ozKTJt27F/On3u09iFqivkLuC0vr5AW9l5f7V/cNrObK7sYoGXCNIsH
	WsJphLirwEvu6lrBKmK334Yfvs9xuAryMaTIJCY0wLXsdRHUlc7c/xDezTUAOK4mTtW9y2midSe
	cS+C99K4CK7iPs109YStIrTFG8V6SsqE8ladACf6g0i8AiPMKorKpCy33N3mhaHnVA==
X-Received: by 2002:a05:690e:1486:b0:67d:b309:a242 with SMTP id
 956f58d0204a3-67dd450ff13mr273591d50.16.1794949120503; Tue, 17 Nov 2026
 12:58:40 -0800 (PST)
MIME-Version: 1.0
References: <20261116145516.11115-2-yunseong.kim@est.tech>
In-Reply-To: <20261116145516.11115-2-yunseong.kim@est.tech>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Nov 2026 12:58:13 -0800
X-Gm-Features: AclHuK-7Sb3Z2XmC-Ewm1W4GlTWG-vCCKZ2TFDOT30luqTrl7BCm8eyHJih82Dk
Message-ID: <CAMKF1sqV_euA58RmpGZvWgwAHqs5W=iyM3k0Mrk6v7sP3Yj1Bg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] vock: add recipe
To: yunseong.kim@est.tech
Cc: openembedded-devel@lists.openembedded.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: multipart/alternative; boundary="000000000000b7bb1f06607f282b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:58:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132586

--000000000000b7bb1f06607f282b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Fails to build on TCLIBC =3D "musl"

On Mon, Nov 16, 2026 at 7:12=E2=80=AFAM Yunseong Kim via openembedded-devel
<yunseong.kim=3Dest.tech@lists.openembedded.org> wrote:

> vock reports the kernel code a userspace command executes, using KCOV
> or hardware tracing (Intel PT, AMD LBR/IBS and Arm Coresight ETMv4),
> symbolized against a vmlinux and annotated with kernel source.
> Forked children and threads are followed through an LD_PRELOAD library
> in KCOV mode and through inherited per-CPU perf events in hardware mode.
> It is useful to see which kernel paths a workload reaches when testing or
> debugging an embedded system.
>
> COMPATIBLE_HOST is limited to x86_64 and aarch64, the only architectures
> with syscall decoding and trace backends.
>
> Tested with poky on qemux86-64 and qemuarm64 (build, packaging,
> update_crates) and by running KCOV coverage, fork following and
> syscall tracing in core-image-minimal on qemux86-64 with a KCOV kernel.
>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  meta-oe/recipes-kernel/vock/vock-crates.inc |  8 +++++
>  meta-oe/recipes-kernel/vock/vock.bb         | 33 +++++++++++++++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 meta-oe/recipes-kernel/vock/vock-crates.inc
>  create mode 100644 meta-oe/recipes-kernel/vock/vock.bb
>
> diff --git a/meta-oe/recipes-kernel/vock/vock-crates.inc
> b/meta-oe/recipes-kernel/vock/vock-crates.inc
> new file mode 100644
> index 0000000000..9ddbda00cd
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/vock/vock-crates.inc
> @@ -0,0 +1,8 @@
> +# Autogenerated with 'bitbake -c update_crates vock'
> +
> +# from Cargo.lock
> +SRC_URI +=3D " \
> +    crate://crates.io/libc/0.2.189 \
> +"
> +
> +SRC_URI[libc-0.2.189.sha256sum] =3D
> "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc6d17f656fb07896ee72867612f2"
> diff --git a/meta-oe/recipes-kernel/vock/vock.bb
> b/meta-oe/recipes-kernel/vock/vock.bb
> new file mode 100644
> index 0000000000..530ca6dd16
> --- /dev/null
> +++ b/meta-oe/recipes-kernel/vock/vock.bb
> @@ -0,0 +1,33 @@
> +SUMMARY =3D "Kernel code coverage of a user-space command (KCOV, Intel P=
T,
> AMD LBR and Arm Coresight ETMv4)"
> +DESCRIPTION =3D "vock runs a command and reports which kernel code it
> executed, \
> +using KCOV or hardware tracing (Intel PT, AMD LBR/IBS and Arm Coresight
> ETMv4), \
> +optionally with an strace-style syscall trace and syzkaller-compatible
> output. \
> +Coverage is symbolized against a vmlinux (DWARF or BTF) and annotated
> with kernel source."
> +HOMEPAGE =3D "https://github.com/yskzalloc/vock"
> +BUGTRACKER =3D "https://github.com/yskzalloc/vock/issues"
> +SECTION =3D "devel"
> +
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf2426a488a4a2b68a88bd7cf641=
0e4"
> +
> +SRC_URI =3D "git://github.com/yskzalloc/vock.git;protocol=3Dhttps;branch=
=3Dmain
> "
> +SRCREV =3D "db50863d4d70038738a157379d24a9d9e5e4ce2a"
> +PV =3D "0.1.0+git"
> +
> +inherit cargo cargo-update-recipe-crates
> +
> +require ${BPN}-crates.inc
> +
> +# Syscall decoding, ptrace register access and the hardware-trace backen=
ds
> +# are implemented for x86_64 and aarch64 only.
> +COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
> +
> +do_install:append() {
> +    # LD_PRELOAD shim used by --mode kcov to follow forks and threads.
> vock
> +    # looks it up next to its binary as ../lib/vock/kcov.so, i.e. under
> +    # ${nonarch_libdir} regardless of multilib.
> +    install -Dm 0755
> ${B}/target/${CARGO_TARGET_SUBDIR}/libkcov_preload.so \
> +        ${D}${nonarch_libdir}/vock/kcov.so
> +}
> +
> +FILES:${PN} +=3D "${nonarch_libdir}/vock"
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#132454):
> https://lists.openembedded.org/g/openembedded-devel/message/132454
> Mute This Topic: https://lists.openembedded.org/mt/122295770/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000b7bb1f06607f282b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Fails to build on TCLIBC =3D &quot;musl&quot;</div><br><di=
v class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Nov 16, 2026 at 7:12=E2=80=AFAM Yunseong Kim via openembed=
ded-devel &lt;yunseong.kim=3D<a href=3D"mailto:est.tech@lists.openembedded.=
org">est.tech@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">vock reports the kernel code a userspac=
e command executes, using KCOV<br>
or hardware tracing (Intel PT, AMD LBR/IBS and Arm Coresight ETMv4),<br>
symbolized against a vmlinux and annotated with kernel source.<br>
Forked children and threads are followed through an LD_PRELOAD library<br>
in KCOV mode and through inherited per-CPU perf events in hardware mode.<br=
>
It is useful to see which kernel paths a workload reaches when testing or<b=
r>
debugging an embedded system.<br>
<br>
COMPATIBLE_HOST is limited to x86_64 and aarch64, the only architectures<br=
>
with syscall decoding and trace backends.<br>
<br>
Tested with poky on qemux86-64 and qemuarm64 (build, packaging,<br>
update_crates) and by running KCOV coverage, fork following and<br>
syscall tracing in core-image-minimal on qemux86-64 with a KCOV kernel.<br>
<br>
Signed-off-by: Yunseong Kim &lt;yunseong.kim@est.tech&gt;<br>
---<br>
=C2=A0meta-oe/recipes-kernel/vock/vock-crates.inc |=C2=A0 8 +++++<br>
=C2=A0meta-oe/recipes-kernel/vock/<a href=3D"http://vock.bb" rel=3D"norefer=
rer" target=3D"_blank">vock.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 33 ++=
+++++++++++++++++++<br>
=C2=A02 files changed, 41 insertions(+)<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/vock/vock-crates.inc<br>
=C2=A0create mode 100644 meta-oe/recipes-kernel/vock/<a href=3D"http://vock=
.bb" rel=3D"noreferrer" target=3D"_blank">vock.bb</a><br>
<br>
diff --git a/meta-oe/recipes-kernel/vock/vock-crates.inc b/meta-oe/recipes-=
kernel/vock/vock-crates.inc<br>
new file mode 100644<br>
index 0000000000..9ddbda00cd<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-kernel/vock/vock-crates.inc<br>
@@ -0,0 +1,8 @@<br>
+# Autogenerated with &#39;bitbake -c update_crates vock&#39;<br>
+<br>
+# from Cargo.lock<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 crate://<a href=3D"http://crates.io/libc/0.2.189" rel=3D"nor=
eferrer" target=3D"_blank">crates.io/libc/0.2.189</a> \<br>
+&quot;<br>
+<br>
+SRC_URI[libc-0.2.189.sha256sum] =3D &quot;3eaf3ede3fee6db1a4c2ee091bf8a8b4=
dccdc6d17f656fb07896ee72867612f2&quot;<br>
diff --git a/meta-oe/recipes-kernel/vock/<a href=3D"http://vock.bb" rel=3D"=
noreferrer" target=3D"_blank">vock.bb</a> b/meta-oe/recipes-kernel/vock/<a =
href=3D"http://vock.bb" rel=3D"noreferrer" target=3D"_blank">vock.bb</a><br=
>
new file mode 100644<br>
index 0000000000..530ca6dd16<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-kernel/vock/<a href=3D"http://vock.bb" rel=3D"norefer=
rer" target=3D"_blank">vock.bb</a><br>
@@ -0,0 +1,33 @@<br>
+SUMMARY =3D &quot;Kernel code coverage of a user-space command (KCOV, Inte=
l PT, AMD LBR and Arm Coresight ETMv4)&quot;<br>
+DESCRIPTION =3D &quot;vock runs a command and reports which kernel code it=
 executed, \<br>
+using KCOV or hardware tracing (Intel PT, AMD LBR/IBS and Arm Coresight ET=
Mv4), \<br>
+optionally with an strace-style syscall trace and syzkaller-compatible out=
put. \<br>
+Coverage is symbolized against a vmlinux (DWARF or BTF) and annotated with=
 kernel source.&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/yskzalloc/vock" rel=3D"no=
referrer" target=3D"_blank">https://github.com/yskzalloc/vock</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/yskzalloc/vock/issues" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/yskzalloc/vock/issu=
es</a>&quot;<br>
+SECTION =3D &quot;devel&quot;<br>
+<br>
+LICENSE =3D &quot;Apache-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Ddaf2426a488a4a2b68a88bd7cf=
6410e4&quot;<br>
+<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/yskzalloc/vock.git;pr=
otocol=3Dhttps;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">github.c=
om/yskzalloc/vock.git;protocol=3Dhttps;branch=3Dmain</a>&quot;<br>
+SRCREV =3D &quot;db50863d4d70038738a157379d24a9d9e5e4ce2a&quot;<br>
+PV =3D &quot;0.1.0+git&quot;<br>
+<br>
+inherit cargo cargo-update-recipe-crates<br>
+<br>
+require ${BPN}-crates.inc<br>
+<br>
+# Syscall decoding, ptrace register access and the hardware-trace backends=
<br>
+# are implemented for x86_64 and aarch64 only.<br>
+COMPATIBLE_HOST =3D &quot;(x86_64|aarch64).*-linux&quot;<br>
+<br>
+do_install:append() {<br>
+=C2=A0 =C2=A0 # LD_PRELOAD shim used by --mode kcov to follow forks and th=
reads. vock<br>
+=C2=A0 =C2=A0 # looks it up next to its binary as ../lib/vock/kcov.so, i.e=
. under<br>
+=C2=A0 =C2=A0 # ${nonarch_libdir} regardless of multilib.<br>
+=C2=A0 =C2=A0 install -Dm 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/libkcov_=
preload.so \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}${nonarch_libdir}/vock/kcov.so<br>
+}<br>
+<br>
+FILES:${PN} +=3D &quot;${nonarch_libdir}/vock&quot;<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#132454): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/132454" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/132454</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/122295770/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/122295770/1997914</a><br>
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

--000000000000b7bb1f06607f282b--
