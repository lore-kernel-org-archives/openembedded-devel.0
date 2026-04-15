Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC6FF43834
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 15:01:59 +0000 (UTC)
Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21230.1776265309744668859
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2026 08:01:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h15qNfj3;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-651c8371ed5so2077633d50.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 08:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776265309; cv=none;
        d=google.com; s=arc-20240605;
        b=IREw0YFUMX64hCd1RZBkDzQCLUIz2pTwKHuQ+mm/gEecAXR92+iWsdOH/ufEzhleZw
         LYQHQNpE7Oo2bG/cAuNzd8DMRMvDsKYUmj8wnxCOXz0IJEITtsdIEoouMgPHv76ycZs5
         oDasVq6OT8srYIT4rFCgOXe+sZLJTAkQMlZgF0E0g4d5MsQzPhxdUZ8sHHWLwU5cnhlM
         UOmirBldWbDuvIJ4G3OHuja7sSetD3AYeL91DcTG6GU/AbKz11J57BzabD7VHpkUI9Rz
         c0vFo3MIz3pMPxN5ZiuLscx4DrEQOQS+jw+5mSlar/2iXGUEfAKx2B4Q87OqGGlgFIlF
         CpCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yHknAKgr9uPHz/YMV5jgBQDZgsyzRpK4hMHTFyRTGEs=;
        fh=cnX4THTyzTPWrQdYulppZeepmD6bJwi9ZDmZ6vRqC8A=;
        b=lSbjg/AwzJVgWYfYRcnBATnNZIBoYofxT9O+XB38/QuWCfAZj000qEAeZVkYKFL0N8
         av6GOZovydIZ023eCU7J/S0Qz+1M+qGV3NLaN/CD+52iEsWVBTMaZ5dCbKzvn9w9ucUS
         8Dr7kSqgFEw8cbEcb4zGd1m/B/tL9q4OBx+y/RcjODwc8ZsmBSe7zYFarZiM0xwOjd25
         9cFzNmsc7BGiFxr4quXBmX2K/JGU/kd5nAVItp7imQoffjztydrx/tX/WSUO+tDsB3P0
         8zvzTRqEpcnCLmHsYqqkLYqbJPgxJzmLD2rksezip6d3JFAcnErv0M80X5a2Nga60YeQ
         uDpA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776265309; x=1776870109; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yHknAKgr9uPHz/YMV5jgBQDZgsyzRpK4hMHTFyRTGEs=;
        b=h15qNfj36XIFggXCpU1xL2veVAsiz24D/VA7vvhLE/PmeZzpphVFrUmO9XkSPkYbvr
         rARbIGFtTpZPyDEEGY5Y8/x24ThEIS4SEpCgHziF8WkC+ctIQ2uhdRaskSvIan8IPkFs
         zvN1lMYPRowTtd6CnAw95DagQH6OT5j/FVG9khs3KsP8idHIoM+M9y3za/ZXVku1J7uc
         HKUMXzemESlnGf29KL8lfwkZbh4mkYiebuDCKM6vXqze0RBYd87iAMBYOjDw002LK3CB
         ArmB6K8Zhjw8S1LJ6VjVIQ6fgFVZz3bZ29zS/yJXNI837CznkMzziq+oe4T3ZxUIdQVz
         hsbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776265309; x=1776870109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHknAKgr9uPHz/YMV5jgBQDZgsyzRpK4hMHTFyRTGEs=;
        b=K+HRm1++N32nihIqJLn5p99sWmQohP6+le0pokgVeVpyzaRcjtz0fmgZnvUJcWrNRV
         HDvWzI2MUnOxaIt9/0LxwDSIb9BMjpfhg/BJ+4daFhh6htSBzVCYIG5Iv71H+SUVjtfg
         a8ti0fbenHs/aOBQtkO99hXgm+ftjh130ICAV/ks+VmYuXJre01aJufcuhh91+9yvnzV
         vMz5NMlwnMqPOB4BsZnnKWbguryHmtBTJOKc5rM0SHT2VQxLsqwS1zicd6xhAmjVsg/s
         YgMvqISyReIfCFHjyTSbq4odwCpwzsia+Ypnb8VsM6axlqmfTmxb8cE4gaOq1S3XNgeZ
         dOsQ==
X-Gm-Message-State: AOJu0YzocaQxLI2tbvT6Z4ljDIFAGyXALyI6U1ZBq1gaaxPmwg5FOvUE
	ZasBKDwtcBsOpfmuDoZ/KmNBvbTIAlOaJRRZq/zQNJRfJdEiTWC+CouWjf556x/MkegSASkzk8x
	SHkxlMXNrGSj3uIJ9pNtZRrE3tI9xFX0=
