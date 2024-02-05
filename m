Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F69C4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 22:11:31 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.7323.1707171087168381624
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 14:11:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A8Q81K+6;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: peron.clem@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-51149561a39so2194091e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 14:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707171085; x=1707775885; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JtUchMkYPxk5hc9UVtuF6UkEarfb5uYUT+XxvQwV98E=;
        b=A8Q81K+6CnYofFzZHEH9CmUi4K2eNqVkFDxuuXkrAon/m0wiGrglPXg7tBWz3irW0W
         Rrpqni3MHeoDo8MDlvkhh/IOkpudbKstVVjQfXEDug2K9A3zDSN8itQvRv2Hmckxi/8R
         8GP9vm+oeNPePgaWcAeKJqtSV/GpaykfrZxWJB+qP8EYb4+i6hAmNg1MS0MXaELfTyOI
         kI87kCOAh915fpfbQSNgtpm/u98PGRJflJHB/iPxNA91GkSaJlW3EJK6KP6mgKM5tydP
         DQogkSfloLgSHB4Cq3OoTSnJhraMALkTgIznHVTwbk2zJuPiEJHKF4wRcX4IN3DMsWPp
         85Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707171085; x=1707775885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtUchMkYPxk5hc9UVtuF6UkEarfb5uYUT+XxvQwV98E=;
        b=ukaji3qSUuRpDcWBsD+KSoF4joXBWiipwjjdsHgFPAep1b1zqQYaYXQbzH0iAFvjKG
         0fPTav6d3WUs/OaU6JL6/OQ8u0/+ZwGUafdn8TyOsIoAgYwz6DZXNPaugmpcRtB5pA+9
         +sK+Dow6cDCOAubC0TIIy/6nhSbNoaLw4Sb4zXbyUIS1JE1NWbyrmuTu9je/0+/Tueh5
         xGEZTEKes1HO9JvU7itUmwC2FRJCOASIXScvEPrLvXbHsUHEb5nlDWjsLdGzEM65VtMq
         e/Ow9A2oPGTSi6h/H6y8MJzSAkEYkmvFgvL1h11QiZqN/1dqhbmuMflERPMjzVCePAM+
         L15A==
X-Gm-Message-State: AOJu0Ywn4+w4LzMCCVGMxOdcTP5dKVH3yVgxmoVpL/FzyKXuWpkIm/Ab
	owsf5quoAACeQLCCzmdTaJcP9dn6puLuNDb84fygHJ2ljt2J59pmLHJkKRKxd3fTJZy65F6SWZk
	Q8T90+ylJjyvqMcJ6g0qW6UuhkeE=
X-Google-Smtp-Source: AGHT+IGLhCEdDfWBWbC1vr7xyiY7Dswf75jgIydDMc9xOeV4gxtDpYWUHm1iejnSnRs6l9UDcfRrozmED3IBs7XCl6A=
X-Received: by 2002:ac2:456c:0:b0:511:5306:dd77 with SMTP id
 k12-20020ac2456c000000b005115306dd77mr604070lfm.20.1707171084887; Mon, 05 Feb
 2024 14:11:24 -0800 (PST)
MIME-Version: 1.0
References: <20230615144650.613381-1-raj.khem@gmail.com>
In-Reply-To: <20230615144650.613381-1-raj.khem@gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Mon, 5 Feb 2024 23:11:12 +0100
Message-ID: <CAJiuCccAgLYfGAhR18t7BC5QNy9zozZG9-TaTNjAiLMsO8pxng@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] influxdb: Upgrade to 2.7.1 release
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000015eaea0610a9bec7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 22:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108582

--00000000000015eaea0610a9bec7
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

On Thu, 15 Jun 2023 at 16:49, Khem Raj <raj.khem@gmail.com> wrote:

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...1.2-xxhash-to-fix-build-with-go-1.17.patch | 39 -------------------
>  ...e-for-mips-ispeed-ospeed-termios-abs.patch | 17 ++++----
>  .../{influxdb_1.8.10.bb => influxdb_2.7.1.bb} |  7 ++--
>  3 files changed, 11 insertions(+), 52 deletions(-)
>  delete mode 100644
> meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
>  rename meta-oe/recipes-dbs/influxdb/{influxdb_1.8.10.bb =>
> influxdb_2.7.1.bb} (87%)
>
>
Seems that this patch has never been upstreamed. Am I correct?

