Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E0DC6FA82
	for <webhook@archiver.kernel.org>; Sat, 10 Sep 2022 08:09:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.1672.1662797388487556173
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Sep 2022 01:09:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Blp30rhO;
 spf=pass (domain: gmail.com, ip: 209.85.221.46,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id bz13so6846329wrb.2
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Sep 2022 01:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=WxsVmGLxP9qG8xAjnL8BFx3yjLUUTioFjo0t7Z6PPbo=;
        b=Blp30rhObbwTFlkIBuM1PPB+aqlzT86UcM0E9C9Sa2IDfzB3g50f311zVBfJcs8n4X
         e0k7SyhphiHQm9RbRY41AxraLn8zrKYQwBJTTlZPclQrHmCalXOdiucc2hOixFBK3JhV
         7NyU9rdu7hpwQwG2hQwAM9vDzOdrPGcoNgIRxYQ8gcfoGshOwYcKTtEsdxFkp9vaQqOU
         wdWfXJWN3c80ERKVgiRYMqfaFjlvivE4xccolihWtCzUyg/UlU+srZ/UNIGwdusAKwOF
         E02m4fd8D6c30uHupMmuQ8Px+2+J/JctmEw0fL1uGOLSreeK0hsJQlJsc2BnX1k2/zRe
         Zljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=WxsVmGLxP9qG8xAjnL8BFx3yjLUUTioFjo0t7Z6PPbo=;
        b=aGb6JshBws47Pq4WbQ7vwZNhhmxKtjHwGsRvFm/+8RFA6IOndEQkeNZhCana8RTg/E
         DuFuMj+TAs/tx8gXbTUZu71+uIjjX5G0yM407V6AczhRZc1U0zzpQs6MK8ap0r5YrGpm
         xwXTrp27tX8aJD2JOaNLr6eglnUwQWYFNE3UvSF7LpGuwwP7X+GAnMCk6U+pMAE6IjTm
         Wz5d76RxNzl8jCD7xVpH+m12q76yj938Yx8MYW0mY2BJbE24NHBGcGuPop6V2NL0IVKK
         xIIz6RAiyar3Gs3VdikMqNGa8lNq8Q/vcttgTglMZuy3wJ5CXkrH+YSsvsfCSaTt0ypA
         A28A==
X-Gm-Message-State: ACgBeo1QZnBCaLLysIJM3wKI1eRDMXjUBITM1OdT77AqnOn1e64fDR8v
	ERvkCmLjJsUdId0zNvWGA+G+pE4sRNtz4EmsdMk=
X-Google-Smtp-Source: 
 AA6agR6rQa8jRMsnamr84EcBgE/8yBsZxVuEJPKDHZ3jRaZqmAw4776vDbu4AADeErOJ/i+q/kNllRvcMhItzR3NDwc=
X-Received: by 2002:a5d:6d0b:0:b0:222:955a:8774 with SMTP id
 e11-20020a5d6d0b000000b00222955a8774mr9454993wrq.129.1662797386732; Sat, 10
 Sep 2022 01:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <1662442335-7255-1-git-send-email-wangmy@fujitsu.com>
 <1662442335-7255-2-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1662442335-7255-2-git-send-email-wangmy@fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 10 Sep 2022 10:09:34 +0200
Message-ID: 
 <CA+chaQdaqbL6hVzHq=QX217ju2GkYGywHT7gYgfYoyH2+jo6ew@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] lvm2/libdevmapper: upgrade 2.03.11 ->
 2.03.16
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000091d98c05e84e2f05"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Sep 2022 08:09:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98732

--00000000000091d98c05e84e2f05
Content-Type: text/plain; charset="UTF-8"

With this version I'm seeing both lvm2 and libdevmapper failing with::

    [CC] ioctl/libdevmapper.so.1.02
