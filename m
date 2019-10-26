Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5CC7F977
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 18:15:23 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id f18so4828662qkm.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Oct 2019 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hrMXtMRZjImuaOkn8muB+8I5bNB8StBYBouRGnAvn6s=;
	b=SUr1Yz4KvJkM1fVDQ+E0r3UsASJXmKwkzr49FZg8tLsjwprUYwIOzuMn0d9Ex3Clts
	0FlW+GgolDqzbBpnDdXBXJcukt4IYffbfmv0c81hCrwyaiPaybLNhHsC1NoVb8oUAfjS
	+2PCFMjljDjCa/i54flkVgm/X9whZHhmDbnLu352e3rPPnYZDIwU+umh1WpwivWBd2O5
	QzGl/s/TUy3f7TYJYsDwPp261b2r5s3RwF69UGusZsXJ4WFgn7w+wccSYt5ihZs8TA+f
	BQKSpK4UkXks3WBblFVyNsRmu7Frwjb4R0zLaF6C+h8mtbnlwaPgvNKGHHUaAmTw1a9k
	ly8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hrMXtMRZjImuaOkn8muB+8I5bNB8StBYBouRGnAvn6s=;
	b=h36UF0YGzcrd8umBHreUoePy26eYDlvB+IH8bnHX0IEj19GkW+6EaGrtJdSjAsMERx
	vpGM81K3LA6MVvAJD9xyGv1zYonZR25PZdHjRW/ytBUbqdakSAO1G1CGAwWco5ELsKOO
	ARBS3pgUe68dZQpyy834Vba7qrfJYJEYhgxEXKpAM7bwV5azG5L5A4EaTL5EyaCxjYST
	EVVomuXjL4dWg8POOCfyauXxb37ftEsfTnSTCLXH7eFHKmMRGrADP2CAqJLJ7+rDvf4k
	gm/PQwtCodkQlaeQxs8d8iRmjTuOCPvk4f8RF9Lk5PsOuLA9HeOUOATjyXduLqLeA0dA
	ntSw==
X-Gm-Message-State: APjAAAU0QVhO6+VFnCBPu1t0DD+nk6lBT6bf6/TcK2GwPfThDN3Xa3MP
	o2qcBtHGTXrTL4xDgry23MQnbd8svozst296CJo=
X-Google-Smtp-Source: APXvYqyYS4Lb/0B5tkqX2i8UHurBRxhT1195AxqHRFnAP2fpvC62G9wROBAXgVsLXx8TB8Vg7jPZD0XK6yHXaA6PJ/M=
X-Received: by 2002:a05:620a:134b:: with SMTP id
	c11mr8446458qkl.71.1572113723535; 
	Sat, 26 Oct 2019 11:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20191026093404.19659-1-schnitzeltony@gmail.com>
	<20191026093404.19659-2-schnitzeltony@gmail.com>
In-Reply-To: <20191026093404.19659-2-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Oct 2019 20:14:56 +0200
Message-ID: <CAMKF1srE3x_69uh=YwVSoCH+MT8ZKQixedh02=Aq3JXikh3dtw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2] colord: initial add 1.4.4
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 26 Oct 2019 18:15:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK a bit better, native seems to build but target one fails when
building for non-systemd distros
see https://errors.yoctoproject.org/Errors/Details/274721/

On Sat, Oct 26, 2019 at 11:34 AM Andreas M=C3=BCller <schnitzeltony@gmail.c=
om> wrote:
>
> * It is a dependency for upcoming gnome-settings-daemon
> * It is used by GNOME and KDE [1] so  move it to meta-oe
> * Getting it to build was a bit tricky. Udev (systemd) is a mandatory
>   dependency and for native we do not support build. To get around native=
 build
