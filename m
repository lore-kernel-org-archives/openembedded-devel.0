Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3448C61DA4
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 13:12:39 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.10028.1677157954172211022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Feb 2023 05:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dikaprf3;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id c18so4194271wmr.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 05:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0QPJVimq8vjL1xddLBwvghRcc/bDkydZzVMPmu7E6Zc=;
        b=Dikaprf3ZLD35hgIhQpi6V3iYkIC2d3UP70OXXFhLDpkF/skTCGGLCuqhxXTnWfSL5
         4PgMap9bvgvILEBaq+FtEeNDvWR520NLU4+TMedlFVfh78ZN7ilmSkj8VFFtxrJrSoVE
         7J4O1bxrKPahhptgWJMRBhCS4O1SOTwiy9GK74yScqkqoGNfgN1jobGHrzZ7EA0lJreG
         wEtZ//gnADxR91VVA8US0iex1sATmCJHkf5bK8sIdv7fwImMN0fvhpY6vU8ighUo180X
         1cVTbQrBJ9Vs/2revNNeLmkGdLoP8+xM91qArMcPDts6HOLxGXLcK+S2ZZOlM6wa/fif
         YLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QPJVimq8vjL1xddLBwvghRcc/bDkydZzVMPmu7E6Zc=;
        b=3pJ6mPjjmaerQYAmtg0mVzCcbKaQwfPdoGUbV2byqdWGiHWQXh/hYDDxTisnw6MF3r
         3AfY4sOda47kc6Nbh+BhFOIp9rssJFIQr6iEOcvxHkaXFPxGdnghbO9n8TqYIFkxihlG
         zaQq1t7INpj73tMHUyU5AGUSXMpZtMduZ5k1p4AOC56nX2cIBGdSE9esgJKyN3Qb9AO/
         poiJo4SSoLlnbSwsHL9ZcUdPVsPVcl9eC6sxFNWOiIsY1fdEKp1guWxOoDOr7OMVxE/u
         Qqb2FkReVfhF25yG+i5C0YtAWVnEodpfoyKpIbufANzV/mKyC0zrYtc+EXw2ZIluQ/49
         sdjw==
X-Gm-Message-State: AO0yUKWjPsQFh7sVc1qng1rYYvD4Pk61xqZYfbgDUkit0BSuRejmLZlz
	slIOz0GZtDRnM9mZoaxbaharwUQnMwnQC+giTIEyaWIv5IQ=
X-Google-Smtp-Source: AK7set8iHQqDUCl1+2S4KVqR0h2BvNMCrN7YOFclarWOjIUgLgdNM3PlM/q7Jc5iU9M6zEF9G3YAn3+bwySx6keqrIw=
X-Received: by 2002:a05:600c:1e8a:b0:3dc:546c:b2ec with SMTP id
 be10-20020a05600c1e8a00b003dc546cb2ecmr240073wmb.32.1677157951873; Thu, 23
 Feb 2023 05:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20230223124050.2282580-1-yi.zhao@windriver.com>
In-Reply-To: <20230223124050.2282580-1-yi.zhao@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 23 Feb 2023 14:12:17 +0100
Message-ID: <CA+chaQfAPSZooye1LOEnUht5n5s1=y8CNYet_tf5-Zg4EuZSBg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe: fix Upstream-Status format
To: Yi Zhao <yi.zhao@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f424d905f55dc3be"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Feb 2023 13:12:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101228

--000000000000f424d905f55dc3be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Be aware that with:
https://patchwork.yoctoproject.org/project/oe-core/patch/20230215172041.636=
292-3-Martin.Jansa@gmail.com/

meta-oe layers have 81 malformed Upstream-Status entries (before your
patches are applied), so there are many more cases.

But I agree that if it's included, it should be in the right format,
because other people might copy&paste it to other new .patch files as well.

I can send fixes for the rest.

On Thu, Feb 23, 2023 at 1:41 PM Yi Zhao <yi.zhao@eng.windriver.com> wrote:

> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  .../0001-server-Adjust-the-cache-alignment-assumptions.patch  | 2 +-
>  .../obexftp/obexftp/Remove_some_printf_in_obexftpd.patch      | 2 +-
>  .../lshw/files/0001-disable-docbook2man.patch                 | 2 +-
>  .../fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch      | 2 +-
>  ...rust.configure-do-not-try-to-find-a-suitable-upstrea.patch | 2 +-
>  .../lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch               | 4 +---
>  .../hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff                | 2 +-
>  .../libb64/libb64/0001-example-Do-not-run-the-tests.patch     | 2 +-
>  ...configure.ac-do-additional-checks-on-libxml2-also-wh.patch | 4 +---
>  .../sharutils/sharutils/CVE-2018-1000097.patch                | 2 +-
>  10 files changed, 10 insertions(+), 14 deletions(-)
>
> diff --git
> a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-ser=
ver-Adjust-the-cache-alignment-assumptions.patch
> b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-ser=
ver-Adjust-the-cache-alignment-assumptions.patch
> index bf083c85f..52c9df9b1 100644
> ---
> a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-ser=
ver-Adjust-the-cache-alignment-assumptions.patch
> +++
> b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-ser=
ver-Adjust-the-cache-alignment-assumptions.patch
> @@ -15,7 +15,7 @@ src/mongo/db/stats/counters.h:185:47: error: static
> assertion failed: cache line
>  The structure need to ensure true sharing for both the elements
>  so align it to hardware_constructive_interference_size instead
>
> -Upstream-Status: Reported [https://jira.mongodb.org/browse/SERVER-65664]
> +Upstream-Status: Inappropriate [
> https://jira.mongodb.org/browse/SERVER-65664]
>
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
> diff --git
> a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obex=
ftpd.patch
> b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obex=
ftpd.patch
> index 8b73af32e..23e92885e 100644
> ---
> a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obex=
ftpd.patch
> +++
> b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_obex=
ftpd.patch
> @@ -1,6 +1,6 @@
>  Signed-off-by: Jun Zhu <R01007@freescale.com>
>
> -Upstream-Status:  Not applicable
> +Upstream-Status: Inappropriate [embedded specific]
>
>  diff -Nru obexftp-0.23/apps.orig/obexftpd.c obexftp-0.23/apps/obexftpd.c
>  --- obexftp-0.23/apps.orig/obexftpd.c  2013-11-08 10:42:20.816631583 +08=
00
> diff --git
> a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
> b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
> index 00f7b8674..706f2d524 100644
> --- a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
> +++ b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] build: Do not build .sgml file
>
>  It needs docbook2man tool which we do not have recipe for
>
> -Upstream-Status: OE-Specific [needs native docbook2man tool]
> +Upstream-Status: Inappropriate [needs native docbook2man tool]
>
>  Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
>  ---
> diff --git
> a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch
> b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch
> index 6c585c2f5..158857ae2 100644
> ---
> a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch
> +++
> b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-overwr=
ite-CFLAGS.patch
> @@ -7,7 +7,7 @@ bitbake passes CFLAGS that are often in conflict with the
> ones set
>  in mbedtls' CMakeLists.txt. Such conflicts are the inability to use
>  FORTIFY_SOURCE=3D2 except in release mode
>
> -Upstream-Status: Innapropriate [due to fluent-bit having it's own Releas=
e
> flags that also overwrite bitbake ones.]
> +Upstream-Status: Inappropriate [due to fluent-bit having it's own Releas=
e
> flags that also overwrite bitbake ones.]
>  ---
>   lib/mbedtls-2.28.0/CMakeLists.txt | 2 --
>   1 file changed, 2 deletions(-)
> diff --git
> a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> index e63b05356..202f12612 100644
> ---
> a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> +++
> b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-try=
-to-find-a-suitable-upstrea.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] rust.configure: do not try to find a
> suitable upstream target
>
>  OE is using custom targets and so this is bound to fail.
>
> -Upstream-Status: Inapppropriate [oe-core specific]
> +Upstream-Status: Inappropriate [oe-core specific]
>  Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
>  ---
> diff --git
> a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch
> b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch
> index afe11f353..d232f6913 100644
> --- a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patc=
h
> +++ b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patc=
h
> @@ -3,9 +3,7 @@ From: dgod <dgod.osa@gmail.com>
>  Date: Mon, 21 Mar 2016 19:25:25 +0800
>  Subject: [PATCH] fix css under gtk 3.20
>
> -Upstream-Status: Applied [1]
> -
> -[1]
> https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd9=
454d70e4b0753531e46580416771
> +Upstream-Status
> <https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd=
9454d70e4b0753531e46580416771+Upstream-Status>:
> Backport [
> https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd9=
454d70e4b0753531e46580416771
> ]
>  ---
>   data/themes/Industrial/gtk.css | 1 +
>   1 file changed, 1 insertion(+)
> diff --git
> a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
> b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
> index 057b1fd1d..60953381a 100644
> --- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
> +++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff
> @@ -6,7 +6,7 @@ Filtered with:
>    filterdiff -p1 -x README -x 'debian/*'
>
>
> -Upstream-Status: unmaintained
> +Upstream-Status: Inappropriate [unmaintained]
>
>  Index: hddtemp-0.3-beta15/doc/hddtemp.8
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git
> a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests=
.patch
> b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests=
.patch
> index ea3ddfb64..b3ee24d9d 100644
> ---
> a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests=
.patch
> +++
> b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tests=
.patch
> @@ -3,7 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
>  Date: Sat, 27 Mar 2021 21:41:04 -0700
>  Subject: [PATCH] example: Do not run the tests
>
> -Upstream-Status: Inappropritate [Cross-compile specific]
> +Upstream-Status: Inappropriate [Cross-compile specific]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  ---
>   examples/Makefile | 3 ---
> diff --git
> a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-c=
hecks-on-libxml2-also-wh.patch
> b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-c=
hecks-on-libxml2-also-wh.patch
> index 7faeb130a..490b61f1f 100644
> ---
> a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-c=
hecks-on-libxml2-also-wh.patch
> +++
> b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional-c=
hecks-on-libxml2-also-wh.patch
> @@ -7,9 +7,7 @@ MIME-Version: 1.0
>  Content-Type: text/plain; charset=3DUTF-8
>  Content-Transfer-Encoding: 8bit
>
> -Upstream-Status: Applied [1]
> -
> -[1] https://github.com/dajobe/raptor/pull/33
> +Upstream-Status: Backport [
> https://github.com/dajobe/raptor/commit/e75b1dbb7f2a6514b8d391b200c45a2be=
c6268bf
> ]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>  ---
> diff --git
> a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
> b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
> index 99dc4e304..47eb9cfd6 100644
> --- a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
> +++ b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch
> @@ -36,7 +36,7 @@ This was reported in
>  <http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html>.
>
>  CVE: CVE-2018-1000097
> -Upstream-Status: no upstream [
> http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html]
> +Upstream-Status: Inappropriate [no upstream]
>  Signed-off-by: Petr P=C3=ADsa=C5=99 <ppisar@redhat.com>
>  Signed-off-by: Sinan Kaya <okaya@kernel.org>
>  ---
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101224):
> https://lists.openembedded.org/g/openembedded-devel/message/101224
> Mute This Topic: https://lists.openembedded.org/mt/97181611/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f424d905f55dc3be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Be aware that with:<div><a href=3D"https://patchwork.yocto=
project.org/project/oe-core/patch/20230215172041.636292-3-Martin.Jansa@gmai=
l.com/">https://patchwork.yoctoproject.org/project/oe-core/patch/2023021517=
2041.636292-3-Martin.Jansa@gmail.com/</a><br></div><div><br></div><div>meta=
-oe layers have 81 malformed Upstream-Status entries (before your patches a=
re applied), so there are many more cases.</div><div><br></div><div>But I a=
gree that if it&#39;s included, it should be in the right format, because o=
ther people might copy&amp;paste it to other new .patch files as well.</div=
><div><br></div><div>I can send fixes for the rest.</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 23, 20=
23 at 1:41 PM Yi Zhao &lt;<a href=3D"mailto:yi.zhao@eng.windriver.com">yi.z=
hao@eng.windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Signed-off-by: Yi Zhao &lt;<a href=3D"mailto:yi.zhao@w=
indriver.com" target=3D"_blank">yi.zhao@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-server-Adjust-the-cache-alignment-assumptions.patch=C2=A0 | =
2 +-<br>
=C2=A0.../obexftp/obexftp/Remove_some_printf_in_obexftpd.patch=C2=A0 =C2=A0=
 =C2=A0 | 2 +-<br>
