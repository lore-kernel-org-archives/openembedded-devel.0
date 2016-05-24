Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0C56057A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 20:47:58 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id n129so149855455wmn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 May 2016 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=WrMWWjxSayhCOizs7PSNHEYS4jXcjnV2utsI8Nwvmxs=;
	b=XPgAiOkxIrUKtPmxPySmpJVuHrsjxW+mQCRv+N1Djtj3kH1hjU3sCWa7AaMVnqtejZ
	nbWLPRKpm9mkEJIEIOGmFwq/pM7NTMK4Nuri81ix/qz8gYgzt4JWv2+vBZX/PiMwbiJD
	3bOGpUH6WVUG4Zr2s6rLEAIfP315Pk2M1sT3qmLEf9DEddzTlJkojN6eApNUQDM/iNiV
	csxZIJdm5g3CwJseQZRF5P1Y+LNNh7GuWnRhDiCm73eybUopbydJG7h7sgvtY9acFBLt
	Ox+hKRhybOml9uy1tMsX0y6LljjzV21WGTyZOhw/LroqyYHG2pczs2iDXSr3zAsC1KtD
	Mjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=WrMWWjxSayhCOizs7PSNHEYS4jXcjnV2utsI8Nwvmxs=;
	b=OB+beTL4eTGgA9beURkZGM/e5K3jzTVcUCnuQPOQWnru7hY7D9QthWMCqUrpBwlXB4
	6nzydC67VpEDLrcxgFJfEU0eERVndC93QoQCBsL+vUbQWq/ywimDXbWFU+DvhKZ/4cr+
	N7h0zDfK92x2kbpc+3ZqS7MrBL27FZkCQqTJmkGHk+LarVKfROgKvUWQfdpQbTkJAUqw
	3a+GwWk1ZUXhbBDBLYoBwMcBY9kTNc5b+yXSsiiUxhLomCsvR5K/riV1yDUtGtFXP+en
	SV4jfmhVJcRKGzVIfHPYg9XdtkYNwn3yXHFcSigfaUi5doIlp0p0BqHXOKJh+i0FjMAc
	Kxqw==
X-Gm-Message-State: AOPr4FXUvC4PhIewFzoM2NQHwIO9N64sHKVRPd9iw/tOqK+jKusqbZw7hY+sQ11TaRsf7D+pdfOyFNPb959WJA==
MIME-Version: 1.0
X-Received: by 10.28.29.147 with SMTP id d141mr25176302wmd.91.1464122879155;
	Tue, 24 May 2016 13:47:59 -0700 (PDT)
Received: by 10.194.30.229 with HTTP; Tue, 24 May 2016 13:47:59 -0700 (PDT)
In-Reply-To: <cover.1463601459.git.akuster808@gmail.com>
References: <cover.1463601459.git.akuster808@gmail.com>
Date: Tue, 24 May 2016 22:47:59 +0200
Message-ID: <CA+chaQcoZwD+L33zozQpVR6Z+OFhy-hyaVKQ38_aEUvrn8852A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "akuster@mvista" <akuster@mvista.com>
Subject: Re: [PATCH 00/38] Krogoth-next pull request
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
X-List-Received-Date: Tue, 24 May 2016 20:48:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2016 at 10:04 PM, Armin Kuster <akuster808@gmail.com> wrote=
:

> Please consider these changes for meta-openembedded krogot-next
>
> The following changes since commit
> 2092396f0e4fd3891b398c7180528aba67e1d522:
>
>   ntp: Security fixes via update to 4.2.8p7 (2016-05-02 14:04:13 -0700)
>
> are available in the git repository at:
>
>   git://github.com/akuster/meta-openembedded akuster/krogoth-next
>   https://github.com/akuster/meta-openembedded/tree/akuster/krogoth-next
>
> Andreas M=C3=BCller (3):
>   meta-xfce: add intltool-native to DEPENDS
>   xfce-polkit: fix warning not able to copy license
>   fluidsynth: set correct portaudio packageconfig dependency
>
> Ann Thornton (2):
>   packagegroup-tools-bluetooth.bb: Selects the tools appropriate for the
>     version of bluez being used.
>   packagegroup-tools-bluetooth: Selects the tools appropriate for the
>     version of bluez being used.
>
> Armin Kuster (4):
>   acpitests: Fix license issue
>   libwnck: fix WARNING
>   upower: fix WARNING
>   wireshark: Fix new QA Error
>
> Catalin Enache (2):
>   proftpd: CVE-2016-3125
>   squid: CVE-2016-3947
>
> Christopher Larson (2):
>   fbida: use separate builddir
>   sox: dep on ffmpeg, not libav
>
> Derek Straka (2):
>   python-pyparsing: modify build to correctly use setuptools rather than
>     distutils
>   leptonica: add PACAKGECONFIG for openjpeg
>