>   was stripped down to what's necessary only. Native build is done with t=
he
>   help of configuration in recipe and (old-school) Makefile. This solutio=
n was
>   chosen to avoid massive patching of meson build which tends to be a
>   maintenance burden (as experienced at KDE recipes in meta-qt5-extra).
>
> [1] https://www.freedesktop.org/software/colord/intro.html
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
> v1 -> v2: native replace pkg-config by pkg-config-native in Makefile to a=
void
> building with build host libs
>  .../recipes-support/colord/colord-native.bb   |  64 +++++++
>  ...n-cd_icc_create_from_edid-to-avoid-u.patch | 166 ++++++++++++++++++
>  .../colord/colord-native/Makefile             |  48 +++++
>  meta-oe/recipes-support/colord/colord.bb      |  45 +++++
>  meta-oe/recipes-support/colord/colord.inc     |  13 ++
>  ...Run-native-cd_idt8-cd_create_profile.patch |  59 +++++++
>  6 files changed, 395 insertions(+)
>  create mode 100644 meta-oe/recipes-support/colord/colord-native.bb
>  create mode 100644 meta-oe/recipes-support/colord/colord-native/0001-Mov=
e-the-function-cd_icc_create_from_edid-to-avoid-u.patch
>  create mode 100644 meta-oe/recipes-support/colord/colord-native/Makefile
>  create mode 100644 meta-oe/recipes-support/colord/colord.bb
>  create mode 100644 meta-oe/recipes-support/colord/colord.inc
>  create mode 100644 meta-oe/recipes-support/colord/colord/0001-Run-native=
-cd_idt8-cd_create_profile.patch
>
> diff --git a/meta-oe/recipes-support/colord/colord-native.bb b/meta-oe/re=
cipes-support/colord/colord-native.bb
> new file mode 100644
> index 000000000..845041cc4
> --- /dev/null
> +++ b/meta-oe/recipes-support/colord/colord-native.bb
> @@ -0,0 +1,64 @@
> +require ${BPN}.inc
> +
> +FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${BPN}-native:"
> +
> +inherit meson native
> +
> +DEPENDS +=3D " \
> +    meson-native \
> +    glib-2.0-native \
> +    lcms-native \
> +"
> +
> +SRC_URI +=3D " \
> +    file://0001-Move-the-function-cd_icc_create_from_edid-to-avoid-u.pat=
ch \
> +    file://Makefile;subdir=3D${BPN}-${PV} \
> +"
> +
> +do_configure() {
> +    # we expect meson to fail - but before it extracts project's version=
 in log file
> +    meson ${MESONOPTS} "${MESON_SOURCEPATH}" "${B}" ${MESON_CROSS_FILE} =
${EXTRA_OEMESON} > /dev/null 2>&1 || true
> +
> +    # extract and split version
> +    version=3D`grep 'Project version:' ${B}/meson-logs/meson-log.txt | s=
ed 's|Project version: ||'`
> +    major=3D`echo $version | cut -d. -f1`
> +    minor=3D`echo $version | cut -d. -f2`
> +    micro=3D`echo $version | cut -d. -f3`
> +    echo "Project version: $major.$minor.$micro"
> +
> +    # extract project name
> +    proj_name=3D`grep 'Project name:' ${B}/meson-logs/meson-log.txt | se=
d 's|Project name: ||'`
> +
> +    # create cd-version.h
> +    mkdir -p ${B}/colord
> +       sed ${S}/lib/colord/cd-version.h.in \
> +               -e 's:@CD_MAJOR_VERSION_PRIVATE@:1:g' \
> +               -e 's:@CD_MINOR_VERSION_PRIVATE@:4:g' \
> +               -e 's:@CD_MICRO_VERSION_PRIVATE@:4:g' \
> +               > ${B}/colord/cd-version.h
> +
> +    # create config.h based on target build and add what's necessary onl=
y
> +    localedir=3D`echo ${datadir}/locale | sed 's:${prefix}/::g'`
> +    echo "#define LOCALEDIR \"$localedir\"" >> ${B}/config.h
> +    echo "#define GETTEXT_PACKAGE \"colord\"" >> ${B}/config.h
> +    echo "#define PACKAGE_NAME \"$proj_name\"" >> ${B}/config.h
> +    echo "#define PACKAGE_VERSION \"$version\"" >> ${B}/config.h
> +}
> +
> +do_compile() {
> +    oe_runmake -C${S} DESTDIR=3D${B}
> +}
> +
> +do_install() {
> +    version=3D`grep 'Project version:' ${B}/meson-logs/meson-log.txt | s=
ed 's|Project version: ||'`
> +    major=3D`echo $version | cut -d. -f1`
> +
> +    install -d ${D}${libdir}
> +    install -m 755 ${B}/libcolord.so ${D}${libdir}/libcolord.so.$version
> +    ln -s libcolord.so.$version "${D}/${libdir}/libcolord.so"
> +    ln -s libcolord.so.$version "${D}/${libdir}/libcolord.so.$major"
> +
> +    install -d ${D}${bindir}
> +    install -m 755 ${B}/cd_create_profile ${D}${bindir}/
> +    install -m 755 ${B}/cd_idt8 ${D}${bindir}/
> +}
> diff --git a/meta-oe/recipes-support/colord/colord-native/0001-Move-the-f=
unction-cd_icc_create_from_edid-to-avoid-u.patch b/meta-oe/recipes-support/=
colord/colord-native/0001-Move-the-function-cd_icc_create_from_edid-to-avoi=
d-u.patch
> new file mode 100644
> index 000000000..278b90e07
> --- /dev/null
> +++ b/meta-oe/recipes-support/colord/colord-native/0001-Move-the-function=
-cd_icc_create_from_edid-to-avoid-u.patch
> @@ -0,0 +1,166 @@
> +From cbb8f5c05fce1d56ae2e5fa9f57fc49c47bed5ab Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Sun, 12 May 2019 21:58:02 +0200
> +Subject: [PATCH] Move the function cd_icc_create_from_edid to avoid udev
> + dependeny
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +We do not have udev-native so it is a dependeny we cannot satisfy
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + lib/colord/cd-edid.c | 63 ++++++++++++++++++++++++++++++++++++++++++++
> + lib/colord/cd-icc.c  | 62 -------------------------------------------
> + 2 files changed, 63 insertions(+), 62 deletions(-)
> +
> +diff --git a/lib/colord/cd-edid.c b/lib/colord/cd-edid.c
> +index a5e2328..dec509a 100644
> +--- a/lib/colord/cd-edid.c
> ++++ b/lib/colord/cd-edid.c
> +@@ -687,3 +687,66 @@ cd_edid_new (void)
> +       edid =3D g_object_new (CD_TYPE_EDID, NULL);
> +       return CD_EDID (edid);
> + }
> ++
> ++/**
> ++ * cd_icc_create_from_edid_data:
> ++ * @icc: A valid #CdIcc
> ++ * @edid: EDID data
> ++ * @error: A #GError, or %NULL
> ++ *
> ++ * Creates an ICC profile from EDID data.
> ++ *
> ++ * Return value: %TRUE for success
> ++ *
> ++ * Since: 1.1.2
> ++ **/
> ++gboolean
> ++cd_icc_create_from_edid_data (CdIcc *icc, CdEdid *edid, GError **error)
> ++{
> ++      CdIccPrivate *priv =3D GET_PRIVATE (icc);
> ++      const gchar *data;
> ++
> ++      /* not loaded */
> ++      if (priv->lcms_profile !=3D NULL) {
> ++              g_set_error_literal (error,
> ++                                   CD_ICC_ERROR,
> ++                                   CD_ICC_ERROR_FAILED_TO_CREATE,
> ++                                   "already loaded or generated");
> ++              return FALSE;
> ++      }
> ++
> ++      /* create from parsed object */
> ++      if (!cd_icc_create_from_edid (icc,
> ++                                    cd_edid_get_gamma (edid),
> ++                                    cd_edid_get_red (edid),
> ++                                    cd_edid_get_green (edid),
> ++                                    cd_edid_get_blue (edid),
> ++                                    cd_edid_get_white (edid),
> ++                                    error)) {
> ++              return FALSE;
> ++      }
> ++
> ++      /* set copyright */
> ++      cd_icc_set_copyright (icc, NULL,
> ++                            /* deliberately not translated */
> ++                            "This profile is free of known copyright re=
strictions.");
> ++
> ++      /* set 'ICC meta Tag for Monitor Profiles' data */
> ++      data =3D cd_edid_get_checksum (edid);
> ++      if (data !=3D NULL)
> ++              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MD5, d=
ata);
> ++      data =3D cd_edid_get_monitor_name (edid);
> ++      if (data !=3D NULL)
> ++              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MODEL,=
 data);
