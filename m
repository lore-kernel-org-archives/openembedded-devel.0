Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxMbF-0004C0-KG
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 17:46:32 +0200
Received: by iwn4 with SMTP id 4so978476iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 08:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NOpqMOG+xV1G+uIGcRKfXZm1kk7aVnwC19sSUc7VoLI=;
	b=AgAMAkRqI4dFV5hUBHus96tg3PotJH1YdoIGYff4F5ztEKhY7obdPJaKctppQkpg91
	9C05+UMrvrJh6em6mJVkl7us9KexSXtV3Vu98EjvZccPGnQoHqItlEBFViX66ywubwEK
	9+jp9HWwivGL24uF26JNmchcxoKPFbTho1zag=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hw2D01B3C3zeHtOdzdmuqMT9/FqUZxkEb7NgLXFSdkbVX5BgSiVcplTcpNoMSzExUc
	JPRO/dkCz0iT5qMWgfrqVuK6MurpPuCHG/affjJmrbhXvNP7ttMG0VOUTOa0Mszr4WfH
	eMp/yQrs62wjEiTlLzf6ET+fnKu56/PRAyG10=
MIME-Version: 1.0
Received: by 10.231.16.77 with HTTP; Thu, 1 Apr 2010 08:43:11 -0700 (PDT)
In-Reply-To: <1270134711-32158-3-git-send-email-Martin.Jansa@gmail.com>
References: <1270134711-32158-1-git-send-email-Martin.Jansa@gmail.com>
	<1270134711-32158-3-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 1 Apr 2010 08:43:11 -0700
Received: by 10.231.190.204 with SMTP id dj12mr262382ibb.9.1270136591413; Thu, 
	01 Apr 2010 08:43:11 -0700 (PDT)
Message-ID: <q2g19c1b8a91004010843g2fa4e73co2bf51ee00ef1ba7b@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] sane-srcrevs: move SRCREVs to recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Apr 2010 15:46:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 1, 2010 at 8:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote=
:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

one the following are fixed
dri/libdrm_git.bb:SRCREV_pn-libdrm ?=3D "a5c8f55397377994ceeb76ed0ff148ff89=
eb3a1b"
dri/libdrm_git.bb:SRCREV_pn-libdrm_shr ?=3D
"b5aec2bd3df736216e86eae28e278172d3ba3362"
linux/linux-davinci_2.6.27.bb:# or override in it local.conf like
this: DAVINCI_SRCREV_pn-linux-davinci =3D "${@bb.fetch.get_srcrev(d)}"
mesa/mesa-dri_git.bb:SRCREV_pn-mesa-dri ?=3D
"196214bf2b677a83653d49f79d03752f29df44ec"
mesa/mesa-dri_git.bb:SRCREV_pn-mesa-dri_shr ?=3D
"1ac166895fef47806c9e9286d2a6356b4db8398d"
opkg/opkg-nogpg-nocurl_svn.bb:SRCREV =3D "${SRCREV_pn-opkg}"
opkg/opkg-nogpg-nocurl-slugos_svn.bb:SRCREV =3D "${SRCREV_pn-opkg}"
opkg/opkg-nogpg_svn.bb:SRCREV =3D "${SRCREV_pn-opkg}"
psplash/psplash-ua.inc:SRCREV =3D "${SRCREV_pn-psplash}

