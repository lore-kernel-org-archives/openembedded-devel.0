Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.3898.1621154772381016152
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 01:46:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d77NfFpk;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id x13so1664369vsh.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 May 2021 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FHQ2f4eNV9h7JbmKeFNI0dlpeKYRGif3DzSpiFmNuDM=;
        b=d77NfFpkHw3tduWXW3ZiDyl2x/8Qt78bVQHHksqetYvJSKscvcfXxrb6wsPlKAx5hg
         TX/2PfFbYjjOEijpOQmNSXxBFsXXjBmMSFca5T+Dv+oW0lIhjhKBy/PropgJ8w2r8Z0Z
         3d4wf4XyaBwO4LlperM3gVVOrb/QlBj8Ec6j6zGxjkWRSGFB4akOBoL5H1SoOOCutZyq
         I25Y/Ri3IepzZhpv56/Bgha+cu/5+u8bmv/6x8x1DM4pei5p/PjxWV3dFYowugw5uMFd
         njRIsNr87RpDde6x2yW0udqgFGg+sVCE0X+uDPRHdAXvN7yY1o/yL3T3nFdtVc9Lj/mu
         QkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FHQ2f4eNV9h7JbmKeFNI0dlpeKYRGif3DzSpiFmNuDM=;
        b=W03EzOhYrXGh5VIP88efNU00jVqgewc8S+nWlDKuVTO0T3w5oHc75y+GaSCqO6Xwl7
         jylbDJiBiScHncZ9Q1RPRCMM45kHvTQ77W/PxiUNIxEnDevvKcwR+dwhQVEOkAL8zVZS
         VMTqY7sQKY1nGD3Obwo8KjcDXTaI/YuKvgpmTR56eyfeS/fXu7xuMBbE8Q5jdzy9kJ34
         rRmu8kCLEuzaa4wTGfvQhu/gr2Z3IJ+qld1QHuProNlZ4eVVBqkrn66fYjMLlbBe3Z00
         YCeUcg76OBCufENXbktS55NFBs/ACuRDpnRzXSWRoZPcu1MjDrsypIiSC6ePAqhiz8RY
         iaLw==
X-Gm-Message-State: AOAM532agP02hIiEE0yzssfVL/rV/WNj+hnaRIAtVhEOYuebQ64bHprE
	9ldqJdHlGTzURJpGh4D2EQIwHTLK0hLOH6ce0hw=
X-Google-Smtp-Source: ABdhPJwfpQ+/WVMWhwCOKVOOM06j0SH2/l4ejouvsXSXBgfs/sFfVu9x3J2ZBGPzTuDLWripkxoYfuUbeJUcrznX24M=
X-Received: by 2002:a67:1447:: with SMTP id 68mr46725091vsu.20.1621154771505;
 Sun, 16 May 2021 01:46:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210515233853.583490-1-schnitzeltony@gmail.com>
In-Reply-To: <20210515233853.583490-1-schnitzeltony@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 16 May 2021 10:46:00 +0200
Message-ID: <CANNYZj8mfJ0txH337fGheaxdGJ-JCWR3Uc-Z2vokAKcJBmuTdQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 01/20] tracker: upgrade 2.3.6 -> 3.0.4
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000048153205c26e8279"

--00000000000048153205c26e8279
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, just want to note that the new gnome version scheme doesn't use the
odd-even semantics anymore, so upstream-version-is-even should be dropped
from 40.x versions.

Alex

On Sun, 16 May 2021 at 01:39, Andreas M=C3=BCller <schnitzeltony@gmail.com=
>
wrote:

> * huge bump is required for upcoming nautilus 40.1
> * PACKAGECONFIGS have no meson option anymore so remove them
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../{tracker_2.3.6.bb =3D> tracker_3.0.4.bb}    | 21 ++++++++++--------=
-
>  1 file changed, 11 insertions(+), 10 deletions(-)
>  rename meta-gnome/recipes-gnome/tracker/{tracker_2.3.6.bb =3D>
> tracker_3.0.4.bb} (59%)
>
> diff --git a/meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb
> b/meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb
> similarity index 59%
> rename from meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb
> rename to meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb
> index 2c11976ca..82e3d006e 100644
> --- a/meta-gnome/recipes-gnome/tracker/tracker_2.3.6.bb
> +++ b/meta-gnome/recipes-gnome/tracker/tracker_3.0.4.bb
> @@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D " \
>  "
>
>  DEPENDS =3D " \
> -    libxml2-native \
>      dbus-native \
>      glib-2.0 \
>      sqlite3 \
> @@ -22,30 +21,32 @@ GNOMEBASEBUILDCLASS =3D "meson"
>
>  inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages
> bash-completion features_check
>
> -SRC_URI[archive.sha256sum] =3D
> "bd1eb4122135296fa7b57b1c3fa0ed602cf7d06c0b8e534d0bd17ff5f97feef2"
> +SRC_URI[archive.sha256sum] =3D
> "c120d81f2df94aa794b1a7953b55cfa46de318ed68e6f3b5ad4fce0c729c2483"
>
>  # gobject-introspection is mandatory and cannot be configured
>  REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
>  UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"
>
> -PACKAGECONFIG ??=3D "fts"
> -PACKAGECONFIG[networkmanager] =3D
> "-Dnetwork_manager=3Denabled,-Dnetwork_manager=3Ddisabled,networkmanger"
> -# full text search requires sqlite3 build with PACKAGECONFIG[fts5] set
> -PACKAGECONFIG[fts] =3D "-Dfts=3Dtrue,-Dfts=3Dfalse"
> +# text search is not an option anymore and requires sqlite3 build with
> +# PACKAGECONFIG[fts5] set (default)
>
>  # set required cross property sqlite3_has_fts5
>  do_write_config[vardeps] +=3D "PACKAGECONFIG"
>  do_write_config_append() {
>      echo "[properties]" > ${WORKDIR}/meson-tracker.cross
> -    echo "sqlite3_has_fts5 =3D '${@bb.utils.contains('PACKAGECONFIG',
> 'fts', 'true', 'false', d)}'" >> ${WORKDIR}/meson-tracker.cross
> +    echo "sqlite3_has_fts5 =3D 'true'" >> ${WORKDIR}/meson-tracker.cros=
s
>  }
>
> -EXTRA_OEMESON =3D "--cross-file ${WORKDIR}/meson-tracker.cross \
> -                 -Dsystemd_user_services=3D${systemd_user_unitdir} \
> +EXTRA_OEMESON =3D " \
> +    --cross-file ${WORKDIR}/meson-tracker.cross \
> +    -Dman=3Dfalse \
> +    -Dsystemd_user_services=3D${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'true', 'false', d)} \
> +    -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
>  "
>
>  FILES_${PN} +=3D " \
>      ${datadir}/dbus-1 \
> -    ${libdir}/tracker-2.0 \
> +    ${datadir}/tracker3 \
> +    ${libdir}/tracker-3.0 \
>      ${systemd_user_unitdir} \
>  "
> --
> 2.31.1
>
>
>=20
>
>

--00000000000048153205c26e8279
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks, just want to note that the new gnome version =
scheme doesn&#39;t use the odd-even semantics anymore, so upstream-version-=
is-even should be dropped from 40.x versions.</div><div><br></div><div>Alex=
<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Sun, 16 May 2021 at 01:39, Andreas M=C3=BCller &lt;<a href=3D"=
mailto:schnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">* huge bump is requi=
red for upcoming nautilus 40.1<br>
* PACKAGECONFIGS have no meson option anymore so remove them<br>
<br>
Signed-off-by: Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gma=
il.com" target=3D"_blank">schnitzeltony@gmail.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://tracker_2.3.6.bb" rel=3D"noreferrer" target=
=3D"_blank">tracker_2.3.6.bb</a> =3D&gt; <a href=3D"http://tracker_3.0.4.b=
b" rel=3D"noreferrer" target=3D"_blank">tracker_3.0.4.bb</a>}=C2=A0 =C2=A0 =
| 21 ++++++++++---------<br>
=C2=A01 file changed, 11 insertions(+), 10 deletions(-)<br>
=C2=A0rename meta-gnome/recipes-gnome/tracker/{<a href=3D"http://tracker_2=
.3.6.bb" rel=3D"noreferrer" target=3D"_blank">tracker_2.3.6.bb</a> =3D&gt; =
<a href=3D"http://tracker_3.0.4.bb" rel=3D"noreferrer" target=3D"_blank">tr=
acker_3.0.4.bb</a>} (59%)<br>
<br>
diff --git a/meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker_2.=
3.6.bb" rel=3D"noreferrer" target=3D"_blank">tracker_2.3.6.bb</a> b/meta-gn=
ome/recipes-gnome/tracker/<a href=3D"http://tracker_3.0.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">tracker_3.0.4.bb</a><br>
similarity index 59%<br>
rename from meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker_2.3=
.6.bb" rel=3D"noreferrer" target=3D"_blank">tracker_2.3.6.bb</a><br>
rename to meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker_3.0.4=
.bb" rel=3D"noreferrer" target=3D"_blank">tracker_3.0.4.bb</a><br>
index 2c11976ca..82e3d006e 100644<br>
--- a/meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker_2.3.6.bb"=
 rel=3D"noreferrer" target=3D"_blank">tracker_2.3.6.bb</a><br>
