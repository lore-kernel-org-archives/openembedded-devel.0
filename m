Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503A1C9830E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 02:39:48 +0000 (UTC)
Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50066.1790563180323529186
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 19:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bf4JKrt5;
 spf=pass (domain: gmail.com, ip: 74.125.224.141, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66f7f72a284so2354801d50.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 19:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790563179; cv=none;
        d=google.com; s=arc-20260327;
        b=nh3NhFln+2GORD8tm0QaB6g3pWARJfsgbpU4Usi836NSeI5PC3pABl1huzoTv70h89
         M/Olittvn/2n64yG08o554X7XFNy+H+5IbP81xf/U1kikpYuXt2ASnRMFEgIhdijjejc
         nchhjFUjmnr0/ZqZpLZ8dLEsTI0W7C+B86p3i1rZQB7A7aQBeYEpveoIC6J4IK9IbQoD
         Isc0RPaZ8Hr/HQfIg2QZNsl28PpTES6uuzhNVyGmVByUVs3jEUH1mS0yHzR6rC1572NS
         mUJmMfUxO7ddPDteCV1Ow+Xxyr0FSW2ucoh7RMKkMMtxwMNRl2QOQNyk4DBB7PE2LWwA
         pdAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HTfjAnp7W6OMjt65TefRGlDyaaX5tX2UooE6tzTxPTk=;
        fh=LZspYXC3IzyIN8FmVwz229n7pZIWt1HqVNc3WYXGu+o=;
        b=kru29U4J9agpT5fA6+XzXzP1LmIM/jk84c6EWObLvdObcOC3ZBle9YXxOTTOZCgZ7L
         aHkEbft6ySj4LwMpy01dnDWEI+YgLPO6aYqZ/f0kkx5mVS74yoFdUovZexTRFUzpZrgo
         shbhQPNYgr2T3Hdhww+ouUpDYpLmT/b1ZC0DqMA9iZQSvA8LC64pap9+UiNC2WERZN3e
         iIzL+4JG2pyNAOXs/rwVifXPptjF3iiGGF3fabdrKidORlLZRMT2Dd3xdUk85j+sk7zL
         X1oAIqhcdlrgxNQTxpLeS/H0JExBtOdPpldrO1Gi0oJM5Vd7dISvGfle+/MkTzBCQdr3
         fYtQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790563179; x=1791167979; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HTfjAnp7W6OMjt65TefRGlDyaaX5tX2UooE6tzTxPTk=;
        b=bf4JKrt5p/QqoeiLViueqh4+Hm7a8JMPwDOyylbzkOsSiuEbVl2l6OFEg9SgkWMJ3z
         +U4dSanqxWpDjc+GjtgJF23v+Q90/oOhpB8hxPLuceAtnLoa7a+dtPT03AzrDr78lQxb
         zpAmrE7UfFrZ0ZnLtFbRSJtnVpFSN8oCa7xYk3ElSfor5bTQyF0fgUYvA5wRdX15wc55
         qZCpN83PgOPxDfHFIRuNsJCnSvyY+yvgs+CVT3Jrfi1b5O33Rkpl20Kv2Lj5ur3Q5chq
         v751zVT84SJR5Kud2hhemwFpzWS1aSeS8EUmHea5TcHEvt9WhIOt/ttqiimXR8ZWcwDt
         Bj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790563179; x=1791167979;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HTfjAnp7W6OMjt65TefRGlDyaaX5tX2UooE6tzTxPTk=;
        b=wPO6/4Bk9YAbPekUVqPpuTvLKuBc3bPWT/W7Ddrf+xJslPvHgKTb4hd3HHOM9rf0f7
         NnGvLR9tM7v/sUfoJssp0T4o+mGzDD2SkoMy87LVFPdf2SQ4rmoztLUhzvywhqvNeEcZ
         ECqRawUielz5Tx2N0i1M2eOolExgjyABXfz/quPFEQtxRmQZ4DS1HbNaS3sWx5rFcbB5
         9z6GxKZXXeNc9ate7OCnJS9IYMkL/9B8g3zeko5TlKl4Y4nXp7ZvVLHzJ/w4znF+ur94
         BkD/JUxCy3hTjPhHJx12rdizj8MVWSe2tQjlt1Vdw6Ar65mq7BtA7Ovh2uvgQzlgjiJD
         FbDA==
X-Gm-Message-State: AFq9FYJwy+U814epCznSPu1N6BsCV4d8APABsuX0C35vSbHKXVDa1ktO
	Carj7db1HNFCMwkoyAbBH7gs6aEphS0cLbk2JQfHBCe/qB6LZB3d1qosPM6J9m1Zg4PCR3ePIAd
	sDRl7j/HGSnVO2wV7YPDDYG5rx1iUFBM=
X-Gm-Gg: AYBFou2gLBalUFKLvrlPOwLsKsCAYJnQaylHyN7NVQYA7jaCOzwGyjU8FiIxpgfdntd
	Y9ka6YGbBejAmsW3e00EW9qON10iosfsOd3zjEkphmtUG2KPeOR6jQuUY4W+PixRt1+sYG6oDDs
	PnAq8YKN2OTJPvMznXykefpV4Oo9EFF9GhnQ/LCV8Dfpd+viTJSHE7Y/VyEkJjq/FaaKsVUXl7/
	YPzTvbMWz8Rt7w4rgl5Cb71xsCDdnVuLFwQQHPPmAzK9y5WsdHqBmwovF7fRIl6uh2eBd/bykqu
	y9BRi+sslJN2AIqB/n4eQWCnuHDdgnLonQWgM5kV6VnulF2ziZNZQsj0qO6Bu5pM3yV25nqLacW
	+jV8C0B+4WPaVjYuTyASGIGeRJuvr/Oj02Run0tjEomYHGu14vTnvGS9O4miPEI50JBzzVG4cIM
	RWH28pcZzKCuK5bJoxVJhyBXKH3K2plHJ2sC//yfFKpZWNc5urC0Bof+UUTm/jdhh2wfdqKAXBj
	+RP36AH/FEja8m24KDxRxuq5tVSNd2kbVKXpFkKxJ8H86D8umQDYXmmca6yXJbY0POfRRVPyMAA
	iAAUOVyNWeizBNIZ0sLeY7nOEhSANyMKqrph1LF5TgwAAHhYZ+8=
X-Received: by 2002:a05:690e:16a0:b0:674:7fa:6a2d with SMTP id
 956f58d0204a3-67407fa8b30mr5485512d50.2.1790563179326; Sun, 27 Sep 2026
 19:39:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260928010600.87898-1-f_l_k@t-online.de>
In-Reply-To: <20260928010600.87898-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 27 Sep 2026 19:39:13 -0700
X-Gm-Features: AclHuK_DwncAYH5O3vKh0a73KUcYGbMx6QpI7mKUlpWA4Yk8XS17BvyBA12B6Lc
Message-ID: <CAMKF1soeW19NdDrgErnRf6EL8-dqUVkVXpAysW8VDVCswrDUbg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] kmscon: treat platform display controllers
 as primary GPUs