> ---
> =A0conf/distro/include/sane-srcrevs.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
123 +-------------------
> =A0recipes/accelges/accelges_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +
> =A0recipes/aircrack/aircrack-ng_1.0-svn.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +
> =A0recipes/bootchart-lite/bootchart-lite_svn.bb =A0 =A0 =A0 | =A0 =A01 +
> =A0recipes/cdparanoia/cdparanoia_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/clutter/clutter-box2d_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/clutter/clutter-cairo_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/clutter/clutter-gst_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A01 +
> =A0recipes/clutter/clutter_0.4svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A01 +
> =A0recipes/clutter/clutter_0.6svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A01 +
> =A0recipes/clutter/clutter_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/clutter/table_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A01 +
> =A0recipes/comic-reader/comic-reader_svn.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/dasher/dasher-gpe_0.0-svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/dbus/dbus-c++_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A01 +
> =A0recipes/ebrainy/ebrainy_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/eds/eds-dbus_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A01 +
> =A0recipes/epdfview/epdfview_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A01 +
> =A0recipes/ezx/ezx-boot-usb-native_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
> =A0recipes/ezx/ezx-gen-blob_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A04 +-
> =A0recipes/ezx/ezx-gpiotool_1877.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 26 ----
> =A0recipes/ezx/ezx-gpiotool_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 28 +++++
> =A0recipes/ezx/ezxd_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A01 +
> =A0recipes/fbgrab/fbgrab-viewer-native_1.0.bb =A0 =A0 =A0 =A0 | =A0 =A01 =
+
> =A0recipes/flashrom/flashrom_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A01 +
> =A0recipes/fstests/fstests.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 20 ---
> =A0recipes/fstests/fstests_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 22 ++++
> =A0recipes/gabriel/gabriel_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/gnet/gnet_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A01 +
> =A0recipes/gnome/epiphany_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
> =A0recipes/gnome/gconf-dbus_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +
> =A0recipes/gpe-conf/gpe-conf_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A01 +
> =A0recipes/gpe-contacts/gpe-contacts_svn.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A0recipes/gpe-gallery/gpe-gallery_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
> =A0recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb =A0| =A0 =A02 +-
> =A0recipes/gpe-mini-browser/gpe-mini-browser_svn.bb =A0 | =A0 =A02 +
> =A0recipes/gpe-sketchbook/gpe-sketchbook_svn.bb =A0 =A0 =A0 | =A0 =A01 +
> =A0recipes/gpephone/contact_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
> =A0recipes/gpephone/libcalenabler2_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A04 +-
> =A0recipes/gpephone/libiac2_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A04 +-
> =A0recipes/gpephone/libiac_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A04 +-
> =A0recipes/gsm/gsmd.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 =A01 +
> =A0recipes/gtk-webcore/osb-browser_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
> =A0recipes/gtk-webcore/osb-jscore_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> =A0recipes/gtk-webcore/osb-nrcit_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/gtk-webcore/osb-nrcore_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> =A0recipes/gtkhtml2/gtkhtml2_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A01 +
> =A0recipes/kismet/kismet-newcore_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/kismet/kismet_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A01 +
> =A0recipes/libfakekey/libfakekey_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/libowl/libowl_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A01 +
> =A0recipes/librfid/librfid_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/libw100/libw100_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/libxosd/libxosd_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/linux/linux-bfin_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
> =A0recipes/linux/linux-hackndev-2.6_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A03 +
> =A0recipes/linux/linux-ixp4xx.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/llvm/llvm-gcc4-cross_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
> =A0recipes/llvm/llvm-gcc4_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
> =A0recipes/maemo-mapper/maemo-mapper_svn.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A0.../matchbox-config-gtk/matchbox-config-gtk_svn.bb | =A0 =A01 +
> =A0.../matchbox-keyboard-inputmethod_svn.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A0recipes/matchbox-keyboard/matchbox-keyboard_svn.bb | =A0 =A01 +
> =A0recipes/matchbox-stroke/matchbox-stroke_svn.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/matchbox-terminal/matchbox-terminal_svn.bb | =A0 =A01 +
> =A0recipes/matchbox2/matchbox-desktop-2_svn.bb =A0 =A0 =A0 =A0| =A0 =A01 =
+
> =A0.../matchbox-panel-2-icon-themes_0.0.1.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
> =A0recipes/matchbox2/matchbox-panel-2_svn.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 +
> =A0recipes/matchbox2/matchbox-wm-2_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
> =A0recipes/mplayer/mplayer-maemo_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/multitap-pad/multitap-pad_svn.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
1 +
> =A0recipes/net-snmp/libsnmp-perl_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/net-snmp/net-snmp_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A01 +
> =A0recipes/netsurf/netsurf_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/openocd/openocd_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/opkg-utils/opkg-utils-native_svn.bb =A0 =A0 =A0 =A0| =A0 =A01 =
+
> =A0recipes/opkg-utils/opkg-utils_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb =A0 =A0 =A0 | =A0 =A02 -
> =A0recipes/opkg/opkg-nogpg-nocurl_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 -
> =A0recipes/opkg/opkg-nogpg_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 -
> =A0recipes/opkg/opkg.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A01 +
> =A0recipes/oprofile/oprofileui-svn.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
> =A0recipes/portaudio/portaudio-v19_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
> =A0recipes/psplash/psplash.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A01 +
> =A0recipes/puzzles/oh-puzzles_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A01 +
> =A0recipes/pythm/pythm_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A01 +
> =A0recipes/python/python-coherence_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
> =A0recipes/python/python-connexion_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
> =A0recipes/python/python-pyyaml_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A01 +
> =A0recipes/settings-daemon/settings-daemon_svn.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/socketcan/socketcan-modules_svn.bb =A0 =A0 =A0 =A0 | =A0 =A01 =
+
> =A0recipes/socketcan/socketcan-utils-test_svn.bb =A0 =A0 =A0| =A0 =A01 +
> =A0recipes/sphyrna/sphyrna-python_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> =A0recipes/tinymail/tmut_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A01 +
> =A0recipes/tslib/tslib_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A01 +
> =A0recipes/u-boot/u-boot-bug_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/uclibc/bfin-uclibc_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A01 +
> =A0recipes/uclibc/elf2flt_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A01 +
> =A0recipes/usbpath/usbpath_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A01 +
> =A0recipes/wlan-ng/wlan-ng-modules_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A01 +
> =A0recipes/wlan-ng/wlan-ng-utils_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A01 +
> =A0recipes/xoo/xoo_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A01 +
> =A0102 files changed, 160 insertions(+), 180 deletions(-)
> =A0delete mode 100644 recipes/ezx/ezx-gpiotool_1877.bb
> =A0create mode 100644 recipes/ezx/ezx-gpiotool_svn.bb
> =A0delete mode 100644 recipes/fstests/fstests.bb
> =A0create mode 100644 recipes/fstests/fstests_svn.bb
>
> diff --git a/conf/distro/include/sane-srcrevs.inc b/conf/distro/include/s=
ane-srcrevs.inc
> index fa62616..5f35c8b 100644
> --- a/conf/distro/include/sane-srcrevs.inc
> +++ b/conf/distro/include/sane-srcrevs.inc
> @@ -1,40 +1,16 @@
> -# Generated with
> -# bitbake -s | grep svnr =A0| awk '{print "SRCREV_pn-" $1 "=3D" $2}' | \
> -# sed -e s:\+:\=3D:g -e s:svnr::g| awk -F "=3D" '{print $1 " ?=3D\" " $3=
}' | \
> -# awk -F "-r" '{print $1"\""}'
> -
> -# This will miss recipes that have skippackage set (e.g. uclibc)
> -
> =A0# this is alphabetical!
> +# only SRCREVs included in more recipes should be here, otherwise put sa=
ne SRCREV to recipe directly
>
> -# yes, really!
> -
> -# you know what that means? like... a, b, c, d, e, f, g...
> -
> -SRCREV_pn-accelges ?=3D "206"
> =A0SRCREV_pn-advancedcaching ?=3D "9c3661f5573d2dd712437f1590070153d12e4c=
02"
> -SRCREV_pn-aircrack-ng ?=3D "802"
> =A0SRCREV_pn-alsa-scenario ?=3D "8bd7f83d847424eb44704cf1649974b2fda8d8f1=
"
> =A0SRCREV_pn-aufs2-util ?=3D "f35ba2292fe40aa94aa83713e0b2719f35a25768"
> -SRCREV_pn-bfin-uclibc ?=3D "1857"
> =A0SRCREV_pn-blipomoko ?=3D "93295f36f7b45c691df247cb2a65227facf13654"
> -SRCREV_pn-bootchart-lite ?=3D "4"
> =A0SRCREV_pn-bt-configure ?=3D "9654c88ff74bca89cf747937cbec67421d2f1cbc"
> =A0SRCREV_pn-calc ?=3D "cff7c833d4fce0d39de0812bfc9ed9e0eb8fac09"
> =A0SRCREV_pn-calibrateproto ?=3D "1da6fd1e2c7a49648245c98481fabea8b9690a8=
c"
> -SRCREV_pn-cdparanoia ?=3D "16684"
> -SRCREV_pn-clutter ?=3D "3240"
> -SRCREV_pn-clutter-box2d ?=3D "3197"
> -SRCREV_pn-clutter-cairo ?=3D "3210"
> -SRCREV_pn-clutter-gst ?=3D "3188"
> =A0SRCREV_pn-clutter-gtk ?=3D "70f4b0cbd568dfa265484a03be3bd08ad15ed12e"
> =A0SRCREV_pn-clutter-gtk-0.6 ?=3D "2ba362a1a223c2b28541030a80aa1119161534=
0a"
> =A0SRCREV_pn-clutter-gtk-0.8 ?=3D "7d3c3230376e731c06c21afa9d8c1d44dbea27=
cd"
> -SRCREV_pn-comic-reader ?=3D "54"
> -SRCREV_pn-contact ?=3D "1410"
> -SRCREV_pn-dasher-gpe ?=3D "1251"
> -SRCREV_pn-dbus-c++ ?=3D "13131"
> -SRCREV_pn-dbus-c++-native ?=3D "13131"
> =A0SRCREV_pn-disko ?=3D "f52597b8d5d584811cbe8f9e0bf25ea372526953"
> =A0SRCREV_pn-e-wm-illume-dict-pl ?=3D "1cc80e26a4558dfc2268b349d9a1f468e5=
15bcfb"
> =A0SRCREV_pn-e-wm-menu-shr ?=3D "1cc80e26a4558dfc2268b349d9a1f468e515bcfb=
"
> @@ -43,133 +19,51 @@ SRCREV_pn-e-wm-theme-illume-gry ?=3D "1cc80e26a4558d=
fc2268b349d9a1f468e515bcfb"
> =A0SRCREV_pn-e-wm-theme-illume-niebiee ?=3D "1cc80e26a4558dfc2268b349d9a1=
f468e515bcfb"
> =A0SRCREV_pn-e-wm-theme-illume-shr ?=3D "1cc80e26a4558dfc2268b349d9a1f468=
e515bcfb"
> =A0SRCREV_pn-e-wm-theme-illume-sixteen ?=3D "1cc80e26a4558dfc2268b349d9a1=
f468e515bcfb"
> -SRCREV_pn-ebrainy ?=3D "21"
> -SRCREV_pn-eds-dbus ?=3D "736"
> =A0SRCREV_pn-elementary-theme-gry ?=3D "2b62d1c9b02da047071105a7b5695acd6=
c6dbcca"
> =A0SRCREV_pn-elementary-theme-niebiee ?=3D "2ac643cc273d144bb731a8cbb8ec6=
b3615de43a0"
> =A0SRCREV_pn-elementary-theme-sixteen ?=3D "2ac643cc273d144bb731a8cbb8ec6=
b3615de43a0"
> -SRCREV_pn-elf2flt ?=3D "1786"
> -SRCREV_pn-epdfview ?=3D "346"
> -SRCREV_pn-epiphany ?=3D "7837"
> -SRCREV_pn-ezx-boot-usb-native ?=3D "2512"
> -SRCREV_pn-ezx-gen-blob ?=3D "2517"
> -SRCREV_pn-ezxd ?=3D "2513"
> -SRCREV_pn-fbgrab-viewer-native ?=3D "1943"
> -SRCREV_pn-flashrom ?=3D "3682"
> =A0SRCREV_pn-fsod ?=3D "2a33e5ffe96c611e6a6b8b6c33d2a83ba656f55b"
> -SRCREV_pn-fstests ?=3D "204"
> -SRCREV_pn-gabriel ?=3D "38"
> -SRCREV_pn-gabriel-native ?=3D "38"
> -SRCREV_pn-gconf-dbus ?=3D "641"
> =A0SRCREV_pn-glamo-dri-tests ?=3D "080b8db3d9dbfae38ebb00439887b5535ab1d3=
80"
> -SRCREV_pn-gnet ?=3D "495"
> -SRCREV_pn-gpe-conf ?=3D "9900"
> -SRCREV_pn-gpe-contacts ?=3D "9312"
> -SRCREV_pn-gpe-gallery ?=3D "9376"
> -SRCREV_pn-gpe-mini-browser2 ?=3D "9900"
> -SRCREV_pn-gpe-sketchbook ?=3D "9547"
> -SRCREV_pn-gtkhtml2 ?=3D "1158"
> -SRCREV_pn-gypsy ?=3D "134"
> -SRCREV_pn-hildon-1 ?=3D "14429"
> =A0SRCREV_pn-illume-theme-freesmartphone ?=3D "b1b0f6adc59e6f72a392977105=
8e3750bf181bc5"
> -SRCREV_pn-kismet ?=3D "2285"
> -SRCREV_pn-kismet-newcore ?=3D "2285"
> -SRCREV_pn-libcalenabler2 ?=3D "1410"
> -SRCREV_pn-libfakekey ?=3D "1455"
> =A0SRCREV_pn-libgdbus ?=3D "aeab6e3c0185b271ca343b439470491b99cc587f"
> =A0SRCREV_pn-libgee ?=3D "a86abd4240622ec377bbc5773850a4593e13f7eb"
> =A0SRCREV_pn-libgee-native ?=3D "a86abd4240622ec377bbc5773850a4593e13f7eb=
"
> -SRCREV_pn-libgsmd ?=3D "4505"
> -SRCREV_pn-libiac ?=3D "1590"
> =A0SRCREV_pn-libmodulo ?=3D "7d2f657d248bd86377e66c329aa6826459d406da"
> =A0SRCREV_pn-libnl2 ?=3D "8808743839b0f459394ecd00cb0f7c1896c0ab7a"
> -SRCREV_pn-libowl ?=3D "277"
> =A0SRCREV_pn-libphone-ui ?=3D "08ccc9710b1f33c93cc8f1c20be9c658ef5040dd"
> =A0SRCREV_pn-libphone-ui-shr ?=3D "2106165a2be62053f9d0019d50813823a84b84=
21"
> -SRCREV_pn-librfid ?=3D "2094"
> -SRCREV_pn-libsnmp-perl ?=3D "17367"
> =A0SRCREV_pn-libsynthesis ?=3D "70f0065aa3b085bdf059830f95e5b5766eecb0bb"
> -SRCREV_pn-libw100 ?=3D "47"
> =A0SRCREV_pn-libxcalibrate ?=3D "209d83af61ed38a002c8096377deac292b3e396c=
"
> -SRCREV_pn-libxosd ?=3D "627"
> -SRCREV_pn-linux-bfin ?=3D "3758"
> =A0SRCREV_pn-linux-eten ?=3D "ab2d414f4f13816af0ec0401b608133ca946624a"
> -SRCREV_pn-linux-hackndev-2.6 ?=3D "1308"
> -SRCREV_pn-linux-ixp4xx ?=3D "1089"
> =A0SRCREV_pn-linux-sgh-i900 ?=3D "7e5f8bd3864485e5fc66cb946e09f18b5a32ceb=
c"
> -SRCREV_pn-llvm-gcc4 ?=3D "374"
> -SRCREV_pn-llvm-gcc4-cross ?=3D "374"
> =A0SRCREV_pn-madbutterfly ?=3D "ecd1842714b5e982f3138cbdd358517d57be6aa3"
> -SRCREV_pn-maemo-mapper ?=3D "118"
> =A0SRCREV_pn-mamona-input-methods ?=3D "4a8f11973021b8b4f157f5743e00f9f9a=
3c4802b"
> =A0SRCREV_pn-mamonaim-e-applet ?=3D "a1ba7e8a388ffce3cca92bad059cd801e773=
3a7a"
> -SRCREV_pn-matchbox-config-gtk ?=3D "1614"
> -SRCREV_pn-matchbox-desktop-2 ?=3D "2096"
> -SRCREV_pn-matchbox-keyboard ?=3D "1910"
> -SRCREV_pn-matchbox-keyboard-inputmethod ?=3D "1910"
> -SRCREV_pn-matchbox-panel-2 ?=3D "2098"
> -SRCREV_pn-matchbox-panel-2-icon-themes ?=3D "1907"
> -SRCREV_pn-matchbox-stroke ?=3D "1820"
> -SRCREV_pn-matchbox-terminal ?=3D "1612"
> -SRCREV_pn-matchbox-wm-2 ?=3D "2087"
> =A0SRCREV_pn-midori ?=3D "400139644371c0b675723f9a986ddab4445a8794"
> =A0SRCREV_pn-mobile-broadband-provider-info ?=3D "bc536218490377ccbd09c4e=
5858d37c91c2f03f7"
> =A0SRCREV_pn-moblin-proto ?=3D "8f2cb524fe06555182c25b4ba3202d7b368ac0ce"
> -SRCREV_pn-mpd-alsa ?=3D "6952"
> -SRCREV_pn-mplayer-maemo ?=3D "342"
> =A0SRCREV_pn-msn-pecan ?=3D "e795b33b29d792f19fcf699275eb966dc68be257"
> -SRCREV_pn-multitap-pad ?=3D "373"
> =A0SRCREV_pn-mux ?=3D "72460e890dbb15edbf7dc193116be0dcf9794a8b"
> -SRCREV_pn-net-snmp ?=3D "17367"
> -SRCREV_pn-netsurf ?=3D "3859"
> -SRCREV_pn-oh-puzzles ?=3D "22"
> =A0SRCREV_pn-ohm ?=3D "edfe25d49d67884bf004de7ae0724c162bb5e65e"
> =A0SRCREV_pn-ologicd ?=3D "4a32af91a9479ebd4d1d39057354ac9904d74cbb"
> =A0SRCREV_pn-om-locations ?=3D "942e88a1b689ffe3f11a2d982cce389cc965b2ec"
> =A0SRCREV_pn-openbsc ?=3D "5e68183a201ab92f29cd2467df5209f7b351a66d"
> =A0SRCREV_pn-openbsc-onwaves ?=3D "0d9ed87d5c7d5b6e21dc3bbb282e2150687425=
66"
> =A0SRCREV_pn-openezx-kernel ?=3D "b390bb1ee708277297fdfd38e26d955b17d81c2=
e"
> -SRCREV_pn-openmoko-footer ?=3D "2354"
> -SRCREV_pn-openmoko-terminal2 ?=3D "4782"
> =A0SRCREV_pn-openmoocow ?=3D "39648419825cddfea1cb1321e552a12b71fede14"
> -SRCREV_pn-openocd ?=3D "517"
> -SRCREV_pn-openocd-native ?=3D "517"
> =A0SRCREV_pn-opimd-utils ?=3D "1872cdebe1209123710259e25cb8c8b47a627112"
> -SRCREV_pn-opkg ?=3D "527"
> -SRCREV_pn-opkg-native ?=3D "526"
> -SRCREV_pn-opkg-sdk ?=3D "526"
> -SRCREV_pn-opkg-utils ?=3D "4578"
> -SRCREV_pn-opkg-utils-native ?=3D "4595"
> -SRCREV_pn-oprofileui ?=3D "173"
> -SRCREV_pn-osb-browser ?=3D "125"
> -SRCREV_pn-osb-jscore ?=3D "117"
> -SRCREV_pn-osb-nrcit ?=3D "125"
> -SRCREV_pn-osb-nrcore ?=3D "126"
> =A0SRCREV_pn-packagekit ?=3D "96823118e98515dd41748e8c7bdb9cf7b1d4a95f"
> =A0SRCREV_pn-paroli ?=3D "bb9fb1969acdfbaa48b55902675a6d8949014c6d"
> =A0SRCREV_pn-phonefsod ?=3D "de3eab1df1682cb41abfd105bb6767fedfbbf7b4"
> =A0SRCREV_pn-phoneui-apps ?=3D "d349e764400d7a4eaaa12f359d6c64b3ca55faaf"
> =A0SRCREV_pn-phoneuid ?=3D "30e063783b4b3fe5a411e7739d76dc85129452aa"
> -SRCREV_pn-portaudio-v19 ?=3D "1387"
> -SRCREV_pn-psplash ?=3D "249"
> =A0SRCREV_pn-pty-forward-native ?=3D "4662b55fdba528bb5b3349f83055bf236af=
5d63b"
> =A0SRCREV_pn-pygsm ?=3D "976477f6b403f422b4ea730f71ebf409f6671141"
> =A0SRCREV_pn-pyphonelog ?=3D "d631b6242b75ce49e2fe8c4e50fec46d5d80bc97"
> -SRCREV_pn-pythm ?=3D "19"
> -SRCREV_pn-python-coherence ?=3D "1161"
> -SRCREV_pn-python-connexion ?=3D "1439"
> -SRCREV_pn-python-formencode ?=3D "3148"
> -SRCREV_pn-python-gsmd ?=3D "148"
> =A0SRCREV_pn-python-pycrypto ?=3D "d087280d7e9643a3e3f68f209932119fe6738b=
3c"
> -SRCREV_pn-python-pyyaml ?=3D "344"
> -QEMUSRCREV ?=3D "4242"
> -SRCREV_pn-qemu ?=3D "${QEMUSRCREV}"
> -SRCREV_pn-qemu-native ?=3D "${QEMUSRCREV}"
> -SRCREV_pn-qemu-sdk ?=3D "${QEMUSRCREV}"
> =A0SRCREV_pn-qtwebkit-performance-utilities ?=3D "27a630a74518ebb7810ed58=
86182e676b36c07a5"
> =A0SRCREV_pn-qtwebkit-performance-utilities-e ?=3D "27a630a74518ebb7810ed=
5886182e676b36c07a5"
> =A0SRCREV_pn-serial-forward ?=3D "50cf4ff2198589a8db369789fc038604a892a54=
d"
> -SRCREV_pn-settings-daemon ?=3D "2006"
> =A0SRCREV_pn-shr-config ?=3D "37dd7ac950e2bfd438801faf34c29fccfdbbaccf"
> =A0SRCREV_pn-shr-installer ?=3D "8608816ea1a1ac14b6e9faaa3685dd2b6450e889=
"
> =A0SRCREV_pn-shr-settings ?=3D "b6aed65934cf047f1abd3d8f630d87f900422c38"
> @@ -185,28 +79,15 @@ SRCREV_pn-shr-theme ?=3D "730da87ad75c814c16c856ca13=
8605d985b6efdb"
> =A0SRCREV_pn-shr-theme-gtk-e17lookalike ?=3D "1cc80e26a4558dfc2268b349d9a=
1f468e515bcfb"
> =A0SRCREV_pn-shr-today ?=3D "7b69649a9df0e85f0c0f7985fd1d93543c3b11e2"
> =A0SRCREV_pn-shr-wizard ?=3D "24450cba257e7057045ad576530f158a03bd0f8b"
> -SRCREV_pn-socketcan-modules ?=3D "917"
> -SRCREV_pn-socketcan-utils-test ?=3D "917"
> -SRCREV_pn-sphyrna-python ?=3D "45"
> -SRCREV_pn-starling ?=3D "9574"
> =A0SRCREV_pn-stopwatch ?=3D "89644b91e02151fc72989755f20c1ffb144ef5e2"
> -SRCREV_pn-table ?=3D "2191"
> =A0SRCREV_pn-tichy ?=3D "ab68d849502009cf3214df48ffa8075a10cc2177"
> -SRCREV_pn-tmut ?=3D "60"
> =A0SRCREV_pn-toscoterm ?=3D "f02add76f365a2fecd2dbefc230ceaab20244f96"
> -SRCREV_pn-tslib ?=3D "77"
> -SRCREV_pn-u-boot-bug ?=3D "8674"
> =A0SRCREV_pn-u-boot-openmoko ?=3D "650149a53dbdd48bf6dfef90930c8ab182adb5=
12"
> =A0SRCREV_pn-u-boot-openmoko-devel ?=3D "ba029a1426bfca169572bf80d50a8b19=
0a6b0e19"
> -SRCREV_pn-usbpath ?=3D "3172"
> -SRCREV_pn-usbpath-native ?=3D "3172"
> =A0SRCREV_pn-webkit-efl ?=3D "3a5ee77664c898ed51a2b2d5759822f8c0a06472"
> -SRCREV_pn-wesnoth ?=3D "39828"
> -SRCREV_pn-wlan-ng-modules ?=3D "1859"
> -SRCREV_pn-wlan-ng-utils ?=3D "1859"
> -SRCREV_pn-xoo ?=3D "1971"
> =A0SRCREV_pn-xserver-kdrive-glamo ?=3D "9b28d998424c77fbc057dd3a022ccbb12=
2793a52"
>
> +OPKG_SRCREV ?=3D "527"
> =A0EFL_SRCREV ?=3D "47642"
>
> =A0require conf/distro/include/sane-srcrevs-fso.inc
> diff --git a/recipes/accelges/accelges_svn.bb b/recipes/accelges/accelges=
_svn.bb
> index 3c3c8ac..b351d41 100644
> --- a/recipes/accelges/accelges_svn.bb
> +++ b/recipes/accelges/accelges_svn.bb
> @@ -7,6 +7,8 @@ SECTION =3D "openmoko/utilities"
> =A0PV =3D "0.2+svnr${SRCPV}"
> =A0PR =3D "r2"
> =A0PE =3D "1"
> +SRCREV =3D "206"
> +
> =A0DEPENDS =3D "dbus dbus-glib libxrandr libnotify notification-daemon cu=
rl gtk+"
> =A0RDEPENDS =3D "dbus dbus-glib libxrandr libnotify notification-daemon l=
ibcurl gtk+"
>
> diff --git a/recipes/aircrack/aircrack-ng_1.0-svn.bb b/recipes/aircrack/a=
ircrack-ng_1.0-svn.bb
> index 37af3d5..1fa93ed 100644
> --- a/recipes/aircrack/aircrack-ng_1.0-svn.bb
> +++ b/recipes/aircrack/aircrack-ng_1.0-svn.bb
> @@ -5,6 +5,8 @@ LICENSE =3D "GPLv2"
> =A0DEPENDS =3D "openssl zlib sqlite3"
> =A0PV =3D "0.9.99+svnr${SRCPV}"
> =A0PR =3D "r1"
> +SRCREV =3D "802"
> +
> =A0SRC_URI =3D "svn://trac.aircrack-ng.org/svn/branch;module=3D1.0-dev;pr=
oto=3Dhttp"
>
> =A0S=3D"${WORKDIR}/1.0-dev"
> diff --git a/recipes/bootchart-lite/bootchart-lite_svn.bb b/recipes/bootc=
hart-lite/bootchart-lite_svn.bb
> index 1368c92..38480f2 100644
> --- a/recipes/bootchart-lite/bootchart-lite_svn.bb
> +++ b/recipes/bootchart-lite/bootchart-lite_svn.bb
> @@ -5,6 +5,7 @@ SECTION =3D "console/utils"
> =A0HOMEPAGE =3D "http://code.google.com/p/bootchart-lite/"
> =A0PV =3D "0.1+svnr${SRCPV}"
> =A0PR =3D "r0"
> +SRCREV =3D "4"
>
> =A0SRC_URI =3D "svn://bootchart-lite.googlecode.com/svn/;module=3Dtrunk;p=
roto=3Dhttp"
> =A0S =3D "${WORKDIR}/trunk"
> diff --git a/recipes/cdparanoia/cdparanoia_svn.bb b/recipes/cdparanoia/cd=
paranoia_svn.bb
> index 783d507..724a9a1 100644
> --- a/recipes/cdparanoia/cdparanoia_svn.bb
> +++ b/recipes/cdparanoia/cdparanoia_svn.bb
> @@ -6,6 +6,7 @@ PR =3D "r2"
> =A0LICENSE =3D "GPL"
>
> =A0PV =3D "10.2+svnr${SRCPV}"
> +SRCREV =3D "16684"
>
> =A0SRC_URI =3D "svn://svn.xiph.org/trunk;module=3Dcdparanoia;proto=3Dhttp=
 \
