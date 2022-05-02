Return-Path: <windel.bouwman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14129C433F5
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 12:02:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web12.9393.1651492926744905596
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 05:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qhGkQifD;
 spf=pass (domain: gmail.com, ip: 209.85.210.174,
 mailfrom: windel.bouwman@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id x52so10563987pfu.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 May 2022 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=t0loc1mTY7zzzC5/i1Yo7L6sRNmWyO4ZIX0yv6lE7L0=;
        b=qhGkQifDNeiPQRe1Ajonz15dSdnQRXSlC803K0su9MASqP93QQIlE2EewDYA1OvkdX
         au0Mp1dpssuqOf61Ag4feLiPLx7KqzknVGogYrYD+St9qorFFnIracXBBBh0Q2rrjAoi
         dgHwza5ky9O+SW1Pce/+jLJVJuDR3zLASx5hWf5bO33xi/vZr6uPmIWYAuAG7NfmPCQB
         9xGdPqQHRe5QwBIjO2JJGOPnyfDVwXAyw3j0KrDmT+6tbtNavHXZRIhPLuppc9/733By
         2eBYOh1qFKYwed39gd+xDXM5zQovGSJIg75zpkB6C5K0dCpNoaHvY3s9QJqN0pteoBqO
         StDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=t0loc1mTY7zzzC5/i1Yo7L6sRNmWyO4ZIX0yv6lE7L0=;
        b=7egmQmsah1SkW4iiBzrGYUB7NLu3pAyZe0H9xsATTetz4BhkqD0FzZpVJvMhCSBX5T
         ynSzvoqu5n8AMSRZYKawqvo4uM+UrbmvG2iRD73sfG2Fjn07lDuphSMLR/og0jqf10mN
         mmPRvxnkfjaonMF04cMn8r6dMCa6KKC7DjGPfLrkeNZS1JmS/SCn5TcYxoC4diJlMcm3
         u8u/GW280cx4iejYB7vdYy+Iks9T3gwrl7BKHKbGTZO0gEenNue3dbLSrfeUroWxHH5m
         lKdOl4+Ckq0JCEkYg1K2olG9SSv11fPv8kQZaecIcB3EH4SH8zdRwSoxVPQrDBlQnM59
         kJyw==
X-Gm-Message-State: AOAM530nyt13HLk8hqgHdp0xkfwpKy1YGXcVR2apUQygn5DLzJNGNChB
	pPirsK54/Q94grkXJVyrn78D/DTssdiVUjd/hKxvmE1GnJc=
X-Google-Smtp-Source: 
 ABdhPJxIxyaVQNreY3Tg8NYSUOTcQZo+mVO0XUIPlPf4cBEnrFXgEae95PYftI8tDwHBNtyhbs4MfJilskCIHOxak8M=
X-Received: by 2002:a63:78c3:0:b0:398:2d6d:c275 with SMTP id
 t186-20020a6378c3000000b003982d6dc275mr9645448pgc.565.1651492925950; Mon, 02
 May 2022 05:02:05 -0700 (PDT)
MIME-Version: 1.0
From: Windel Bouwman <windel.bouwman@gmail.com>
Date: Mon, 2 May 2022 14:01:57 +0200
Message-ID: 
 <CAHMaQtDzj=eJrhrBfQjHLSZvw9GqPkRoyAVca4mSxzBfXDssww@mail.gmail.com>
Subject: [meta-filesystems][PATCH] Add zfs recipe
To: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000334f3305de06299c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 May 2022 12:02:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96927

--000000000000334f3305de06299c
Content-Type: text/plain; charset="UTF-8"

Add zfs recipe

Signed-off-by: Windel Bouwman <windel@windel.nl>
---
 .../recipes-filesystems/zfs/zfs_2.1.4.bb      | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb

diff --git a/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
new file mode 100644
index 000000000..01a64cc95
--- /dev/null
+++ b/meta-filesystems/recipes-filesystems/zfs/zfs_2.1.4.bb
@@ -0,0 +1,46 @@
+
+SUMMARY = "OpenZFS on Linux and FreeBSD"
+DESCRIPTION = "OpenZFS on Linux and FreeBSD"
+LICENSE = "CDDL-1.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7087caaf1dc8a2856585619f4a787faa"
+HOMEPAGE ="https://github.com/openzfs/zfs"
+
+SRC_URI = "
https://github.com/openzfs/zfs/releases/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz
"
+SRC_URI[sha256sum] =
"3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6"
+
+# Using both 'module' and 'autotools' classes seems a bit odd, they both
+# define a do_compile function.
+# That's why we opt for module-base, also this prevents module splitting.
+inherit module-base pkgconfig autotools
+
+DEPENDS = "virtual/kernel zlib util-linux libtirpc openssl"
+
+EXTRA_OECONF:append = " \
+    --disable-pyzfs \
+    --with-linux=${STAGING_KERNEL_DIR}
--with-linux-obj=${STAGING_KERNEL_BUILDDIR} \
+    --enable-systemd \
+    --disable-sysvinit \
+    --without-dracutdir \
+    "
+
+do_install:append() {
+    # /usr/share/zfs contains the zfs-tests folder which we do not need:
+    rm -rf ${D}${datadir}/zfs
+
+    rm -rf ${D}${datadir}/initramfs-tools
+}
+
+FILES:${PN} += "\
+    ${base_sbindir}/* \
+    ${base_libdir}/* \
+    ${sysconfdir}/* \
+    ${sbindir}/* \
+    ${bindir}/* \
+    ${libexecdir}/${BPN}/* \
+    ${libdir}/* \
+    "
+
+FILES:${PN}-dev += "\
+    ${prefix}/src/zfs-${PV}/* \
+    ${prefix}/src/spl-${PV}/* \
+    "
--
2.25.1

--000000000000334f3305de06299c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Add zfs recipe<br><br>Signed-off-by: Windel Bouwman &lt;<a=
 href=3D"mailto:windel@windel.nl">windel@windel.nl</a>&gt;<br>---<br>=C2=A0=
.../recipes-filesystems/zfs/<a href=3D"http://zfs_2.1.4.bb">zfs_2.1.4.bb</a=
> =C2=A0 =C2=A0 =C2=A0| 46 +++++++++++++++++++<br>=C2=A01 file changed, 46 =
insertions(+)<br>=C2=A0create mode 100644 meta-filesystems/recipes-filesyst=
ems/zfs/<a href=3D"http://zfs_2.1.4.bb">zfs_2.1.4.bb</a><br><br>diff --git =
a/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http://zfs_2.1.4.bb">=
zfs_2.1.4.bb</a> b/meta-filesystems/recipes-filesystems/zfs/<a href=3D"http=
://zfs_2.1.4.bb">zfs_2.1.4.bb</a><br>new file mode 100644<br>index 00000000=
0..01a64cc95<br>--- /dev/null<br>+++ b/meta-filesystems/recipes-filesystems=
/zfs/<a href=3D"http://zfs_2.1.4.bb">zfs_2.1.4.bb</a><br>@@ -0,0 +1,46 @@<b=
r>+<br>+SUMMARY =3D &quot;OpenZFS on Linux and FreeBSD&quot;<br>+DESCRIPTIO=
N =3D &quot;OpenZFS on Linux and FreeBSD&quot;<br>+LICENSE =3D &quot;CDDL-1=
.0&quot;<br>+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D7087caaf1dc8a2=
856585619f4a787faa&quot;<br>+HOMEPAGE =3D&quot;<a href=3D"https://github.co=
m/openzfs/zfs">https://github.com/openzfs/zfs</a>&quot;<br>+<br>+SRC_URI =
=3D &quot;<a href=3D"https://github.com/openzfs/zfs/releases/download/${BPN=
}-${PV}/${BPN}-${PV}.tar.gz">https://github.com/openzfs/zfs/releases/downlo=
ad/${BPN}-${PV}/${BPN}-${PV}.tar.gz</a>&quot;<br>+SRC_URI[sha256sum] =3D &q=
uot;3b52c0d493f806f638dca87dde809f53861cd318c1ebb0e60daeaa061cf1acf6&quot;<=
br>+<br>+# Using both &#39;module&#39; and &#39;autotools&#39; classes seem=
s a bit odd, they both<br>+# define a do_compile function.<br>+# That&#39;s=
 why we opt for module-base, also this prevents module splitting.<br>+inher=