This breaks the build, because without leptonica upgrade (which is only in
master) the option is unrecognized:

configure: WARNING: unrecognized options: --without-libopenjpeg


>
> Herrie (1):
>   pidgin: Update to 2.10.12
>
> Ioan-Adrian Ratiu (2):
>   openconnect: add missing dependencies
>   syslog-ng.inc: fix prerm script & class includes
>
> Kinsella, Ray (1):
>   wvstreams: fixing segfault with new gcc optimizations
>
> Li xin (1):
>   rp-pppoe: Fix rootfs creation errors
>
> Martin Jansa (5):
>   sblim-sfcb: add missing dependency on unzip-native
>   pidgin: add PACKAGECONFIGs
>   pidgin: use pkg-config instead of hardcoded paths or python-config
>   llvm3.3: Disable auto -dbg packages
>   poppler: add --std=3Dc++11 to fix build with Qt 5.7
>
> Neena Busireddy (1):
>   glmark2: wl_surface should be destoryed after destroying wl_window
>
> Noor Ahsan (1):
>   libnice, farsight2: unblacklist as libnice's nice.pc issue fixed.
>
> Otavio Salvador (1):
>   opencv: Fix metapkg dependencies for opencv-java and opencv-locales
>
> Paul Barker (1):
>   toybox: Remove out-of-date patch
>
> Paul Gortmaker (2):
>   autotools-bootstrap: make bootstrap package specific.
>   netcf: fix mishandling of gnulib submodule causing build fail
>
> Qi.Chen@windriver.com (4):
>   dovecot: fix QA issue and remove from blacklist
>   rrdtool: fix do_configure failure on some hosts
>   curlpp: fix recipe
>   znc: fix QA issue and remove from blacklist
>
> Robert Yang (1):
>   nbd: fix LIC_FILES_CHKSUM
>
> Roy Li (1):
>   lmbench: avoid gcc optimize-away multiplication
>
> Zhu Yanjun (1):
>   net-snmp: enable ipv6 support
>
>  meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb |   2 +-
>  .../fluidsynth/fluidsynth_1.1.6.bb                 |   2 +-
>  .../recipes-multimedia/sox/sox_14.4.0.bb           |   2 +-
>  .../openconnect/openconnect_git.bb                 |   2 +-
>  .../proftpd/files/CVE-2016-3125.patch              | 247 +++++++++++++
>  .../recipes-daemons/proftpd/proftpd_1.3.5a.bb      |   1 +
>  .../squid/files/CVE-2016-3947.patch                |  48 +++
>  .../recipes-daemons/squid/squid_3.5.7.bb           |   1 +
>  meta-networking/recipes-irc/znc/znc_git.bb         |   5 +-
>  .../recipes-protocols/net-snmp/net-snmp_5.7.3.bb   |   3 +
>  .../recipes-protocols/rp-pppoe/rp-pppoe_3.12.bb    |   4 +
>  .../recipes-support/curlpp/curlpp_0.7.3.bb         |  60 ----
>  .../recipes-support/dovecot/dovecot_2.2.21.bb      |   8 +-
>  meta-networking/recipes-support/nbd/nbd_3.11.bb    |   2 +-
>  meta-networking/recipes-support/netcf/netcf_git.bb |  21 +-
>  .../recipes-support/wireshark/wireshark_2.0.2.bb   |   5 +-
>  meta-oe/classes/autotools-bootstrap.bbclass        |  24 --
>  meta-oe/licenses/Intel                             |  21 ++
>  ...ace-should-be-destoryed-after-the-wl_wind.patch |  34 ++
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |   3 +-
>  .../0001-avoid-gcc-optimize-away-the-loops.patch   |  79 +++++
>  .../recipes-benchmark/lmbench/lmbench_3.0-a9.bb    |   1 +
>  .../packagegroups/packagegroup-tools-bluetooth.bb  |  37 ++
>  .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb |   2 +
>  meta-oe/recipes-core/llvm/llvm.inc                 |   3 +-
>  .../toybox/0001-Match-paths-with-busybox.patch     | 388
> ---------------------
>  meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb  |   2 +
>  .../sblim-sfcb/sblim-sfcb_1.4.9.bb                 |   2 +-
>  meta-oe/recipes-graphics/fbida/fbida_2.10.bb       |   5 +-
>  .../fontforge/fontforge_20150824.bb                |  18 +-
>  .../recipes-graphics/leptonica/leptonica_1.70.bb   |   3 +
>  .../recipes-support/farsight/farsight2_0.0.22.bb   |   2 -
>  meta-oe/recipes-support/farsight/libnice_0.0.13.bb |   4 +-
>  meta-oe/recipes-support/opencv/opencv_3.1.bb       |   5 +-
>  .../pidgin/pidgin/pidgin-cross-python-265.patch    |  50 ++-
>  .../pidgin/pidgin/pidgin.desktop-set-icon.patch    |  11 -
>  .../pidgin/{pidgin_2.10.9.bb =3D> pidgin_2.10.12.bb} |  41 ++-
>  ...h-C-11-compilers-that-don-t-define-isinfi.patch |  39 +++
>  meta-oe/recipes-support/poppler/poppler_0.41.0.bb  |   4 +
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   2 +-
>  meta-oe/recipes-support/upower/upower_0.9.14.bb    |   2 +-
>  .../python/python-pyparsing_2.1.1.bb               |   2 +-
>  meta-xfce/classes/xfce.bbclass                     |   2 +
>  .../recipes-apps/xfce-polkit/xfce-polkit_0.2.bb    |   2 +-
>  .../xfce4-taskmanager/xfce4-taskmanager_1.1.0.bb   |   2 +-
>  .../recipes-multimedia/parole/parole_0.8.1.bb      |   2 +-
>  .../notes/xfce4-notes-plugin_1.8.1.bb              |   2 +-
>  .../xfce4-power-manager_1.4.4.bb                   |   2 +-
>  48 files changed, 661 insertions(+), 548 deletions(-)
>  create mode 100644
> meta-networking/recipes-daemons/proftpd/files/CVE-2016-3125.patch
>  create mode 100644
> meta-networking/recipes-daemons/squid/files/CVE-2016-3947.patch
>  delete mode 100644 meta-oe/classes/autotools-bootstrap.bbclass
>  create mode 100644 meta-oe/licenses/Intel
>  create mode 100644
> meta-oe/recipes-benchmark/glmark2/files/0001-Fix-wl_surface-should-be-des=
toryed-after-the-wl_wind.patch
>  create mode 100644
> meta-oe/recipes-benchmark/lmbench/lmbench/0001-avoid-gcc-optimize-away-th=
e-loops.patch
>  create mode 100644 meta-oe/recipes-connectivity/packagegroups/
> packagegroup-tools-bluetooth.bb
>  delete mode 100644
> meta-oe/recipes-core/toybox/toybox/0001-Match-paths-with-busybox.patch
>  delete mode 100644
> meta-oe/recipes-support/pidgin/pidgin/pidgin.desktop-set-icon.patch
>  rename meta-oe/recipes-support/pidgin/{pidgin_2.10.9.bb =3D>
> pidgin_2.10.12.bb} (67%)
>  create mode 100644
> meta-oe/recipes-support/poppler/poppler/0001-Compile-with-C-11-compilers-=
that-don-t-define-isinfi.patch
>
> --
> 2.3.5
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