> =A0 =A0 =A0 =A0 file://fixes10.patch;patch=3D1 \
> diff --git a/recipes/clutter/clutter-box2d_svn.bb b/recipes/clutter/clutt=
er-box2d_svn.bb
> index 8ef7a03..aa2156a 100644
> --- a/recipes/clutter/clutter-box2d_svn.bb
> +++ b/recipes/clutter/clutter-box2d_svn.bb
> @@ -2,6 +2,7 @@ require clutter-box2d.inc
>
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r4"
> +SRCREV =3D "3197"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3D${PN};p=
roto=3Dhttp"
>
> diff --git a/recipes/clutter/clutter-cairo_svn.bb b/recipes/clutter/clutt=
er-cairo_svn.bb
> index f4919ac..bd09579 100644
> --- a/recipes/clutter/clutter-cairo_svn.bb
> +++ b/recipes/clutter/clutter-cairo_svn.bb
> @@ -1,6 +1,7 @@
> =A0require clutter-cairo.inc
>
> =A0PV =3D "0.8.0+svnr${SRCPV}"
> +SRCREV =3D "3210"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3D${PN};p=
roto=3Dhttp \
> =A0 =A0 =A0 =A0 =A0 =A0file://enable_examples.patch;patch=3D1"
> diff --git a/recipes/clutter/clutter-gst_svn.bb b/recipes/clutter/clutter=
-gst_svn.bb
> index 3e122c7..74798ac 100644
> --- a/recipes/clutter/clutter-gst_svn.bb
> +++ b/recipes/clutter/clutter-gst_svn.bb
> @@ -1,6 +1,7 @@
> =A0require clutter-gst.inc
>
> =A0PV =3D "0.8.0+svnr${SRCPV}"
> +SRCREV =3D "3188"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3D${PN};p=
roto=3Dhttp \
> =A0 =A0 =A0 =A0 =A0 =A0file://autofoo.patch;patch=3D1"
> diff --git a/recipes/clutter/clutter_0.4svn.bb b/recipes/clutter/clutter_=
0.4svn.bb
> index 121b964..aea2a4c 100644
> --- a/recipes/clutter/clutter_0.4svn.bb
> +++ b/recipes/clutter/clutter_0.4svn.bb
> @@ -2,6 +2,7 @@ require clutter.inc
>
> =A0PV =3D "0.4.0+svnr${SRCPV}"
> =A0PR =3D "${INC_PR}.0"
> +SRCREV =3D "3240"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclut=
ter-0-4;proto=3Dhttp \
> =A0 =A0 =A0 =A0 =A0 file://enable_tests-0.4.patch;patch=3D1 "
> diff --git a/recipes/clutter/clutter_0.6svn.bb b/recipes/clutter/clutter_=
0.6svn.bb
> index 21cafef..8bb56a7 100644
> --- a/recipes/clutter/clutter_0.6svn.bb
> +++ b/recipes/clutter/clutter_0.6svn.bb
> @@ -2,6 +2,7 @@ require clutter.inc
>
> =A0PV =3D "0.6.0+svnr${SRCPV}"
> =A0PR =3D "${INC_PR}.0"
> +SRCREV =3D "3240"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/branches;module=3Dclut=
ter-0-6;proto=3Dhttp \
> =A0 =A0 =A0 =A0 =A0 file://enable_tests-0.6.patch;patch=3D1 "
> diff --git a/recipes/clutter/clutter_svn.bb b/recipes/clutter/clutter_svn=
.bb
> index d8d623c..26eb359 100644
> --- a/recipes/clutter/clutter_svn.bb
> +++ b/recipes/clutter/clutter_svn.bb
> @@ -4,6 +4,7 @@ DEFAULT_PREFERENCE =3D "-1"
>
> =A0PV =3D "0.8.0+svnr${SRCPV}"
> =A0PR =3D "${INC_PR}.0"
> +SRCREV =3D "3240"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk;module=3Dclutter=
;proto=3Dhttp \
> =A0 =A0 =A0 =A0 =A0 =A0file://enable_tests.patch;patch=3D1;maxrev=3D2989 =
\
> diff --git a/recipes/clutter/table_svn.bb b/recipes/clutter/table_svn.bb
> index 039f903..e02ff73 100644
> --- a/recipes/clutter/table_svn.bb
> +++ b/recipes/clutter/table_svn.bb
> @@ -1,5 +1,6 @@
> =A0require table.inc
>
> +SRCREV =3D "2191"
> =A0PV =3D "0.3.0+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/clutter/trunk/toys;module=3Dta=
ble;proto=3Dhttp \
> diff --git a/recipes/comic-reader/comic-reader_svn.bb b/recipes/comic-rea=
der/comic-reader_svn.bb
> index 372d1d0..411b642 100644
> --- a/recipes/comic-reader/comic-reader_svn.bb
> +++ b/recipes/comic-reader/comic-reader_svn.bb
> @@ -3,10 +3,10 @@ HOMEPAGE =3D "http://code.google.com/p/comic-reader/"
> =A0LICENSE =3D "GPLv3"
> =A0DEPENDS =3D "evas edje ecore etk eet edbus"
> =A0PR =3D "r3"
> +SRCREV =3D "56"
>
> =A0SRC_URI =3D "svn://comic-reader.googlecode.com/svn/;module=3Dtrunk;pro=
to=3Dhttp"
>
> -SRCREV =3D "${AUTOREV}"
> =A0S =3D "${WORKDIR}/trunk"
>
> =A0inherit autotools pkgconfig
> diff --git a/recipes/dasher/dasher-gpe_0.0-svn.bb b/recipes/dasher/dasher=
-gpe_0.0-svn.bb
> index d4f9b20..1185b85 100644
> --- a/recipes/dasher/dasher-gpe_0.0-svn.bb
> +++ b/recipes/dasher/dasher-gpe_0.0-svn.bb
> @@ -1,6 +1,7 @@
> =A0LICENSE=3D"GPL"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r1"
> +SRCREV =3D "1251"
> =A0DEPENDS =3D "libxsettings-client libglade libxtst gconf gtk+"
> =A0SECTION =3D "gpe"
> =A0SRC_URI =3D "svn://svn.gnome.org/svn/dasher;module=3Dtrunk \
> diff --git a/recipes/dbus/dbus-c++_svn.bb b/recipes/dbus/dbus-c++_svn.bb
> index 5be5874..80e6f14 100644
> --- a/recipes/dbus/dbus-c++_svn.bb
> +++ b/recipes/dbus/dbus-c++_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "C++ bindings for dbus"
> =A0LICENSE =3D "LGPL"
> =A0SECTION =3D "libs"
> =A0DEPENDS =3D "dbus dbus-c++-native expat"
> +SRCREV =3D "13131"
>
> =A0SRC_URI =3D "svn://dev.openwengo.org/svn/openwengo/wengophone-ng/branc=
hes/wengophone-dbus-api/libs;module=3Ddbus;proto=3Dhttp"
> =A0# =A0 =A0 =A0 =A0 =A0 file://fix-linking.patch;patch=3D1"
> diff --git a/recipes/ebrainy/ebrainy_svn.bb b/recipes/ebrainy/ebrainy_svn=
.bb
> index 699aa1b..166cb55 100644
> --- a/recipes/ebrainy/ebrainy_svn.bb
> +++ b/recipes/ebrainy/ebrainy_svn.bb
> @@ -7,6 +7,7 @@ RDEPENDS =3D "elementary sqlite3 python-sqlalchemy python=
-mysqldb python-netserver
>
> =A0PV =3D "0.0.1+svnr${SRCPV}"
> =A0PR =3D "r1"
> +SRCREV =3D "21"
> =A0SRC_URI =3D "svn://ebrainy.googlecode.com/svn/trunk;module=3D.;proto=
=3Dhttp"
> =A0S =3D "${WORKDIR}"
>
> diff --git a/recipes/eds/eds-dbus_svn.bb b/recipes/eds/eds-dbus_svn.bb
> index 6bccb3d..274f55d 100644
> --- a/recipes/eds/eds-dbus_svn.bb
> +++ b/recipes/eds/eds-dbus_svn.bb
> @@ -5,6 +5,7 @@ DEPENDS =3D "intltool-native libglade glib-2.0 gtk+ gconf=
 dbus db gnome-common vir