> ++      data =3D cd_edid_get_serial_number (edid);
> ++      if (data !=3D NULL)
> ++              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_SERIAL=
, data);
> ++      data =3D cd_edid_get_pnp_id (edid);
> ++      if (data !=3D NULL)
> ++              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MNFT, =
data);
> ++      data =3D cd_edid_get_vendor_name (edid);
> ++      if (data !=3D NULL)
> ++              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_VENDOR=
, data);
> ++      return TRUE;
> ++}
> ++
> +diff --git a/lib/colord/cd-icc.c b/lib/colord/cd-icc.c
> +index f231814..2c8fe77 100644
> +--- a/lib/colord/cd-icc.c
> ++++ b/lib/colord/cd-icc.c
> +@@ -3094,68 +3094,6 @@ out:
> +       return ret;
> + }
> +
> +-/**
> +- * cd_icc_create_from_edid_data:
> +- * @icc: A valid #CdIcc
> +- * @edid: EDID data
> +- * @error: A #GError, or %NULL
> +- *
> +- * Creates an ICC profile from EDID data.
> +- *
> +- * Return value: %TRUE for success
> +- *
> +- * Since: 1.1.2
> +- **/
> +-gboolean
> +-cd_icc_create_from_edid_data (CdIcc *icc, CdEdid *edid, GError **error)
> +-{
> +-      CdIccPrivate *priv =3D GET_PRIVATE (icc);
> +-      const gchar *data;
> +-
> +-      /* not loaded */
> +-      if (priv->lcms_profile !=3D NULL) {
> +-              g_set_error_literal (error,
> +-                                   CD_ICC_ERROR,
> +-                                   CD_ICC_ERROR_FAILED_TO_CREATE,
> +-                                   "already loaded or generated");
> +-              return FALSE;
> +-      }
> +-
> +-      /* create from parsed object */
> +-      if (!cd_icc_create_from_edid (icc,
> +-                                    cd_edid_get_gamma (edid),
> +-                                    cd_edid_get_red (edid),
> +-                                    cd_edid_get_green (edid),
> +-                                    cd_edid_get_blue (edid),
> +-                                    cd_edid_get_white (edid),
> +-                                    error)) {
> +-              return FALSE;
> +-      }
> +-
> +-      /* set copyright */
> +-      cd_icc_set_copyright (icc, NULL,
> +-                            /* deliberately not translated */
> +-                            "This profile is free of known copyright re=
strictions.");
> +-
> +-      /* set 'ICC meta Tag for Monitor Profiles' data */
> +-      data =3D cd_edid_get_checksum (edid);
> +-      if (data !=3D NULL)
> +-              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MD5, d=
ata);
> +-      data =3D cd_edid_get_monitor_name (edid);
> +-      if (data !=3D NULL)
> +-              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MODEL,=
 data);