To: f_l_k@t-online.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040720e065c81fab9"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 02:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130424

--00000000000040720e065c81fab9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 6:06=E2=80=AFPM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:

> kmscon only counted a GPU as primary when its PCI parent had boot_vga
> set, so with gpus=3Dprimary it ignored vc4 on the Raspberry Pi 4 and neve=
r
> showed a terminal. Treat DRM devices without a PCI parent as primary,
> except for the firmware framebuffer drivers. Tested on a Raspberry Pi 4
> booting through EDK2.
>
> AI-Generated: Uses Claude Code (Claude Opus 5.5)
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...-display-controllers-as-primary-GPUs.patch | 81 +++++++++++++++++++
>  .../recipes-graphics/kmscon/kmscon_10.0.1.bb  |  5 +-
>  2 files changed, 85 insertions(+), 1 deletion(-)
>  create mode 100644
> meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platform-=
display-controllers-as-primary-GPUs.patch
>
> diff --git
> a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platfor=
m-display-controllers-as-primary-GPUs.patch
> b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platfor=
m-display-controllers-as-primary-GPUs.patch
> new file mode 100644
> index 0000000000..caebc23dbc
> --- /dev/null
> +++
> b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platfor=
m-display-controllers-as-primary-GPUs.patch
> @@ -0,0 +1,81 @@
> +From d321a1572a12d760ddade294f4e7eabe57d555d1 Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Sat, 26 Sep 2026 10:00:57 +0200
> +Subject: [PATCH] uterm_monitor: treat platform display controllers as
> primary
> + GPUs
> +
> +A GPU only counted as primary when its PCI parent had boot_vga set.
> +SoC display controllers such as vc4 on the Raspberry Pi are platform
> +devices without a PCI parent, so with gpus=3Dprimary kmscon ignored the
> +only display in the system and never showed a terminal.
> +
> +Treat DRM devices without a PCI parent as primary, except for the
> +simpledrm, efidrm, vesadrm and ofdrm firmware framebuffers that only
> +stand in until the native driver has loaded.
> +
> +Upstream-Status: Pending
>