Is there any reason?

Thanks & Regards



> diff --git
> a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
> b/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
> deleted file mode 100644
> index e31c7be1ec..0000000000
> ---
> a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 4ca405e9763fd0ba747ef00edd30648b66992fbb Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Tue, 30 Nov 2021 15:14:39 -0800
> -Subject: [PATCH] Use v2.1.2 xxhash to fix build with go 1.17
> -
> -Fixes
> -| # github.com/cespare/xxhash
> -| asm: xxhash_amd64.s:120: when dynamic linking, R15 is clobbered by a
> global variable access and is used here: 000
> -92
> (/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/influxdb/1.8.10-r0/build/pkg/mod/
> github.com/cespare/xxhash@
> -v1.1.0/xxhash_amd64.s:120
> <http://github.com/cespare/xxhash@-v1.1.0/xxhash_amd64.s:120>)
> ADDQ    R15, AX
> -| asm: assembly failed
> -
> -Upstream-Status: Backport [
> https://github.com/cespare/xxhash/commit/e7a6b52374f7e2abfb8abb27249d53a1997b09a7
> ]
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> - go.mod | 3 ++-
> - go.sum | 2 ++
> - 2 files changed, 4 insertions(+), 1 deletion(-)
> -
> ---- a/go.mod
> -+++ b/go.mod
> -@@ -55,3 +55,5 @@ require (
> -       gonum.org/v1/gonum v0.6.0 // indirect
> -       google.golang.org/grpc v1.26.0
> - )
> -+
> -+replace github.com/cespare/xxhash => github.com/kraj/xxhash
> v1.1.1-0.20211201014032-8254a11eab56
> ---- a/go.sum
> -+++ b/go.sum
> -@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
> - github.com/kr/pty v1.1.1/go.mod
> h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ=
> - github.com/kr/text v0.1.0
> h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=
> - github.com/kr/text v0.1.0/go.mod
> h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI=
> -+github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56
> h1:hCQ0jTkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=
> -+github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod
> h1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=
> - github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9A=
> - github.com/lib/pq v1.0.0/go.mod
> h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQIvNi/34Woo=
> - github.com/mattn/go-colorable v0.0.9
> h1:UVL0vNpWh04HeJXV0KLcaT7r06gOH2l4OW6ddYRUIY4=
> diff --git
> a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
> b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
> index b05fd3666b..55382b4636 100644
> ---
> a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
> +++
> b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch
> @@ -12,20 +12,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>  --- a/go.mod
>  +++ b/go.mod
> -@@ -56,4 +56,5 @@ require (
> -       google.golang.org/grpc v1.26.0
> +@@ -223,3 +223,4 @@ require (
>   )
>
> + replace github.com/nats-io/nats-streaming-server v0.11.2 =>
> github.com/influxdata/nats-streaming-server
> v0.11.3-0.20201112040610-c277f7560803
>  +replace github.com/pkg/term => github.com/kraj/term
> v0.0.0-20210111231523-7c42fcb0e627
> - replace github.com/cespare/xxhash => github.com/kraj/xxhash
> v1.1.1-0.20211201014032-8254a11eab56
>  --- a/go.sum
>  +++ b/go.sum
> -@@ -188,6 +188,8 @@ github.com/kr/pretty v0.1.0/go.mod h1:dA
> - github.com/kr/pty v1.1.1/go.mod
> h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYio2l3bCsQ=
> - github.com/kr/text v0.1.0
> h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKSTVE=
> +@@ -610,6 +610,8 @@ github.com/kr/pty v1.1.1/go.mod h1:pFQYn
>   github.com/kr/text v0.1.0/go.mod
> h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVham/4vfdArNI=
> + github.com/kr/text v0.2.0
> h1:5Nx0Ya0ZqY2ygV366QzturHI13Jq95ApcVaJBhpS+AY=
> + github.com/kr/text v0.2.0/go.mod
> h1:eLer722TekiGuMkidMxC/pM04lWEeraHUUmBw8l2grE=
>  +github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627
> h1:3/XXm86KqrOZEJvEmFlzl3NTFA99n5Pd/cSXl60LmuA=
>  +github.com/kraj/term v0.0.0-20210111231523-7c42fcb0e627/go.mod
> h1:BYR4E+NOQrH+NhXE71KuBNmyR1lQ+yDvP+O3IIHO5bM=
> - github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56
> h1:hCQ0jTkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=
> - github.com/kraj/xxhash v1.1.1-0.20211201014032-8254a11eab56/go.mod
> h1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=
> - github.com/lib/pq v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9A=
> + github.com/labstack/echo/v4 v4.2.1/go.mod
> h1:AA49e0DZ8kk5jTOOCKNuPR6oTnBS0dYiM4FW1e6jwpg=
> + github.com/labstack/gommon v0.3.0/go.mod
> h1:MULnywXg0yavhxWKc+lOruYdAhDwPK9wf0OL7NoOu+k=
> + github.com/lann/builder v0.0.0-20180802200727-47ae307949d0
> h1:SOEGU9fKiNWd/HOJuq6+3iTQz8KNCLtVX6idSoTLdUw=
> diff --git a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> b/meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
> similarity index 87%
> rename from meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> rename to meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
> index 50995c09b6..b29b9b8898 100644
> --- a/meta-oe/recipes-dbs/influxdb/influxdb_1.8.10.bb
> +++ b/meta-oe/recipes-dbs/influxdb/influxdb_2.7.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION = "InfluxDB is a time series database designed
> to handle high write
>  HOMEPAGE = "https://www.influxdata.com/products/influxdb-overview/"
>
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM =
> "file://src/${GO_IMPORT}/LICENSE;md5=f39a8d10930fb37bd59adabb3b9d0bd6"
> +LIC_FILES_CHKSUM =
> "file://src/${GO_IMPORT}/LICENSE;md5=86f93342918318318c795b9999bd8131"
>
>  RDEPENDS:${PN} = "bash"
>  RDEPENDS:${PN}-dev = "bash"
> @@ -15,15 +15,14 @@ GO_INSTALL = "\
>  "
>
>  SRC_URI = "\
> -
> git://${GO_IMPORT};protocol=https;branch=1.8;destsuffix=${BPN}-${PV}/src/${GO_IMPORT}
> \
> -
> file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch;patchdir=src/${GO_IMPORT}
> \
> +
> git://${GO_IMPORT};protocol=https;branch=2.7;destsuffix=${BPN}-${PV}/src/${GO_IMPORT}
> \
>      file://influxdb \
>      file://influxdb.conf \
>  "
>
>  SRC_URI:append:mipsarch = "
> file://0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch;patchdir=src/${GO_IMPORT}"
>
> -SRCREV = "688e697c51fd5353725da078555adbeff0363d01"
> +SRCREV = "407fa622e9a0a48516dacc7564f7ba59c8307da9"
>
>  inherit go-mod pkgconfig systemd update-rc.d useradd
>
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103307):
> https://lists.openembedded.org/g/openembedded-devel/message/103307
> Mute This Topic: https://lists.openembedded.org/mt/99550402/4240582
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> peron.clem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000015eaea0610a9bec7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace">Hi Khem,</div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace"><br></div></div><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Thu, 15 Jun 2023 at 16:49, Khem Raj &lt;<a hre=
f=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.c=
om</a>&gt;<br>
---<br>
=C2=A0...1.2-xxhash-to-fix-build-with-go-1.17.patch | 39 ------------------=
-<br>
=C2=A0...e-for-mips-ispeed-ospeed-termios-abs.patch | 17 ++++----<br>
=C2=A0.../{<a href=3D"http://influxdb_1.8.10.bb" rel=3D"noreferrer" target=
=3D"_blank">influxdb_1.8.10.bb</a> =3D&gt; <a href=3D"http://influxdb_2.7.1=
.bb" rel=3D"noreferrer" target=3D"_blank">influxdb_2.7.1.bb</a>} |=C2=A0 7 =
++--<br>
=C2=A03 files changed, 11 insertions(+), 52 deletions(-)<br>
=C2=A0delete mode 100644 meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.=
1.2-xxhash-to-fix-build-with-go-1.17.patch<br>
=C2=A0rename meta-oe/recipes-dbs/influxdb/{<a href=3D"http://influxdb_1.8.1=
0.bb" rel=3D"noreferrer" target=3D"_blank">influxdb_1.8.10.bb</a> =3D&gt; <=
a href=3D"http://influxdb_2.7.1.bb" rel=3D"noreferrer" target=3D"_blank">in=
fluxdb_2.7.1.bb</a>} (87%)<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-family:monospace">Seems that this patch has never been upstreamed. Am =
I correct?</div><div class=3D"gmail_default" style=3D"font-family:monospace=
"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace">Is=
 there any reason?</div><div class=3D"gmail_default" style=3D"font-family:m=
onospace"><br>Thanks &amp; Regards</div><br></div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-t=
o-fix-build-with-go-1.17.patch b/meta-oe/recipes-dbs/influxdb/influxdb/0001=
-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch<br>
deleted file mode 100644<br>
index e31c7be1ec..0000000000<br>
--- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-Use-v2.1.2-xxhash-to-fix-b=
uild-with-go-1.17.patch<br>
+++ /dev/null<br>
@@ -1,39 +0,0 @@<br>
-From 4ca405e9763fd0ba747ef00edd30648b66992fbb Mon Sep 17 00:00:00 2001<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
-Date: Tue, 30 Nov 2021 15:14:39 -0800<br>
-Subject: [PATCH] Use v2.1.2 xxhash to fix build with go 1.17<br>
-<br>
-Fixes<br>
-| # <a href=3D"http://github.com/cespare/xxhash" rel=3D"noreferrer" target=
=3D"_blank">github.com/cespare/xxhash</a><br>
-| asm: xxhash_amd64.s:120: when dynamic linking, R15 is clobbered by a glo=
bal variable access and is used here: 000<br>
-92 (/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/influxdb/1.8.10-r0=
/build/pkg/mod/<a href=3D"http://github.com/cespare/xxhash@-v1.1.0/xxhash_a=
md64.s:120" rel=3D"noreferrer" target=3D"_blank">github.com/cespare/xxhash@=
<br>
-v1.1.0/xxhash_amd64.s:120</a>)=C2=A0 =C2=A0 =C2=A0 =C2=A0 ADDQ=C2=A0 =C2=
=A0 R15, AX<br>
-| asm: assembly failed<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://github.com/cespare/xxhash/co=
mmit/e7a6b52374f7e2abfb8abb27249d53a1997b09a7" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/cespare/xxhash/commit/e7a6b52374f7e2abfb8abb272=
49d53a1997b09a7</a>]<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
----<br>
- go.mod | 3 ++-<br>
- go.sum | 2 ++<br>
- 2 files changed, 4 insertions(+), 1 deletion(-)<br>
-<br>
---- a/go.mod<br>
-+++ b/go.mod<br>
-@@ -55,3 +55,5 @@ require (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://gonum.org/v1/gonum" rel=3D"no=
referrer" target=3D"_blank">gonum.org/v1/gonum</a> v0.6.0 // indirect<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/grpc" rel=
=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.26.0<br>
- )<br>
-+<br>
-+replace <a href=3D"http://github.com/cespare/xxhash" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/cespare/xxhash</a> =3D&gt; <a href=3D"http://gi=
thub.com/kraj/xxhash" rel=3D"noreferrer" target=3D"_blank">github.com/kraj/=
xxhash</a> v1.1.1-0.20211201014032-8254a11eab56<br>
---- a/go.sum<br>
-+++ b/go.sum<br>
-@@ -188,6 +188,8 @@ <a href=3D"http://github.com/kr/pretty" rel=3D"norefer=
rer" target=3D"_blank">github.com/kr/pretty</a> v0.1.0/go.mod h1:dA<br>
- <a href=3D"http://github.com/kr/pty" rel=3D"noreferrer" target=3D"_blank"=
>github.com/kr/pty</a> v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYi=
o2l3bCsQ=3D<br>
- <a href=3D"http://github.com/kr/text" rel=3D"noreferrer" target=3D"_blank=
">github.com/kr/text</a> v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKS=
TVE=3D<br>
- <a href=3D"http://github.com/kr/text" rel=3D"noreferrer" target=3D"_blank=
">github.com/kr/text</a> v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx/iVha=
m/4vfdArNI=3D<br>
-+<a href=3D"http://github.com/kraj/xxhash" rel=3D"noreferrer" target=3D"_b=
lank">github.com/kraj/xxhash</a> v1.1.1-0.20211201014032-8254a11eab56 h1:hC=
Q0jTkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=3D<br>
-+<a href=3D"http://github.com/kraj/xxhash" rel=3D"noreferrer" target=3D"_b=
lank">github.com/kraj/xxhash</a> v1.1.1-0.20211201014032-8254a11eab56/go.mo=
d h1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=3D<br>
- <a href=3D"http://github.com/lib/pq" rel=3D"noreferrer" target=3D"_blank"=
>github.com/lib/pq</a> v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9=
A=3D<br>
- <a href=3D"http://github.com/lib/pq" rel=3D"noreferrer" target=3D"_blank"=
>github.com/lib/pq</a> v1.0.0/go.mod h1:5WUZQaWbwv1U+lTReE5YruASi9Al49XbQIv=
Ni/34Woo=3D<br>
- <a href=3D"http://github.com/mattn/go-colorable" rel=3D"noreferrer" targe=
t=3D"_blank">github.com/mattn/go-colorable</a> v0.0.9 h1:UVL0vNpWh04HeJXV0K=
LcaT7r06gOH2l4OW6ddYRUIY4=3D<br>
diff --git a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-f=
or-mips-ispeed-ospeed-termios-abs.patch b/meta-oe/recipes-dbs/influxdb/infl=
uxdb/0001-patch-term-module-for-mips-ispeed-ospeed-termios-abs.patch<br>
index b05fd3666b..55382b4636 100644<br>
--- a/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips=
-ispeed-ospeed-termios-abs.patch<br>
+++ b/meta-oe/recipes-dbs/influxdb/influxdb/0001-patch-term-module-for-mips=
-ispeed-ospeed-termios-abs.patch<br>
@@ -12,20 +12,19 @@ Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
<br>
=C2=A0--- a/go.mod<br>
=C2=A0+++ b/go.mod<br>
-@@ -56,4 +56,5 @@ require (<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://google.golang.org/grpc" rel=
=3D"noreferrer" target=3D"_blank">google.golang.org/grpc</a> v1.26.0<br>
+@@ -223,3 +223,4 @@ require (<br>
=C2=A0 )<br>
<br>
+ replace <a href=3D"http://github.com/nats-io/nats-streaming-server" rel=
=3D"noreferrer" target=3D"_blank">github.com/nats-io/nats-streaming-server<=
/a> v0.11.2 =3D&gt; <a href=3D"http://github.com/influxdata/nats-streaming-=
server" rel=3D"noreferrer" target=3D"_blank">github.com/influxdata/nats-str=
eaming-server</a> v0.11.3-0.20201112040610-c277f7560803<br>
=C2=A0+replace <a href=3D"http://github.com/pkg/term" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/pkg/term</a> =3D&gt; <a href=3D"http://github.co=
m/kraj/term" rel=3D"noreferrer" target=3D"_blank">github.com/kraj/term</a> =
v0.0.0-20210111231523-7c42fcb0e627<br>
- replace <a href=3D"http://github.com/cespare/xxhash" rel=3D"noreferrer" t=
arget=3D"_blank">github.com/cespare/xxhash</a> =3D&gt; <a href=3D"http://gi=
thub.com/kraj/xxhash" rel=3D"noreferrer" target=3D"_blank">github.com/kraj/=
xxhash</a> v1.1.1-0.20211201014032-8254a11eab56<br>
=C2=A0--- a/go.sum<br>
=C2=A0+++ b/go.sum<br>
-@@ -188,6 +188,8 @@ <a href=3D"http://github.com/kr/pretty" rel=3D"norefer=
rer" target=3D"_blank">github.com/kr/pretty</a> v0.1.0/go.mod h1:dA<br>
- <a href=3D"http://github.com/kr/pty" rel=3D"noreferrer" target=3D"_blank"=
>github.com/kr/pty</a> v1.1.1/go.mod h1:pFQYn66WHrOpPYNljwOMqo10TkYh1fy3cYi=
o2l3bCsQ=3D<br>
- <a href=3D"http://github.com/kr/text" rel=3D"noreferrer" target=3D"_blank=
">github.com/kr/text</a> v0.1.0 h1:45sCR5RtlFHMR4UwH9sdQ5TC8v0qDQCHnXt+kaKS=
TVE=3D<br>
+@@ -610,6 +610,8 @@ <a href=3D"http://github.com/kr/pty" rel=3D"noreferrer=
" target=3D"_blank">github.com/kr/pty</a> v1.1.1/go.mod h1:pFQYn<br>
=C2=A0 <a href=3D"http://github.com/kr/text" rel=3D"noreferrer" target=3D"_=
blank">github.com/kr/text</a> v0.1.0/go.mod h1:4Jbv+DJW3UT/LiOwJeYQe1efqtUx=
/iVham/4vfdArNI=3D<br>
+ <a href=3D"http://github.com/kr/text" rel=3D"noreferrer" target=3D"_blank=
">github.com/kr/text</a> v0.2.0 h1:5Nx0Ya0ZqY2ygV366QzturHI13Jq95ApcVaJBhpS=
+AY=3D<br>
+ <a href=3D"http://github.com/kr/text" rel=3D"noreferrer" target=3D"_blank=
">github.com/kr/text</a> v0.2.0/go.mod h1:eLer722TekiGuMkidMxC/pM04lWEeraHU=
UmBw8l2grE=3D<br>
=C2=A0+<a href=3D"http://github.com/kraj/term" rel=3D"noreferrer" target=3D=
"_blank">github.com/kraj/term</a> v0.0.0-20210111231523-7c42fcb0e627 h1:3/X=
Xm86KqrOZEJvEmFlzl3NTFA99n5Pd/cSXl60LmuA=3D<br>
=C2=A0+<a href=3D"http://github.com/kraj/term" rel=3D"noreferrer" target=3D=
"_blank">github.com/kraj/term</a> v0.0.0-20210111231523-7c42fcb0e627/go.mod=
 h1:BYR4E+NOQrH+NhXE71KuBNmyR1lQ+yDvP+O3IIHO5bM=3D<br>
- <a href=3D"http://github.com/kraj/xxhash" rel=3D"noreferrer" target=3D"_b=
lank">github.com/kraj/xxhash</a> v1.1.1-0.20211201014032-8254a11eab56 h1:hC=
Q0jTkNInQ7PpNeGlSV9s+QMi6nUyyMuz37Bg3TduE=3D<br>
- <a href=3D"http://github.com/kraj/xxhash" rel=3D"noreferrer" target=3D"_b=
lank">github.com/kraj/xxhash</a> v1.1.1-0.20211201014032-8254a11eab56/go.mo=
d h1:XrSqR1VqqWfGrhpAt58auRo0WTKS1nRRg3ghfAqPWnc=3D<br>
- <a href=3D"http://github.com/lib/pq" rel=3D"noreferrer" target=3D"_blank"=
>github.com/lib/pq</a> v1.0.0 h1:X5PMW56eZitiTeO7tKzZxFCSpbFZJtkMMooicw2us9=
A=3D<br>
+ <a href=3D"http://github.com/labstack/echo/v4" rel=3D"noreferrer" target=
=3D"_blank">github.com/labstack/echo/v4</a> v4.2.1/go.mod h1:AA49e0DZ8kk5jT=
OOCKNuPR6oTnBS0dYiM4FW1e6jwpg=3D<br>
+ <a href=3D"http://github.com/labstack/gommon" rel=3D"noreferrer" target=
=3D"_blank">github.com/labstack/gommon</a> v0.3.0/go.mod h1:MULnywXg0yavhxW=
Kc+lOruYdAhDwPK9wf0OL7NoOu+k=3D<br>
+ <a href=3D"http://github.com/lann/builder" rel=3D"noreferrer" target=3D"_=
blank">github.com/lann/builder</a> v0.0.0-20180802200727-47ae307949d0 h1:SO=
EGU9fKiNWd/HOJuq6+3iTQz8KNCLtVX6idSoTLdUw=3D<br>
diff --git a/meta-oe/recipes-dbs/influxdb/<a href=3D"http://influxdb_1.8.10=
.bb" rel=3D"noreferrer" target=3D"_blank">influxdb_1.8.10.bb</a> b/meta-oe/=
recipes-dbs/influxdb/<a href=3D"http://influxdb_2.7.1.bb" rel=3D"noreferrer=
" target=3D"_blank">influxdb_2.7.1.bb</a><br>
similarity index 87%<br>
rename from meta-oe/recipes-dbs/influxdb/<a href=3D"http://influxdb_1.8.10.=
bb" rel=3D"noreferrer" target=3D"_blank">influxdb_1.8.10.bb</a><br>
rename to meta-oe/recipes-dbs/influxdb/<a href=3D"http://influxdb_2.7.1.bb"=
 rel=3D"noreferrer" target=3D"_blank">influxdb_2.7.1.bb</a><br>
index 50995c09b6..b29b9b8898 100644<br>
--- a/meta-oe/recipes-dbs/influxdb/<a href=3D"http://influxdb_1.8.10.bb" re=
l=3D"noreferrer" target=3D"_blank">influxdb_1.8.10.bb</a><br>
+++ b/meta-oe/recipes-dbs/influxdb/<a href=3D"http://influxdb_2.7.1.bb" rel=
=3D"noreferrer" target=3D"_blank">influxdb_2.7.1.bb</a><br>
@@ -2,7 +2,7 @@ DESCRIPTION =3D &quot;InfluxDB is a time series database de=
signed to handle high write<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://www.influxdata.com/products/inf=
luxdb-overview/" rel=3D"noreferrer" target=3D"_blank">https://www.influxdat=
a.com/products/influxdb-overview/</a>&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://src/${GO_IMPORT}/LICENSE;md5=3Df39a8d109=
30fb37bd59adabb3b9d0bd6&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://src/${GO_IMPORT}/LICENSE;md5=3D86f933429=
18318318c795b9999bd8131&quot;<br>
<br>
=C2=A0RDEPENDS:${PN} =3D &quot;bash&quot;<br>
=C2=A0RDEPENDS:${PN}-dev =3D &quot;bash&quot;<br>
@@ -15,15 +15,14 @@ GO_INSTALL =3D &quot;\<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;\<br>
-=C2=A0 =C2=A0 git://${GO_IMPORT};protocol=3Dhttps;branch=3D1.8;destsuffix=
=3D${BPN}-${PV}/src/${GO_IMPORT} \<br>
-=C2=A0 =C2=A0 file://0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patc=
h;patchdir=3Dsrc/${GO_IMPORT} \<br>
+=C2=A0 =C2=A0 git://${GO_IMPORT};protocol=3Dhttps;branch=3D2.7;destsuffix=
=3D${BPN}-${PV}/src/${GO_IMPORT} \<br>
=C2=A0 =C2=A0 =C2=A0file://influxdb \<br>
=C2=A0 =C2=A0 =C2=A0file://influxdb.conf \<br>
=C2=A0&quot;<br>
<br>
=C2=A0SRC_URI:append:mipsarch =3D &quot; file://0001-patch-term-module-for-=
mips-ispeed-ospeed-termios-abs.patch;patchdir=3Dsrc/${GO_IMPORT}&quot;<br>
<br>
-SRCREV =3D &quot;688e697c51fd5353725da078555adbeff0363d01&quot;<br>
+SRCREV =3D &quot;407fa622e9a0a48516dacc7564f7ba59c8307da9&quot;<br>
<br>
=C2=A0inherit go-mod pkgconfig systemd update-rc.d useradd<br>
<br>
-- <br>
2.41.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103307): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103307" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103307</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99550402/4240=
582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/99550402/4240582</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:peron.clem@gmail.com" ta=
rget=3D"_blank">peron.clem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000015eaea0610a9bec7--