> +-      data =3D cd_edid_get_serial_number (edid);
> +-      if (data !=3D NULL)
> +-              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_SERIAL=
, data);
> +-      data =3D cd_edid_get_pnp_id (edid);
> +-      if (data !=3D NULL)
> +-              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_MNFT, =
data);
> +-      data =3D cd_edid_get_vendor_name (edid);
> +-      if (data !=3D NULL)
> +-              cd_icc_add_metadata (icc, CD_PROFILE_METADATA_EDID_VENDOR=
, data);
> +-      return TRUE;
> +-}
> +-
> + /**
> +  * cd_icc_create_from_edid:
> +  * @icc: A valid #CdIcc
> +--
> +2.20.1
> +
> diff --git a/meta-oe/recipes-support/colord/colord-native/Makefile b/meta=
-oe/recipes-support/colord/colord-native/Makefile
> new file mode 100644
> index 000000000..94e929ef4
> --- /dev/null
> +++ b/meta-oe/recipes-support/colord/colord-native/Makefile
> @@ -0,0 +1,48 @@
> +# For native build cd_idt8, cd_create_profile and a tiny version of libc=
olord.so
> +# only. By reducing the library to what's necessary, we avoid dependenci=
es on
> +# naitve udev and libgudev
> +
> +CFLAGS+=3D$(shell pkg-config-native --cflags gio-2.0)
> +CFLAGS+=3D$(shell pkg-config-native --cflags lcms2)
> +CFLAGS+=3D-I./lib -I./lib/colord -I$(DESTDIR) -DCD_COMPILATION
> +
> +LDFLAGS+=3D$(shell pkg-config-native --libs gio-2.0)
> +LDFLAGS+=3D$(shell pkg-config-native --libs lcms2)
> +LDFLAGS+=3D-lm
> +
> +all: cd_idt8 cd_create_profile
> +
> +LIBSOURCES =3D \
> +       lib/colord/cd-it8.c \
> +       lib/colord/cd-color.c \
> +       lib/colord/cd-spectrum.c \
> +       lib/colord/cd-math.c \
> +       lib/colord/cd-interp-akima.c \
> +       lib/colord/cd-context-lcms.c \
> +       lib/colord/cd-interp.c \
> +       lib/colord/cd-interp-linear.c \
> +       lib/colord/cd-it8-utils.c \
> +       lib/colord/cd-enum.c \
> +    lib/colord/cd-icc.c \
> +    lib/colord/cd-icc-utils.c \
> +    lib/colord/cd-dom.c
> +
> +libcolord.so: $(LIBSOURCES)
> +       $(CC) $(CFLAGS) -fPIC -shared -Wl,-soname,$@ $^ -o $(DESTDIR)/$@
> +
> +cd_idt8.o: client/cd-it8.c
> +       $(CC) $(CFLAGS) -c $^ -o $(DESTDIR)/$@
> +
> +cd_idt8: libcolord.so cd_idt8.o
> +       $(CC) $(LDFLAGS) -L$(DESTDIR) -lcolord $(DESTDIR)/cd_idt8.o -o $(=
DESTDIR)/$@
> +
> +cd_create_profile.o: client/cd-create-profile.c
> +       $(CC) $(CFLAGS) -c $^ -o $(DESTDIR)/$@
> +
> +cd_create_profile: libcolord.so cd_create_profile.o
> +       $(CC) $(LDFLAGS) -L$(DESTDIR) -lcolord $(DESTDIR)/cd_create_profi=
le.o -o $(DESTDIR)/$@
> +
> +.PHONY: clean
> +
> +clean:
> +       rm -f $(DESTDIR)/libcolord.so $(DESTDIR)/*.o $(DESTDIR)/cd_idt8 $=
(DESTDIR)/cd_create_profile
> diff --git a/meta-oe/recipes-support/colord/colord.bb b/meta-oe/recipes-s=
upport/colord/colord.bb
> new file mode 100644
> index 000000000..5c691e463
> --- /dev/null
> +++ b/meta-oe/recipes-support/colord/colord.bb
> @@ -0,0 +1,45 @@
> +require ${BPN}.inc
> +
> +inherit meson gobject-introspection gsettings gettext bash-completion sy=
stemd distro_features_check useradd
> +
> +# polkit and gobject-introspection are mandatory and cannot be configure=
d
> +REQUIRED_DISTRO_FEATURES =3D "polkit gobject-introspection-data"
> +UNKNOWN_CONFIGURE_WHITELIST_append =3D " introspection"
> +
> +DEPENDS +=3D " \
> +    ${BPN}-native \
> +    glib-2.0 \
> +    lcms \
> +    sqlite3 \
> +    libgusb \
> +    libgudev \
> +    polkit \
> +"
> +
> +SRC_URI +=3D " \
> +    file://0001-Run-native-cd_idt8-cd_create_profile.patch \
> +"
> +
> +EXTRA_OEMESON =3D " \
> +    -Dman=3Dfalse \
> +    -Ddocs=3Dfalse \
> +"
> +
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
> +PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dtrue, systemd"
> +
> +SYSTEMD_SERVICE_${PN} =3D "colord.service"
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/dbus-1 \
> +    ${datadir}/polkit-1 \
> +    ${datadir}/glib-2.0 \
> +    ${datadir}/color \
> +    ${systemd_user_unitdir} \
> +    ${libdir}/tmpfiles.d \
> +    ${libdir}/colord-plugins \
> +    ${libdir}/colord-sensors \
> +"
> +
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM_${PN} =3D "--system --user-group -d /var/lib/colord -s /bi=
n/false colord"
> diff --git a/meta-oe/recipes-support/colord/colord.inc b/meta-oe/recipes-=
support/colord/colord.inc
> new file mode 100644
> index 000000000..7497fed51
> --- /dev/null
> +++ b/meta-oe/recipes-support/colord/colord.inc
> @@ -0,0 +1,13 @@
> +SUMMARY =3D "Making color management just work"
> +HOMEPAGE =3D "https://www.freedesktop.org/software/colord/"
> +LICENSE =3D "GPLv2 & LGPLv2.1"
> +LIC_FILES_CHKSUM =3D " \
> +    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> +    file://meson.build;beginline=3D3;endline=3D3;md5=3Df42198707d793be58=
b274d34fd5238c3 \
> +"
> +
> +PV =3D "1.4.4"
> +SRC_URI =3D "https://www.freedesktop.org/software/colord/releases/${BPN}=
-${PV}.tar.xz"
> +SRC_URI[md5sum] =3D "32c2709a6002d9ee750483aaed6379c8"
> +SRC_URI[sha256sum] =3D "9a0fe80160bf88efddb582a9fc0169f56065276dc3882c47=
dddb9eecd048c0a5"
> +
> diff --git a/meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt=
8-cd_create_profile.patch b/meta-oe/recipes-support/colord/colord/0001-Run-=
native-cd_idt8-cd_create_profile.patch
> new file mode 100644
> index 000000000..4b52aa337
> --- /dev/null
> +++ b/meta-oe/recipes-support/colord/colord/0001-Run-native-cd_idt8-cd_cr=
eate_profile.patch
> @@ -0,0 +1,59 @@
> +From 5aad8831c0fb71940d6c4f982b0b30ffb6ae33b3 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
> +Date: Sun, 12 May 2019 22:47:05 +0200
> +Subject: [PATCH] Run native cd_idt8/cd_create_profile
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
> +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> +---
> + data/cmf/meson.build        | 2 +-
> + data/illuminant/meson.build | 2 +-
> + data/profiles/meson.build   | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/data/cmf/meson.build b/data/cmf/meson.build
> +index a693cd7..1ae3613 100644
> +--- a/data/cmf/meson.build
> ++++ b/data/cmf/meson.build
> +@@ -2,7 +2,7 @@ foreach arg: [ 'CIE1964-10deg-XYZ', 'CIE1931-2deg-XYZ' ]
> +   custom_target(arg,
> +     input: arg + '.csv',
> +     output: arg + '.cmf',
> +-    command: [ cd_idt8, 'create-cmf', '@OUTPUT@', '@INPUT@', '1.0' ],
> ++    command: [ 'cd_idt8', 'create-cmf', '@OUTPUT@', '@INPUT@', '1.0' ],
> +     install: true,
> +     install_dir: join_paths(datadir, 'colord', 'cmf')
> +   )
> +diff --git a/data/illuminant/meson.build b/data/illuminant/meson.build
> +index f8dfa07..ad7dced 100644
> +--- a/data/illuminant/meson.build
> ++++ b/data/illuminant/meson.build
> +@@ -24,7 +24,7 @@ foreach arg: generated_spectra
> +   custom_target(arg,
> +     input: arg + '.csv',
> +     output: arg + '.sp',
> +-    command: [ cd_idt8, 'create-sp', '@OUTPUT@', '@INPUT@', '100.0' ],
> ++    command: [ 'cd_idt8', 'create-sp', '@OUTPUT@', '@INPUT@', '100.0' ]=
,
> +     install: true,
> +     install_dir: join_paths(datadir, 'colord', 'illuminant')
> +   )
> +diff --git a/data/profiles/meson.build b/data/profiles/meson.build
> +index 591b97d..2cef011 100644
> +--- a/data/profiles/meson.build
> ++++ b/data/profiles/meson.build
> +@@ -59,7 +59,7 @@ foreach arg: icc_profiles
> +   generated_icc =3D custom_target(arg + '.icc',
> +     input: xml_i18n,
> +     output: arg + '.icc',
> +-    command: [ cd_create_profile, '--output=3D@OUTPUT@', '@INPUT@' ],
> ++    command: [ 'cd_create_profile', '--output=3D@OUTPUT@', '@INPUT@' ],
> +     install: true,
> +     install_dir: join_paths(datadir, 'color', 'icc', 'colord'),
> +   )
> +--
> +2.20.1
> +
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