Whats the future plan for this patch ? it seems worthy of upstreaming.


> +
> +AI-Generated: Uses Claude Code (Claude Opus 5.5)
> +---
> + src/uterm_monitor.c | 26 +++++++++++++++++++++++---
> + 1 file changed, 23 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/uterm_monitor.c b/src/uterm_monitor.c
> +index d89bfa1..3ecf40b 100644
> +--- a/src/uterm_monitor.c
> ++++ b/src/uterm_monitor.c
> +@@ -234,10 +234,15 @@ out_close:
> +       return flags;
> + }
> +
> +-static bool is_drm_primary(struct uterm_monitor *mon, struct udev_devic=
e
> *dev, const char *node)
> ++static char *get_drm_name(int fd);
> ++
> ++static bool is_drm_primary(struct uterm_monitor *mon, struct udev_devic=
e
> *dev, const char *node,
> ++                         int fd)
> + {
> +       struct udev_device *pci;
> +       const char *id;
> ++      char *name;
> ++      bool res;
> +
> +       pci =3D udev_device_get_parent_with_subsystem_devtype(dev, "pci",
> NULL);
> +       if (pci) {
> +@@ -246,9 +251,24 @@ static bool is_drm_primary(struct uterm_monitor
> *mon, struct udev_device *dev, c
> +                       log_debug("DRM device %s is primary PCI GPU",
> node);
> +                       return true;
> +               }
> ++              return false;
> +       }
> +
> +-      return false;
> ++      /*
> ++       * SoC display controllers are platform devices without a boot_vg=
a
> ++       * attribute. Treat them as primary, except for the generic
> firmware
> ++       * framebuffer drivers that only stand in until the real driver
> loads.
> ++       */
> ++      name =3D get_drm_name(fd);
> ++      if (!name)
> ++              return false;
> ++
> ++      res =3D strcmp(name, "simpledrm") && strcmp(name, "efidrm") &&
> strcmp(name, "vesadrm") &&
> ++            strcmp(name, "ofdrm");
> ++      if (res)
> ++              log_debug("DRM device %s is primary platform GPU (%s)",
> node, name);
> ++      free(name);
> ++      return res;
> + }
> +
> + /*
> +@@ -334,7 +354,7 @@ static unsigned int get_drm_flags(struct
> uterm_monitor *mon, struct udev_device
> +               return flags;
> +       }
> +
> +-      if (is_drm_primary(mon, dev, node))
> ++      if (is_drm_primary(mon, dev, node, fd))
> +               flags |=3D UTERM_MONITOR_PRIMARY;
> +       if (is_drm_usb(mon, node, fd))
> +               flags |=3D UTERM_MONITOR_AUX;
> +--
> +2.55.0
> +
> diff --git a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> index c5cfd527d5..0336649551 100644
> --- a/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> +++ b/meta-oe/recipes-graphics/kmscon/kmscon_10.0.1.bb
> @@ -23,7 +23,10 @@ DEPENDS =3D "\
>  SRC_URI =3D "git://
> github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv${PV}
> <http://github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv$%=
7BPV%7D>
> "
>  SRCREV =3D "c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9"
>
> -SRC_URI +=3D
> "file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch"
> +SRC_URI +=3D " \
> +
> file://0001-terminal-open-the-pty-only-once-a-display-is-attached.patch \
> +
> file://0002-uterm_monitor-treat-platform-display-controllers-as-primary-G=
PUs.patch
> \
> +"
>
>  inherit meson pkgconfig systemd
>
> --
> 2.55.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130419):
> https://lists.openembedded.org/g/openembedded-devel/message/130419
> Mute This Topic: https://lists.openembedded.org/mt/121464722/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000040720e065c81fab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 27,=
 2026 at 6:06=E2=80=AFPM Markus Volk via <a href=3D"http://lists.openembedd=
ed.org">lists.openembedded.org</a> &lt;f_l_k=3D<a href=3D"mailto:t-online.d=
e@lists.openembedded.org">t-online.de@lists.openembedded.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">kmscon only cou=
nted a GPU as primary when its PCI parent had boot_vga<br>
set, so with gpus=3Dprimary it ignored vc4 on the Raspberry Pi 4 and never<=
br>
showed a terminal. Treat DRM devices without a PCI parent as primary,<br>
except for the firmware framebuffer drivers. Tested on a Raspberry Pi 4<br>
booting through EDK2.<br>
<br>
AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=
=3D"_blank">f_l_k@t-online.de</a>&gt;<br>
---<br>
=C2=A0...-display-controllers-as-primary-GPUs.patch | 81 ++++++++++++++++++=
+<br>
=C2=A0.../recipes-graphics/kmscon/<a href=3D"http://kmscon_10.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">kmscon_10.0.1.bb</a>=C2=A0 |=C2=A0 5 +-<b=
r>
=C2=A02 files changed, 85 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_=
monitor-treat-platform-display-controllers-as-primary-GPUs.patch<br>
<br>
diff --git a/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-trea=
t-platform-display-controllers-as-primary-GPUs.patch b/meta-oe/recipes-grap=
hics/kmscon/kmscon/0002-uterm_monitor-treat-platform-display-controllers-as=
-primary-GPUs.patch<br>
new file mode 100644<br>
index 0000000000..caebc23dbc<br>
--- /dev/null<br>
+++ b/meta-oe/recipes-graphics/kmscon/kmscon/0002-uterm_monitor-treat-platf=
orm-display-controllers-as-primary-GPUs.patch<br>
@@ -0,0 +1,81 @@<br>
+From d321a1572a12d760ddade294f4e7eabe57d555d1 Mon Sep 17 00:00:00 2001<br>
+From: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blan=
k">f_l_k@t-online.de</a>&gt;<br>
+Date: Sat, 26 Sep 2026 10:00:57 +0200<br>
+Subject: [PATCH] uterm_monitor: treat platform display controllers as prim=
ary<br>
+ GPUs<br>
+<br>
+A GPU only counted as primary when its PCI parent had boot_vga set.<br>
+SoC display controllers such as vc4 on the Raspberry Pi are platform<br>
+devices without a PCI parent, so with gpus=3Dprimary kmscon ignored the<br=
>
+only display in the system and never showed a terminal.<br>
+<br>
+Treat DRM devices without a PCI parent as primary, except for the<br>
+simpledrm, efidrm, vesadrm and ofdrm firmware framebuffers that only<br>
+stand in until the native driver has loaded.<br>
+<br>
+Upstream-Status: Pending<br></blockquote><div><br></div><div>Whats the fut=
ure plan for this patch ? it seems worthy of upstreaming.</div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+AI-Generated: Uses Claude Code (Claude Opus 5.5)<br>
+---<br>
+ src/uterm_monitor.c | 26 +++++++++++++++++++++++---<br>
+ 1 file changed, 23 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/src/uterm_monitor.c b/src/uterm_monitor.c<br>
+index d89bfa1..3ecf40b 100644<br>
+--- a/src/uterm_monitor.c<br>
++++ b/src/uterm_monitor.c<br>
+@@ -234,10 +234,15 @@ out_close:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return flags;<br>
+ }<br>
+ <br>
+-static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device =
*dev, const char *node)<br>
++static char *get_drm_name(int fd);<br>
++<br>
++static bool is_drm_primary(struct uterm_monitor *mon, struct udev_device =
*dev, const char *node,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0int fd)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct udev_device *pci;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *id;<br>
++=C2=A0 =C2=A0 =C2=A0 char *name;<br>
++=C2=A0 =C2=A0 =C2=A0 bool res;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pci =3D udev_device_get_parent_with_subsystem_d=
evtype(dev, &quot;pci&quot;, NULL);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (pci) {<br>
+@@ -246,9 +251,24 @@ static bool is_drm_primary(struct uterm_monitor *mon,=
 struct udev_device *dev, c<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0log_debug(&quot;DRM device %s is primary PCI GPU&quot;, node);<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 =C2=A0 /*<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* SoC display controllers are platform devices=
 without a boot_vga<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* attribute. Treat them as primary, except for=
 the generic firmware<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0* framebuffer drivers that only stand in until=
 the real driver loads.<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
++=C2=A0 =C2=A0 =C2=A0 name =3D get_drm_name(fd);<br>
++=C2=A0 =C2=A0 =C2=A0 if (!name)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++<br>
++=C2=A0 =C2=A0 =C2=A0 res =3D strcmp(name, &quot;simpledrm&quot;) &amp;&am=
p; strcmp(name, &quot;efidrm&quot;) &amp;&amp; strcmp(name, &quot;vesadrm&q=
uot;) &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strcmp(name, &quot;ofdrm&quot;)=
;<br>
++=C2=A0 =C2=A0 =C2=A0 if (res)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 log_debug(&quot;DRM devi=
ce %s is primary platform GPU (%s)&quot;, node, name);<br>
++=C2=A0 =C2=A0 =C2=A0 free(name);<br>
++=C2=A0 =C2=A0 =C2=A0 return res;<br>
+ }<br>
+ <br>
+ /*<br>
+@@ -334,7 +354,7 @@ static unsigned int get_drm_flags(struct uterm_monitor=
 *mon, struct udev_device<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return flags;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 =C2=A0 if (is_drm_primary(mon, dev, node))<br>
++=C2=A0 =C2=A0 =C2=A0 if (is_drm_primary(mon, dev, node, fd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D UTERM_MO=
NITOR_PRIMARY;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (is_drm_usb(mon, node, fd))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D UTERM_MO=
NITOR_AUX;<br>
+-- <br>
+2.55.0<br>
+<br>
diff --git a/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_10.0.=
1.bb" rel=3D"noreferrer" target=3D"_blank">kmscon_10.0.1.bb</a> b/meta-oe/r=
ecipes-graphics/kmscon/<a href=3D"http://kmscon_10.0.1.bb" rel=3D"noreferre=
r" target=3D"_blank">kmscon_10.0.1.bb</a><br>
index c5cfd527d5..0336649551 100644<br>
--- a/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_10.0.1.bb" r=
el=3D"noreferrer" target=3D"_blank">kmscon_10.0.1.bb</a><br>
+++ b/meta-oe/recipes-graphics/kmscon/<a href=3D"http://kmscon_10.0.1.bb" r=
el=3D"noreferrer" target=3D"_blank">kmscon_10.0.1.bb</a><br>
@@ -23,7 +23,10 @@ DEPENDS =3D &quot;\<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/kmscon/kmscon;pr=
otocol=3Dhttps;branch=3Dmain;tag=3Dv$%7BPV%7D" rel=3D"noreferrer" target=3D=
"_blank">github.com/kmscon/kmscon;protocol=3Dhttps;branch=3Dmain;tag=3Dv${P=
V}</a>&quot;<br>
=C2=A0SRCREV =3D &quot;c9d0e23336c6bb7645a1f5f48a4a82f1d5a589d9&quot;<br>
<br>
-SRC_URI +=3D &quot;file://0001-terminal-open-the-pty-only-once-a-display-i=
s-attached.patch&quot;<br>
+SRC_URI +=3D &quot; \<br>
+=C2=A0 =C2=A0 file://0001-terminal-open-the-pty-only-once-a-display-is-att=
ached.patch \<br>
+=C2=A0 =C2=A0 file://0002-uterm_monitor-treat-platform-display-controllers=
-as-primary-GPUs.patch \<br>
+&quot;<br>
<br>
=C2=A0inherit meson pkgconfig systemd<br>
<br>
-- <br>
2.55.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130419): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130419" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130419</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121464722/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121464722/1997914</a><br>
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

--00000000000040720e065c81fab9--