>
> =A0PV =3D "1.4.0+svnr${SRCPV}"
> =A0PR =3D "r7"
> +SRCREV =3D "736"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/${PN};module=3Dtrunk;proto=3Dh=
ttp \
> =A0 =A0 =A0 =A0 =A0 =A0file://no_libdb.patch;patch=3D1;maxrev=3D659 \
> diff --git a/recipes/epdfview/epdfview_svn.bb b/recipes/epdfview/epdfview=
_svn.bb
> index 1c8e9e9..72faec3 100644
> --- a/recipes/epdfview/epdfview_svn.bb
> +++ b/recipes/epdfview/epdfview_svn.bb
> @@ -4,6 +4,7 @@ LICENSE =3D "GPLv2"
> =A0SECTION =3D "x11/applications"
> =A0DEPENDS =3D "poppler gtk+ cups"
>
> +SRCREV =3D "346"
> =A0PV =3D "0.1.7+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/ezx/ezx-boot-usb-native_svn.bb b/recipes/ezx/ezx-boo=
t-usb-native_svn.bb
> index 237d06b..3e24c59 100644
> --- a/recipes/ezx/ezx-boot-usb-native_svn.bb
> +++ b/recipes/ezx/ezx-boot-usb-native_svn.bb
> @@ -3,6 +3,7 @@ DEPENDS =3D "virtual/libusb0-native virtual/kernel"
> =A0SECTION =3D "devel"
> =A0AUTHOR =3D "Team OpenEZX <openezx-devel@lists.openezx.org>"
> =A0LICENSE =3D "GPL"
> +SRCREV =3D "2512"
> =A0PV =3D "0.3.0+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://svn.openezx.org/trunk/src/host;module=3Dboot_usb;pr=
oto=3Dhttp"
> diff --git a/recipes/ezx/ezx-gen-blob_svn.bb b/recipes/ezx/ezx-gen-blob_s=
vn.bb
> index 5841407..cf9f117 100644
> --- a/recipes/ezx/ezx-gen-blob_svn.bb
> +++ b/recipes/ezx/ezx-gen-blob_svn.bb
> @@ -5,7 +5,9 @@ HOMEPAGE =3D "http://people.openezx.org/wyrm/gen-blob"
> =A0LICENSE =3D "GPL"
> =A0PROVIDES =3D "virtual/bootloader"
> =A0DEPENDS =3D "virtual/kernel"
> -PV =3D "1.0.0+${SRCREV}"
> +SRCREV =3D "2517"
> +PV =3D "1.0.0+svnr${SRCPV}"
> +PE =3D "1"
> =A0PR =3D "r1"
>
> =A0SRC_URI =3D "\
> diff --git a/recipes/ezx/ezx-gpiotool_1877.bb b/recipes/ezx/ezx-gpiotool_=
1877.bb
> deleted file mode 100644
> index 81a1ecc..0000000
> --- a/recipes/ezx/ezx-gpiotool_1877.bb
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -DESCRIPTION =3D "Gpiotool can read/write gpio configuration from userspa=
ce."
> -SECTION =3D "devel"
> -LICENSE =3D "GPL"
> -HOMEPAGE =3D "http://www.openezx.org"
> -AUTHOR =3D "Harald Welte"
> -PR =3D "r0"
> -
> -SRC_URI =3D "svn://svn.openezx.org/trunk/src/userspace;module=3Dgpiotool=
;proto=3Dhttp;rev=3D${PV}"
> -S =3D "${WORKDIR}/gpiotool"
> -
> -do_compile() {
> - =A0 =A0 =A0 for i in mmio.c gpiotool.c gpio.c
> - =A0 =A0 =A0 do
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${CC} ${CFLAGS} -c $i
> - =A0 =A0 =A0 done
> - =A0 =A0 =A0 ${CC} ${CFLAGS} -o ezx-gpiotool mmio.o gpiotool.o gpio.o
> -}
> -
> -do_stage() {
> - =A0 =A0 =A0 :
> -}
> -
> -do_install() {
> - =A0 =A0 =A0 install -d ${D}${sbindir}
> - =A0 =A0 =A0 install -m 0755 ezx-gpiotool ${D}${sbindir}
> -}
> diff --git a/recipes/ezx/ezx-gpiotool_svn.bb b/recipes/ezx/ezx-gpiotool_s=
vn.bb
> new file mode 100644
> index 0000000..ef232e6
> --- /dev/null
> +++ b/recipes/ezx/ezx-gpiotool_svn.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Gpiotool can read/write gpio configuration from userspa=
ce."
> +SECTION =3D "devel"
> +LICENSE =3D "GPL"
> +HOMEPAGE =3D "http://www.openezx.org"
> +AUTHOR =3D "Harald Welte"
> +SRCREV =3D "1877"
> +PV =3D "${SRCPV}"
> +PR =3D "r0"
> +
> +SRC_URI =3D "svn://svn.openezx.org/trunk/src/userspace;module=3Dgpiotool=
;proto=3Dhttp"
> +S =3D "${WORKDIR}/gpiotool"
> +
> +do_compile() {
> + =A0 =A0 =A0 for i in mmio.c gpiotool.c gpio.c
> + =A0 =A0 =A0 do
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${CC} ${CFLAGS} -c $i
> + =A0 =A0 =A0 done
> + =A0 =A0 =A0 ${CC} ${CFLAGS} -o ezx-gpiotool mmio.o gpiotool.o gpio.o
> +}
> +
> +do_stage() {
> + =A0 =A0 =A0 :
> +}
> +
> +do_install() {
> + =A0 =A0 =A0 install -d ${D}${sbindir}
> + =A0 =A0 =A0 install -m 0755 ezx-gpiotool ${D}${sbindir}
> +}
> diff --git a/recipes/ezx/ezxd_svn.bb b/recipes/ezx/ezxd_svn.bb
> index 19bbd93..f738b5f 100644
> --- a/recipes/ezx/ezxd_svn.bb
> +++ b/recipes/ezx/ezxd_svn.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "GPLv2"
> =A0SECTION =3D "devel"
> =A0AUTHOR =3D "Daniel Ribeiro"
>
> +SRCREV =3D "2513"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r4"
>
> diff --git a/recipes/fbgrab/fbgrab-viewer-native_1.0.bb b/recipes/fbgrab/=
fbgrab-viewer-native_1.0.bb
> index 2494918..5300d14 100644
> --- a/recipes/fbgrab/fbgrab-viewer-native_1.0.bb
> +++ b/recipes/fbgrab/fbgrab-viewer-native_1.0.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "http://svn.openezx.org/trunk/src/userspace/=
fbgrab/"
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "console/network"
> =A0DEPENDS =3D "libpng-native"
> +SRCREV =3D "1943"
> =A0PV =3D "0.0+svn${SRCDATE}"
> =A0PR =3D "r30"
>
> diff --git a/recipes/flashrom/flashrom_svn.bb b/recipes/flashrom/flashrom=
_svn.bb
> index f90b6ee..7193c13 100644
> --- a/recipes/flashrom/flashrom_svn.bb
> +++ b/recipes/flashrom/flashrom_svn.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "http://www.coreboot.org/Flashrom"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "zlib pciutils"
>
> +SRCREV =3D "3682"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/fstests/fstests.bb b/recipes/fstests/fstests.bb
> deleted file mode 100644
> index 027a990..0000000
> --- a/recipes/fstests/fstests.bb
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -DESCRIPTION =3D "Various benchmarking tests for X"
> -HOMEPAGE =3D "http://www.o-hand.com"
> -SECTION =3D "devel"
> -LICENSE =3D "GPL"
> -PV =3D "0.0+svn${SRCDATE}"
> -PR =3D "r2"
> -
> -DEPENDS =3D "gtk+"
> -
> -inherit autotools
> -
> -SRC_URI =3D \
> - =A0 =A0"svn://svn.o-hand.com/repos/misc/trunk;module=3Dfstests;proto=3D=
http"
> -
> -S =3D "${WORKDIR}/fstests/tests"
> -
> -do_install() {
> - =A0 =A0install -d ${D}${bindir}
> - =A0 =A0find . -name "test-*" -type f -perm -755 -exec install -m 0755 {=
} ${D}${bindir} \;
> -}
> diff --git a/recipes/fstests/fstests_svn.bb b/recipes/fstests/fstests_svn=
.bb
> new file mode 100644
> index 0000000..d143ee5
> --- /dev/null
> +++ b/recipes/fstests/fstests_svn.bb
> @@ -0,0 +1,22 @@
> +DESCRIPTION =3D "Various benchmarking tests for X"
> +HOMEPAGE =3D "http://www.o-hand.com"
> +SECTION =3D "devel"
> +LICENSE =3D "GPL"
> +
> +SRCREV =3D "204"
> +PV =3D "0.0+svn${SRCDATE}"
> +PR =3D "r2"
> +
> +DEPENDS =3D "gtk+"
> +
> +inherit autotools
> +
> +SRC_URI =3D \
> + =A0 =A0"svn://svn.o-hand.com/repos/misc/trunk;module=3Dfstests;proto=3D=
http"
> +
> +S =3D "${WORKDIR}/fstests/tests"
> +
> +do_install() {
> + =A0 =A0install -d ${D}${bindir}
> + =A0 =A0find . -name "test-*" -type f -perm -755 -exec install -m 0755 {=
} ${D}${bindir} \;
> +}
> diff --git a/recipes/gabriel/gabriel_svn.bb b/recipes/gabriel/gabriel_svn=
.bb
> index f525885..3da92e1 100644
> --- a/recipes/gabriel/gabriel_svn.bb
> +++ b/recipes/gabriel/gabriel_svn.bb
> @@ -4,6 +4,7 @@ a dbus daemon running on a remote machine."
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "libssh glib-2.0 dbus dbus-glib"
> =A0SECTION =3D "console/network"
> +SRCREV =3D "38"
> =A0PV =3D "0.0.0+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://gabriel.svn.sourceforge.net/svnroot/gabriel;module=
=3Dgabriel;proto=3Dhttps"
> diff --git a/recipes/gnet/gnet_svn.bb b/recipes/gnet/gnet_svn.bb
> index f6b27e3..8132ab5 100644
> --- a/recipes/gnet/gnet_svn.bb
> +++ b/recipes/gnet/gnet_svn.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "LGPL"
> =A0SECTION =3D "libs/network"
> =A0HOMEPAGE =3D "http://www.gnetlibrary.org"
> =A0DEPENDS =3D "glib-2.0"
> +SRCREV =3D "495"
> =A0PV =3D "2.0.7+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/gnome/epiphany_svn.bb b/recipes/gnome/epiphany_svn.b=
b
> index 12f2bc5..6629c5b 100644
> --- a/recipes/gnome/epiphany_svn.bb
> +++ b/recipes/gnome/epiphany_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "GNOME default webbrowser"
> =A0DEPENDS =3D "gnome-desktop gnome-vfs libgnomeui webkit-gtk iso-codes s=
tartup-notification"
> =A0RDEPENDS =3D "gnome-vfs-plugin-http iso-codes"
>
> +SRCREV =3D "7837"
> =A0PV =3D "2.20.1+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/gnome/gconf-dbus_svn.bb b/recipes/gnome/gconf-dbus_s=
vn.bb
> index 671d9f4..4deae57 100644
> --- a/recipes/gnome/gconf-dbus_svn.bb
> +++ b/recipes/gnome/gconf-dbus_svn.bb
> @@ -5,6 +5,8 @@ SECTION =3D "x11/utils"
> =A0PROVIDES =3D "gconf"
> =A0RPROVIDES_${PN} =3D "gconf"
> =A0RPROVIDES_${PN}-dev =3D "gconf-dev"
> +
> +SRCREV =3D "641"
> =A0PV =3D "2.16.0+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/gpe-conf/gpe-conf_svn.bb b/recipes/gpe-conf/gpe-conf=
_svn.bb
> index e18c8a8..f32b6f8 100644
> --- a/recipes/gpe-conf/gpe-conf_svn.bb
> +++ b/recipes/gpe-conf/gpe-conf_svn.bb
> @@ -11,6 +11,7 @@ RDEPENDS_gpe-conf-panel =3D "gpe-conf"
>
> =A0inherit autotools gpe
>
> +SRCREV =3D "9900"
> =A0PV =3D "0.2.8+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/gpe-contacts/gpe-contacts_svn.bb b/recipes/gpe-conta=
cts/gpe-contacts_svn.bb
> index 2050b60..bad9aad 100644
> --- a/recipes/gpe-contacts/gpe-contacts_svn.bb
> +++ b/recipes/gpe-contacts/gpe-contacts_svn.bb
> @@ -3,6 +3,7 @@ SECTION =3D "gpe"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "libcontactsdb libgpewidget libgpepimc libdisplaymigration=
 libgpevtype dbus"