TOPDIR/..../12.2.0/ld: warning: using 'DM_1_02_129' as version for
'dm_bitset_parse_list' which is also named in version 'DM_1_02_138' in
script
TOPDIR/..../12.2.0/ld: error: datastruct/bitset.o: multiple definition of
'dm_bitset_parse_list'
TOPDIR/..../12.2.0/ld: datastruct/bitset.o: previous definition here

anyone else seeing the same?

On Tue, Sep 6, 2022 at 7:32 AM wangmy <wangmy@fujitsu.com> wrote:

> 0005-do-not-build-manual.patch
> 0006-start-lvm2-monitor.service-after-tmp.mount.patch
> refreshed for new version.
>
> Add bash to RDEPENDS.
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../lvm2/files/0005-do-not-build-manual.patch | 23 ++++++++++---------
>  ...lvm2-monitor.service-after-tmp.mount.patch | 11 +++++----
>  ...per_2.03.11.bb => libdevmapper_2.03.16.bb} |  0
>  meta-oe/recipes-support/lvm2/lvm2.inc         |  2 +-
>  .../lvm2/{lvm2_2.03.11.bb => lvm2_2.03.16.bb} |  1 +
>  5 files changed, 21 insertions(+), 16 deletions(-)
>  rename meta-oe/recipes-support/lvm2/{libdevmapper_2.03.11.bb =>
> libdevmapper_2.03.16.bb} (100%)
>  rename meta-oe/recipes-support/lvm2/{lvm2_2.03.11.bb => lvm2_2.03.16.bb}
> (99%)
>
> diff --git
> a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> index 7117d99a39..7979efbefb 100644
> --- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> +++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch
> @@ -15,25 +15,26 @@ Upstream-Status: Pending
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
> -
>  Update context for lvm2 2.03.02.
> -
>  Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +Update context for lvm2 2.03.16.
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>  ---
>   Makefile.in  | 6 +++---
>   configure.ac | 1 -
>   2 files changed, 3 insertions(+), 4 deletions(-)
>
>  diff --git a/Makefile.in b/Makefile.in
> -index 6a1a990..80cba91 100644
> +index 3b7e0ec..37f14eb 100644
>  --- a/Makefile.in
>  +++ b/Makefile.in
>  @@ -18,7 +18,7 @@ top_builddir = @top_builddir@
>   abs_top_builddir = @abs_top_builddir@
>   abs_top_srcdir = @abs_top_srcdir@
>
> --SUBDIRS = conf daemons include lib libdaemon libdm man scripts tools
> -+SUBDIRS = conf daemons include lib libdaemon libdm scripts tools
> +-SUBDIRS = libdm conf daemons include lib libdaemon man scripts tools
> ++SUBDIRS = libdm conf daemons include lib libdaemon scripts tools
>
>   ifeq ("@UDEV_RULES@", "yes")
>     SUBDIRS += udev
> @@ -46,20 +47,20 @@ index 6a1a990..80cba91 100644
>       libdaemon lib tools daemons libdm \
>       udev po
>   tools.distclean: test.distclean
> -@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper
> +@@ -59,7 +59,7 @@ unit-test  run-unit-test: test
> +
>   daemons.device-mapper: libdm.device-mapper
>   tools.device-mapper: libdm.device-mapper
> - scripts.device-mapper: include.device-mapper
>  -device-mapper: tools.device-mapper daemons.device-mapper
> man.device-mapper
>  +device-mapper: tools.device-mapper daemons.device-mapper
> + device_mapper: device-mapper
>
>   ifeq ("@INTL@", "yes")
> - lib.pofile: include.pofile
>  diff --git a/configure.ac b/configure.ac
> -index 7fd0561..4154dc0 100644
> +index 6def519..18a5c97 100644
>  --- a/configure.ac
>  +++ b/configure.ac
> -@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile
> +@@ -2018,7 +2018,6 @@ libdaemon/server/Makefile
>   libdm/Makefile
>   libdm/dm-tools/Makefile
>   libdm/libdevmapper.pc
> @@ -68,5 +69,5 @@ index 7fd0561..4154dc0 100644
>   scripts/lvm2-pvscan.service
>   scripts/blkdeactivate.sh
>  --
> -2.7.4
> +2.25.1
>
> diff --git
> a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
> b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
> index 9f9383ef48..5b9b2d5748 100644
> ---
> a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
> +++
> b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-after-tmp.mount.patch
> @@ -11,23 +11,26 @@ Upstream-Status: Inappropriate [oe specific]
>
>  Rebase to v2_03_05
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Rebase to v2_03_16
> +Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
>  ---
>   scripts/lvm2_monitoring_systemd_red_hat.service.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/scripts/lvm2_monitoring_systemd_red_hat.service.in
> b/scripts/lvm2_monitoring_systemd_red_hat.service.in
> -index 4bf744a..46766cb 100644
> +index c0c96e3..2a99a37 100644
>  --- a/scripts/lvm2_monitoring_systemd_red_hat.service.in
>  +++ b/scripts/lvm2_monitoring_systemd_red_hat.service.in
>  @@ -2,7 +2,7 @@
>   Description=Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or
> progress polling
>   Documentation=man:dmeventd(8) man:lvcreate(8) man:lvchange(8)
> man:vgchange(8)
>   Requires=dm-event.socket
> --After=dm-event.socket dm-event.service lvm2-activation.service
> -+After=dm-event.socket dm-event.service lvm2-activation.service tmp.mount
> +-After=dm-event.socket dm-event.service
> ++After=dm-event.socket dm-event.service tmp.mount
>   Before=local-fs-pre.target shutdown.target
>   DefaultDependencies=no
>   Conflicts=shutdown.target
>  --
> -2.7.4
> +2.25.1
>
> diff --git a/meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
> b/meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
> similarity index 100%
> rename from meta-oe/recipes-support/lvm2/libdevmapper_2.03.11.bb
> rename to meta-oe/recipes-support/lvm2/libdevmapper_2.03.16.bb
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc
> b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 0c593b2042..34e57ec7a5 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -18,7 +18,7 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main
> \
>             file://reproducible-build.patch \
>             "
>
> -SRCREV = "3e8bd8d1bd70691f09a170785836aeb4f83154e6"
> +SRCREV = "6d1e894a867681af7a811ed63bc435f3aa55fec8"
>  S = "${WORKDIR}/git"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
> similarity index 99%
> rename from meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> rename to meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
> index a729324c9b..6a6cdc7cef 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.03.11.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.03.16.bb
> @@ -68,6 +68,7 @@ FILES:${PN}-scripts = " \
>  # Specified explicitly for the udev rules, just in case that it does not
> get picked
>  # up automatically:
>  FILES:${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
> +RDEPENDS:${PN} = "bash"
>  RDEPENDS:${PN}-udevrules = "libdevmapper"
>  RDEPENDS:${PN}:append:class-target = " libdevmapper"
>  RDEPENDS:${PN}:append:class-nativesdk = " libdevmapper"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#98676):
> https://lists.openembedded.org/g/openembedded-devel/message/98676
> Mute This Topic: https://lists.openembedded.org/mt/93495342/3617156
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000091d98c05e84e2f05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">With this version I&#39;m seeing both lvm2 and libdevmappe=
r failing with::<div><br></div><div>=C2=A0 =C2=A0 [CC] ioctl/libdevmapper.s=
o.1.02<br>TOPDIR/..../12.2.0/ld: warning: using &#39;DM_1_02_129&#39; as ve=
rsion for &#39;dm_bitset_parse_list&#39; which is also named in version &#3=
9;DM_1_02_138&#39; in script<br>TOPDIR/..../12.2.0/ld: error: datastruct/bi=
tset.o: multiple definition of &#39;dm_bitset_parse_list&#39;<br>TOPDIR/...=
./12.2.0/ld: datastruct/bitset.o: previous definition here<br></div><div><b=
r></div><div>anyone else seeing the same?</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 6, 2022 at 7:32 =
AM wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">0005-=
do-not-build-manual.patch<br>
0006-start-lvm2-monitor.service-after-tmp.mount.patch<br>
refreshed for new version.<br>
<br>
Add bash to RDEPENDS.<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../lvm2/files/0005-do-not-build-manual.patch | 23 ++++++++++--------=
-<br>
=C2=A0...lvm2-monitor.service-after-tmp.mount.patch | 11 +++++----<br>
=C2=A0...<a href=3D"http://per_2.03.11.bb" rel=3D"noreferrer" target=3D"_bl=
ank">per_2.03.11.bb</a> =3D&gt; <a href=3D"http://libdevmapper_2.03.16.bb" =
rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.16.bb</a>} |=C2=A0 0=
<br>
=C2=A0meta-oe/recipes-support/lvm2/lvm2.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0.../lvm2/{<a href=3D"http://lvm2_2.03.11.bb" rel=3D"noreferrer" targe=
t=3D"_blank">lvm2_2.03.11.bb</a> =3D&gt; <a href=3D"http://lvm2_2.03.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.16.bb</a>} |=C2=A0 1 +<br>
=C2=A05 files changed, 21 insertions(+), 16 deletions(-)<br>
=C2=A0rename meta-oe/recipes-support/lvm2/{<a href=3D"http://libdevmapper_2=
.03.11.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.11.bb</a>=
 =3D&gt; <a href=3D"http://libdevmapper_2.03.16.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libdevmapper_2.03.16.bb</a>} (100%)<br>
=C2=A0rename meta-oe/recipes-support/lvm2/{<a href=3D"http://lvm2_2.03.11.b=
b" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.11.bb</a> =3D&gt; <a href=
=3D"http://lvm2_2.03.16.bb" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.=
16.bb</a>} (99%)<br>
<br>
diff --git a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.pa=
tch b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch<br>
index 7117d99a39..7979efbefb 100644<br>
--- a/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch<br>
+++ b/meta-oe/recipes-support/lvm2/files/0005-do-not-build-manual.patch<br>
@@ -15,25 +15,26 @@ Upstream-Status: Pending<br>
<br>
=C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
<br>
-<br>
=C2=A0Update context for lvm2 2.03.02.<br>
-<br>
=C2=A0Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com"=
 target=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
+<br>
+Update context for lvm2 2.03.16.<br>
+Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 Makefile.in=C2=A0 | 6 +++---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 1 -<br>
=C2=A0 2 files changed, 3 insertions(+), 4 deletions(-)<br>
<br>
=C2=A0diff --git a/Makefile.in b/Makefile.in<br>
-index 6a1a990..80cba91 100644<br>
+index 3b7e0ec..37f14eb 100644<br>
=C2=A0--- a/Makefile.in<br>
=C2=A0+++ b/Makefile.in<br>
=C2=A0@@ -18,7 +18,7 @@ top_builddir =3D @top_builddir@<br>
=C2=A0 abs_top_builddir =3D @abs_top_builddir@<br>
=C2=A0 abs_top_srcdir =3D @abs_top_srcdir@<br>
<br>
--SUBDIRS =3D conf daemons include lib libdaemon libdm man scripts tools<br=
>
-+SUBDIRS =3D conf daemons include lib libdaemon libdm scripts tools<br>
+-SUBDIRS =3D libdm conf daemons include lib libdaemon man scripts tools<br=
>
++SUBDIRS =3D libdm conf daemons include lib libdaemon scripts tools<br>
<br>
=C2=A0 ifeq (&quot;@UDEV_RULES@&quot;, &quot;yes&quot;)<br>
=C2=A0 =C2=A0 SUBDIRS +=3D udev<br>
@@ -46,20 +47,20 @@ index 6a1a990..80cba91 100644<br>
=C2=A0 =C2=A0 =C2=A0 libdaemon lib tools daemons libdm \<br>
=C2=A0 =C2=A0 =C2=A0 udev po<br>
=C2=A0 tools.distclean: test.distclean<br>
-@@ -65,7 +65,7 @@ libdm.device-mapper: include.device-mapper<br>
+@@ -59,7 +59,7 @@ unit-test=C2=A0 run-unit-test: test<br>
+ <br>
=C2=A0 daemons.device-mapper: libdm.device-mapper<br>
=C2=A0 tools.device-mapper: libdm.device-mapper<br>
- scripts.device-mapper: include.device-mapper<br>
=C2=A0-device-mapper: tools.device-mapper daemons.device-mapper man.device-=
mapper<br>
=C2=A0+device-mapper: tools.device-mapper daemons.device-mapper<br>
+ device_mapper: device-mapper<br>
<br>
=C2=A0 ifeq (&quot;@INTL@&quot;, &quot;yes&quot;)<br>
- lib.pofile: include.pofile<br>
=C2=A0diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" targe=
t=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"nore=
ferrer" target=3D"_blank">configure.ac</a><br>
-index 7fd0561..4154dc0 100644<br>
+index 6def519..18a5c97 100644<br>
=C2=A0--- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
=C2=A0+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a><br>
-@@ -1812,7 +1812,6 @@ libdaemon/server/Makefile<br>
+@@ -2018,7 +2018,6 @@ libdaemon/server/Makefile<br>
=C2=A0 libdm/Makefile<br>
=C2=A0 libdm/dm-tools/Makefile<br>
=C2=A0 libdm/libdevmapper.pc<br>
@@ -68,5 +69,5 @@ index 7fd0561..4154dc0 100644<br>
=C2=A0 scripts/lvm2-pvscan.service<br>
=C2=A0 scripts/blkdeactivate.sh<br>
=C2=A0-- <br>
-2.7.4<br>
+2.25.1<br>
<br>
diff --git a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.ser=
vice-after-tmp.mount.patch b/meta-oe/recipes-support/lvm2/files/0006-start-=
lvm2-monitor.service-after-tmp.mount.patch<br>
index 9f9383ef48..5b9b2d5748 100644<br>
--- a/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-af=
ter-tmp.mount.patch<br>
+++ b/meta-oe/recipes-support/lvm2/files/0006-start-lvm2-monitor.service-af=
ter-tmp.mount.patch<br>
@@ -11,23 +11,26 @@ Upstream-Status: Inappropriate [oe specific]<br>
<br>
=C2=A0Rebase to v2_03_05<br>
=C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+<br>
+Rebase to v2_03_16<br>
+Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" targe=
t=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
=C2=A0---<br>
=C2=A0 scripts/<a href=3D"http://lvm2_monitoring_systemd_red_hat.service.in=
" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring_systemd_red_hat.serv=
ice.in</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
=C2=A0diff --git a/scripts/<a href=3D"http://lvm2_monitoring_systemd_red_ha=
t.service.in" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring_systemd_=
red_hat.service.in</a> b/scripts/<a href=3D"http://lvm2_monitoring_systemd_=
red_hat.service.in" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring_sy=
stemd_red_hat.service.in</a><br>
-index 4bf744a..46766cb 100644<br>
+index c0c96e3..2a99a37 100644<br>
=C2=A0--- a/scripts/<a href=3D"http://lvm2_monitoring_systemd_red_hat.servi=
ce.in" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring_systemd_red_hat=
.service.in</a><br>
=C2=A0+++ b/scripts/<a href=3D"http://lvm2_monitoring_systemd_red_hat.servi=
ce.in" rel=3D"noreferrer" target=3D"_blank">lvm2_monitoring_systemd_red_hat=
.service.in</a><br>
=C2=A0@@ -2,7 +2,7 @@<br>
=C2=A0 Description=3DMonitoring of LVM2 mirrors, snapshots etc. using dmeve=
ntd or progress polling<br>
=C2=A0 Documentation=3Dman:dmeventd(8) man:lvcreate(8) man:lvchange(8) man:=
vgchange(8)<br>
=C2=A0 Requires=3Ddm-event.socket<br>
--After=3Ddm-event.socket dm-event.service lvm2-activation.service<br>
-+After=3Ddm-event.socket dm-event.service lvm2-activation.service tmp.moun=
t<br>
+-After=3Ddm-event.socket dm-event.service<br>
++After=3Ddm-event.socket dm-event.service tmp.mount<br>
=C2=A0 Before=3Dlocal-fs-pre.target shutdown.target<br>
=C2=A0 DefaultDependencies=3Dno<br>
=C2=A0 Conflicts=3Dshutdown.target<br>
=C2=A0-- <br>
-2.7.4<br>
+2.25.1<br>
<br>
diff --git a/meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.=
03.11.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.11.bb</a> =
b/meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.03.16.bb" r=
el=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.16.bb</a><br>
similarity index 100%<br>
rename from meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.0=
3.11.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.11.bb</a><b=
r>
rename to meta-oe/recipes-support/lvm2/<a href=3D"http://libdevmapper_2.03.=
16.bb" rel=3D"noreferrer" target=3D"_blank">libdevmapper_2.03.16.bb</a><br>
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-suppor=
t/lvm2/lvm2.inc<br>
index 0c593b2042..34e57ec7a5 100644<br>
--- a/meta-oe/recipes-support/lvm2/lvm2.inc<br>
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc<br>
@@ -18,7 +18,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://sourceware.org/=
git/lvm2.git;branch=3Dmain" rel=3D"noreferrer" target=3D"_blank">sourceware=
.org/git/lvm2.git;branch=3Dmain</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://reproducible-build.patch \=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRCREV =3D &quot;3e8bd8d1bd70691f09a170785836aeb4f83154e6&quot;<br>
+SRCREV =3D &quot;6d1e894a867681af7a811ed63bc435f3aa55fec8&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;v(?P&lt;pver&gt;\d+(\_\d+)+)&quo=
t;<br>
diff --git a/meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03.11.bb=
" rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.11.bb</a> b/meta-oe/recipe=
s-support/lvm2/<a href=3D"http://lvm2_2.03.16.bb" rel=3D"noreferrer" target=
=3D"_blank">lvm2_2.03.16.bb</a><br>
similarity index 99%<br>
rename from meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03.11.bb"=
 rel=3D"noreferrer" target=3D"_blank">lvm2_2.03.11.bb</a><br>
rename to meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03.16.bb" r=
el=3D"noreferrer" target=3D"_blank">lvm2_2.03.16.bb</a><br>
index a729324c9b..6a6cdc7cef 100644<br>
--- a/meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03.11.bb" rel=
=3D"noreferrer" target=3D"_blank">lvm2_2.03.11.bb</a><br>
+++ b/meta-oe/recipes-support/lvm2/<a href=3D"http://lvm2_2.03.16.bb" rel=
=3D"noreferrer" target=3D"_blank">lvm2_2.03.16.bb</a><br>
@@ -68,6 +68,7 @@ FILES:${PN}-scripts =3D &quot; \<br>
=C2=A0# Specified explicitly for the udev rules, just in case that it does =
not get picked<br>
=C2=A0# up automatically:<br>
=C2=A0FILES:${PN}-udevrules =3D &quot;${nonarch_base_libdir}/udev/rules.d&q=
uot;<br>
+RDEPENDS:${PN} =3D &quot;bash&quot;<br>
=C2=A0RDEPENDS:${PN}-udevrules =3D &quot;libdevmapper&quot;<br>
=C2=A0RDEPENDS:${PN}:append:class-target =3D &quot; libdevmapper&quot;<br>
=C2=A0RDEPENDS:${PN}:append:class-nativesdk =3D &quot; libdevmapper&quot;<b=
r>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#98676): <a href=3D"https://lists.openembedded.org/g/ope=
nembedded-devel/message/98676" rel=3D"noreferrer" target=3D"_blank">https:/=
/lists.openembedded.org/g/openembedded-devel/message/98676</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93495342/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/93495342/3617156</a><br>
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

--00000000000091d98c05e84e2f05--