=C2=A0.../lshw/files/0001-disable-docbook2man.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0.../fluentbit/0003-mbedtls-Do-not-overwrite-CFLAGS.patch=C2=A0 =C2=A0=
 =C2=A0 | 2 +-<br>
=C2=A0...rust.configure-do-not-try-to-find-a-suitable-upstrea.patch | 2 +-<=
br>
=C2=A0.../lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 +---<br>
=C2=A0.../hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0.../libb64/libb64/0001-example-Do-not-run-the-tests.patch=C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0...configure.ac-do-additional-checks-on-libxml2-also-wh.patch | 4 +--=
-<br>
=C2=A0.../sharutils/sharutils/CVE-2018-1000097.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A010 files changed, 10 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb=
/0001-server-Adjust-the-cache-alignment-assumptions.patch b/meta-oe/dynamic=
-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-server-Adjust-the-cach=
e-alignment-assumptions.patch<br>
index bf083c85f..52c9df9b1 100644<br>
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-s=
erver-Adjust-the-cache-alignment-assumptions.patch<br>
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-s=
erver-Adjust-the-cache-alignment-assumptions.patch<br>
@@ -15,7 +15,7 @@ src/mongo/db/stats/counters.h:185:47: error: static asser=
tion failed: cache line<br>
=C2=A0The structure need to ensure true sharing for both the elements<br>
=C2=A0so align it to hardware_constructive_interference_size instead<br>
<br>
-Upstream-Status: Reported [<a href=3D"https://jira.mongodb.org/browse/SERV=
ER-65664" rel=3D"noreferrer" target=3D"_blank">https://jira.mongodb.org/bro=
wse/SERVER-65664</a>]<br>
+Upstream-Status: Inappropriate [<a href=3D"https://jira.mongodb.org/browse=
/SERVER-65664" rel=3D"noreferrer" target=3D"_blank">https://jira.mongodb.or=
g/browse/SERVER-65664</a>]<br>
<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
diff --git a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_print=
f_in_obexftpd.patch b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_s=
ome_printf_in_obexftpd.patch<br>
index 8b73af32e..23e92885e 100644<br>
--- a/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_ob=
exftpd.patch<br>
+++ b/meta-oe/recipes-connectivity/obexftp/obexftp/Remove_some_printf_in_ob=
exftpd.patch<br>
@@ -1,6 +1,6 @@<br>
=C2=A0Signed-off-by: Jun Zhu &lt;<a href=3D"mailto:R01007@freescale.com" ta=
rget=3D"_blank">R01007@freescale.com</a>&gt;<br>
<br>
-Upstream-Status:=C2=A0 Not applicable<br>
+Upstream-Status: Inappropriate [embedded specific]<br>
<br>
=C2=A0diff -Nru obexftp-0.23/apps.orig/obexftpd.c obexftp-0.23/apps/obexftp=
d.c<br>
=C2=A0--- obexftp-0.23/apps.orig/obexftpd.c=C2=A0 2013-11-08 10:42:20.81663=
1583 +0800<br>
diff --git a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.p=
atch b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch<b=
r>
index 00f7b8674..706f2d524 100644<br>
--- a/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch<br=
>
+++ b/meta-oe/recipes-devtools/lshw/files/0001-disable-docbook2man.patch<br=
>
@@ -5,7 +5,7 @@ Subject: [PATCH] build: Do not build .sgml file<br>
<br>
=C2=A0It needs docbook2man tool which we do not have recipe for<br>
<br>
-Upstream-Status: OE-Specific [needs native docbook2man tool]<br>
+Upstream-Status: Inappropriate [needs native docbook2man tool]<br>
<br>
=C2=A0Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@foun=
dries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
=C2=A0---<br>
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-n=
ot-overwrite-CFLAGS.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/00=
03-mbedtls-Do-not-overwrite-CFLAGS.patch<br>
index 6c585c2f5..158857ae2 100644<br>
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-over=
write-CFLAGS.patch<br>
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0003-mbedtls-Do-not-over=
write-CFLAGS.patch<br>
@@ -7,7 +7,7 @@ bitbake passes CFLAGS that are often in conflict with the o=
nes set<br>
=C2=A0in mbedtls&#39; CMakeLists.txt. Such conflicts are the inability to u=
se<br>
=C2=A0FORTIFY_SOURCE=3D2 except in release mode<br>
<br>
-Upstream-Status: Innapropriate [due to fluent-bit having it&#39;s own Rele=
ase flags that also overwrite bitbake ones.]<br>
+Upstream-Status: Inappropriate [due to fluent-bit having it&#39;s own Rele=
ase flags that also overwrite bitbake ones.]<br>
=C2=A0---<br>
=C2=A0 lib/mbedtls-2.28.0/CMakeLists.txt | 2 --<br>
=C2=A0 1 file changed, 2 deletions(-)<br>
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-d=
o-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/mozjs=
/mozjs-102/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.patch<=
br>
index e63b05356..202f12612 100644<br>
--- a/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-t=
ry-to-find-a-suitable-upstrea.patch<br>
+++ b/meta-oe/recipes-extended/mozjs/mozjs-102/0003-rust.configure-do-not-t=
ry-to-find-a-suitable-upstrea.patch<br>
@@ -5,7 +5,7 @@ Subject: [PATCH] rust.configure: do not try to find a suita=
ble upstream target<br>
<br>
=C2=A0OE is using custom targets and so this is bound to fail.<br>
<br>
-Upstream-Status: Inapppropriate [oe-core specific]<br>
+Upstream-Status: Inappropriate [oe-core specific]<br>
=C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutroni=
x.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
<br>
=C2=A0---<br>
diff --git a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20=
.patch b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.pat=
ch<br>
index afe11f353..d232f6913 100644<br>
--- a/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch<=
br>
+++ b/meta-oe/recipes-graphics/lxdm/lxdm/0004-fix-css-under-gtk-3.20.patch<=
br>
@@ -3,9 +3,7 @@ From: dgod &lt;<a href=3D"mailto:dgod.osa@gmail.com" target=
=3D"_blank">dgod.osa@gmail.com</a>&gt;<br>
=C2=A0Date: Mon, 21 Mar 2016 19:25:25 +0800<br>
=C2=A0Subject: [PATCH] fix css under gtk 3.20<br>
<br>
-Upstream-Status: Applied [1]<br>
-<br>
-[1] <a href=3D"https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dpatch;h=
=3D72812894cfd9454d70e4b0753531e46580416771+Upstream-Status" rel=3D"norefer=
rer" target=3D"_blank">https://git.lxde.org/gitweb/?p=3Dlxde/lxdm.git;a=3Dp=
atch;h=3D72812894cfd9454d70e4b0753531e46580416771<br>
+Upstream-Status</a>: Backport [<a href=3D"https://git.lxde.org/gitweb/?p=
=3Dlxde/lxdm.git;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e46580416771" re=
l=3D"noreferrer" target=3D"_blank">https://git.lxde.org/gitweb/?p=3Dlxde/lx=
dm.git;a=3Dpatch;h=3D72812894cfd9454d70e4b0753531e46580416771</a>]<br>
=C2=A0---<br>
=C2=A0 data/themes/Industrial/gtk.css | 1 +<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
diff --git a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.=
diff b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff<b=
r>
index 057b1fd1d..60953381a 100644<br>
--- a/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff<br=
>
+++ b/meta-oe/recipes-support/hddtemp/hddtemp/hddtemp_0.3-beta15-52.diff<br=
>
@@ -6,7 +6,7 @@ Filtered with:<br>
=C2=A0 =C2=A0filterdiff -p1 -x README -x &#39;debian/*&#39;<br>
<br>
<br>
-Upstream-Status: unmaintained<br>
+Upstream-Status: Inappropriate [unmaintained]<br>
<br>
=C2=A0Index: hddtemp-0.3-beta15/doc/hddtemp.8<br>
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
diff --git a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-=
the-tests.patch b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not=
-run-the-tests.patch<br>
index ea3ddfb64..b3ee24d9d 100644<br>
--- a/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tes=
ts.patch<br>
+++ b/meta-oe/recipes-support/libb64/libb64/0001-example-Do-not-run-the-tes=
ts.patch<br>
@@ -3,7 +3,7 @@ From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0Date: Sat, 27 Mar 2021 21:41:04 -0700<br>
=C2=A0Subject: [PATCH] example: Do not run the tests<br>
<br>
-Upstream-Status: Inappropritate [Cross-compile specific]<br>
+Upstream-Status: Inappropriate [Cross-compile specific]<br>
=C2=A0Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" tar=
get=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 examples/Makefile | 3 ---<br>
diff --git a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-add=
itional-checks-on-libxml2-also-wh.patch b/meta-oe/recipes-support/raptor2/f=
iles/0001-configure.ac-do-additional-checks-on-libxml2-also-wh.patch<br>
index 7faeb130a..490b61f1f 100644<br>
--- a/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional=
-checks-on-libxml2-also-wh.patch<br>
+++ b/meta-oe/recipes-support/raptor2/files/0001-configure.ac-do-additional=
-checks-on-libxml2-also-wh.patch<br>
@@ -7,9 +7,7 @@ MIME-Version: 1.0<br>
=C2=A0Content-Type: text/plain; charset=3DUTF-8<br>
=C2=A0Content-Transfer-Encoding: 8bit<br>
<br>
-Upstream-Status: Applied [1]<br>
-<br>
-[1] <a href=3D"https://github.com/dajobe/raptor/pull/33" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/dajobe/raptor/pull/33</a><br>
+Upstream-Status: Backport [<a href=3D"https://github.com/dajobe/raptor/com=
mit/e75b1dbb7f2a6514b8d391b200c45a2bec6268bf" rel=3D"noreferrer" target=3D"=
_blank">https://github.com/dajobe/raptor/commit/e75b1dbb7f2a6514b8d391b200c=
45a2bec6268bf</a>]<br>
<br>
=C2=A0Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzelton=
y@googlemail.com" target=3D"_blank">schnitzeltony@googlemail.com</a>&gt;<br=
>
=C2=A0---<br>
diff --git a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.p=
atch b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch<b=
r>
index 99dc4e304..47eb9cfd6 100644<br>
--- a/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch<br=
>
+++ b/meta-oe/recipes-support/sharutils/sharutils/CVE-2018-1000097.patch<br=
>
@@ -36,7 +36,7 @@ This was reported in<br>
=C2=A0&lt;<a href=3D"http://lists.gnu.org/archive/html/bug-gnu-utils/2018-0=
2/msg00004.html" rel=3D"noreferrer" target=3D"_blank">http://lists.gnu.org/=
archive/html/bug-gnu-utils/2018-02/msg00004.html</a>&gt;.<br>
<br>
=C2=A0CVE: CVE-2018-1000097<br>
-Upstream-Status: no upstream [<a href=3D"http://lists.gnu.org/archive/html=
/bug-gnu-utils/2018-02/msg00004.html" rel=3D"noreferrer" target=3D"_blank">=
http://lists.gnu.org/archive/html/bug-gnu-utils/2018-02/msg00004.html</a>]<=
br>
+Upstream-Status: Inappropriate [no upstream]<br>
=C2=A0Signed-off-by: Petr P=C3=ADsa=C5=99 &lt;<a href=3D"mailto:ppisar@redh=
at.com" target=3D"_blank">ppisar@redhat.com</a>&gt;<br>
=C2=A0Signed-off-by: Sinan Kaya &lt;<a href=3D"mailto:okaya@kernel.org" tar=
get=3D"_blank">okaya@kernel.org</a>&gt;<br>
=C2=A0---<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#101224): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/101224" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/101224</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97181611/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97181611/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000f424d905f55dc3be--