X-Gm-Gg: AeBDietTOSNWfgVsLl3FglZvfjlbKl9zw5FP7EBvCcW0nE7gKdAKCKifBLG/3VyH2Sw
	sdXcbN+sxf3AnD84A0O2PRd8CwQhcC4NQ9bYfEbknOHl2eRH+pyeGcTUV2EXfUO5csljNjnic4Q
	kUoCJCfa0vuXz94PirvGnUzs4fPo51wGhhdnTT0V+Qr38KTK0CutDMTpH0lkwTGaiRN30EedHQD
	fGS6JFogKsqijgEyEFzvdQ2um1kgS6jjzGcPQpK8i9rXTkZZE6A6M42vYvYf8L5F2OZPTzFAd7B
	d9pq3PBs65wtV++qEtq41RxOWRH/KWpPPepF9AHBt253FKQV22VbjYswbVAs8vPdbtTv4p6z4/o
	GhuFehnnTcOT2+YAP2xkW/qmbBvOUMbRRDcGdEBK1yNvokWlI4BQI7dRe1TQtjLglR9m9p/KnZB
	ZXLnqAxk7/2qUHDSI=
X-Received: by 2002:a05:690e:dcd:b0:650:4a79:f3b2 with SMTP id
 956f58d0204a3-65198b0241fmr22414543d50.28.1776265306935; Wed, 15 Apr 2026
 08:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260415090507.819848-1-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260415090507.819848-1-joaomarcos.costa@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Apr 2026 08:01:17 -0700
X-Gm-Features: AQROBzACzw1xk5P4Eb3ulX5OJMd4TmZOeZ6_fE9g-VVIeL1ncIhhdoUejKB0PcU
Message-ID: <CAMKF1spT35ddfWAyZAEmA_kQuRSE7boNSeGdM8nV5c1HLpuzkw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libhugetlbfs: add RISC-V to COMPATIBLE_HOSTS
To: =?UTF-8?Q?Jo=C3=A3o_Marcos_Costa?= <joaomarcos.costa@bootlin.com>
Cc: openembedded-devel@lists.openembedded.org, thomas.petazzoni@bootlin.com, 
	thomas.perrot@bootlin.com, nylon.chen@sifive.com
Content-Type: multipart/alternative; boundary="000000000000a594fd064f80fee0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Apr 2026 15:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126363

--000000000000a594fd064f80fee0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 2:05=E2=80=AFAM Jo=C3=A3o Marcos Costa <
joaomarcos.costa@bootlin.com> wrote:

> A preliminar effort to support RISC-V was added in v2.23:
>
> a529598 Introduce basic riscv64 support [1]
>
> Following the guidelines in libhugetlbfs's HOWTO, here are the outputs
> of some commands in qemuriscv64:
>
> root@qemuriscv64:~# grep -i huge /proc/filesystems
> nodev   hugetlbfs
> root@qemuriscv64:~# hugeadm --pool-list
>       Size  Minimum  Current  Maximum  Default
>      65536        0        0        0
>    2097152        0        0        0        *
> root@qemuriscv64:~# hugeadm --pool-pages-min 2MB:10 --add-temp-swap
> root@qemuriscv64:~# hugeadm --pool-list
>       Size  Minimum  Current  Maximum  Default
>      65536        0        0        0
>    2097152       10       10       10        *
> root@qemuriscv64:~# hugeadm --pool-pages-min 2MB:-5
> root@qemuriscv64:~# hugeadm --pool-list
>       Size  Minimum  Current  Maximum  Default
>      65536        0        0        0
>    2097152        5        5       10        *
>
> Regarding toolchains, libhugetlbfs for RISC-V builds fine with both
> clang and gcc.
>
> [1]:
> https://github.com/libhugetlbfs/libhugetlbfs/commit/a529598dd256c79799d5e=
43e6d79146ca15f1c16
>
>
Neat. now memcached and vm in kernel-selftest can be enabled for RV64, can
you check?


> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> index 89ce11f6e4..dd2fbbc7cd 100644
> --- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> +++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
> @@ -31,7 +31,7 @@ SRC_URI =3D " \
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)"
>
>
> -COMPATIBLE_HOST =3D "(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-linux=
*"
> +COMPATIBLE_HOST =3D
> "(i.86|x86_64|powerpc|powerpc64|riscv64|aarch64|arm).*-linux*"
>
>  LIBARGS =3D "LIB32=3D${baselib} LIB64=3D${baselib}"
>  LIBHUGETLBFS_ARCH =3D "${TARGET_ARCH}"
> --
> 2.47.0
>
>