+++ b/meta-gnome/recipes-gnome/tracker/<a href=3D"http://tracker_3.0.4.bb"=
 rel=3D"noreferrer" target=3D"_blank">tracker_3.0.4.bb</a><br>
@@ -6,7 +6,6 @@ LIC_FILES_CHKSUM =3D &quot; \<br>
=C2=A0&quot;<br>
<br>
=C2=A0DEPENDS =3D &quot; \<br>
-=C2=A0 =C2=A0 libxml2-native \<br>
=C2=A0 =C2=A0 =C2=A0dbus-native \<br>
=C2=A0 =C2=A0 =C2=A0glib-2.0 \<br>
=C2=A0 =C2=A0 =C2=A0sqlite3 \<br>
@@ -22,30 +21,32 @@ GNOMEBASEBUILDCLASS =3D &quot;meson&quot;<br>
<br>
=C2=A0inherit gnomebase gsettings gobject-introspection vala gtk-doc manpa=
ges bash-completion features_check<br>
<br>
-SRC_URI[archive.sha256sum] =3D &quot;bd1eb4122135296fa7b57b1c3fa0ed602cf7=
d06c0b8e534d0bd17ff5f97feef2&quot;<br>
+SRC_URI[archive.sha256sum] =3D &quot;c120d81f2df94aa794b1a7953b55cfa46de3=
18ed68e6f3b5ad4fce0c729c2483&quot;<br>
<br>
=C2=A0# gobject-introspection is mandatory and cannot be configured<br>
=C2=A0REQUIRED_DISTRO_FEATURES =3D &quot;gobject-introspection-data&quot;<=
br>
=C2=A0UNKNOWN_CONFIGURE_WHITELIST_append =3D &quot; introspection&quot;<br=
>
<br>
-PACKAGECONFIG ??=3D &quot;fts&quot;<br>
-PACKAGECONFIG[networkmanager] =3D &quot;-Dnetwork_manager=3Denabled,-Dnet=
work_manager=3Ddisabled,networkmanger&quot;<br>
-# full text search requires sqlite3 build with PACKAGECONFIG[fts5] set<br=
>
-PACKAGECONFIG[fts] =3D &quot;-Dfts=3Dtrue,-Dfts=3Dfalse&quot;<br>
+# text search is not an option anymore and requires sqlite3 build with<br=
>
+# PACKAGECONFIG[fts5] set (default)<br>
<br>
=C2=A0# set required cross property sqlite3_has_fts5<br>
=C2=A0do_write_config[vardeps] +=3D &quot;PACKAGECONFIG&quot;<br>
=C2=A0do_write_config_append() {<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;[properties]&quot; &gt; ${WORKDIR}/meson-tr=
acker.cross<br>
-=C2=A0 =C2=A0 echo &quot;sqlite3_has_fts5 =3D &#39;${@bb.utils.contains(&=
#39;PACKAGECONFIG&#39;, &#39;fts&#39;, &#39;true&#39;, &#39;false&#39;, d)}=
&#39;&quot; &gt;&gt; ${WORKDIR}/meson-tracker.cross<br>
+=C2=A0 =C2=A0 echo &quot;sqlite3_has_fts5 =3D &#39;true&#39;&quot; &gt;&g=
t; ${WORKDIR}/meson-tracker.cross<br>
=C2=A0}<br>
<br>
-EXTRA_OEMESON =3D &quot;--cross-file ${WORKDIR}/meson-tracker.cross \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dsystemd_u=
ser_services=3D${systemd_user_unitdir} \<br>
+EXTRA_OEMESON =3D &quot; \<br>
+=C2=A0 =C2=A0 --cross-file ${WORKDIR}/meson-tracker.cross \<br>
+=C2=A0 =C2=A0 -Dman=3Dfalse \<br>
+=C2=A0 =C2=A0 -Dsystemd_user_services=3D${@bb.utils.contains(&#39;DISTRO_=
FEATURES&#39;, &#39;systemd&#39;, &#39;true&#39;, &#39;false&#39;, d)} \<br=
>
+=C2=A0 =C2=A0 -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \<br>
=C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${datadir}/dbus-1 \<br>
-=C2=A0 =C2=A0 ${libdir}/tracker-2.0 \<br>
+=C2=A0 =C2=A0 ${datadir}/tracker3 \<br>
+=C2=A0 =C2=A0 ${libdir}/tracker-3.0 \<br>
=C2=A0 =C2=A0 =C2=A0${systemd_user_unitdir} \<br>
=C2=A0&quot;<br>
-- <br>
2.31.1<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--00000000000048153205c26e8279--