> =A0RDEPENDS =3D "gpe-icons"
> +SRCREV =3D "9312"
> =A0PV =3D "0.47+svnr${SRCPV}"
> =A0PR =3D "r2"
>
> diff --git a/recipes/gpe-gallery/gpe-gallery_svn.bb b/recipes/gpe-gallery=
/gpe-gallery_svn.bb
> index 8d7bf3a..14a1ea0 100644
> --- a/recipes/gpe-gallery/gpe-gallery_svn.bb
> +++ b/recipes/gpe-gallery/gpe-gallery_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "GPE image viewer application"
> =A0SECTION =3D "gpe"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "libgpewidget"
> +SRCREV =3D "9376"
> =A0PV =3D "0.97+svnr${SRCPV}"
>
> =A0inherit autotools
> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb b/recipes/=
gpe-mini-browser/gpe-mini-browser2_svn.bb
> index b919e1a..6bc89c8 100644
> --- a/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
> +++ b/recipes/gpe-mini-browser/gpe-mini-browser2_svn.bb
> @@ -2,7 +2,7 @@ DEPENDS =3D "gtk+ glib-2.0 libgpewidget webkit-gtk"
> =A0PV =3D "0.0.1+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> -SRCREV =3D "9819"
> +SRCREV =3D "9900"
>
> =A0inherit autotools
>
> diff --git a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb b/recipes/g=
pe-mini-browser/gpe-mini-browser_svn.bb
> index 30d9d83..d382706 100644
> --- a/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
> +++ b/recipes/gpe-mini-browser/gpe-mini-browser_svn.bb
> @@ -1,5 +1,7 @@
> =A0DEPENDS =3D "sqlite gettext gtk+ glib-2.0 osb-nrcit libgpewidget"
> =A0RRECOMMENDS =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-png gdk-pixbu=
f-loader-jpeg"
> +
> +SRCREV =3D "9900"
> =A0PV =3D "0.20+svn${SRCDATE}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/gpe-sketchbook/gpe-sketchbook_svn.bb b/recipes/gpe-s=
ketchbook/gpe-sketchbook_svn.bb
> index f52f58d..049fe36 100644
> --- a/recipes/gpe-sketchbook/gpe-sketchbook_svn.bb
> +++ b/recipes/gpe-sketchbook/gpe-sketchbook_svn.bb
> @@ -3,6 +3,7 @@ SECTION =3D "gpe"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "libgpewidget sqlite"
> +SRCREV =3D "9547"
> =A0PV =3D "0.2.9+svnr${SRCPV}"
>
> =A0DEFAULT_PREFERENCE =3D "-1"
> diff --git a/recipes/gpephone/contact_svn.bb b/recipes/gpephone/contact_s=
vn.bb
> index ef4d270..4d0c7a5 100644
> --- a/recipes/gpephone/contact_svn.bb
> +++ b/recipes/gpephone/contact_svn.bb
> @@ -5,6 +5,7 @@ LICENSE =3D "LiPS"
> =A0DEPENDS =3D "gtk+ libgpephone dbus-glib libabenabler2 librecord2 libge=
mwidget"
> =A0PV =3D "0.0+svnr-${SRCREV}"
> =A0PR =3D "r0"
> +SRCREV =3D "1410"
>
> =A0inherit gpephone autotools
>
> diff --git a/recipes/gpephone/libcalenabler2_svn.bb b/recipes/gpephone/li=
bcalenabler2_svn.bb
> index e3bf129..c5c77f7 100644
> --- a/recipes/gpephone/libcalenabler2_svn.bb
> +++ b/recipes/gpephone/libcalenabler2_svn.bb
> @@ -3,7 +3,9 @@ SECTION =3D "gpe/libs"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "LiPS"
> =A0DEPENDS =3D "glib-2.0 sqlite3 libical libalmmgr"
> -PV =3D "0.0+svnr-${SRCREV}"
> +SRCREV =3D "1410"
> +PV =3D "0.0+svnr${SRCPV}"
> +PE =3D "1"
> =A0PR =3D "r0"
>
>
> diff --git a/recipes/gpephone/libiac2_svn.bb b/recipes/gpephone/libiac2_s=
vn.bb
> index 7ae0c7b..cea56f0 100644
> --- a/recipes/gpephone/libiac2_svn.bb
> +++ b/recipes/gpephone/libiac2_svn.bb
> @@ -3,7 +3,9 @@ SECTION =3D "gpe/libs"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "LiPS"
> =A0DEPENDS =3D "gtk+ gtk-doc dbus-glib"
> -PV =3D "0.0+svnr-${SRCREV}"
> +SRCREV =3D "1590"
> +PV =3D "0.0+svnr${SRCPV}"
> +PE =3D "1"
> =A0PR =3D "r0"
>
> =A0inherit gpephone pkgconfig autotools
> diff --git a/recipes/gpephone/libiac_svn.bb b/recipes/gpephone/libiac_svn=
.bb
> index 0cd1d64..f6f4c0c 100644
> --- a/recipes/gpephone/libiac_svn.bb
> +++ b/recipes/gpephone/libiac_svn.bb
> @@ -3,7 +3,9 @@ SECTION =3D "gpe/libs"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "LiPS"
> =A0DEPENDS =3D "gtk+ gtk-doc"
> -PV =3D "1.0+svnr-${SRCREV}"
> +SRCREV =3D "1590"
> +PV =3D "1.0+svnr${SRCPV}"
> +PE =3D "1"
> =A0PR =3D "r0"
>
> =A0inherit gpephone pkgconfig autotools
> diff --git a/recipes/gsm/gsmd.inc b/recipes/gsm/gsmd.inc
> index 453a8b3..2e0aad1 100644
> --- a/recipes/gsm/gsmd.inc
> +++ b/recipes/gsm/gsmd.inc
> @@ -4,6 +4,7 @@ LICENSE =3D "GPL LGPL"
> =A0SECTION =3D "libs/gsm"
> =A0PROVIDES +=3D "gsmd"
> =A0RPROVIDES_${PN} =3D "libgsmd0 libgsmd gsmd gsmd-devel"
> +SRCREV =3D "4505"
> =A0PV =3D "0.1+svnr${SRCPV}"
> =A0PR =3D "r44"
>
> diff --git a/recipes/gtk-webcore/osb-browser_svn.bb b/recipes/gtk-webcore=
/osb-browser_svn.bb
> index aae2799..b6fc792 100644
> --- a/recipes/gtk-webcore/osb-browser_svn.bb
> +++ b/recipes/gtk-webcore/osb-browser_svn.bb
> @@ -5,6 +5,7 @@ PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "osb-nrcit gtk+ glib-2.0 libglade"
> =A0RRECOMMENDS =3D "gdk-pixbuf-loader-gif gdk-pixbuf-loader-ico gdk-pixbu=
f-loader-jpeg gdk-pixbuf-loader-png"
> +SRCREV =3D "125"
> =A0PV =3D "0.5.0+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/gtk-webcore/osb-jscore_svn.bb b/recipes/gtk-webcore/=
osb-jscore_svn.bb
> index af85764..434a5f1 100644
> --- a/recipes/gtk-webcore/osb-jscore_svn.bb
> +++ b/recipes/gtk-webcore/osb-jscore_svn.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "http://gtk-webcore.sourceforge.net/"
> =A0LICENSE =3D "GPL"
> =A0PRIORITY =3D "optional"
>
> +SRCREV =3D "117"
> =A0PV =3D "0.5.2+svnr${SRCPV}"
> =A0PR =3D "r2"
>
> diff --git a/recipes/gtk-webcore/osb-nrcit_svn.bb b/recipes/gtk-webcore/o=
sb-nrcit_svn.bb
> index dea075b..aff5df6 100644
> --- a/recipes/gtk-webcore/osb-nrcit_svn.bb
> +++ b/recipes/gtk-webcore/osb-nrcit_svn.bb
> @@ -4,6 +4,7 @@ LICENSE =3D "nokia"
> =A0PRIORITY =3D "optional"
> =A0SECTION =3D "gpe"
>
> +SRCREV =3D "125"
> =A0PV =3D "0.5.2+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/gtk-webcore/osb-nrcore_svn.bb b/recipes/gtk-webcore/=
osb-nrcore_svn.bb
> index e0f7c88..1579a36 100644
> --- a/recipes/gtk-webcore/osb-nrcore_svn.bb
> +++ b/recipes/gtk-webcore/osb-nrcore_svn.bb
> @@ -1,5 +1,6 @@
> =A0require osb-nrcore.inc
>
> +SRCREV =3D "126"
> =A0PV =3D "0.5.2+svnr${SRCPV}"
> =A0PR =3D "r3"
>
> diff --git a/recipes/gtkhtml2/gtkhtml2_svn.bb b/recipes/gtkhtml2/gtkhtml2=
_svn.bb
> index 18dfdd0..ada9195 100644
> --- a/recipes/gtkhtml2/gtkhtml2_svn.bb
> +++ b/recipes/gtkhtml2/gtkhtml2_svn.bb
> @@ -2,6 +2,7 @@ SECTION =3D "libs"
> =A0DEPENDS =3D "gtk+ glib-2.0 libxml2"
> =A0DESCRIPTION =3D "A GTK+ HTML rendering library."
> =A0LICENSE =3D "GPL"
> +SRCREV =3D "1158"
> =A0PV =3D "2.11.0+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://anonymous@svn.gnome.org/svn/gtkhtml2/;module=3Dtrun=
k \
> diff --git a/recipes/kismet/kismet-newcore_svn.bb b/recipes/kismet/kismet=
-newcore_svn.bb
> index aaa0727..1db0ce6 100644
> --- a/recipes/kismet/kismet-newcore_svn.bb
> +++ b/recipes/kismet/kismet-newcore_svn.bb
> @@ -2,6 +2,7 @@ require kismet.inc
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> +SRCREV =3D "2285"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r3"
>
> diff --git a/recipes/kismet/kismet_svn.bb b/recipes/kismet/kismet_svn.bb
> index aa60062..1321a7a 100644
> --- a/recipes/kismet/kismet_svn.bb
> +++ b/recipes/kismet/kismet_svn.bb
> @@ -2,6 +2,7 @@ require kismet.inc
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> +SRCREV =3D "2285"
> =A0PV =3D "2007-10-R1+svnr${SRCPV}"
> =A0PR =3D "r2"
>
> diff --git a/recipes/libfakekey/libfakekey_svn.bb b/recipes/libfakekey/li=
bfakekey_svn.bb
> index 88cada8..94aa8c5 100644
> --- a/recipes/libfakekey/libfakekey_svn.bb
> +++ b/recipes/libfakekey/libfakekey_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Matchbox keyboard"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "libxtst"
> =A0SECTION =3D "x11/wm"
> +SRCREV =3D "1455"
> =A0PV =3D "0.2+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/libowl/libowl_svn.bb b/recipes/libowl/libowl_svn.bb
> index 677a25f..fa1254f 100644
> --- a/recipes/libowl/libowl_svn.bb
> +++ b/recipes/libowl/libowl_svn.bb
> @@ -12,6 +12,7 @@ HOMEPAGE =3D "http://www.o-hand.com"
> =A0LICENSE =3D "LGPL"
> =A0SECTION =3D "libs"
> =A0DEPENDS =3D "gtk+"
> +SRCREV =3D "277"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r3"
>
> diff --git a/recipes/librfid/librfid_svn.bb b/recipes/librfid/librfid_svn=
.bb
> index 7df31ee..cfa9659 100644
> --- a/recipes/librfid/librfid_svn.bb
> +++ b/recipes/librfid/librfid_svn.bb
> @@ -5,6 +5,7 @@ LICENSE =3D "GPL"
> =A0DEPENDS =3D "virtual/libusb0"
> =A0SRCNAME =3D "librfid"
>
> +SRCREV =3D "2094"
> =A0PV =3D "0.2.0+svnr${SRCPV}"
> =A0PR =3D "r5"
>
> diff --git a/recipes/libw100/libw100_svn.bb b/recipes/libw100/libw100_svn=
.bb
> index 9e01a2a..343d530 100644
> --- a/recipes/libw100/libw100_svn.bb
> +++ b/recipes/libw100/libw100_svn.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "Acceleration library for ATI imageon chipsets (w100 a=
nd w3220)"
> =A0LICENSE =3D "GPLv2"
>
> +SRCREV =3D "47"
> =A0PV =3D "0.0.2+svnr${SRCPV}"
> =A0PE =3D "1"
> =A0SRC_URI =3D "svn://libw100.svn.sourceforge.net/svnroot/libw100;module=
=3Dtrunk;proto=3Dhttps"
> diff --git a/recipes/libxosd/libxosd_svn.bb b/recipes/libxosd/libxosd_svn=
.bb
> index bc40b34..b760e24 100644
> --- a/recipes/libxosd/libxosd_svn.bb
> +++ b/recipes/libxosd/libxosd_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "A library for displaying a TV-like on-sc=
reen display in X."
> =A0SECTION =3D "libs/x11"
> =A0DEPENDS =3D "virtual/libx11 libxext"
> =A0LICENSE =3D "LGPL"
> +SRCREV =3D "627"
> =A0PV =3D "2.2.15+svnr${SRCPV}"
> =A0PR =3D "r5"
>
> diff --git a/recipes/linux/linux-bfin_svn.bb b/recipes/linux/linux-bfin_s=
vn.bb
> index 9b1b4e1..192bd22 100644
> --- a/recipes/linux/linux-bfin_svn.bb
> +++ b/recipes/linux/linux-bfin_svn.bb
> @@ -2,6 +2,7 @@ require linux.inc
>
> =A0COMPATIBLE_HOST =3D 'bfin.*-uclinux'
>
> +SRCREV =3D "3758"
> =A0PV =3D "2.6.22.10+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://sources.blackfin.uclinux.org/linux-kernel/;module=
=3Dtrunk \
> diff --git a/recipes/linux/linux-hackndev-2.6_git.bb b/recipes/linux/linu=
x-hackndev-2.6_git.bb
> index 4c577d2..a302bee 100644
> --- a/recipes/linux/linux-hackndev-2.6_git.bb
> +++ b/recipes/linux/linux-hackndev-2.6_git.bb
> @@ -2,6 +2,9 @@ DESCRIPTION =3D "Hack&Dev's Linux kernel for Palm devices=
."
> =A0HOMEPAGE =3D "http://www.hackndev.com/"
> =A0SECTION =3D "kernel"
> =A0LICENSE =3D "GPLv2"
> +# This was in sane-srcrevs.inc - doesn't look sane to me (for git recipe=
)
> +# SRCREV_pn-linux-hackndev-2.6 ?=3D "1308"
> +SRCREV =3D "8f62c3b8a7e7de042846211f387a867f6703f272"
> =A0PR =3D "r14"
>
> =A0COMPATIBLE_MACHINE =3D "(palmld|palmtc|palmtt3|palmtt5|palmtx|palmz31|=
palmz72|palmt650)"
> diff --git a/recipes/linux/linux-ixp4xx.inc b/recipes/linux/linux-ixp4xx.=
inc
> index 9c4dd37..f00c4c4 100644
> --- a/recipes/linux/linux-ixp4xx.inc
> +++ b/recipes/linux/linux-ixp4xx.inc
> @@ -1,6 +1,7 @@
> =A0# linux-ixp4xx.inc
> =A0#
> =A0DESCRIPTION =3D "Linux 2.6.x kernel for IXP4xx devices"
> +SRCREV =3D "1089"
>
> =A0COMPATIBLE_HOST =3D 'arm.*-linux.*'
> =A0COMPATIBLE_MACHINE =3D '(ixp4xx|nslu2|syhl1)'
> diff --git a/recipes/llvm/llvm-gcc4-cross_svn.bb b/recipes/llvm/llvm-gcc4=
-cross_svn.bb
> index 5257713..adf8cb4 100644
> --- a/recipes/llvm/llvm-gcc4-cross_svn.bb
> +++ b/recipes/llvm/llvm-gcc4-cross_svn.bb
> @@ -4,6 +4,7 @@ LICENSE =3D "various"
>
> =A0DEPENDS =3D "llvm2.5-native"
>
> +SRCREV =3D "374"
> =A0PV =3D "2.1+svnr${SRCPV}"
>
> =A0PR =3D "r1"
> diff --git a/recipes/llvm/llvm-gcc4_svn.bb b/recipes/llvm/llvm-gcc4_svn.b=
b
> index 74ac580..363be8e 100644
> --- a/recipes/llvm/llvm-gcc4_svn.bb
> +++ b/recipes/llvm/llvm-gcc4_svn.bb
> @@ -4,6 +4,7 @@ LICENSE =3D "various"
>
> =A0DEPENDS =3D "llvm2.5-native"
>
> +SRCREV =3D "374"
> =A0PV =3D "2.0+svnr${SRCPV}"
>
> =A0PR =3D "r1"
> diff --git a/recipes/maemo-mapper/maemo-mapper_svn.bb b/recipes/maemo-map=
per/maemo-mapper_svn.bb
> index afc2d93..2c1bb4c 100644
> --- a/recipes/maemo-mapper/maemo-mapper_svn.bb
> +++ b/recipes/maemo-mapper/maemo-mapper_svn.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "GPL"
> =A0DEPENDS =3D "gdbm libconic sqlite3 gtk+ libhildonfm libosso osso-ic-os=
s libosso-help gnome-vfs dbus bluez-libs"
> =A0RDEPENDS =3D "bluez-utils"
> =A0RRECOMMENDS =3D "gpsd flite"
> +SRCREV =3D "118"
> =A0PV =3D "2.0.3+svnr${SRCPV}"
> =A0PR =3D "r2"
>
> diff --git a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb b/rec=
ipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
> index f791dce..c2d44d9 100644
> --- a/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
> +++ b/recipes/matchbox-config-gtk/matchbox-config-gtk_svn.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "GPL"
> =A0DEPENDS =3D "gconf gtk+"
> =A0RDEPENDS =3D "settings-daemon"
>
> +SRCREV =3D "1614"
> =A0PV =3D "0.0+svnr${SRCPV}"
>
> =A0S =3D "${WORKDIR}/${PN}"
> diff --git a/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.=
bb b/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
> index 5e749ae..3343b6f 100644
> --- a/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
> +++ b/recipes/matchbox-keyboard/matchbox-keyboard-inputmethod_svn.bb
> @@ -4,6 +4,7 @@ DEPENDS =3D "libfakekey expat libxft gtk+ matchbox-panel-=
2"
> =A0RCONFLICTS_${PN} =3D "matchbox-keyboard"
> =A0RPROVIDES_${PN} =3D "matchbox-keyboard"
> =A0SECTION =3D "x11"
> +SRCREV =3D "1910"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r11"
>
> diff --git a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb b/recipes=
/matchbox-keyboard/matchbox-keyboard_svn.bb
> index 27d87b7..dd820e6 100644
> --- a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
> +++ b/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
> @@ -4,6 +4,7 @@ DEPENDS =3D "libfakekey expat libxft"
> =A0RCONFLICTS =3D matchbox-keyboard-inputmethod
> =A0RPROVIDES_${PN} =3D matchbox-keyboard-inputmethod
> =A0SECTION =3D "x11"
> +SRCREV =3D "1910"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D"r7"
>
> diff --git a/recipes/matchbox-stroke/matchbox-stroke_svn.bb b/recipes/mat=
chbox-stroke/matchbox-stroke_svn.bb
> index 4c1d201..2afe1ca 100644
> --- a/recipes/matchbox-stroke/matchbox-stroke_svn.bb
> +++ b/recipes/matchbox-stroke/matchbox-stroke_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Matchbox keyboard"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "libfakekey expat libxft"
> =A0SECTION =3D "x11/wm"
> +SRCREV =3D "1820"
> =A0PV =3D "0.0+svnr${SRCPV}"
>
> =A0PR =3D"r2"
> diff --git a/recipes/matchbox-terminal/matchbox-terminal_svn.bb b/recipes=
/matchbox-terminal/matchbox-terminal_svn.bb
> index e6263ec..3ca6d13 100644
> --- a/recipes/matchbox-terminal/matchbox-terminal_svn.bb
> +++ b/recipes/matchbox-terminal/matchbox-terminal_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Matchbox Terminal"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "gtk+ vte"
> =A0SECTION =3D "x11/utils"
> +SRCREV =3D "1612"
> =A0PV =3D "0.0+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/matchbox/trunk;module=3D${PN};=
proto=3Dhttp"
> diff --git a/recipes/matchbox2/matchbox-desktop-2_svn.bb b/recipes/matchb=
ox2/matchbox-desktop-2_svn.bb
> index 5c3a468..0a50bac 100644
> --- a/recipes/matchbox2/matchbox-desktop-2_svn.bb
> +++ b/recipes/matchbox2/matchbox-desktop-2_svn.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "GPL"
> =A0SECTION =3D "x11/panels"
> =A0DEPENDS =3D "gtk+ startup-notification"
> =A0RDEPENDS =3D "matchbox-common"
> +SRCREV =3D "2096"
> =A0PV =3D "2.0+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb b/re=
cipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
> index 0dc89e6..bcd7706 100644
> --- a/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
> +++ b/recipes/matchbox2/matchbox-panel-2-icon-themes_0.0.1.bb
> @@ -5,6 +5,7 @@ DEPENDS =3D "imagemagick-native"
> =A0RPROVIDES_${PN} =3D "matchbox-panel-2-icon-theme"
> =A0PACKAGE_ARCH =3D "all"
> =A0SRCREV_FORMAT =3D "startup"
> +SRCREV =3D "1907"
> =A0PV =3D "0.0.1+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/matchbox2/matchbox-panel-2_svn.bb b/recipes/matchbox=
2/matchbox-panel-2_svn.bb
> index ae3b122..eff83f7 100644
> --- a/recipes/matchbox2/matchbox-panel-2_svn.bb
> +++ b/recipes/matchbox2/matchbox-panel-2_svn.bb
> @@ -6,6 +6,7 @@ DEPENDS +=3D " ${@base_contains("MACHINE_FEATURES", "acpi=
", "libacpi", "",d)}"
> =A0DEPENDS +=3D " ${@base_contains("MACHINE_FEATURES", "apm", "apmd", "",=
d)}"
> =A0RDEPENDS_${PN} =3D "matchbox-panel-2-icon-theme"
> =A0PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> +SRCREV =3D "2098"
> =A0PV =3D "2.0+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/matchbox2/matchbox-wm-2_svn.bb b/recipes/matchbox2/m=
atchbox-wm-2_svn.bb
> index b716cf2..a31f121 100644
> --- a/recipes/matchbox2/matchbox-wm-2_svn.bb
> +++ b/recipes/matchbox2/matchbox-wm-2_svn.bb
> @@ -1,4 +1,5 @@
> =A0DEPENDS =3D "gtk+ startup-notification dbus dbus-glib"
> +SRCREV =3D "2087"
> =A0PV =3D "0.1.0+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/mplayer/mplayer-maemo_svn.bb b/recipes/mplayer/mplay=
er-maemo_svn.bb
> index af0e7a5..c85d711 100644
> --- a/recipes/mplayer/mplayer-maemo_svn.bb
> +++ b/recipes/mplayer/mplayer-maemo_svn.bb
> @@ -6,6 +6,7 @@ DEPENDS =3D "virtual/libsdl xsp libmad zlib libpng jpeg l=
iba52 freetype fontconfig
>
> =A0DEFAULT_PREFERENCE_avr32 =3D "-1"
>
> +SRCREV =3D "6952"
> =A0PV =3D "0.0+1.0rc1+svnr${SRCPV}"
> =A0PE =3D "1"
>
> diff --git a/recipes/multitap-pad/multitap-pad_svn.bb b/recipes/multitap-=
pad/multitap-pad_svn.bb
> index fcc7249..efa7f04 100644
> --- a/recipes/multitap-pad/multitap-pad_svn.bb
> +++ b/recipes/multitap-pad/multitap-pad_svn.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "GPL"
> =A0DEPENDS =3D "libfakekey gtk+ matchbox-panel-2"
> =A0RCONFLICTS =3D matchbox-keyboard-inputmethod
> =A0SECTION =3D "x11"
> +SRCREV =3D "373"
> =A0PV =3D "0.0+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://svn.o-hand.com/repos/misc/trunk;module=3D${PN};prot=
o=3Dhttp \
> diff --git a/recipes/net-snmp/libsnmp-perl_svn.bb b/recipes/net-snmp/libs=
nmp-perl_svn.bb
> index 5355f1d..4d828c8 100644
> --- a/recipes/net-snmp/libsnmp-perl_svn.bb
> +++ b/recipes/net-snmp/libsnmp-perl_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Perl module from net-snmp"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "BSD"
> =A0DEPENDS =3D "net-snmp"
> +SRCREV =3D "17367"
> =A0PR =3D "r2"
>
> =A0SRC_URI =3D "svn://net-snmp.svn.sourceforge.net/svnroot/net-snmp/trunk=
;module=3Dnet-snmp;proto=3Dhttps"
> diff --git a/recipes/net-snmp/net-snmp_svn.bb b/recipes/net-snmp/net-snmp=
_svn.bb
> index 0d27d06..689a416 100644
> --- a/recipes/net-snmp/net-snmp_svn.bb
> +++ b/recipes/net-snmp/net-snmp_svn.bb
> @@ -1,5 +1,6 @@
> =A0require net-snmp.inc
> =A0DEPENDS +=3D "libtool libtool-native libtool-cross"
> +SRCREV =3D "17367"
> =A0PR =3D "${INC_PR}.0"
>
> =A0S =3D "${WORKDIR}/net-snmp"
> diff --git a/recipes/netsurf/netsurf_svn.bb b/recipes/netsurf/netsurf_svn=
.bb
> index c08c879..33c5d4e 100644
> --- a/recipes/netsurf/netsurf_svn.bb
> +++ b/recipes/netsurf/netsurf_svn.bb
> @@ -3,6 +3,7 @@ web standards in use today."
> =A0HOMEPAGE =3D "http://www.netsurf-browser.org/"
> =A0SECTION =3D "x11/network"
> =A0LICENSE =3D "GPLv2"
> +SRCREV =3D "3859"
> =A0PV =3D "1.1+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/openocd/openocd_svn.bb b/recipes/openocd/openocd_svn=
.bb
> index 11f5e77..763665b 100644
> --- a/recipes/openocd/openocd_svn.bb
> +++ b/recipes/openocd/openocd_svn.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "Free and Open On-Chip Debugging, In-System Programmin=
g and Boundary-Scan Testing"
> =A0HOMEPAGE =3D "http://openocd.berlios.de/"
> =A0LICENSE =3D "GPL"
> +SRCREV =3D "517"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r3"
>
> diff --git a/recipes/opkg-utils/opkg-utils-native_svn.bb b/recipes/opkg-u=
tils/opkg-utils-native_svn.bb
> index 0495b1e..49b8e98 100644
> --- a/recipes/opkg-utils/opkg-utils-native_svn.bb
> +++ b/recipes/opkg-utils/opkg-utils-native_svn.bb
> @@ -1,4 +1,5 @@
> =A0require opkg-utils_svn.bb
> +SRCREV =3D "4595"
>
> =A0RDEPENDS =3D ""
>
> diff --git a/recipes/opkg-utils/opkg-utils_svn.bb b/recipes/opkg-utils/op=
kg-utils_svn.bb
> index 4c3c090..d049bb7 100644
> --- a/recipes/opkg-utils/opkg-utils_svn.bb
> +++ b/recipes/opkg-utils/opkg-utils_svn.bb
> @@ -3,6 +3,7 @@ SECTION =3D "base"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0RDEPENDS =3D "python"
> +SRCREV =3D "4578"
> =A0PR =3D "r2"
>
> =A0SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host/;module=3Dopkg-util=
s;proto=3Dhttp"
> diff --git a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb b/recipes/opkg/=
opkg-nogpg-nocurl-slugos_svn.bb
> index 5491a28..253bded 100644
> --- a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
> +++ b/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
> @@ -26,8 +26,6 @@ SRC_URI +=3D " \
> =A0 =A0 =A0 =A0 =A0 "
> =A0PR =3D "${INC_PR}"
>
> -SRCREV =3D "${SRCREV_pn-opkg}"
> -
> =A0EXTRA_OECONF +=3D "--disable-gpg --enable-static --disable-shared"
>
> =A0# Not sure this is needed; needs to be investigated and removed if not
> diff --git a/recipes/opkg/opkg-nogpg-nocurl_svn.bb b/recipes/opkg/opkg-no=
gpg-nocurl_svn.bb
> index cd8751a..66e8dbc 100644
> --- a/recipes/opkg/opkg-nogpg-nocurl_svn.bb
> +++ b/recipes/opkg/opkg-nogpg-nocurl_svn.bb
> @@ -5,8 +5,6 @@ PROVIDES +=3D "opkg"
>
> =A0PR =3D "${INC_PR}"
>
> -SRCREV =3D "${SRCREV_pn-opkg}"
> -
> =A0EXTRA_OECONF +=3D " --disable-curl --enable-static --disable-shared"
>
> =A0# The nogpg version isn't getting much love and has an unused variable=
 which trips up -Werror