--000000000000a594fd064f80fee0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 15,=
 2026 at 2:05=E2=80=AFAM Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaom=
arcos.costa@bootlin.com">joaomarcos.costa@bootlin.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">A preliminar effort to=
 support RISC-V was added in v2.23:<br>
<br>
a529598 Introduce basic riscv64 support [1]<br>
<br>
Following the guidelines in libhugetlbfs&#39;s HOWTO, here are the outputs<=
br>
of some commands in qemuriscv64:<br>
<br>
root@qemuriscv64:~# grep -i huge /proc/filesystems<br>
nodev=C2=A0 =C2=A0hugetlbfs<br>
root@qemuriscv64:~# hugeadm --pool-list<br>
=C2=A0 =C2=A0 =C2=A0 Size=C2=A0 Minimum=C2=A0 Current=C2=A0 Maximum=C2=A0 D=
efault<br>
=C2=A0 =C2=A0 =C2=A065536=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
=C2=A0 =C2=A02097152=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
root@qemuriscv64:~# hugeadm --pool-pages-min 2MB:10 --add-temp-swap<br>
root@qemuriscv64:~# hugeadm --pool-list<br>
=C2=A0 =C2=A0 =C2=A0 Size=C2=A0 Minimum=C2=A0 Current=C2=A0 Maximum=C2=A0 D=
efault<br>
=C2=A0 =C2=A0 =C2=A065536=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
=C2=A0 =C2=A02097152=C2=A0 =C2=A0 =C2=A0 =C2=A010=C2=A0 =C2=A0 =C2=A0 =C2=
=A010=C2=A0 =C2=A0 =C2=A0 =C2=A010=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
root@qemuriscv64:~# hugeadm --pool-pages-min 2MB:-5<br>
root@qemuriscv64:~# hugeadm --pool-list<br>
=C2=A0 =C2=A0 =C2=A0 Size=C2=A0 Minimum=C2=A0 Current=C2=A0 Maximum=C2=A0 D=
efault<br>
=C2=A0 =C2=A0 =C2=A065536=C2=A0 =C2=A0 =C2=A0 =C2=A0 0=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0=C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
=C2=A0 =C2=A02097152=C2=A0 =C2=A0 =C2=A0 =C2=A0 5=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 5=C2=A0 =C2=A0 =C2=A0 =C2=A010=C2=A0 =C2=A0 =C2=A0 =C2=A0 *<br>
<br>
Regarding toolchains, libhugetlbfs for RISC-V builds fine with both<br>
clang and gcc.<br>
<br>
[1]: <a href=3D"https://github.com/libhugetlbfs/libhugetlbfs/commit/a529598=
dd256c79799d5e43e6d79146ca15f1c16" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/libhugetlbfs/libhugetlbfs/commit/a529598dd256c79799d5e43e6d=
79146ca15f1c16</a><br>
<br></blockquote><div><br></div><div>Neat. now memcached and vm in kernel-s=
elftest can be enabled for RV64, can you check?</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
Signed-off-by: Jo=C3=A3o Marcos Costa &lt;<a href=3D"mailto:joaomarcos.cost=
a@bootlin.com" target=3D"_blank">joaomarcos.costa@bootlin.com</a>&gt;<br>
---<br>
=C2=A0meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libhugetlbfs=
_2.24.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_2.24.bb</a> | 2=
 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libhu=
getlbfs_2.24.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_2.24.bb<=
/a> b/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libhugetlbfs=
_2.24.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_2.24.bb</a><br>
index 89ce11f6e4..dd2fbbc7cd 100644<br>
--- a/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libhugetlbfs=
_2.24.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_2.24.bb</a><br>
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/<a href=3D"http://libhugetlbfs=
_2.24.bb" rel=3D"noreferrer" target=3D"_blank">libhugetlbfs_2.24.bb</a><br>
@@ -31,7 +31,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot=
;<br>
<br>
<br>
-COMPATIBLE_HOST =3D &quot;(i.86|x86_64|powerpc|powerpc64|aarch64|arm).*-li=
nux*&quot;<br>
+COMPATIBLE_HOST =3D &quot;(i.86|x86_64|powerpc|powerpc64|riscv64|aarch64|a=
rm).*-linux*&quot;<br>
<br>
=C2=A0LIBARGS =3D &quot;LIB32=3D${baselib} LIB64=3D${baselib}&quot;<br>
=C2=A0LIBHUGETLBFS_ARCH =3D &quot;${TARGET_ARCH}&quot;<br>
-- <br>
2.47.0<br>
<br>
</blockquote></div></div>

--000000000000a594fd064f80fee0--