it module-base pkgconfig autotools<br>+<br>+DEPENDS =3D &quot;virtual/kerne=
l zlib util-linux libtirpc openssl&quot;<br>+<br>+EXTRA_OECONF:append =3D &=
quot; \<br>+ =C2=A0 =C2=A0--disable-pyzfs \<br>+ =C2=A0 =C2=A0--with-linux=
=3D${STAGING_KERNEL_DIR} --with-linux-obj=3D${STAGING_KERNEL_BUILDDIR} \<br=
>+ =C2=A0 =C2=A0--enable-systemd \<br>+ =C2=A0 =C2=A0--disable-sysvinit \<b=
r>+ =C2=A0 =C2=A0--without-dracutdir \<br>+ =C2=A0 =C2=A0&quot;<br>+<br>+do=
_install:append() {<br>+ =C2=A0 =C2=A0# /usr/share/zfs contains the zfs-tes=
ts folder which we do not need:<br>+ =C2=A0 =C2=A0rm -rf ${D}${datadir}/zfs=
<br>+<br>+ =C2=A0 =C2=A0rm -rf ${D}${datadir}/initramfs-tools<br>+}<br>+<br=
>+FILES:${PN} +=3D &quot;\<br>+ =C2=A0 =C2=A0${base_sbindir}/* \<br>+ =C2=
=A0 =C2=A0${base_libdir}/* \<br>+ =C2=A0 =C2=A0${sysconfdir}/* \<br>+ =C2=
=A0 =C2=A0${sbindir}/* \<br>+ =C2=A0 =C2=A0${bindir}/* \<br>+ =C2=A0 =C2=A0=
${libexecdir}/${BPN}/* \<br>+ =C2=A0 =C2=A0${libdir}/* \<br>+ =C2=A0 =C2=A0=
&quot;<br>+<br>+FILES:${PN}-dev +=3D &quot;\<br>+ =C2=A0 =C2=A0${prefix}/sr=
c/zfs-${PV}/* \<br>+ =C2=A0 =C2=A0${prefix}/src/spl-${PV}/* \<br>+ =C2=A0 =
=C2=A0&quot;<br>--<br>2.25.1<br></div>

--000000000000334f3305de06299c--