> diff --git a/recipes/opkg/opkg-nogpg_svn.bb b/recipes/opkg/opkg-nogpg_svn=
.bb
> index 33d9987..bee639f 100644
> --- a/recipes/opkg/opkg-nogpg_svn.bb
> +++ b/recipes/opkg/opkg-nogpg_svn.bb
> @@ -5,8 +5,6 @@ PROVIDES +=3D "opkg"
>
> =A0PR =3D "${INC_PR}.1"
>
> -SRCREV =3D "${SRCREV_pn-opkg}"
> -
> =A0EXTRA_OECONF +=3D " --disable-gpg \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-openssl \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-ssl-curl \
> diff --git a/recipes/opkg/opkg.inc b/recipes/opkg/opkg.inc
> index 9a3d3dc..7865f1a 100644
> --- a/recipes/opkg/opkg.inc
> +++ b/recipes/opkg/opkg.inc
> @@ -3,6 +3,7 @@ DESCRIPTION_libopkg =3D "Opkg Package Manager Library"
> =A0SECTION =3D "base"
> =A0LICENSE =3D "GPLv2"
> =A0DEPENDS =3D "curl gpgme openssl"
> +SRCREV =3D ${OPKG_SRCREV}
> =A0PV =3D "0.1.6+svnr${SRCPV}"
> =A0INC_PR =3D "r21"
>
> diff --git a/recipes/oprofile/oprofileui-svn.inc b/recipes/oprofile/oprof=
ileui-svn.inc
> index c274643..c6e5967 100644
> --- a/recipes/oprofile/oprofileui-svn.inc
> +++ b/recipes/oprofile/oprofileui-svn.inc
> @@ -1,5 +1,6 @@
> =A0require oprofileui.inc
>
> +SRCREV =3D "173"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/portaudio/portaudio-v19_svn.bb b/recipes/portaudio/p=
ortaudio-v19_svn.bb
> index 5e3097d..fb715b4 100644
> --- a/recipes/portaudio/portaudio-v19_svn.bb
> +++ b/recipes/portaudio/portaudio-v19_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "A portable audio library"
> =A0SECTION =3D "libs/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> +SRCREV =3D "1387"
> =A0PV =3D "v19+svnr${SRCPV}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/psplash/psplash.inc b/recipes/psplash/psplash.inc
> index f2be0b3..7319b96 100644
> --- a/recipes/psplash/psplash.inc
> +++ b/recipes/psplash/psplash.inc
> @@ -7,6 +7,7 @@ PROVIDES =3D "virtual/psplash"
> =A0RPROVIDES_${PN} =3D "virtual-psplash"
> =A0RCONFLICTS_${PN} =3D "exquisite"
>
> +SRCREV =3D "249"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r23"
>
> diff --git a/recipes/puzzles/oh-puzzles_svn.bb b/recipes/puzzles/oh-puzzl=
es_svn.bb
> index f5796e4..42079e7 100644
> --- a/recipes/puzzles/oh-puzzles_svn.bb
> +++ b/recipes/puzzles/oh-puzzles_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Portable Puzzle Collection"
> =A0LICENSE =3D "MIT"
> =A0SECTION =3D "x11"
> =A0DEPENDS =3D "gtk+ gconf intltool-native librsvg libowl"
> +SRCREV =3D "22"
> =A0PV =3D "0.1+svnr${SRCPV}"
> =A0PR =3D "r5"
>
> diff --git a/recipes/pythm/pythm_svn.bb b/recipes/pythm/pythm_svn.bb
> index fdffb21..556ea33 100644
> --- a/recipes/pythm/pythm_svn.bb
> +++ b/recipes/pythm/pythm_svn.bb
> @@ -4,6 +4,7 @@ HOMEPAGE =3D "http://projects.openmoko.org/projects/pythm=
/"
> =A0SECTION =3D "application/multimedia"
> =A0LICENSE =3D "GPLv2"
> =A0SRCNAME =3D "pythm"
> +SRCREV =3D "19"
> =A0PV =3D "0.5.1+svnr${SRCPV}"
> =A0PR =3D "r3"
> =A0SRC_URI =3D "svn://svn.projects.openmoko.org/svnroot/;module=3Dpythm \
> diff --git a/recipes/python/python-coherence_svn.bb b/recipes/python/pyth=
on-coherence_svn.bb
> index 46e6e3e..59a38f3 100644
> --- a/recipes/python/python-coherence_svn.bb
> +++ b/recipes/python/python-coherence_svn.bb
> @@ -3,6 +3,7 @@ SECTION =3D "devel/python"
> =A0LICENSE =3D "MIT"
> =A0HOMEPAGE =3D "http://coherence.beebits.net/wiki"
>
> +SRCREV =3D "1161"
> =A0PR =3D "r1"
>
> =A0PV =3D "0.6.0+svnr${SRCPV}"
> diff --git a/recipes/python/python-connexion_svn.bb b/recipes/python/pyth=
on-connexion_svn.bb
> index 8136fe4..801b2fe 100644
> --- a/recipes/python/python-connexion_svn.bb
> +++ b/recipes/python/python-connexion_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "A versatile network connection library"
> =A0HOMEPAGE =3D "http://www.radlinux.org/connexion/"
> =A0SECTION =3D "devel/python"
> =A0LICENSE =3D "GPL"
> +SRCREV =3D "1439"
> =A0BV =3D "0.4.6"
> =A0PV =3D "${BV}+svnr${SRCPV}"
> =A0PR =3D "ml1"
> diff --git a/recipes/python/python-pyyaml_svn.bb b/recipes/python/python-=
pyyaml_svn.bb
> index 117eb9b..512dd38 100644
> --- a/recipes/python/python-pyyaml_svn.bb
> +++ b/recipes/python/python-pyyaml_svn.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "http://www.pyyaml.org"
> =A0SECTION =3D "devel/python"
> =A0LICENSE =3D "MIT"
> =A0DEPENDS =3D "libyaml python-cython-native"
> +SRCREV =3D "344"
> =A0PV =3D "3.08+svnr${SRCPV}"
> =A0PR =3D "ml0"
>
> diff --git a/recipes/settings-daemon/settings-daemon_svn.bb b/recipes/set=
tings-daemon/settings-daemon_svn.bb
> index de92053..0b94830 100644
> --- a/recipes/settings-daemon/settings-daemon_svn.bb
> +++ b/recipes/settings-daemon/settings-daemon_svn.bb
> @@ -3,6 +3,7 @@ LICENSE =3D "GPL"
> =A0DEPENDS =3D "gconf glib-2.0 gtk+"
> =A0RDEPENDS =3D "xrdb"
> =A0SECTION =3D "x11"
> +SRCREV =3D "2006"
> =A0PV =3D "0.0+svnr${SRCPV}"
>
> =A0PR =3D "r2"
> diff --git a/recipes/socketcan/socketcan-modules_svn.bb b/recipes/socketc=
an/socketcan-modules_svn.bb
> index b24f456..e19f7bb 100644
> --- a/recipes/socketcan/socketcan-modules_svn.bb
> +++ b/recipes/socketcan/socketcan-modules_svn.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "http://developer.berlios.de/projects/socket=
can/"
> =A0SECTION =3D "kernel/modules"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "virtual/kernel"
> +SRCREV =3D "917"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/socketcan/socketcan-utils-test_svn.bb b/recipes/sock=
etcan/socketcan-utils-test_svn.bb
> index 4a3d52d..ca4c23a 100644
> --- a/recipes/socketcan/socketcan-utils-test_svn.bb
> +++ b/recipes/socketcan/socketcan-utils-test_svn.bb
> @@ -3,6 +3,7 @@ HOMEPAGE =3D "http://developer.berlios.de/projects/socket=
can/"
> =A0SECTION =3D "console/utils"
> =A0LICENSE =3D "GPL"
>
> +SRCREV =3D "917"
> =A0PV =3D "0.0+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://svn.berlios.de/socketcan;module=3Dtrunk;proto=3Dsvn=
 \
