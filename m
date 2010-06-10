Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OMj7n-0001K1-A0
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 16:52:59 +0200
Received: by iwn39 with SMTP id 39so17202iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 07:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=W1N2i/pFWaMPHsYwq2BOv5OIE79U+Crd1QjGupzgm2E=;
	b=kd5tBkpPUgcbSbndgldLnJLE22TU/QgsPLvH0LFLQ04KtpkYMpoEt64Gv8oWWwRQ+b
	DB/WCqq53O66GyGVvo2+8DGxfuvB+f7NI9zcvxx+nyoaS6xH64N3VyYB9eDahNRA+Z32
	S+hLZSfBF5LGxl8ZpJ7crVB95uUi+dkIgQOvc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=v8QE13LL5QI/gWyOMSCifFa6eKq3vNNMGtoyvJQuPsnYtcIHzDz8JpApeVNVRYBuq/
	dZ6yN1clvt348uJu0iOnWOC4kdvMpsz4/LIYRET9gV6O/KEj3RD75pzhTNSsXKvCTqpT
	N7cZdSzMTtIyrvd82CTxMO3dKb07S8vUsEaUY=
Received: by 10.231.168.200 with SMTP id v8mr284163iby.33.1276181313309; Thu, 
	10 Jun 2010 07:48:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.19.76 with HTTP; Thu, 10 Jun 2010 07:48:12 -0700 (PDT)
In-Reply-To: <1276178833-30841-1-git-send-email-Martin.Jansa@gmail.com>
References: <1276178833-30841-1-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Jun 2010 07:48:12 -0700
Message-ID: <AANLkTimJjLx-HohwQVjiUxu99CDmIP2WGsRyv6eeCPA4@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS,
	URI_NOVOWEL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: conform to OE packaging guidelines with RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES
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
X-List-Received-Date: Thu, 10 Jun 2010 14:52:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 10, 2010 at 7:07 AM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * even worse than last RDEPENDS/RRECOMMENDS change, because now ie:
> =A0opkg info coreutils-doc
> =A0Provides: textutils, shellutils, fileutils
> =A0Replaces: textutils, shellutils, fileutils
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =A0recipes/abiword/abiword-embedded_2.4.6.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 ++--
> =A0recipes/abiword/abiword-embedded_2.5.2.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 ++--
> =A0recipes/abiword/abiword-embedded_2.6.4.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 ++--
> =A0recipes/abiword/abiword-embedded_2.6.8.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 ++--
> =A0recipes/abiword/abiword_2.4.6.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/abiword/abiword_2.5.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/abiword/abiword_2.5.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/abiword/abiword_2.6.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/abiword/abiword_2.6.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/abiword/abiword_2.6.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/abiword/abiword_2.6.8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/abiword/abiword_2.8.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/angstrom/epiphany-firefox-replacement.bb =A0 | =A0 =A02 +-
> =A0recipes/at/at_3.1.8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 | =A0 =A04 ++--
> =A0recipes/atd/atd_0.70.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A04 ++--
> =A0recipes/atd/atd_0.80.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A04 ++--
> =A0recipes/bluez/bluez-utils.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/bluez/bluez-utils3.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
> =A0recipes/bluez/bluez.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/boa/boa_0.94.13.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +-
> =A0recipes/cairo/cairo-directfb_1.4.8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A04 ++--
> =A0recipes/cairo/cairo-directfb_1.6.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A04 ++--
> =A0recipes/classpath/classpath.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/coreutils/coreutils.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A04 ++--
> =A0recipes/dillo/dillo_0.8.6.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 +-
> =A0recipes/dropbear/dropbear.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/emacs/emacs-x11_22.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/emacs/emacs-x11_23.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/emacs/emacs-x11_cvs.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
> =A0recipes/ffalarms/ffalarms_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/ffmpeg/ffmpeg.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A02 +-
> =A0recipes/fftw/fftw.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/freesmartphone/fso-apm_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/freesmartphone/fso-gsm0710muxd_git.bb =A0 =A0 =A0| =A0 =A04 ++=
--
> =A0recipes/gnome/gnome-vfs_2.22.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/gnome/gnome-vfs_2.24.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/gpe-icons/gpe-theme-neo_git.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/gpe-scap/gpe-scap_1.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/gpe-scap/gpe-scap_1.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/gpe-scap/gpe-scap_1.4.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/gpe-scap/gpe-scap_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/hotplug-ng/hotplug-ng_001.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A06 +++---
> =A0recipes/initscripts/initscripts-openprotium_1.0.bb | =A0 =A02 +-
> =A0recipes/initscripts/initscripts-slugos_1.0.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/irk/irk-belkin_0.11.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A04 ++--
> =A0recipes/irk/irk-targus_0.11.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A04 ++--
> =A0recipes/libgpepimc/libgpepimc-hildon_0.5.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/libgpepimc/libgpepimc.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/libgpepimc/libgpepimc_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/libgpewidget/libgpewidget-hildon_0.102.bb =A0| =A0 =A02 +-
> =A0recipes/links/links-x11_2.0+2.1pre30.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/links/links_2.0+2.1pre30.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/linux-hotplug/linux-hotplug_20040920.bb =A0 =A0| =A0 =A02 +-
> =A0recipes/logrotate/logrotate_3.7.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/lyx/lyx_1.6.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A02 +-
> =A0recipes/lyx/lyx_1.6.4.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +-
> =A0recipes/mamona/bash-noemu_3.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A04 ++--
> =A0recipes/mamona/binutils-noemu_2.17.50.0.5.bb =A0 =A0 =A0 | =A0 =A04 ++=
--
> =A0recipes/mamona/binutils-noemu_2.18.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A04 ++--
> =A0recipes/mamona/gcc-noemu_4.1.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A04 ++--
> =A0recipes/mamona/gcc-noemu_4.1.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A04 ++--
> =A0recipes/matchbox-keyboard/matchbox-keyboard_svn.bb | =A0 =A02 +-
> =A0recipes/matchbox-sato/matchbox-sato_0.1.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/matchbox-session/matchbox-session.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/meta/external-toolchain-generic.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/meta/external-toolchain.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
> =A0.../midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb =A0 | =A0 =A02 +-
> =A0recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb =A0| =A0 =A02 +-
> =A0recipes/midpath/midpath-cldc_0.2+0.3rc2.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/midpath/midpath.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 =A02 +-
> =A0recipes/misc-binary-only/prism-firmware.bb =A0 =A0 =A0 =A0 | =A0 =A04 =
++--
> =A0recipes/monotone/monotone-6_0.33.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/monotone/monotone-6_0.34.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/monotone/monotone-6_0.37.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/motion/motion_3.2.11.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/multitap-pad/multitap-pad_svn.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb =A0 | =A0 =A04 ++--
> =A0recipes/ntp/ntp.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/obsolete/ffalarms/ffalarms_0.2.2.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0.../obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb =A0 =A0| =A0 =A02 +-
> =A0recipes/obsolete/shr/etk-theme-neo_git.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
> =A0.../libframeworkd-phonegui-efl-theme-neo_git.bb =A0 =A0| =A0 =A02 +-
> =A0recipes/obsolete/tasks/task-bootstrap-unionroot.bb | =A0 =A02 +-
> =A0recipes/openmoko-projects/illume-theme-asu_svn.bb =A0| =A0 =A02 +-
> =A0recipes/openmoko2/openmoko-sound-system2_0.1.0.bb =A0| =A0 =A04 ++--
> =A0.../openmoko-sound-theme-standard2_svn.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
4 ++--
> =A0.../openmoko2/openmoko-theme-standard2-qvga_svn.bb | =A0 =A04 ++--
> =A0recipes/openmoko2/openmoko-theme-standard2_svn.bb =A0| =A0 =A02 +-
> =A0...opie-mediaplayer2-skin-default-landscape_cvs.bb | =A0 =A02 +-
> =A0.../opie-mediaplayer2-skin-default_1.2.3.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0.../opie-mediaplayer2-skin-default_1.2.4.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0.../opie-mediaplayer2-skin-default_cvs.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
> =A0.../opie-mediaplayer2-skin-pod_1.2.3.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0.../opie-mediaplayer2-skin-pod_1.2.4.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0.../opie-mediaplayer2-skin-pod_cvs.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0.../opie-mediaplayer2-skin-techno_1.2.3.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0.../opie-mediaplayer2-skin-techno_1.2.4.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0.../opie-mediaplayer2-skin-techno_cvs.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/opie-taskbar/opie-taskbar-images.inc =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/pulseaudio/pulseaudio-esd-wrapper.bb =A0 =A0 =A0 | =A0 =A04 ++=
--
> =A0recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb | =A0 =A04 ++--
> =A0recipes/qpf-fonts/qpf-unifont_1.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/qpf-fonts/qpf-unismall_1.0.0.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/samba/samba-essential_3.0.20.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/sarg/sarg_2.2.7.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 +-
> =A0recipes/sharp-binary-only/sharp-compat-libs_0.5.bb | =A0 =A04 ++--
> =A0.../sharprom-toolchain-native_1.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/shr/e-wm-theme-illume-neo_git.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/shr/elementary-theme-neo_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/shr/elementary-theme-o2_git.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/shr/gtk-theme-neo_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/shr/icon-theme-neo_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/shr/phoneui-shr-theme-neo_git.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/shr/phoneui-shr-theme-o2_git.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/socketcan/canutils.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
> =A0recipes/socketcan/socketcan-utils-test_svn.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/swt/swt3.4-gtk_3.4.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/swt/swt3.5-gtk_3.5.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/tasks/task-mamona-sdk-noemu.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A04 ++--
> =A0recipes/tasks/task-mamona-sdk.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A04 ++--
> =A0recipes/ttf-fonts/ttf-arphic-uming_20080216.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/ttf-fonts/ttf-sazanami_20040629.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/vala-terminal/vala-terminal_git.bb =A0 =A0 =A0 =A0 | =A0 =A04 =
++--
> =A0recipes/vim/gvim_7.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/vnc/fbvncserver2_cvs.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0| =A0 =A02 +-
> =A0recipes/wpa-supplicant/wpa-supplicant-0.6.inc =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb =A0 =A0| =A0 =A02 +-
> =A0.../xcursor-watchonly-theme_0.1.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A04 ++--
> =A0recipes/xfce-extras/orage_4.4.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
> =A0recipes/xfce-extras/orage_4.6.1.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
> =A0recipes/xorg-lib/libx11_git.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0 =A02 +-
> =A0recipes/xorg-lib/libxscrnsaver_1.1.2.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/xorg-lib/libxscrnsaver_1.1.3.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/xorg-lib/libxscrnsaver_1.2.0.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/zsafe/zsafe_2.1.3.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 +-
> =A0recipes/zten/zten_1.6.2.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 =A02 +-
> =A0136 files changed, 168 insertions(+), 168 deletions(-)
>
> diff --git a/recipes/abiword/abiword-embedded_2.4.6.bb b/recipes/abiword/=
abiword-embedded_2.4.6.bb
> index 84bb8f1..8ec9526 100644
> --- a/recipes/abiword/abiword-embedded_2.4.6.bb
> +++ b/recipes/abiword/abiword-embedded_2.4.6.bb
> @@ -2,8 +2,8 @@ require abiword.inc
>
> =A0EXTRA_OECONF +=3D "--enable-embedded"
>
> -RCONFLICTS =3D "abiword"
> -RPROVIDES +=3D "abiword"
> +RCONFLICTS_${PN} =3D "abiword"
> +RPROVIDES_${PN} +=3D "abiword"
>
> =A0do_compile_prepend() {
> =A0 =A0 =A0 =A0cp ${S}/src/af/xap/unix/hildon/xap_EmbeddedFeatures.h ${S}=
/src/af/xap/unix/
> diff --git a/recipes/abiword/abiword-embedded_2.5.2.bb b/recipes/abiword/=
abiword-embedded_2.5.2.bb
> index 67f516e..459cc27 100644
> --- a/recipes/abiword/abiword-embedded_2.5.2.bb
> +++ b/recipes/abiword/abiword-embedded_2.5.2.bb
> @@ -4,8 +4,8 @@ EXTRA_OECONF +=3D "--enable-embedded"
>
> =A0S =3D "${WORKDIR}/abiword-${PV}"
>
> -RCONFLICTS =3D "abiword"
> -RPROVIDES +=3D "abiword"
> +RCONFLICTS_${PN} =3D "abiword"
> +RPROVIDES_${PN} +=3D "abiword"
>
>
>
> diff --git a/recipes/abiword/abiword-embedded_2.6.4.bb b/recipes/abiword/=
abiword-embedded_2.6.4.bb
> index 3580841..13951f8 100644
> --- a/recipes/abiword/abiword-embedded_2.6.4.bb
> +++ b/recipes/abiword/abiword-embedded_2.6.4.bb
> @@ -4,8 +4,8 @@ EXTRA_OECONF +=3D "--enable-embedded"
>
> =A0S =3D "${WORKDIR}/abiword-${PV}"
>
> -RCONFLICTS =3D "abiword"
> -RPROVIDES +=3D "abiword"
> +RCONFLICTS_${PN} =3D "abiword"
> +RPROVIDES_${PN} +=3D "abiword"
>
> =A0SRC_URI[md5sum] =3D "16748b2d6e318e0e2a25581005e1943a"
> =A0SRC_URI[sha256sum] =3D "4d2d7a6b69b00ffe603a136a9df7ecda9f43448c7bc723=
503e76eaec9ab8e9fe"
> diff --git a/recipes/abiword/abiword-embedded_2.6.8.bb b/recipes/abiword/=
abiword-embedded_2.6.8.bb
> index fc6e2d5..ca48d77 100644
> --- a/recipes/abiword/abiword-embedded_2.6.8.bb
> +++ b/recipes/abiword/abiword-embedded_2.6.8.bb
> @@ -4,8 +4,8 @@ EXTRA_OECONF +=3D "--enable-embedded"
>
> =A0S =3D "${WORKDIR}/abiword-${PV}"
>
> -RCONFLICTS =3D "abiword"
> -RPROVIDES +=3D "abiword"
> +RCONFLICTS_${PN} =3D "abiword"
> +RPROVIDES_${PN} +=3D "abiword"
>
> =A0SRC_URI[md5sum] =3D "fab04d8ef999c303f720197adf261310"
> =A0SRC_URI[sha256sum] =3D "b6656a0da13d94b334f02637c89d8fe13aa54752040ad1=
b8f14f668d8cb96e93"
> diff --git a/recipes/abiword/abiword_2.4.6.bb b/recipes/abiword/abiword_2=
.4.6.bb
> index 7911571..af0b5d4 100644
> --- a/recipes/abiword/abiword_2.4.6.bb
> +++ b/recipes/abiword/abiword_2.4.6.bb
> @@ -1,6 +1,6 @@
> =A0require abiword.inc
>
> -RCONFLICTS =3D "abiword-embedded"
> +RCONFLICTS_${PN} =3D "abiword-embedded"
>
>
> =A0SRC_URI[md5sum] =3D "30fbd0a9b539f15f54f90d3812a75266"
> diff --git a/recipes/abiword/abiword_2.5.1.bb b/recipes/abiword/abiword_2=
.5.1.bb
> index fdf8fc6..2f90f52 100644
> --- a/recipes/abiword/abiword_2.5.1.bb
> +++ b/recipes/abiword/abiword_2.5.1.bb
> @@ -4,7 +4,7 @@ DEFAULT_PREFERENCE =3D "-1"
>
> =A0PR =3D "r2"
>
> -RCONFLICTS =3D "abiword-embedded"
> +RCONFLICTS_${PN} =3D "abiword-embedded"
>
> =A0SRC_URI[md5sum] =3D "11d022458e0e090846b35ed4873c2e6e"
> =A0SRC_URI[sha256sum] =3D "482891fb0e376e2aaeee25afa8b4913e6dc50f4fdc280f=
9f152b3ee8745d735d"
> diff --git a/recipes/abiword/abiword_2.5.2.bb b/recipes/abiword/abiword_2=
.5.2.bb
> index a9e644d..35fd966 100644
> --- a/recipes/abiword/abiword_2.5.2.bb
> +++ b/recipes/abiword/abiword_2.5.2.bb
> @@ -4,7 +4,7 @@ DEFAULT_PREFERENCE =3D "-1"
>
> =A0PR =3D "r1"
>
> -RCONFLICTS =3D "abiword-embedded"
> +RCONFLICTS_${PN} =3D "abiword-embedded"
>
> =A0SRC_URI[md5sum] =3D "bbc9c124f8072875129bd67092f0fa0b"
> =A0SRC_URI[sha256sum] =3D "db34eeb5457fb7572fc76ec2a73cdb4f7a67307e7468b6=
c4bde820b58c598b3f"
> diff --git a/recipes/abiword/abiword_2.6.0.bb b/recipes/abiword/abiword_2=
.6.0.bb
> index 9e9e43b..d017966 100644
> --- a/recipes/abiword/abiword_2.6.0.bb
> +++ b/recipes/abiword/abiword_2.6.0.bb
> @@ -1,6 +1,6 @@
> =A0require abiword-2.5.inc
>
> -RCONFLICTS =3D "abiword-embedded"
> +RCONFLICTS_${PN} =3D "abiword-embedded"
>
> =A0SRC_URI[md5sum] =3D "d627a5d1061160c683f2257da498355b"
> =A0SRC_URI[sha256sum] =3D "35b1ced07bed8706a81c2c26c42bf95bdf7a4a9c1fba98=
935cc5ecb5c674f0bb"
> diff --git a/recipes/abiword/abiword_2.6.3.bb b/recipes/abiword/abiword_2=
.6.3.bb
> index 960ae97..576ca9c 100644
> --- a/recipes/abiword/abiword_2.6.3.bb
> +++ b/recipes/abiword/abiword_2.6.3.bb
> @@ -2,7 +2,7 @@ require abiword-2.5.inc
>
> =A0PR =3D "r1"
>
> -RCONFLICTS =3D "abiword-embedded"
> +RCONFLICTS_${PN} =3D "abiword-embedded"
>
> =A0FILES_${PN} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D "${datadir}/mi=
me-info"
> =A0FILES_abiword-strings =A0 =A0 =A0 =A0 =A0 +=3D "${datadir}/abiword-${S=
HRT_VER}/strings"
> diff --git a/recipes/abiword/abiword_2.6.4.bb b/recipes/abiword/abiword_2=
.6.4.bb
> index 711074e..e12b93d 100644
> --- a/recipes/abiword/abiword_2.6.4.bb
> +++ b/recipes/abiword/abiword_2.6.4.bb
> @@ -2,7 +2,7 @@ require abiword-2.5.inc
>
> =A0PR =3D "r2"
>
> -RCONFLICTS =3D "abiword-embedded"
> +RCONFLICTS_${PN} =3D "abiword-embedded"
>
> =A0FILES_${PN} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D "${datadir}/mi=
me-info"
> =A0FILES_abiword-strings =A0 =A0 =A0 =A0 =A0 +=3D "${datadir}/abiword-${S=
HRT_VER}/strings"
> diff --git a/recipes/abiword/abiword_2.6.8.bb b/recipes/abiword/abiword_2=
.6.8.bb
> index f18bd43..4399371 100644
> --- a/recipes/abiword/abiword_2.6.8.bb
> +++ b/recipes/abiword/abiword_2.6.8.bb
> @@ -1,6 +1,6 @@
> =A0require abiword-2.5.inc
>
> -RCONFLICTS =3D "abiword-embedded"
> +RCONFLICTS_${PN} =3D "abiword-embedded"
>
> =A0FILES_${PN} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D "${datadir}/mi=
me-info"
> =A0FILES_abiword-strings =A0 =A0 =A0 =A0 =A0 +=3D "${datadir}/abiword-${S=
HRT_VER}/strings"
> diff --git a/recipes/abiword/abiword_2.8.1.bb b/recipes/abiword/abiword_2=
.8.1.bb
> index 96bc03c..781e096 100644
> --- a/recipes/abiword/abiword_2.8.1.bb
> +++ b/recipes/abiword/abiword_2.8.1.bb
> @@ -18,7 +18,7 @@ EXTRA_OECONF =3D " --disable-static =A0\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--with-libwmf-config=3D${STAGING_DIR} =
\
> =A0"
> =A0DEPENDS +=3D " libwmf-native gtkmathview "
> -RCONFLICTS =3D "abiword-embedded"
> +RCONFLICTS_${PN} =3D "abiword-embedded"
>
> =A0FILES_${PN} =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D "${libdir}/lib=
abiword-*.so ${datadir}/mime-info ${datadir}/abiword-${SHRT_VER}/certs ${da=
tadir}/abiword-${SHRT_VER}/ui ${datadir}/abiword-${SHRT_VER}/xsl* ${datadir=
}/abiword-${SHRT_VER}/mime-info ${datadir}/abiword-${SHRT_VER}/Pr*.xml"
> =A0FILES_abiword-strings =A0 =A0 =A0 =A0 =A0 +=3D "${datadir}/abiword-${S=
HRT_VER}/strings"
> diff --git a/recipes/angstrom/epiphany-firefox-replacement.bb b/recipes/a=
ngstrom/epiphany-firefox-replacement.bb
> index 50de217..ca08cf3 100644
> --- a/recipes/angstrom/epiphany-firefox-replacement.bb
> +++ b/recipes/angstrom/epiphany-firefox-replacement.bb
> @@ -1,7 +1,7 @@
> =A0# This is a hack because $*#($*($# e17 doesn't check if firefox is pre=
sent and puts it in the menu blindly
>
> =A0RDEPENDS_${PN} =3D "epiphany"
> -RCONFLICTS =3D "firefox"
> +RCONFLICTS_${PN} =3D "firefox"
>
> =A0do_install() {
> =A0 =A0 =A0 =A0install -d ${D}/${bindir}
> diff --git a/recipes/at/at_3.1.8.bb b/recipes/at/at_3.1.8.bb
> index 79b8557..f7d692b 100644
> --- a/recipes/at/at_3.1.8.bb
> +++ b/recipes/at/at_3.1.8.bb
> @@ -2,8 +2,8 @@ DESCRIPTION =3D "Delayed job execution and batch processi=
ng."
> =A0SECTION =3D "base"
> =A0LICENSE=3D"BSD"
> =A0DEPENDS =3D "flex-native"
> -RCONFLICTS =3D "atd"
> -RREPLACES =3D "atd"
> +RCONFLICTS_${PN} =3D "atd"
> +RREPLACES_${PN} =3D "atd"
>
> =A0PR =3D "r2"
>
> diff --git a/recipes/atd/atd_0.70.bb b/recipes/atd/atd_0.70.bb
> index 5ffb386..d912ad3 100644
> --- a/recipes/atd/atd_0.70.bb
> +++ b/recipes/atd/atd_0.70.bb
> @@ -1,8 +1,8 @@
> =A0DESCRIPTION =3D "Lightweight At Daemon"
> =A0SECTION =3D "base"
> =A0LICENSE =3D "GPLv2"
> -RCONFLICTS =3D "at"
> -RREPLACES =3D "at"
> +RCONFLICTS_${PN} =3D "at"
> +RREPLACES_${PN} =3D "at"
>
> =A0PR =3D "r5"
>
> diff --git a/recipes/atd/atd_0.80.bb b/recipes/atd/atd_0.80.bb
> index 6ec1928..ab81b42 100644
> --- a/recipes/atd/atd_0.80.bb
> +++ b/recipes/atd/atd_0.80.bb
> @@ -1,8 +1,8 @@
> =A0DESCRIPTION =3D "Lightweight At Daemon"
> =A0SECTION =3D "base"
> =A0LICENSE =3D "GPLv2"
> -RCONFLICTS =3D "at"
> -RREPLACES =3D "at"
> +RCONFLICTS_${PN} =3D "at"
> +RREPLACES_${PN} =3D "at"
>
> =A0PR =3D "r1"
>
> diff --git a/recipes/bluez/bluez-utils.inc b/recipes/bluez/bluez-utils.in=
c
> index 9933748..dfe64c3 100644
> --- a/recipes/bluez/bluez-utils.inc
> +++ b/recipes/bluez/bluez-utils.inc
> @@ -4,7 +4,7 @@ PRIORITY =3D "optional"
> =A0DEPENDS =3D "gstreamer gst-plugins-base bluez-libs-${PV} virtual/libus=
b0 dbus cups"
> =A0PROVIDES =3D "bluez-utils-dbus"
> =A0RPROVIDES_${PN} =3D "bluez-pan bluez-sdp bluez-utils-dbus"
> -RREPLACES =3D "bluez-utils-dbus"
> +RREPLACES_${PN} =3D "bluez-utils-dbus"
> =A0RCONFLICTS_${PN} =3D "bluez-utils-nodbus"
> =A0LICENSE =3D "GPL"
>
> diff --git a/recipes/bluez/bluez-utils3.inc b/recipes/bluez/bluez-utils3.=
inc
> index 16e5ede..c3899db 100644
> --- a/recipes/bluez/bluez-utils3.inc
> +++ b/recipes/bluez/bluez-utils3.inc
> @@ -4,7 +4,7 @@ PRIORITY =3D "optional"
> =A0DEPENDS =3D "gstreamer gst-plugins-base bluez-libs-${PV} virtual/libus=
b0 dbus glib-2.0"
> =A0PROVIDES =3D "bluez-utils-dbus"
> =A0RPROVIDES_${PN} =3D "bluez-pan bluez-sdp bluez-utils-dbus"
> -RREPLACES =3D "bluez-utils-dbus"
> +RREPLACES_${PN} =3D "bluez-utils-dbus"
> =A0RCONFLICTS_${PN} =3D "bluez-utils-nodbus"
> =A0LICENSE =3D "GPL"
>
> diff --git a/recipes/bluez/bluez.inc b/recipes/bluez/bluez.inc
> index 366b5f1..3a1819a 100644
> --- a/recipes/bluez/bluez.inc
> +++ b/recipes/bluez/bluez.inc
> @@ -8,7 +8,7 @@ PR =3D "r0"
> =A0DEPENDS =3D "gstreamer gst-plugins-base dbus glib-2.0"
> =A0PROVIDES =3D "bluez-utils-dbus"
> =A0RPROVIDES_${PN} =3D "bluez-pan bluez-sdp bluez-utils-dbus"
> -RREPLACES =3D "bluez-utils-dbus"
> +RREPLACES_${PN} =3D "bluez-utils-dbus"
> =A0RCONFLICTS_${PN} =3D "bluez-utils-nodbus"
>
> =A0FILESPATHPKG =3D. "bluez-utils-${PV}:bluez-utils:"
> diff --git a/recipes/boa/boa_0.94.13.bb b/recipes/boa/boa_0.94.13.bb
> index 1356529..94019c8 100644
> --- a/recipes/boa/boa_0.94.13.bb
> +++ b/recipes/boa/boa_0.94.13.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Lightweight and High Performance WebServ=
er"
> =A0SECTION =3D "console/network"
> =A0LICENSE =3D "GPL"
> =A0RDEPENDS_${PN} =3D "mime-support"
> -RPROVIDES =3D "httpd"
> +RPROVIDES_${PN} =3D "httpd"
> =A0PR =3D "r3"
>
> =A0SRC_URI =3D "http://www.boa.org/boa-${PV}.tar.gz \
> diff --git a/recipes/cairo/cairo-directfb_1.4.8.bb b/recipes/cairo/cairo-=
directfb_1.4.8.bb
> index d9d3715..8315c62 100644
> --- a/recipes/cairo/cairo-directfb_1.4.8.bb
> +++ b/recipes/cairo/cairo-directfb_1.4.8.bb
> @@ -1,6 +1,6 @@
> =A0require cairo.inc
> -RCONFLICTS =3D "cairo"
> -RPROVIDES =3D "cairo-directfb"
> +RCONFLICTS_${PN} =3D "cairo"
> +RPROVIDES_${PN} =3D "cairo-directfb"
> =A0DEPENDS =3D "directfb libsm libpng fontconfig"
> =A0SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 file://cairo_directfb_is_similar-typo.patch \
> diff --git a/recipes/cairo/cairo-directfb_1.6.4.bb b/recipes/cairo/cairo-=
directfb_1.6.4.bb
> index 55064ce..97c70cb 100644
> --- a/recipes/cairo/cairo-directfb_1.6.4.bb
> +++ b/recipes/cairo/cairo-directfb_1.6.4.bb
> @@ -1,6 +1,6 @@
> =A0require cairo.inc
> -RCONFLICTS =3D "cairo"
> -RPROVIDES =3D "cairo-directfb"
> +RCONFLICTS_${PN} =3D "cairo"
> +RPROVIDES_${PN} =3D "cairo-directfb"
> =A0DEPENDS =3D "directfb pixman libsm libpng fontconfig"
> =A0SRC_URI =3D "http://cairographics.org/releases/cairo-${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://configure_fix.patch "
> diff --git a/recipes/classpath/classpath.inc b/recipes/classpath/classpat=
h.inc
> index ab47635..41c7888 100644
> --- a/recipes/classpath/classpath.inc
> +++ b/recipes/classpath/classpath.inc
> @@ -6,7 +6,7 @@ LICENSE =3D "Classpath"
> =A0PBN =3D "classpath"
>
> =A0DEPENDS =3D "virtual/javac-native fastjar-native zip-native gmp antlr-=
native"
> -RPROVIDES =3D ""
> +RPROVIDES_${PN} =3D ""
>
> =A0RDEPENDS_${PN} =3D "${PBN}-common (>=3D ${PV})"
> =A0RDEPENDS_${PN}-examples =3D "java2-runtime ${PN}-awt"
> diff --git a/recipes/coreutils/coreutils.inc b/recipes/coreutils/coreutil=
s.inc
> index 38dbd1d..9242c51 100644
> --- a/recipes/coreutils/coreutils.inc
> +++ b/recipes/coreutils/coreutils.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A collection of core GNU utilities."
> =A0HOMEPAGE =3D "http://www.gnu.org/software/coreutils"
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "base"
> -RREPLACES =3D "textutils shellutils fileutils"
> -RPROVIDES =3D "textutils shellutils fileutils"
> +RREPLACES_${PN} =3D "textutils shellutils fileutils"
> +RPROVIDES_${PN} =3D "textutils shellutils fileutils"
>
> =A0inherit autotools
> diff --git a/recipes/dillo/dillo_0.8.6.bb b/recipes/dillo/dillo_0.8.6.bb
> index bcfb8ea..3ceb77f 100644
> --- a/recipes/dillo/dillo_0.8.6.bb
> +++ b/recipes/dillo/dillo_0.8.6.bb
> @@ -4,7 +4,7 @@ SECTION =3D "x11/network"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "gtk+-1.2 libpng openssl"
> -RCONFLICTS =3D "dillo2"
> +RCONFLICTS_${PN} =3D "dillo2"
> =A0PR =3D "r2"
> =A0SRC_URI=3D"http://www.dillo.org/download/dillo-${PV}.tar.bz2 \
> =A0 =A0 =A0 =A0 =A0file://dillo-i18n.diff \
> diff --git a/recipes/dropbear/dropbear.inc b/recipes/dropbear/dropbear.in=
c
> index 5da00f2..e3fee80 100644
> --- a/recipes/dropbear/dropbear.inc
> +++ b/recipes/dropbear/dropbear.inc
> @@ -4,7 +4,7 @@ SECTION =3D "console/network"
> =A0LICENSE =3D "MIT"
> =A0DEPENDS =3D "zlib"
> =A0PROVIDES =3D "ssh sshd"
> -RPROVIDES =3D "ssh sshd"
> +RPROVIDES_${PN} =3D "ssh sshd"
>
> =A0INC_PR =3D "r3"
>
> diff --git a/recipes/emacs/emacs-x11_22.3.bb b/recipes/emacs/emacs-x11_22=
.3.bb
> index f00b285..c198a1f 100644
> --- a/recipes/emacs/emacs-x11_22.3.bb
> +++ b/recipes/emacs/emacs-x11_22.3.bb
> @@ -5,7 +5,7 @@ DEPENDS +=3D "gtk+ libungif"
>
> =A0EXTRA_OECONF =3D "--without-sound --with-x-toolkit=3Dgtk"
>
> -RREPLACES =3D "emacs"
> +RREPLACES_${PN} =3D "emacs"
>
> =A0FILESPATHPKG =3D. "emacs-${PV}:"
> =A0SRC_URI =3D "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz \
> diff --git a/recipes/emacs/emacs-x11_23.1.bb b/recipes/emacs/emacs-x11_23=
.1.bb
> index f060e82..72c412d 100644
> --- a/recipes/emacs/emacs-x11_23.1.bb
> +++ b/recipes/emacs/emacs-x11_23.1.bb
> @@ -9,7 +9,7 @@ EXTRA_OECONF =3D "--without-sound --with-x-toolkit=3Dgtk"
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> -RREPLACES =3D "emacs"
> +RREPLACES_${PN} =3D "emacs"
>
> =A0FILESPATHPKG =3D. "emacs-${PV}:"
> =A0SRC_URI =3D "${GNU_MIRROR}/emacs/emacs-${PV}.tar.gz;name=3Dtarball \
> diff --git a/recipes/emacs/emacs-x11_cvs.bb b/recipes/emacs/emacs-x11_cvs=
.bb
> index 809176a..92dcce1 100644
> --- a/recipes/emacs/emacs-x11_cvs.bb
> +++ b/recipes/emacs/emacs-x11_cvs.bb
> @@ -5,4 +5,4 @@ DEPENDS +=3D "libx11"
>
> =A0EXTRA_OECONF =3D "--without-sound"
>
> -RREPLACES =3D "emacs"
> +RREPLACES_${PN} =3D "emacs"
> diff --git a/recipes/ffalarms/ffalarms_git.bb b/recipes/ffalarms/ffalarms=
_git.bb
> index 07fe60f..8580bc6 100644
> --- a/recipes/ffalarms/ffalarms_git.bb
> +++ b/recipes/ffalarms/ffalarms_git.bb
> @@ -6,7 +6,7 @@ PRIORITY =3D "optional"
> =A0LICENSE =3D "GPLv3"
> =A0DEPENDS =3D "elementary libeflvala libical"
> =A0RDEPENDS_${PN} =3D "atd alsa-utils-amixer ttf-dejavu-sans libical"
> -RSUGGESTS =3D "mplayer alsa-utils-aplay frameworkd"
> +RSUGGESTS_${PN} =3D "mplayer alsa-utils-aplay frameworkd"
> =A0PV =3D "0.4+gitr${SRCPV}"
> =A0PR =3D "r2"
>
> diff --git a/recipes/ffmpeg/ffmpeg.inc b/recipes/ffmpeg/ffmpeg.inc
> index 2b4d26e..680a76e 100644
> --- a/recipes/ffmpeg/ffmpeg.inc
> +++ b/recipes/ffmpeg/ffmpeg.inc
> @@ -10,7 +10,7 @@ ARM_INSTRUCTION_SET =3D "arm"
> =A0PE =3D "2"
>
> =A0DEPENDS =3D "zlib libogg libvorbis libtheora faac faad2 ${@base_condit=
ional('ENTERPRISE_DISTRO', '1', '', 'lame liba52', d)}"
> -RSUGGESTS =3D "mplayer"
> +RSUGGESTS_${PN} =3D "mplayer"
>
> =A0INC_PR =3D "r13"
>
> diff --git a/recipes/fftw/fftw.inc b/recipes/fftw/fftw.inc
> index acd1b27..19a9470 100644
> --- a/recipes/fftw/fftw.inc
> +++ b/recipes/fftw/fftw.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "FFTW"
> =A0SECTION =3D "libs"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> -RPROVIDES +=3D "libfftw3"
> +RPROVIDES_${PN} +=3D "libfftw3"
>
> =A0PR =3D "r1"
>
> diff --git a/recipes/freesmartphone/fso-apm_git.bb b/recipes/freesmartpho=
ne/fso-apm_git.bb
> index 0047860..3e02149 100644
> --- a/recipes/freesmartphone/fso-apm_git.bb
> +++ b/recipes/freesmartphone/fso-apm_git.bb
> @@ -5,7 +5,7 @@ AUTHOR =3D "Michael 'Mickey' Lauer <mlauer@vanille-media.=
de>"
> =A0SECTION =3D "console"
> =A0LICENSE =3D "GPLv2"
> =A0PE =3D "1"
> -RCONFLICTS =3D "apm"
> +RCONFLICTS_${PN} =3D "apm"
> =A0SRCREV =3D "${FSO_CORNUCOPIA_SRCREV}"
> =A0PV =3D "2.0.0+gitr${SRCPV}"
> =A0PR =3D "${INC_PR}.0"
> diff --git a/recipes/freesmartphone/fso-gsm0710muxd_git.bb b/recipes/free=
smartphone/fso-gsm0710muxd_git.bb
> index 6fae6af..befffe1 100644
> --- a/recipes/freesmartphone/fso-gsm0710muxd_git.bb
> +++ b/recipes/freesmartphone/fso-gsm0710muxd_git.bb
> @@ -14,7 +14,7 @@ S =3D "${WORKDIR}/git"
> =A0inherit autotools
>
> =A0RDEPENDS_${PN} =3D "dbus dbus-glib"
> -RCONFLICTS =3D "gsm0710muxd"
> -RREPLACES =3D "gsm0710muxd"
> +RCONFLICTS_${PN} =3D "gsm0710muxd"
> +RREPLACES_${PN} =3D "gsm0710muxd"
>
> =A0FILES_${PN} +=3D "${datadir} ${sysconfdir}"
> diff --git a/recipes/gnome/gnome-vfs_2.22.0.bb b/recipes/gnome/gnome-vfs_=
2.22.0.bb
> index e0dc46f..3d40983 100644
> --- a/recipes/gnome/gnome-vfs_2.22.0.bb
> +++ b/recipes/gnome/gnome-vfs_2.22.0.bb
> @@ -12,7 +12,7 @@ SRC_URI +=3D "file://gconftool-lossage.patch \
>
> =A0# This is to provide compatibility with the gnome-vfs DBus fork
> =A0PROVIDES =3D "gnome-vfs-plugin-dbus"
> -RREPLACES =3D "gnome-vfs-dbus"
> +RREPLACES_${PN} =3D "gnome-vfs-dbus"
>
> =A0EXTRA_OECONF =3D " \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> diff --git a/recipes/gnome/gnome-vfs_2.24.1.bb b/recipes/gnome/gnome-vfs_=
2.24.1.bb
> index 19104d4..206e723 100644
> --- a/recipes/gnome/gnome-vfs_2.24.1.bb
> +++ b/recipes/gnome/gnome-vfs_2.24.1.bb
> @@ -13,7 +13,7 @@ SRC_URI +=3D "file://gconftool-lossage.patch \
>
> =A0# This is to provide compatibility with the gnome-vfs DBus fork
> =A0PROVIDES =3D "gnome-vfs-plugin-dbus"
> -RREPLACES =3D "gnome-vfs-dbus"
> +RREPLACES_${PN} =3D "gnome-vfs-dbus"
>
> =A0EXTRA_OECONF =3D " \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-openssl \
> diff --git a/recipes/gpe-icons/gpe-theme-neo_git.bb b/recipes/gpe-icons/g=
pe-theme-neo_git.bb
> index 1de7fba..cdec5e5 100644
> --- a/recipes/gpe-icons/gpe-theme-neo_git.bb
> +++ b/recipes/gpe-icons/gpe-theme-neo_git.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "nEo GPE theme - a very fast, high contrast GPE theme"
> =A0HOMEPAGE =3D "http://jmccloud.jm.funpic.de"
> =A0AUTHOR =3D "Jesus McCloud <bernd.pruenster@gmail.com"
> -RSUGGESTS =3D "gpe-filemanager gpe-sketchbook elementary-theme-neo e-wm-=
theme-illume-neo gtk-theme-neo etk-theme-neo icon-theme-neo"
> +RSUGGESTS_${PN} =3D "gpe-filemanager gpe-sketchbook elementary-theme-neo=
 e-wm-theme-illume-neo gtk-theme-neo etk-theme-neo icon-theme-neo"