> diff --git a/recipes/sphyrna/sphyrna-python_svn.bb b/recipes/sphyrna/sphy=
rna-python_svn.bb
> index 5b4ee8a..348f1b1 100644
> --- a/recipes/sphyrna/sphyrna-python_svn.bb
> +++ b/recipes/sphyrna/sphyrna-python_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Sphyrna - Hammerhead Reverse Engineering=
"
> =A0HOMEPAGE =3D "http://projects.linuxtogo.org/projects/sphyrna"
> =A0LICENSE =3D "GPLv2"
> =A0DEPENDS =3D "readline python-native"
> +SRCREV =3D "45"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/tinymail/tmut_svn.bb b/recipes/tinymail/tmut_svn.bb
> index 2eb7b8d..7f7a61b 100644
> --- a/recipes/tinymail/tmut_svn.bb
> +++ b/recipes/tinymail/tmut_svn.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Tmut is a really small E-Mail client bas=
ed on Tinymail"
> =A0SECTION =3D "x11/utils"
> =A0LICENSE =3D "LGPL"
> =A0DEPENDS =3D "gtk+ glib-2.0 gnome-vfs gconf libtinymail"
> +SRCREV =3D "60"
> =A0PV =3D "0.0.0+svnr${SRCPV}"
> =A0PR =3D "r3"
>
> diff --git a/recipes/tslib/tslib_svn.bb b/recipes/tslib/tslib_svn.bb
> index 77127c7..5b1d32b 100644
> --- a/recipes/tslib/tslib_svn.bb
> +++ b/recipes/tslib/tslib_svn.bb
> @@ -1,5 +1,6 @@
> =A0SRC_URI =3D "svn://svn.berlios.de/tslib/trunk;module=3Dtslib"
> =A0S =3D "${WORKDIR}/tslib"
> +SRCREV =3D "77"
> =A0PV =3D "1.0+svnr${SRCPV}"
> =A0PR =3D "${INC_PR}.1"
>
> diff --git a/recipes/u-boot/u-boot-bug_svn.bb b/recipes/u-boot/u-boot-bug=
_svn.bb
> index 485cfd8..dffeea1 100644
> --- a/recipes/u-boot/u-boot-bug_svn.bb
> +++ b/recipes/u-boot/u-boot-bug_svn.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPL"
> =A0SECTION =3D "bootloader"
> =A0PRIORITY =3D "optional"
> =A0PV =3D "1.3.2+svnr${SRCPV}"
> -SRCREV =3D "${AUTOREV}"
> +SRCREV =3D "8674"
> =A0PR =3D "r6"
>
> =A0SRC_URI =3D "\
> diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-ucli=
bc_svn.bb
> index 80efd26..e8cb63e 100644
> --- a/recipes/uclibc/bfin-uclibc_svn.bb
> +++ b/recipes/uclibc/bfin-uclibc_svn.bb
> @@ -11,6 +11,7 @@ PV =3D "${UCLIBC_BASE}+svnr${SRCPV}"
>
> =A0require uclibc.inc
> =A0PR =3D "${INC_PR}.0"
> +SRCREV =3D "1857"
> =A0PROVIDES_append_bfin =3D " virtual/${TARGET_PREFIX}libc-for-gcc "
>
> =A0#recent versions uclibc require real kernel headers
> diff --git a/recipes/uclibc/elf2flt_svn.bb b/recipes/uclibc/elf2flt_svn.b=
b
> index e16da36..9f8ceb4 100644
> --- a/recipes/uclibc/elf2flt_svn.bb
> +++ b/recipes/uclibc/elf2flt_svn.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "Elf2flt is a wrapper around the linker for uclinux pl=
atforms"
> =A0DEPENDS =3D "binutils-cross"
>
> +SRCREV =3D "1786"
> =A0PV =3D "0.0+svnr${SRCPV}"
>
> =A0inherit autotools cross
> diff --git a/recipes/usbpath/usbpath_svn.bb b/recipes/usbpath/usbpath_svn=
.bb
> index 16e7b0e..1cedf33 100644
> --- a/recipes/usbpath/usbpath_svn.bb
> +++ b/recipes/usbpath/usbpath_svn.bb
> @@ -4,6 +4,7 @@ SECTION =3D "console/utils"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "virtual/libusb0"
>
> +SRCREV =3D "3172"
> =A0PV =3D "0.0+svnr${SRCPV}"
>
> =A0SRC_URI =3D "svn://svn.openmoko.org/trunk/src/host;module=3Dusbpath;pr=
oto=3Dhttp"
> diff --git a/recipes/wlan-ng/wlan-ng-modules_svn.bb b/recipes/wlan-ng/wla=
n-ng-modules_svn.bb
> index f62ab37..2e8892b 100644
> --- a/recipes/wlan-ng/wlan-ng-modules_svn.bb
> +++ b/recipes/wlan-ng/wlan-ng-modules_svn.bb
> @@ -1,5 +1,6 @@
> =A0require wlan-ng-modules.inc
>
> +SRCREV =3D "1859"
> =A0PR =3D "r0"
>
> =A0PV =3D "0.2.8+svnr${SRCPV}"
> diff --git a/recipes/wlan-ng/wlan-ng-utils_svn.bb b/recipes/wlan-ng/wlan-=
ng-utils_svn.bb
> index bc02eb7..059dc0e 100644
> --- a/recipes/wlan-ng/wlan-ng-utils_svn.bb
> +++ b/recipes/wlan-ng/wlan-ng-utils_svn.bb
> @@ -1,5 +1,6 @@
> =A0require wlan-ng-utils.inc
>
> +SRCREV =3D "1859"
> =A0PR =3D "r0"
>
> =A0PV =3D "0.2.8+svnr${SRCPV}"
> diff --git a/recipes/xoo/xoo_svn.bb b/recipes/xoo/xoo_svn.bb
> index efceab4..351a82c 100644
> --- a/recipes/xoo/xoo_svn.bb
> +++ b/recipes/xoo/xoo_svn.bb
> @@ -4,6 +4,7 @@ It is intended for embedded developers that want to simul=
ate a target device \
> =A0HOMEPAGE =3D "http://projects.o-hand.com/xoo"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "virtual/libx11 libxtst gtk+ libglade expat"
> +SRCREV =3D "1971"
> =A0PV =3D "0.7+svnr${SRCPV}"
> =A0PR =3D "r1"
>
> --
> 1.7.0.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