> =A0LICENSE =3D "unknown"
>
> =A0SRCREV =3D "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
> diff --git a/recipes/gpe-scap/gpe-scap_1.2.bb b/recipes/gpe-scap/gpe-scap=
_1.2.bb
> index 899b872..820c23f 100644
> --- a/recipes/gpe-scap/gpe-scap_1.2.bb
> +++ b/recipes/gpe-scap/gpe-scap_1.2.bb
> @@ -4,7 +4,7 @@ PRIORITY =3D "optional"
> =A0SECTION =3D "gpe"
> =A0PR =3D "r1"
>
> -RREPLACES =3D "gpe-screenshot"
> +RREPLACES_${PN} =3D "gpe-screenshot"
>
> =A0DEPENDS =3D "glib-2.0 gtk+ libgpewidget libglade libsoup"
>
> diff --git a/recipes/gpe-scap/gpe-scap_1.3.bb b/recipes/gpe-scap/gpe-scap=
_1.3.bb
> index edbe529..2797905 100644
> --- a/recipes/gpe-scap/gpe-scap_1.3.bb
> +++ b/recipes/gpe-scap/gpe-scap_1.3.bb
> @@ -4,7 +4,7 @@ PRIORITY =3D "optional"
> =A0SECTION =3D "gpe"
> =A0PR =3D "r2"
>
> -RREPLACES =3D "gpe-screenshot"
> +RREPLACES_${PN} =3D "gpe-screenshot"
>
> =A0DEPENDS =3D "glib-2.0 gtk+ libgpewidget libglade libsoup"
>
> diff --git a/recipes/gpe-scap/gpe-scap_1.4.bb b/recipes/gpe-scap/gpe-scap=
_1.4.bb
> index 2e29067..8f2a31c 100644
> --- a/recipes/gpe-scap/gpe-scap_1.4.bb
> +++ b/recipes/gpe-scap/gpe-scap_1.4.bb
> @@ -4,7 +4,7 @@ PRIORITY =3D "optional"
> =A0SECTION =3D "gpe"
> =A0PR =3D "r0"
>
> -RREPLACES =3D "gpe-screenshot"
> +RREPLACES_${PN} =3D "gpe-screenshot"
>
> =A0DEPENDS =3D "glib-2.0 gtk+ libgpewidget libglade libsoup"
>
> diff --git a/recipes/gpe-scap/gpe-scap_svn.bb b/recipes/gpe-scap/gpe-scap=
_svn.bb
> index 04010d7..8f8188b 100644
> --- a/recipes/gpe-scap/gpe-scap_svn.bb
> +++ b/recipes/gpe-scap/gpe-scap_svn.bb
> @@ -1,5 +1,5 @@
> =A0DEPENDS =3D "glib-2.0 gtk+ libgpewidget libglade libsoup"
> -RREPLACES =3D "gpe-screenshot"
> +RREPLACES_${PN} =3D "gpe-screenshot"
> =A0PV =3D "1.4+svn-${SRCDATE}"
> =A0PR =3D "r1"
>
> diff --git a/recipes/hotplug-ng/hotplug-ng_001.bb b/recipes/hotplug-ng/ho=
tplug-ng_001.bb
> index 1b0185c..6aaa84e 100644
> --- a/recipes/hotplug-ng/hotplug-ng_001.bb
> +++ b/recipes/hotplug-ng/hotplug-ng_001.bb
> @@ -2,9 +2,9 @@ DESCRIPTION =3D "This collection of code replaces the exi=
sting linux-hotplug \
> =A0package with very tiny, compiled executable programs, instead of the \
> =A0existing bash scripts."
> =A0LICENSE =3D "GPL"
> -RPROVIDES =3D "hotplug"
> -RCONFLICTS =3D "hotplug"
> -RREPLACES =3D "hotplug"
> +RPROVIDES_${PN} =3D "hotplug"
> +RCONFLICTS_${PN} =3D "hotplug"
> +RREPLACES_${PN} =3D "hotplug"
> =A0PR =3D "r1"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/hotplu=
g-ng-${PV}.tar.gz \
> diff --git a/recipes/initscripts/initscripts-openprotium_1.0.bb b/recipes=
/initscripts/initscripts-openprotium_1.0.bb
> index aa20e29..3e87c6d 100644
> --- a/recipes/initscripts/initscripts-openprotium_1.0.bb
> +++ b/recipes/initscripts/initscripts-openprotium_1.0.bb
> @@ -7,7 +7,7 @@
> =A0# in.
> =A0include initscripts_${PV}.bb
>
> -RCONFLICTS =3D "initscripts"
> +RCONFLICTS_${PN} =3D "initscripts"
> =A0# All other standard definitions inherited from initscripts
> =A0# Except the PR which is hacked here. =A0The format used is
> =A0# a suffix
> diff --git a/recipes/initscripts/initscripts-slugos_1.0.bb b/recipes/init=
scripts/initscripts-slugos_1.0.bb
> index b793514..120d4c6 100644
> --- a/recipes/initscripts/initscripts-slugos_1.0.bb
> +++ b/recipes/initscripts/initscripts-slugos_1.0.bb
> @@ -6,7 +6,7 @@
>
> =A0include initscripts_${PV}.bb
>
> -RCONFLICTS =3D "initscripts"
> +RCONFLICTS_${PN} =3D "initscripts"
>
> =A0# SlugOS uses the busybox makedevs, so until that dependency gets virt=
ualized
> =A0# the below lines serve to remove the dependency on the full makedevs =
package,
> diff --git a/recipes/irk/irk-belkin_0.11.bb b/recipes/irk/irk-belkin_0.11=
.bb
> index e9c3dc1..93b1e61 100644
> --- a/recipes/irk/irk-belkin_0.11.bb
> +++ b/recipes/irk/irk-belkin_0.11.bb
> @@ -1,8 +1,8 @@
> =A0require irk.inc
>
> =A0DESCRIPTION +=3D "(version with Belkin support)"
> -RCONFLICTS =3D "irk-targus"
> -RREPLACES =3D "irk-targus"
> +RCONFLICTS_${PN} =3D "irk-targus"
> +RREPLACES_${PN} =3D "irk-targus"
> =A0PR =3D "r3"
>
> =A0SRC_URI =3D "http://www.openzaurus.org/download/3.5.4/sources/irk-curr=
ent.tgz \
> diff --git a/recipes/irk/irk-targus_0.11.0.bb b/recipes/irk/irk-targus_0.=
11.0.bb
> index 30f53c8..cf8f424 100644
> --- a/recipes/irk/irk-targus_0.11.0.bb
> +++ b/recipes/irk/irk-targus_0.11.0.bb
> @@ -4,8 +4,8 @@ PR =3D "r2"
> =A0DESCRIPTION +=3D "(version with Targus support)"
> =A0HOMEPAGE =3D "http://angela1.data-uncertain.co.uk/~zaurus/irk.php"
>
> -RCONFLICTS =3D "irk-belkin"
> -RREPLACES =3D "irk-belkin"
> +RCONFLICTS_${PN} =3D "irk-belkin"
> +RREPLACES_${PN} =3D "irk-belkin"
>
> =A0SRC_URI =3D "http://www.openzaurus.org/download/3.5.4/sources/irk-${PV=
}.tgz \
> =A0 =A0 =A0 =A0 =A0 =A0file://install-default-conf.patch"
> diff --git a/recipes/libgpepimc/libgpepimc-hildon_0.5.bb b/recipes/libgpe=
pimc/libgpepimc-hildon_0.5.bb
> index 24c659e..7ab4672 100644
> --- a/recipes/libgpepimc/libgpepimc-hildon_0.5.bb
> +++ b/recipes/libgpepimc/libgpepimc-hildon_0.5.bb
> @@ -5,7 +5,7 @@ SECTION =3D "gpe/libs"
> =A0PRIORITY =A0 =A0=3D "optional"
> =A0DEPENDS =A0 =A0 =3D "libgpewidget-hildon gtk+ sqlite hildon-lgpl"
> =A0PROVIDES =A0 =A0=3D "libgepepimc"
> -RPROVIDES =A0 =3D "libgepepimc"
> +RPROVIDES_${PN} =A0 =3D "libgepepimc"
>
> =A0SRC_URI =A0 =A0 =3D "${GPE_MIRROR}/libgpepimc-${PV}.tar.bz2"
>
> diff --git a/recipes/libgpepimc/libgpepimc.inc b/recipes/libgpepimc/libgp=
epimc.inc
> index 3f5a60b..a56fb10 100644
> --- a/recipes/libgpepimc/libgpepimc.inc
> +++ b/recipes/libgpepimc/libgpepimc.inc
> @@ -5,7 +5,7 @@ SECTION =3D "gpe/libs"
> =A0PRIORITY =A0 =A0=3D "optional"
> =A0DEPENDS =A0 =A0 =3D "libgpewidget gtk+ sqlite"
> =A0PROVIDES =A0 =A0=3D "libgepepimc"
> -RPROVIDES =A0 =3D "libgepepimc"
> +RPROVIDES_${PN} =A0 =3D "libgepepimc"
>
> =A0SRC_URI =A0 =A0 =3D "${GPE_MIRROR}/libgpepimc-${PV}.tar.bz2"
>
> diff --git a/recipes/libgpepimc/libgpepimc_svn.bb b/recipes/libgpepimc/li=
bgpepimc_svn.bb
> index b195837..2b80adb 100644
> --- a/recipes/libgpepimc/libgpepimc_svn.bb
> +++ b/recipes/libgpepimc/libgpepimc_svn.bb
> @@ -4,7 +4,7 @@ PRIORITY =3D "optional"
> =A0LICENSE =3D "LGPL"
> =A0DEPENDS =3D "libgpewidget gtk+ sqlite"
> =A0PROVIDES =3D "libgepepimc"
> -RPROVIDES =3D "libgepepimc"
> +RPROVIDES_${PN} =3D "libgepepimc"
> =A0PV =3D "0.8+svn${SRCDATE}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/libgpewidget/libgpewidget-hildon_0.102.bb b/recipes/=
libgpewidget/libgpewidget-hildon_0.102.bb
> index fad3c5e..7d70913 100644
> --- a/recipes/libgpewidget/libgpewidget-hildon_0.102.bb
> +++ b/recipes/libgpewidget/libgpewidget-hildon_0.102.bb
> @@ -21,7 +21,7 @@ do_stage () {
> =A0}
>
> =A0RDEPENDS_${PN} =3D "sdk-default-icons"
> -RPROVIDES =3D "libgpewidget"
> +RPROVIDES_${PN} =3D "libgpewidget"
>
> =A0SRC_URI[md5sum] =3D "9eb90850adf65ec0d0ff26833f7cb8c6"
> =A0SRC_URI[sha256sum] =3D "ac25c961899ac71b0df93b517ac12b7b3c3083397abe90=
53a77f1e763e573822"
> diff --git a/recipes/links/links-x11_2.0+2.1pre30.bb b/recipes/links/link=
s-x11_2.0+2.1pre30.bb
> index 02eae77..62813c2 100644
> --- a/recipes/links/links-x11_2.0+2.1pre30.bb
> +++ b/recipes/links/links-x11_2.0+2.1pre30.bb
> @@ -1,7 +1,7 @@
> =A0require links.inc
>
> =A0DEPENDS +=3D "virtual/libx11"
> -RCONFLICTS =3D "links"
> +RCONFLICTS_${PN} =3D "links"
> =A0PR =3D "r1"
>
> =A0SRC_URI +=3D " file://links2.desktop \
> diff --git a/recipes/links/links_2.0+2.1pre30.bb b/recipes/links/links_2.=
0+2.1pre30.bb
> index 9b23111..d0787cd 100644
> --- a/recipes/links/links_2.0+2.1pre30.bb
> +++ b/recipes/links/links_2.0+2.1pre30.bb
> @@ -1,7 +1,7 @@
> =A0require links.inc
>
> =A0DEPENDS +=3D "gpm"
> -RCONFLICTS =3D "links-x11"
> +RCONFLICTS_${PN} =3D "links-x11"
> =A0PR =3D "r1"
>
> =A0EXTRA_OECONF =3D "--enable-javascript --with-libfl --enable-graphics \
> diff --git a/recipes/linux-hotplug/linux-hotplug_20040920.bb b/recipes/li=
nux-hotplug/linux-hotplug_20040920.bb
> index 15338e6..b25590d 100644
> --- a/recipes/linux-hotplug/linux-hotplug_20040920.bb
> +++ b/recipes/linux-hotplug/linux-hotplug_20040920.bb
> @@ -7,7 +7,7 @@ RPROVIDES_${PN} =3D "hotplug"
> =A0RCONFLICTS_${PN} =3D "hotplug"
> =A0RREPLACES_${PN} =3D "hotplug"
> =A0SECTION =3D "base"
> -RSUGGESTS =3D "pciutils usbutils"
> +RSUGGESTS_${PN} =3D "pciutils usbutils"
> =A0PR =3D "r9"
>
> =A0SRC_URI =3D "${KERNELORG_MIRROR}/pub/linux/utils/kernel/hotplug/hotplu=
g-2004_09_20.tar.gz \
> diff --git a/recipes/logrotate/logrotate_3.7.1.bb b/recipes/logrotate/log=
rotate_3.7.1.bb
> index 6e129ef..7e33d4c 100644
> --- a/recipes/logrotate/logrotate_3.7.1.bb
> +++ b/recipes/logrotate/logrotate_3.7.1.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Rotates, compresses, removes and mails system log fil=
es"
> =A0HOMEPAGE =3D "http://packages.debian.org/unstable/admin/logrotate"
> -RCONFLICTS =3D "logrotate-script"
> +RCONFLICTS_${PN} =3D "logrotate-script"
> =A0DEPENDS =3D "popt"
> =A0RDEPENDS_${PN} =3D "cron"
> =A0SECTION =3D "admin"
> diff --git a/recipes/lyx/lyx_1.6.1.bb b/recipes/lyx/lyx_1.6.1.bb
> index eb7200a..0949bcc 100644
> --- a/recipes/lyx/lyx_1.6.1.bb
> +++ b/recipes/lyx/lyx_1.6.1.bb
> @@ -3,7 +3,7 @@ SECTION =3D "x11/office"
> =A0LICENSE =3D "GPL"
> =A0HOMEPAGE =3D "http://www.lyx.org"
> =A0DEPENDS =3D "qt4-x11-free"
> -RSUGGESTS =3D "tetex"
> +RSUGGESTS_${PN} =3D "tetex"
> =A0RDEPENDS_${PN} =3D "python-shell python-textutils"
> =A0PR =3D "r0"
>
> diff --git a/recipes/lyx/lyx_1.6.4.1.bb b/recipes/lyx/lyx_1.6.4.1.bb
> index 8163c99..6fd4e4e 100644
> --- a/recipes/lyx/lyx_1.6.4.1.bb
> +++ b/recipes/lyx/lyx_1.6.4.1.bb
> @@ -3,7 +3,7 @@ SECTION =3D "x11/office"
> =A0LICENSE =3D "GPL"
> =A0HOMEPAGE =3D "http://www.lyx.org"
> =A0DEPENDS =3D "qt4-x11-free"
> -RSUGGESTS =3D "tetex"
> +RSUGGESTS_${PN} =3D "tetex"
> =A0RDEPENDS_${PN} =3D "python-shell python-textutils"
>
> =A0SRC_URI =3D "\
> diff --git a/recipes/mamona/bash-noemu_3.2.bb b/recipes/mamona/bash-noemu=
_3.2.bb
> index 4b517ec..1a1f991 100644
> --- a/recipes/mamona/bash-noemu_3.2.bb
> +++ b/recipes/mamona/bash-noemu_3.2.bb
> @@ -1,8 +1,8 @@
> =A0require ../bash/bash.inc
> =A0PR =3D "r1"
>
> -RCONFLICTS =3D "bash"
> -RREPLACES =3D "bash"
> +RCONFLICTS_${PN} =3D "bash"
> +RREPLACES_${PN} =3D "bash"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/bash/bash-${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://001-005.patch \
> diff --git a/recipes/mamona/binutils-noemu_2.17.50.0.5.bb b/recipes/mamon=
a/binutils-noemu_2.17.50.0.5.bb
> index 2ba6b44..189f13e 100644
> --- a/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
> +++ b/recipes/mamona/binutils-noemu_2.17.50.0.5.bb
> @@ -2,8 +2,8 @@ require ../binutils/binutils.inc
>
> =A0PR =3D "r1"
>
> -RCONFLICTS =3D "binutils"
> -RREPLACES =3D "binutils"
> +RCONFLICTS_${PN} =3D "binutils"
> +RREPLACES_${PN} =3D "binutils"
>
> =A0SRC_URI =3D \
> =A0 =A0 "${KERNELORG_MIRROR}/pub/linux/devel/binutils/binutils-${PV}.tar.=
bz2 \
> diff --git a/recipes/mamona/binutils-noemu_2.18.bb b/recipes/mamona/binut=
ils-noemu_2.18.bb
> index 71ee384..e1ac7fc 100644
> --- a/recipes/mamona/binutils-noemu_2.18.bb
> +++ b/recipes/mamona/binutils-noemu_2.18.bb
> @@ -2,8 +2,8 @@ PR =3D "r0"
>
> =A0require ../binutils/binutils.inc
>
> -RCONFLICTS =3D "binutils"
> -RREPLACES =3D "binutils"
> +RCONFLICTS_${PN} =3D "binutils"
> +RREPLACES_${PN} =3D "binutils"
> =A0RCONFLICTS_binutils-noemu-symlinks =3D "binutils-symlinks"
> =A0RREPLACES_binutils-noemu-symlinks =3D "binutils-symlinks"
>
> diff --git a/recipes/mamona/gcc-noemu_4.1.1.bb b/recipes/mamona/gcc-noemu=
_4.1.1.bb
> index bd00ee1..f271631 100644
> --- a/recipes/mamona/gcc-noemu_4.1.1.bb
> +++ b/recipes/mamona/gcc-noemu_4.1.1.bb
> @@ -4,8 +4,8 @@ HOMEPAGE =3D "http://www.gnu.org/software/gcc/"
> =A0SECTION =3D "devel"
> =A0LICENSE =3D "GPL"
>
> -RCONFLICTS =3D "gcc"
> -RREPLACES =3D "gcc"
> +RCONFLICTS_${PN} =3D "gcc"
> +RREPLACES_${PN} =3D "gcc"
>
> =A0inherit autotools gettext
>
> diff --git a/recipes/mamona/gcc-noemu_4.1.2.bb b/recipes/mamona/gcc-noemu=
_4.1.2.bb
> index 05cdeb0..835dcbd 100644
> --- a/recipes/mamona/gcc-noemu_4.1.2.bb
> +++ b/recipes/mamona/gcc-noemu_4.1.2.bb
> @@ -6,8 +6,8 @@ LICENSE =3D "GPL"
> =A0# remember to increment the -cross .bb PR too.
> =A0PR =3D "r0"
>
> -RCONFLICTS =3D "gcc"
> -RREPLACES =3D "gcc"
> +RCONFLICTS_${PN} =3D "gcc"
> +RREPLACES_${PN} =3D "gcc"
> =A0RCONFLICTS_g++-noemu =3D "g++"
> =A0RREPLACES_g++-noemu =3D "g++"
> =A0RCONFLICTS_cpp-noemu =3D "cpp"
> diff --git a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb b/recipes=
/matchbox-keyboard/matchbox-keyboard_svn.bb
> index d3ea264..9d50eef 100644
> --- a/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
> +++ b/recipes/matchbox-keyboard/matchbox-keyboard_svn.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Matchbox virtual keyboard for X11"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "libfakekey expat libxft"
> -RCONFLICTS =3D matchbox-keyboard-inputmethod
> +RCONFLICTS_${PN} =3D matchbox-keyboard-inputmethod
> =A0RPROVIDES_${PN} =3D matchbox-keyboard-inputmethod
> =A0SECTION =3D "x11"
> =A0SRCREV =3D "1910"
> diff --git a/recipes/matchbox-sato/matchbox-sato_0.1.bb b/recipes/matchbo=
x-sato/matchbox-sato_0.1.bb
> index 9d3fef6..5a44992 100644
> --- a/recipes/matchbox-sato/matchbox-sato_0.1.bb
> +++ b/recipes/matchbox-sato/matchbox-sato_0.1.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Custom MB session files for poky"
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "x11"
> =A0RDEPENDS_${PN} =3D "gtk-sato-engine matchbox-theme-sato gtk-theme-sato=
 matchbox-panel-2 matchbox-desktop-sato"
> -RCONFLICTS =3D "matchbox-common"
> +RCONFLICTS_${PN} =3D "matchbox-common"
> =A0PR =3D "r17"
>
> =A0SRC_URI =3D "file://etc file://matchbox-session"
> diff --git a/recipes/matchbox-session/matchbox-session.bb b/recipes/match=
box-session/matchbox-session.bb
> index 9976251..f872a21 100644
> --- a/recipes/matchbox-session/matchbox-session.bb
> +++ b/recipes/matchbox-session/matchbox-session.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Matchbox session support"
> =A0RDEPENDS_${PN} =3D "matchbox-common"
> =A0# they do the same in other way
> -RCONFLICTS =3D "gpe-session-scripts"
> +RCONFLICTS_${PN} =3D "gpe-session-scripts"
>
> =A0do_install() {
> =A0 =A0 =A0 =A0 install -d ${D}${sysconfdir}/X11/Xsession.d/
> diff --git a/recipes/meta/external-toolchain-generic.bb b/recipes/meta/ex=
ternal-toolchain-generic.bb
> index c840301..3b466d4 100644
> --- a/recipes/meta/external-toolchain-generic.bb
> +++ b/recipes/meta/external-toolchain-generic.bb
> @@ -15,7 +15,7 @@ PROVIDES =3D "\
> =A0 =A0 virtual/libiconv \
> =A0 =A0 "
>
> -RPROVIDES =3D "glibc glibc-utils libsegfault glibc-thread-db libgcc-dev =
libgcc libstdc++-dev libstdc++ ldd"
> +RPROVIDES_${PN} =3D "glibc glibc-utils libsegfault glibc-thread-db libgc=
c-dev libgcc libstdc++-dev libstdc++ ldd"
> =A0PACKAGES_DYNAMIC =3D "glibc-gconv-*"
> =A0PR =3D "r2"
>
> diff --git a/recipes/meta/external-toolchain.bb b/recipes/meta/external-t=
oolchain.bb
> index 3521263..48d2bcb 100644
> --- a/recipes/meta/external-toolchain.bb
> +++ b/recipes/meta/external-toolchain.bb
> @@ -14,7 +14,7 @@ PROVIDES =3D "\
> =A0 =A0 virtual/libiconv \
> =A0 =A0 "
>
> -RPROVIDES =3D "glibc-utils libsegfault glibc-thread-db libgcc-dev libgcc=
 libstdc++-dev libstdc++"
> +RPROVIDES_${PN} =3D "glibc-utils libsegfault glibc-thread-db libgcc-dev =
libgcc libstdc++-dev libstdc++"
> =A0PACKAGES_DYNAMIC =3D "glibc-gconv-*"
> =A0PR =3D "r2"
>
> diff --git a/recipes/midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb b/recip=
es/midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb
> index eba507c..adcd8b7 100644
> --- a/recipes/midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb
> +++ b/recipes/midpath/midpath-backend-qt3x11_0.2+0.3rc2.bb
> @@ -7,7 +7,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/midpath/midpath-0.3rc2=
.tar.gz"
> =A0S =3D "${WORKDIR}/midpath-0.3rc2"
>
> =A0DEPENDS =3D "classpath qte-mt"
> -RCONFLICTS =3D "midpath-backend-qte"
> +RCONFLICTS_${PN} =3D "midpath-backend-qte"
>
> =A0inherit qt3x11
>
> diff --git a/recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb b/recipes/=
midpath/midpath-backend-qte_0.2+0.3rc2.bb
> index 3d4051b..6001abd 100644
> --- a/recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb
> +++ b/recipes/midpath/midpath-backend-qte_0.2+0.3rc2.bb
> @@ -7,7 +7,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/midpath/midpath-0.3rc2=
.tar.gz"
> =A0S =3D "${WORKDIR}/midpath-0.3rc2"
>
> =A0DEPENDS =3D "classpath qte-mt"
> -RCONFLICTS =3D "midpath-backend-qt3"
> +RCONFLICTS_${PN} =3D "midpath-backend-qt3"
>
> =A0inherit qt3e
>
> diff --git a/recipes/midpath/midpath-cldc_0.2+0.3rc2.bb b/recipes/midpath=
/midpath-cldc_0.2+0.3rc2.bb
> index f9db194..e52ca5e 100644
> --- a/recipes/midpath/midpath-cldc_0.2+0.3rc2.bb
> +++ b/recipes/midpath/midpath-cldc_0.2+0.3rc2.bb
> @@ -7,7 +7,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/midpath/midpath-0.3rc2=
.tar.gz"
> =A0S =3D "${WORKDIR}/midpath-0.3rc2"
>
> =A0DESCRIPTION =3D "Implementation of the CLDC profile for use in the MID=
Path library"
> -RPROVIDES =A0=3D "midpath-cldc java-cldc1.1"
> +RPROVIDES_${PN} =A0=3D "midpath-cldc java-cldc1.1"
>
> =A0JAR =3D "midpath-cldc1.1.jar"
>
> diff --git a/recipes/midpath/midpath.inc b/recipes/midpath/midpath.inc
> index 50fd8ef..7859113 100644
> --- a/recipes/midpath/midpath.inc
> +++ b/recipes/midpath/midpath.inc
> @@ -8,7 +8,7 @@ require midpath-common.inc
> =A0RDEPENDS_${PN} =3D "midpath-core midpath-core-bluetooth midpath-core-o=
gg ${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'midpath-core-mp3', d)=
}"
>
> =A0PROVIDES =3D "midpath"
> -RPROVIDES =3D "midpath"
> +RPROVIDES_${PN} =3D "midpath"
>
> =A0CONFIGURATION =3D "${@bb.fatal('Variable CONFIGURATION is not set in y=
our midpath.inc-based recipe.')}"
>
> diff --git a/recipes/misc-binary-only/prism-firmware.bb b/recipes/misc-bi=
nary-only/prism-firmware.bb
> index fac20bc..22df8da 100644
> --- a/recipes/misc-binary-only/prism-firmware.bb
> +++ b/recipes/misc-binary-only/prism-firmware.bb
> @@ -2,8 +2,8 @@ DESCRIPTION =3D "Firmware for the Prism 2.x/3 cards"
> =A0SECTION =3D "base"
> =A0LICENSE =3D "closed"
> =A0RDEPENDS_${PN} =3D "hostap-utils"
> -RREPLACES =3D "prism3-firmware prism3-support"
> -RCONFLICTS =3D "prism3-firmware prism3-support"
> +RREPLACES_${PN} =3D "prism3-firmware prism3-support"
> +RCONFLICTS_${PN} =3D "prism3-firmware prism3-support"
> =A0PACKAGE_ARCH =3D "all"
> =A0PR =3D "r3"
>
> diff --git a/recipes/monotone/monotone-6_0.33.bb b/recipes/monotone/monot=
one-6_0.33.bb
> index 8bc24f2..5b50ec8 100644
> --- a/recipes/monotone/monotone-6_0.33.bb
> +++ b/recipes/monotone/monotone-6_0.33.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
> =A0DEPENDS =3D "boost"
>
> =A0PROVIDES =3D "monotone"
> -RPROVIDES =3D "monotone"
> +RPROVIDES_${PN} =3D "monotone"
>
> =A0S =3D "${WORKDIR}/monotone-${PV}"
> =A0# no cross compile support - it tries to run the test program even wit=
h
> diff --git a/recipes/monotone/monotone-6_0.34.bb b/recipes/monotone/monot=
one-6_0.34.bb
> index 9a66952..c7a337a 100644
> --- a/recipes/monotone/monotone-6_0.34.bb
> +++ b/recipes/monotone/monotone-6_0.34.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
> =A0DEPENDS =3D "boost"
>
> =A0PROVIDES =3D "monotone"
> -RPROVIDES =3D "monotone"
> +RPROVIDES_${PN} =3D "monotone"
>
> =A0S =3D "${WORKDIR}/monotone-${PV}"
> =A0# no cross compile support - it tries to run the test program even wit=
h
> diff --git a/recipes/monotone/monotone-6_0.37.bb b/recipes/monotone/monot=
one-6_0.37.bb
> index 716a26b..9f1bb7c 100644
> --- a/recipes/monotone/monotone-6_0.37.bb
> +++ b/recipes/monotone/monotone-6_0.37.bb
> @@ -6,7 +6,7 @@ LICENSE =3D "MIT"
> =A0DEPENDS =3D "boost"
>
> =A0PROVIDES =3D "monotone"
> -RPROVIDES =3D "monotone"
> +RPROVIDES_${PN} =3D "monotone"
>
> =A0S =3D "${WORKDIR}/monotone-${PV}"
> =A0# no cross compile support - it tries to run the test program even wit=
h
> diff --git a/recipes/motion/motion_3.2.11.bb b/recipes/motion/motion_3.2.=
11.bb
> index d43ed27..b6f5c7a 100644
> --- a/recipes/motion/motion_3.2.11.bb
> +++ b/recipes/motion/motion_3.2.11.bb
> @@ -5,7 +5,7 @@ PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "jpeg ffmpeg mysql postgresql"
>
> -RSUGGESTS =3D "mysql-client postgresql-client"
> +RSUGGESTS_${PN} =3D "mysql-client postgresql-client"
>
> =A0PR =3D "r1"
>
> diff --git a/recipes/multitap-pad/multitap-pad_svn.bb b/recipes/multitap-=
pad/multitap-pad_svn.bb
> index efa7f04..8c7ec5a 100644
> --- a/recipes/multitap-pad/multitap-pad_svn.bb
> +++ b/recipes/multitap-pad/multitap-pad_svn.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Multi-tap input method for GTK"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "libfakekey gtk+ matchbox-panel-2"
> -RCONFLICTS =3D matchbox-keyboard-inputmethod
> +RCONFLICTS_${PN} =3D matchbox-keyboard-inputmethod
> =A0SECTION =3D "x11"
> =A0SRCREV =3D "373"
> =A0PV =3D "0.0+svnr${SRCPV}"
> diff --git a/recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb b/recipes/n=
onworking/gtk+/gtk+-directfb_2.10.14.bb
> index 2b7ea24..38c07c9 100644
> --- a/recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb
> +++ b/recipes/nonworking/gtk+/gtk+-directfb_2.10.14.bb
> @@ -7,8 +7,8 @@ DEFAULT_PREFERENCE =3D "-1"
> =A0S =3D "${WORKDIR}/gtk+-${PV}"
>
>
> -RCONFLICTS =3D "gtk+"
> -RPROVIDES =3D"gtk+-directfb"
> +RCONFLICTS_${PN} =3D "gtk+"
> +RPROVIDES_${PN} =3D"gtk+-directfb"
> =A0DEPENDS =3D "glib-2.0 pango-directfb atk jpeg libpng gtk-doc libgcrypt=
 cairo-directfb cups"
> =A0LDFLAGS_append +=3D " -ldirectfb"
> =A0CFLAGS_append =A0+=3D " -I${STAGING_INCDIR}/directfb"
> diff --git a/recipes/ntp/ntp.inc b/recipes/ntp/ntp.inc
> index 68b98db..5a90e74 100644
> --- a/recipes/ntp/ntp.inc
> +++ b/recipes/ntp/ntp.inc
> @@ -6,7 +6,7 @@ HOMEPAGE =3D "http://ntp.isc.org/bin/view/Main/WebHome"
> =A0SECTION =3D "console/network"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "ntp"
> -RSUGGESTS =3D "iana-etc"
> +RSUGGESTS_${PN} =3D "iana-etc"
>
> =A0SRC_URI =3D "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/${P=
}.tar.gz \
> =A0 =A0 =A0 =A0file://ipv6only-workaround.patch \
> diff --git a/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb b/recipes/obsole=
te/ffalarms/ffalarms_0.2.2.bb
> index 70a35a1..d259a26 100644
> --- a/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb
> +++ b/recipes/obsolete/ffalarms/ffalarms_0.2.2.bb
> @@ -20,7 +20,7 @@ RDEPENDS_${PN} +=3D "python-re python-datetime python-e=
dje python-ecore \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0atd-over-fso alsa-utils-amixer alsa-utils-alsa=
ctl \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0ttf-dejavu-sans"
>
> -RSUGGESTS +=3D "mplayer alsa-utils-aplay openmoko-alsa-scenarios"
> +RSUGGESTS_${PN} +=3D "mplayer alsa-utils-aplay openmoko-alsa-scenarios"
>
> =A0SRC_URI[archive.md5sum] =3D "6f03b9663245b93e8370e43cc556dba1"
> =A0SRC_URI[archive.sha256sum] =3D "df0561124faa5c2e64038f5efcf39432c47958=
29115b86819083ae66b001899a"
> diff --git a/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb b/recipe=
s/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
> index c0ae618..8c14ccb 100644
> --- a/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
> +++ b/recipes/obsolete/maemo/osso-gnome-vfs2_2.8.4.4-1.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPL"
> =A0SECTION =3D "x11/gnome"
> =A0PR =3D "r4"
> =A0PROVIDES =3D "virtual/gnome-vfs"
> -RPROVIDES =3D "gnome-vfs"
> +RPROVIDES_${PN} =3D "gnome-vfs"
>
> =A0inherit gnome pkgconfig
>
> diff --git a/recipes/obsolete/shr/etk-theme-neo_git.bb b/recipes/obsolete=
/shr/etk-theme-neo_git.bb
> index 42fcf70..68b83e1 100644
> --- a/recipes/obsolete/shr/etk-theme-neo_git.bb
> +++ b/recipes/obsolete/shr/etk-theme-neo_git.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "nEo etk theme - a very fast, high contrast etk theme"
> =A0HOMEPAGE =3D "http://jmccloud.jm.funpic.de"
> =A0AUTHOR =3D "Jesus McCloud <bernd.pruenster@gmail.com"
> -RSUGGESTS =3D "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo =
gpe-theme-neo icon-theme-neo"
> +RSUGGESTS_${PN} =3D "elementary-theme-neo e-wm-theme-illume-neo gtk-them=
e-neo gpe-theme-neo icon-theme-neo"
> =A0LICENSE =3D "unknown"
>
> =A0SRCREV =3D "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
> diff --git a/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_gi=
t.bb b/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
> index 637aa36..2b10c33 100644
> --- a/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
> +++ b/recipes/obsolete/shr/libframeworkd-phonegui-efl-theme-neo_git.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "nEo libframeworkd-phonegui-efl - a very =
fast, high contrast etk t
> =A0HOMEPAGE =3D "http://jmccloud.jm.funpic.de"
> =A0AUTHOR =3D "Jesus McCloud <bernd.pruenster@gmail.com"
> =A0RDEPENDS_${PN} =3D "libframeworkd-phonegui-efl"
> -RSUGGESTS =3D "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo =
etk-theme-neo gpe-theme-neo icon-theme-neo"
> +RSUGGESTS_${PN} =3D "elementary-theme-neo e-wm-theme-illume-neo gtk-them=
e-neo etk-theme-neo gpe-theme-neo icon-theme-neo"
> =A0LICENSE =3D "unknown"
>
> =A0SRCREV =3D "1cc80e26a4558dfc2268b349d9a1f468e515bcfb"
> diff --git a/recipes/obsolete/tasks/task-bootstrap-unionroot.bb b/recipes=
/obsolete/tasks/task-bootstrap-unionroot.bb
> index c780979..c6f72b8 100644
> --- a/recipes/obsolete/tasks/task-bootstrap-unionroot.bb
> +++ b/recipes/obsolete/tasks/task-bootstrap-unionroot.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Core packages required for a basic installation with =
unionroot"
> =A0PROVIDES =3D "task-bootstrap"
> -RPROVIDES =3D "task-bootstrap"
> +RPROVIDES_${PN} =3D "task-bootstrap"
> =A0PR =3D "r2"
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> diff --git a/recipes/openmoko-projects/illume-theme-asu_svn.bb b/recipes/=
openmoko-projects/illume-theme-asu_svn.bb
> index 1798b80..174e9d3 100644
> --- a/recipes/openmoko-projects/illume-theme-asu_svn.bb
> +++ b/recipes/openmoko-projects/illume-theme-asu_svn.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://illume.projects.openmoko.org/"
> =A0LICENSE =3D "MIT/BSD"
> =A0DEPENDS =3D "edje-native eet-native"
> =A0RPROVIDES_${PN} =3D "illume-theme"
> -RCONFLICTS =3D "illume-config"
> +RCONFLICTS_${PN} =3D "illume-config"
> =A0SRCREV =3D "4881"
> =A0PV =3D "0.0+svnr${SRCPV}"
> =A0PR =3D "r9"
> diff --git a/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb b/recipes/=
openmoko2/openmoko-sound-system2_0.1.0.bb
> index aa93cce..3c9b693 100644
> --- a/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
> +++ b/recipes/openmoko2/openmoko-sound-system2_0.1.0.bb
> @@ -11,8 +11,8 @@ RDEPENDS_${PN} =3D "\
> =A0 pulseaudio-module-cli-protocol-unix \
> =A0 gst-plugin-pulse \
> =A0"
> -RREPLACES =3D "openmoko-sound-system"
> -RPROVIDES =3D "openmoko-sound-system"
> +RREPLACES_${PN} =3D "openmoko-sound-system"
> +RPROVIDES_${PN} =3D "openmoko-sound-system"
> =A0PR =3D "r5.01"
>
> =A0inherit openmoko-base update-rc.d
> diff --git a/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb b/re=
cipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
> index 01385f5..a5cfaad 100644
> --- a/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
> +++ b/recipes/openmoko2/openmoko-sound-theme-standard2_svn.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Standard sound theme for the Openmoko framework"
> =A0SECTION =3D "openmoko/base"
> -RREPLACES =3D "openmoko-sound-theme-standard"
> -RPROVIDES =3D "openmoko-sound-theme-standard"
> +RREPLACES_${PN} =3D "openmoko-sound-theme-standard"
> +RPROVIDES_${PN} =3D "openmoko-sound-theme-standard"
> =A0SRCREV =3D "4271"
> =A0PV =3D "0.1+svnr${SRCPV}"
> =A0PR =3D "r3"
> diff --git a/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb b/rec=
ipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
> index a85ad61..640a89e 100644
> --- a/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
> +++ b/recipes/openmoko2/openmoko-theme-standard2-qvga_svn.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Standard Gtk+ theme for the Openmoko framework, QVGA =
edition"
> =A0SECTION =3D "openmoko/base"
> -RCONFLICTS =3D "openmoko-theme-standard"
> -RPROVIDES =3D "openmoko-theme-standard-2"
> +RCONFLICTS_${PN} =3D "openmoko-theme-standard"
> +RPROVIDES_${PN} =3D "openmoko-theme-standard-2"
> =A0SRCREV =3D "3425"
> =A0PV =3D "0.1.1+svnr${SRCPV}"
> =A0PR =3D "r1"
> diff --git a/recipes/openmoko2/openmoko-theme-standard2_svn.bb b/recipes/=
openmoko2/openmoko-theme-standard2_svn.bb
> index cc73cc5..306e634 100644
> --- a/recipes/openmoko2/openmoko-theme-standard2_svn.bb
> +++ b/recipes/openmoko2/openmoko-theme-standard2_svn.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Standard Gtk+ theme for the Openmoko framework"
> =A0SECTION =3D "openmoko/base"
> -RCONFLICTS =3D "openmoko-theme-standard"
> +RCONFLICTS_${PN} =3D "openmoko-theme-standard"
> =A0SRCREV =3D "4338"
> =A0PV =3D "0.1.1+svnr${SRCPV}"
> =A0PR =3D "r5"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-lan=
dscape_cvs.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-la=
ndscape_cvs.bb
> index 8dc186e..1722798 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_=
cvs.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_=
cvs.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
> =A0OPIE_CVS_PV ?=3D "1.2.2+cvs${SRCDATE}"
> =A0PV =3D "${OPIE_CVS_PV}"
> =A0PR =3D "r1"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2=
.3.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.3.bb
> index e0b8efe..1847b3b 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.3.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.3.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
>
> =A0TAG =3D "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
> =A0SRC_URI =3D "${HANDHELDS_CVS};tag=3D${TAG};module=3Dopie/pics"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2=
.4.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.4.bb
> index e0b8efe..1847b3b 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.4.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_1.2.4.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
>
> =A0TAG =3D "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
> =A0SRC_URI =3D "${HANDHELDS_CVS};tag=3D${TAG};module=3Dopie/pics"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs=
.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs.bb
> index cfbba1c..c352e59 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
> =A0OPIE_CVS_PV ?=3D "1.2.2+cvs${SRCDATE}"
> =A0PV =3D "${OPIE_CVS_PV}"
> =A0PR =3D "r1"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.3.b=
b b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.3.bb
> index a40604c..aac3ccc 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.3.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.3.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
>
> =A0TAG =3D "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
> =A0SRC_URI =3D "${HANDHELDS_CVS};tag=3D${TAG};module=3Dopie/pics"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.4.b=
b b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.4.bb
> index a40604c..aac3ccc 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.4.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_1.2.4.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
>
> =A0TAG =3D "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
> =A0SRC_URI =3D "${HANDHELDS_CVS};tag=3D${TAG};module=3Dopie/pics"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb =
b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb
> index ff96d83..03cd981 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
> =A0OPIE_CVS_PV ?=3D "1.2.2+cvs${SRCDATE}"
> =A0PV =3D "${OPIE_CVS_PV}"
> =A0PR =3D "r1"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.=
3.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.3.bb
> index 7a6715e..52a59cd 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.3.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.3.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
>
> =A0TAG =3D "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
> =A0SRC_URI =3D "${HANDHELDS_CVS};tag=3D${TAG};module=3Dopie/pics"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.=
4.bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.4.bb
> index 7a6715e..52a59cd 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.4.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_1.2.4.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
>
> =A0TAG =3D "${@'v' + bb.data.getVar('PV',d,1).replace('.', '_')}"
> =A0SRC_URI =3D "${HANDHELDS_CVS};tag=3D${TAG};module=3Dopie/pics"
> diff --git a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.=
bb b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.bb
> index e77e00e..79d9c19 100644
> --- a/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.bb
> +++ b/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.bb
> @@ -3,7 +3,7 @@ SECTION =3D "opie/multimedia"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0APPNAME =3D "opieplayer2"
> -RPROVIDES =3D "opie-mediaplayer2-skin"
> +RPROVIDES_${PN} =3D "opie-mediaplayer2-skin"
> =A0OPIE_CVS_PV ?=3D "1.2.2+cvs${SRCDATE}"
> =A0PV =3D "${OPIE_CVS_PV}"
> =A0PR =3D "r1"
> diff --git a/recipes/opie-taskbar/opie-taskbar-images.inc b/recipes/opie-=
taskbar/opie-taskbar-images.inc
> index b35dd8d..9f73d31 100644
> --- a/recipes/opie-taskbar/opie-taskbar-images.inc
> +++ b/recipes/opie-taskbar/opie-taskbar-images.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Opie Launcher and Taskbar"
> =A0SECTION =3D "opie/base"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> -RPROVIDES =3D "${PN}"
> +RPROVIDES_${PN} =3D "${PN}"
> =A0APPNAME =3D "qpe"
>
> =A0S =3D "${WORKDIR}/pics"
> diff --git a/recipes/pulseaudio/pulseaudio-esd-wrapper.bb b/recipes/pulse=
audio/pulseaudio-esd-wrapper.bb
> index 1eef52b..b07cac9 100644
> --- a/recipes/pulseaudio/pulseaudio-esd-wrapper.bb
> +++ b/recipes/pulseaudio/pulseaudio-esd-wrapper.bb
> @@ -3,8 +3,8 @@ LICENSE =3D "GPLv2"
>
> =A0PR =3D "r1"
>
> -RCONFLICTS =3D "esd"
> -RREPLACES =3D "esd"
> +RCONFLICTS_${PN} =3D "esd"
> +RREPLACES_${PN} =3D "esd"
>
> =A0RDEPENDS_${PN} =3D " \
> =A0 =A0 =A0 =A0pulseaudio-server \
> diff --git a/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb b/recipes=
/qpealarmclock/qpealarmclockapplet_1.0.9.bb
> index fd8b456..474c474 100644
> --- a/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb
> +++ b/recipes/qpealarmclock/qpealarmclockapplet_1.0.9.bb
> @@ -5,8 +5,8 @@ LICENSE =3D "GPL"
> =A0AUTHOR =3D "Anton Maslovsky"
> =A0HOMEPAGE =3D "http://my-zaurus.narod.ru/"
> =A0RDEPENDS_${PN} =3D "qpealarmclock"
> -RCONFLICTS =3D "opie-clockapplet"
> -RREPLACES =3D "opie-clockapplet"
> +RCONFLICTS_${PN} =3D "opie-clockapplet"
> +RREPLACES_${PN} =3D "opie-clockapplet"
>
> =A0PR =3D "r1"
>
> diff --git a/recipes/qpf-fonts/qpf-unifont_1.0.bb b/recipes/qpf-fonts/qpf=
-unifont_1.0.bb
> index 16710e4..82510b0 100644
> --- a/recipes/qpf-fonts/qpf-unifont_1.0.bb
> +++ b/recipes/qpf-fonts/qpf-unifont_1.0.bb
> @@ -2,7 +2,7 @@ require qpf.inc
>
> =A0DESCRIPTION =3D "Unicode fonts - QPF Edition"
> =A0LICENSE =3D "GPL QPL"
> -RPROVIDES =3D "virtual-japanese-font"
> +RPROVIDES_${PN} =3D "virtual-japanese-font"
> =A0PR =3D "r2"
>
> =A0SRC_URI =3D "http://www.openzaurus.org/mirror/qpf-unifont.tar.bz2"
> diff --git a/recipes/qpf-fonts/qpf-unismall_1.0.0.bb b/recipes/qpf-fonts/=
qpf-unismall_1.0.0.bb
> index ce03c03..2e37b13 100644
> --- a/recipes/qpf-fonts/qpf-unismall_1.0.0.bb
> +++ b/recipes/qpf-fonts/qpf-unismall_1.0.0.bb
> @@ -3,7 +3,7 @@ require qpf.inc
> =A0DESCRIPTION =3D "Lightweight Japanese font in 10 point suitable for 32=
0x240 display"
> =A0HOMEPAGE =3D "http://sourceforge.jp/projects/zaurus-ja/"
> =A0LICENSE =3D "GPL"
> -RPROVIDES =3D "virtual-japanese-font"
> +RPROVIDES_${PN} =3D "virtual-japanese-font"
> =A0PR =3D "r4"
>
> =A0SRC_URI =3D "http://osdn.dl.sourceforge.jp/zaurus-ja/773/unismall-${PV=
}.tar.gz"
> diff --git a/recipes/samba/samba-essential_3.0.20.bb b/recipes/samba/samb=
a-essential_3.0.20.bb
> index f3c2584..ee594cf 100644
> --- a/recipes/samba/samba-essential_3.0.20.bb
> +++ b/recipes/samba/samba-essential_3.0.20.bb
> @@ -10,7 +10,7 @@ SRC_URI =3D "file://config-lfs.patch \
> =A0 =A0 =A0 =A0 =A0 file://smb-essential-inactive.conf \
> =A0 =A0 =A0 =A0 =A0 file://Managing-Samba.txt"
>
> -RCONFLICTS =3D "samba"
> +RCONFLICTS_${PN} =3D "samba"
>
> =A0INITSCRIPT_NAME =3D "samba"
> =A0# No dependencies, goes in at level 20 (NOTE: take care with the
> diff --git a/recipes/sarg/sarg_2.2.7.1.bb b/recipes/sarg/sarg_2.2.7.1.bb
> index 38283d8..ca922c6 100644
> --- a/recipes/sarg/sarg_2.2.7.1.bb
> +++ b/recipes/sarg/sarg_2.2.7.1.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Squid Analysis Report Generator"
> =A0SECTION =3D "utils"
> =A0DEPENDS =3D "gd"
> -RSUGGESTS =3D "squid"
> +RSUGGESTS_${PN} =3D "squid"
> =A0LICENSE =3D "GPL"
> =A0HOMEPAGE =3D "http://sarg.sourceforge.net/sarg.php"
> =A0PR =3D "r0"
> diff --git a/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb b/recipes=
/sharp-binary-only/sharp-compat-libs_0.5.bb
> index d054136..cf40a35 100644
> --- a/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb
> +++ b/recipes/sharp-binary-only/sharp-compat-libs_0.5.bb
> @@ -5,8 +5,8 @@ SECTION =3D "opie/settings"
> =A0PRIORITY =3D "optional"
> =A0DEPENDS =3D "opie-sh"
> =A0RDEPENDS_${PN} =3D "opie-sh"
> -RPROVIDES =3D "oz-compat"
> -RCONFLICTS =3D "oz-compat"
> +RPROVIDES_${PN} =3D "oz-compat"
> +RCONFLICTS_${PN} =3D "oz-compat"
> =A0LICENSE =3D "GPL"
> =A0PR =3D "r2"
>
> diff --git a/recipes/sharprom-toolchain/sharprom-toolchain-native_1.0.bb =
b/recipes/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
> index c391c36..882772b 100644
> --- a/recipes/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
> +++ b/recipes/sharprom-toolchain/sharprom-toolchain-native_1.0.bb
> @@ -17,7 +17,7 @@ PROVIDES_sharprom-compatible =3D "\
> =A0 virtual/arm-linux-gcc-initial "
> =A0PR =3D "r3"
>
> -RPROVIDES =3D "glibc-utils libsegfault glibc-thread-db libgcc-dev libstd=
c++-dev libstdc++"
> +RPROVIDES_${PN} =3D "glibc-utils libsegfault glibc-thread-db libgcc-dev =
libstdc++-dev libstdc++"
> =A0PACKAGES_DYNAMIC =3D "glibc-gconv-*"
>
> =A0# This needs to be extracted to /usr/local/arm :
> diff --git a/recipes/shr/e-wm-theme-illume-neo_git.bb b/recipes/shr/e-wm-=
theme-illume-neo_git.bb
> index 89b6818..dd8371b 100644
> --- a/recipes/shr/e-wm-theme-illume-neo_git.bb
> +++ b/recipes/shr/e-wm-theme-illume-neo_git.bb
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://jmccloud.jm.funpic.de"
> =A0AUTHOR =3D "Jesus McCloud <bernd.pruenster@gmail.com"
> =A0DEPENDS =3D "edje-native"
> =A0RDEPENDS_${PN} =3D "e-wm"
> -RSUGGESTS =3D "elementary-theme-neo gtk-theme-neo gpe-theme-neo icon-the=
me-neo"
> +RSUGGESTS_${PN} =3D "elementary-theme-neo gtk-theme-neo gpe-theme-neo ic=
on-theme-neo"
> =A0LICENCE =3D "unknown"
>
> =A0SRCREV =3D "820f4d41531ad6f790615b6a7312a60e30e99fdc"
> diff --git a/recipes/shr/elementary-theme-neo_git.bb b/recipes/shr/elemen=
tary-theme-neo_git.bb
> index a7080d4..480b33b 100644
> --- a/recipes/shr/elementary-theme-neo_git.bb
> +++ b/recipes/shr/elementary-theme-neo_git.bb
> @@ -3,7 +3,7 @@ SECTION =3D "e/utils"
> =A0HOMEPAGE =3D "http://jmccloud.jm.funpic.de"
> =A0AUTHOR =3D "Jesus McCloud <bernd.pruenster@gmail.com"
> =A0DEPENDS =3D "edje-native"
> -RSUGGESTS =3D "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo =
gpe-theme-neo icon-theme-neo"
> +RSUGGESTS_${PN} =3D "elementary-theme-neo e-wm-theme-illume-neo gtk-them=
e-neo gpe-theme-neo icon-theme-neo"
> =A0LICENSE =3D "unknown"
>
> =A0SRCREV =3D "fb377425e69ce1fc13f5094801b96836203e8154"
> diff --git a/recipes/shr/elementary-theme-o2_git.bb b/recipes/shr/element=
ary-theme-o2_git.bb
> index 54a7f81..61b8c36 100644
> --- a/recipes/shr/elementary-theme-o2_git.bb
> +++ b/recipes/shr/elementary-theme-o2_git.bb
> @@ -3,7 +3,7 @@ SECTION =3D "e/utils"
> =A0HOMEPAGE =3D "http://jmccloud.jm.funpic.de"
> =A0AUTHOR =3D "Jesus McCloud <bernd.pruenster@gmail.com"
> =A0DEPENDS =3D "edje-native"
> -RSUGGESTS =3D "phoneui-shr-theme-o2"
> +RSUGGESTS_${PN} =3D "phoneui-shr-theme-o2"
> =A0LICENSE =3D "unknown"
>
> =A0SRCREV =3D "b5eb3134850c277ad8ae1a960b03ff4a509278a8"
> diff --git a/recipes/shr/gtk-theme-neo_git.bb b/recipes/shr/gtk-theme-neo=
_git.bb
> index 7f35ecd..593e525 100644
> --- a/recipes/shr/gtk-theme-neo_git.bb
> +++ b/recipes/shr/gtk-theme-neo_git.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "nEo GTK theme - a very fast, high contra=
st GTK theme"
> =A0HOMEPAGE =3D "http://jmccloud.jm.funpic.de"
> =A0AUTHOR =3D "Jesus McCloud <bernd.pruenster@gmail.com"
> =A0RDEPENDS_${PN} +=3D "icon-theme-neo"
> -RSUGGESTS =3D "elementary-theme-neo e-wm-theme-illume-neo gpe-theme-neo =
icon-theme-neo"
> +RSUGGESTS_${PN} =3D "elementary-theme-neo e-wm-theme-illume-neo gpe-them=
e-neo icon-theme-neo"
> =A0LICENSE =3D "unknown"
>
> =A0SRCREV =3D "f847105c5ef5d488a4bce0c0a85d572c3509d56f"
> diff --git a/recipes/shr/icon-theme-neo_git.bb b/recipes/shr/icon-theme-n=
eo_git.bb
> index 73c5286..7ca4d99 100644
> --- a/recipes/shr/icon-theme-neo_git.bb
> +++ b/recipes/shr/icon-theme-neo_git.bb
> @@ -3,7 +3,7 @@ SECTION =3D "e/utils"
> =A0HOMEPAGE =3D "http://jmccloud.jm.funpic.de"
> =A0AUTHOR =3D "Jesus McCloud <bernd.pruenster@gmail.com"
> =A0RDEPENDS_${PN} =3D "e-wm"
> -RSUGGESTS =3D "elementary-theme-neo e-wm-theme-illume-neo gtk-theme-neo =
gpe-theme-neo"
> +RSUGGESTS_${PN} =3D "elementary-theme-neo e-wm-theme-illume-neo gtk-them=
e-neo gpe-theme-neo"
> =A0LICENSE =3D "unknown"
>
> =A0SRCREV =3D "f847105c5ef5d488a4bce0c0a85d572c3509d56f"
> diff --git a/recipes/shr/phoneui-shr-theme-neo_git.bb b/recipes/shr/phone=
ui-shr-theme-neo_git.bb
> index 9652546..30cff01 100644
> --- a/recipes/shr/phoneui-shr-theme-neo_git.bb
> +++ b/recipes/shr/phoneui-shr-theme-neo_git.bb
> @@ -5,7 +5,7 @@ SECTION =3D "e/utils"
> =A0LICENSE =3D "unknown"
> =A0DEPENDS =3D "edje-native"
> =A0RDEPENDS_${PN} =3D "libphone-ui-shr"
> -RSUGGESTS =3D "e-wm-theme-illume-neo gtk-theme-neo icon-theme-neo elemen=
tary-theme-neo"
> +RSUGGESTS_${PN} =3D "e-wm-theme-illume-neo gtk-theme-neo icon-theme-neo =
elementary-theme-neo"
> =A0SRCREV =3D "20e5e82819a7612aa31c753a6898ccc9e940c7c6"
> =A0PV =3D "0.1+gitr${SRCPV}"
> =A0PR =3D "r0"
> diff --git a/recipes/shr/phoneui-shr-theme-o2_git.bb b/recipes/shr/phoneu=
i-shr-theme-o2_git.bb
> index 1fe0e70..eceed8b 100644
> --- a/recipes/shr/phoneui-shr-theme-o2_git.bb
> +++ b/recipes/shr/phoneui-shr-theme-o2_git.bb
> @@ -5,7 +5,7 @@ SECTION =3D "e/utils"
> =A0LICENSE =3D "unknown"
> =A0DEPENDS =3D "edje-native"
> =A0RDEPENDS_${PN} =3D "libphone-ui-shr"
> -RSUGGESTS =3D "elementary-theme-o2"
> +RSUGGESTS_${PN} =3D "elementary-theme-o2"
> =A0SRCREV =3D "20e5e82819a7612aa31c753a6898ccc9e940c7c6"
> =A0PV =3D "0.1+gitr${SRCPV}"
> =A0PR =3D "r0"
> diff --git a/recipes/socketcan/canutils.inc b/recipes/socketcan/canutils.=
inc
> index 596785f..841f387 100644
> --- a/recipes/socketcan/canutils.inc
> +++ b/recipes/socketcan/canutils.inc
> @@ -5,7 +5,7 @@ SECTION =3D "console/network"
> =A0PRIORITY =3D "optional"
> =A0LICENSE =3D "LGPL"
> =A0DEPENDS =3D "libsocketcan"
> -RCONFLICTS =3D "socketcan-utils-test"
> +RCONFLICTS_${PN} =3D "socketcan-utils-test"
> =A0INC_PR =3D "r0"
>
> =A0SRC_URI =3D "git://git.pengutronix.de/git/tools/canutils.git;protocol=
=3Dgit;tag=3D${TAG} \
> diff --git a/recipes/socketcan/socketcan-utils-test_svn.bb b/recipes/sock=
etcan/socketcan-utils-test_svn.bb
> index 2239a02..b7788b6 100644
> --- a/recipes/socketcan/socketcan-utils-test_svn.bb
> +++ b/recipes/socketcan/socketcan-utils-test_svn.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Socketcan user space utilities and test =
apps"
> =A0HOMEPAGE =3D "http://developer.berlios.de/projects/socketcan/"
> =A0SECTION =3D "console/utils"
> =A0LICENSE =3D "GPL"
> -RCONFLICTS =3D "canutils"
> +RCONFLICTS_${PN} =3D "canutils"
>
> =A0SRCREV =3D "917"
> =A0PV =3D "0.0+svnr${SRCPV}"
> diff --git a/recipes/swt/swt3.4-gtk_3.4.2.bb b/recipes/swt/swt3.4-gtk_3.4=
.2.bb
> index 179f78a..0347aa8 100644
> --- a/recipes/swt/swt3.4-gtk_3.4.2.bb
> +++ b/recipes/swt/swt3.4-gtk_3.4.2.bb
> @@ -10,7 +10,7 @@ SWT_API_VERSION =3D "3.4"
>
> =A0PROVIDES =3D "swt3.4-gtk"
>
> -RCONFLICTS =3D "libswt3.5-gtk-java"
> +RCONFLICTS_${PN} =3D "libswt3.5-gtk-java"
>
> =A0SRC_URI[md5sum] =3D "2b97f05f86bd7138491d9a8c5934e840"
> =A0SRC_URI[sha256sum] =3D "30c8c545faabae331420a6c37194470a4f74f508eab4e0=
463c65953d09cde6eb"
> diff --git a/recipes/swt/swt3.5-gtk_3.5.1.bb b/recipes/swt/swt3.5-gtk_3.5=
.1.bb
> index 6ef9dda..d2e23bb 100644
> --- a/recipes/swt/swt3.5-gtk_3.5.1.bb
> +++ b/recipes/swt/swt3.5-gtk_3.5.1.bb
> @@ -13,4 +13,4 @@ SWT_API_VERSION =3D "3.5"
>
> =A0PROVIDES =3D "swt3.5-gtk"
>
> -RCONFLICTS =3D "libswt3.4-gtk-java"
> +RCONFLICTS_${PN} =3D "libswt3.4-gtk-java"
> diff --git a/recipes/tasks/task-mamona-sdk-noemu.bb b/recipes/tasks/task-=
mamona-sdk-noemu.bb
> index 31e7215..586ff31 100644
> --- a/recipes/tasks/task-mamona-sdk-noemu.bb
> +++ b/recipes/tasks/task-mamona-sdk-noemu.bb
> @@ -2,8 +2,8 @@ PR =3D "r2"
>
> =A0require mamona-sdk.inc
>
> -RCONFLICTS =3D "task-mamona-sdk"
> -RREPLACES =3D "task-mamona-sdk"
> +RCONFLICTS_${PN} =3D "task-mamona-sdk"
> +RREPLACES_${PN} =3D "task-mamona-sdk"
>
> =A0RDEPENDS_${PN} +=3D "\
> =A0 bash-noemu \
> diff --git a/recipes/tasks/task-mamona-sdk.bb b/recipes/tasks/task-mamona=
-sdk.bb
> index d2b1fca..59085e8 100644
> --- a/recipes/tasks/task-mamona-sdk.bb
> +++ b/recipes/tasks/task-mamona-sdk.bb
> @@ -2,8 +2,8 @@ PR =3D "r4"
>
> =A0include mamona-sdk.inc
>
> -RCONFLICTS =3D "task-mamona-sdk-noemu"
> -RREPLACES =3D "task-mamona-sdk-noemu"
> +RCONFLICTS_${PN} =3D "task-mamona-sdk-noemu"
> +RREPLACES_${PN} =3D "task-mamona-sdk-noemu"
>
> =A0RDEPENDS_${PN} +=3D "\
> =A0 bash \
> diff --git a/recipes/ttf-fonts/ttf-arphic-uming_20080216.bb b/recipes/ttf=
-fonts/ttf-arphic-uming_20080216.bb
> index e92b4ca..3348d09 100644
> --- a/recipes/ttf-fonts/ttf-arphic-uming_20080216.bb
> +++ b/recipes/ttf-fonts/ttf-arphic-uming_20080216.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Unicode Mingti (printed) TrueType Font"
> =A0HOMEPAGE =3D "http://www.freedesktop.org/wiki/Software/CJKUnifonts"
> =A0LICENSE =3D "${PN}"
> =A0SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
> -RPROVIDES =3D "virtual-chinese-font"
> +RPROVIDES_${PN} =3D "virtual-chinese-font"
> =A0PR =3D "r1"
>
> =A0SRC_URI =3D \
> diff --git a/recipes/ttf-fonts/ttf-sazanami_20040629.bb b/recipes/ttf-fon=
ts/ttf-sazanami_20040629.bb
> index bff1b75..42c6a84 100644
> --- a/recipes/ttf-fonts/ttf-sazanami_20040629.bb
> +++ b/recipes/ttf-fonts/ttf-sazanami_20040629.bb
> @@ -7,7 +7,7 @@ AUTHOR =3D "Electronic Font Open Laboratory (/efont/)"
> =A0HOMEPAGE =3D "http://sourceforge.jp/projects/efont/"
> =A0LICENSE =3D "${PN}"
> =A0SRC_DISTRIBUTE_LICENSES +=3D "${PN}"
> -RPROVIDES =3D "virtual-japanese-font"
> +RPROVIDES_${PN} =3D "virtual-japanese-font"
> =A0PR =3D "r4"
>
> =A0SRC_URI =3D "http://osdn.dl.sourceforge.jp/efont/10087/sazanami-200406=
29.tar.bz2"
> diff --git a/recipes/vala-terminal/vala-terminal_git.bb b/recipes/vala-te=
rminal/vala-terminal_git.bb
> index e49b9fa..e60bac5 100644
> --- a/recipes/vala-terminal/vala-terminal_git.bb
> +++ b/recipes/vala-terminal/vala-terminal_git.bb
> @@ -12,5 +12,5 @@ SRC_URI =3D "${FREESMARTPHONE_GIT}/vala-terminal.git;pr=
otocol=3Dgit;branch=3Dmaster"
> =A0S =3D "${WORKDIR}/git"
>
> =A0RDEPENDS_${PN} =3D "ttf-liberation-mono"
> -RREPLACES =3D "openmoko-terminal2"
> -RPROVIDES =3D "openmoko-terminal2"
> +RREPLACES_${PN} =3D "openmoko-terminal2"
> +RPROVIDES_${PN} =3D "openmoko-terminal2"
> diff --git a/recipes/vim/gvim_7.2.bb b/recipes/vim/gvim_7.2.bb
> index 276a9f0..842b184 100644
> --- a/recipes/vim/gvim_7.2.bb
> +++ b/recipes/vim/gvim_7.2.bb
> @@ -7,5 +7,5 @@ DEPENDS +=3D "gtk+ xt"
>
> =A0EXTRA_OECONF +=3D "--enable-gtk2-test"
>
> -#might needs RREPLACES as well
> +#might needs RREPLACES_${PN} as well
> =A0RCONFLICTS_${PN} =3D "vim vim-tiny"
> diff --git a/recipes/vnc/fbvncserver2_cvs.bb b/recipes/vnc/fbvncserver2_c=
vs.bb
> index 023d321..d33e9d5 100644
> --- a/recipes/vnc/fbvncserver2_cvs.bb
> +++ b/recipes/vnc/fbvncserver2_cvs.bb
> @@ -6,7 +6,7 @@ PRIORITY =3D "optional"
> =A0LICENSE =3D "GPLv2"
> =A0DEPENDS =3D "libvncserver jpeg zlib gmp tslib"
> =A0RRECOMMENDS_${PN} =3D "kernel-modules-uinput kernel-module-keybdev"
> -RCONFLICTS =3D "fbvncserver, fbvncserver-kmodule"
> +RCONFLICTS_${PN} =3D "fbvncserver, fbvncserver-kmodule"
> =A0PV =3D "0.0.0+cvs${SRCDATE}"
> =A0PR =3D "r0"
>
> diff --git a/recipes/wpa-supplicant/wpa-supplicant-0.6.inc b/recipes/wpa-=
supplicant/wpa-supplicant-0.6.inc
> index 371f276..ffd2934 100644
> --- a/recipes/wpa-supplicant/wpa-supplicant-0.6.inc
> +++ b/recipes/wpa-supplicant/wpa-supplicant-0.6.inc
> @@ -23,7 +23,7 @@ S =3D "${WORKDIR}/wpa_supplicant-${PV}/wpa_supplicant"
> =A0PACKAGES_prepend =3D "wpa-supplicant-passphrase "
> =A0FILES_wpa-supplicant-passphrase =3D "/usr/sbin/wpa_passphrase"
>
> -RREPLACES =3D "wpa-supplicant-cli"
> +RREPLACES_${PN} =3D "wpa-supplicant-cli"
>
> =A0RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase"
>
> diff --git a/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb b/recipes/wp=
a-supplicant/wpa-supplicant_0.5.10.bb
> index 90c4909..6ed797c 100644
> --- a/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb
> +++ b/recipes/wpa-supplicant/wpa-supplicant_0.5.10.bb
> @@ -20,7 +20,7 @@ S =3D "${WORKDIR}/wpa_supplicant-${PV}"
> =A0PACKAGES_prepend =3D "wpa-supplicant-passphrase "
> =A0FILES_wpa-supplicant-passphrase =3D "/usr/sbin/wpa_passphrase"
>
> -RREPLACES =3D "wpa-supplicant-cli"
> +RREPLACES_${PN} =3D "wpa-supplicant-cli"
>
> =A0RRECOMMENDS_${PN} =3D "wpa-supplicant-passphrase"
>
> diff --git a/recipes/xcursor-transparent-theme/xcursor-watchonly-theme_0.=
1.1.bb b/recipes/xcursor-transparent-theme/xcursor-watchonly-theme_0.1.1.bb
> index 512c5fe..fbba757 100644
> --- a/recipes/xcursor-transparent-theme/xcursor-watchonly-theme_0.1.1.bb
> +++ b/recipes/xcursor-transparent-theme/xcursor-watchonly-theme_0.1.1.bb
> @@ -1,8 +1,8 @@
> =A0LICENSE =3D "GPL"
> =A0DESCRIPTION =3D "Transparent xcursor theme for handheld systems with v=
isible watch cursor"
> =A0SECTION =3D "x11/base"
> -RREPLACES =3D "xcursor-transparent-theme"
> -RPROVIDES =3D "xcursor-transparent-theme"
> +RREPLACES_${PN} =3D "xcursor-transparent-theme"
> +RPROVIDES_${PN} =3D "xcursor-transparent-theme"
> =A0PR =3D"r4"
>
> =A0SRC_URI =3D "http://projects.o-hand.com/matchbox/sources/utils/xcursor=
-transparent-theme-${PV}.tar.gz \
> diff --git a/recipes/xfce-extras/orage_4.4.2.bb b/recipes/xfce-extras/ora=
ge_4.4.2.bb
> index 8ed06a1..076188d 100644
> --- a/recipes/xfce-extras/orage_4.4.2.bb
> +++ b/recipes/xfce-extras/orage_4.4.2.bb
> @@ -1,6 +1,6 @@
> =A0DESCRIPTION =3D "Calendar application for the Xfce Desktop =A0Environm=
ent"
> =A0DEPENDS =3D "libxfcegui4 exo libxml-parser-perl-native xfce4-panel xfc=
e-mcs-manager"
> -RREPLACES =3D "xfcalendar"
> +RREPLACES_${PN} =3D "xfcalendar"
>
> =A0inherit xfce
>
> diff --git a/recipes/xfce-extras/orage_4.6.1.bb b/recipes/xfce-extras/ora=
ge_4.6.1.bb
> index 7d4bce7..47f17f3 100644
> --- a/recipes/xfce-extras/orage_4.6.1.bb
> +++ b/recipes/xfce-extras/orage_4.6.1.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Calendar application for the Xfce Desktop =A0Environm=
ent"
> =A0DEPENDS =3D "libxfcegui4 =A0exo xfce4-panel"
> =A0RDEPENDS_${PN} =3D "xfce4-panel"
> -RREPLACES =3D "xfcalendar"
> +RREPLACES_${PN} =3D "xfcalendar"
>
> =A0SECTION =3D "x11"
> =A0PR =3D "r3"
> diff --git a/recipes/xorg-lib/libx11_git.bb b/recipes/xorg-lib/libx11_git=
.bb
> index 05fc3e7..240ec7e 100644
> --- a/recipes/xorg-lib/libx11_git.bb
> +++ b/recipes/xorg-lib/libx11_git.bb
> @@ -5,7 +5,7 @@ SECTION =3D "x11/libs"
> =A0LICENSE =3D "XFree86"
> =A0DEPENDS =3D "libxcb xproto xextproto libxau xtrans libxdmcp xcmiscprot=
o xf86bigfontproto kbproto inputproto bigreqsproto util-macros"
> =A0PROVIDES =3D "virtual/libx11"
> -RPROVIDES =3D "virtual-libx11"
> +RPROVIDES_${PN} =3D "virtual-libx11"
> =A0SRCREV =3D "c3f3e4a9e531d010312c97e753d6e543e607094d"
> =A0PV =3D "1.3.3+git"
> =A0PR =3D "r3"
> diff --git a/recipes/xorg-lib/libxscrnsaver_1.1.2.bb b/recipes/xorg-lib/l=
ibxscrnsaver_1.1.2.bb
> index 0b97380..437105a 100644
> --- a/recipes/xorg-lib/libxscrnsaver_1.1.2.bb
> +++ b/recipes/xorg-lib/libxscrnsaver_1.1.2.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "X Screen Saver extension library"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS +=3D "libxext scrnsaverproto"
> =A0PROVIDES =3D "libxss"
> -RREPLACES =3D "libxss"
> +RREPLACES_${PN} =3D "libxss"
> =A0PR =3D "r1"
> =A0PE =3D "1"
>
> diff --git a/recipes/xorg-lib/libxscrnsaver_1.1.3.bb b/recipes/xorg-lib/l=
ibxscrnsaver_1.1.3.bb
> index 442bb74..e63c75e 100644
> --- a/recipes/xorg-lib/libxscrnsaver_1.1.3.bb
> +++ b/recipes/xorg-lib/libxscrnsaver_1.1.3.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "X Screen Saver extension library"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS +=3D "libxext scrnsaverproto"
> =A0PROVIDES =3D "libxss"
> -RREPLACES =3D "libxss"
> +RREPLACES_${PN} =3D "libxss"
> =A0PR =3D "r1"
> =A0PE =3D "1"
>
> diff --git a/recipes/xorg-lib/libxscrnsaver_1.2.0.bb b/recipes/xorg-lib/l=
ibxscrnsaver_1.2.0.bb
> index 47759c2..11462e8 100644
> --- a/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
> +++ b/recipes/xorg-lib/libxscrnsaver_1.2.0.bb
> @@ -4,7 +4,7 @@ DESCRIPTION =3D "X Screen Saver extension library"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS +=3D "libxext scrnsaverproto"
> =A0PROVIDES =3D "libxss"
> -RREPLACES =3D "libxss"
> +RREPLACES_${PN} =3D "libxss"
> =A0PR =3D "r1"
> =A0PE =3D "1"
>
> diff --git a/recipes/zsafe/zsafe_2.1.3.bb b/recipes/zsafe/zsafe_2.1.3.bb
> index fcbfe1f..c25acba 100644
> --- a/recipes/zsafe/zsafe_2.1.3.bb
> +++ b/recipes/zsafe/zsafe_2.1.3.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Password manager"
> =A0SECTION =3D "opie/applications"
> =A0PRIORITY =A0 =A0=3D "optional"
> =A0LICENSE =A0 =A0 =3D "GPL"
> -RCONFLICTS =A0=3D "opie-zsafe"
> +RCONFLICTS_${PN} =A0=3D "opie-zsafe"
> =A0APPNAME =A0 =A0 =3D "zsafe"
> =A0APPTYPE =A0 =A0 =3D "binary"
> =A0APPDESKTOP =A0=3D "${WORKDIR}"
> diff --git a/recipes/zten/zten_1.6.2.bb b/recipes/zten/zten_1.6.2.bb
> index 6be6309..3f9dcdb 100644
> --- a/recipes/zten/zten_1.6.2.bb
> +++ b/recipes/zten/zten_1.6.2.bb
> @@ -6,7 +6,7 @@ PRIORITY =3D "optional"
> =A0LICENSE =3D "GPL"
> =A0DEPENDS =3D "eb kakasi"
> =A0RDEPENDS_${PN} =3D "virtual-japanese-font"
> -RCONFLICTS =3D "ztenv"
> +RCONFLICTS_${PN} =3D "ztenv"
> =A0PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.gohome.org/cgi-bin/viewcvs.cgi/zten.tar.gz;md5=
sum=3Dd24f03c8df5c98d510590bd9a63dc932 \
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


