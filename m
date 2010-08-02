Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Og1Uc-0002Pj-AQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 02 Aug 2010 22:20:17 +0200
Received: by eyf5 with SMTP id 5so1465502eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Aug 2010 13:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=GWjI+eNOCk5SsI3CeTYlUxAiW+zhqE/6gIucr/getbw=;
	b=rwratw4M6HVrXS3o3httKACFmTvo9ApghUzluyYJQ2/xMgoBiR+VQi/YBSowM1iTc0
	/vnftOdnAcu5P+t49YAKmKCVtp+2+kMVbOAeVBm/7gWSUxSmcnvEs/ZIKbI1btKYh8GL
	ivI1mR1XZyAgOozgj4yI9VxBDE1XuTcD8sH1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pj5OHFVSxWJ2134rk95RnIEp853Pze5XfGsnRPPU61fd8gGHdtyDL/660nUdGuuDlC
	nDHlhYNuFNTJ+7Oqakr+7WFsK22aMNRcppmNI7c/GrpP6QbTD1emYlgdKJoASYn4kI8F
	k8zpG7K3eNsHKSHked3g9QxmyWTDe+SpnJ1Tg=
Received: by 10.213.32.17 with SMTP id a17mr4684116ebd.11.1280780390872;
	Mon, 02 Aug 2010 13:19:50 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id a48sm9440189eei.6.2010.08.02.13.19.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 02 Aug 2010 13:19:49 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  2 Aug 2010 22:19:42 +0200
Message-Id: <1280780382-11697-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Scanned: No (on linuxtogo.org);
	Message bigger than SAmaxbody (256000)
Subject: [PATCH] 500+ recipes: remove do_stage
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
X-List-Received-Date: Mon, 02 Aug 2010 20:20:17 -0000

This patch removes all occurrences of
do_stage() {
        autotools_stage_all
}
including all kind of variants w.r.t whitespace

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

I know this is a massive change, hence the request for review.
The changes are executed by running the following perl program:

#!/usr/bin/perl -pi
#multi-line in place substitute - subs.pl
use strict;
use warnings;

BEGIN {undef $/;}

s/\n\s*do_stage\s*\(\s*\)\s*\n*\s*{\s*\n*\s*autotools_stage_all\s*\n*\s*}\s*\n*/\n\n/smg;

After that the patches have been visually inspected to verify that indeed nothing undesired got deleted.

Actually there is one recipe I have some doubts about:
recipes/freetype/freetype-native_2.1.10.bb
This one has an empty do_install().
However there are various newer recipes for freetype-native, so I suggest to remove that recipe 
altogether.

No full warranty: testing this fully would probably mean doing something like
bitbake world but some people keep telling me that is not a good plan.

If someone has a good test case, feel free to run it.
Otherwise my proposal would be to apply it, and if there are a 
few recipes broken after that, accept is as collateral damage and fix 
it afterwards.

BTW: there are also a few recipes that have 
fakeroot do_stage() {
        autotools_stage_all
}
These are left untouched for now.

Furthermore there are two files that matched the pattern but 
are not added:
 recipes/sane/sane-backends_1.0.19.bb
 recipes/sane/sane-backends_1.0.20.bb
These contain a line > 998 chars, and git send-email refuses to send these

Frans

 recipes/alp/hiker_0.9.1.bb                         |    5 -----
 recipes/alp/hiker_0.9.bb                           |    5 -----
 recipes/anthy/anthy_9100e.bb                       |    4 ----
 recipes/apr/apr-util_0.9.12.bb                     |    4 ----
 recipes/apr/apr-util_1.2.12.bb                     |    4 ----
 recipes/apr/apr-util_1.2.7.bb                      |    4 ----
 recipes/apr/apr_0.9.12.bb                          |    4 ----
 recipes/argp-standalone/argp-standalone_1.3.bb     |    4 ----
 recipes/asterisk/asterisk_1.4.23.1.bb              |    4 ----
 recipes/atk/atk.inc                                |    3 ---
 recipes/atk/atk_1.26.0.bb                          |    6 ------
 recipes/avahi/avahi.inc                            |    3 ---
 recipes/beecrypt/beecrypt_3.1.0.bb                 |    5 -----
 recipes/boxee/tre_0.7.5.bb                         |    4 ----
 recipes/cairo/cairo_1.2.4.bb                       |    4 ----
 recipes/cairo/cairo_git.bb                         |    3 ---
 recipes/cairo/libsvg-cairo_0.1.5.bb                |    4 ----
 recipes/cairo/libsvg-cairo_0.1.6.bb                |    4 ----
 recipes/cairo/libsvg-cairo_20050601.bb             |    3 ---
 recipes/cairo/libsvg-cairo_cvs.bb                  |    3 ---
 recipes/cairo/libsvg_0.1.4.bb                      |    4 ----
 recipes/cairo/libsvg_cvs.bb                        |    3 ---
 recipes/cairo/xsvg_cvs.bb                          |    3 ---
 recipes/cdk/cdk_5.0-20060507.bb                    |    5 -----
 recipes/clucene/clucene-core_0.9.21b.bb            |    4 ----
 recipes/clutter/aaina.inc                          |    4 ----
 recipes/clutter/clutter-cairo.inc                  |    4 ----
 recipes/clutter/clutter-gst.inc                    |    4 ----
 recipes/clutter/clutter.inc                        |    3 ---
 recipes/clutter/tidy.inc                           |    3 ---
 recipes/confuse/confuse_2.5.bb                     |    5 -----
 recipes/dbh/dbh_1.0-18.bb                          |    4 ----
 recipes/dbus/dbus-c++-native_git.bb                |    4 ----
 recipes/devhelp/devhelp_0.23.bb                    |    4 ----
 recipes/dfu-util/dfu-util_svn.bb                   |    3 ---
 recipes/directfb/++dfb_1.0.0.bb                    |    4 ----
 recipes/directfb/directfb-examples_1.0.0.bb        |    6 ------
 recipes/directfb/directfb-examples_1.2.0.bb        |    6 ------
 recipes/directfb/directfb.inc                      |    4 ----
 recipes/directfb/fusionsound_1.1.0+git20070709.bb  |    4 ----
 recipes/directfb/lite_0.9.26+cvs20070207.bb        |    4 ----
 recipes/djvulibre/djvulibre_3.5.20.bb              |    4 ----
 recipes/djvulibre/djvulibre_3.5.21.bb              |    4 ----
 recipes/eb/eb_4.3.2.bb                             |    4 ----
 recipes/eel/eel_2.12.2.bb                          |    5 -----
 recipes/eel/eel_2.22.2.bb                          |    4 ----
 recipes/eel/eel_2.24.1.bb                          |    4 ----
 recipes/eel/eel_2.26.0.bb                          |    4 ----
 recipes/ekiga/opal_3.4.4.bb                        |    5 -----
 recipes/ekiga/opal_3.5.2.bb                        |    5 -----
 recipes/ekiga/opal_3.6.1.bb                        |    5 -----
 recipes/ekiga/opal_3.6.2.bb                        |    5 -----
 recipes/ekiga/opal_3.6.4.bb                        |    5 -----
 recipes/ekiga/opal_3.6.6.bb                        |    5 -----
 recipes/ekiga/ptlib_2.4.4.bb                       |    8 --------
 recipes/ekiga/ptlib_2.5.2.bb                       |    8 --------
 recipes/ekiga/ptlib_2.6.1.bb                       |    8 --------
 recipes/ekiga/ptlib_2.6.2.bb                       |    8 --------
 recipes/ekiga/ptlib_2.6.4.bb                       |    8 --------
 recipes/elfutils/elfutils_0.127.bb                 |    6 ------
 recipes/elfutils/elfutils_0.131.bb                 |    6 ------
 recipes/enca/enca_1.9.bb                           |    4 ----
 recipes/enchant/enchant_1.3.0.bb                   |    4 ----
 recipes/esound/esound_0.2.36.bb                    |    5 -----
 recipes/eventlog/eventlog_0.2.5.bb                 |    4 ----
 recipes/evince/evince_2.28.0.bb                    |    4 ----
 recipes/farsight/farsight_0.1.5.bb                 |    7 -------
 recipes/farsight/gst-plugins-farsight_0.10.1.bb    |    7 -------
 recipes/fceu/fceu_0.98.13-pre.bb                   |    4 ----
 recipes/fftw/benchfft_3.1.bb                       |    5 -----
 recipes/fftw/fftw.inc                              |    5 -----
 recipes/fltk/efltk_2.0.7.bb                        |    4 ----
 recipes/fltk/fltk_1.1.7.bb                         |    4 ----
 recipes/fluidsynth/fluidsynth_1.0.8.bb             |    5 -----
 recipes/freesmartphone/libframeworkd-glib_git.bb   |    4 ----
 recipes/freetype/freetype-native_2.1.10.bb         |    4 ----
 recipes/fs/fs_cvs.bb                               |    3 ---
 recipes/g15daemon/g15daemon_1.2.6a.bb              |    5 -----
 recipes/gamin/gamin_0.1.10.bb                      |    4 ----
 recipes/gamin/gamin_0.1.8.bb                       |    4 ----
 recipes/gammu/gammu_1.26.1.bb                      |    4 ----
 recipes/gdal/gdal_1.3.2.bb                         |    5 -----
 recipes/geda/libgeda_1.4.3.bb                      |    4 ----
 recipes/ggz/libggz_0.0.14.1.bb                     |    6 ------
 recipes/gimp/babl_svn.bb                           |    5 -----
 recipes/gimp/gimp.inc                              |    5 -----
 recipes/gloox/gloox_0.8.1.bb                       |    4 ----
 recipes/gloox/gloox_0.8.9.bb                       |    4 ----
 recipes/gmp/gmp.inc                                |    3 ---
 recipes/gnet/gnet_cvs.bb                           |    3 ---
 recipes/gnome/gnome-python-extras_2.25.3.bb        |    3 ---
 recipes/gnome/gnome-python_2.22.1.bb               |    4 ----
 recipes/gnome/gnome-python_2.26.1.bb               |    4 ----
 recipes/gnome/gnome-session_2.24.1.bb              |    4 ----
 recipes/gnome/gnome-session_2.28.0.bb              |    4 ----
 recipes/gnome/gnome-settings-daemon_2.24.0.bb      |    5 -----
 recipes/gnome/gnome-terminal_2.26.2.bb             |    6 ------
 recipes/gnome/gnome-terminal_2.28.0.bb             |    6 ------
 recipes/gnome/gnome-utils_2.28.0.bb                |    4 ----
 recipes/gnome/gnome-vfs_2.22.0.bb                  |    4 ----
 recipes/gnome/gnome-vfs_2.24.1.bb                  |    4 ----
 recipes/gnome/goffice_0.6.3.bb                     |    4 ----
 recipes/gnome/goffice_0.7.14.bb                    |    4 ----
 recipes/gnome/gvfs_0.0.2.bb                        |    4 ----
 recipes/gnome/gvfs_1.0.1.bb                        |    4 ----
 recipes/gnome/gvfs_1.0.3.bb                        |    4 ----
 recipes/gnome/gvfs_1.2.1.bb                        |    4 ----
 recipes/gnome/gvfs_1.3.3.bb                        |    4 ----
 recipes/gnome/hippo-canvas_0.3.0.bb                |    3 ---
 recipes/gnome/libbacon_svn.bb                      |    7 -------
 recipes/gnome/libgail-gnome_1.20.1.bb              |    4 ----
 recipes/gnome/libgnome_2.12.0.1.bb                 |    4 ----
 recipes/gnome/libgnome_2.14.1.bb                   |    4 ----
 recipes/gnome/libgnome_2.16.0.bb                   |    4 ----
 recipes/gnome/libgnome_2.18.0.bb                   |    4 ----
 recipes/gnome/libgnome_2.24.0.bb                   |    4 ----
 recipes/gnome/libgnome_2.28.0.bb                   |    4 ----
 recipes/gnome/libgnomecanvas_2.14.0.bb             |    4 ----
 recipes/gnome/libgnomecanvas_2.20.0.bb             |    4 ----
 recipes/gnome/libgnomecanvas_2.26.0.bb             |    4 ----
 recipes/gnome/libgnomecups_0.2.2.bb                |    5 -----
 recipes/gnome/libgnomecups_0.2.3.bb                |    5 -----
 recipes/gnome/libgnomekbd_2.24.0.bb                |    8 --------
 recipes/gnome/libgnomekbd_2.28.0.bb                |    8 --------
 recipes/gnome/libgnomeprint_2.18.5.bb              |    4 ----
 recipes/gnome/libgnomeprintui_2.18.3.bb            |    4 ----
 recipes/gnome/libgnomeui_2.12.0.bb                 |    4 ----
 recipes/gnome/libgnomeui_2.15.2.bb                 |    4 ----
 recipes/gnome/libgnomeui_2.16.1.bb                 |    4 ----
 recipes/gnome/libgsf_1.13.2.bb                     |    5 -----
 recipes/gnome/libgsf_1.13.3.bb                     |    5 -----
 recipes/gnome/libgsf_1.14.16.bb                    |    4 ----
 recipes/gnome/libgsf_1.14.8.bb                     |    4 ----
 recipes/gnome/libgtop_2.23.4.bb                    |    4 ----
 recipes/gnome/libgtop_2.24.0.bb                    |    4 ----
 recipes/gnome/libgweather_2.22.3.bb                |    4 ----
 recipes/gnome/libgweather_2.24.0.bb                |    4 ----
 recipes/gnome/libgweather_2.26.0.bb                |    4 ----
 recipes/gnome/libgweather_2.26.2.1.bb              |    4 ----
 recipes/gnome/libgweather_2.28.0.bb                |    4 ----
 recipes/gnome/liboobs_2.22.0.bb                    |    4 ----
 recipes/gnome/libsoup-2.4_2.24.3.bb                |    4 ----
 recipes/gnome/libsoup-2.4_2.26.2.bb                |    4 ----
 recipes/gnome/libsoup-2.4_2.27.91.bb               |    4 ----
 recipes/gnome/libsoup-2.4_2.4.1.bb                 |    4 ----
 recipes/gnome/libsoup_2.2.100.bb                   |    4 ----
 recipes/gnome/libwnck_2.13.5.bb                    |    4 ----
 recipes/gnome/libwnck_2.23.6.bb                    |    4 ----
 recipes/gnome/libwnck_2.24.0.bb                    |    4 ----
 recipes/gnome/libwnck_2.28.0.bb                    |    4 ----
 recipes/gnome/libxklavier_3.7.bb                   |    5 -----
 recipes/gnome/metacity_2.24.0.bb                   |    4 ----
 recipes/gnutls/libtasn1_1.7.bb                     |    5 -----
 recipes/gpephone/libabenabler2_1.0.bb              |    4 ----
 recipes/gpephone/libabenabler2_svn.bb              |    4 ----
 recipes/gpephone/libabenabler_0.1.bb               |    4 ----
 recipes/gpephone/libabenabler_1.0.bb               |    4 ----
 recipes/gpephone/libabenabler_svn.bb               |    3 ---
 recipes/gpephone/libalmmgr_svn.bb                  |    3 ---
 recipes/gpephone/libcalenabler2_svn.bb             |    4 ----
 recipes/gpephone/libcalenabler_1.0.bb              |    4 ----
 recipes/gpephone/libchenabler_0.1.bb               |    4 ----
 recipes/gpephone/libgemwidget_0.1.bb               |    4 ----
 recipes/gpephone/libgemwidget_1.0.bb               |    4 ----
 recipes/gpephone/libgemwidget_svn.bb               |    3 ---
 recipes/gpephone/libgpephone_0.3.bb                |    4 ----
 recipes/gpephone/libgpephone_0.4.bb                |    4 ----
 recipes/gpephone/libgpephone_svn.bb                |    3 ---
 recipes/gpephone/libiac2_svn.bb                    |    3 ---
 recipes/gpephone/libiac_0.1.bb                     |    4 ----
 recipes/gpephone/libiac_1.0.bb                     |    4 ----
 recipes/gpephone/libiac_svn.bb                     |    3 ---
 recipes/gpephone/libidn_0.5.19.bb                  |    4 ----
 recipes/gpephone/libim2_svn.bb                     |    3 ---
 recipes/gpephone/libim_0.2.bb                      |    4 ----
 recipes/gpephone/liblipsevent2_svn.bb              |    3 ---
 recipes/gpephone/liblipsevent_0.1.bb               |    4 ----
 recipes/gpephone/libmsgenabler2_svn.bb             |    3 ---
 recipes/gpephone/libmsgenabler_1.0.bb              |    4 ----
 recipes/gpephone/libmsgenabler_svn.bb              |    3 ---
 recipes/gpephone/librecord2_0.1.bb                 |    4 ----
 recipes/gpephone/librecord2_svn.bb                 |    3 ---
 recipes/gpephone/librecord_0.1.bb                  |    4 ----
 recipes/gpephone/librecord_1.0.bb                  |    4 ----
 recipes/gpephone/libsettings_0.3.bb                |    4 ----
 recipes/gpephone/libsettings_svn.bb                |    3 ---
 recipes/gpephone/libtapi_svn.bb                    |    3 ---
 recipes/gpephone/libvoc_svn.bb                     |    3 ---
 recipes/gpephone/libvocenabler_0.1.bb              |    4 ----
 recipes/gpephone/ptim-engine_1.0.bb                |    4 ----
 recipes/gpephone/ptim-engine_svn.bb                |    3 ---
 recipes/gpephone/ptim-headers_1.0.bb               |    4 ----
 recipes/gpephone/ptim-headers_svn.bb               |    3 ---
 recipes/gpephone/ptim-helper_1.0.bb                |    4 ----
 recipes/gpephone/ptim-helper_svn.bb                |    3 ---
 recipes/gpephone/ptim-manager_1.0.bb               |    5 -----
 recipes/gpephone/ptim-manager_svn.bb               |    5 -----
 recipes/gphoto2/libgphoto2_2.4.2.bb                |    6 ------
 recipes/gphoto2/libgphoto2_2.4.4.bb                |    6 ------
 recipes/gpstk/gpstk_1.2.bb                         |    5 -----
 recipes/granule/libassa_3.5.0.bb                   |    4 ----
 recipes/grift/ginspector_20050529.bb               |    4 ----
 recipes/grift/glrr-widgets_20050529.bb             |    5 -----
 recipes/grift/glrr_20050529.bb                     |    5 -----
 recipes/gsm/gsmd.inc                               |    4 ----
 recipes/gsoap/gsoap-native_2.7.7.bb                |    4 ----
 recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb              |    4 ----
 recipes/gtksourceview/gtksourceview1_1.7.2.bb      |    4 ----
 recipes/gtksourceview/gtksourceview2_2.6.0.bb      |    4 ----
 recipes/gtksourceview/gtksourceview2_2.7.3.bb      |    4 ----
 recipes/guichan/guichan_0.7.1.bb                   |    5 -----
 recipes/gutenprint/ijs_0.35.bb                     |    6 ------
 recipes/gypsy/gypsy.inc                            |    5 -----
 recipes/hal/consolekit_0.3.0.bb                    |    4 ----
 recipes/icon-slicer/icon-slicer-native_0.3.bb      |    7 -------
 recipes/icu/icu_3.6.bb                             |    4 ----
 recipes/id3lib/id3lib_3.8.3.bb                     |    4 ----
 recipes/iksemel/iksemel_1.2.bb                     |    4 ----
 recipes/jaaa/jaaa_0.4.2.bb                         |    4 ----
 recipes/jack/jack_0.103.0.bb                       |    5 -----
 recipes/jpeg/jasper_1.900.1.bb                     |    3 ---
 recipes/kde4/gmm_3.0.bb                            |    4 ----
 recipes/kde4/kde4.inc                              |    4 +---
 recipes/kde4/strigi_0.5.10.bb                      |    5 -----
 recipes/lcms/lcms_1.17.bb                          |    4 ----
 recipes/lesstif/lesstif_0.95.0.bb                  |    4 ----
 recipes/libao/libao_0.8.8.bb                       |    6 ------
 recipes/libcdaudio/libcdaudio_0.99.12p2.bb         |    4 ----
 recipes/libconfig/libconfig_1.3.1.bb               |    4 ----
 recipes/libconfig/libconfig_1.3.2.bb               |    4 ----
 recipes/libcontactsdb/libcontactsdb_0.1.bb         |    4 ----
 recipes/libcontactsdb/libcontactsdb_0.3.bb         |    4 ----
 recipes/libcontactsdb/libcontactsdb_0.4.bb         |    4 ----
 recipes/libcontactsdb/libcontactsdb_0.5.bb         |    4 ----
 recipes/libcwd/libcwd_0.99.47.bb                   |    4 ----
 recipes/libdvdnav/libdvdnav_0.1.10.bb              |    4 ----
 recipes/libdvdread/libdvdread_0.9.6.bb             |    5 -----
 recipes/libdvdread/libdvdread_0.9.7.bb             |    5 -----
 recipes/libeina/libeina_0.96.5.bb                  |    4 ----
 recipes/libeina/libeina_0.96.7.bb                  |    5 -----
 recipes/libesmtp/libesmtp_1.0.4.bb                 |    4 ----
 recipes/libetpan/libetpan_0.46.bb                  |    4 ----
 recipes/libetpan/libetpan_0.48.bb                  |    4 ----
 recipes/libetpan/libetpan_0.57.bb                  |    4 ----
 recipes/libevent/libevent_1.1a.bb                  |    5 -----
 recipes/libeventdb/libeventdb.inc                  |    3 ---
 recipes/libexif/libexif_0.6.13.bb                  |    4 ----
 recipes/libexosip2/libexosip2_2.2.3.bb             |    4 ----
 recipes/libexosip2/libexosip2_3.1.0.bb             |    4 ----
 recipes/libftdi/libftdi_0.13.bb                    |    4 ----
 recipes/libftdi/libftdi_0.9.bb                     |    4 ----
 recipes/libg15/libg15_1.2.1.bb                     |    5 -----
 recipes/libg15render/libg15render_1.2.bb           |    5 -----
 recipes/libgdbus/libgdbus_git.bb                   |    3 ---
 recipes/libgpelaunch/libgpelaunch_0.14.bb          |    4 ----
 recipes/libgpelaunch/libgpelaunch_svn.bb           |    4 ----
 recipes/libgpeplugin/libgpeplugin_svn.bb           |    4 ----
 recipes/libgpevtype/libgpevtype_0.16.bb            |    5 -----
 recipes/libgpevtype/libgpevtype_0.17.bb            |    7 -------
 recipes/libgpevtype/libgpevtype_0.50.bb            |    7 -------
 recipes/libgpevtype/libgpevtype_svn.bb             |    5 -----
 recipes/libgpewidget/libgpewidget_0.114.bb         |    4 ----
 recipes/libgpewidget/libgpewidget_0.115.bb         |    4 ----
 recipes/libgpewidget/libgpewidget_0.117.bb         |    4 ----
 recipes/libgpewidget/libgpewidget_svn.bb           |    4 ----
 recipes/libgphoto2/libgphoto2_2.4.0.bb             |    6 ------
 recipes/libhal-nm/libhal-nm_0.0.2.bb               |    4 ----
 recipes/libhandoff/libhandoff_0.1.bb               |    4 ----
 recipes/libhandoff/libhandoff_svn.bb               |    3 ---
 recipes/libhangul/libhangul_0.0.4.bb               |    4 ----
 recipes/libical/libical_0.27.bb                    |    4 ----
 recipes/libical/libical_0.44.bb                    |    4 ----
 recipes/libid3/libid3_1.1.bb                       |    5 -----
 recipes/libidl/libidl.inc                          |    4 ----
 recipes/libmimedir/libmimedir_0.3.1.bb             |    5 -----
 recipes/libmimedir/libmimedir_0.4.2.bb             |    5 -----
 recipes/libmimedir/libmimedir_svn.bb               |    4 ----
 recipes/libmpcdec/libmpcdec_1.2.6.bb               |    4 ----
 recipes/libmrss/libmrss.inc                        |    3 ---
 recipes/libnetfilter/libnetfilter-queue.inc        |    4 ----
 recipes/libnotify/libnotify_0.4.4.bb               |    4 ----
 recipes/libnotify/libnotify_0.4.5.bb               |    4 ----
 recipes/liboil/liboil_0.3.10.bb                    |    4 ----
 recipes/liboil/liboil_0.3.11.bb                    |    4 ----
 recipes/liboil/liboil_0.3.14.bb                    |    4 ----
 recipes/liboil/liboil_0.3.9.bb                     |    4 ----
 recipes/libosip2/libosip2_3.1.0.bb                 |    4 ----
 recipes/librfid/librfid_svn.bb                     |    3 ---
 recipes/librsvg/librsvg_2.11.1.bb                  |    4 ----
 recipes/librsvg/librsvg_2.16.1.bb                  |    4 ----
 recipes/librsvg/librsvg_2.22.2.bb                  |    4 ----
 recipes/librsvg/librsvg_2.26.0.bb                  |    4 ----
 recipes/libschedule/libschedule_0.15.bb            |    6 ------
 recipes/libschedule/libschedule_0.16.bb            |    4 ----
 recipes/libschedule/libschedule_0.17.bb            |    4 ----
 recipes/libschedule/libschedule_svn.bb             |    4 ----
 recipes/libsdl/libsdl-gfx_2.0.17.bb                |    5 -----
 recipes/libsdl/libsdl-image_1.2.3.bb               |    5 -----
 recipes/libsdl/libsdl-net_1.2.7.bb                 |    5 -----
 recipes/libsdl/libsdl-ttf_2.0.3.bb                 |    4 ----
 recipes/libserial/libserial_0.5.2.bb               |    5 -----
 recipes/libsexy/libsexy.inc                        |    5 -----
 recipes/libshout/libshout.inc                      |    3 ---
 recipes/libsmi/libsmi_0.4.8.bb                     |    5 -----
 recipes/libsoundgen/libsoundgen_0.5.bb             |    6 ------
 recipes/libsoundgen/libsoundgen_0.6.bb             |    6 ------
 recipes/libspiff/libspiff_0.8.2.bb                 |    5 -----
 recipes/libstroke/libstroke_0.5.1.bb               |    4 ----
 recipes/libtheora/libtheora_0.9+1.0alpha7.bb       |    6 ------
 recipes/libtododb/libtododb_0.11.bb                |    5 -----
 recipes/liburiparser/liburiparser_0.5.1.bb         |    5 -----
 recipes/libvisual/libvisual_0.4.0.bb               |    4 ----
 recipes/libw100/libw100_0.0.2.bb                   |    4 ----
 recipes/libw100/libw100_svn.bb                     |    4 ----
 recipes/libwpd/libwpd_0.8.14.bb                    |    4 ----
 recipes/libwpd/libwpd_0.8.4.bb                     |    5 -----
 recipes/libwpd/libwpd_0.8.6.bb                     |    5 -----
 recipes/libxine/libxine.inc                        |    4 ----
 recipes/libxosd/libxosd_svn.bb                     |    4 ----
 recipes/libzvbi/libzvbi_0.2.22.bb                  |    6 ------
 recipes/libzvbi/libzvbi_0.2.25.bb                  |    5 -----
 .../lightmediascanner/lightmediascanner_0.2.0.0.bb |    4 ----
 recipes/log4cxx/log4cxx_0.9.7.bb                   |    4 ----
 recipes/loudmouth/loudmouth_1.0.1.bb               |    4 ----
 recipes/loudmouth/loudmouth_1.1.1.bb               |    4 ----
 recipes/loudmouth/loudmouth_1.2.2.bb               |    4 ----
 recipes/loudmouth/loudmouth_1.3.2.bb               |    4 ----
 recipes/lxde/menu-cache_0.2.2.bb                   |    4 ----
 recipes/maemo/xpext_1.0-5.bb                       |    4 ----
 recipes/maemo/xsp_1.0.0-8.bb                       |    4 ----
 recipes/maemo4/hildon-control-panel_2.0.1.bb       |    4 ----
 recipes/maemo4/hildon-thumbnail.inc                |    5 -----
 recipes/maemo4/libconic_0.13.bb                    |    6 ------
 recipes/maemo4/libhildon.inc                       |    4 ----
 recipes/maemo4/libhildonhelp.inc                   |    5 -----
 recipes/maemo4/libhildonmime.inc                   |    5 -----
 recipes/maemo4/libosso-gsf_1.11.10.4.bb            |    6 ------
 recipes/maemo4/libosso-help_2.1.2.bb               |    6 ------
 recipes/maemo4/libosso.inc                         |    5 -----
 recipes/maemo4/osso-gwconnect.inc                  |    5 -----
 recipes/maemo4/osso-ic-oss_1.0.4.bb                |    6 ------
 recipes/mesa/freeglut_2.4.0.bb                     |    6 ------
 recipes/minisip/libmikey_svn.bb                    |    4 ----
 recipes/minisip/libmnetutil_svn.bb                 |    3 ---
 recipes/minisip/libmsip_svn.bb                     |    3 ---
 recipes/minisip/libmutil0_svn.bb                   |    3 ---
 recipes/mml-widget/gtkmathview_0.7.6.bb            |    5 -----
 recipes/mpfr/mpfr_2.1.1.bb                         |    4 ----
 recipes/mpfr/mpfr_2.3.1.bb                         |    4 ----
 recipes/mpfr/mpfr_2.3.2.bb                         |    4 ----
 recipes/mpfr/mpfr_svn.bb                           |    3 ---
 recipes/musicbrainz/libmusicbrainz.inc             |    4 ----
 recipes/musicbrainz/libmusicbrainz_2.1.5.bb        |    4 ----
 recipes/mythtv/gmyth-upnp_0.7.0.bb                 |    5 -----
 recipes/mythtv/gmyth_0.7.1.bb                      |    5 -----
 recipes/nautilus/nautilus-cd-burner_2.24.0.bb      |    4 ----
 recipes/nautilus/nautilus_2.12.2.bb                |    4 ----
 recipes/nautilus/nautilus_2.22.5.bb                |    4 ----
 recipes/nautilus/nautilus_2.24.1.bb                |    4 ----
 recipes/nautilus/nautilus_2.24.2.bb                |    4 ----
 recipes/nautilus/nautilus_2.26.1.bb                |    4 ----
 recipes/nautilus/nautilus_2.28.0.bb                |    4 ----
 recipes/nautilus/nautilus_2.28.1.bb                |    4 ----
 recipes/neon/neon_0.25.5.bb                        |    4 ----
 recipes/neon/neon_0.26.0.bb                        |    4 ----
 recipes/networkmanager/networkmanager-0.7.inc      |    4 ----
 recipes/networkmanager/networkmanager-pre0.7.inc   |    4 ----
 recipes/networkmanager/networkmanager.inc          |    4 ----
 recipes/nxcl/libnxcl_0.9.bb                        |    4 ----
 recipes/obexftp/obexftp_0.20.bb                    |    5 -----
 recipes/obexftp/obexftp_0.22.bb                    |    5 -----
 recipes/octave/octave.inc                          |    3 ---
 recipes/openal/openal_0.0.8.bb                     |    4 ----
 recipes/openbabel/openbabel_2.2.0.bb               |    4 ----
 recipes/openchrome/openchrome.inc                  |    3 ---
 recipes/opencv/opencv_1.0.0.bb                     |    5 -----
 recipes/openmax/gst-openmax_0.10.0.4.bb            |    4 ----
 recipes/openmax/libomxil-bellagio_0.9.0.bb         |    5 -----
 recipes/openmoko-base/openmoko-libs_svn.bb         |    4 ----
 recipes/openmoko2/libmokogsmd2_svn.bb              |    4 ----
 recipes/openmoko2/libmokojournal2_svn.bb           |    4 ----
 recipes/openmoko2/libmokopanelui2_svn.bb           |    3 ---
 recipes/openmoko2/libmokoui2_svn.bb                |    3 ---
 recipes/openobex/openobex_1.3.bb                   |    4 ----
 recipes/openrdate/openrdate_1.1.3.bb               |    4 ----
 recipes/opensync/libopensync_0.18.bb               |    5 -----
 recipes/opensync/libopensync_0.20.bb               |    5 -----
 recipes/opensync/libopensync_0.22.bb               |    5 -----
 recipes/opensync/libopensync_0.36.bb               |    4 ----
 recipes/opensync/libopensync_svn.bb                |    4 ----
 recipes/opensync/libsyncml_0.4.6.bb                |    4 ----
 recipes/opensync/libsyncml_svn.bb                  |    4 ----
 recipes/opensync/syncml-client_0.1.bb              |    3 ---
 recipes/opensync/wbxml2_0.9.2.bb                   |    4 ----
 recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb       |    3 ---
 recipes/ortp/ortp.inc                              |    3 ---
 recipes/owfs/owfs_2.7p28.bb                        |    3 ---
 recipes/packagekit/packagekit_0.2.4.bb             |    4 ----
 recipes/pam/libpam_0.79.bb                         |    4 ----
 recipes/pam/libpam_1.0.2.bb                        |    4 ----
 recipes/pango/pango.inc                            |    4 ----
 recipes/pango/pango_1.10.2.bb                      |    4 ----
 recipes/pango/pango_1.14.8.bb                      |    4 ----
 recipes/pango/pangomm_2.14.0.bb                    |    4 ----
 recipes/pcsc-lite/pcsc-lite_1.4.102.bb             |    4 ----
 recipes/policykit/policykit-gnome_0.9.2.bb         |    4 ----
 recipes/poppler/poppler.inc                        |    4 ----
 recipes/portaudio/portaudio-v19_svn.bb             |    4 ----
 recipes/proj4/proj-4.inc                           |    4 ----
 recipes/pulseaudio/libcanberra_0.12.bb             |    4 ----
 recipes/pulseaudio/pulseaudio.inc                  |    4 ----
 recipes/python/python-gst_0.10.10.bb               |    4 ----
 recipes/python/python-gst_0.10.17.bb               |    4 ----
 recipes/qof/qof_0.6.0.bb                           |    4 ----
 recipes/qof/qof_0.7.2.bb                           |    4 ----
 recipes/raw-tools/gtkimageview_1.3.0.bb            |    6 ------
 recipes/rrdtool/rrdtool_1.0.49.bb                  |    4 ----
 recipes/scw/scw_0.4.3.bb                           |    4 ----
 recipes/sdlpango/sdlpango_0.1.2.bb                 |    4 ----
 recipes/sofia-sip/sofia-sip.inc                    |    3 ---
 recipes/spandsp/spandsp.inc                        |    4 ----
 recipes/speex/speex_1.2.bb                         |    4 ----
 recipes/sphinx-speech/sphinxbase_0.1.bb            |    4 ----
 recipes/sphinx-speech/sphinxbase_0.3.bb            |    4 ----
 .../startup-notification_0.5.bb                    |    4 ----
 .../startup-notification_0.8.bb                    |    4 ----
 .../startup-notification_0.9.bb                    |    4 ----
 recipes/subversion/subversion_1.4.3.bb             |    4 ----
 recipes/subversion/subversion_1.6.5.bb             |    4 ----
 recipes/sugar/sugar-artwork_0.82.0.bb              |    5 -----
 recipes/sugar/sugar-artwork_0.84.1.bb              |    5 -----
 recipes/sugar/sugar-base_0.82.2.bb                 |    5 -----
 recipes/sugar/sugar-base_0.83.2.bb                 |    5 -----
 recipes/sugar/sugar-base_0.84.1.bb                 |    5 -----
 recipes/sugar/sugar-datastore_0.82.0.bb            |    5 -----
 recipes/sugar/sugar-datastore_0.84.0.bb            |    5 -----
 recipes/sugar/sugar-presence-service_0.82.2.bb     |    5 -----
 recipes/sugar/sugar-presence-service_0.84.0.bb     |    5 -----
 recipes/sugar/sugar-toolkit_0.82.11.bb             |    5 -----
 recipes/sugar/sugar-toolkit_0.83.3.bb              |    5 -----
 recipes/sugar/sugar-toolkit_0.84.4.bb              |    5 -----
 recipes/sugar/sugar_0.82.9.bb                      |    5 -----
 recipes/sugar/sugar_0.83.4.bb                      |    5 -----
 recipes/sugar/sugar_0.84.6.bb                      |    5 -----
 recipes/swfdec/swfdec-mozilla_0.7.2.bb             |    4 ----
 recipes/swfdec/swfdec-mozilla_0.7.4.bb             |    4 ----
 recipes/swfdec/swfdec-mozilla_0.8.2.bb             |    4 ----
 recipes/swfdec/swfdec-mozilla_0.9.2.bb             |    4 ----
 recipes/swfdec/swfdec_0.7.2.bb                     |    4 ----
 recipes/swfdec/swfdec_0.7.4.bb                     |    4 ----
 recipes/swfdec/swfdec_0.8.2.bb                     |    4 ----
 recipes/swfdec/swfdec_0.9.2.bb                     |    4 ----
 recipes/taglib/taglib_1.4.bb                       |    4 ----
 recipes/tapioca/libjingle-tapioca_0.3.10.bb        |    4 ----
 recipes/tapioca/tapioca-xmpp_0.3.9.bb              |    4 ----
 recipes/telepathy/libtelepathy_0.0.53.bb           |    4 ----
 recipes/telepathy/libtelepathy_0.2.0.bb            |    4 ----
 recipes/telepathy/libtelepathy_0.3.3.bb            |    4 ----
 .../telepathy/telepathy-mission-control_4.21.bb    |    4 ----
 .../telepathy/telepathy-mission-control_4.22.bb    |    4 ----
 .../telepathy/telepathy-mission-control_4.45.bb    |    4 ----
 recipes/tilibs/libticables_3.9.2.bb                |    4 ----
 recipes/tilibs/libticalcs_4.5.9.bb                 |    5 -----
 recipes/tilibs/libtifiles_0.6.5.bb                 |    5 -----
 recipes/tinymail/libtinymail.inc                   |    4 ----
 recipes/tomoe/libtomoe-gtk_0.1.0.bb                |    4 ----
 recipes/tomoe/tomoe_0.2.1.bb                       |    4 ----
 recipes/tracker/tracker_0.5.4.bb                   |    4 ----
 recipes/tracker/tracker_0.6.95.bb                  |    4 ----
 recipes/tremor/tremor_20041119.bb                  |    3 ---
 recipes/tremor/tremor_svn.bb                       |    3 ---
 recipes/uim/uim_1.3.1.bb                           |    4 ----
 recipes/ulxmlrpcpp/ulxmlrpcpp_1.7.3.bb             |    4 ----
 recipes/unicap/unicap_0.9.3.bb                     |    4 ----
 recipes/unicap/unicap_0.9.4.bb                     |    4 ----
 recipes/unicap/unicap_0.9.7.bb                     |    4 ----
 recipes/upnp/gupnp-av_0.2.bb                       |    4 ----
 recipes/upnp/gupnp_0.12.4.bb                       |    5 -----
 recipes/upnp/libupnp_1.3.1.bb                      |    8 --------
 recipes/upnp/libupnp_1.6.5.bb                      |    4 ----
 recipes/upstart/upstart.inc                        |    4 ----
 recipes/usbpath/usbpath-native_svn.bb              |    4 ----
 recipes/usbpath/usbpath_svn.bb                     |    4 ----
 recipes/util-linux/util-linux-native_2.12r.bb      |    5 -----
 recipes/vlc/libdvdcss_1.2.10.bb                    |    8 --------
 recipes/vlc/vlc-davinci_0.8.6h.bb                  |    4 ----
 recipes/vlc/vlc.inc                                |    5 -----
 recipes/vlc/vlc_0.9.2.bb                           |    5 -----
 recipes/vnc/libvncserver_0.9.1.bb                  |    3 ---
 recipes/vnc/libvncserver_0.9.bb                    |    4 ----
 recipes/vte/vte.inc                                |    4 ----
 recipes/vte/vte_0.21.5.bb                          |    4 ----
 recipes/wv/wv_1.2.4.bb                             |    4 ----
 recipes/wvstreams/wvstreams_4.2.2.bb               |    5 -----
 recipes/wvstreams/wvstreams_4.4.1.bb               |    5 -----
 recipes/wvstreams/wvstreams_4.6.bb                 |    3 ---
 recipes/xapian/xapian-bindings-python_1.0.14.bb    |    5 -----
 recipes/xapian/xapian-core.inc                     |    4 ----
 recipes/xcb/xcb-proto_1.6.bb                       |    3 ---
 recipes/xcb/xcb-proto_git.bb                       |    4 ----
 recipes/xcb/xcb-util.inc                           |    3 ---
 recipes/xfce-base/xfce-mcs-manager.inc             |    5 -----
 recipes/xmms/xmms_1.2.10.bb                        |    4 ----
 recipes/xorg-driver/xorg-driver-common.inc         |    5 -----
 recipes/xorg-font/xorg-font-common.inc             |    4 ----
 recipes/xorg-xserver/xorg-xserver-common.inc       |    4 ----
 508 files changed, 1 insertions(+), 2181 deletions(-)

diff --git a/recipes/alp/hiker_0.9.1.bb b/recipes/alp/hiker_0.9.1.bb
index cd50aa7..0ff714d 100644
--- a/recipes/alp/hiker_0.9.1.bb
+++ b/recipes/alp/hiker_0.9.1.bb
@@ -18,10 +18,5 @@ PACKAGES =+ "libhiker libsqlfs"
 FILES_libhiker += "${libdir}/libhiker*.so.*"
 FILES_libsqlfs += "${libdir}/libsql*.so.*"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "30efc3312b2e08e9ee9d73569cb987b2"
 SRC_URI[sha256sum] = "3391a651df8c011dc2cb0f81118069ce22c2d13b86090b2c0ced4e80c4fa662d"
diff --git a/recipes/alp/hiker_0.9.bb b/recipes/alp/hiker_0.9.bb
index 20afee1..05f02ba 100644
--- a/recipes/alp/hiker_0.9.bb
+++ b/recipes/alp/hiker_0.9.bb
@@ -18,10 +18,5 @@ PACKAGES =+ "libhiker libsqlfs"
 FILES_libhiker += "${libdir}/libhiker*.so.*"
 FILES_libsqlfs += "${libdir}/libsql*.so.*"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "f4cbf05743ccb34282e4dc3aef489f72"
 SRC_URI[sha256sum] = "6633c4124c41d9a1ca526161062fd276f352b4228bde4f565d38d35c15a3005c"
diff --git a/recipes/anthy/anthy_9100e.bb b/recipes/anthy/anthy_9100e.bb
index 83e61b7..bf44ff0 100644
--- a/recipes/anthy/anthy_9100e.bb
+++ b/recipes/anthy/anthy_9100e.bb
@@ -23,10 +23,6 @@ inherit autotools pkgconfig
 LEAD_SONAME = "libanthy.so.0"
 RDEPENDS_anthy = "libanthy0"
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES += "${PN}-el libanthy0 libanthy-dev"
 FILES_${PN}-dbg += "${libdir}/.debug"
 FILES_libanthy0 = "${libdir}/libanthy.so.*	\
diff --git a/recipes/apr/apr-util_0.9.12.bb b/recipes/apr/apr-util_0.9.12.bb
index 1902c05..89c9a93 100644
--- a/recipes/apr/apr-util_0.9.12.bb
+++ b/recipes/apr/apr-util_0.9.12.bb
@@ -18,9 +18,5 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "8e9cc71a1303b67b3278fbeab9799f2e"
 SRC_URI[sha256sum] = "5768fcc4d38fa6f811b0a89e2ef450d0f52688ff9263e548819adb096fbfc9c3"
diff --git a/recipes/apr/apr-util_1.2.12.bb b/recipes/apr/apr-util_1.2.12.bb
index b5c1ebb..698a3f0 100644
--- a/recipes/apr/apr-util_1.2.12.bb
+++ b/recipes/apr/apr-util_1.2.12.bb
@@ -30,9 +30,5 @@ do_configure_prepend() {
 	libtoolize --force
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "e292942e22edd21b68609086352212e4"
 SRC_URI[sha256sum] = "7d70ff17bec733bdb04a6653a8e9c15ab7d88429dac91a4ae58c1db5caaee07f"
diff --git a/recipes/apr/apr-util_1.2.7.bb b/recipes/apr/apr-util_1.2.7.bb
index e26d300..282b55e 100644
--- a/recipes/apr/apr-util_1.2.7.bb
+++ b/recipes/apr/apr-util_1.2.7.bb
@@ -24,9 +24,5 @@ do_configure_prepend () {
 	cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "c3702668a640be1695956115857ec22e"
 SRC_URI[sha256sum] = "8cd84eb2031a91572e1be2975f4171730a9be72c4cd88718c4c40ac7dc4fd7d3"
diff --git a/recipes/apr/apr_0.9.12.bb b/recipes/apr/apr_0.9.12.bb
index 94d6493..8748757 100644
--- a/recipes/apr/apr_0.9.12.bb
+++ b/recipes/apr/apr_0.9.12.bb
@@ -12,9 +12,5 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "63fef787c263bd8025c6ab6a6cecdd01"
 SRC_URI[sha256sum] = "cd1da2119dd812127ab6e6e8cbb954d9b74fe01ec744364ba79c9845865ffdaa"
diff --git a/recipes/argp-standalone/argp-standalone_1.3.bb b/recipes/argp-standalone/argp-standalone_1.3.bb
index 055d1dc..79d219a 100644
--- a/recipes/argp-standalone/argp-standalone_1.3.bb
+++ b/recipes/argp-standalone/argp-standalone_1.3.bb
@@ -5,9 +5,5 @@ SRC_URI = "http://www.auto.tuwien.ac.at/~mkoegler/eib/argp-standalone-${PV}.tar.
 
 inherit autotools
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "8a336796eeb2a765b76f68e3312adaab"
 SRC_URI[sha256sum] = "8b9067e77812c67c1e1b96ab9d92ab9af3a97e991d3c385b6e241d97f0e3cd28"
diff --git a/recipes/asterisk/asterisk_1.4.23.1.bb b/recipes/asterisk/asterisk_1.4.23.1.bb
index 0b7ae79..af6967a 100644
--- a/recipes/asterisk/asterisk_1.4.23.1.bb
+++ b/recipes/asterisk/asterisk_1.4.23.1.bb
@@ -94,10 +94,6 @@ pkg_postinst_prepend() {
 	chown -R asterisk:asterisk ${libdir}/asterisk ${localstatedir}/lib/asterisk ${localstatedir}/spool/asterisk ${localstatedir}/log/asterisk ${localstatedir}/run/asterisk ${sysconfdir}/asterisk
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/asterisk/modules/*"
 FILES_${PN}-dbg += "${libdir}/asterisk/modules/.debug \
                     ${localstatedir}/lib/asterisk/*/.debug"
diff --git a/recipes/atk/atk.inc b/recipes/atk/atk.inc
index 5f81cdf..a508012 100644
--- a/recipes/atk/atk.inc
+++ b/recipes/atk/atk.inc
@@ -9,6 +9,3 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-glibtest"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/atk/atk_1.26.0.bb b/recipes/atk/atk_1.26.0.bb
index de35884..06f7334 100644
--- a/recipes/atk/atk_1.26.0.bb
+++ b/recipes/atk/atk_1.26.0.bb
@@ -9,11 +9,5 @@ inherit gnome
 
 EXTRA_OECONF = "--disable-glibtest"
 
-do_stage () {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[archive.md5sum] = "719229408019c548855673840679f156"
 SRC_URI[archive.sha256sum] = "f7993d26c3606a9b0e32d1eebe716f2294ac37fac014c47744e986fc0ff5e6d1"
diff --git a/recipes/avahi/avahi.inc b/recipes/avahi/avahi.inc
index 26a8cba..4ffb6d5 100644
--- a/recipes/avahi/avahi.inc
+++ b/recipes/avahi/avahi.inc
@@ -110,6 +110,3 @@ do_install() {
 	install ${WORKDIR}/99avahi-autoipd ${D}${sysconfdir}/udhcpc.d
 }
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/beecrypt/beecrypt_3.1.0.bb b/recipes/beecrypt/beecrypt_3.1.0.bb
index c23a999..3d7053a 100644
--- a/recipes/beecrypt/beecrypt_3.1.0.bb
+++ b/recipes/beecrypt/beecrypt_3.1.0.bb
@@ -14,10 +14,5 @@ acpaths=""
 
 EXTRA_OECONF="--with-arch=${TARGET_ARCH} --enable-shared --enable-static"
 
-do_stage() {
-    autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "1472cada46e2ab9f532f984de9740386"
 SRC_URI[sha256sum] = "50b574d330fecbc9faed81746a1abfcec903c264ae753ac64d4edf22c701519f"
diff --git a/recipes/boxee/tre_0.7.5.bb b/recipes/boxee/tre_0.7.5.bb
index f2f5237..5df0bca 100644
--- a/recipes/boxee/tre_0.7.5.bb
+++ b/recipes/boxee/tre_0.7.5.bb
@@ -12,10 +12,6 @@ do_compile_append() {
 }
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-	autotools_stage_all
-}
-
 
 SRC_URI[md5sum] = "e72e5c94008865cf720992a0b25d6e89"
 SRC_URI[sha256sum] = "030f25e6e4c1714df013105494bc5e24b3e0acc65887158a52a03efd8e0759aa"
diff --git a/recipes/cairo/cairo_1.2.4.bb b/recipes/cairo/cairo_1.2.4.bb
index f1723a7..8e77878 100644
--- a/recipes/cairo/cairo_1.2.4.bb
+++ b/recipes/cairo/cairo_1.2.4.bb
@@ -12,9 +12,5 @@ SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "1222b2bfdf113e2c92f66b3389659f2d"
 SRC_URI[sha256sum] = "c1580ca951b2f57c4f8b34549997854bc48dbaf036ca1ca6c017c03db3504ddb"
diff --git a/recipes/cairo/cairo_git.bb b/recipes/cairo/cairo_git.bb
index 825b601..d125a25 100644
--- a/recipes/cairo/cairo_git.bb
+++ b/recipes/cairo/cairo_git.bb
@@ -23,6 +23,3 @@ do_compile_append() {
 	cd ${S}/perf ; oe_runmake
 }
 
-do_stage () {
- 	autotools_stage_all
-}
diff --git a/recipes/cairo/libsvg-cairo_0.1.5.bb b/recipes/cairo/libsvg-cairo_0.1.5.bb
index fcd2ba0..06d40d0 100644
--- a/recipes/cairo/libsvg-cairo_0.1.5.bb
+++ b/recipes/cairo/libsvg-cairo_0.1.5.bb
@@ -8,9 +8,5 @@ SRC_URI = "http://cairographics.org/snapshots/libsvg-cairo-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "422fe94b86ca92fc8f3a9d7c1e14de0a"
 SRC_URI[sha256sum] = "091f50b57dcd5e755be71ca8932892abccbbf8ae59c7131d5f06108033fec921"
diff --git a/recipes/cairo/libsvg-cairo_0.1.6.bb b/recipes/cairo/libsvg-cairo_0.1.6.bb
index cc0efa7..0104d4e 100644
--- a/recipes/cairo/libsvg-cairo_0.1.6.bb
+++ b/recipes/cairo/libsvg-cairo_0.1.6.bb
@@ -8,9 +8,5 @@ SRC_URI = "http://cairographics.org/snapshots/libsvg-cairo-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "d79da7b3a60ad8c8e4b902c9b3563047"
 SRC_URI[sha256sum] = "a380be6a78ec2938100ce904363815a94068fca372c666b8cc82aa8711a0215c"
diff --git a/recipes/cairo/libsvg-cairo_20050601.bb b/recipes/cairo/libsvg-cairo_20050601.bb
index 330b921..dc57040 100644
--- a/recipes/cairo/libsvg-cairo_20050601.bb
+++ b/recipes/cairo/libsvg-cairo_20050601.bb
@@ -13,6 +13,3 @@ S = "${WORKDIR}/libsvg-cairo"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/cairo/libsvg-cairo_cvs.bb b/recipes/cairo/libsvg-cairo_cvs.bb
index 6f9111e..cc8658a 100644
--- a/recipes/cairo/libsvg-cairo_cvs.bb
+++ b/recipes/cairo/libsvg-cairo_cvs.bb
@@ -10,6 +10,3 @@ S = "${WORKDIR}/libsvg-cairo"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/cairo/libsvg_0.1.4.bb b/recipes/cairo/libsvg_0.1.4.bb
index ecc4b4b..74922c4 100644
--- a/recipes/cairo/libsvg_0.1.4.bb
+++ b/recipes/cairo/libsvg_0.1.4.bb
@@ -13,9 +13,5 @@ EXTRA_OECONF = "--with-expat"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "ce0715e3013f78506795fba16e8455d3"
 SRC_URI[sha256sum] = "4c3bf9292e676a72b12338691be64d0f38cd7f2ea5e8b67fbbf45f1ed404bc8f"
diff --git a/recipes/cairo/libsvg_cvs.bb b/recipes/cairo/libsvg_cvs.bb
index 95b360c..93f1bff 100644
--- a/recipes/cairo/libsvg_cvs.bb
+++ b/recipes/cairo/libsvg_cvs.bb
@@ -12,6 +12,3 @@ EXTRA_OECONF = "--with-expat"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/cairo/xsvg_cvs.bb b/recipes/cairo/xsvg_cvs.bb
index 9902c13..87cd50c 100644
--- a/recipes/cairo/xsvg_cvs.bb
+++ b/recipes/cairo/xsvg_cvs.bb
@@ -14,6 +14,3 @@ BROKEN = "1"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/cdk/cdk_5.0-20060507.bb b/recipes/cdk/cdk_5.0-20060507.bb
index b007f45..e74d80b 100644
--- a/recipes/cdk/cdk_5.0-20060507.bb
+++ b/recipes/cdk/cdk_5.0-20060507.bb
@@ -15,10 +15,5 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "0ec2460a4484d5f5595d8faca61bc9c5"
 SRC_URI[sha256sum] = "e823bfcce52916727cb23d6d549a64347c45c364b3c628d6a352c407fce8f4b4"
diff --git a/recipes/clucene/clucene-core_0.9.21b.bb b/recipes/clucene/clucene-core_0.9.21b.bb
index 88393a4..587183e 100644
--- a/recipes/clucene/clucene-core_0.9.21b.bb
+++ b/recipes/clucene/clucene-core_0.9.21b.bb
@@ -17,10 +17,6 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN}-dev += "${libdir}/CLucene"
 
 SRC_URI[md5sum] = "ba1a8f764a2ca19c66ad907dddd88352"
diff --git a/recipes/clutter/aaina.inc b/recipes/clutter/aaina.inc
index fbef34f..21038f7 100644
--- a/recipes/clutter/aaina.inc
+++ b/recipes/clutter/aaina.inc
@@ -6,7 +6,3 @@ DEPENDS = "clutter libxml2 gtk+ neon"
 
 inherit autotools pkgconfig
 
-do_stage () {
-        autotools_stage_all
-}
-
diff --git a/recipes/clutter/clutter-cairo.inc b/recipes/clutter/clutter-cairo.inc
index 1095a7e..5c6d7e7 100644
--- a/recipes/clutter/clutter-cairo.inc
+++ b/recipes/clutter/clutter-cairo.inc
@@ -9,7 +9,3 @@ FILES_${PN}-examples = "${bindir}/flowers ${bindir}/clock"
 
 inherit autotools pkgconfig
 
-do_stage () {
-        autotools_stage_all
-}
-
diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gst.inc
index fa8f810..8fa30b4 100644
--- a/recipes/clutter/clutter-gst.inc
+++ b/recipes/clutter/clutter-gst.inc
@@ -17,7 +17,3 @@ do_configure_prepend() {
 	fi
 }
 
-do_stage () {
-        autotools_stage_all
-}
-
diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index 3bcf895..0c7eaa8 100644
--- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -58,6 +58,3 @@ do_configure_prepend() {
     sed -i s:doc::g ${S}/Makefile.am
 }
 
-do_stage () {
-        autotools_stage_all
-}
diff --git a/recipes/clutter/tidy.inc b/recipes/clutter/tidy.inc
index bac910a..c69166f 100644
--- a/recipes/clutter/tidy.inc
+++ b/recipes/clutter/tidy.inc
@@ -19,6 +19,3 @@ do_configure_prepend() {
         sed -i s:docs::g ${S}/Makefile.am
 }
 
-do_stage () {
-        autotools_stage_all
-}
diff --git a/recipes/confuse/confuse_2.5.bb b/recipes/confuse/confuse_2.5.bb
index f4ce369..b9f45aa 100644
--- a/recipes/confuse/confuse_2.5.bb
+++ b/recipes/confuse/confuse_2.5.bb
@@ -11,10 +11,5 @@ inherit autotools binconfig pkgconfig lib_package
 
 EXTRA_OECONF = "--enable-shared"
 
-do_stage() {
-    autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "4bc9b73d77ebd571ac834619ce0b3582"
 SRC_URI[sha256sum] = "65451d8d6f5d4ca1dbd0700f3ef2ef257b52b542b3bab4bbeddd539f1c23f859"
diff --git a/recipes/dbh/dbh_1.0-18.bb b/recipes/dbh/dbh_1.0-18.bb
index 4f69104..aea7c2c 100644
--- a/recipes/dbh/dbh_1.0-18.bb
+++ b/recipes/dbh/dbh_1.0-18.bb
@@ -13,9 +13,5 @@ S="${WORKDIR}/dbh_${PV}"
 
 inherit autotools pkgconfig
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "dca09e2949616471669320e3429a49ef"
 SRC_URI[sha256sum] = "62c8c36df69c48bed9e8a1406faa5df5d057876b34fc110492c87260a70692c6"
diff --git a/recipes/dbus/dbus-c++-native_git.bb b/recipes/dbus/dbus-c++-native_git.bb
index dd43f91..eba80b2 100644
--- a/recipes/dbus/dbus-c++-native_git.bb
+++ b/recipes/dbus/dbus-c++-native_git.bb
@@ -11,10 +11,6 @@ do_compile() {
 	install -m 0755 tools/dbusxx-xml2cpp ${STAGING_BINDIR_NATIVE}
 }
 
-do_stage() {
-    autotools_stage_all
-}
-
 do_install() {
 	:
 }
diff --git a/recipes/devhelp/devhelp_0.23.bb b/recipes/devhelp/devhelp_0.23.bb
index a1e5531..2e41083 100644
--- a/recipes/devhelp/devhelp_0.23.bb
+++ b/recipes/devhelp/devhelp_0.23.bb
@@ -11,9 +11,5 @@ SRC_URI += "file://devhelp-includes.patch \
 PACKAGES += "gedit-plugin-${PN}"
 FILES_gedit-plugin-${PN} += "${libdir}/gedit-2"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "704c0c90616aeb1c52ca3af1df93fde6"
 SRC_URI[archive.sha256sum] = "60f336ac396f67a0cce70d71ea931545727ab48e9d09bf36415098965f9a7ef2"
diff --git a/recipes/dfu-util/dfu-util_svn.bb b/recipes/dfu-util/dfu-util_svn.bb
index 7ac7814..e61b8a3 100644
--- a/recipes/dfu-util/dfu-util_svn.bb
+++ b/recipes/dfu-util/dfu-util_svn.bb
@@ -13,6 +13,3 @@ S = "${WORKDIR}/dfu-util"
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/directfb/++dfb_1.0.0.bb b/recipes/directfb/++dfb_1.0.0.bb
index e25ca78..6629c96 100644
--- a/recipes/directfb/++dfb_1.0.0.bb
+++ b/recipes/directfb/++dfb_1.0.0.bb
@@ -10,10 +10,6 @@ RV = "0.9-25"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 do_install() {
         oe_runmake 'DESTDIR=${D}' install
 }
diff --git a/recipes/directfb/directfb-examples_1.0.0.bb b/recipes/directfb/directfb-examples_1.0.0.bb
index 4436574..a6a374d 100644
--- a/recipes/directfb/directfb-examples_1.0.0.bb
+++ b/recipes/directfb/directfb-examples_1.0.0.bb
@@ -10,11 +10,5 @@ S = "${WORKDIR}/DirectFB-examples-${PV}"
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "0cdfb4dd248eada3dc35db4f8cf75f8d"
 SRC_URI[sha256sum] = "c54e779a720841126e23d692de85243e23b0d94fb7792a958b96b5bd097a8b85"
diff --git a/recipes/directfb/directfb-examples_1.2.0.bb b/recipes/directfb/directfb-examples_1.2.0.bb
index 5475d99..6040bc3 100644
--- a/recipes/directfb/directfb-examples_1.2.0.bb
+++ b/recipes/directfb/directfb-examples_1.2.0.bb
@@ -10,11 +10,5 @@ S = "${WORKDIR}/DirectFB-examples-${PV}"
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "ce018f681b469a1d72ffc32650304b98"
 SRC_URI[sha256sum] = "830a1bd6775d8680523596a88a72fd8e4c6a74bf886d3e169b06d234a5cf7e3e"
diff --git a/recipes/directfb/directfb.inc b/recipes/directfb/directfb.inc
index f6508d7..d07d58c 100644
--- a/recipes/directfb/directfb.inc
+++ b/recipes/directfb/directfb.inc
@@ -32,10 +32,6 @@ EXTRA_OECONF = "\
   --disable-x11 \
 "
 
-do_stage() {
-        autotools_stage_all
-}
-
 do_install() {
         oe_runmake 'DESTDIR=${D}' install
 }
diff --git a/recipes/directfb/fusionsound_1.1.0+git20070709.bb b/recipes/directfb/fusionsound_1.1.0+git20070709.bb
index 50f093c..2b58019 100644
--- a/recipes/directfb/fusionsound_1.1.0+git20070709.bb
+++ b/recipes/directfb/fusionsound_1.1.0+git20070709.bb
@@ -37,10 +37,6 @@ do_configure_append() {
     find ${S} -type f | xargs sed -i 's:I/usr/include:I${STAGING_INCDIR}:g'
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
 do_install() {
         oe_runmake 'DESTDIR=${D}' install
 }
diff --git a/recipes/directfb/lite_0.9.26+cvs20070207.bb b/recipes/directfb/lite_0.9.26+cvs20070207.bb
index 32f97bf..231a1ef 100644
--- a/recipes/directfb/lite_0.9.26+cvs20070207.bb
+++ b/recipes/directfb/lite_0.9.26+cvs20070207.bb
@@ -19,10 +19,6 @@ do_configure_append() {
     find ${S} -type f | xargs sed -i 's:I/usr/include:I${STAGING_INCDIR}:g'
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
 do_install() {
         oe_runmake 'DESTDIR=${D}' install
 }
diff --git a/recipes/djvulibre/djvulibre_3.5.20.bb b/recipes/djvulibre/djvulibre_3.5.20.bb
index e427a72..c1e85e1 100644
--- a/recipes/djvulibre/djvulibre_3.5.20.bb
+++ b/recipes/djvulibre/djvulibre_3.5.20.bb
@@ -14,10 +14,6 @@ inherit qt4x11 autotools pkgconfig
 EXTRA_OECONF = " --enable-threads \
                  --with-qt=${PAMLTOPDIR} "
 
-do_stage() {
-        autotools_stage_all
-}
-
 PACKAGES =+ "libdjvulibre"
 FILES_libdjvulibre = "${libdir}/libdjvulibre.so.*"
 FILES_${PN} += "${datadir}/djvu"
diff --git a/recipes/djvulibre/djvulibre_3.5.21.bb b/recipes/djvulibre/djvulibre_3.5.21.bb
index ce57cf0..233f2a4 100644
--- a/recipes/djvulibre/djvulibre_3.5.21.bb
+++ b/recipes/djvulibre/djvulibre_3.5.21.bb
@@ -22,10 +22,6 @@ do_configure() {
 	done
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
 PACKAGES =+ "libdjvulibre"
 FILES_libdjvulibre = "${libdir}/libdjvulibre.so.*"
 FILES_${PN} += "${datadir}/djvu"
diff --git a/recipes/eb/eb_4.3.2.bb b/recipes/eb/eb_4.3.2.bb
index 9a9181a..1d86fa5 100644
--- a/recipes/eb/eb_4.3.2.bb
+++ b/recipes/eb/eb_4.3.2.bb
@@ -10,10 +10,6 @@ inherit autotools
 
 EXTRA_OECONF += " --with-pkgdocdir=${docdir}/eb"
 
-do_stage () {
-	autotools_stage_all
-}
-
 PACKAGES =+ "eb-utils"
 FILES_eb-utils = "/usr/bin/*"
 
diff --git a/recipes/eel/eel_2.12.2.bb b/recipes/eel/eel_2.12.2.bb
index 5821c55..d0d99ce 100644
--- a/recipes/eel/eel_2.12.2.bb
+++ b/recipes/eel/eel_2.12.2.bb
@@ -11,10 +11,5 @@ SRC_URI += "file://configure.patch"
 DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
-
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "d78cd3e33c656a62b5bf1f8d0b8d271f"
 SRC_URI[archive.sha256sum] = "df6c696f84bc9c2af12f3715f2703060ab1692a918fb221ea0403212c03e0b73"
diff --git a/recipes/eel/eel_2.22.2.bb b/recipes/eel/eel_2.22.2.bb
index 0a24a3a..51e2c47 100644
--- a/recipes/eel/eel_2.22.2.bb
+++ b/recipes/eel/eel_2.22.2.bb
@@ -12,9 +12,5 @@ SRC_URI += "file://eel-no-strftime.patch"
 DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "f0dc46f4bc6a772da9e149c0018a8b09"
 SRC_URI[archive.sha256sum] = "e91e576ed22e5ba9a930d4292e3dbec4fe4ec7276029d82188cc91db117e21d4"
diff --git a/recipes/eel/eel_2.24.1.bb b/recipes/eel/eel_2.24.1.bb
index 258e498..190a09b 100644
--- a/recipes/eel/eel_2.24.1.bb
+++ b/recipes/eel/eel_2.24.1.bb
@@ -12,9 +12,5 @@ SRC_URI += "file://eel-no-strftime.patch"
 DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "b591df36af8f1b23dd175be33b5de073"
 SRC_URI[archive.sha256sum] = "32cde7b589b49f439d82f76b6456983d36de7d20688f7c6ac2fdae4ce354e629"
diff --git a/recipes/eel/eel_2.26.0.bb b/recipes/eel/eel_2.26.0.bb
index 0da61f8..8b18458 100644
--- a/recipes/eel/eel_2.26.0.bb
+++ b/recipes/eel/eel_2.26.0.bb
@@ -12,9 +12,5 @@ SRC_URI += "file://eel-no-strftime.patch"
 DEPENDS = "gnome-vfs gnome-desktop gnome-menus libgnomeui virtual/gail"
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "dfa105ccabd53efe4166dcfac75e2393"
 SRC_URI[archive.sha256sum] = "11ad07d8d371f9165fab6cc5462f59cd253f9cc835d77a54330fecafe9c0a555"
diff --git a/recipes/ekiga/opal_3.4.4.bb b/recipes/ekiga/opal_3.4.4.bb
index fb0e417..5244d63 100644
--- a/recipes/ekiga/opal_3.4.4.bb
+++ b/recipes/ekiga/opal_3.4.4.bb
@@ -20,10 +20,5 @@ do_configure() {
 FILES_${PN} += "${libdir}/opal-${PV}/*/*.so ${libdir}/opal-${PV}/*/*/*.so"
 FILES_${PN}-dbg += "${libdir}/opal-${PV}/*/.debug ${libdir}/opal-${PV}/*/*/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "01e76bc1261ab6c5b537387a81e7fdd9"
 SRC_URI[sha256sum] = "3ed39e1dc74b4e1adb3d8a3430b18bcfd19d21406375faf420cbdcd5499a4594"
diff --git a/recipes/ekiga/opal_3.5.2.bb b/recipes/ekiga/opal_3.5.2.bb
index 71f82fe..a8aa991 100644
--- a/recipes/ekiga/opal_3.5.2.bb
+++ b/recipes/ekiga/opal_3.5.2.bb
@@ -25,10 +25,5 @@ do_configure() {
 FILES_${PN} += "${libdir}/opal-${PV}/*/*.so ${libdir}/opal-${PV}/*/*/*.so"
 FILES_${PN}-dbg += "${libdir}/opal-${PV}/*/.debug ${libdir}/opal-${PV}/*/*/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "7a1e7424b346ee0a0b719217a1081cfd"
 SRC_URI[sha256sum] = "c11daf4e0baf1bc70d30411944f9a3238d61e3c1972c33443dbe0cb078cfe2d7"
diff --git a/recipes/ekiga/opal_3.6.1.bb b/recipes/ekiga/opal_3.6.1.bb
index c53b72e..fa5ae8e 100644
--- a/recipes/ekiga/opal_3.6.1.bb
+++ b/recipes/ekiga/opal_3.6.1.bb
@@ -23,10 +23,5 @@ do_configure() {
 FILES_${PN} += "${libdir}/opal-${PV}/*/*.so ${libdir}/opal-${PV}/*/*/*.so"
 FILES_${PN}-dbg += "${libdir}/opal-${PV}/*/.debug ${libdir}/opal-${PV}/*/*/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "c2b4f12822cef2182267ea0d020bddf6"
 SRC_URI[sha256sum] = "e6b48a294b35449c851c2a6ea6969041ed7f4148e92b3faa03a330b7bb5a59af"
diff --git a/recipes/ekiga/opal_3.6.2.bb b/recipes/ekiga/opal_3.6.2.bb
index 3a24c31..031ba5f 100644
--- a/recipes/ekiga/opal_3.6.2.bb
+++ b/recipes/ekiga/opal_3.6.2.bb
@@ -23,10 +23,5 @@ do_configure() {
 FILES_${PN} += "${libdir}/opal-${PV}/*/*.so ${libdir}/opal-${PV}/*/*/*.so"
 FILES_${PN}-dbg += "${libdir}/opal-${PV}/*/.debug ${libdir}/opal-${PV}/*/*/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "88076eeadee1351704afb2aeb3532c17"
 SRC_URI[sha256sum] = "09ffe451256fafdd74d4dc35ed153b93c81328c397d36872cca1f0104877caca"
diff --git a/recipes/ekiga/opal_3.6.4.bb b/recipes/ekiga/opal_3.6.4.bb
index 827c8f3..dcbfce4 100644
--- a/recipes/ekiga/opal_3.6.4.bb
+++ b/recipes/ekiga/opal_3.6.4.bb
@@ -23,10 +23,5 @@ do_configure() {
 FILES_${PN} += "${libdir}/opal-${PV}/*/*.so ${libdir}/opal-${PV}/*/*/*.so"
 FILES_${PN}-dbg += "${libdir}/opal-${PV}/*/.debug ${libdir}/opal-${PV}/*/*/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "d894c176818a33d34a04b21386798c4f"
 SRC_URI[sha256sum] = "b1fb3bad0c8581b82f0da9c69673f43ad9aed7868a7e4f2a68c6c72ed656237b"
diff --git a/recipes/ekiga/opal_3.6.6.bb b/recipes/ekiga/opal_3.6.6.bb
index 6591bd7..e8202bd 100644
--- a/recipes/ekiga/opal_3.6.6.bb
+++ b/recipes/ekiga/opal_3.6.6.bb
@@ -23,10 +23,5 @@ do_configure() {
 FILES_${PN} += "${libdir}/opal-${PV}/*/*.so ${libdir}/opal-${PV}/*/*/*.so"
 FILES_${PN}-dbg += "${libdir}/opal-${PV}/*/.debug ${libdir}/opal-${PV}/*/*/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "43b363c860780e7f1a0361cfee8f9f4a"
 SRC_URI[sha256sum] = "60c9d75703bedfeca7140cb76b23fae7179ce1f86e7e8b0026b72d66acd75c82"
diff --git a/recipes/ekiga/ptlib_2.4.4.bb b/recipes/ekiga/ptlib_2.4.4.bb
index 08b0cb6..db98e6a 100644
--- a/recipes/ekiga/ptlib_2.4.4.bb
+++ b/recipes/ekiga/ptlib_2.4.4.bb
@@ -21,13 +21,5 @@ do_compile_append() {
 
 FILES_${PN} += "${libdir}/ptlib-${PV}/*/*/*.so"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
-
-
 SRC_URI[md5sum] = "221ea2f96ff6bae9cf604d8766eae526"
 SRC_URI[sha256sum] = "c9ef4267490507fc9699634551b50c0c1c225d48e0c095a81be6fa5a1fa96a3a"
diff --git a/recipes/ekiga/ptlib_2.5.2.bb b/recipes/ekiga/ptlib_2.5.2.bb
index 04112e0..ef4bd53 100644
--- a/recipes/ekiga/ptlib_2.5.2.bb
+++ b/recipes/ekiga/ptlib_2.5.2.bb
@@ -21,13 +21,5 @@ do_compile_append() {
 
 FILES_${PN} += "${libdir}/ptlib-${PV}/*/*/*.so"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
-
-
 SRC_URI[md5sum] = "7d8dcd999827d51ad4a15afe74aad181"
 SRC_URI[sha256sum] = "c99897464bd07c73dbb72095a9806ddc0c26141230e34b181d7e742e78259e4b"
diff --git a/recipes/ekiga/ptlib_2.6.1.bb b/recipes/ekiga/ptlib_2.6.1.bb
index db7a502..93a8df9 100644
--- a/recipes/ekiga/ptlib_2.6.1.bb
+++ b/recipes/ekiga/ptlib_2.6.1.bb
@@ -21,13 +21,5 @@ do_compile_append() {
 
 FILES_${PN} += "${libdir}/ptlib-${PV}/*/*/*.so"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
-
-
 SRC_URI[md5sum] = "122ab96fcc44110ce05153f259b3285a"
 SRC_URI[sha256sum] = "b8301389c1ee9968df8075942061665e33198d3865f92d8fb26e519068517305"
diff --git a/recipes/ekiga/ptlib_2.6.2.bb b/recipes/ekiga/ptlib_2.6.2.bb
index c9cc582..46f224a 100644
--- a/recipes/ekiga/ptlib_2.6.2.bb
+++ b/recipes/ekiga/ptlib_2.6.2.bb
@@ -21,13 +21,5 @@ do_compile_append() {
 
 FILES_${PN} += "${libdir}/ptlib-${PV}/*/*/*.so"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
-
-
 SRC_URI[md5sum] = "d478121cfc82da7c0f0ce0e53fc7c2fd"
 SRC_URI[sha256sum] = "941ead5179f5bab8dd6e81806b6e52120dc5b98c6ced8128df24639af1eabedd"
diff --git a/recipes/ekiga/ptlib_2.6.4.bb b/recipes/ekiga/ptlib_2.6.4.bb
index 92d34ff..6ad0ed4 100644
--- a/recipes/ekiga/ptlib_2.6.4.bb
+++ b/recipes/ekiga/ptlib_2.6.4.bb
@@ -27,13 +27,5 @@ do_install_append() {
 
 FILES_${PN} += "${libdir}/ptlib-${PV}/*/*/*.so"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
-
-
 SRC_URI[md5sum] = "bcc8e2d5bb6be7e3fea857ce2f7fce5c"
 SRC_URI[sha256sum] = "22eae4f6c72247f8ac79c57ce4469797ad3df67614758c5096b7ce9290bd10b4"
diff --git a/recipes/elfutils/elfutils_0.127.bb b/recipes/elfutils/elfutils_0.127.bb
index 59588b1..91e6baf 100644
--- a/recipes/elfutils/elfutils_0.127.bb
+++ b/recipes/elfutils/elfutils_0.127.bb
@@ -8,11 +8,5 @@ SRC_URI = "http://distro.ibiblio.org/pub/linux/distributions/gentoo/distfiles/el
 
 inherit autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "905411e1deda0aee17ae99dbdeaf7506"
 SRC_URI[sha256sum] = "bb5d2a846dbb5c9e779cec37a0ebdb4b1c8071131cfcce05358a08367281c38a"
diff --git a/recipes/elfutils/elfutils_0.131.bb b/recipes/elfutils/elfutils_0.131.bb
index c250c9f..866e94f 100644
--- a/recipes/elfutils/elfutils_0.131.bb
+++ b/recipes/elfutils/elfutils_0.131.bb
@@ -8,11 +8,5 @@ SRC_URI = "http://distro.ibiblio.org/pub/linux/distributions/gentoo/distfiles/el
 
 inherit autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "f7963fba80c6f74cd6c4990d2a76d121"
 SRC_URI[sha256sum] = "947a9566a622f701a2fe2416d3b85b397d38d5f4189da91fc0a306b4d9950e6f"
diff --git a/recipes/enca/enca_1.9.bb b/recipes/enca/enca_1.9.bb
index 86eae4c..30dfc9f 100644
--- a/recipes/enca/enca_1.9.bb
+++ b/recipes/enca/enca_1.9.bb
@@ -31,9 +31,5 @@ do_compile() {
     oe_runmake
 }
 
-do_stage () {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "b3581e28d68d452286fb0bfe58bed3b3"
 SRC_URI[sha256sum] = "02acfef2b24a9c842612da49338138311f909f1cd33933520c07b8b26c410f4d"
diff --git a/recipes/enchant/enchant_1.3.0.bb b/recipes/enchant/enchant_1.3.0.bb
index 8134517..8807d0d 100644
--- a/recipes/enchant/enchant_1.3.0.bb
+++ b/recipes/enchant/enchant_1.3.0.bb
@@ -20,9 +20,5 @@ FILES_${PN}-dev += "${libdir}/${PN}/*{SOLIBSDEV} ${libdir}/${PN}/*.la ${libdir}/
 
 export CXXFLAGS += " -L${STAGING_LIBDIR} -lstdc++ "
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "f7edafae875616b83e7a17a7e5c2d585"
 SRC_URI[sha256sum] = "e65015aa0e6ada88a001b07b092265f4cbaf377d99b4233972995cdb94e698ef"
diff --git a/recipes/esound/esound_0.2.36.bb b/recipes/esound/esound_0.2.36.bb
index 578b6ec..eeb83e4 100644
--- a/recipes/esound/esound_0.2.36.bb
+++ b/recipes/esound/esound_0.2.36.bb
@@ -21,11 +21,6 @@ do_configure_prepend() {
 	sed -i -e 's:/usr/include/mme:${STAGING_INCDIR}/mme:g' configure.ac
 }
 
-do_stage() {
-	autotools_stage_all
-}	
-
-
 PACKAGES =+ "esddsp esd esd-utils"
 
 FILES_esddsp = "${bindir}/esddsp ${libdir}/libesddsp.so.*"
diff --git a/recipes/eventlog/eventlog_0.2.5.bb b/recipes/eventlog/eventlog_0.2.5.bb
index 5d4f074..9dfa402 100644
--- a/recipes/eventlog/eventlog_0.2.5.bb
+++ b/recipes/eventlog/eventlog_0.2.5.bb
@@ -6,9 +6,5 @@ SRC_URI = "http://www.balabit.com/downloads/files/eventlog/0.2/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "a6bdba91f88540cc69b398fd138d86cd"
 SRC_URI[sha256sum] = "914319726bcd01a4055b1c5e09671085875af6de2b0d8589841916139574ee11"
diff --git a/recipes/evince/evince_2.28.0.bb b/recipes/evince/evince_2.28.0.bb
index 50e5134..8a62ef1 100644
--- a/recipes/evince/evince_2.28.0.bb
+++ b/recipes/evince/evince_2.28.0.bb
@@ -23,10 +23,6 @@ do_install_append() {
 	install -m 0755 ${S}/data/icons/48x48/apps/evince.png ${D}${datadir}/pixmaps/
 }
 
-do_stage () {
-	 autotools_stage_all
-}
-
 FILES_${PN}-dbg += "${libdir}/evince/1/backends/.debug"
 
 PACKAGES =+ "evince-nautilus-extension"
diff --git a/recipes/farsight/farsight_0.1.5.bb b/recipes/farsight/farsight_0.1.5.bb
index 06edacc..70e1468 100644
--- a/recipes/farsight/farsight_0.1.5.bb
+++ b/recipes/farsight/farsight_0.1.5.bb
@@ -22,12 +22,5 @@ EXTRA_OECONF = " \
 FILES_${PN} += "${libdir}/farsight-0.1/*so"
 FILES_${PN}-dev += "${libdir}/farsight-0.1/*.a ${libdir}/farsight-0.1/*.so.*"
 
-do_stage() {
-autotools_stage_all
-}
-
-
-
-
 SRC_URI[md5sum] = "2aaf871471a9ec037763c5dc7c193c57"
 SRC_URI[sha256sum] = "6b9785167934948a582839f9723e37214cab1607a9764c35f10d555f8e662575"
diff --git a/recipes/farsight/gst-plugins-farsight_0.10.1.bb b/recipes/farsight/gst-plugins-farsight_0.10.1.bb
index fc1ab2b..0c390e5 100644
--- a/recipes/farsight/gst-plugins-farsight_0.10.1.bb
+++ b/recipes/farsight/gst-plugins-farsight_0.10.1.bb
@@ -20,12 +20,5 @@ EXTRA_OECONF = " \
 FILES_${PN} += "${libdir}/gstreamer-0.10/*so"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.a ${libdir}/gstreamer-0.10/*.so.*"
 
-do_stage() {
-autotools_stage_all
-}
-
-
-
-
 SRC_URI[md5sum] = "578ef83efd03124e7085abe719513bac"
 SRC_URI[sha256sum] = "623e187f87037a690b5d0beef5991b3f2a58bb5058fad8c75329f48f0b07da4b"
diff --git a/recipes/fceu/fceu_0.98.13-pre.bb b/recipes/fceu/fceu_0.98.13-pre.bb
index 85b4301..9131db3 100644
--- a/recipes/fceu/fceu_0.98.13-pre.bb
+++ b/recipes/fceu/fceu_0.98.13-pre.bb
@@ -18,10 +18,6 @@ do_configure() {
     oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 do_install() {
         oe_runmake 'DESTDIR=${D}' install
 }
diff --git a/recipes/fftw/benchfft_3.1.bb b/recipes/fftw/benchfft_3.1.bb
index 38f2e37..efa76cd 100644
--- a/recipes/fftw/benchfft_3.1.bb
+++ b/recipes/fftw/benchfft_3.1.bb
@@ -16,10 +16,5 @@ do_compile_prepend() {
 	sed -i -e 's:all-recursive:$(RECURSIVE_TARGETS):g' ${S}/Makefile
 }
 
-do_stage () {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "9356e5e9dcb3f1481977009720a2ccf8"
 SRC_URI[sha256sum] = "1b4a5b5e48ad5e61a21586b7b59d5c0a88691a981e73e2c6dc5868197461791b"
diff --git a/recipes/fftw/fftw.inc b/recipes/fftw/fftw.inc
index 5c381e3..a62b5b7 100644
--- a/recipes/fftw/fftw.inc
+++ b/recipes/fftw/fftw.inc
@@ -16,11 +16,6 @@ do_configure_prepend() {
         echo 'AM_PROG_AS' >> ${S}/configure.ac 
 }
 
-do_stage () {
-        autotools_stage_all
-}
-
-
 PACKAGES =+ "lib${PN}"
 
 FILES_lib${PN} = "${libdir}/lib*.so.*"
diff --git a/recipes/fltk/efltk_2.0.7.bb b/recipes/fltk/efltk_2.0.7.bb
index 2da7ae0..68329ab 100644
--- a/recipes/fltk/efltk_2.0.7.bb
+++ b/recipes/fltk/efltk_2.0.7.bb
@@ -40,10 +40,6 @@ do_configure_append() {
 	sed -i s,CONFIGDIR,'"${datadir}/ede/"', src/core/Fl_Config.cpp
 }
 
-do_stage() {
-    autotools_stage_all
-}
-
 do_install () {
 	install -d ${D}${libdir}
     oe_runmake install prefix="${D}${prefix}" \
diff --git a/recipes/fltk/fltk_1.1.7.bb b/recipes/fltk/fltk_1.1.7.bb
index caf09dd..3e90209 100644
--- a/recipes/fltk/fltk_1.1.7.bb
+++ b/recipes/fltk/fltk_1.1.7.bb
@@ -18,10 +18,6 @@ do_configure() {
         oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 do_install () {
         oe_runmake install prefix="${D}${prefix}" \
                 bindir="${D}${bindir}" \
diff --git a/recipes/fluidsynth/fluidsynth_1.0.8.bb b/recipes/fluidsynth/fluidsynth_1.0.8.bb
index 1279590..5f76657 100644
--- a/recipes/fluidsynth/fluidsynth_1.0.8.bb
+++ b/recipes/fluidsynth/fluidsynth_1.0.8.bb
@@ -14,10 +14,5 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "e2abfd2e69fd8b28d965df968d7d44ee"
 SRC_URI[sha256sum] = "45e7c9967d0fb0344f4da539ab343fb979384b36a429a8594c94cf466dff4320"
diff --git a/recipes/freesmartphone/libframeworkd-glib_git.bb b/recipes/freesmartphone/libframeworkd-glib_git.bb
index 3dacc36..fbcd3ab 100644
--- a/recipes/freesmartphone/libframeworkd-glib_git.bb
+++ b/recipes/freesmartphone/libframeworkd-glib_git.bb
@@ -12,7 +12,3 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/freetype/freetype-native_2.1.10.bb b/recipes/freetype/freetype-native_2.1.10.bb
index d067e7c..ff66335 100644
--- a/recipes/freetype/freetype-native_2.1.10.bb
+++ b/recipes/freetype/freetype-native_2.1.10.bb
@@ -9,10 +9,6 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 do_install() {
 	:
 }
diff --git a/recipes/fs/fs_cvs.bb b/recipes/fs/fs_cvs.bb
index b1d6ed4..9dcba57 100644
--- a/recipes/fs/fs_cvs.bb
+++ b/recipes/fs/fs_cvs.bb
@@ -9,6 +9,3 @@ S = "${WORKDIR}/FS"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/g15daemon/g15daemon_1.2.6a.bb b/recipes/g15daemon/g15daemon_1.2.6a.bb
index 31f9269..e87f056 100644
--- a/recipes/g15daemon/g15daemon_1.2.6a.bb
+++ b/recipes/g15daemon/g15daemon_1.2.6a.bb
@@ -19,10 +19,5 @@ inherit autotools
 
 EXTRA_OECONF = "--with-gnu-ld"
 
-do_stage () {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "ba220f1fda33283af307c109cc520f61"
 SRC_URI[sha256sum] = "583c4bece816b712959aba51f49d78bb587e215fbb6a322efe832477c74f2564"
diff --git a/recipes/gamin/gamin_0.1.10.bb b/recipes/gamin/gamin_0.1.10.bb
index 392e3c3..949ca7c 100644
--- a/recipes/gamin/gamin_0.1.10.bb
+++ b/recipes/gamin/gamin_0.1.10.bb
@@ -9,9 +9,5 @@ EXTRA_OECONF = " --without-python "
 
 inherit autotools pkgconfig
 
-do_stage() {
-        autotools_stage_all
-}	
-
 SRC_URI[md5sum] = "b4ec549e57da470c04edd5ec2876a028"
 SRC_URI[sha256sum] = "28085f0ae8be10eab582ff186af4fb0be92cc6c62b5cc19cd09b295c7c2899a1"
diff --git a/recipes/gamin/gamin_0.1.8.bb b/recipes/gamin/gamin_0.1.8.bb
index 7d76b90..b2c58b1 100644
--- a/recipes/gamin/gamin_0.1.8.bb
+++ b/recipes/gamin/gamin_0.1.8.bb
@@ -10,9 +10,5 @@ EXTRA_OECONF = " --without-python "
 
 inherit autotools pkgconfig
 
-do_stage() {
-        autotools_stage_all
-}	
-
 SRC_URI[md5sum] = "985022c8b1b993e471d528fd0e14ffbe"
 SRC_URI[sha256sum] = "be22f69b4797db510f4270ff0e228dd027e99e561ac5f5d38be595be7e82d203"
diff --git a/recipes/gammu/gammu_1.26.1.bb b/recipes/gammu/gammu_1.26.1.bb
index c884c02..7b88a52 100644
--- a/recipes/gammu/gammu_1.26.1.bb
+++ b/recipes/gammu/gammu_1.26.1.bb
@@ -17,10 +17,6 @@ do_configure() {
     ./configure --prefix=${prefix} --enable-shared --enable-backup
 }
 
-do_stage() {
-    autotools_stage_all
-}
-
 # gammu has a non-standard uninstalled .pc file, which confuses pkgconfig.bbclass.
 # Replace it by custom do_stage_append():
 #do_stage_append () {
diff --git a/recipes/gdal/gdal_1.3.2.bb b/recipes/gdal/gdal_1.3.2.bb
index aaff406..9d595f6 100644
--- a/recipes/gdal/gdal_1.3.2.bb
+++ b/recipes/gdal/gdal_1.3.2.bb
@@ -36,10 +36,5 @@ do_package_prepend() {
 	os.system('cp -pPR ${D}${D}* ${D}../')
 }
 
-do_stage() {
-        autotools_stage_all
-}	
-
-
 SRC_URI[md5sum] = "67ed02dcea21e93f5e123bb0d322898a"
 SRC_URI[sha256sum] = "00f2b73fea5eff79ae26338928187f956427421bc70ddab0ab63fe5a58112b87"
diff --git a/recipes/geda/libgeda_1.4.3.bb b/recipes/geda/libgeda_1.4.3.bb
index bfb1bfb..c812ef7 100644
--- a/recipes/geda/libgeda_1.4.3.bb
+++ b/recipes/geda/libgeda_1.4.3.bb
@@ -16,9 +16,5 @@ do_install_prepend() {
 	sed -i 's:${STAGING_DIR_HOST}::g' libgeda.pc
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "f4254f345b5d1a1f3ae4e2e27ae38b0a"
 SRC_URI[sha256sum] = "f3687c7308231634619de278b5880cccd6b9b3fc04a4c1b1cf8b2e3131f6f158"
diff --git a/recipes/ggz/libggz_0.0.14.1.bb b/recipes/ggz/libggz_0.0.14.1.bb
index 1897311..cc183ba 100644
--- a/recipes/ggz/libggz_0.0.14.1.bb
+++ b/recipes/ggz/libggz_0.0.14.1.bb
@@ -8,11 +8,5 @@ inherit autotools
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "603739504648833779aa13b0327a1c3d"
 SRC_URI[sha256sum] = "54301052a327f2ff3f2d684c5b1d7920e8601e13f4f8d5f1d170e5a7c9585e85"
diff --git a/recipes/gimp/babl_svn.bb b/recipes/gimp/babl_svn.bb
index b9ce3cd..2f8eca7 100644
--- a/recipes/gimp/babl_svn.bb
+++ b/recipes/gimp/babl_svn.bb
@@ -12,11 +12,6 @@ SRC_URI = "svn://svn.gnome.org/svn/${PN};module=trunk"
 
 S = "${WORKDIR}/trunk"
 
-do_stage() {
-        autotools_stage_all
-}	
-
-
 FILES_${PN} += "${libdir}/babl-0.0/"
 FILES_${PN}-dbg += "${libdir}/babl-0.0/.debug/"
 
diff --git a/recipes/gimp/gimp.inc b/recipes/gimp/gimp.inc
index 6462112..c3f2393 100644
--- a/recipes/gimp/gimp.inc
+++ b/recipes/gimp/gimp.inc
@@ -26,11 +26,6 @@ do_configure_append() {
         find ${S} -name Makefile | xargs sed -i s:'file-wmf$(EXEEXT)':'':g
 }
 
-
-do_stage() {
-        autotools_stage_all
-}
-
 python populate_packages_prepend () {
 	cv_libdir = bb.data.expand('${libdir}', d)
 	do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'GIMP %s library', extra_depends='', allow_links=True)
diff --git a/recipes/gloox/gloox_0.8.1.bb b/recipes/gloox/gloox_0.8.1.bb
index 8198914..cb5c788 100644
--- a/recipes/gloox/gloox_0.8.1.bb
+++ b/recipes/gloox/gloox_0.8.1.bb
@@ -10,9 +10,5 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://camaya.net/download/${P}.tar.bz2"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "9054d072f5972d5e567c428531734ad5"
 SRC_URI[sha256sum] = "7f836c8189b55ef4ec8f3387673687d0a5c1a713abc9617144638b28e6857bd2"
diff --git a/recipes/gloox/gloox_0.8.9.bb b/recipes/gloox/gloox_0.8.9.bb
index 8424d29..a475bbd 100644
--- a/recipes/gloox/gloox_0.8.9.bb
+++ b/recipes/gloox/gloox_0.8.9.bb
@@ -11,9 +11,5 @@ inherit autotools pkgconfig
 SRC_URI = "http://camaya.net/download/${P}.tar.bz2 \
 	   file://gloox-fix-pc.diff"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "dc590e34107de5cb296c238afa8e843b"
 SRC_URI[sha256sum] = "9d9ef356cc4478499442573556787125dc76c8acd1e55e5001fb11f1e224d27f"
diff --git a/recipes/gmp/gmp.inc b/recipes/gmp/gmp.inc
index 6011223..55209f3 100644
--- a/recipes/gmp/gmp.inc
+++ b/recipes/gmp/gmp.inc
@@ -13,6 +13,3 @@ ARM_INSTRUCTION_SET = "arm"
 
 acpaths = ""
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gnet/gnet_cvs.bb b/recipes/gnet/gnet_cvs.bb
index 93a257c..08cc5c0 100644
--- a/recipes/gnet/gnet_cvs.bb
+++ b/recipes/gnet/gnet_cvs.bb
@@ -13,6 +13,3 @@ EXTRA_OECONF =	"--disable-pthreads"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/gnome/gnome-python-extras_2.25.3.bb b/recipes/gnome/gnome-python-extras_2.25.3.bb
index 5c070af..1f4f330 100644
--- a/recipes/gnome/gnome-python-extras_2.25.3.bb
+++ b/recipes/gnome/gnome-python-extras_2.25.3.bb
@@ -32,9 +32,6 @@ do_configure_prepend() {
 }	
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-	autotools_stage_all
-}	
 
 FILES_${PN}-dev += "${datadir}/pygtk"
 
diff --git a/recipes/gnome/gnome-python_2.22.1.bb b/recipes/gnome/gnome-python_2.22.1.bb
index 8fd78cb..67b815f 100644
--- a/recipes/gnome/gnome-python_2.22.1.bb
+++ b/recipes/gnome/gnome-python_2.22.1.bb
@@ -16,9 +16,5 @@ do_configure() {
 	autotools_do_configure
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "02054115dc86617da2a80eb87a1f988b"
 SRC_URI[archive.sha256sum] = "559b5d857b4fbc31418bc677f3391182ba1c357cabb8dfee04a1e709a7a63d01"
diff --git a/recipes/gnome/gnome-python_2.26.1.bb b/recipes/gnome/gnome-python_2.26.1.bb
index ecd9080..aa52bda 100644
--- a/recipes/gnome/gnome-python_2.26.1.bb
+++ b/recipes/gnome/gnome-python_2.26.1.bb
@@ -17,10 +17,6 @@ do_configure_prepend() {
            ${S}/configure.ac
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${datadir}"
 FILES_${PN}-dbg += "${libdir}/gnome-vfs-2.0/modules/.debug"
 
diff --git a/recipes/gnome/gnome-session_2.24.1.bb b/recipes/gnome/gnome-session_2.24.1.bb
index 77835d7..38f0487 100644
--- a/recipes/gnome/gnome-session_2.24.1.bb
+++ b/recipes/gnome/gnome-session_2.24.1.bb
@@ -9,9 +9,5 @@ EXTRA_OECONF = " ac_cv_path_GCONF_SANITY_CHECK=set "
 FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${datadir}/gnome"
 FILES_${PN}-dbg += "${libdir}/gnome-session/helpers/"
 
-do_stage () {
-	 autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "5bf6f5753eab034638aee80d993801d2"
 SRC_URI[archive.sha256sum] = "9fc3f6d0dc7e664ff2b1507369183e5d0f1b17fc9f6643bf5e6a3ff8b6e7c211"
diff --git a/recipes/gnome/gnome-session_2.28.0.bb b/recipes/gnome/gnome-session_2.28.0.bb
index c93e8d8..07179c2 100644
--- a/recipes/gnome/gnome-session_2.28.0.bb
+++ b/recipes/gnome/gnome-session_2.28.0.bb
@@ -14,10 +14,6 @@ do_configure_append() {
 	done	
 }
 
-do_stage () {
-	 autotools_stage_all
-}
-
 FILES_${PN} += "${datadir}/xsessions ${datadir}/icons ${datadir}/gnome ${libdir}/gnome-session/helpers"
 FILES_${PN}-dbg += "${libdir}/gnome-session/helpers/.debug"
 
diff --git a/recipes/gnome/gnome-settings-daemon_2.24.0.bb b/recipes/gnome/gnome-settings-daemon_2.24.0.bb
index 70327e1..8ff3838 100644
--- a/recipes/gnome/gnome-settings-daemon_2.24.0.bb
+++ b/recipes/gnome/gnome-settings-daemon_2.24.0.bb
@@ -15,10 +15,5 @@ FILES_${PN} += "${libdir}/gnome-settings-daemon-2.0/*.so ${libdir}/gnome-setting
 FILES_${PN}-dbg += "${libdir}/gnome-settings-daemon-2.0/.debug"
 FILES_${PN}-dev += "${libdir}/gnome-settings-daemon-2.0/*.a ${libdir}/gnome-settings-daemon-2.0/*.la"
 
-do_stage() {    
-	autotools_stage_all
-}
-
-
 SRC_URI[archive.md5sum] = "2e30e9d17b810103d493e474fbfd20e5"
 SRC_URI[archive.sha256sum] = "98377ed6d7c4abb75b746570f07e00a4346ba6f5924574130211beca764bb99d"
diff --git a/recipes/gnome/gnome-terminal_2.26.2.bb b/recipes/gnome/gnome-terminal_2.26.2.bb
index 2e4b297..4fffd22 100644
--- a/recipes/gnome/gnome-terminal_2.26.2.bb
+++ b/recipes/gnome/gnome-terminal_2.26.2.bb
@@ -10,11 +10,5 @@ do_configure_prepend () {
 	cp ${STAGING_DATADIR}/gnome-common/data/omf.make ${S}
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[archive.md5sum] = "f4f64b9b67c7a3147799ee10f7cf00e1"
 SRC_URI[archive.sha256sum] = "f937939eca0082dc7f3f9ddab72d612433ad948aac7e158ed75f5d7053e8d0e0"
diff --git a/recipes/gnome/gnome-terminal_2.28.0.bb b/recipes/gnome/gnome-terminal_2.28.0.bb
index 6dc8d65..29b7b3e 100644
--- a/recipes/gnome/gnome-terminal_2.28.0.bb
+++ b/recipes/gnome/gnome-terminal_2.28.0.bb
@@ -12,11 +12,5 @@ do_configure_prepend () {
 	cp ${STAGING_DATADIR}/gnome-common/data/omf.make ${S}
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[archive.md5sum] = "9cdc3581a03a44dd693663991d1c1e9f"
 SRC_URI[archive.sha256sum] = "c3f1ce6248e47cac5f3c5c0a79a079d5c7756ba1c4867eb43e20e929087b4a5a"
diff --git a/recipes/gnome/gnome-utils_2.28.0.bb b/recipes/gnome/gnome-utils_2.28.0.bb
index 9b008ac..15a912f 100644
--- a/recipes/gnome/gnome-utils_2.28.0.bb
+++ b/recipes/gnome/gnome-utils_2.28.0.bb
@@ -15,10 +15,6 @@ do_configure_append() {
         done
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${datadir}/baobab \
                 ${datadir}/gdict-1.0 \
                 ${datadir}/gnome-dictionary \
diff --git a/recipes/gnome/gnome-vfs_2.22.0.bb b/recipes/gnome/gnome-vfs_2.22.0.bb
index 70c563a..5ce0648 100644
--- a/recipes/gnome/gnome-vfs_2.22.0.bb
+++ b/recipes/gnome/gnome-vfs_2.22.0.bb
@@ -30,10 +30,6 @@ FILES_${PN}-dev += "\
 "
 FILES_${PN}-doc += "${datadir}/gtk-doc"
 
-do_stage () {
-autotools_stage_all
-}
-
 PACKAGES_DYNAMIC = "gnome-vfs-plugin-*"
 
 python populate_packages_prepend () {
diff --git a/recipes/gnome/gnome-vfs_2.24.1.bb b/recipes/gnome/gnome-vfs_2.24.1.bb
index 7e2af8e..e47f28d 100644
--- a/recipes/gnome/gnome-vfs_2.24.1.bb
+++ b/recipes/gnome/gnome-vfs_2.24.1.bb
@@ -26,10 +26,6 @@ do_configure_prepend() {
         sed -i -e 's:	doc	::g' Makefile.am
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 PACKAGES_DYNAMIC = "gnome-vfs-plugin-*"
 
 python populate_packages_prepend () {
diff --git a/recipes/gnome/goffice_0.6.3.bb b/recipes/gnome/goffice_0.6.3.bb
index d1ed381..13bbe57 100644
--- a/recipes/gnome/goffice_0.6.3.bb
+++ b/recipes/gnome/goffice_0.6.3.bb
@@ -8,10 +8,6 @@ FILES_${PN}-dbg += "${libdir}/goffice/${PV}/plugins/*/.debug"
 
 inherit gnome pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES_DYNAMIC = "goffice-plugin-*"
 
 python populate_packages_prepend () {
diff --git a/recipes/gnome/goffice_0.7.14.bb b/recipes/gnome/goffice_0.7.14.bb
index e40cb1a..176d402 100644
--- a/recipes/gnome/goffice_0.7.14.bb
+++ b/recipes/gnome/goffice_0.7.14.bb
@@ -10,10 +10,6 @@ inherit gnome pkgconfig
 SRC_URI += " file://c99math.patch \
              file://nodolt.patch "
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN}-dbg += "${libdir}/goffice/${PV}/plugins/*/.debug"
 
 RRECOMMENDS_${PN} = " \
diff --git a/recipes/gnome/gvfs_0.0.2.bb b/recipes/gnome/gvfs_0.0.2.bb
index 88e239f..4a70b94 100644
--- a/recipes/gnome/gvfs_0.0.2.bb
+++ b/recipes/gnome/gvfs_0.0.2.bb
@@ -17,9 +17,5 @@ FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${sysconfdir}/gvfs/mounts/ftp.mount"
 FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${sysconfdir}/gvfs/mounts/sftp.mount"
 FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${sysconfdir}/gvfs/mounts/trash.mount"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "1267b82b481340eadf212cf47b735b62"
 SRC_URI[archive.sha256sum] = "7249197b75a61c36398f7458f12c0318ccf03639ae8404771fb4ff414fa17683"
diff --git a/recipes/gnome/gvfs_1.0.1.bb b/recipes/gnome/gvfs_1.0.1.bb
index c000288..0cec17b 100644
--- a/recipes/gnome/gvfs_1.0.1.bb
+++ b/recipes/gnome/gvfs_1.0.1.bb
@@ -17,9 +17,5 @@ FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${sysconfdir}/gvfs/mounts/ftp.mount"
 FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${sysconfdir}/gvfs/mounts/sftp.mount"
 FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${sysconfdir}/gvfs/mounts/trash.mount"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "0d123f87e3e660271cd9d11b8c592c5a"
 SRC_URI[archive.sha256sum] = "67e7dd1dca32a99eb1102a853d2df1bac782d50a4361511409572cfe8ea51147"
diff --git a/recipes/gnome/gvfs_1.0.3.bb b/recipes/gnome/gvfs_1.0.3.bb
index 33a3327..bc34a76 100644
--- a/recipes/gnome/gvfs_1.0.3.bb
+++ b/recipes/gnome/gvfs_1.0.3.bb
@@ -17,9 +17,5 @@ FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${sysconfdir}/gvfs/mounts/ftp.mount"
 FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${sysconfdir}/gvfs/mounts/sftp.mount"
 FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${sysconfdir}/gvfs/mounts/trash.mount"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "a41e8b7d99e390cef8312f7ce5f312a5"
 SRC_URI[archive.sha256sum] = "17eccded6e096208181e2c7625802526112af23f5b2c7b2a672ab9ccff3a55fd"
diff --git a/recipes/gnome/gvfs_1.2.1.bb b/recipes/gnome/gvfs_1.2.1.bb
index 926885e..780237f 100644
--- a/recipes/gnome/gvfs_1.2.1.bb
+++ b/recipes/gnome/gvfs_1.2.1.bb
@@ -16,9 +16,5 @@ FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${sysconfdir}/gvfs/mounts/ftp.mount"
 FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${sysconfdir}/gvfs/mounts/sftp.mount"
 FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${sysconfdir}/gvfs/mounts/trash.mount"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "df8f624587adfabe7009838ce6d8d5fd"
 SRC_URI[archive.sha256sum] = "0e3c3469721ff1d4296bf4af7e1f131201d2dc6a36c772d99e1630f8cce31da2"
diff --git a/recipes/gnome/gvfs_1.3.3.bb b/recipes/gnome/gvfs_1.3.3.bb
index bd0d560..70442ee 100644
--- a/recipes/gnome/gvfs_1.3.3.bb
+++ b/recipes/gnome/gvfs_1.3.3.bb
@@ -16,9 +16,5 @@ FILES_gvfsd-ftp = "${libexecdir}/gvfsd-ftp ${sysconfdir}/gvfs/mounts/ftp.mount"
 FILES_gvfsd-sftp = "${libexecdir}/gvfsd-sftp ${sysconfdir}/gvfs/mounts/sftp.mount"
 FILES_gvfsd-trash = "${libexecdir}/gvfsd-trash ${sysconfdir}/gvfs/mounts/trash.mount"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "2f1c65dcde8fc4d0603e11a8ec3fc178"
 SRC_URI[archive.sha256sum] = "453476904745e355a69987bcd20c5db1bc9a1757022f8dd8c0f3b7142f3a00fd"
diff --git a/recipes/gnome/hippo-canvas_0.3.0.bb b/recipes/gnome/hippo-canvas_0.3.0.bb
index 9608fc0..454a52c 100644
--- a/recipes/gnome/hippo-canvas_0.3.0.bb
+++ b/recipes/gnome/hippo-canvas_0.3.0.bb
@@ -13,9 +13,6 @@ do_configure_prepend() {
 
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-        autotools_stage_all
-}
 
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug"
diff --git a/recipes/gnome/libbacon_svn.bb b/recipes/gnome/libbacon_svn.bb
index 2f36c3d..ab00c42 100644
--- a/recipes/gnome/libbacon_svn.bb
+++ b/recipes/gnome/libbacon_svn.bb
@@ -11,10 +11,3 @@ SRC_URI = "svn://svn.gnome.org/svn/${PN}/;module=trunk"
 
 S = "${WORKDIR}/trunk"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
-
diff --git a/recipes/gnome/libgail-gnome_1.20.1.bb b/recipes/gnome/libgail-gnome_1.20.1.bb
index 5d2b2fa..b113b51 100644
--- a/recipes/gnome/libgail-gnome_1.20.1.bb
+++ b/recipes/gnome/libgail-gnome_1.20.1.bb
@@ -7,10 +7,6 @@ DEPENDS="atk gtk+ libbonobo libbonoboui gnome-panel at-spi"
 
 inherit gnome
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/gtk-2.0/modules/*.so"
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
 
diff --git a/recipes/gnome/libgnome_2.12.0.1.bb b/recipes/gnome/libgnome_2.12.0.1.bb
index 150482b..1a5c750 100644
--- a/recipes/gnome/libgnome_2.12.0.1.bb
+++ b/recipes/gnome/libgnome_2.12.0.1.bb
@@ -9,9 +9,5 @@ DEPENDS = "gconf-native gnome-vfs libbonobo"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "f239a7ab132d2ec9039bb2537cca1e92"
 SRC_URI[archive.sha256sum] = "f4cd8f6df545328b2b969d1fa8762d5398f7f6c517c7fac730f1d2196e4cf624"
diff --git a/recipes/gnome/libgnome_2.14.1.bb b/recipes/gnome/libgnome_2.14.1.bb
index f0a1261..8b7c5f7 100644
--- a/recipes/gnome/libgnome_2.14.1.bb
+++ b/recipes/gnome/libgnome_2.14.1.bb
@@ -9,9 +9,5 @@ DEPENDS = "gconf-native gnome-vfs libbonobo esound"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "bf53815df10db62bbf00defd4100b8d8"
 SRC_URI[archive.sha256sum] = "4d091bd00e01392d65a856ca5b9fe648025c5988c844d58b25341a275b760fa7"
diff --git a/recipes/gnome/libgnome_2.16.0.bb b/recipes/gnome/libgnome_2.16.0.bb
index 4d59089..9f86d34 100644
--- a/recipes/gnome/libgnome_2.16.0.bb
+++ b/recipes/gnome/libgnome_2.16.0.bb
@@ -9,9 +9,5 @@ DEPENDS = "gconf-native gnome-vfs libbonobo esound"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "b3f030f6c677b0e1bcfca7c7e58d6c4a"
 SRC_URI[archive.sha256sum] = "78a2d66bea1d856f06fbd3348abceded8975f09c767a17f58e1d9cd8011ab710"
diff --git a/recipes/gnome/libgnome_2.18.0.bb b/recipes/gnome/libgnome_2.18.0.bb
index 8c95944..28408fb 100644
--- a/recipes/gnome/libgnome_2.18.0.bb
+++ b/recipes/gnome/libgnome_2.18.0.bb
@@ -9,9 +9,5 @@ DEPENDS = "gconf-native gnome-vfs libbonobo esound"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "73426589d7c6fa3266fe4e8f3be2f5b5"
 SRC_URI[archive.sha256sum] = "53e3b241343c7ea9c4a8db4ca898fd7020c281f1400826d899b841d760dd5ba9"
diff --git a/recipes/gnome/libgnome_2.24.0.bb b/recipes/gnome/libgnome_2.24.0.bb
index 7809026..840d21c 100644
--- a/recipes/gnome/libgnome_2.24.0.bb
+++ b/recipes/gnome/libgnome_2.24.0.bb
@@ -14,9 +14,5 @@ FILES_${PN} += "${libdir}/bonobo/servers ${libdir}/bonobo/monikers/*.so \
 FILES_${PN}-dev += "${libdir}/bonobo/monikers/*a"
 FILES_${PN}-dbg += "${libdir}/bonobo/monikers/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "35a2b6f214ddd9b6732b3b361140115a"
 SRC_URI[archive.sha256sum] = "aaff55f25077f4e4b1264d561a724e8d98a8842cd7d00ab7973c59bd040554ee"
diff --git a/recipes/gnome/libgnome_2.28.0.bb b/recipes/gnome/libgnome_2.28.0.bb
index 5a742d0..fe02fb0 100644
--- a/recipes/gnome/libgnome_2.28.0.bb
+++ b/recipes/gnome/libgnome_2.28.0.bb
@@ -19,9 +19,5 @@ do_configure_prepend() {
 	echo "EXTRA_DIST = version.xml" > gtk-doc.make
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "5c7efe21dc28c137aa766a77a84c0c29"
 SRC_URI[archive.sha256sum] = "9b5b05085b814406f75abfaa1a85395bcf92c8f933248219e1bd738d500d0c0e"
diff --git a/recipes/gnome/libgnomecanvas_2.14.0.bb b/recipes/gnome/libgnomecanvas_2.14.0.bb
index 13a9bc1..0a2f8ff 100644
--- a/recipes/gnome/libgnomecanvas_2.14.0.bb
+++ b/recipes/gnome/libgnomecanvas_2.14.0.bb
@@ -12,9 +12,5 @@ FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
 FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
 FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas.*a"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "516c46fb4a1401b05cfef58c350fbd3d"
 SRC_URI[archive.sha256sum] = "5ceadd704327c2967868b3c0c81b5e600e1c6fd4f8efcbaaf89f9b18aa8bb5cf"
diff --git a/recipes/gnome/libgnomecanvas_2.20.0.bb b/recipes/gnome/libgnomecanvas_2.20.0.bb
index f1d3f29..59c579a 100644
--- a/recipes/gnome/libgnomecanvas_2.20.0.bb
+++ b/recipes/gnome/libgnomecanvas_2.20.0.bb
@@ -13,9 +13,5 @@ FILES_${PN} += "${libdir}/libglade/*/libcanvas.so"
 FILES_${PN}-dbg += "${libdir}/libglade/*/.debug/"
 FILES_${PN}-dev += "${libdir}/libglade/*/libcanvas.*a"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "109b71b02e0c976d65b46129d0ad69d1"
 SRC_URI[archive.sha256sum] = "c1d7301ecea3719e307182222ba19375b74017580d58e4a25f4ae15c8c8f9c3f"
diff --git a/recipes/gnome/libgnomecanvas_2.26.0.bb b/recipes/gnome/libgnomecanvas_2.26.0.bb
index 0ec2542..37c1e2d 100644
--- a/recipes/gnome/libgnomecanvas_2.26.0.bb
+++ b/recipes/gnome/libgnomecanvas_2.26.0.bb
@@ -16,9 +16,5 @@ do_configure_prepend() {
     sed -i -e s:docs::g ${S}/Makefile.am
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "9bbc635e5ae70e63af071af74ba7e72f"
 SRC_URI[archive.sha256sum] = "80b480acc33d7303f651e9c5bc8fea51c9e9a9ed59ebfdbbb730dd798bcbc58d"
diff --git a/recipes/gnome/libgnomecups_0.2.2.bb b/recipes/gnome/libgnomecups_0.2.2.bb
index 46aef88..322ce8c 100644
--- a/recipes/gnome/libgnomecups_0.2.2.bb
+++ b/recipes/gnome/libgnomecups_0.2.2.bb
@@ -12,10 +12,5 @@ do_compile_append () {
 	sed 's:${STAGING_DIR_HOST}::' < libgnomecups-1.0.pc.old > libgnomecups-1.0.pc
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[archive.md5sum] = "959d5524fe9c37efb55ccfa02e3a063b"
 SRC_URI[archive.sha256sum] = "f70599274dbb575fbbc83bb58179b757800e5d87e59e35f5d95e618c7ec31444"
diff --git a/recipes/gnome/libgnomecups_0.2.3.bb b/recipes/gnome/libgnomecups_0.2.3.bb
index e065537..8c43db4 100644
--- a/recipes/gnome/libgnomecups_0.2.3.bb
+++ b/recipes/gnome/libgnomecups_0.2.3.bb
@@ -12,10 +12,5 @@ do_compile_append () {
 	sed 's:${STAGING_DIR_HOST}::' < libgnomecups-1.0.pc.old > libgnomecups-1.0.pc
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[archive.md5sum] = "dc4920c15c9f886f73ea74fbff0ae48b"
 SRC_URI[archive.sha256sum] = "e130e80942b386de19a288a4c194ff3dbe9140315b31e982058c8bffbb6a1d29"
diff --git a/recipes/gnome/libgnomekbd_2.24.0.bb b/recipes/gnome/libgnomekbd_2.24.0.bb
index 9d13feb..c21219a 100644
--- a/recipes/gnome/libgnomekbd_2.24.0.bb
+++ b/recipes/gnome/libgnomekbd_2.24.0.bb
@@ -10,13 +10,5 @@ do_configure_append() {
         find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
-do_stage() {
-    autotools_stage_all
-}
-
-
-
-
-
 SRC_URI[archive.md5sum] = "43e4d090bc67a1984bebf551637783fd"
 SRC_URI[archive.sha256sum] = "60f093b4fcbdfa12212d6e29dc2f7802a3234d8035f45efed4b426c0bb293c5a"
diff --git a/recipes/gnome/libgnomekbd_2.28.0.bb b/recipes/gnome/libgnomekbd_2.28.0.bb
index 97776cb..d28162e 100644
--- a/recipes/gnome/libgnomekbd_2.28.0.bb
+++ b/recipes/gnome/libgnomekbd_2.28.0.bb
@@ -11,13 +11,5 @@ do_configure_append() {
         find ${S} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAGING_INCDIR}':g
 }
 
-do_stage() {
-    autotools_stage_all
-}
-
-
-
-
-
 SRC_URI[archive.md5sum] = "b0989c4a2dbe2b5dd892d14195674f2b"
 SRC_URI[archive.sha256sum] = "72da2cc218de666a0ffa8896ae2d01bce3f46fde7072f2aa937c2bcd2d312668"
diff --git a/recipes/gnome/libgnomeprint_2.18.5.bb b/recipes/gnome/libgnomeprint_2.18.5.bb
index 6149941..8596db7 100644
--- a/recipes/gnome/libgnomeprint_2.18.5.bb
+++ b/recipes/gnome/libgnomeprint_2.18.5.bb
@@ -8,9 +8,5 @@ inherit flow-lossage pkgconfig gnome
 FILES_${PN}-dbg += "${libdir}/libgnomeprint/${PV}/modules/transports/.debug \
 		    ${libdir}/libgnomeprint/${PV}/modules/.debug  ${libdir}/libgnomeprint/${PV}/modules/*/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "c325baf4487335259e050619185787b1"
 SRC_URI[archive.sha256sum] = "0ead99d6e227192d09902bdb37ec6aac25555a453ff4c338b49700fc477070c5"
diff --git a/recipes/gnome/libgnomeprintui_2.18.3.bb b/recipes/gnome/libgnomeprintui_2.18.3.bb
index 9e2af8f..8eb93ba 100644
--- a/recipes/gnome/libgnomeprintui_2.18.3.bb
+++ b/recipes/gnome/libgnomeprintui_2.18.3.bb
@@ -7,9 +7,5 @@ inherit gnome pkgconfig
 
 EXTRA_OECONF = "use_local_libgnomeprint_la=no"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "f2c5796f15d6b6701bfa224d856098ce"
 SRC_URI[archive.sha256sum] = "4f7c75e54474a76eff41b6e3da15afadd2d5207a04bc82d85b728395563cf747"
diff --git a/recipes/gnome/libgnomeui_2.12.0.bb b/recipes/gnome/libgnomeui_2.12.0.bb
index b3b6803..e6dc887 100644
--- a/recipes/gnome/libgnomeui_2.12.0.bb
+++ b/recipes/gnome/libgnomeui_2.12.0.bb
@@ -20,9 +20,5 @@ do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/gnome-stock-pixbufs.h ${S}/libgnomeui/pixmaps/gnome-stock-pixbufs.h
 }
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "342a5b8a9d427ff950a71a245a5f4485"
 SRC_URI[archive.sha256sum] = "b29baf52bf2c80bf896d59cfd4c4c1515b7df56b14069834b0e78910b9088dfe"
diff --git a/recipes/gnome/libgnomeui_2.15.2.bb b/recipes/gnome/libgnomeui_2.15.2.bb
index 3cf274a..b9aa62e 100644
--- a/recipes/gnome/libgnomeui_2.15.2.bb
+++ b/recipes/gnome/libgnomeui_2.15.2.bb
@@ -19,9 +19,5 @@ do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/gnome-stock-pixbufs.h ${S}/libgnomeui/pixmaps/gnome-stock-pixbufs.h
 }
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "ec5841c2c01d79e97bc363414e446240"
 SRC_URI[archive.sha256sum] = "3bb709d3dbb7287482d236e418e9ca4b858f28dfd374c6840f0aebae6b206894"
diff --git a/recipes/gnome/libgnomeui_2.16.1.bb b/recipes/gnome/libgnomeui_2.16.1.bb
index 98d5375..9199bb2 100644
--- a/recipes/gnome/libgnomeui_2.16.1.bb
+++ b/recipes/gnome/libgnomeui_2.16.1.bb
@@ -22,9 +22,5 @@ do_configure_prepend() {
 	install -m 0644 ${WORKDIR}/gnome-stock-pixbufs.h ${S}/libgnomeui/pixmaps/gnome-stock-pixbufs.h
 }
 
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "d9b975952bf5feee8818d3fb18cca0b3"
 SRC_URI[archive.sha256sum] = "552c34d20f30847429e342e6c6ddeece707b69a5abe9aeeafcfeb65cec2eebd7"
diff --git a/recipes/gnome/libgsf_1.13.2.bb b/recipes/gnome/libgsf_1.13.2.bb
index 2079551..af00705 100644
--- a/recipes/gnome/libgsf_1.13.2.bb
+++ b/recipes/gnome/libgsf_1.13.2.bb
@@ -11,10 +11,5 @@ FILES_${PN}-gnome-dev = "${libdir}/libgsf-gnome-1.* ${includedir}/libgsf-1/gsf-g
 
 inherit autotools pkgconfig gnome
 
-
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "0894afd88f9e43eada27e52cb22cd0f1"
 SRC_URI[archive.sha256sum] = "ef7833047caf66ed3de7b0195223911d28e45c78617d25c6bd05a53fd6c30a0c"
diff --git a/recipes/gnome/libgsf_1.13.3.bb b/recipes/gnome/libgsf_1.13.3.bb
index 710abe2..d8f0b6f 100644
--- a/recipes/gnome/libgsf_1.13.3.bb
+++ b/recipes/gnome/libgsf_1.13.3.bb
@@ -13,10 +13,5 @@ FILES_${PN}-gnome-dev = "${libdir}/libgsf-gnome-1.* ${includedir}/libgsf-1/gsf-g
 
 inherit autotools pkgconfig gnome
 
-
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "b35e95f6bd7b8add9981b6cf6336674a"
 SRC_URI[archive.sha256sum] = "458e7b2ca26f0d212f91b445f0a93db62a679ec671bd3cc980f3c1ac65f06b96"
diff --git a/recipes/gnome/libgsf_1.14.16.bb b/recipes/gnome/libgsf_1.14.16.bb
index d5234c7..dcf5663 100644
--- a/recipes/gnome/libgsf_1.14.16.bb
+++ b/recipes/gnome/libgsf_1.14.16.bb
@@ -17,9 +17,5 @@ EXTRA_OECONF = "\
 		--with-gnome \
 		--with-bz2"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "8478d83fda0b6e57f36550c11a693ee1"
 SRC_URI[archive.sha256sum] = "11fd8fca1bdbcfa426276a124ad083cca9632f03cf766523bcdfb2fca0b08908"
diff --git a/recipes/gnome/libgsf_1.14.8.bb b/recipes/gnome/libgsf_1.14.8.bb
index c6bc01a..cc6be31 100644
--- a/recipes/gnome/libgsf_1.14.8.bb
+++ b/recipes/gnome/libgsf_1.14.8.bb
@@ -18,9 +18,5 @@ EXTRA_OECONF = "\
 		--with-gnome \
 		--with-bz2"
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "09e4b6639be79fa888cabc751f73674f"
 SRC_URI[archive.sha256sum] = "d5f635ea86f8417dd777c32bcf7ef86cf3af3912f34ae21db9933a0e48e54748"
diff --git a/recipes/gnome/libgtop_2.23.4.bb b/recipes/gnome/libgtop_2.23.4.bb
index 671a45e..6abc68b 100644
--- a/recipes/gnome/libgtop_2.23.4.bb
+++ b/recipes/gnome/libgtop_2.23.4.bb
@@ -5,9 +5,5 @@ inherit gnome lib_package
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "bb37766ba407983a8e055eb4705a1a81"
 SRC_URI[archive.sha256sum] = "7d9b0e68b4e84e7938197c5240023d3b6840026cfc9f83bdab202fbab4029a9b"
diff --git a/recipes/gnome/libgtop_2.24.0.bb b/recipes/gnome/libgtop_2.24.0.bb
index 3c5104a..e4afc5a 100644
--- a/recipes/gnome/libgtop_2.24.0.bb
+++ b/recipes/gnome/libgtop_2.24.0.bb
@@ -5,9 +5,5 @@ inherit gnome lib_package
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "f0e3584b9157d3425184a9e21e3ac482"
 SRC_URI[archive.sha256sum] = "af9643abf15887c9cb501a4dcc6f432ec0896b7087ef8739526f284ed1461a18"
diff --git a/recipes/gnome/libgweather_2.22.3.bb b/recipes/gnome/libgweather_2.22.3.bb
index e50c8e9..eb2c899 100644
--- a/recipes/gnome/libgweather_2.22.3.bb
+++ b/recipes/gnome/libgweather_2.22.3.bb
@@ -16,9 +16,5 @@ FILES_${PN} =+ "${datadir}/gnome* \
 
 EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "151e03d925579241decc92afa4d07182"
 SRC_URI[archive.sha256sum] = "d5a799e1d11cd91865cb716a11de970de97d7ef679684db0a893fc6a65a9acd0"
diff --git a/recipes/gnome/libgweather_2.24.0.bb b/recipes/gnome/libgweather_2.24.0.bb
index f8045f1..c72de4d 100644
--- a/recipes/gnome/libgweather_2.24.0.bb
+++ b/recipes/gnome/libgweather_2.24.0.bb
@@ -18,9 +18,5 @@ FILES_${PN} =+ "${datadir}/gnome* \
 
 EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "d006328ec5cebc5dbf3a18834db95bba"
 SRC_URI[archive.sha256sum] = "0abae1eef7210e4decab7f89ea5b3a012c06859e91923a7212ca50856bffd500"
diff --git a/recipes/gnome/libgweather_2.26.0.bb b/recipes/gnome/libgweather_2.26.0.bb
index 00b3659..e1538b4 100644
--- a/recipes/gnome/libgweather_2.26.0.bb
+++ b/recipes/gnome/libgweather_2.26.0.bb
@@ -26,9 +26,5 @@ EXTRA_OEMAKE = "ORBIT_IDL=${STAGING_BINDIR_NATIVE}/orbit-idl-2"
 PACKAGES =+ "${PN}-locationdata"
 FILES_${PN}-locationdata = "${datadir}/libgweather/Locations*"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "b96016d7b35c66cf251189e9851ee252"
 SRC_URI[archive.sha256sum] = "c1efdeb59fe87145d13d99b7bb6f51b56505081fb2ebc2f7fe7dc3f7699da45e"
diff --git a/recipes/gnome/libgweather_2.26.2.1.bb b/recipes/gnome/libgweather_2.26.2.1.bb
index d9cf3e3..2b12039 100644
--- a/recipes/gnome/libgweather_2.26.2.1.bb
+++ b/recipes/gnome/libgweather_2.26.2.1.bb
@@ -12,10 +12,6 @@ do_configure_prepend() {
 	sed -i -e 's: doc : :g' ${S}/Makefile.am
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
 FILES_${PN} += "${datadir}/gnome* \
                 ${datadir}/icons"
 
diff --git a/recipes/gnome/libgweather_2.28.0.bb b/recipes/gnome/libgweather_2.28.0.bb
index ad7b845..bd5d066 100644
--- a/recipes/gnome/libgweather_2.28.0.bb
+++ b/recipes/gnome/libgweather_2.28.0.bb
@@ -11,10 +11,6 @@ do_configure_prepend() {
 	sed -i -e 's: doc : :g' ${S}/Makefile.am
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
 FILES_${PN} += "${datadir}/gnome* \
                 ${datadir}/icons"
 
diff --git a/recipes/gnome/liboobs_2.22.0.bb b/recipes/gnome/liboobs_2.22.0.bb
index dcfe647..1f6af10 100644
--- a/recipes/gnome/liboobs_2.22.0.bb
+++ b/recipes/gnome/liboobs_2.22.0.bb
@@ -3,9 +3,5 @@ DEPENDS = "glib-2.0 dbus system-tools-backends"
 
 inherit gnome lib_package
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "1b090ecd6c0df58b131795ff9a5c9057"
 SRC_URI[archive.sha256sum] = "b35760855d7d1def532e9e808cecde29b75cec455b238590072abf4a8206536e"
diff --git a/recipes/gnome/libsoup-2.4_2.24.3.bb b/recipes/gnome/libsoup-2.4_2.24.3.bb
index 280cdcd..8ae5f88 100644
--- a/recipes/gnome/libsoup-2.4_2.24.3.bb
+++ b/recipes/gnome/libsoup-2.4_2.24.3.bb
@@ -8,10 +8,6 @@ inherit gnome
 SRC_URI = "${GNOME_MIRROR}/libsoup/${@gnome_verdir("${PV}")}/libsoup-${PV}.tar.bz2"
 S = "${WORKDIR}/libsoup-${PV}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev = "${includedir}/ ${libdir}/"
 FILES_${PN}-doc = "${datadir}/"
diff --git a/recipes/gnome/libsoup-2.4_2.26.2.bb b/recipes/gnome/libsoup-2.4_2.26.2.bb
index 371204a..5405df7 100644
--- a/recipes/gnome/libsoup-2.4_2.26.2.bb
+++ b/recipes/gnome/libsoup-2.4_2.26.2.bb
@@ -8,10 +8,6 @@ inherit gnome
 SRC_URI = "${GNOME_MIRROR}/libsoup/${@gnome_verdir("${PV}")}/libsoup-${PV}.tar.bz2"
 S = "${WORKDIR}/libsoup-${PV}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libsoup-gnome"
 FILES_libsoup-gnome = "${libdir}/libsoup-gnome*.so.*"
 FILES_${PN} = "${libdir}/libsoup-2*.so.*"
diff --git a/recipes/gnome/libsoup-2.4_2.27.91.bb b/recipes/gnome/libsoup-2.4_2.27.91.bb
index 81dc431..accc88c 100644
--- a/recipes/gnome/libsoup-2.4_2.27.91.bb
+++ b/recipes/gnome/libsoup-2.4_2.27.91.bb
@@ -10,10 +10,6 @@ inherit gnome
 SRC_URI = "${GNOME_MIRROR}/libsoup/${@gnome_verdir("${PV}")}/libsoup-${PV}.tar.bz2"
 S = "${WORKDIR}/libsoup-${PV}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libsoup-gnome"
 FILES_libsoup-gnome = "${libdir}/libsoup-gnome*.so.*"
 FILES_${PN} = "${libdir}/libsoup-2*.so.*"
diff --git a/recipes/gnome/libsoup-2.4_2.4.1.bb b/recipes/gnome/libsoup-2.4_2.4.1.bb
index 95c93e4..c22263a 100644
--- a/recipes/gnome/libsoup-2.4_2.4.1.bb
+++ b/recipes/gnome/libsoup-2.4_2.4.1.bb
@@ -10,10 +10,6 @@ S = "${WORKDIR}/libsoup-${PV}"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev = "${includedir}/ ${libdir}/"
 FILES_${PN}-doc = "${datadir}/"
diff --git a/recipes/gnome/libsoup_2.2.100.bb b/recipes/gnome/libsoup_2.2.100.bb
index 2178ef2..86e2ce3 100644
--- a/recipes/gnome/libsoup_2.2.100.bb
+++ b/recipes/gnome/libsoup_2.2.100.bb
@@ -16,9 +16,5 @@ FILES_${PN}-doc = "${datadir}/"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "936e29d705aab0483b9a5b8860f68c13"
 SRC_URI[sha256sum] = "fa9f33e96a11133adbfd10538d95ed9704e582ef334c0a119a2a0bfca302877d"
diff --git a/recipes/gnome/libwnck_2.13.5.bb b/recipes/gnome/libwnck_2.13.5.bb
index 6661a48..ff408a6 100644
--- a/recipes/gnome/libwnck_2.13.5.bb
+++ b/recipes/gnome/libwnck_2.13.5.bb
@@ -5,9 +5,5 @@ DEPENDS = "gtk+ gdk-pixbuf-csource-native"
 
 inherit gnome
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "cb2da2795f517c713ec98560d078a102"
 SRC_URI[archive.sha256sum] = "ce959b7349de056205e992b05c9c914994bc269d2b1d02de85eacd398263aab6"
diff --git a/recipes/gnome/libwnck_2.23.6.bb b/recipes/gnome/libwnck_2.23.6.bb
index f9bd5ff..8525368 100644
--- a/recipes/gnome/libwnck_2.23.6.bb
+++ b/recipes/gnome/libwnck_2.23.6.bb
@@ -5,9 +5,5 @@ DEPENDS = "gtk+ gdk-pixbuf-csource-native"
 
 inherit gnome
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "9c6d134dc1d454b4c5a717638caa56c6"
 SRC_URI[archive.sha256sum] = "ea7945a131b67d4cf6bd02e41b0008d6aa1575d1aed75a0019d3c63cb61d07ea"
diff --git a/recipes/gnome/libwnck_2.24.0.bb b/recipes/gnome/libwnck_2.24.0.bb
index 4a5b07a..9da66f0 100644
--- a/recipes/gnome/libwnck_2.24.0.bb
+++ b/recipes/gnome/libwnck_2.24.0.bb
@@ -5,9 +5,5 @@ DEPENDS = "gtk+ gdk-pixbuf-csource-native"
 
 inherit gnome
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "860cd0ddce03c41a328e580d4efd4654"
 SRC_URI[archive.sha256sum] = "8cf49cf1d882ceb0b7b3a984ec350e5e2e4d608fec97911a0b0acf36a18d4df4"
diff --git a/recipes/gnome/libwnck_2.28.0.bb b/recipes/gnome/libwnck_2.28.0.bb
index 0c013ef..2dda551 100644
--- a/recipes/gnome/libwnck_2.28.0.bb
+++ b/recipes/gnome/libwnck_2.28.0.bb
@@ -5,9 +5,5 @@ DEPENDS = "gtk+ gdk-pixbuf-csource-native"
 
 inherit gnome
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "a9311661aa954e7c918439b6dd578792"
 SRC_URI[archive.sha256sum] = "d90be36d2fefa33a9287ed6dc41141213a06463f91d69d847da6b2e59c16b947"
diff --git a/recipes/gnome/libxklavier_3.7.bb b/recipes/gnome/libxklavier_3.7.bb
index 033877a..4f4b5bb 100644
--- a/recipes/gnome/libxklavier_3.7.bb
+++ b/recipes/gnome/libxklavier_3.7.bb
@@ -18,10 +18,5 @@ do_compile_append() {
                   libxklavier.pc
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[archive.md5sum] = "ee167645becd11309d64c6ff3a1600ff"
 SRC_URI[archive.sha256sum] = "477b72ba4968e9a49c78e08a5335df7f71f71d787222224345f33f0b888f801b"
diff --git a/recipes/gnome/metacity_2.24.0.bb b/recipes/gnome/metacity_2.24.0.bb
index ebc9e77..13a86da 100644
--- a/recipes/gnome/metacity_2.24.0.bb
+++ b/recipes/gnome/metacity_2.24.0.bb
@@ -17,9 +17,5 @@ EXTRA_OECONF += "--disable-verbose \
 
 FILES_${PN} += "${datadir}/themes ${datadir}/gnome*"
 
-do_stage () {
-	 autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "d4aa782d5f71b6c42514b239684a4aa3"
 SRC_URI[archive.sha256sum] = "90eed0a36aae302db52af12220c4cf863c9cccebd233015104f2d88cb17ec076"
diff --git a/recipes/gnutls/libtasn1_1.7.bb b/recipes/gnutls/libtasn1_1.7.bb
index 3d6e0ff..a306b2d 100644
--- a/recipes/gnutls/libtasn1_1.7.bb
+++ b/recipes/gnutls/libtasn1_1.7.bb
@@ -9,10 +9,5 @@ inherit autotools binconfig
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "ebfd69b3514d8e8830057f0e9df6a5f9"
 SRC_URI[sha256sum] = "9431f8e41acbeb5b5b89ec87a092b1a1fe9ef0a229a9a90806f4774707ca1f1f"
diff --git a/recipes/gpephone/libabenabler2_1.0.bb b/recipes/gpephone/libabenabler2_1.0.bb
index cf70030..b33a7f4 100644
--- a/recipes/gpephone/libabenabler2_1.0.bb
+++ b/recipes/gpephone/libabenabler2_1.0.bb
@@ -18,9 +18,5 @@ do_configure_prepend () {
         touch "${S}/po/POTFILES.in"
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "6bb28fc35f7589b8fae2ed73f9e5e08e"
 SRC_URI[sha256sum] = "901eb2cd2b817f70ee400565f714ee95b3ebed692ba37a579b6d71a21dab1a43"
diff --git a/recipes/gpephone/libabenabler2_svn.bb b/recipes/gpephone/libabenabler2_svn.bb
index 004ba3e..d9fc238 100644
--- a/recipes/gpephone/libabenabler2_svn.bb
+++ b/recipes/gpephone/libabenabler2_svn.bb
@@ -12,10 +12,6 @@ SRC_URI = "${GPEPHONE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-        autotools_stage_all
-}
-
 DEFAULT_PREFERENCE = "-1"
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
diff --git a/recipes/gpephone/libabenabler_0.1.bb b/recipes/gpephone/libabenabler_0.1.bb
index e8a999e..7d0c919 100644
--- a/recipes/gpephone/libabenabler_0.1.bb
+++ b/recipes/gpephone/libabenabler_0.1.bb
@@ -11,9 +11,5 @@ inherit gpephone pkgconfig autotools
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "49fe67302fd76543a7574a73c01395ba"
 SRC_URI[sha256sum] = "512674419ac2013d11eccf4f106d6cfc719c9c2b49215a8f0e89c5327d176a84"
diff --git a/recipes/gpephone/libabenabler_1.0.bb b/recipes/gpephone/libabenabler_1.0.bb
index 834a201..c0798ec 100644
--- a/recipes/gpephone/libabenabler_1.0.bb
+++ b/recipes/gpephone/libabenabler_1.0.bb
@@ -11,9 +11,5 @@ inherit gpephone pkgconfig autotools
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "1264bd213c631d29d1b4bc04696de66a"
 SRC_URI[sha256sum] = "0f34656e262d7c41c1499dbe1aa3bc91c1fe8dc230ab79d5cf027ab6d141ee56"
diff --git a/recipes/gpephone/libabenabler_svn.bb b/recipes/gpephone/libabenabler_svn.bb
index 4468c35..8e7df47 100644
--- a/recipes/gpephone/libabenabler_svn.bb
+++ b/recipes/gpephone/libabenabler_svn.bb
@@ -16,6 +16,3 @@ S = "${WORKDIR}/${PN}"
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/libalmmgr_svn.bb b/recipes/gpephone/libalmmgr_svn.bb
index cbae037..fda6d50 100644
--- a/recipes/gpephone/libalmmgr_svn.bb
+++ b/recipes/gpephone/libalmmgr_svn.bb
@@ -12,6 +12,3 @@ SRC_URI = "${GPEPHONE_SVN}"
 
 S = ${WORKDIR}/${PN}
 
-do_stage () {
-        autotools_stage_all
-}
diff --git a/recipes/gpephone/libcalenabler2_svn.bb b/recipes/gpephone/libcalenabler2_svn.bb
index c5c77f7..c424b97 100644
--- a/recipes/gpephone/libcalenabler2_svn.bb
+++ b/recipes/gpephone/libcalenabler2_svn.bb
@@ -15,10 +15,6 @@ SRC_URI = "${GPEPHONE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-    autotools_stage_all
-}
-
 FILES_${PN} += " ${libdir}/*.so.*"
 FILES_${PN}-dbg += "${libdir}/.debug/*.so.*"
 FILES_${PN}-dev += "${includedir} ${libdir}/*.la ${libdir}/*.so"
diff --git a/recipes/gpephone/libcalenabler_1.0.bb b/recipes/gpephone/libcalenabler_1.0.bb
index bf43ac5..57f20ec 100644
--- a/recipes/gpephone/libcalenabler_1.0.bb
+++ b/recipes/gpephone/libcalenabler_1.0.bb
@@ -11,9 +11,5 @@ inherit gpephone pkgconfig autotools
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "7f815fa70e9c3085897f755e124155f2"
 SRC_URI[sha256sum] = "97f63ed9c2d685a25306bd5ffa4bdf0a5e296c9ad28fd7210e6e53f75cf6dcc4"
diff --git a/recipes/gpephone/libchenabler_0.1.bb b/recipes/gpephone/libchenabler_0.1.bb
index adbe3aa..90d4ae2 100644
--- a/recipes/gpephone/libchenabler_0.1.bb
+++ b/recipes/gpephone/libchenabler_0.1.bb
@@ -17,9 +17,5 @@ do_configure_prepend () {
 	touch "${S}/po/POTFILES.in"
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "866fd13611a8de946428db1df9be8468"
 SRC_URI[sha256sum] = "74def55ba6a61e966e0873a4081fd3dd65089b94b837810d3bc056221d7e41c7"
diff --git a/recipes/gpephone/libgemwidget_0.1.bb b/recipes/gpephone/libgemwidget_0.1.bb
index 16a7bba..30802ce 100644
--- a/recipes/gpephone/libgemwidget_0.1.bb
+++ b/recipes/gpephone/libgemwidget_0.1.bb
@@ -12,10 +12,6 @@ inherit gpephone pkgconfig autotools
 # for a better solution: "patches accepted"
 SRC_URI_append_angstrom = " file://gemfilechooser-NULL-callback.patch"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "95d269ad7e7cb7d3032498ad2e47643b"
 SRC_URI[sha256sum] = "b8a1da871aa34362caf0c76dcbd3df42aef7313a4ed08f38eddcb159b80302c5"
 # CHECKSUMS.INI MISMATCH: I got this:
diff --git a/recipes/gpephone/libgemwidget_1.0.bb b/recipes/gpephone/libgemwidget_1.0.bb
index af886cf..c6610cb 100644
--- a/recipes/gpephone/libgemwidget_1.0.bb
+++ b/recipes/gpephone/libgemwidget_1.0.bb
@@ -12,9 +12,5 @@ SRC_URI += " file://disable-tests.patch file://libgemwidget-fixup.diff"
 
 FILES_${PN} += "${datadir}/gem"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "37916e6f12bff470fb457ad2d382789b"
 SRC_URI[sha256sum] = "b178c610fbbf2613ed1edeba2a11ed9c1ea042274465b2f3cd0a29cf1c7ebd9c"
diff --git a/recipes/gpephone/libgemwidget_svn.bb b/recipes/gpephone/libgemwidget_svn.bb
index f4e2e35..150f135 100644
--- a/recipes/gpephone/libgemwidget_svn.bb
+++ b/recipes/gpephone/libgemwidget_svn.bb
@@ -14,6 +14,3 @@ S = ${WORKDIR}/${PN}
 
 FILES_${PN} += "${datadir}/gem"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/libgpephone_0.3.bb b/recipes/gpephone/libgpephone_0.3.bb
index 7a72851..3dc2837 100644
--- a/recipes/gpephone/libgpephone_0.3.bb
+++ b/recipes/gpephone/libgpephone_0.3.bb
@@ -8,9 +8,5 @@ PR          = "r1"
 GPE_TARBALL_SUFFIX = "bz2"
 inherit gpephone pkgconfig autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "009af2f3554caaf547bbc282da0e83c6"
 SRC_URI[sha256sum] = "c40ea6d2282503ede882efe85ad526358683c311ea4592d41eaab0725ca75934"
diff --git a/recipes/gpephone/libgpephone_0.4.bb b/recipes/gpephone/libgpephone_0.4.bb
index 114b08b..97d9bcc 100644
--- a/recipes/gpephone/libgpephone_0.4.bb
+++ b/recipes/gpephone/libgpephone_0.4.bb
@@ -8,9 +8,5 @@ PR          = "r0"
 GPE_TARBALL_SUFFIX = "bz2"
 inherit gpephone pkgconfig autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "fae122bd44d6da9a006f65aedbd6461e"
 SRC_URI[sha256sum] = "cd84dc0e4b903871339e5e097a51d09a76ee9e1495783a47bb5ba81d633810da"
diff --git a/recipes/gpephone/libgpephone_svn.bb b/recipes/gpephone/libgpephone_svn.bb
index ce960ac..3b42648 100644
--- a/recipes/gpephone/libgpephone_svn.bb
+++ b/recipes/gpephone/libgpephone_svn.bb
@@ -11,6 +11,3 @@ SRC_URI = "${GPEPHONE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/libiac2_svn.bb b/recipes/gpephone/libiac2_svn.bb
index fbec409..6f4ba0f 100644
--- a/recipes/gpephone/libiac2_svn.bb
+++ b/recipes/gpephone/libiac2_svn.bb
@@ -17,6 +17,3 @@ EXTRA_OECONF = "--enable-gui --enable-test=no  --with-cuint=no"
 
 S = ${WORKDIR}/${PN}
 
-do_stage () {
-        autotools_stage_all
-}
diff --git a/recipes/gpephone/libiac_0.1.bb b/recipes/gpephone/libiac_0.1.bb
index d33a109..4bfd556 100644
--- a/recipes/gpephone/libiac_0.1.bb
+++ b/recipes/gpephone/libiac_0.1.bb
@@ -10,9 +10,5 @@ inherit gpephone pkgconfig autotools
 
 SRC_URI += "file://po.patch"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "cf829bb82f84728194c64a41e9f1cf32"
 SRC_URI[sha256sum] = "10197df9daee806453c5a7e99e538d7eac0421796f2a9ae114d4369d85fcf3af"
diff --git a/recipes/gpephone/libiac_1.0.bb b/recipes/gpephone/libiac_1.0.bb
index 16d0634..e22d3e3 100644
--- a/recipes/gpephone/libiac_1.0.bb
+++ b/recipes/gpephone/libiac_1.0.bb
@@ -8,9 +8,5 @@ PR          = "r1"
 GPE_TARBALL_SUFFIX = "bz2"
 inherit gpephone pkgconfig autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "6bb2fd1841d9c1be22edc999970a55a3"
 SRC_URI[sha256sum] = "821290104ef79b6a35a4a7456d50aff0536f66f05a5d6c255e7155d1cacd12b6"
diff --git a/recipes/gpephone/libiac_svn.bb b/recipes/gpephone/libiac_svn.bb
index f6f4c0c..8595ddc 100644
--- a/recipes/gpephone/libiac_svn.bb
+++ b/recipes/gpephone/libiac_svn.bb
@@ -14,6 +14,3 @@ SRC_URI = "${GPEPHONE_SVN}"
 
 S = ${WORKDIR}/${PN}
 
-do_stage () {
-        autotools_stage_all
-}
diff --git a/recipes/gpephone/libidn_0.5.19.bb b/recipes/gpephone/libidn_0.5.19.bb
index 6336b52..202d388 100644
--- a/recipes/gpephone/libidn_0.5.19.bb
+++ b/recipes/gpephone/libidn_0.5.19.bb
@@ -14,9 +14,5 @@ do_configure_prepend () {
 	autoreconf -f -i -s
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "440835808c577073db7d571357223dce"
 SRC_URI[sha256sum] = "4f707c189259d7b3dda908d78a995366d388fe051aa3554b82cb324426997a23"
diff --git a/recipes/gpephone/libim2_svn.bb b/recipes/gpephone/libim2_svn.bb
index 337d73c..15022de 100644
--- a/recipes/gpephone/libim2_svn.bb
+++ b/recipes/gpephone/libim2_svn.bb
@@ -17,6 +17,3 @@ S = ${WORKDIR}/libim2
 
 FILES_${PN} += " ${datadir}/dbus-1"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/libim_0.2.bb b/recipes/gpephone/libim_0.2.bb
index f3575c6..a5908d1 100644
--- a/recipes/gpephone/libim_0.2.bb
+++ b/recipes/gpephone/libim_0.2.bb
@@ -17,9 +17,5 @@ S = ${WORKDIR}/lips_im-${PV}
 
 FILES_${PN} += " ${datadir}/dbus-1"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "375091bb5df956f0049962defad3cbbc"
 SRC_URI[sha256sum] = "381d88261fa307ffa97edab6ba8488533b9fb45cccc5ae6cda5ccb64ef65adc0"
diff --git a/recipes/gpephone/liblipsevent2_svn.bb b/recipes/gpephone/liblipsevent2_svn.bb
index 5d2330c..cc0491d 100644
--- a/recipes/gpephone/liblipsevent2_svn.bb
+++ b/recipes/gpephone/liblipsevent2_svn.bb
@@ -12,6 +12,3 @@ SRC_URI = "${GPEPHONE_SVN}"
 
 S = ${WORKDIR}/${PN}
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/liblipsevent_0.1.bb b/recipes/gpephone/liblipsevent_0.1.bb
index 8e41290..fd4f038 100644
--- a/recipes/gpephone/liblipsevent_0.1.bb
+++ b/recipes/gpephone/liblipsevent_0.1.bb
@@ -11,9 +11,5 @@ SRC_URI = "${GPEPHONE_MIRROR}/${P}/lips_event-${PV}.tar.gz"
 
 S = ${WORKDIR}/lips_event-${PV}
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "1fd0f41f9676ef0c882921bc37628d07"
 SRC_URI[sha256sum] = "7182cf3f63e11e7ea6c6a994f9e70ef3bf6e430a5db643f5b29a0fd0996ddfd5"
diff --git a/recipes/gpephone/libmsgenabler2_svn.bb b/recipes/gpephone/libmsgenabler2_svn.bb
index a294dc9..6b5c326 100644
--- a/recipes/gpephone/libmsgenabler2_svn.bb
+++ b/recipes/gpephone/libmsgenabler2_svn.bb
@@ -18,6 +18,3 @@ FILES_${PN} += "${datadir}/libmsgenabler2 ${libdir}/msg-providers/*.0"
 FILES_${PN}-dev += "${libdir}/msg-providers/*.so ${libdir}/msg-providers/*a"
 FILES_${PN}-dbg += "${libdir}/msg-providers/.debug"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/libmsgenabler_1.0.bb b/recipes/gpephone/libmsgenabler_1.0.bb
index b241a35..a02e513 100644
--- a/recipes/gpephone/libmsgenabler_1.0.bb
+++ b/recipes/gpephone/libmsgenabler_1.0.bb
@@ -11,9 +11,5 @@ inherit gpephone pkgconfig autotools
 
 FILES_${PN} += "$(datadir)/libmsgenabler"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "32f04482d3905f05a4f36ac946e7f95d"
 SRC_URI[sha256sum] = "c8568dbd5d3ffa200bf81ffbc7baf94902b41998d5c65455a1fbadce15db9953"
diff --git a/recipes/gpephone/libmsgenabler_svn.bb b/recipes/gpephone/libmsgenabler_svn.bb
index c8672e1..3cfe449 100644
--- a/recipes/gpephone/libmsgenabler_svn.bb
+++ b/recipes/gpephone/libmsgenabler_svn.bb
@@ -16,6 +16,3 @@ FILES_${PN} += "$(datadir)/libmsgenabler"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/librecord2_0.1.bb b/recipes/gpephone/librecord2_0.1.bb
index 980531d..69990d0 100644
--- a/recipes/gpephone/librecord2_0.1.bb
+++ b/recipes/gpephone/librecord2_0.1.bb
@@ -10,9 +10,5 @@ inherit gpephone pkgconfig autotools
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "782dc4ea50518d5dfce4b47a7c9b56b6"
 SRC_URI[sha256sum] = "7131cf051d6a98d29358ea56a60db3d8e104bf97d9e9473622cc3523391839e5"
diff --git a/recipes/gpephone/librecord2_svn.bb b/recipes/gpephone/librecord2_svn.bb
index e348376..636a2a7 100644
--- a/recipes/gpephone/librecord2_svn.bb
+++ b/recipes/gpephone/librecord2_svn.bb
@@ -22,6 +22,3 @@ FILES_${PN}-dev += "${includedir} ${libdir}/*.la ${libdir}/*.so"
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/librecord_0.1.bb b/recipes/gpephone/librecord_0.1.bb
index 729e2f6..210a687 100644
--- a/recipes/gpephone/librecord_0.1.bb
+++ b/recipes/gpephone/librecord_0.1.bb
@@ -10,9 +10,5 @@ inherit gpephone pkgconfig autotools
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "a9e90187c1dc183f497bcae34718e415"
 SRC_URI[sha256sum] = "6fb70d0b8f410f05988e1f3a3e8c86990c3e84c9958041803e6d0658faae91ea"
diff --git a/recipes/gpephone/librecord_1.0.bb b/recipes/gpephone/librecord_1.0.bb
index 63d9706..ef1a3fc 100644
--- a/recipes/gpephone/librecord_1.0.bb
+++ b/recipes/gpephone/librecord_1.0.bb
@@ -10,9 +10,5 @@ inherit gpephone pkgconfig autotools
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "a487a98a40d64b9f6ee118b10b9cb97a"
 SRC_URI[sha256sum] = "7cadb398c106ba8df3b297e345ab1db750ad058c6c2e78b184f18a7f685bf8ef"
diff --git a/recipes/gpephone/libsettings_0.3.bb b/recipes/gpephone/libsettings_0.3.bb
index 23507c3..cd00d3b 100644
--- a/recipes/gpephone/libsettings_0.3.bb
+++ b/recipes/gpephone/libsettings_0.3.bb
@@ -11,9 +11,5 @@ FILES_${PN} += " ${libdir}/*.so.*"
 FILES_${PN}-dbg += "${libdir}/.debug/*.so.*"
 FILES_${PN}-dev += "${includedir} ${libdir}/*.la ${libdir}/*.so"
 
-do_stage () {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "9219923ee3f4d465757f23ac0c2be584"
 SRC_URI[sha256sum] = "01c4d4bcf893be8f86007280f231985117c16faf15a007bd6ec41624463abf6b"
diff --git a/recipes/gpephone/libsettings_svn.bb b/recipes/gpephone/libsettings_svn.bb
index 770fe8c..26ff3a9 100644
--- a/recipes/gpephone/libsettings_svn.bb
+++ b/recipes/gpephone/libsettings_svn.bb
@@ -18,6 +18,3 @@ FILES_${PN} += " ${libdir}/*.so.*"
 FILES_${PN}-dbg += "${libdir}/.debug/*.so.*"
 FILES_${PN}-dev += "${includedir} ${libdir}/*.la ${libdir}/*.so"
 
-do_stage () {
-    autotools_stage_all
-}
diff --git a/recipes/gpephone/libtapi_svn.bb b/recipes/gpephone/libtapi_svn.bb
index 68e5787..c758cc0 100644
--- a/recipes/gpephone/libtapi_svn.bb
+++ b/recipes/gpephone/libtapi_svn.bb
@@ -12,6 +12,3 @@ SRC_URI = "${GPEPHONE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/libvoc_svn.bb b/recipes/gpephone/libvoc_svn.bb
index 3389c7d..713eb6a 100644
--- a/recipes/gpephone/libvoc_svn.bb
+++ b/recipes/gpephone/libvoc_svn.bb
@@ -12,6 +12,3 @@ SRC_URI = "${GPEPHONE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/gpephone/libvocenabler_0.1.bb b/recipes/gpephone/libvocenabler_0.1.bb
index f75c91a..8afe00f 100644
--- a/recipes/gpephone/libvocenabler_0.1.bb
+++ b/recipes/gpephone/libvocenabler_0.1.bb
@@ -15,9 +15,5 @@ do_compile_prepend() {
 	done	
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "536cd97488c0882913c097a833cb2ca2"
 SRC_URI[sha256sum] = "748a9a5a1b2e6bf1db4cc767742acf58d836e551e56a493bd34ad759d3bb4f53"
diff --git a/recipes/gpephone/ptim-engine_1.0.bb b/recipes/gpephone/ptim-engine_1.0.bb
index 2197684..feff391 100644
--- a/recipes/gpephone/ptim-engine_1.0.bb
+++ b/recipes/gpephone/ptim-engine_1.0.bb
@@ -15,9 +15,5 @@ FILES_${PN} += " ${libdir}/gtk-2.0/*/immodules/ptim/engine/*.so ${libdir}/gtk-2.
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/immodules/ptim/engine/.debug/*.so"
 FILES_${PN}-dev += "${libdir}/gtk-2.0/*/immodules/ptim/engine/*.la"
 
-do_stage () {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "c6735cb4a8f5bc7da74001ca895fd174"
 SRC_URI[sha256sum] = "3d733f8a1cfeb60b3a83a03340e80e7a23a5d3141f8958fad1441142817cc077"
diff --git a/recipes/gpephone/ptim-engine_svn.bb b/recipes/gpephone/ptim-engine_svn.bb
index 281ee72..8aa9d7d 100644
--- a/recipes/gpephone/ptim-engine_svn.bb
+++ b/recipes/gpephone/ptim-engine_svn.bb
@@ -18,6 +18,3 @@ FILES_${PN} += " ${libdir}/gtk-2.0/*/immodules/ptim/engine/*.so ${libdir}/gtk-2.
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/immodules/ptim/engine/.debug/*.so"
 FILES_${PN}-dev += "${libdir}/gtk-2.0/*/immodules/ptim/engine/*.la"
 
-do_stage () {
-    autotools_stage_all
-}
\ No newline at end of file
diff --git a/recipes/gpephone/ptim-headers_1.0.bb b/recipes/gpephone/ptim-headers_1.0.bb
index 10d7213..5fccfaa 100644
--- a/recipes/gpephone/ptim-headers_1.0.bb
+++ b/recipes/gpephone/ptim-headers_1.0.bb
@@ -10,9 +10,5 @@ SRC_URI = "${GPEPHONE_MIRROR}/ptim-headers-${PV}/imheaders-${PV}.tar.bz2"
 
 S = "${WORKDIR}/imheaders-${PV}"
 
-do_stage () {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "33226da8468acccdcac483ea25c99a91"
 SRC_URI[sha256sum] = "255b3b869e3945f8b031e9fa23649f7e342211713335ea447e40975bfed96fa8"
diff --git a/recipes/gpephone/ptim-headers_svn.bb b/recipes/gpephone/ptim-headers_svn.bb
index 797d7ab..05208cd 100644
--- a/recipes/gpephone/ptim-headers_svn.bb
+++ b/recipes/gpephone/ptim-headers_svn.bb
@@ -13,6 +13,3 @@ S = "${WORKDIR}/imheaders"
 
 DEFAULT_PREFERENCE = "-1"
 
-do_stage () {
-    autotools_stage_all
-}
diff --git a/recipes/gpephone/ptim-helper_1.0.bb b/recipes/gpephone/ptim-helper_1.0.bb
index fc3ed71..6805c1b 100644
--- a/recipes/gpephone/ptim-helper_1.0.bb
+++ b/recipes/gpephone/ptim-helper_1.0.bb
@@ -15,10 +15,6 @@ FILES_${PN} += " ${libdir}/gtk-2.0/*/immodules/ptim/helper/*.so ${libdir}/gtk-2.
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/immodules/ptim/helper/.debug/*.so"
 FILES_${PN}-dev += "${libdir}/gtk-2.0/*/immodules/ptim/helper/*.la"
 
-do_stage () {
-    autotools_stage_all
-}
-
 pkg_postinst_${PN}() {
     gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
 }
diff --git a/recipes/gpephone/ptim-helper_svn.bb b/recipes/gpephone/ptim-helper_svn.bb
index c5a84c5..d2d4149 100644
--- a/recipes/gpephone/ptim-helper_svn.bb
+++ b/recipes/gpephone/ptim-helper_svn.bb
@@ -18,6 +18,3 @@ FILES_${PN} += " ${libdir}/gtk-2.0/*/immodules/ptim/helper/*.so ${libdir}/gtk-2.
 FILES_${PN}-dbg += "${libdir}/gtk-2.0/*/immodules/ptim/helper/.debug/*.so"
 FILES_${PN}-dev += "${libdir}/gtk-2.0/*/immodules/ptim/helper/*.la"
 
-do_stage () {
-    autotools_stage_all
-}
diff --git a/recipes/gpephone/ptim-manager_1.0.bb b/recipes/gpephone/ptim-manager_1.0.bb
index 1a09161..2e37efc 100644
--- a/recipes/gpephone/ptim-manager_1.0.bb
+++ b/recipes/gpephone/ptim-manager_1.0.bb
@@ -21,10 +21,5 @@ do_install_append () {
 	install -m 644 ${S}/conf/imconfig ${D}/${libdir}/gtk-2.0/*/immodules/ptim
 }
 
-
-do_stage () {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "cafd1d222ae30fa496e299950de19ae7"
 SRC_URI[sha256sum] = "e8e5144314fd2cd13722835338105c0236bf3da4dbf383a6ce052574c1ba7230"
diff --git a/recipes/gpephone/ptim-manager_svn.bb b/recipes/gpephone/ptim-manager_svn.bb
index d89a60f..48fea70 100644
--- a/recipes/gpephone/ptim-manager_svn.bb
+++ b/recipes/gpephone/ptim-manager_svn.bb
@@ -24,8 +24,3 @@ do_install_append () {
 	install -m 644 ${S}/conf/imconfig ${D}/${libdir}/gtk-2.0/*/immodules/ptim
 }
 
-
-
-do_stage () {
-    autotools_stage_all
-}
diff --git a/recipes/gphoto2/libgphoto2_2.4.2.bb b/recipes/gphoto2/libgphoto2_2.4.2.bb
index 3c9b469..fa36e1e 100644
--- a/recipes/gphoto2/libgphoto2_2.4.2.bb
+++ b/recipes/gphoto2/libgphoto2_2.4.2.bb
@@ -24,11 +24,5 @@ FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 FILES_${PN} += "${libdir}/udev/*"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "714859617c0b616855f6906280010c5d"
 SRC_URI[sha256sum] = "f319655b272186ad76ab73317b7e8c5e3b87d51c1265ce676f02e8c312745226"
diff --git a/recipes/gphoto2/libgphoto2_2.4.4.bb b/recipes/gphoto2/libgphoto2_2.4.4.bb
index 455d637..afa2ec4 100644
--- a/recipes/gphoto2/libgphoto2_2.4.4.bb
+++ b/recipes/gphoto2/libgphoto2_2.4.4.bb
@@ -23,11 +23,5 @@ FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 FILES_${PN} += "${libdir}/udev/*"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "8aff5ac4ca72cba17de633078cf1612e"
 SRC_URI[sha256sum] = "2582362ae318b62c31832edfcaf401397fcc98fd307347ee15babff94770784d"
diff --git a/recipes/gpstk/gpstk_1.2.bb b/recipes/gpstk/gpstk_1.2.bb
index 53fc07b..491bd3e 100644
--- a/recipes/gpstk/gpstk_1.2.bb
+++ b/recipes/gpstk/gpstk_1.2.bb
@@ -12,11 +12,6 @@ inherit autotools lib_package
 
 EXTRA_OECONF = "--enable-shared"
 
-do_stage() {
-    autotools_stage_all
-}
-
-
 # This is a handcrafted do_install because 'make install' isn't working.
 # This should install the same files as my native (x86) jam based build, but doesn't since the Makefiles 
 # aren't up to date (e.g. bc2sp3 is missing). 
diff --git a/recipes/granule/libassa_3.5.0.bb b/recipes/granule/libassa_3.5.0.bb
index f1af9b7..67c8875 100644
--- a/recipes/granule/libassa_3.5.0.bb
+++ b/recipes/granule/libassa_3.5.0.bb
@@ -10,9 +10,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "9b61dfd94bf4e083829ffb0231243d8b"
 SRC_URI[sha256sum] = "72a627c74e82ff679cb16ebe3a625b9032d8d1feed4c1da63ebb5106a80b1314"
diff --git a/recipes/grift/ginspector_20050529.bb b/recipes/grift/ginspector_20050529.bb
index 52e4e61..78a1477 100644
--- a/recipes/grift/ginspector_20050529.bb
+++ b/recipes/grift/ginspector_20050529.bb
@@ -8,10 +8,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/g-inspector/ginspector-${PV}.tar.bz2"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/*/*/ginspector/*.so"
 
 SRC_URI[md5sum] = "0a8474e0d90b139b1baa70b097a4fd51"
diff --git a/recipes/grift/glrr-widgets_20050529.bb b/recipes/grift/glrr-widgets_20050529.bb
index 343da8c..f538741 100644
--- a/recipes/grift/glrr-widgets_20050529.bb
+++ b/recipes/grift/glrr-widgets_20050529.bb
@@ -8,10 +8,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/grift/glrr-widgets-${PV}.tar.bz2"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "97bd37e930e4e3837ee3fae45a4eec8f"
 SRC_URI[sha256sum] = "62a88525ae1deb3112221c4e1068e8d940afb3b8e5664e353cf3360ab403b845"
diff --git a/recipes/grift/glrr_20050529.bb b/recipes/grift/glrr_20050529.bb
index 4ad3889..08d20c3 100644
--- a/recipes/grift/glrr_20050529.bb
+++ b/recipes/grift/glrr_20050529.bb
@@ -8,10 +8,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/grift/glrr-${PV}.tar.bz2"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "a78f1d1ee403ad3bb2959159f7ae0e69"
 SRC_URI[sha256sum] = "2bec403b16ebdcc2a82ea6523eea230e1d651e68094e4bb1af716b36f951ba06"
diff --git a/recipes/gsm/gsmd.inc b/recipes/gsm/gsmd.inc
index 445e2db..1b8ad29 100644
--- a/recipes/gsm/gsmd.inc
+++ b/recipes/gsm/gsmd.inc
@@ -21,10 +21,6 @@ RDEPENDS_append = ""
 INITSCRIPT_NAME = "gsmd"
 INITSCRIPT_PARAMS = "defaults 35"
 
-do_stage() {
-    autotools_stage_all
-}
-
 do_install_append() {
 	install -d ${D}/${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/gsmd ${D}/${sysconfdir}/init.d/
diff --git a/recipes/gsoap/gsoap-native_2.7.7.bb b/recipes/gsoap/gsoap-native_2.7.7.bb
index 0b8a4b8..ac52e6d 100644
--- a/recipes/gsoap/gsoap-native_2.7.7.bb
+++ b/recipes/gsoap/gsoap-native_2.7.7.bb
@@ -7,10 +7,6 @@ EXTRA_OEMAKE = ""
 
 inherit native
 
-do_stage() {
-	autotools_stage_all
-}
-
 do_install() {
 	:
 }
diff --git a/recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb b/recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb
index 6bb85cd..3f1a2d7 100644
--- a/recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb
+++ b/recipes/gtkhtml/gtkhtml-3.8_3.12.3.bb
@@ -22,10 +22,6 @@ do_configure_append() {
         find ${S} -name Makefile | xargs sed -i 's|ORBIT_IDL =.*|ORBIT_IDL = ${ORBIT_IDL}|'
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${datadir}/gtkhtml-3.8"
 
 
diff --git a/recipes/gtksourceview/gtksourceview1_1.7.2.bb b/recipes/gtksourceview/gtksourceview1_1.7.2.bb
index 25a73e6..23ed91c 100644
--- a/recipes/gtksourceview/gtksourceview1_1.7.2.bb
+++ b/recipes/gtksourceview/gtksourceview1_1.7.2.bb
@@ -11,9 +11,5 @@ inherit gnome pkgconfig
 # overrule SRC_URI from gnome.conf
 SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2"
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "a56ea78c74fe93a604357d7c555af0e5"
 SRC_URI[sha256sum] = "38c238ec57bf22023bbc50f70ecbaee8c06b817b9e11f1a3a0ae7faf95cc1f26"
diff --git a/recipes/gtksourceview/gtksourceview2_2.6.0.bb b/recipes/gtksourceview/gtksourceview2_2.6.0.bb
index 2c32dd4..3a65ea5 100644
--- a/recipes/gtksourceview/gtksourceview2_2.6.0.bb
+++ b/recipes/gtksourceview/gtksourceview2_2.6.0.bb
@@ -12,10 +12,6 @@ inherit gnome pkgconfig
 # overrule SRC_URI from gnome.conf
 SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2"
 
-do_stage() {
-autotools_stage_all
-}
-
 FILES_${PN} += " ${datadir}/gtksourceview-2.0"
 
 
diff --git a/recipes/gtksourceview/gtksourceview2_2.7.3.bb b/recipes/gtksourceview/gtksourceview2_2.7.3.bb
index 1b67754..8cace55 100644
--- a/recipes/gtksourceview/gtksourceview2_2.7.3.bb
+++ b/recipes/gtksourceview/gtksourceview2_2.7.3.bb
@@ -18,10 +18,6 @@ do_configure_prepend() {
 	sed -i -e s:docs::g ${S}/Makefile.am
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += " ${datadir}/gtksourceview-2.0"
 
 
diff --git a/recipes/guichan/guichan_0.7.1.bb b/recipes/guichan/guichan_0.7.1.bb
index 2426980..51efed1 100644
--- a/recipes/guichan/guichan_0.7.1.bb
+++ b/recipes/guichan/guichan_0.7.1.bb
@@ -16,10 +16,5 @@ PACKAGES =+ "libguichan libguichan-sdl"
 FILES_libguichan = "${libdir}/libguichan.so.*"
 FILES_libguichan-sdl = "${libdir}/libguichan_sdl.so.*"
 
-do_stage () {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "275c5bad231d2ce55e654d80cb1e05be"
 SRC_URI[sha256sum] = "7f017522d0c3235f2399f8b615493f3880fbe10a54dfa377f638016ede715a2a"
diff --git a/recipes/gutenprint/ijs_0.35.bb b/recipes/gutenprint/ijs_0.35.bb
index 528230a..f6aec3b 100644
--- a/recipes/gutenprint/ijs_0.35.bb
+++ b/recipes/gutenprint/ijs_0.35.bb
@@ -8,11 +8,5 @@ inherit autotools pkgconfig binconfig lib_package
 
 EXTRA_OECONF = " --enable-shared "
 
-do_stage() {
-        autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "896fdcb7a01c586ba6eb81398ea3f6e9"
 SRC_URI[sha256sum] = "11a5f5084488c480f3ff5a24d64d7147bb64272bf60a0ba51330a56c5b50cab9"
diff --git a/recipes/gypsy/gypsy.inc b/recipes/gypsy/gypsy.inc
index b618094..793fee4 100644
--- a/recipes/gypsy/gypsy.inc
+++ b/recipes/gypsy/gypsy.inc
@@ -9,11 +9,6 @@ do_configure_prepend () {
 	touch ${S}/gtk-doc.make
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 PACKAGES += "libgypsy libgypsy-dev libgypsy-dbg"
 
 FILES_lib${PN} = "${libdir}/lib*.so*"
diff --git a/recipes/hal/consolekit_0.3.0.bb b/recipes/hal/consolekit_0.3.0.bb
index 50e17e8..484222f 100644
--- a/recipes/hal/consolekit_0.3.0.bb
+++ b/recipes/hal/consolekit_0.3.0.bb
@@ -11,10 +11,6 @@ S = "${WORKDIR}/ConsoleKit-${PV}"
 
 EXTRA_OECONF += "--enable-pam-module --with-pam-module-dir=${libdir}/security"
 
-do_stage () {
-	autotools_stage_all
-}
-
 PACKAGES += "pam-plugin-ck-connector"
 FILES_${PN} += "${libdir}/ConsoleKit ${datadir}/dbus-1 ${datadir}/PolicyKit"
 FILES_${PN}-dbg += ""${libdir}/security/.debug/*.so"
diff --git a/recipes/icon-slicer/icon-slicer-native_0.3.bb b/recipes/icon-slicer/icon-slicer-native_0.3.bb
index 7bd9d19..16c861b 100644
--- a/recipes/icon-slicer/icon-slicer-native_0.3.bb
+++ b/recipes/icon-slicer/icon-slicer-native_0.3.bb
@@ -10,12 +10,5 @@ S = "${WORKDIR}/icon-slicer-${PV}"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
-
-
 SRC_URI[md5sum] = "5c5374d4f265b0abe4daef1d03f87104"
 SRC_URI[sha256sum] = "05f0216dd0c25a17859de66357f64da5033375b6fbf5f31ca54867311160b64d"
diff --git a/recipes/icu/icu_3.6.bb b/recipes/icu/icu_3.6.bb
index cbc426e..ddc0ba8 100644
--- a/recipes/icu/icu_3.6.bb
+++ b/recipes/icu/icu_3.6.bb
@@ -34,10 +34,6 @@ FILES_libiculx = "${libdir}/libiculx.so.*"
 FILES_libicutu = "${libdir}/libicutu.so.*"
 FILES_libicuio = "${libdir}/libicuio.so.*"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SYSROOT_PREPROCESS_FUNCS += "icu_sysroot_preprocess"
 
 # We need to append this so it runs *after* binconfig's preprocess function
diff --git a/recipes/id3lib/id3lib_3.8.3.bb b/recipes/id3lib/id3lib_3.8.3.bb
index 365495f..fb0a6b3 100644
--- a/recipes/id3lib/id3lib_3.8.3.bb
+++ b/recipes/id3lib/id3lib_3.8.3.bb
@@ -11,10 +11,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/id3lib/id3lib-${PV}.tar.gz;name=archive \
            http://ftp.de.debian.org/debian/pool/main/i/id3lib3.8.3/id3lib3.8.3_3.8.3-7.2.diff.gz;name=patch \
           "
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "19f27ddd2dda4b2d26a559a4f0f402a7"
 SRC_URI[archive.sha256sum] = "2749cc3c0cd7280b299518b1ddf5a5bcfe2d1100614519b68702230e26c7d079"
 SRC_URI[patch.md5sum] = "805c0320a2efb21c40ce06fa13cd7c4b"
diff --git a/recipes/iksemel/iksemel_1.2.bb b/recipes/iksemel/iksemel_1.2.bb
index fe8c43c..27dfc77 100644
--- a/recipes/iksemel/iksemel_1.2.bb
+++ b/recipes/iksemel/iksemel_1.2.bb
@@ -9,9 +9,5 @@ inherit pkgconfig autotools
 
 SRC_URI = "http://files.jabberstudio.org/iksemel/${P}.tar.gz"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "82e7c8fdb6211839246b788c040a796b"
 SRC_URI[sha256sum] = "a606e230b22d9d029998b84e5d6311a8ba35a304fe457e254eb5fd19943cd639"
diff --git a/recipes/jaaa/jaaa_0.4.2.bb b/recipes/jaaa/jaaa_0.4.2.bb
index b729813..73ce717 100644
--- a/recipes/jaaa/jaaa_0.4.2.bb
+++ b/recipes/jaaa/jaaa_0.4.2.bb
@@ -14,9 +14,5 @@ S = "${WORKDIR}/jaaa"
 
 inherit autotools pkgconfig
 
-do_stage() {
-       autotools_stage_all
-}
-
 SRC_URI[md5sum] = "e3013bb1e287b495b0668f4b6e2887c7"
 SRC_URI[sha256sum] = "0bae72d819963c40e0a202bb08bc55a600fe7c453749601a3836bc9272cffb3a"
diff --git a/recipes/jack/jack_0.103.0.bb b/recipes/jack/jack_0.103.0.bb
index 4ef4943..f7bd62a 100644
--- a/recipes/jack/jack_0.103.0.bb
+++ b/recipes/jack/jack_0.103.0.bb
@@ -26,10 +26,5 @@ FILES_libjack = "${libdir}/*.so.* ${libdir}/jack/*.so"
 FILES_jack-server = "${bindir}/jackd"
 FILES_jack-examples = "${bindir}/*"
 
-do_stage() {
-       autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "03a0f63b997ce7b83a1eeaa6b80f4388"
 SRC_URI[sha256sum] = "a5d9fd696d7ee4a1c7679b5a688155bc1e0abbdf5f144d6762dbbee874df235f"
diff --git a/recipes/jpeg/jasper_1.900.1.bb b/recipes/jpeg/jasper_1.900.1.bb
index 94b83b9..8d76e99 100644
--- a/recipes/jpeg/jasper_1.900.1.bb
+++ b/recipes/jpeg/jasper_1.900.1.bb
@@ -9,9 +9,6 @@ inherit autotools lib_package
 EXTRA_OECONF = "--enable-shared"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-        autotools_stage_all
-}
 
 SRC_URI[md5sum] = "a342b2b4495b3e1394e161eb5d85d754"
 SRC_URI[sha256sum] = "6b905a9c2aca2e275544212666eefc4eb44d95d0a57e4305457b407fe63f9494"
diff --git a/recipes/kde4/gmm_3.0.bb b/recipes/kde4/gmm_3.0.bb
index cce2303..62e412e 100644
--- a/recipes/kde4/gmm_3.0.bb
+++ b/recipes/kde4/gmm_3.0.bb
@@ -6,10 +6,6 @@ inherit autotools
 SRC_URI = "http://download.gna.org/getfem/stable/gmm-3.0.tar.gz"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-        autotools_stage_all
-}
-
 
 SRC_URI[md5sum] = "e543571d8812357374699491014abd58"
 SRC_URI[sha256sum] = "f7fad050ce4641a43c2249fd691e514a0ee6afc09b4ec54c8c30038d0c2783d1"
diff --git a/recipes/kde4/kde4.inc b/recipes/kde4/kde4.inc
index 6188c5d..5330e6d 100644
--- a/recipes/kde4/kde4.inc
+++ b/recipes/kde4/kde4.inc
@@ -41,6 +41,4 @@ FILES_${PN}-dbg += "${libdir}/qt4/.debug \
 
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-	autotools_stage_all
-}	
+
diff --git a/recipes/kde4/strigi_0.5.10.bb b/recipes/kde4/strigi_0.5.10.bb
index 0dfb4cb..ae00f22 100644
--- a/recipes/kde4/strigi_0.5.10.bb
+++ b/recipes/kde4/strigi_0.5.10.bb
@@ -16,11 +16,6 @@ EXTRA_OECMAKE = "-DENABLE_FAM:BOOL=ON \
 FILES_${PN} += "${datadir}/dbus-1 \
                "
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-        autotools_stage_all
-}
-
-
 
 SRC_URI[md5sum] = "cfaa2114ea27f2a00e6773c374e98ec4"
 SRC_URI[sha256sum] = "3851f803de3759490073c1d682d018592b010437b9ac2b85394eaddc63621faf"
diff --git a/recipes/lcms/lcms_1.17.bb b/recipes/lcms/lcms_1.17.bb
index 7b36897..f098d6e 100644
--- a/recipes/lcms/lcms_1.17.bb
+++ b/recipes/lcms/lcms_1.17.bb
@@ -9,9 +9,5 @@ inherit autotools
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "07bdbb4cfb05d21caa58fe3d1c84ddc1"
 SRC_URI[sha256sum] = "5ef3b4dab30956772009e29dba33fe1256cf9da161106a1e70b0966c96d14583"
diff --git a/recipes/lesstif/lesstif_0.95.0.bb b/recipes/lesstif/lesstif_0.95.0.bb
index d9c1312..065bc97 100644
--- a/recipes/lesstif/lesstif_0.95.0.bb
+++ b/recipes/lesstif/lesstif_0.95.0.bb
@@ -48,9 +48,5 @@ PACKAGES += "${PN}-bin"
 FILES_${PN} = "${libdir}"
 FILES_${PN}-bin = "${bindir}"
 
-do_stage() {
-  autotools_stage_all
-}
-
 SRC_URI[md5sum] = "ab895165c149d7f95843c7584b1c7ad4"
 SRC_URI[sha256sum] = "e5ef90ff30897448a7c090c2e31ceb302ed064a60411436e8995580848ed1a63"
diff --git a/recipes/libao/libao_0.8.8.bb b/recipes/libao/libao_0.8.8.bb
index df2fe46..b6d172b 100644
--- a/recipes/libao/libao_0.8.8.bb
+++ b/recipes/libao/libao_0.8.8.bb
@@ -21,12 +21,6 @@ EXTRA_OECONF = "\
   --enable-pulse \
 "
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
 PACKAGES =+ "${PN}-alsa ${PN}-alsa-dev ${PN}-pulse ${PN}-pulse-dev ${PN}-oss ${PN}-oss-dev"
 
 FILES_${PN}-alsa = "${libdir}/ao/plugins-2/libalsa*.so"
diff --git a/recipes/libcdaudio/libcdaudio_0.99.12p2.bb b/recipes/libcdaudio/libcdaudio_0.99.12p2.bb
index a0af7de..36474ca 100644
--- a/recipes/libcdaudio/libcdaudio_0.99.12p2.bb
+++ b/recipes/libcdaudio/libcdaudio_0.99.12p2.bb
@@ -12,9 +12,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${PN}-${PV}.tar.gz"
 
 inherit autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "15de3830b751818a54a42899bd3ae72c"
 SRC_URI[sha256sum] = "5fdaf9af5ac4f75c0215d000b82b128fd054a582f81cc4f039a1e7fe69335ebb"
diff --git a/recipes/libconfig/libconfig_1.3.1.bb b/recipes/libconfig/libconfig_1.3.1.bb
index 59263cd..50c67f3 100644
--- a/recipes/libconfig/libconfig_1.3.1.bb
+++ b/recipes/libconfig/libconfig_1.3.1.bb
@@ -14,9 +14,5 @@ S = "${WORKDIR}/libconfig-${PV}"
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "f02bfa27a21b3040089026975b9dc0b8"
 SRC_URI[sha256sum] = "5677f32eff184883d7ca402234f92142f35bea7d04d503becdd104ae8343cb1c"
diff --git a/recipes/libconfig/libconfig_1.3.2.bb b/recipes/libconfig/libconfig_1.3.2.bb
index fbe9dd9..72ab39b 100644
--- a/recipes/libconfig/libconfig_1.3.2.bb
+++ b/recipes/libconfig/libconfig_1.3.2.bb
@@ -13,9 +13,5 @@ S = "${WORKDIR}/libconfig-${PV}"
 
 inherit autotools
 
-do_stage() {
-  autotools_stage_all
-}
-
 SRC_URI[md5sum] = "094a82afd382aa2305c6cc3c06025c2d"
 SRC_URI[sha256sum] = "2a680bb33e290c3c799e3a90cf2c0fb9f5482dd930ad93d9f83ce39923258c0a"
diff --git a/recipes/libcontactsdb/libcontactsdb_0.1.bb b/recipes/libcontactsdb/libcontactsdb_0.1.bb
index 3d7e81e..0c91afe 100644
--- a/recipes/libcontactsdb/libcontactsdb_0.1.bb
+++ b/recipes/libcontactsdb/libcontactsdb_0.1.bb
@@ -9,9 +9,5 @@ GPE_TARBALL_SUFFIX = "bz2"
 
 inherit autotools gpe pkgconfig
 
-do_stage () {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "575442be0c61e4b1e05f2188e2ae3141"
 SRC_URI[sha256sum] = "33a61a28617e5513e58bde9c16ef21c82c582c1513a0a325735c090ebbd9aefe"
diff --git a/recipes/libcontactsdb/libcontactsdb_0.3.bb b/recipes/libcontactsdb/libcontactsdb_0.3.bb
index e0d6ed6..dba9a1c 100644
--- a/recipes/libcontactsdb/libcontactsdb_0.3.bb
+++ b/recipes/libcontactsdb/libcontactsdb_0.3.bb
@@ -9,9 +9,5 @@ GPE_TARBALL_SUFFIX = "bz2"
 
 inherit autotools gpe pkgconfig
 
-do_stage () {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "1398bee49a23bd33bbc3dfd9ac3555f4"
 SRC_URI[sha256sum] = "5912c1b64dd09a0cbeaa678772fae00e0eb64ffcad35f5dd80424fa7d4f33f7e"
diff --git a/recipes/libcontactsdb/libcontactsdb_0.4.bb b/recipes/libcontactsdb/libcontactsdb_0.4.bb
index 8541764..4890064 100644
--- a/recipes/libcontactsdb/libcontactsdb_0.4.bb
+++ b/recipes/libcontactsdb/libcontactsdb_0.4.bb
@@ -9,9 +9,5 @@ GPE_TARBALL_SUFFIX = "bz2"
 
 inherit autotools gpe pkgconfig
 
-do_stage () {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "a74c72dc7d9acf01109562d9a5f761e6"
 SRC_URI[sha256sum] = "8b48efab70ba1322e6f012b78d7614d6012411afe47107a5e2c1f27e1eaef3b7"
diff --git a/recipes/libcontactsdb/libcontactsdb_0.5.bb b/recipes/libcontactsdb/libcontactsdb_0.5.bb
index 6a74323..18decbf 100644
--- a/recipes/libcontactsdb/libcontactsdb_0.5.bb
+++ b/recipes/libcontactsdb/libcontactsdb_0.5.bb
@@ -8,9 +8,5 @@ GPE_TARBALL_SUFFIX = "bz2"
 
 inherit autotools gpe pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "aba090380cc30c553b2e880382bc788e"
 SRC_URI[sha256sum] = "ec8f6bb5c8e0bfbf53cae21c8e5c3cfd3b442aa7ffb4eaa646c81c0449dc0bc9"
diff --git a/recipes/libcwd/libcwd_0.99.47.bb b/recipes/libcwd/libcwd_0.99.47.bb
index edd2e2d..72006f3 100644
--- a/recipes/libcwd/libcwd_0.99.47.bb
+++ b/recipes/libcwd/libcwd_0.99.47.bb
@@ -16,10 +16,6 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PARALLEL_MAKE = ""
 
 PACKAGES =+ "${PN}-config ${PN}-mt"
diff --git a/recipes/libdvdnav/libdvdnav_0.1.10.bb b/recipes/libdvdnav/libdvdnav_0.1.10.bb
index 89ae659..553eccf 100644
--- a/recipes/libdvdnav/libdvdnav_0.1.10.bb
+++ b/recipes/libdvdnav/libdvdnav_0.1.10.bb
@@ -12,9 +12,5 @@ SRC_URI="${SOURCEFORGE_MIRROR}/dvd/${PN}-${PV}.tar.gz"
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "c8ddee96ba1182d73447eaf0bb6fde81"
 SRC_URI[sha256sum] = "c2c6ee274cbd5759715a786b949df8ac3e848ffc771173c4f006b88c665346d0"
diff --git a/recipes/libdvdread/libdvdread_0.9.6.bb b/recipes/libdvdread/libdvdread_0.9.6.bb
index 2c68d1c..b24af16 100644
--- a/recipes/libdvdread/libdvdread_0.9.6.bb
+++ b/recipes/libdvdread/libdvdread_0.9.6.bb
@@ -9,10 +9,5 @@ SRC_URI = "http://www.dtek.chalmers.se/groups/dvd/dist/libdvdread-${PV}.tar.gz"
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "329401b84ad0b00aaccaad58f2fc393c"
 SRC_URI[sha256sum] = "509503979441e078866d75a628d8a6483e67737454feaa5366f609ecf2a0f5cf"
diff --git a/recipes/libdvdread/libdvdread_0.9.7.bb b/recipes/libdvdread/libdvdread_0.9.7.bb
index 90ae973..4ccf992 100644
--- a/recipes/libdvdread/libdvdread_0.9.7.bb
+++ b/recipes/libdvdread/libdvdread_0.9.7.bb
@@ -16,10 +16,5 @@ EXTRA_OECONF = " --with-libdvdcss-includes=${STAGING_INCDIR} \
                  --with-libdvdcss-libs=${STAGING_LIBDIR} \
 "
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "078788c9241ae16763529e1235502337"
 SRC_URI[sha256sum] = "e01f70cba5cfbc577b853ae69d73f00db7161e1704dc2359c4377aac4232a184"
diff --git a/recipes/libeina/libeina_0.96.5.bb b/recipes/libeina/libeina_0.96.5.bb
index d34ed26..422af99 100644
--- a/recipes/libeina/libeina_0.96.5.bb
+++ b/recipes/libeina/libeina_0.96.5.bb
@@ -8,7 +8,3 @@ SRC_URI = "http://bolgo.cent.uji.es/files/libeina/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-autotools_stage_all
-}
-
diff --git a/recipes/libeina/libeina_0.96.7.bb b/recipes/libeina/libeina_0.96.7.bb
index d46e33f..32cae6b 100644
--- a/recipes/libeina/libeina_0.96.7.bb
+++ b/recipes/libeina/libeina_0.96.7.bb
@@ -12,10 +12,5 @@ EXTRA_OECONF = "--disable-magic"
 
 inherit autotools pkgconfig
 
-do_stage() {
-autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "72fade0fea5b67e92c2e1ff9e2c07f52"
 SRC_URI[sha256sum] = "d4fda4fc89cc5492f3cdf0445e84ab93311f9e1b22e487f3d95f3f86c90fe4f5"
diff --git a/recipes/libesmtp/libesmtp_1.0.4.bb b/recipes/libesmtp/libesmtp_1.0.4.bb
index 7ff261c..72b678b 100644
--- a/recipes/libesmtp/libesmtp_1.0.4.bb
+++ b/recipes/libesmtp/libesmtp_1.0.4.bb
@@ -12,10 +12,6 @@ inherit autotools binconfig
 
 EXTRA_OECONF = "--disable-isoc --with-openssl=${STAGING_LIBDIR}/.."
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_libesmtp_append = " ${libdir}/esmtp-plugins/*.so"
 FILES_${PN}-dbg += "${libdir}/esmtp-plugins/.debug/"
 
diff --git a/recipes/libetpan/libetpan_0.46.bb b/recipes/libetpan/libetpan_0.46.bb
index a3bee28..e411ba7 100644
--- a/recipes/libetpan/libetpan_0.46.bb
+++ b/recipes/libetpan/libetpan_0.46.bb
@@ -15,10 +15,6 @@ EXTRA_OECONF = "--without-openssl --with-gnutls --disable-db"
 
 PARALLEL_MAKE = ""
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev = "${bindir} ${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libdir}/pkgconfig"
 
diff --git a/recipes/libetpan/libetpan_0.48.bb b/recipes/libetpan/libetpan_0.48.bb
index 5e8b520..cb9bbb9 100644
--- a/recipes/libetpan/libetpan_0.48.bb
+++ b/recipes/libetpan/libetpan_0.48.bb
@@ -15,10 +15,6 @@ EXTRA_OECONF = "--without-openssl --with-gnutls --disable-db"
 
 PARALLEL_MAKE = ""
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev = "${bindir} ${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libdir}/pkgconfig"
 
diff --git a/recipes/libetpan/libetpan_0.57.bb b/recipes/libetpan/libetpan_0.57.bb
index 37599fc..c2661bd 100644
--- a/recipes/libetpan/libetpan_0.57.bb
+++ b/recipes/libetpan/libetpan_0.57.bb
@@ -16,10 +16,6 @@ EXTRA_OECONF = "--without-openssl --with-gnutls --disable-db"
 
 PARALLEL_MAKE = ""
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} = "${libdir}/lib*.so.*"
 FILES_${PN}-dev = "${bindir} ${includedir} ${libdir}/lib*.so ${libdir}/*.la ${libdir}/*.a ${libdir}/pkgconfig"
 
diff --git a/recipes/libevent/libevent_1.1a.bb b/recipes/libevent/libevent_1.1a.bb
index a72f3f8..650673e 100644
--- a/recipes/libevent/libevent_1.1a.bb
+++ b/recipes/libevent/libevent_1.1a.bb
@@ -10,10 +10,5 @@ SRC_URI = "http://monkey.org/~provos/libevent-${PV}.tar.gz"
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "6cc776458ecaf9247550863702a44d7c"
 SRC_URI[sha256sum] = "1725cd3dd9ec87a68316c36a50ab653c7e9581c91f9b1b7e9af42a9c7c499d8e"
diff --git a/recipes/libeventdb/libeventdb.inc b/recipes/libeventdb/libeventdb.inc
index 7facee7..09e6a7c 100644
--- a/recipes/libeventdb/libeventdb.inc
+++ b/recipes/libeventdb/libeventdb.inc
@@ -8,6 +8,3 @@ GPE_TARBALL_SUFFIX = "bz2"
 
 inherit pkgconfig gpe autotools
 
-do_stage () {
-        autotools_stage_all
-}
diff --git a/recipes/libexif/libexif_0.6.13.bb b/recipes/libexif/libexif_0.6.13.bb
index 6c1a1d1..2842156 100644
--- a/recipes/libexif/libexif_0.6.13.bb
+++ b/recipes/libexif/libexif_0.6.13.bb
@@ -14,9 +14,5 @@ do_configure_append() {
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "1b1e2b495c5aa20c08725f30545a110b"
 SRC_URI[sha256sum] = "830802525700e65809afdd56ccdb5cd9950747044ab50666257bbb3d59a82754"
diff --git a/recipes/libexosip2/libexosip2_2.2.3.bb b/recipes/libexosip2/libexosip2_2.2.3.bb
index dd70828..797904b 100644
--- a/recipes/libexosip2/libexosip2_2.2.3.bb
+++ b/recipes/libexosip2/libexosip2_2.2.3.bb
@@ -14,9 +14,5 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-josua"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "837a35f085890eac3328ac402b24383b"
 SRC_URI[sha256sum] = "a09e97847f3983431c5453bf2f3de1629e629c1b4ea9ddc5e3aa6caaf7417b05"
diff --git a/recipes/libexosip2/libexosip2_3.1.0.bb b/recipes/libexosip2/libexosip2_3.1.0.bb
index 36ee5fe..04dcf86 100644
--- a/recipes/libexosip2/libexosip2_3.1.0.bb
+++ b/recipes/libexosip2/libexosip2_3.1.0.bb
@@ -13,9 +13,5 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 inherit autotools pkgconfig
 EXTRA_OECONF = "--disable-josua"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "ed6005a146501a5f9308e28108ae7bca"
 SRC_URI[sha256sum] = "eed72871201e2c1deae3d7c0b618bf16f306d91fc7ebcb53956ab7468663514f"
diff --git a/recipes/libftdi/libftdi_0.13.bb b/recipes/libftdi/libftdi_0.13.bb
index 56be4c0..5633b0a 100644
--- a/recipes/libftdi/libftdi_0.13.bb
+++ b/recipes/libftdi/libftdi_0.13.bb
@@ -15,9 +15,5 @@ inherit autotools binconfig pkgconfig
 
 EXTRA_OECONF += "--disable-rpath"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "7b4a660fd644980f3d45873d156d021a"
 SRC_URI[sha256sum] = "98ceb0a3174564f310c4ff1c021bdca52558bf693003a410cdb95c8388aa11f3"
diff --git a/recipes/libftdi/libftdi_0.9.bb b/recipes/libftdi/libftdi_0.9.bb
index 1874bce..98395d8 100644
--- a/recipes/libftdi/libftdi_0.9.bb
+++ b/recipes/libftdi/libftdi_0.9.bb
@@ -12,9 +12,5 @@ inherit autotools
 
 EXTRA_OECONF = "--disable-docs"
 
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "6b1bf276ba8d623332083477f91deefd"
 SRC_URI[sha256sum] = "1ffb6284de02c75a2cd6709b6148eac0336cd0297742500da12aedd151838295"
diff --git a/recipes/libg15/libg15_1.2.1.bb b/recipes/libg15/libg15_1.2.1.bb
index e83e70f..47ce3a0 100644
--- a/recipes/libg15/libg15_1.2.1.bb
+++ b/recipes/libg15/libg15_1.2.1.bb
@@ -12,10 +12,5 @@ inherit autotools
 
 EXTRA_OECONF = "--with-gnu-ld"
 
-do_stage () {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "51d42e50ec00315f71be184ba1ddf32b"
 SRC_URI[sha256sum] = "fd9468704d55fc6796604380ee63454e954720519f827e5ac563e2144b719155"
diff --git a/recipes/libg15render/libg15render_1.2.bb b/recipes/libg15render/libg15render_1.2.bb
index 3671637..7185e25 100644
--- a/recipes/libg15render/libg15render_1.2.bb
+++ b/recipes/libg15render/libg15render_1.2.bb
@@ -12,10 +12,5 @@ inherit autotools
 
 EXTRA_OECONF = "--with-gnu-ld"
 
-do_stage () {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "a5a2a833d098926c3d289aeae452cc53"
 SRC_URI[sha256sum] = "d22335af6a17ec44799da82671778d2072499b26c5773ab913d9ba20d159d20f"
diff --git a/recipes/libgdbus/libgdbus_git.bb b/recipes/libgdbus/libgdbus_git.bb
index 73c95f3..e6385b3 100644
--- a/recipes/libgdbus/libgdbus_git.bb
+++ b/recipes/libgdbus/libgdbus_git.bb
@@ -12,6 +12,3 @@ S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
 
-do_stage() {
-    autotools_stage_all
-}
diff --git a/recipes/libgpelaunch/libgpelaunch_0.14.bb b/recipes/libgpelaunch/libgpelaunch_0.14.bb
index 2b8951a..2e48911 100644
--- a/recipes/libgpelaunch/libgpelaunch_0.14.bb
+++ b/recipes/libgpelaunch/libgpelaunch_0.14.bb
@@ -11,9 +11,5 @@ SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.bz2"
 
 FILES_${PN}-dbg += "/usr/libexec/libgpelaunch/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "cac106e90f57753511a4436ca2cdbc3b"
 SRC_URI[sha256sum] = "23425f74f304072f48d295e9d7168a6ecfb44c049074b34b71cfbf1f4d19ec85"
diff --git a/recipes/libgpelaunch/libgpelaunch_svn.bb b/recipes/libgpelaunch/libgpelaunch_svn.bb
index c7c3c8e..8691fcf 100644
--- a/recipes/libgpelaunch/libgpelaunch_svn.bb
+++ b/recipes/libgpelaunch/libgpelaunch_svn.bb
@@ -11,10 +11,6 @@ SRC_URI = "${GPE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage() {
- autotools_stage_all
-}
-
 FILES_${PN}-dbg += "${libexecdir}/libgpelaunch/.debug"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/libgpeplugin/libgpeplugin_svn.bb b/recipes/libgpeplugin/libgpeplugin_svn.bb
index 91eca5a..e7d62bd 100644
--- a/recipes/libgpeplugin/libgpeplugin_svn.bb
+++ b/recipes/libgpeplugin/libgpeplugin_svn.bb
@@ -10,10 +10,6 @@ SRC_URI = "${GPE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage() {
-      autotools_stage_all
-}
-
 #put examples in a seperate package
 PACKAGES += "${PN}-examples"
 
diff --git a/recipes/libgpevtype/libgpevtype_0.16.bb b/recipes/libgpevtype/libgpevtype_0.16.bb
index 4d0b2dc..c568cfc 100644
--- a/recipes/libgpevtype/libgpevtype_0.16.bb
+++ b/recipes/libgpevtype/libgpevtype_0.16.bb
@@ -9,10 +9,5 @@ inherit pkgconfig gpe autotools
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.bz2"
 
-do_stage () {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "dc7b99c3799ac1b5b7ef1e21450f20e4"
 SRC_URI[sha256sum] = "9a272b4c133be4d828aa58c506ea729bc472434f6475d97ea60b388a40fe444d"
diff --git a/recipes/libgpevtype/libgpevtype_0.17.bb b/recipes/libgpevtype/libgpevtype_0.17.bb
index f774e43..16a27f1 100644
--- a/recipes/libgpevtype/libgpevtype_0.17.bb
+++ b/recipes/libgpevtype/libgpevtype_0.17.bb
@@ -13,12 +13,5 @@ SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.bz2"
 
 headers = "tag-db.h vcard.h vevent.h vtodo.h"
 
-
-do_stage () {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "c9c031ee32bcdb3c8bf0d31083330d63"
 SRC_URI[sha256sum] = "21c026c120861d8b1b1178e8744a3626a56ff231c35cce0a5176305a977949ff"
diff --git a/recipes/libgpevtype/libgpevtype_0.50.bb b/recipes/libgpevtype/libgpevtype_0.50.bb
index 1a25a8e..310499d 100644
--- a/recipes/libgpevtype/libgpevtype_0.50.bb
+++ b/recipes/libgpevtype/libgpevtype_0.50.bb
@@ -9,12 +9,5 @@ inherit pkgconfig gpe autotools
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.bz2"
 
-
-do_stage () {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "4d7a20b215c53b73786690e895f05750"
 SRC_URI[sha256sum] = "a390032e637621ef8a8ff2ae3f73cf8f74f10b2f999b359253b137f1341f482e"
diff --git a/recipes/libgpevtype/libgpevtype_svn.bb b/recipes/libgpevtype/libgpevtype_svn.bb
index 44388ba..9258014 100644
--- a/recipes/libgpevtype/libgpevtype_svn.bb
+++ b/recipes/libgpevtype/libgpevtype_svn.bb
@@ -12,9 +12,4 @@ SRC_URI = "${GPE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-	autotools_stage_all
-}
-
-
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/libgpewidget/libgpewidget_0.114.bb b/recipes/libgpewidget/libgpewidget_0.114.bb
index 810bdb6..8a2ba77 100644
--- a/recipes/libgpewidget/libgpewidget_0.114.bb
+++ b/recipes/libgpewidget/libgpewidget_0.114.bb
@@ -15,10 +15,6 @@ EXTRA_OECONF = "--enable-cairo"
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libgpewidget-bin"
 FILES_libgpewidget-bin = "${bindir}/*"
 RRECOMMENDS_${PN} = "gpe-icons"
diff --git a/recipes/libgpewidget/libgpewidget_0.115.bb b/recipes/libgpewidget/libgpewidget_0.115.bb
index 0bca2ad..5b52fb0 100644
--- a/recipes/libgpewidget/libgpewidget_0.115.bb
+++ b/recipes/libgpewidget/libgpewidget_0.115.bb
@@ -14,10 +14,6 @@ EXTRA_OECONF = "--enable-cairo"
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libgpewidget-bin"
 FILES_libgpewidget-bin = "${bindir}/*"
 RRECOMMENDS_${PN} = "gpe-icons"
diff --git a/recipes/libgpewidget/libgpewidget_0.117.bb b/recipes/libgpewidget/libgpewidget_0.117.bb
index 104843c..28dc003 100644
--- a/recipes/libgpewidget/libgpewidget_0.117.bb
+++ b/recipes/libgpewidget/libgpewidget_0.117.bb
@@ -17,9 +17,5 @@ EXTRA_OECONF = "--enable-cairo"
 
 LDFLAGS += " -L${STAGING_LIBDIR}"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "b85a839264a35d0faf9a1a38c486e189"
 SRC_URI[sha256sum] = "f96d30c09b0395ea4e146730fd52d9ea303b619bb139051d9f12d3f868a9e18c"
diff --git a/recipes/libgpewidget/libgpewidget_svn.bb b/recipes/libgpewidget/libgpewidget_svn.bb
index 3241737..09a38eb 100644
--- a/recipes/libgpewidget/libgpewidget_svn.bb
+++ b/recipes/libgpewidget/libgpewidget_svn.bb
@@ -15,8 +15,4 @@ S = "${WORKDIR}/${PN}"
 
 EXTRA_OECONF = "--enable-cairo"
 
-do_stage () {
-	autotools_stage_all
-}
-
 RRECOMMENDS_${PN} = "gpe-icons"
diff --git a/recipes/libgphoto2/libgphoto2_2.4.0.bb b/recipes/libgphoto2/libgphoto2_2.4.0.bb
index 728b08c..b078937 100644
--- a/recipes/libgphoto2/libgphoto2_2.4.0.bb
+++ b/recipes/libgphoto2/libgphoto2_2.4.0.bb
@@ -24,11 +24,5 @@ FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 FILES_${PN} += "${libdir}/udev/*"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "a60154772635b693ff08b4f34dea7f61"
 SRC_URI[sha256sum] = "0dc26b7a8568dee7634bebbaf9f7d3e3ab9460424e6297a595e41c4fddbbdb79"
diff --git a/recipes/libhal-nm/libhal-nm_0.0.2.bb b/recipes/libhal-nm/libhal-nm_0.0.2.bb
index 6e0ce2c..5954f38 100644
--- a/recipes/libhal-nm/libhal-nm_0.0.2.bb
+++ b/recipes/libhal-nm/libhal-nm_0.0.2.bb
@@ -10,10 +10,6 @@ PR = "r1"
 
 inherit autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
 do_install () {
 	oe_runmake DESTDIR=${D} install
 }
diff --git a/recipes/libhandoff/libhandoff_0.1.bb b/recipes/libhandoff/libhandoff_0.1.bb
index 4b95a22..b9abf3e 100644
--- a/recipes/libhandoff/libhandoff_0.1.bb
+++ b/recipes/libhandoff/libhandoff_0.1.bb
@@ -8,9 +8,5 @@ inherit pkgconfig gpe autotools
 
 GPE_TARBALL_SUFFIX = "bz2"
 
-do_stage () {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "8ec44fda9476391ed372f835d5358fe8"
 SRC_URI[sha256sum] = "9505377f6b4d4b657889e8468fca8049c8c2c46c3ddd03bb4eef0e7b2e1bad3b"
diff --git a/recipes/libhandoff/libhandoff_svn.bb b/recipes/libhandoff/libhandoff_svn.bb
index c545d92..306c52d 100644
--- a/recipes/libhandoff/libhandoff_svn.bb
+++ b/recipes/libhandoff/libhandoff_svn.bb
@@ -13,6 +13,3 @@ SRC_URI = "${GPE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-autotools_stage_all
-}
diff --git a/recipes/libhangul/libhangul_0.0.4.bb b/recipes/libhangul/libhangul_0.0.4.bb
index c5a3135..4acb32b 100644
--- a/recipes/libhangul/libhangul_0.0.4.bb
+++ b/recipes/libhangul/libhangul_0.0.4.bb
@@ -9,9 +9,5 @@ SRC_URI = "http://kldp.net/frs/download.php/3733/${PN}-${PV}.tar.gz"
 
 inherit autotools pkgconfig lib_package
 
-do_stage() {
-       autotools_stage_all
-}
-
 SRC_URI[md5sum] = "a32301e03a381917cb2ec836a43a9664"
 SRC_URI[sha256sum] = "939bbcacd49487f830cd9d8bf56f81043f519bb7bfbcfb568fd87bf484120a10"
diff --git a/recipes/libical/libical_0.27.bb b/recipes/libical/libical_0.27.bb
index 1c3cdc7..f582116 100644
--- a/recipes/libical/libical_0.27.bb
+++ b/recipes/libical/libical_0.27.bb
@@ -10,9 +10,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freeassociation/${P}.tar.gz \
 
 inherit autotools
 
-do_stage () {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "87d48321bff08de08794132d60b55d94"
 SRC_URI[sha256sum] = "7f1fa404e5540c880cc747c4a680a89d88b87b10a1c77655f512780fcb0ca5d0"
diff --git a/recipes/libical/libical_0.44.bb b/recipes/libical/libical_0.44.bb
index 2d84a51..272e07e 100644
--- a/recipes/libical/libical_0.44.bb
+++ b/recipes/libical/libical_0.44.bb
@@ -10,9 +10,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/freeassociation/${P}.tar.gz \
 
 inherit autotools
 
-do_stage () {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "e0403c31e1ed82569325685f8c15959c"
 SRC_URI[sha256sum] = "20a4750df8f4dedd718b55117b8351989e0dfa4ad2c966a383550ed43e6a72d8"
diff --git a/recipes/libid3/libid3_1.1.bb b/recipes/libid3/libid3_1.1.bb
index c839a66..10da288 100644
--- a/recipes/libid3/libid3_1.1.bb
+++ b/recipes/libid3/libid3_1.1.bb
@@ -7,10 +7,5 @@ SRC_URI = "http://download.tangent.org/libid3-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-    autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "e089e8c8c7276373db0a856c508bd8f9"
 SRC_URI[sha256sum] = "117831ba06b255ede3cc318278108d19db972b6365c3d80d374d8f888f834c98"
diff --git a/recipes/libidl/libidl.inc b/recipes/libidl/libidl.inc
index e032575..7a90a70 100644
--- a/recipes/libidl/libidl.inc
+++ b/recipes/libidl/libidl.inc
@@ -8,9 +8,5 @@ SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libIDL/0.8/libIDL-${PV}.tar.bz
 
 S = "${WORKDIR}/libIDL-${PV}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += " ${bindir}"
diff --git a/recipes/libmimedir/libmimedir_0.3.1.bb b/recipes/libmimedir/libmimedir_0.3.1.bb
index 3ea46e5..b4f01f2 100644
--- a/recipes/libmimedir/libmimedir_0.3.1.bb
+++ b/recipes/libmimedir/libmimedir_0.3.1.bb
@@ -17,11 +17,6 @@ inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-autotools_stage_all
-}
-
-
 PACKAGES += "libmimedir-utils"
 FILES_libmimedir-utils = "${bindir}"
 FILES_${PN} = "${libdir}/*.so.*"
diff --git a/recipes/libmimedir/libmimedir_0.4.2.bb b/recipes/libmimedir/libmimedir_0.4.2.bb
index d1f62d7..15e64a2 100644
--- a/recipes/libmimedir/libmimedir_0.4.2.bb
+++ b/recipes/libmimedir/libmimedir_0.4.2.bb
@@ -9,11 +9,6 @@ inherit autotools pkgconfig gpe
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-    autotools_stage_all
-}
-
-
 PACKAGES += "libmimedir-utils"
 FILES_libmimedir-utils = "${bindir}"
 FILES_${PN} = "${libdir}/*.so.*"
diff --git a/recipes/libmimedir/libmimedir_svn.bb b/recipes/libmimedir/libmimedir_svn.bb
index 8bd7cc4..b67d7a6 100644
--- a/recipes/libmimedir/libmimedir_svn.bb
+++ b/recipes/libmimedir/libmimedir_svn.bb
@@ -17,10 +17,6 @@ inherit autotools pkgconfig lib_package
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-do_stage() {
-        autotools_stage_all
-}
-
 PACKAGES += "libmimedir-utils"
 
 FILES_libmimedir-utils = "${bindir}"
diff --git a/recipes/libmpcdec/libmpcdec_1.2.6.bb b/recipes/libmpcdec/libmpcdec_1.2.6.bb
index 7e2b224..0cc6418 100644
--- a/recipes/libmpcdec/libmpcdec_1.2.6.bb
+++ b/recipes/libmpcdec/libmpcdec_1.2.6.bb
@@ -15,9 +15,5 @@ do_configure () {
         oe_runconf
 }
 
-do_stage () {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "7f7a060e83b4278acf4b77d7a7b9d2c0"
 SRC_URI[sha256sum] = "4bd54929a80850754f27b568d7891e1e3e1b8d2f208d371f27d1fda09e6f12a8"
diff --git a/recipes/libmrss/libmrss.inc b/recipes/libmrss/libmrss.inc
index de4b705..9f80d8d 100644
--- a/recipes/libmrss/libmrss.inc
+++ b/recipes/libmrss/libmrss.inc
@@ -10,6 +10,3 @@ inherit autotools pkgconfig
 SRC_URI = "http://www.autistici.org/bakunin/libmrss/libmrss-${PV}.tar.gz \
           "
 
-do_stage() {
-    autotools_stage_all
-}
diff --git a/recipes/libnetfilter/libnetfilter-queue.inc b/recipes/libnetfilter/libnetfilter-queue.inc
index 96ec16c..9754f79 100644
--- a/recipes/libnetfilter/libnetfilter-queue.inc
+++ b/recipes/libnetfilter/libnetfilter-queue.inc
@@ -16,7 +16,3 @@ S = "${WORKDIR}/libnetfilter_queue-${PV}"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/libnotify/libnotify_0.4.4.bb b/recipes/libnotify/libnotify_0.4.4.bb
index b7e36a6..105cfa3 100644
--- a/recipes/libnotify/libnotify_0.4.4.bb
+++ b/recipes/libnotify/libnotify_0.4.4.bb
@@ -9,9 +9,5 @@ SRC_URI = "http://www.galago-project.org/files/releases/source/${PN}/${PN}-${PV}
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "ba76f68b7e3bd284ac2c2a1b9c5ecb06"
 SRC_URI[sha256sum] = "2389a9b8220f776033f728a8d46352cfee5c8705066e34887bfb188f9f0d3856"
diff --git a/recipes/libnotify/libnotify_0.4.5.bb b/recipes/libnotify/libnotify_0.4.5.bb
index 6aa0e8e..ee9510c 100644
--- a/recipes/libnotify/libnotify_0.4.5.bb
+++ b/recipes/libnotify/libnotify_0.4.5.bb
@@ -9,9 +9,5 @@ SRC_URI = "http://www.galago-project.org/files/releases/source/${PN}/${PN}-${PV}
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "472e2c1f808848365572a9b024d9e8f5"
 SRC_URI[sha256sum] = "0799db8ea1500b65a477421a8c930cc8c8b0bbc0596e55ea1601e2542f3fb0d9"
diff --git a/recipes/liboil/liboil_0.3.10.bb b/recipes/liboil/liboil_0.3.10.bb
index 7e5f951..c6c4b32 100644
--- a/recipes/liboil/liboil_0.3.10.bb
+++ b/recipes/liboil/liboil_0.3.10.bb
@@ -7,9 +7,5 @@ SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "770f656bca8166dab33b322d5886a4bf"
 SRC_URI[sha256sum] = "4587753a023550a066abe59a7e467c1af35b9f5e81bfb40a12463ad2df8f088c"
diff --git a/recipes/liboil/liboil_0.3.11.bb b/recipes/liboil/liboil_0.3.11.bb
index d8e055a..e57b589 100644
--- a/recipes/liboil/liboil_0.3.11.bb
+++ b/recipes/liboil/liboil_0.3.11.bb
@@ -10,9 +10,5 @@ SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "65ce3266be385d0c7cd9a1157433332f"
 SRC_URI[sha256sum] = "deb6530d40ecad2b849d68912500e6d03bab4ac63de7a97340d05af1d7cf0ad4"
diff --git a/recipes/liboil/liboil_0.3.14.bb b/recipes/liboil/liboil_0.3.14.bb
index 92db760..1ca7649 100644
--- a/recipes/liboil/liboil_0.3.14.bb
+++ b/recipes/liboil/liboil_0.3.14.bb
@@ -13,9 +13,5 @@ SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz \
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "7a9f719e50656b795c06c0167012a84f"
 SRC_URI[sha256sum] = "a40c09db6ee24e03aa81f58329a57e45e55462a2e0f619b3796d4bf942c23f2f"
diff --git a/recipes/liboil/liboil_0.3.9.bb b/recipes/liboil/liboil_0.3.9.bb
index c066fa4..1d1fa35 100644
--- a/recipes/liboil/liboil_0.3.9.bb
+++ b/recipes/liboil/liboil_0.3.9.bb
@@ -7,9 +7,5 @@ SRC_URI = "http://liboil.freedesktop.org/download/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "5d139b1fb16f0e93f0c84290ad2aaff8"
 SRC_URI[sha256sum] = "dd4d680ce95e586a1bbe767e1a7b25e1c53f842b8be6cf4e30e89cfa8232dd90"
diff --git a/recipes/libosip2/libosip2_3.1.0.bb b/recipes/libosip2/libosip2_3.1.0.bb
index d9521b8..fa1321c 100644
--- a/recipes/libosip2/libosip2_3.1.0.bb
+++ b/recipes/libosip2/libosip2_3.1.0.bb
@@ -7,9 +7,5 @@ SRC_URI = "${GNU_MIRROR}/osip/libosip2-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "7eb305608256ac2a7a27b66ce52627c8"
 SRC_URI[sha256sum] = "245911a9a48bbe868c4518faf86191f6568fb99d9967d368164a17a83671e8fb"
diff --git a/recipes/librfid/librfid_svn.bb b/recipes/librfid/librfid_svn.bb
index ef8faa2..50a7111 100644
--- a/recipes/librfid/librfid_svn.bb
+++ b/recipes/librfid/librfid_svn.bb
@@ -34,6 +34,3 @@ do_install_append() {
 	install -m 0644 ${WORKDIR}/librfid.rules ${D}/${sysconfdir}/udev/rules.d/70-librfid.rules
 }
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/librsvg/librsvg_2.11.1.bb b/recipes/librsvg/librsvg_2.11.1.bb
index 0622d3c..13d8533 100644
--- a/recipes/librsvg/librsvg_2.11.1.bb
+++ b/recipes/librsvg/librsvg_2.11.1.bb
@@ -31,9 +31,5 @@ fi
         gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "28400811169e8ed3cc31b5bb0e9555af"
 SRC_URI[archive.sha256sum] = "55b6ce75d0526ddf53006ab6838ccc5eb4a04736b7f52d2df081296f4a6e3ac7"
diff --git a/recipes/librsvg/librsvg_2.16.1.bb b/recipes/librsvg/librsvg_2.16.1.bb
index c1d8173..2835c1d 100644
--- a/recipes/librsvg/librsvg_2.16.1.bb
+++ b/recipes/librsvg/librsvg_2.16.1.bb
@@ -31,9 +31,5 @@ fi
         gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "37e046571097ff7ce77ae6e07f096324"
 SRC_URI[archive.sha256sum] = "2989d6a969b6f80d354f8120a5dd625d2c0b4e9e04bf178e9e7b34ae28e2ac69"
diff --git a/recipes/librsvg/librsvg_2.22.2.bb b/recipes/librsvg/librsvg_2.22.2.bb
index 06047ad..9887304 100644
--- a/recipes/librsvg/librsvg_2.22.2.bb
+++ b/recipes/librsvg/librsvg_2.22.2.bb
@@ -29,9 +29,5 @@ fi
         gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "aae602677ce201b1a0ed6a0c18c207f2"
 SRC_URI[archive.sha256sum] = "2bfc1853ecdc545bf3767ed92c93b8796f2075f522c8eab1693c96f11d55a59e"
diff --git a/recipes/librsvg/librsvg_2.26.0.bb b/recipes/librsvg/librsvg_2.26.0.bb
index 6403186..e722517 100644
--- a/recipes/librsvg/librsvg_2.26.0.bb
+++ b/recipes/librsvg/librsvg_2.26.0.bb
@@ -30,9 +30,5 @@ fi
         gdk-pixbuf-query-loaders > /etc/gtk-2.0/gdk-pixbuf.loaders
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "65dbd726a514fe8b797d26254b8efc1e"
 SRC_URI[archive.sha256sum] = "fdcab5f0d86198d8cbd4ffe5b333076f75e707f6d7e4af5e87a8644ff7533bea"
diff --git a/recipes/libschedule/libschedule_0.15.bb b/recipes/libschedule/libschedule_0.15.bb
index 978a8bd..ec57053 100644
--- a/recipes/libschedule/libschedule_0.15.bb
+++ b/recipes/libschedule/libschedule_0.15.bb
@@ -8,11 +8,5 @@ GPE_TARBALL_SUFFIX = "gz"
 
 inherit autotools pkgconfig gpe
 
-
-do_stage () {
-autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "58ac7e5b3d9b0a1b8adf0a57fd265c76"
 SRC_URI[sha256sum] = "9b3577052db92ac9282f4912eaa487729de34bf058585cfcbc79478831207889"
diff --git a/recipes/libschedule/libschedule_0.16.bb b/recipes/libschedule/libschedule_0.16.bb
index a1b25ac..9f96b7a 100644
--- a/recipes/libschedule/libschedule_0.16.bb
+++ b/recipes/libschedule/libschedule_0.16.bb
@@ -9,9 +9,5 @@ GPE_TARBALL_SUFFIX = "bz2"
 
 inherit autotools pkgconfig gpe
 
-do_stage () {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "da63b0ed460c0f44b9f85774caf3fb0d"
 SRC_URI[sha256sum] = "a33977201ff13a4c08d3a74de0fcdbe7f072e4a92a261d5f39fbf16aab069050"
diff --git a/recipes/libschedule/libschedule_0.17.bb b/recipes/libschedule/libschedule_0.17.bb
index 366961c..cc71606 100644
--- a/recipes/libschedule/libschedule_0.17.bb
+++ b/recipes/libschedule/libschedule_0.17.bb
@@ -9,9 +9,5 @@ GPE_TARBALL_SUFFIX = "bz2"
 
 inherit autotools pkgconfig gpe
 
-do_stage () {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "ba3a1063a9e8cd5a730b3871e468c227"
 SRC_URI[sha256sum] = "802c72f5f11d60f5cb75ef8acc116c5ab0600e3bc099fc5accf8a997e463b374"
diff --git a/recipes/libschedule/libschedule_svn.bb b/recipes/libschedule/libschedule_svn.bb
index 1095c2d..b844144 100644
--- a/recipes/libschedule/libschedule_svn.bb
+++ b/recipes/libschedule/libschedule_svn.bb
@@ -12,8 +12,4 @@ SRC_URI = "${GPE_SVN}"
 
 S = "${WORKDIR}/${PN}"
 
-do_stage () {
-        autotools_stage_all
-}
-
 DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/libsdl/libsdl-gfx_2.0.17.bb b/recipes/libsdl/libsdl-gfx_2.0.17.bb
index efb9485..5b11503 100644
--- a/recipes/libsdl/libsdl-gfx_2.0.17.bb
+++ b/recipes/libsdl/libsdl-gfx_2.0.17.bb
@@ -12,10 +12,5 @@ inherit autotools
 EXTRA_OECONF = "--disable-mmx"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "a7ab98ad530fdc59a23f7dff502db8d3"
 SRC_URI[sha256sum] = "d08d8477ff1c6639bc7193b76a415f996c98604600e9fa4e718fd4e9283f83f4"
diff --git a/recipes/libsdl/libsdl-image_1.2.3.bb b/recipes/libsdl/libsdl-image_1.2.3.bb
index 9f93e17..9ed720e 100644
--- a/recipes/libsdl/libsdl-image_1.2.3.bb
+++ b/recipes/libsdl/libsdl-image_1.2.3.bb
@@ -8,10 +8,5 @@ SRC_URI += "\
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "d55826ffbd2bdc48b09cc64a9ed9e59e"
 SRC_URI[sha256sum] = "2f710b94f547ec7e39844f7872e1fe8d6fe2a434c896cc8a54b5540854bb5a69"
diff --git a/recipes/libsdl/libsdl-net_1.2.7.bb b/recipes/libsdl/libsdl-net_1.2.7.bb
index d4183de..b6c2a47 100644
--- a/recipes/libsdl/libsdl-net_1.2.7.bb
+++ b/recipes/libsdl/libsdl-net_1.2.7.bb
@@ -15,10 +15,5 @@ inherit autotools
 
 EXTRA_OECONF += "SDL_CONFIG=${STAGING_BINDIR_CROSS}/sdl-config"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "6bd4662d1423810f3140d4da21b6d912"
 SRC_URI[sha256sum] = "2ce7c84e62ff8117b9f205758bcce68ea603e08bc9d6936ded343735b8b77c53"
diff --git a/recipes/libsdl/libsdl-ttf_2.0.3.bb b/recipes/libsdl/libsdl-ttf_2.0.3.bb
index c011f6a..982e54a 100644
--- a/recipes/libsdl/libsdl-ttf_2.0.3.bb
+++ b/recipes/libsdl/libsdl-ttf_2.0.3.bb
@@ -13,9 +13,5 @@ inherit autotools
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "29d12d1b883bf834c291c93f52ba8dc5"
 SRC_URI[sha256sum] = "7e2e7b46088a7b9594b255b58123598d49c5c3d11bcc3c9a8f80969cd9caa6c5"
diff --git a/recipes/libserial/libserial_0.5.2.bb b/recipes/libserial/libserial_0.5.2.bb
index 36b2818..18e176a 100644
--- a/recipes/libserial/libserial_0.5.2.bb
+++ b/recipes/libserial/libserial_0.5.2.bb
@@ -7,10 +7,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libserial/libserial-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "7a3766e354c31513ff6d7859a4b2c1b8"
 SRC_URI[sha256sum] = "898012c30596bba605cdee76a80dd6a7a42506cc04d0137e23e2c40681573f03"
diff --git a/recipes/libsexy/libsexy.inc b/recipes/libsexy/libsexy.inc
index b6eb92c..4635556 100644
--- a/recipes/libsexy/libsexy.inc
+++ b/recipes/libsexy/libsexy.inc
@@ -10,8 +10,3 @@ SRC_URI = "http://releases.chipx86.com/libsexy/${PN}/${PN}-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-do_stage() {
-autotools_stage_all
-}
-
-
diff --git a/recipes/libshout/libshout.inc b/recipes/libshout/libshout.inc
index ed8577f..5f47baf 100644
--- a/recipes/libshout/libshout.inc
+++ b/recipes/libshout/libshout.inc
@@ -15,6 +15,3 @@ do_configure_prepend() {
     rm -f ${S}/m4/vorbis.m4
 }
 
-do_stage() {
-    autotools_stage_all
-}
diff --git a/recipes/libsmi/libsmi_0.4.8.bb b/recipes/libsmi/libsmi_0.4.8.bb
index db54882..e2055bb 100644
--- a/recipes/libsmi/libsmi_0.4.8.bb
+++ b/recipes/libsmi/libsmi_0.4.8.bb
@@ -9,10 +9,5 @@ PACKAGES += "${PN}-mibs ${PN}-pibs"
 FILES_${PN}-mibs += "${datadir}/mibs"
 FILES_${PN}-pibs += "${datadir}/pibs"
 
-do_stage() {
-      autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "760b6b1070738158708649ed2c63425e"
 SRC_URI[sha256sum] = "f048a5270f41bc88b0c3b0a8fe70ca4d716a46b531a0ecaaa87c462f49d74849"
diff --git a/recipes/libsoundgen/libsoundgen_0.5.bb b/recipes/libsoundgen/libsoundgen_0.5.bb
index b9eaa0b..b00ea37 100644
--- a/recipes/libsoundgen/libsoundgen_0.5.bb
+++ b/recipes/libsoundgen/libsoundgen_0.5.bb
@@ -6,11 +6,5 @@ inherit gpe autotools pkgconfig
 LICENSE = "LGPL"
 DEPENDS = "esound"
 
-
-do_stage() {
-       autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "de41eed3de2bb441969db8254dc0c889"
 SRC_URI[sha256sum] = "08bc3bf18fdd5b27eb554e3cb0c2f0c2805f470909f21a09df26bc8fb8732fd7"
diff --git a/recipes/libsoundgen/libsoundgen_0.6.bb b/recipes/libsoundgen/libsoundgen_0.6.bb
index f932cc9..cd71245 100644
--- a/recipes/libsoundgen/libsoundgen_0.6.bb
+++ b/recipes/libsoundgen/libsoundgen_0.6.bb
@@ -6,11 +6,5 @@ inherit gpe autotools pkgconfig
 LICENSE = "LGPL"
 DEPENDS = "esound"
 
-
-do_stage() {
-       autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "ce7e2c206c612e2dd09ec42e1179c9a7"
 SRC_URI[sha256sum] = "b4d9050bf46dab0f2f3a47911eac255c08159ab3965f5f10c4ab4e903eee1e31"
diff --git a/recipes/libspiff/libspiff_0.8.2.bb b/recipes/libspiff/libspiff_0.8.2.bb
index b0117cb..a3ec9b1 100644
--- a/recipes/libspiff/libspiff_0.8.2.bb
+++ b/recipes/libspiff/libspiff_0.8.2.bb
@@ -17,10 +17,5 @@ EXTRA_OECONF = "\
 
 CPPFLAGS += "-I${S}/include"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "e6505bdff9048bf61533c00caf48d553"
 SRC_URI[sha256sum] = "8451c7182a99f0f4a88b3c19234c5182689f91444c50fcb510452b5e5b8a7805"
diff --git a/recipes/libstroke/libstroke_0.5.1.bb b/recipes/libstroke/libstroke_0.5.1.bb
index d4256f5..6966497 100644
--- a/recipes/libstroke/libstroke_0.5.1.bb
+++ b/recipes/libstroke/libstroke_0.5.1.bb
@@ -15,9 +15,5 @@ SRC_URI = "http://www.etla.net/libstroke/${P}.tar.gz \
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "51b9a4e309ac15cfcab96191eed03cb2"
 SRC_URI[sha256sum] = "0da9f5fde66feaf6697ba069baced8fb3772c3ddc609f39861f92788f5c7772d"
diff --git a/recipes/libtheora/libtheora_0.9+1.0alpha7.bb b/recipes/libtheora/libtheora_0.9+1.0alpha7.bb
index e5ef755..2fbce48 100644
--- a/recipes/libtheora/libtheora_0.9+1.0alpha7.bb
+++ b/recipes/libtheora/libtheora_0.9+1.0alpha7.bb
@@ -12,11 +12,5 @@ do_configure_append() {
         find ${S} -name Makefile | xargs sed -i -e s:'-I/usr/include':-I${STAGING_INCDIR}:g
 }
 
-do_stage() {
-         autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "55ee3c6db3e0927e7918309891a8f52b"
 SRC_URI[sha256sum] = "f5c7730ded0273a8615b12b46a32b800bbcb9e861e3a18aa92b1c062981a2fef"
diff --git a/recipes/libtododb/libtododb_0.11.bb b/recipes/libtododb/libtododb_0.11.bb
index d55c418..ea83e90 100644
--- a/recipes/libtododb/libtododb_0.11.bb
+++ b/recipes/libtododb/libtododb_0.11.bb
@@ -7,11 +7,6 @@ DEPENDS = "libgpewidget libgpepimc sqlite"
 GPE_TARBALL_SUFFIX = "bz2"
 inherit pkgconfig gpe autotools
 
-
-do_stage () {
-        autotools_stage_all
-}
-
 do_install () {
 	gpe_do_install
 #	oe_runmake PREFIX=${prefix} DESTDIR=${D} install-devel
diff --git a/recipes/liburiparser/liburiparser_0.5.1.bb b/recipes/liburiparser/liburiparser_0.5.1.bb
index 13311b4..e980152 100644
--- a/recipes/liburiparser/liburiparser_0.5.1.bb
+++ b/recipes/liburiparser/liburiparser_0.5.1.bb
@@ -9,10 +9,5 @@ S = "${WORKDIR}/uriparser-${PV}"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "faf561c6260e1b580cba2509f410a29f"
 SRC_URI[sha256sum] = "5a664f5c8f404c1148f661499866f1fe8df8debef2adc55c630ac83e6d57a98c"
diff --git a/recipes/libvisual/libvisual_0.4.0.bb b/recipes/libvisual/libvisual_0.4.0.bb
index 7288127..7da4ef7 100644
--- a/recipes/libvisual/libvisual_0.4.0.bb
+++ b/recipes/libvisual/libvisual_0.4.0.bb
@@ -7,9 +7,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libvisual/libvisual-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-  autotools_stage_all
-}
-
 SRC_URI[md5sum] = "f4e78547c79ea8a8ad111cf8b85011bb"
 SRC_URI[sha256sum] = "0b4dfdb87125e129567752089e3c8b54cefed601eef169d2533d8659da8dc1d7"
diff --git a/recipes/libw100/libw100_0.0.2.bb b/recipes/libw100/libw100_0.0.2.bb
index 600d184..247b3c4 100644
--- a/recipes/libw100/libw100_0.0.2.bb
+++ b/recipes/libw100/libw100_0.0.2.bb
@@ -8,7 +8,3 @@ S = "${WORKDIR}/rev_0_0_2"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/libw100/libw100_svn.bb b/recipes/libw100/libw100_svn.bb
index 343d530..277b0e9 100644
--- a/recipes/libw100/libw100_svn.bb
+++ b/recipes/libw100/libw100_svn.bb
@@ -10,7 +10,3 @@ S = "${WORKDIR}/trunk"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/libwpd/libwpd_0.8.14.bb b/recipes/libwpd/libwpd_0.8.14.bb
index 8a841e1..32a5864 100644
--- a/recipes/libwpd/libwpd_0.8.14.bb
+++ b/recipes/libwpd/libwpd_0.8.14.bb
@@ -7,9 +7,5 @@ DEPENDS = "libgsf"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "64d66018897d759358f454010b6e75d2"
 SRC_URI[sha256sum] = "01744fa637ad16a8ffaefb1aa7b9b42a56e92f0a2a18753f6720a85aa289d4eb"
diff --git a/recipes/libwpd/libwpd_0.8.4.bb b/recipes/libwpd/libwpd_0.8.4.bb
index 4f5166b..701d656 100644
--- a/recipes/libwpd/libwpd_0.8.4.bb
+++ b/recipes/libwpd/libwpd_0.8.4.bb
@@ -7,10 +7,5 @@ DEPENDS = "libgsf"
 
 inherit autotools pkgconfig
 
-
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "0461d4bf2da534b4bed041b67d7f7064"
 SRC_URI[sha256sum] = "b6393088bf6c49b72a07d2aec7d84d14f6cab0ab00ad177c17157f03095f2096"
diff --git a/recipes/libwpd/libwpd_0.8.6.bb b/recipes/libwpd/libwpd_0.8.6.bb
index 22e2feb..af04b5a 100644
--- a/recipes/libwpd/libwpd_0.8.6.bb
+++ b/recipes/libwpd/libwpd_0.8.6.bb
@@ -7,10 +7,5 @@ DEPENDS = "libgsf"
 
 inherit autotools pkgconfig
 
-
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "464a390c66511831821de81b887d3e61"
 SRC_URI[sha256sum] = "05a67a8b8d907ebcbac0e8505fc59fc50731ba9f73b8c177898ce41d0575bb17"
diff --git a/recipes/libxine/libxine.inc b/recipes/libxine/libxine.inc
index 91bb30f..3eeeb63 100644
--- a/recipes/libxine/libxine.inc
+++ b/recipes/libxine/libxine.inc
@@ -35,10 +35,6 @@ EXTRA_OECONF = "--with-zlib-path=${STAGING_EXECPREFIXDIR} \
 LIBTOOL = "${HOST_SYS}-libtool"
 EXTRA_OEMAKE = "'LIBTOOL=${LIBTOOL}'"
 
-do_stage() {
-        autotools_stage_all
-}
-
 PACKAGES_DYNAMIC = "libxine-plugin-* libxine-font-*"
 
 python populate_packages_prepend () {
diff --git a/recipes/libxosd/libxosd_svn.bb b/recipes/libxosd/libxosd_svn.bb
index 02a4069..7a0ecd4 100644
--- a/recipes/libxosd/libxosd_svn.bb
+++ b/recipes/libxosd/libxosd_svn.bb
@@ -14,10 +14,6 @@ S = "${WORKDIR}/current"
 
 inherit autotools binconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "${PN}-examples-dbg ${PN}-examples"
 FILES_${PN}-examples = "${bindir}/osd_cat"
 FILES_${PN}-examples-dbg += "${bindir}/.debug/"
diff --git a/recipes/libzvbi/libzvbi_0.2.22.bb b/recipes/libzvbi/libzvbi_0.2.22.bb
index 0707563..bbe6255 100644
--- a/recipes/libzvbi/libzvbi_0.2.22.bb
+++ b/recipes/libzvbi/libzvbi_0.2.22.bb
@@ -12,11 +12,5 @@ S = "${WORKDIR}/zvbi-${PV}"
 
 inherit autotools pkgconfig 
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "a01cbe39a48579ba92582ff75a5e37c2"
 SRC_URI[sha256sum] = "a832819915838b364dd19f7f5d8d632b7d0493d8a19e2d011f9b5a3f2e8cf266"
diff --git a/recipes/libzvbi/libzvbi_0.2.25.bb b/recipes/libzvbi/libzvbi_0.2.25.bb
index a3160a2..93cd6ec 100644
--- a/recipes/libzvbi/libzvbi_0.2.25.bb
+++ b/recipes/libzvbi/libzvbi_0.2.25.bb
@@ -14,10 +14,5 @@ EXTRA_OECONF = "--without-x"
 
 inherit autotools pkgconfig 
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "b63c626baf1fc385df04d88bc9628a4a"
 SRC_URI[sha256sum] = "fa85c35ae5694e6b1ce0dee920c1ecb93698b66c35717368143560930aedbc13"
diff --git a/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb b/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
index 78cd853..cbb8f4b 100644
--- a/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
+++ b/recipes/lightmediascanner/lightmediascanner_0.2.0.0.bb
@@ -11,9 +11,5 @@ inherit autotools pkgconfig
 
 FILES_${PN}-dbg += "${libdir}/${PN}/plugins/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "ee1494b6dff3a50be64a3266819056d5"
 SRC_URI[sha256sum] = "98f980e8971fa4d04a589215c3b90d2eaf317ed70fd0d4988089e0fe5808c853"
diff --git a/recipes/log4cxx/log4cxx_0.9.7.bb b/recipes/log4cxx/log4cxx_0.9.7.bb
index c014d51..a9337d3 100644
--- a/recipes/log4cxx/log4cxx_0.9.7.bb
+++ b/recipes/log4cxx/log4cxx_0.9.7.bb
@@ -14,9 +14,5 @@ S = "${WORKDIR}/${PN}-${PV}"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "fd09abc90b8c0c8af1d5146a75590792"
 SRC_URI[sha256sum] = "5b41b2fc267595bdb0fa4cd1152309413bc70e6d9196293113ebb82751eb7ec6"
diff --git a/recipes/loudmouth/loudmouth_1.0.1.bb b/recipes/loudmouth/loudmouth_1.0.1.bb
index 4914d6d..2994725 100644
--- a/recipes/loudmouth/loudmouth_1.0.1.bb
+++ b/recipes/loudmouth/loudmouth_1.0.1.bb
@@ -6,9 +6,5 @@ SRC_URI = "http://ftp.imendio.com/pub/imendio/${PN}/src/${PN}-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "d43408ecb82dcbacfc965b4bb989e9c3"
 SRC_URI[sha256sum] = "c7cdd8ebffedf878e7b7d5d3848ecaacec4a7d57afd29602c2c9d64f0d8b5a63"
diff --git a/recipes/loudmouth/loudmouth_1.1.1.bb b/recipes/loudmouth/loudmouth_1.1.1.bb
index bd61f95..0e0bcfb 100644
--- a/recipes/loudmouth/loudmouth_1.1.1.bb
+++ b/recipes/loudmouth/loudmouth_1.1.1.bb
@@ -6,9 +6,5 @@ SRC_URI = "http://ftp.imendio.com/pub/imendio/${PN}/src/${PN}-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "7abcba853b45a8595333da9aa807623c"
 SRC_URI[sha256sum] = "f7614a14e2ae31b2ba22e419f78ba0d21afbb98fdeb24ae117327c3c8af05f1d"
diff --git a/recipes/loudmouth/loudmouth_1.2.2.bb b/recipes/loudmouth/loudmouth_1.2.2.bb
index 4e2754f..669e457 100644
--- a/recipes/loudmouth/loudmouth_1.2.2.bb
+++ b/recipes/loudmouth/loudmouth_1.2.2.bb
@@ -7,9 +7,5 @@ SRC_URI = "http://ftp.imendio.com/pub/imendio/${PN}/src/${PN}-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "b80fb99e263dc67c2e8270bc22db8155"
 SRC_URI[sha256sum] = "d7efb5a6c777ed0f375444a57e4de75e8406adb61d1f52829f84bc5404cfb03b"
diff --git a/recipes/loudmouth/loudmouth_1.3.2.bb b/recipes/loudmouth/loudmouth_1.3.2.bb
index a32e2c7..59570fa 100644
--- a/recipes/loudmouth/loudmouth_1.3.2.bb
+++ b/recipes/loudmouth/loudmouth_1.3.2.bb
@@ -7,9 +7,5 @@ SRC_URI = "http://ftp.imendio.com/pub/imendio/${PN}/src/${PN}-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "459fc597caea350951f647a92c9c272f"
 SRC_URI[sha256sum] = "361a2861a5cd5bc7bd3320b60165c3bede06056ade7d75ab370d13a6b203d629"
diff --git a/recipes/lxde/menu-cache_0.2.2.bb b/recipes/lxde/menu-cache_0.2.2.bb
index b724971..7a49748 100644
--- a/recipes/lxde/menu-cache_0.2.2.bb
+++ b/recipes/lxde/menu-cache_0.2.2.bb
@@ -6,9 +6,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lxde/${PN}-${PV}.tar.gz"
 
 inherit autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "2ebce9f1217553112ac35abc35360050"
 SRC_URI[sha256sum] = "ee28209d7cdcb759338ef0061e2f7c6ec7a021369659790adeef2cd888b58696"
diff --git a/recipes/maemo/xpext_1.0-5.bb b/recipes/maemo/xpext_1.0-5.bb
index f28881c..cd9af2c 100644
--- a/recipes/maemo/xpext_1.0-5.bb
+++ b/recipes/maemo/xpext_1.0-5.bb
@@ -17,9 +17,5 @@ do_configure_prepend () {
   ./autogen.sh
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "1b0cb67b6f2bd7c4abef17648b062896"
 SRC_URI[sha256sum] = "a3b06f5188fd9effd0799ae31352b3cd65cb913b964e2c1a923ffa9d3c08abbe"
diff --git a/recipes/maemo/xsp_1.0.0-8.bb b/recipes/maemo/xsp_1.0.0-8.bb
index 45499a9..4432bf5 100644
--- a/recipes/maemo/xsp_1.0.0-8.bb
+++ b/recipes/maemo/xsp_1.0.0-8.bb
@@ -11,9 +11,5 @@ S = "${WORKDIR}/Xsp"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "2a0d8d02228d4cbd28b6e07bb7c17cf5"
 SRC_URI[sha256sum] = "8b722b952b64841d996c70c3278499886c81bb5012991beed5f66f4158418f59"
diff --git a/recipes/maemo4/hildon-control-panel_2.0.1.bb b/recipes/maemo4/hildon-control-panel_2.0.1.bb
index fe28aef..e84bf6f 100644
--- a/recipes/maemo4/hildon-control-panel_2.0.1.bb
+++ b/recipes/maemo4/hildon-control-panel_2.0.1.bb
@@ -8,10 +8,6 @@ inherit autotools pkgconfig
 
 FILES_${PN} += "${libdir}/dbus-1.0 ${datadir}/applications"
 
-do_stage() {
-	autotools_stage_all
-}
-
 # pkg-config file will get broken after pkgconfig.bbclass work
 # 
 # This code will fix it
diff --git a/recipes/maemo4/hildon-thumbnail.inc b/recipes/maemo4/hildon-thumbnail.inc
index 46468e1..0a77708 100644
--- a/recipes/maemo4/hildon-thumbnail.inc
+++ b/recipes/maemo4/hildon-thumbnail.inc
@@ -12,8 +12,3 @@ do_configure_prepend() {
 	touch gtk-doc.make
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
diff --git a/recipes/maemo4/libconic_0.13.bb b/recipes/maemo4/libconic_0.13.bb
index 4863fb9..207f601 100644
--- a/recipes/maemo4/libconic_0.13.bb
+++ b/recipes/maemo4/libconic_0.13.bb
@@ -8,11 +8,5 @@ SRC_URI = "http://repository.maemo.org/pool/maemo4.0/free/source/libc/${PN}/${PN
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "b4078390c459ae4df3acdabca36f53da"
 SRC_URI[sha256sum] = "1ee5bf796367d27987098f73dad866359e188cafe32f1871c12b4469f262c846"
diff --git a/recipes/maemo4/libhildon.inc b/recipes/maemo4/libhildon.inc
index 534603d..ac1e433 100644
--- a/recipes/maemo4/libhildon.inc
+++ b/recipes/maemo4/libhildon.inc
@@ -7,7 +7,3 @@ inherit autotools pkgconfig lib_package
 
 EXTRA_OECONF = "--with-maemo-gtk=no"
 
-do_stage() {
-        autotools_stage_all
-}
-
diff --git a/recipes/maemo4/libhildonhelp.inc b/recipes/maemo4/libhildonhelp.inc
index 6ce0f0a..15e1337 100644
--- a/recipes/maemo4/libhildonhelp.inc
+++ b/recipes/maemo4/libhildonhelp.inc
@@ -10,8 +10,3 @@ do_configure_prepend() {
 	sed -i s:-Werror::g configure.ac
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
diff --git a/recipes/maemo4/libhildonmime.inc b/recipes/maemo4/libhildonmime.inc
index 12c74a3..de6e6b8 100644
--- a/recipes/maemo4/libhildonmime.inc
+++ b/recipes/maemo4/libhildonmime.inc
@@ -10,8 +10,3 @@ do_configure_prepend() {
 	sed -i s:-Werror::g configure.in
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
diff --git a/recipes/maemo4/libosso-gsf_1.11.10.4.bb b/recipes/maemo4/libosso-gsf_1.11.10.4.bb
index 955613b..ac498ba 100644
--- a/recipes/maemo4/libosso-gsf_1.11.10.4.bb
+++ b/recipes/maemo4/libosso-gsf_1.11.10.4.bb
@@ -14,11 +14,5 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "4c5b31154943108ba0fecf00c8af9f3c"
 SRC_URI[sha256sum] = "687f46d5d5eb5ced18534f3cfcfdd82db6b25679437602f1519cae48d019b55d"
diff --git a/recipes/maemo4/libosso-help_2.1.2.bb b/recipes/maemo4/libosso-help_2.1.2.bb
index b089fd0..b7b6de5 100644
--- a/recipes/maemo4/libosso-help_2.1.2.bb
+++ b/recipes/maemo4/libosso-help_2.1.2.bb
@@ -17,11 +17,5 @@ do_configure_prepend() {
         sed -i -e s:AC_CONFIG_SRCDIR:#AC_CONFIG_SRCDIR:g configure.ac
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "fc5a1f4598670cec9ac40fb603f80570"
 SRC_URI[sha256sum] = "ecbff97da422f1498eae8f9b8a17389c0ccdd7eee1ca0259f035e712c8e0a405"
diff --git a/recipes/maemo4/libosso.inc b/recipes/maemo4/libosso.inc
index 7af653e..48b6298 100644
--- a/recipes/maemo4/libosso.inc
+++ b/recipes/maemo4/libosso.inc
@@ -12,8 +12,3 @@ do_configure_prepend() {
   sed -i s:-Werror::g configure.ac
 }
 
-do_stage() {
-  autotools_stage_all
-}
-
-
diff --git a/recipes/maemo4/osso-gwconnect.inc b/recipes/maemo4/osso-gwconnect.inc
index 8781b1e..a888eca 100644
--- a/recipes/maemo4/osso-gwconnect.inc
+++ b/recipes/maemo4/osso-gwconnect.inc
@@ -10,8 +10,3 @@ do_configure_prepend() {
 	sed -i s:-Werror::g configure.ac
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
diff --git a/recipes/maemo4/osso-ic-oss_1.0.4.bb b/recipes/maemo4/osso-ic-oss_1.0.4.bb
index 5bc7e94..5f07e22 100644
--- a/recipes/maemo4/osso-ic-oss_1.0.4.bb
+++ b/recipes/maemo4/osso-ic-oss_1.0.4.bb
@@ -18,11 +18,5 @@ do_configure_prepend() {
 
 PARALLEL_MAKE = ""
 
-do_stage() {
-        autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "6868cbd4dfc78abd7c651428d517e723"
 SRC_URI[sha256sum] = "16a0da4d947bd9c64379870646bf321853c7627d7894843a9e394182ae70315e"
diff --git a/recipes/mesa/freeglut_2.4.0.bb b/recipes/mesa/freeglut_2.4.0.bb
index 5f4b20a..aaf3e55 100644
--- a/recipes/mesa/freeglut_2.4.0.bb
+++ b/recipes/mesa/freeglut_2.4.0.bb
@@ -19,11 +19,5 @@ do_configure_append() {
 	done
 }
 
-
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "6d16873bd876fbf4980a927cfbc496a1"
 SRC_URI[sha256sum] = "269f2d50ba30b381622eb36f20b552ad43a1b43d544b9075e484e7146e81b052"
diff --git a/recipes/minisip/libmikey_svn.bb b/recipes/minisip/libmikey_svn.bb
index c51e466..5dd55b5 100644
--- a/recipes/minisip/libmikey_svn.bb
+++ b/recipes/minisip/libmikey_svn.bb
@@ -11,7 +11,3 @@ inherit autotools
 SRC_URI = "svn://svn.minisip.org/minisip/trunk;module=libmikey"
 S = "${WORKDIR}/libmikey"
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/minisip/libmnetutil_svn.bb b/recipes/minisip/libmnetutil_svn.bb
index a2a60ba..fd75b88 100644
--- a/recipes/minisip/libmnetutil_svn.bb
+++ b/recipes/minisip/libmnetutil_svn.bb
@@ -11,6 +11,3 @@ inherit autotools
 SRC_URI = "svn://svn.minisip.org/minisip/trunk;module=libmnetutil"
 S = "${WORKDIR}/libmnetutil"
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/minisip/libmsip_svn.bb b/recipes/minisip/libmsip_svn.bb
index 747cc49..004eaa7 100644
--- a/recipes/minisip/libmsip_svn.bb
+++ b/recipes/minisip/libmsip_svn.bb
@@ -11,6 +11,3 @@ inherit autotools
 SRC_URI = "svn://svn.minisip.org/minisip/trunk;module=libmsip"
 S = "${WORKDIR}/libmsip"
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/minisip/libmutil0_svn.bb b/recipes/minisip/libmutil0_svn.bb
index a7a20bd..5bbe4b2 100644
--- a/recipes/minisip/libmutil0_svn.bb
+++ b/recipes/minisip/libmutil0_svn.bb
@@ -11,6 +11,3 @@ inherit autotools lib_package
 SRC_URI = "svn://svn.minisip.org/minisip/trunk;module=libmutil"
 S = "${WORKDIR}/libmutil"
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/mml-widget/gtkmathview_0.7.6.bb b/recipes/mml-widget/gtkmathview_0.7.6.bb
index b5567d2..16b9373 100644
--- a/recipes/mml-widget/gtkmathview_0.7.6.bb
+++ b/recipes/mml-widget/gtkmathview_0.7.6.bb
@@ -12,10 +12,5 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "4bb348c98367228f0de0a2216a13d48f"
 SRC_URI[sha256sum] = "4b104ab94774ca429aa639a1a6f0adec1ca1443bfd444f2100c063e3cf70e6bb"
diff --git a/recipes/mpfr/mpfr_2.1.1.bb b/recipes/mpfr/mpfr_2.1.1.bb
index 6593c2e..6bbf148 100644
--- a/recipes/mpfr/mpfr_2.1.1.bb
+++ b/recipes/mpfr/mpfr_2.1.1.bb
@@ -6,9 +6,5 @@ PR = "r3"
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2"
 S = "${WORKDIR}/mpfr-${PV}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "843422d90349800ee721f6710d051c87"
 SRC_URI[sha256sum] = "df551fb075d5e6d0824b74d231962cf0e104c43f646e233675d952ef3c03debc"
diff --git a/recipes/mpfr/mpfr_2.3.1.bb b/recipes/mpfr/mpfr_2.3.1.bb
index fd64043..9e50b1b 100644
--- a/recipes/mpfr/mpfr_2.3.1.bb
+++ b/recipes/mpfr/mpfr_2.3.1.bb
@@ -9,9 +9,5 @@ SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2 \
 	  "
 S = "${WORKDIR}/mpfr-${PV}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "8352b619e04dcc73411a38b39dd855f6"
 SRC_URI[sha256sum] = "d857f9df4a6cf50d0bc57dd11296dd1a8d1ac709442875ea4fcd757a89da8430"
diff --git a/recipes/mpfr/mpfr_2.3.2.bb b/recipes/mpfr/mpfr_2.3.2.bb
index 0c6cc89..c879656 100644
--- a/recipes/mpfr/mpfr_2.3.2.bb
+++ b/recipes/mpfr/mpfr_2.3.2.bb
@@ -7,9 +7,5 @@ DEFAULT_PREFERENCE = "-1"
 SRC_URI = "http://www.mpfr.org/mpfr-${PV}/mpfr-${PV}.tar.bz2"
 S = "${WORKDIR}/mpfr-${PV}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "527147c097874340cb9cee0579dacf3b"
 SRC_URI[sha256sum] = "18e078c996e182b7ceab32f2ab840e6a151b593e0cd5b83cb9d2960f212fba4c"
diff --git a/recipes/mpfr/mpfr_svn.bb b/recipes/mpfr/mpfr_svn.bb
index f1e9273..97f2e5f 100644
--- a/recipes/mpfr/mpfr_svn.bb
+++ b/recipes/mpfr/mpfr_svn.bb
@@ -7,6 +7,3 @@ PR = "r3"
 SRC_URI = "svn://scm.gforge.inria.fr/svn/mpfr;module=trunk"
 S = "${WORKDIR}/trunk"
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/musicbrainz/libmusicbrainz.inc b/recipes/musicbrainz/libmusicbrainz.inc
index 1838d4e..a0c4cb9 100644
--- a/recipes/musicbrainz/libmusicbrainz.inc
+++ b/recipes/musicbrainz/libmusicbrainz.inc
@@ -12,7 +12,3 @@ inherit cmake pkgconfig
 # Fight a compiler/link bug that leaks too many c++ symbols
 TARGET_LDFLAGS += " -Wl,-rpath-link,${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/lib -ldl"
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/musicbrainz/libmusicbrainz_2.1.5.bb b/recipes/musicbrainz/libmusicbrainz_2.1.5.bb
index 9695c08..de0ba16 100644
--- a/recipes/musicbrainz/libmusicbrainz_2.1.5.bb
+++ b/recipes/musicbrainz/libmusicbrainz_2.1.5.bb
@@ -10,9 +10,5 @@ SRC_URI = "http://ftp.musicbrainz.org/pub/musicbrainz/libmusicbrainz-${PV}.tar.g
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "d5e19bb77edd6ea798ce206bd05ccc5f"
 SRC_URI[sha256sum] = "c6629c4bed428f9df3f89efc065b2d96f05eba36286532ebe8b8e404022371a0"
diff --git a/recipes/mythtv/gmyth-upnp_0.7.0.bb b/recipes/mythtv/gmyth-upnp_0.7.0.bb
index 04980ea..6fce816 100644
--- a/recipes/mythtv/gmyth-upnp_0.7.0.bb
+++ b/recipes/mythtv/gmyth-upnp_0.7.0.bb
@@ -25,10 +25,5 @@ do_install_append() {
 	mv ${D}/${bindir}/test ${D}/${bindir}/gmyth-upnp-test
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "29e58ea47e1548d70e4498cabca249a6"
 SRC_URI[sha256sum] = "f028ae7b331fdac9e5e70e4827fe1bcfa0274a9539e4224a9a49441776b2b517"
diff --git a/recipes/mythtv/gmyth_0.7.1.bb b/recipes/mythtv/gmyth_0.7.1.bb
index 9c8884a..bb0a41d 100644
--- a/recipes/mythtv/gmyth_0.7.1.bb
+++ b/recipes/mythtv/gmyth_0.7.1.bb
@@ -17,10 +17,5 @@ do_compile_append() {
                   gmyth.pc
 }
 
-do_stage() {
-	autotools_stage_all
-}	
-
-
 SRC_URI[md5sum] = "ab6b7525fd9c71cf5203f9e61abec0c3"
 SRC_URI[sha256sum] = "ce7cbf087b377f027516d90525bbea6130f70b42f176b2d17386b7247b290fdb"
diff --git a/recipes/nautilus/nautilus-cd-burner_2.24.0.bb b/recipes/nautilus/nautilus-cd-burner_2.24.0.bb
index eb78af1..7246d04 100644
--- a/recipes/nautilus/nautilus-cd-burner_2.24.0.bb
+++ b/recipes/nautilus/nautilus-cd-burner_2.24.0.bb
@@ -17,9 +17,5 @@ do_install_append() {
 	rm ${D}${libdir}/nautilus/extensions-*/*.la
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "eb211dd03d0518263fa4eadccc3caa88"
 SRC_URI[archive.sha256sum] = "d4ff952115a2fca28c613ce6a2b46740ce1000b0c213c482bcf3f127ceab99ad"
diff --git a/recipes/nautilus/nautilus_2.12.2.bb b/recipes/nautilus/nautilus_2.12.2.bb
index f03dde5..b28aff2 100644
--- a/recipes/nautilus/nautilus_2.12.2.bb
+++ b/recipes/nautilus/nautilus_2.12.2.bb
@@ -14,9 +14,5 @@ PACKAGES += "libnautilus"
 FILES_${PN} = "/usr/bin/* /usr/libexec/* /usr/lib/bonobo/* /usr/share/* /etc/*"
 FILES_libnautilus = "/usr/lib/*.so*"
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "1c1304e458eda551da11ed8c52b1faa2"
 SRC_URI[archive.sha256sum] = "9b1a11fde474d0bc0891afeef912aaa01bf8189e453bb555b2977f60f98d5455"
diff --git a/recipes/nautilus/nautilus_2.22.5.bb b/recipes/nautilus/nautilus_2.22.5.bb
index 7dd72ff..22cc03b 100644
--- a/recipes/nautilus/nautilus_2.22.5.bb
+++ b/recipes/nautilus/nautilus_2.22.5.bb
@@ -15,9 +15,5 @@ FILES_${PN} += "${datadir}/icons ${datadir}/mime /usr/libexec/ "
 FILES_libnautilus = "/usr/lib/*.so*"
 FILES_${PN}-dbg += "/usr/libexec/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "b2f65d5b01399a5d3daca5f3ba280f9b"
 SRC_URI[archive.sha256sum] = "14ddc03f05f6116c2d0545ef264f6dc5a9064ba321cba94547b02911fa5bd440"
diff --git a/recipes/nautilus/nautilus_2.24.1.bb b/recipes/nautilus/nautilus_2.24.1.bb
index bd4c67c..6e32cea 100644
--- a/recipes/nautilus/nautilus_2.24.1.bb
+++ b/recipes/nautilus/nautilus_2.24.1.bb
@@ -17,9 +17,5 @@ FILES_${PN} += "${datadir}/icons  /usr/libexec/ "
 FILES_libnautilus = "/usr/lib/*.so*"
 FILES_${PN}-dbg += "/usr/libexec/.debug"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "ccb5497397dfba46569b6dd1d2f41cef"
 SRC_URI[archive.sha256sum] = "48f1d25af102d216fdc2ebcd6396ffce963558c119b88730dc02fb1c158fcc4c"
diff --git a/recipes/nautilus/nautilus_2.24.2.bb b/recipes/nautilus/nautilus_2.24.2.bb
index 5bc36e0..efd58de 100644
--- a/recipes/nautilus/nautilus_2.24.2.bb
+++ b/recipes/nautilus/nautilus_2.24.2.bb
@@ -27,9 +27,5 @@ do_configure_append () {
 	find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "783e5f7be6391d6c46b4725e38af475a"
 SRC_URI[archive.sha256sum] = "a793ebe4245656f0ae23d5a87895555182f62943e02e9667303ad20c4e690c1d"
diff --git a/recipes/nautilus/nautilus_2.26.1.bb b/recipes/nautilus/nautilus_2.26.1.bb
index a573f7a..b5bf1e4 100644
--- a/recipes/nautilus/nautilus_2.26.1.bb
+++ b/recipes/nautilus/nautilus_2.26.1.bb
@@ -33,9 +33,5 @@ do_configure_append () {
 	find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "5d75f5de2806e9003e36a4613866b8d1"
 SRC_URI[archive.sha256sum] = "86c8839ad5c8a1c5674eb3617bbe15e9c9bb2358a7435a0e2d22cd25ab7718ff"
diff --git a/recipes/nautilus/nautilus_2.28.0.bb b/recipes/nautilus/nautilus_2.28.0.bb
index 126fa9b..d17fb86 100644
--- a/recipes/nautilus/nautilus_2.28.0.bb
+++ b/recipes/nautilus/nautilus_2.28.0.bb
@@ -33,9 +33,5 @@ do_configure_append () {
 	find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "14d9464043848eddd0bd0d35bbe63415"
 SRC_URI[archive.sha256sum] = "3761b27da474b71194ff900e7941c005be608a00fe0ba1f216390ce1ba9cba72"
diff --git a/recipes/nautilus/nautilus_2.28.1.bb b/recipes/nautilus/nautilus_2.28.1.bb
index f2f8f4e..23b8423 100644
--- a/recipes/nautilus/nautilus_2.28.1.bb
+++ b/recipes/nautilus/nautilus_2.28.1.bb
@@ -33,9 +33,5 @@ do_configure_append () {
 	find -name Makefile -exec sed -i '/\/usr\/bin\/orbit-idl-2/{s:/usr/bin:${STAGING_BINDIR_NATIVE}:;s:/usr/share:${STAGING_DATADIR}:g}' {} \;
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "e759af11a0844828e2b484ff42ee0498"
 SRC_URI[archive.sha256sum] = "197147d04529ee14e63609fa4755c9effff19842f77594ff8cce6e2433d0bec0"
diff --git a/recipes/neon/neon_0.25.5.bb b/recipes/neon/neon_0.25.5.bb
index 468cecf..e67132f 100644
--- a/recipes/neon/neon_0.25.5.bb
+++ b/recipes/neon/neon_0.25.5.bb
@@ -15,9 +15,5 @@ inherit autotools binconfig lib_package pkgconfig
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared --without-gssapi"
 EXTRA_AUTORECONF=" -I ${S}/macros "
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "b5fdb71dd407f0a3de0f267d27c9ab17"
 SRC_URI[sha256sum] = "b5513f88cb54c5f11e4c8348ee6c7ace9767b45c263c3a3ba8a5ce4e2b40a07a"
diff --git a/recipes/neon/neon_0.26.0.bb b/recipes/neon/neon_0.26.0.bb
index cc32746..f63124f 100644
--- a/recipes/neon/neon_0.26.0.bb
+++ b/recipes/neon/neon_0.26.0.bb
@@ -13,9 +13,5 @@ inherit autotools binconfig lib_package pkgconfig
 EXTRA_OECONF = "--with-ssl=gnutls --with-libxml2 --with-expat --enable-shared"
 EXTRA_AUTORECONF=" -I ${S}/macros "
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "076072f11c5278f4c4b7de189ea1506e"
 SRC_URI[sha256sum] = "76472e51576b42bfc129e487ae7dd3a5e1f1f380105b422fc14ee408e3a881df"
diff --git a/recipes/networkmanager/networkmanager-0.7.inc b/recipes/networkmanager/networkmanager-0.7.inc
index baa1155..6c0ccbe 100644
--- a/recipes/networkmanager/networkmanager-0.7.inc
+++ b/recipes/networkmanager/networkmanager-0.7.inc
@@ -21,10 +21,6 @@ EXTRA_OECONF = " \
 INITSCRIPT_NAME = "NetworkManager"
 INITSCRIPT_PARAMS = "defaults 28"
 
-do_stage () {
-	autotools_stage_all
-}
-
 # Work around dbus permission problems since we lack a proper at_console
 do_install_prepend() {
 		sed -i -e s:deny:allow:g ${S}/src/NetworkManager.conf
diff --git a/recipes/networkmanager/networkmanager-pre0.7.inc b/recipes/networkmanager/networkmanager-pre0.7.inc
index 73d8b7e..b767b17 100644
--- a/recipes/networkmanager/networkmanager-pre0.7.inc
+++ b/recipes/networkmanager/networkmanager-pre0.7.inc
@@ -24,10 +24,6 @@ EXTRA_OECONF = " \
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 do_install_append () {
         install -d ${D}/etc/default/volatiles
         install -m 0644 ${WORKDIR}/99_networkmanager ${D}/etc/default/volatiles
diff --git a/recipes/networkmanager/networkmanager.inc b/recipes/networkmanager/networkmanager.inc
index 82d016f..61333b1 100644
--- a/recipes/networkmanager/networkmanager.inc
+++ b/recipes/networkmanager/networkmanager.inc
@@ -23,10 +23,6 @@ EXTRA_OECONF = " \
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 do_install_append () {
         install -d ${D}/etc/default/volatiles
         install -m 0644 ${WORKDIR}/99_networkmanager ${D}/etc/default/volatiles
diff --git a/recipes/nxcl/libnxcl_0.9.bb b/recipes/nxcl/libnxcl_0.9.bb
index 2523685..7cb0ded 100644
--- a/recipes/nxcl/libnxcl_0.9.bb
+++ b/recipes/nxcl/libnxcl_0.9.bb
@@ -24,9 +24,5 @@ EXTRA_OECONF += "--without-nxcmd \
 
 inherit lib_package autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "777b3cda7a245e3870d4870a9460cb73"
 SRC_URI[sha256sum] = "dfc6c8dd89c26171411d8f7fa92613004eb8947ff509459151fdb03de7fe9608"
diff --git a/recipes/obexftp/obexftp_0.20.bb b/recipes/obexftp/obexftp_0.20.bb
index 040f800..c30a08a 100644
--- a/recipes/obexftp/obexftp_0.20.bb
+++ b/recipes/obexftp/obexftp_0.20.bb
@@ -16,10 +16,5 @@ EXTRA_OECONF += "--enable-bluetooth --disable-swig --disable-perl --disable-pyth
 
 PARALLEL_MAKE = ""
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "085b9edc0504c0d79e7479a54e2018c5"
 SRC_URI[sha256sum] = "7246fc75257afcd30ff16dc70185057157bcefc12fa9fba111b3b201577cc40e"
diff --git a/recipes/obexftp/obexftp_0.22.bb b/recipes/obexftp/obexftp_0.22.bb
index 69a9233..5cfac5f 100644
--- a/recipes/obexftp/obexftp_0.22.bb
+++ b/recipes/obexftp/obexftp_0.22.bb
@@ -24,10 +24,5 @@ PARALLEL_MAKE = ""
 
 LEAD_SONAME = "libobexftp.so"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "d167cfdea244e3a5f973a7b16864419c"
 SRC_URI[sha256sum] = "09687012d5e016277fa638f22b8c784aea6803056c70d14614e3b75158aae877"
diff --git a/recipes/octave/octave.inc b/recipes/octave/octave.inc
index 57c2c35..f7c2978 100644
--- a/recipes/octave/octave.inc
+++ b/recipes/octave/octave.inc
@@ -28,6 +28,3 @@ PACKAGES =+ "octave-m"
 # octave-m provides matlab routines in .m file format
 FILES_${PN}-m = "${datadir}/${PN}/*"
 
-do_stage() {
-        autotools_stage_all
-}
diff --git a/recipes/openal/openal_0.0.8.bb b/recipes/openal/openal_0.0.8.bb
index 839cf43..79da60e 100644
--- a/recipes/openal/openal_0.0.8.bb
+++ b/recipes/openal/openal_0.0.8.bb
@@ -13,10 +13,6 @@ do_configure_append () {
 	sed -i "s/@requirements@/alsa vorbis/" admin/pkgconfig/openal.pc
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libopenal"
 
 FILES_libopenal += "${libdir}/libopenal.so.*"
diff --git a/recipes/openbabel/openbabel_2.2.0.bb b/recipes/openbabel/openbabel_2.2.0.bb
index 33ad107..97fe3ad 100644
--- a/recipes/openbabel/openbabel_2.2.0.bb
+++ b/recipes/openbabel/openbabel_2.2.0.bb
@@ -8,10 +8,6 @@ inherit autotools
 
 EXTRA_OECONF = "  --disable-xmltest  "
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN}-dbg += "${libdir}/openbabel/*/.debug"
 FILES_${PN}-dev += "${libdir}/openbabel/*/*.la"
 
diff --git a/recipes/openchrome/openchrome.inc b/recipes/openchrome/openchrome.inc
index e88f322..7dc56c3 100644
--- a/recipes/openchrome/openchrome.inc
+++ b/recipes/openchrome/openchrome.inc
@@ -11,6 +11,3 @@ DEPENDS = "xserver-xorg libxvmc"
 
 inherit autotools xorg-module
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/opencv/opencv_1.0.0.bb b/recipes/opencv/opencv_1.0.0.bb
index 46ab29e..ab66737 100644
--- a/recipes/opencv/opencv_1.0.0.bb
+++ b/recipes/opencv/opencv_1.0.0.bb
@@ -63,10 +63,5 @@ DESCRIPTION_python-opencv = "Python bindings to opencv"
 FILES_python-opencv = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-opencv = "python-core"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "146a05005f2d2c16c4ee10ebd7f1dd58"
 SRC_URI[sha256sum] = "3a6ee888e4dd4ab7f2bc80d046688c099c6a95d1267af554b7c8f1543b66f21e"
diff --git a/recipes/openmax/gst-openmax_0.10.0.4.bb b/recipes/openmax/gst-openmax_0.10.0.4.bb
index 127c1bd..d3e1002 100644
--- a/recipes/openmax/gst-openmax_0.10.0.4.bb
+++ b/recipes/openmax/gst-openmax_0.10.0.4.bb
@@ -8,10 +8,6 @@ SRC_URI = "http://gstreamer.freedesktop.org/src/gst-openmax/pre/gst-openmax-${PV
 
 inherit autotools
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/gstreamer-0.10/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-0.10/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-0.10/*.*a"
diff --git a/recipes/openmax/libomxil-bellagio_0.9.0.bb b/recipes/openmax/libomxil-bellagio_0.9.0.bb
index 2614488..6181755 100644
--- a/recipes/openmax/libomxil-bellagio_0.9.0.bb
+++ b/recipes/openmax/libomxil-bellagio_0.9.0.bb
@@ -11,11 +11,6 @@ inherit autotools
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 FILES_${PN} += "${libdir}/bellagio/*.so ${libdir}/bellagio/*.la"
 FILES_${PN}-dev += "${libdir}/bellagio/*.a"
 FILES_${PN}-dbg += "${libdir}/bellagio/.debug"
diff --git a/recipes/openmoko-base/openmoko-libs_svn.bb b/recipes/openmoko-base/openmoko-libs_svn.bb
index b802dfd..42d6b8f 100644
--- a/recipes/openmoko-base/openmoko-libs_svn.bb
+++ b/recipes/openmoko-base/openmoko-libs_svn.bb
@@ -7,10 +7,6 @@ PR = "r0"
 
 inherit openmoko
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "\
   libmokojournal libmokojournal-dev libmokojournal-dbg \
   libmokogsmd libmokogsmd-dev libmokogsmd-dbg \
diff --git a/recipes/openmoko2/libmokogsmd2_svn.bb b/recipes/openmoko2/libmokogsmd2_svn.bb
index f25c9a0..3fa20e9 100644
--- a/recipes/openmoko2/libmokogsmd2_svn.bb
+++ b/recipes/openmoko2/libmokogsmd2_svn.bb
@@ -6,7 +6,3 @@ PR = "r2"
 
 inherit openmoko2
 
-do_stage() {
-        autotools_stage_all
-}
-
diff --git a/recipes/openmoko2/libmokojournal2_svn.bb b/recipes/openmoko2/libmokojournal2_svn.bb
index 91e0bda..ea56046 100644
--- a/recipes/openmoko2/libmokojournal2_svn.bb
+++ b/recipes/openmoko2/libmokojournal2_svn.bb
@@ -10,7 +10,3 @@ do_configure_prepend() {
         touch gtk-doc.make
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
diff --git a/recipes/openmoko2/libmokopanelui2_svn.bb b/recipes/openmoko2/libmokopanelui2_svn.bb
index 39ba690..2a3a1c5 100644
--- a/recipes/openmoko2/libmokopanelui2_svn.bb
+++ b/recipes/openmoko2/libmokopanelui2_svn.bb
@@ -6,6 +6,3 @@ PR = "r0"
 
 inherit openmoko2
 
-do_stage() {
-        autotools_stage_all
-}
diff --git a/recipes/openmoko2/libmokoui2_svn.bb b/recipes/openmoko2/libmokoui2_svn.bb
index 478f3f5..0b71da0 100644
--- a/recipes/openmoko2/libmokoui2_svn.bb
+++ b/recipes/openmoko2/libmokoui2_svn.bb
@@ -19,9 +19,6 @@ do_configure_prepend() {
         touch gtk-doc.make
 }
 
-do_stage() {
-        autotools_stage_all
-}
 FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/mokoui.*"
 FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/.debug/"
 FILES_${PN}-dev += "/usr/share/vala/vapi/"
diff --git a/recipes/openobex/openobex_1.3.bb b/recipes/openobex/openobex_1.3.bb
index af22687..c64c105 100644
--- a/recipes/openobex/openobex_1.3.bb
+++ b/recipes/openobex/openobex_1.3.bb
@@ -16,10 +16,6 @@ inherit autotools binconfig pkgconfig
 EXTRA_OECONF = "--enable-apps --enable-syslog --enable-dump \
                 --with-usb=${STAGING_LIBDIR}/.. --with-bluez=${STAGING_LIBDIR}/.."
 
-do_stage() {
-	autotools_stage_all
-}
-
 # how to stop shlibrename from renaming -apps?
 PACKAGES += "openobex-apps"
 FILES_${PN} = "${libdir}/lib*.so.*"
diff --git a/recipes/openrdate/openrdate_1.1.3.bb b/recipes/openrdate/openrdate_1.1.3.bb
index 46024fe..82b1369 100644
--- a/recipes/openrdate/openrdate_1.1.3.bb
+++ b/recipes/openrdate/openrdate_1.1.3.bb
@@ -9,9 +9,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/openrdate/openrdate-${PV}.tar.gz \
 
 inherit autotools
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "af4785f615b9d87b9c86a32af4ecc225"
 SRC_URI[sha256sum] = "0f8a034107fc7593f28e77b276f964c1309343b4702ecdf0d61bb3e57ad0cb5f"
diff --git a/recipes/opensync/libopensync_0.18.bb b/recipes/opensync/libopensync_0.18.bb
index 25b403e..45cf276 100644
--- a/recipes/opensync/libopensync_0.18.bb
+++ b/recipes/opensync/libopensync_0.18.bb
@@ -12,10 +12,5 @@ LEAD_SONAME = "libopensync.so"
 
 FILES_${PN} += " ${libdir}/opensync/formats/*.so"
 
-do_stage() {
-autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "ce94a69fb7ae7533d1f8828b6402cec8"
 SRC_URI[sha256sum] = "f9c803ba28d5deb18d9feb5c7818ce99325b09204b7dc0447798f2f47a657a46"
diff --git a/recipes/opensync/libopensync_0.20.bb b/recipes/opensync/libopensync_0.20.bb
index c1a1547..fe9571d 100644
--- a/recipes/opensync/libopensync_0.20.bb
+++ b/recipes/opensync/libopensync_0.20.bb
@@ -12,10 +12,5 @@ LEAD_SONAME = "libopensync.so"
 
 FILES_${PN} += " ${libdir}/opensync/formats/*.so"
 
-do_stage() {
-autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "c685e69929333a763c51987b4a19d50d"
 SRC_URI[sha256sum] = "5da9e72de291e7654fb59bf40b647633f3afb3cde924bd11b80d6ed26c911feb"
diff --git a/recipes/opensync/libopensync_0.22.bb b/recipes/opensync/libopensync_0.22.bb
index 04264fe..52d2e5d 100644
--- a/recipes/opensync/libopensync_0.22.bb
+++ b/recipes/opensync/libopensync_0.22.bb
@@ -15,10 +15,5 @@ FILES_${PN}-dbg += " ${libdir}/opensync/formats/.debug/*.so"
 
 require opensync-unpack.inc
 
-do_stage() {
-autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "f563ce2543312937a9afb4f8445ef932"
 SRC_URI[sha256sum] = "3394bae1e3bcfe463d139a367ba5ebe73d968df128c871842dcb4965a725d0dc"
diff --git a/recipes/opensync/libopensync_0.36.bb b/recipes/opensync/libopensync_0.36.bb
index d3be52e..3e44680 100644
--- a/recipes/opensync/libopensync_0.36.bb
+++ b/recipes/opensync/libopensync_0.36.bb
@@ -21,9 +21,5 @@ FILES_${PN} += " ${libdir}/opensync*/formats/*.so \
 FILES_${PN}-dbg += " ${libdir}/opensync*/formats/.debug/*.so \
 	             ${libdir}/opensync*/.debug/osplugin "
 
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "d8cc7835663566e3626e959d8fb531bf"
 SRC_URI[sha256sum] = "c686d27f0818e2d8cc6277ba123c74d7210e70fa2b320c5a828eaaedd598e908"
diff --git a/recipes/opensync/libopensync_svn.bb b/recipes/opensync/libopensync_svn.bb
index 67501cc..8139761 100644
--- a/recipes/opensync/libopensync_svn.bb
+++ b/recipes/opensync/libopensync_svn.bb
@@ -14,7 +14,3 @@ LEAD_SONAME = "libopensync.so"
 
 FILES_${PN} += " ${libdir}/opensync/formats/*.so"
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/opensync/libsyncml_0.4.6.bb b/recipes/opensync/libsyncml_0.4.6.bb
index 3a84256..dc313a4 100644
--- a/recipes/opensync/libsyncml_0.4.6.bb
+++ b/recipes/opensync/libsyncml_0.4.6.bb
@@ -8,10 +8,6 @@ SRC_URI = "http://libsyncml.opensync.org/download/releases/${PV}/libsyncml-${PV}
 
 inherit cmake pkgconfig
 
-do_stage() {
-        autotools_stage_all
-}
-
 PACKAGES += "${PN}-tools"
 
 FILES_${PN}-tools = "${bindir}"
diff --git a/recipes/opensync/libsyncml_svn.bb b/recipes/opensync/libsyncml_svn.bb
index 17b2537..b216e28 100644
--- a/recipes/opensync/libsyncml_svn.bb
+++ b/recipes/opensync/libsyncml_svn.bb
@@ -24,10 +24,6 @@ do_configure_append() {
 	sed -i s:-I/usr/include/:-I/foo/:g */*/Makefile
 }
 
-do_stage() {
-        autotools_stage_all
-}
-
 PACKAGES += "${PN}-tools"
 
 FILES_${PN}-tools = "${bindir}"
diff --git a/recipes/opensync/syncml-client_0.1.bb b/recipes/opensync/syncml-client_0.1.bb
index ac2f1e0..6b5a758 100644
--- a/recipes/opensync/syncml-client_0.1.bb
+++ b/recipes/opensync/syncml-client_0.1.bb
@@ -9,6 +9,3 @@ SRC_URI = "http://hem.bredband.net/miko22/${P}.tar.gz       \
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/opensync/wbxml2_0.9.2.bb b/recipes/opensync/wbxml2_0.9.2.bb
index 6d73c38..b28157e 100644
--- a/recipes/opensync/wbxml2_0.9.2.bb
+++ b/recipes/opensync/wbxml2_0.9.2.bb
@@ -16,10 +16,6 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/wbxmllib/${PN}-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES += "${PN}-tools"
 
 FILES_${PN}-tools = "${bindir}"
diff --git a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb b/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
index 4d49dff..cac02fd 100644
--- a/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
+++ b/recipes/opkg/opkg-nogpg-nocurl-slugos_svn.bb
@@ -29,9 +29,6 @@ PR = "${INC_PR}"
 EXTRA_OECONF += "--disable-gpg --enable-static --disable-shared"
 
 # Not sure this is needed; needs to be investigated and removed if not
-do_stage() {
-	autotools_stage_all
-}
 
 # The nogpg version isn't getting much love and has an unused variable which trips up -Werror
 do_configure_prepend() {
diff --git a/recipes/ortp/ortp.inc b/recipes/ortp/ortp.inc
index a086156..94be2f6 100644
--- a/recipes/ortp/ortp.inc
+++ b/recipes/ortp/ortp.inc
@@ -14,6 +14,3 @@ do_compile_append() {
 
 }
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/owfs/owfs_2.7p28.bb b/recipes/owfs/owfs_2.7p28.bb
index ca8b2f9..1941c27 100644
--- a/recipes/owfs/owfs_2.7p28.bb
+++ b/recipes/owfs/owfs_2.7p28.bb
@@ -26,9 +26,6 @@ do_install_prepend() {
         install -m 0755 ${WORKDIR}/owhttpd ${D}${sysconfdir}/init.d/owhttpd
         install -m 0755 ${WORKDIR}/owserver ${D}${sysconfdir}/init.d/owserver
 }
-do_stage() {
-        autotools_stage_all
-}
 
 PACKAGES =+ "owftpd owhttpd owserver owshell libowcapi libow libownet owmon owtap"
 
diff --git a/recipes/packagekit/packagekit_0.2.4.bb b/recipes/packagekit/packagekit_0.2.4.bb
index be9d4dc..429d22e 100644
--- a/recipes/packagekit/packagekit_0.2.4.bb
+++ b/recipes/packagekit/packagekit_0.2.4.bb
@@ -32,10 +32,6 @@ do_configure_prepend() {
         sed -i -e s:0\.1\.5:0\.1\.6:g configure.ac
 }
 
-do_stage () {
-        autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/packagekit-backend/*.so ${datadir}/dbus-1/system-services/"
 FILES_${PN}-dbg += "${libdir}/packagekit-backend/.debug/*.so "
 
diff --git a/recipes/pam/libpam_0.79.bb b/recipes/pam/libpam_0.79.bb
index 8cef0bc..57dc64b 100644
--- a/recipes/pam/libpam_0.79.bb
+++ b/recipes/pam/libpam_0.79.bb
@@ -54,10 +54,6 @@ LEAD_SONAME = "libpam.so.*"
 # This is crude - the modules maybe should each have independent ipks
 FILES_${PN} += "/usr/lib/security/pam_*.so /usr/lib/security/pam_filter/*"
 
-do_stage() {
-	autotools_stage_all
-}
-
 # An attempt to build on uclibc will fail, causing annoyance,
 # so force the package to be skipped here (this will cause a
 # 'nothing provides' error)
diff --git a/recipes/pam/libpam_1.0.2.bb b/recipes/pam/libpam_1.0.2.bb
index 08cb78f..d1bd2bd 100644
--- a/recipes/pam/libpam_1.0.2.bb
+++ b/recipes/pam/libpam_1.0.2.bb
@@ -69,9 +69,5 @@ python populate_packages_prepend () {
 	bb.data.setVar('PACKAGES', ' '.join(packages), d)
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "fc5e35645b75befae28c88b711b28ffb"
 SRC_URI[sha256sum] = "42d06febf4717dd43eb557027d1b00a484c22589793438778ed69449a073a3b8"
diff --git a/recipes/pango/pango.inc b/recipes/pango/pango.inc
index ad66c7d..bc59800 100644
--- a/recipes/pango/pango.inc
+++ b/recipes/pango/pango.inc
@@ -37,10 +37,6 @@ FILES_${PN} = "/etc ${bindir}/* ${libdir}/libpango*.so.*"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
-do_stage () {
-	autotools_stage_all
-}
-
 postinst_prologue() {
 if [ "x$D" != "x" ]; then
   exit 1
diff --git a/recipes/pango/pango_1.10.2.bb b/recipes/pango/pango_1.10.2.bb
index 34ca0ec..5ee2350 100644
--- a/recipes/pango/pango_1.10.2.bb
+++ b/recipes/pango/pango_1.10.2.bb
@@ -27,10 +27,6 @@ FILES_${PN} = "/etc ${bindir}/* ${libdir}/libpango*.so.*"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
-do_stage () {
-autotools_stage_all
-}
-
 postinst_prologue() {
 if [ "x$D" != "x" ]; then
   exit 1
diff --git a/recipes/pango/pango_1.14.8.bb b/recipes/pango/pango_1.14.8.bb
index be9e81d..afc8d9c 100644
--- a/recipes/pango/pango_1.14.8.bb
+++ b/recipes/pango/pango_1.14.8.bb
@@ -29,10 +29,6 @@ FILES_${PN} = "/etc ${bindir}/* ${libdir}/libpango*.so.*"
 FILES_${PN}-dbg += "${libdir}/pango/${LIBV}/modules/.debug"
 FILES_${PN}-dev += "${libdir}/pango/${LIBV}/modules/*.la"
 
-do_stage () {
-	autotools_stage_all
-}
-
 postinst_prologue() {
 if [ "x$D" != "x" ]; then
   exit 1
diff --git a/recipes/pango/pangomm_2.14.0.bb b/recipes/pango/pangomm_2.14.0.bb
index 8143ea1..f45679f 100644
--- a/recipes/pango/pangomm_2.14.0.bb
+++ b/recipes/pango/pangomm_2.14.0.bb
@@ -14,9 +14,5 @@ FILES_${PN}-dev += "${libdir}/*/include/"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "85be0a654ed521e5594f64efdb3fa7d8"
 SRC_URI[sha256sum] = "211a0092cfd50923eaad75c20630c0a1818e56605d4b6fbc10702d5a34ea7107"
diff --git a/recipes/pcsc-lite/pcsc-lite_1.4.102.bb b/recipes/pcsc-lite/pcsc-lite_1.4.102.bb
index 0f92a27..1215a2d 100644
--- a/recipes/pcsc-lite/pcsc-lite_1.4.102.bb
+++ b/recipes/pcsc-lite/pcsc-lite_1.4.102.bb
@@ -20,10 +20,6 @@ EXTRA_OECONF = " \
 	--enable-usbdropdir=${libdir}/pcsc/drivers \
 	"
 
-do_stage() {
-	autotools_stage_all
-}
-
 do_install() {
 	oe_runmake DESTDIR="${D}" install
 	install -d "${D}/etc/init.d"
diff --git a/recipes/policykit/policykit-gnome_0.9.2.bb b/recipes/policykit/policykit-gnome_0.9.2.bb
index 3d1c0e2..e75a453 100644
--- a/recipes/policykit/policykit-gnome_0.9.2.bb
+++ b/recipes/policykit/policykit-gnome_0.9.2.bb
@@ -13,10 +13,6 @@ S = "${WORKDIR}/PolicyKit-gnome-${PV}"
 
 inherit autotools pkgconfig
 
-do_stage() {
-        autotools_stage_all
-}
-
 FILES_${PN} += " ${datadir}/dbus-1 \
                  ${datadir}/PolicyKit \
                "
diff --git a/recipes/poppler/poppler.inc b/recipes/poppler/poppler.inc
index 0e9b61c..bf0a96a 100644
--- a/recipes/poppler/poppler.inc
+++ b/recipes/poppler/poppler.inc
@@ -18,10 +18,6 @@ EXTRA_OECONF = "\
 require poppler-fpu.inc
 EXTRA_OECONF += "${@get_poppler_fpu_setting(bb, d)}"
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libpoppler libpoppler-glib"
 FILES_libpoppler = "${libdir}/libpoppler.so.*"
 FILES_libpoppler-glib = "${libdir}/libpoppler-glib.so.*"
diff --git a/recipes/portaudio/portaudio-v19_svn.bb b/recipes/portaudio/portaudio-v19_svn.bb
index fb715b4..50efad4 100644
--- a/recipes/portaudio/portaudio-v19_svn.bb
+++ b/recipes/portaudio/portaudio-v19_svn.bb
@@ -22,9 +22,5 @@ paqa_errs  patest_dither        patest_longsine     patest_pink           patest
 
 # INCLUDEPATH = ../pa_common
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES += "portaudio-examples"
 FILES_portaudio-examples = "${bindir}"
diff --git a/recipes/proj4/proj-4.inc b/recipes/proj4/proj-4.inc
index da78a38..38abc84 100644
--- a/recipes/proj4/proj-4.inc
+++ b/recipes/proj4/proj-4.inc
@@ -12,7 +12,3 @@ S = "${WORKDIR}/proj-4.${PV}"
 
 FILES_${PN} += "${datadir}/proj"
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/pulseaudio/libcanberra_0.12.bb b/recipes/pulseaudio/libcanberra_0.12.bb
index 6ea9e71..2cc6beb 100644
--- a/recipes/pulseaudio/libcanberra_0.12.bb
+++ b/recipes/pulseaudio/libcanberra_0.12.bb
@@ -21,9 +21,5 @@ FILES_${PN}-dev += "${libdir}/*/*.a"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "01a1952e861defa6de9d193558f2a732"
 SRC_URI[sha256sum] = "04a70135de89ec7971a7ffa6516cf7699329cc01056595d524a6250a9d049709"
diff --git a/recipes/pulseaudio/pulseaudio.inc b/recipes/pulseaudio/pulseaudio.inc
index 4504656..76c0118 100644
--- a/recipes/pulseaudio/pulseaudio.inc
+++ b/recipes/pulseaudio/pulseaudio.inc
@@ -36,10 +36,6 @@ export TARGET_PFPU = "${TARGET_FPU}"
 OE_LT_RPATH_ALLOW = "any"
 OE_LT_RPATH_ALLOW[export]="1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 do_install_append() {
 	install -d ${D}${sysconfdir}/default/volatiles
 	install -m 0644 ${WORKDIR}/volatiles.04_pulse  ${D}${sysconfdir}/default/volatiles/04_pulse
diff --git a/recipes/python/python-gst_0.10.10.bb b/recipes/python/python-gst_0.10.10.bb
index d56c201..f875939 100644
--- a/recipes/python/python-gst_0.10.10.bb
+++ b/recipes/python/python-gst_0.10.10.bb
@@ -22,10 +22,6 @@ do_configure_prepend() {
     install -m 0644 ${S}/common/m4/*.m4 ${S}/m4/
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "${PN}-examples"
 
 FILES_${PN} += "${datadir}/gst-python"
diff --git a/recipes/python/python-gst_0.10.17.bb b/recipes/python/python-gst_0.10.17.bb
index 622da92..c3a33cd 100644
--- a/recipes/python/python-gst_0.10.17.bb
+++ b/recipes/python/python-gst_0.10.17.bb
@@ -26,10 +26,6 @@ do_configure_prepend() {
     install -m 0644 ${S}/common/m4/*.m4 ${S}/m4/
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "${PN}-examples"
 
 FILES_${PN} += "${datadir}/gst-python"
diff --git a/recipes/qof/qof_0.6.0.bb b/recipes/qof/qof_0.6.0.bb
index 3f96b66..12c6d9f 100644
--- a/recipes/qof/qof_0.6.0.bb
+++ b/recipes/qof/qof_0.6.0.bb
@@ -12,10 +12,6 @@ inherit autotools pkgconfig
 
 PARALLEL_MAKE = ""
 
-do_stage() {
-         autotools_stage_all
-}
-
 FILES_${PN} += "/usr/share/xml"
 
 
diff --git a/recipes/qof/qof_0.7.2.bb b/recipes/qof/qof_0.7.2.bb
index be1b718..4a5e3a0 100644
--- a/recipes/qof/qof_0.7.2.bb
+++ b/recipes/qof/qof_0.7.2.bb
@@ -13,10 +13,6 @@ EXTRA_OECONF = "--disable-error-on-warning"
 
 PARALLEL_MAKE = ""
 
-do_stage() {
-         autotools_stage_all
-}
-
 FILES_${PN} += "/usr/share/xml"
 
 
diff --git a/recipes/raw-tools/gtkimageview_1.3.0.bb b/recipes/raw-tools/gtkimageview_1.3.0.bb
index 2adf470..ba44fb7 100644
--- a/recipes/raw-tools/gtkimageview_1.3.0.bb
+++ b/recipes/raw-tools/gtkimageview_1.3.0.bb
@@ -12,11 +12,5 @@ do_configure() {
        oe_runconf
 }
 
-do_stage() {
-       autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "574789e014988398dca2debc65c02097"
 SRC_URI[sha256sum] = "6a2f50c1a6e83c94618a271cc9b7ce0460fd1fe58adb12e05d0b1b07b43e4beb"
diff --git a/recipes/rrdtool/rrdtool_1.0.49.bb b/recipes/rrdtool/rrdtool_1.0.49.bb
index 44a5545..a4a62ef 100644
--- a/recipes/rrdtool/rrdtool_1.0.49.bb
+++ b/recipes/rrdtool/rrdtool_1.0.49.bb
@@ -24,10 +24,6 @@ do_install_append() {
 	mv ${D}/usr/contrib ${D}${docdir}/rrdtool/
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/perl/auto/RRDs/RRDs.bs ${libdir}/perl/auto/RRDs/RRDs.so ${libdir}/perl/RRDs.pm ${libdir}/perl/RRDp.pm"
 
 
diff --git a/recipes/scw/scw_0.4.3.bb b/recipes/scw/scw_0.4.3.bb
index 4784d58..36e5357 100644
--- a/recipes/scw/scw_0.4.3.bb
+++ b/recipes/scw/scw_0.4.3.bb
@@ -7,9 +7,5 @@ SRC_URI = "${DEBIAN_MIRROR}/main/s/${PN}/${PN}_${PV}.orig.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "4c9fb66fa496cf32542e92f32f821818"
 SRC_URI[sha256sum] = "fca3763b05f064728c9ff248fa0766808d1ceae561b88ad202811924e4ccdb45"
diff --git a/recipes/sdlpango/sdlpango_0.1.2.bb b/recipes/sdlpango/sdlpango_0.1.2.bb
index 6613993..36e6f47 100644
--- a/recipes/sdlpango/sdlpango_0.1.2.bb
+++ b/recipes/sdlpango/sdlpango_0.1.2.bb
@@ -13,9 +13,5 @@ inherit autotools
 
 S = "${WORKDIR}/SDL_Pango-${PV}"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "85bbf9bb7b1cee0538154dadd045418c"
 SRC_URI[sha256sum] = "7f75d3b97acf707c696ea126424906204ebfa07660162de925173cdd0257eba4"
diff --git a/recipes/sofia-sip/sofia-sip.inc b/recipes/sofia-sip/sofia-sip.inc
index 05c559b..61137d7 100644
--- a/recipes/sofia-sip/sofia-sip.inc
+++ b/recipes/sofia-sip/sofia-sip.inc
@@ -16,6 +16,3 @@ FILES_${PN}-glib = "${libdir}/libsofia-sip-ua-glib.so.*"
 
 LEAD_SONAME = "libsofia-sip-ua.so"
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/spandsp/spandsp.inc b/recipes/spandsp/spandsp.inc
index ed5fe3b..82b4927 100644
--- a/recipes/spandsp/spandsp.inc
+++ b/recipes/spandsp/spandsp.inc
@@ -6,8 +6,4 @@ DEPENDS = "tiff libxml2"
 
 inherit autotools
 
-do_stage () {
-    autotools_stage_all
-}
-
 PARALLEL_MAKE = ""
diff --git a/recipes/speex/speex_1.2.bb b/recipes/speex/speex_1.2.bb
index 94e10fc..f498731 100644
--- a/recipes/speex/speex_1.2.bb
+++ b/recipes/speex/speex_1.2.bb
@@ -39,10 +39,6 @@ do_configure_append() {
 	find . -name "Makefile" -exec sed -i s,-I/usr/include,, {} \;
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "${PN}-utils ${PN}-dsp"
 FILES_${PN}-utils = "${bindir}/speex*"
 FILES_${PN}-dsp = "${libdir}/libspeexdsp.so.*"
diff --git a/recipes/sphinx-speech/sphinxbase_0.1.bb b/recipes/sphinx-speech/sphinxbase_0.1.bb
index 73142aa..3b0abc7 100644
--- a/recipes/sphinx-speech/sphinxbase_0.1.bb
+++ b/recipes/sphinx-speech/sphinxbase_0.1.bb
@@ -9,9 +9,5 @@ inherit autotools
 require sphinx-fpu.inc
 EXTRA_OECONF += "${@get_sphinx_fpu_setting(bb, d)}"
 
-do_stage () {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "5ff76b3a4799405ad91e88331eb938bb"
 SRC_URI[sha256sum] = "ffb5e646d98c058ad2f1f0d7738b39e29fbe432981b1b5d9c8a79cdcb168c3c6"
diff --git a/recipes/sphinx-speech/sphinxbase_0.3.bb b/recipes/sphinx-speech/sphinxbase_0.3.bb
index 2d9e67a..c48009e 100644
--- a/recipes/sphinx-speech/sphinxbase_0.3.bb
+++ b/recipes/sphinx-speech/sphinxbase_0.3.bb
@@ -9,9 +9,5 @@ inherit autotools
 require sphinx-fpu.inc
 EXTRA_OECONF += "${@get_sphinx_fpu_setting(bb, d)}"
 
-do_stage () {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "17610af80be230e5760dbb25690a45f0"
 SRC_URI[sha256sum] = "b5817b8629f89e16ba88e1c62dce0321978f3aea038aa77cb61a1ff7fa3e0dbb"
diff --git a/recipes/startup-notification/startup-notification_0.5.bb b/recipes/startup-notification/startup-notification_0.5.bb
index d8898b0..4079105 100644
--- a/recipes/startup-notification/startup-notification_0.5.bb
+++ b/recipes/startup-notification/startup-notification_0.5.bb
@@ -8,10 +8,6 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/startup-notification-${PV}.tar.gz"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "c7a96f4615b07ed847061b0a9a0be989"
 SRC_URI[sha256sum] = "7d2f388f7b50fc5c929ef173c2df900c588329ab07c16184dee3745a26ac54ae"
 #CHECKSUMS.INI MISMATCH: I've got this instead:
diff --git a/recipes/startup-notification/startup-notification_0.8.bb b/recipes/startup-notification/startup-notification_0.8.bb
index 6db4981..529929c 100644
--- a/recipes/startup-notification/startup-notification_0.8.bb
+++ b/recipes/startup-notification/startup-notification_0.8.bb
@@ -8,9 +8,5 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/startup-notification-0.8.tar.gz"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "9bba52ffe8c096cfeeaf7a1dcd9b943d"
 SRC_URI[sha256sum] = "7b5d0458b7831ed96633fca771e5707bfd2d3c1c91a8442c6f412e6fa98025bf"
diff --git a/recipes/startup-notification/startup-notification_0.9.bb b/recipes/startup-notification/startup-notification_0.9.bb
index 9ef4e15..d9a57ba 100644
--- a/recipes/startup-notification/startup-notification_0.9.bb
+++ b/recipes/startup-notification/startup-notification_0.9.bb
@@ -8,9 +8,5 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://www.freedesktop.org/software/startup-notification/releases/startup-notification-${PV}.tar.gz"
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "5480d3af709523ec70e0e04692744f2d"
 SRC_URI[sha256sum] = "c2fa09f9a49d8b319e79638e49e967c682df8726006e03059b1ffca5ab82099c"
diff --git a/recipes/subversion/subversion_1.4.3.bb b/recipes/subversion/subversion_1.4.3.bb
index 72c75f5..075d894 100644
--- a/recipes/subversion/subversion_1.4.3.bb
+++ b/recipes/subversion/subversion_1.4.3.bb
@@ -28,9 +28,5 @@ do_configure() {
 	oe_runconf
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "de0e792c9804c7bce397d267af5eb30d"
 SRC_URI[sha256sum] = "8260a2d3a67c5cebc100e7662f81679582c0f05a2a28260e235bdf051e72aee3"
diff --git a/recipes/subversion/subversion_1.6.5.bb b/recipes/subversion/subversion_1.6.5.bb
index fab2622..51ec724 100644
--- a/recipes/subversion/subversion_1.6.5.bb
+++ b/recipes/subversion/subversion_1.6.5.bb
@@ -24,9 +24,5 @@ do_configure_append() {
 	if ! test -f libtool ; then cp -a *-libtool libtool ; fi
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "1a53a0e72bee0bf814f4da83a9b6a636"
 SRC_URI[sha256sum] = "64331bda459e984b8d369b449eec89daa2f3cd288186f1d2a9ad8011badd4dad"
diff --git a/recipes/sugar/sugar-artwork_0.82.0.bb b/recipes/sugar/sugar-artwork_0.82.0.bb
index 0f5a229..7baea59 100644
--- a/recipes/sugar/sugar-artwork_0.82.0.bb
+++ b/recipes/sugar/sugar-artwork_0.82.0.bb
@@ -23,10 +23,5 @@ FILES_${PN}-dbg += "${libdir}/gtk-2.0/2.*/engines/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "3d271bf9f0d412afb9a5618ba5496fb8"
 SRC_URI[sha256sum] = "dbe36fa758a49dd8526885e2025b51d6e1e6e32458168e420c955b633ee3b100"
diff --git a/recipes/sugar/sugar-artwork_0.84.1.bb b/recipes/sugar/sugar-artwork_0.84.1.bb
index 41935d6..a60c650 100644
--- a/recipes/sugar/sugar-artwork_0.84.1.bb
+++ b/recipes/sugar/sugar-artwork_0.84.1.bb
@@ -25,10 +25,5 @@ FILES_${PN}-dbg += "${libdir}/gtk-2.0/2.*/engines/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "d28b847a24aa23a1b6949aa6a7873560"
 SRC_URI[sha256sum] = "2dc71acc88da545e6a217fd4749dc39a9d59e9f2f768bd67ea201999e55f302a"
diff --git a/recipes/sugar/sugar-base_0.82.2.bb b/recipes/sugar/sugar-base_0.82.2.bb
index f2c7bd7..76d2798 100644
--- a/recipes/sugar/sugar-base_0.82.2.bb
+++ b/recipes/sugar/sugar-base_0.82.2.bb
@@ -49,10 +49,5 @@ FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/sugar/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "c5790a18fd9ee86a49ffa727505294f5"
 SRC_URI[sha256sum] = "430b27a0510a50fb66ee211e35565be7e1e522bcde7d1adde5c63a1d18ad7f1d"
diff --git a/recipes/sugar/sugar-base_0.83.2.bb b/recipes/sugar/sugar-base_0.83.2.bb
index 31f93f2..ea225da 100644
--- a/recipes/sugar/sugar-base_0.83.2.bb
+++ b/recipes/sugar/sugar-base_0.83.2.bb
@@ -49,10 +49,5 @@ FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/sugar/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "0f05d95eaf0f8e3174a3b3e3b0afe995"
 SRC_URI[sha256sum] = "64ece8bb8e6eddb4c7b8b4ce0aa30f07f00a86ed7b113a7957661e73616a8dc3"
diff --git a/recipes/sugar/sugar-base_0.84.1.bb b/recipes/sugar/sugar-base_0.84.1.bb
index b144d4b..e4d0131 100644
--- a/recipes/sugar/sugar-base_0.84.1.bb
+++ b/recipes/sugar/sugar-base_0.84.1.bb
@@ -53,10 +53,5 @@ FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/sugar/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "0ef47ff5a8931e0e7c732d22a514d297"
 SRC_URI[sha256sum] = "e67eab2d058a3410d8fe82a2161d0c268b6445648c5901a8bd2c26690c45addd"
diff --git a/recipes/sugar/sugar-datastore_0.82.0.bb b/recipes/sugar/sugar-datastore_0.82.0.bb
index 887eb75..d96c4db 100644
--- a/recipes/sugar/sugar-datastore_0.82.0.bb
+++ b/recipes/sugar/sugar-datastore_0.82.0.bb
@@ -12,11 +12,6 @@ inherit autotools distutils-base
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 FILES_${PN} += "${datadir}/dbus-1"
 
 SRC_URI[md5sum] = "7a6bbb387c1f7cd3ddd6663869df3b88"
diff --git a/recipes/sugar/sugar-datastore_0.84.0.bb b/recipes/sugar/sugar-datastore_0.84.0.bb
index e02ab0a..005d3a9 100644
--- a/recipes/sugar/sugar-datastore_0.84.0.bb
+++ b/recipes/sugar/sugar-datastore_0.84.0.bb
@@ -12,11 +12,6 @@ inherit autotools
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 FILES_${PN} += "${datadir}/dbus-1"
 
 
diff --git a/recipes/sugar/sugar-presence-service_0.82.2.bb b/recipes/sugar/sugar-presence-service_0.82.2.bb
index 0e2abf7..0a74f55 100644
--- a/recipes/sugar/sugar-presence-service_0.82.2.bb
+++ b/recipes/sugar/sugar-presence-service_0.82.2.bb
@@ -25,10 +25,5 @@ FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "0b50a2467e4e9eedd22f51bf2fe6e6f3"
 SRC_URI[sha256sum] = "3b33c9689fb9faaeaf4308cd66794b02951249253ac96df99bd308c4b6d38850"
diff --git a/recipes/sugar/sugar-presence-service_0.84.0.bb b/recipes/sugar/sugar-presence-service_0.84.0.bb
index d7c581f..086a02a 100644
--- a/recipes/sugar/sugar-presence-service_0.84.0.bb
+++ b/recipes/sugar/sugar-presence-service_0.84.0.bb
@@ -26,10 +26,5 @@ FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug"
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "bf292605b6c2d0ef3761a957acc8a95e"
 SRC_URI[sha256sum] = "15afba51ef2c34b86ae2c4b8ecfe612e37a7024ae9ccf42a3b612d70e3034d48"
diff --git a/recipes/sugar/sugar-toolkit_0.82.11.bb b/recipes/sugar/sugar-toolkit_0.82.11.bb
index a425a69..ba89ed6 100644
--- a/recipes/sugar/sugar-toolkit_0.82.11.bb
+++ b/recipes/sugar/sugar-toolkit_0.82.11.bb
@@ -16,10 +16,5 @@ do_configure_prepend() {
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "c3a2c45d6444efcd3fa59c50198f9483"
 SRC_URI[sha256sum] = "a0fae53f396c6223365c28c8cda0538f2cb20c660bffd9cfcc37ee00b57c2a7b"
diff --git a/recipes/sugar/sugar-toolkit_0.83.3.bb b/recipes/sugar/sugar-toolkit_0.83.3.bb
index f2e29d9..b2a7ec4 100644
--- a/recipes/sugar/sugar-toolkit_0.83.3.bb
+++ b/recipes/sugar/sugar-toolkit_0.83.3.bb
@@ -16,10 +16,5 @@ do_configure_prepend() {
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "f6882ee56ed327c6680738133e911bf3"
 SRC_URI[sha256sum] = "243a9d699af072b4cb79334b62638463d9f39437e7a886a14a95b7a8250983bd"
diff --git a/recipes/sugar/sugar-toolkit_0.84.4.bb b/recipes/sugar/sugar-toolkit_0.84.4.bb
index 839f260..3a51398 100644
--- a/recipes/sugar/sugar-toolkit_0.84.4.bb
+++ b/recipes/sugar/sugar-toolkit_0.84.4.bb
@@ -18,10 +18,5 @@ do_configure_prepend() {
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "5ad76015d382ec4125c2ef01022dc898"
 SRC_URI[sha256sum] = "bc489eb0feacfd68cd29f1556e2d1c4b4eb8f01c9add7ceb878b605521eb9f92"
diff --git a/recipes/sugar/sugar_0.82.9.bb b/recipes/sugar/sugar_0.82.9.bb
index 693fd39..b9e02dc 100644
--- a/recipes/sugar/sugar_0.82.9.bb
+++ b/recipes/sugar/sugar_0.82.9.bb
@@ -22,10 +22,5 @@ FILES_${PN} += "${datadir}/${PN} \
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "71af6b9632f441259e7ea5608db2ae5f"
 SRC_URI[sha256sum] = "2172bfed8fdeab4279dad7712390fd98ae0a993c42c2c4eec98cf3d30d1a11aa"
diff --git a/recipes/sugar/sugar_0.83.4.bb b/recipes/sugar/sugar_0.83.4.bb
index 6566d74..53a21b6 100644
--- a/recipes/sugar/sugar_0.83.4.bb
+++ b/recipes/sugar/sugar_0.83.4.bb
@@ -21,10 +21,5 @@ FILES_${PN} += "${datadir}/${PN} \
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "6b981c63bb5d8b23b43831ece79884e6"
 SRC_URI[sha256sum] = "254ac13ceeba17749ff6416b33fd038f8db7aaf6fab2e0a9d2303dd07314b186"
diff --git a/recipes/sugar/sugar_0.84.6.bb b/recipes/sugar/sugar_0.84.6.bb
index 00b0224..4e33545 100644
--- a/recipes/sugar/sugar_0.84.6.bb
+++ b/recipes/sugar/sugar_0.84.6.bb
@@ -21,10 +21,5 @@ FILES_${PN} += "${datadir}/${PN} \
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-        autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "1747f7f35519b273e6c27bbcd8513d4b"
 SRC_URI[sha256sum] = "f5db9c1caf5cd57abfccb12ab1f5ba508cbf0f90ec9bad03de3fb38063775b83"
diff --git a/recipes/swfdec/swfdec-mozilla_0.7.2.bb b/recipes/swfdec/swfdec-mozilla_0.7.2.bb
index 86a812a..0f453aa 100644
--- a/recipes/swfdec/swfdec-mozilla_0.7.2.bb
+++ b/recipes/swfdec/swfdec-mozilla_0.7.2.bb
@@ -12,10 +12,6 @@ SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/${P}.tar.gz
 
 inherit autotools pkgconfig 
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/mozilla/plugins/*.so"
 FILES_${PN}-dev += "${libdir}/mozilla/plugins/*a"
 FILES_${PN}-dbg += "${libdir}/mozilla/plugins/.debug"
diff --git a/recipes/swfdec/swfdec-mozilla_0.7.4.bb b/recipes/swfdec/swfdec-mozilla_0.7.4.bb
index 2184ba2..4eb3ebb 100644
--- a/recipes/swfdec/swfdec-mozilla_0.7.4.bb
+++ b/recipes/swfdec/swfdec-mozilla_0.7.4.bb
@@ -12,10 +12,6 @@ SRC_URI = "http://swfdec.freedesktop.org/download/swfdec-mozilla/0.7/${P}.tar.gz
 
 inherit autotools pkgconfig 
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/mozilla/plugins/*.so"
 FILES_${PN}-dev += "${libdir}/mozilla/plugins/*a"
 FILES_${PN}-dbg += "${libdir}/mozilla/plugins/.debug"
diff --git a/recipes/swfdec/swfdec-mozilla_0.8.2.bb b/recipes/swfdec/swfdec-mozilla_0.8.2.bb
index f649738..5710b93 100644
--- a/recipes/swfdec/swfdec-mozilla_0.8.2.bb
+++ b/recipes/swfdec/swfdec-mozilla_0.8.2.bb
@@ -16,10 +16,6 @@ do_install_append() {
 	rm ${D}${libdir}/mozilla/plugins/*.la
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/mozilla/plugins/*.so"
 FILES_${PN}-dbg += "${libdir}/mozilla/plugins/.debug"
 
diff --git a/recipes/swfdec/swfdec-mozilla_0.9.2.bb b/recipes/swfdec/swfdec-mozilla_0.9.2.bb
index d68cd1e..c388023 100644
--- a/recipes/swfdec/swfdec-mozilla_0.9.2.bb
+++ b/recipes/swfdec/swfdec-mozilla_0.9.2.bb
@@ -15,10 +15,6 @@ do_install_append() {
 	rm ${D}${libdir}/mozilla/plugins/*.la
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/mozilla/plugins/*.so"
 FILES_${PN}-dbg += "${libdir}/mozilla/plugins/.debug"
 
diff --git a/recipes/swfdec/swfdec_0.7.2.bb b/recipes/swfdec/swfdec_0.7.2.bb
index e5769fa..3fcfa2f 100644
--- a/recipes/swfdec/swfdec_0.7.2.bb
+++ b/recipes/swfdec/swfdec_0.7.2.bb
@@ -15,10 +15,6 @@ do_install_append() {
 	install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libswfdecgtk libswfdec"
 
 FILES_${PN} += "${datadir}/icons"
diff --git a/recipes/swfdec/swfdec_0.7.4.bb b/recipes/swfdec/swfdec_0.7.4.bb
index 50c06d5..874bb11 100644
--- a/recipes/swfdec/swfdec_0.7.4.bb
+++ b/recipes/swfdec/swfdec_0.7.4.bb
@@ -13,10 +13,6 @@ do_install_append() {
 	install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libswfdecgtk libswfdec"
 
 FILES_${PN} += "${datadir}/icons"
diff --git a/recipes/swfdec/swfdec_0.8.2.bb b/recipes/swfdec/swfdec_0.8.2.bb
index 7c9bd69..9c65dba 100644
--- a/recipes/swfdec/swfdec_0.8.2.bb
+++ b/recipes/swfdec/swfdec_0.8.2.bb
@@ -15,10 +15,6 @@ do_install_append() {
 	install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libswfdecgtk libswfdec"
 FILES_libswfdec = "${libdir}/libswfdec-0.8.so.*"
 FILES_libswfdecgtk = "${libdir}/libswfdec-gtk-0.8.so.*"
diff --git a/recipes/swfdec/swfdec_0.9.2.bb b/recipes/swfdec/swfdec_0.9.2.bb
index eb8e77a..65bfa41 100644
--- a/recipes/swfdec/swfdec_0.9.2.bb
+++ b/recipes/swfdec/swfdec_0.9.2.bb
@@ -15,10 +15,6 @@ do_install_append() {
 	install -m 0755 ${S}/player/.libs/swfplay ${D}/${bindir}
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libswfdecgtk libswfdec"
 
 FILES_libswfdec = "${libdir}/libswfdec-0.9.so.*"
diff --git a/recipes/taglib/taglib_1.4.bb b/recipes/taglib/taglib_1.4.bb
index c398dda..2e40a29 100644
--- a/recipes/taglib/taglib_1.4.bb
+++ b/recipes/taglib/taglib_1.4.bb
@@ -15,10 +15,6 @@ do_postpatch() {
 }
 addtask postpatch after do_patch before do_configure
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "${PN}-c"
 FILES_${PN}-dbg += "${bindir}/taglib-config"
 FILES_${PN}-c = "${libdir}/libtag_c.so.*"
diff --git a/recipes/tapioca/libjingle-tapioca_0.3.10.bb b/recipes/tapioca/libjingle-tapioca_0.3.10.bb
index 6974aef..a4a158f 100644
--- a/recipes/tapioca/libjingle-tapioca_0.3.10.bb
+++ b/recipes/tapioca/libjingle-tapioca_0.3.10.bb
@@ -9,9 +9,5 @@ S = "${WORKDIR}/libjingle-${PV}"
 
 inherit autotools pkgconfig
 
-do_stage () {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "7ee7d8c834f1e06093130a86cbb9e79a"
 SRC_URI[sha256sum] = "3453c1426fdc06b32bc5f4e7d3ce039ec7f38f0fa4018d505e515099b209dd25"
diff --git a/recipes/tapioca/tapioca-xmpp_0.3.9.bb b/recipes/tapioca/tapioca-xmpp_0.3.9.bb
index 04e4f09..860ebd0 100644
--- a/recipes/tapioca/tapioca-xmpp_0.3.9.bb
+++ b/recipes/tapioca/tapioca-xmpp_0.3.9.bb
@@ -7,9 +7,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tapioca-voip/${P}.tar.gz"
 
 FILES_${PN} += "${datadir}/dbus* ${datadir}/tapioca* "
 
-do_stage () {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "8d810351eb5b30e70b202e067da450c1"
 SRC_URI[sha256sum] = "51dd2ecda515e5872971cf80216915492686f5a5c9745e12ba1b3c5aec826fce"
diff --git a/recipes/telepathy/libtelepathy_0.0.53.bb b/recipes/telepathy/libtelepathy_0.0.53.bb
index da7a108..010ed49 100644
--- a/recipes/telepathy/libtelepathy_0.0.53.bb
+++ b/recipes/telepathy/libtelepathy_0.0.53.bb
@@ -10,9 +10,5 @@ inherit autotools pkgconfig
 FILES_${PN} += "${datadir}/telepathy \
 		${datadir}/dbus-1"
 
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "015611ff5cbd3b3718fcb49adc47bd13"
 SRC_URI[sha256sum] = "dfc90b2c92bc313c67d80611945823799581b5b4eb5758d6d77846d4e22666de"
diff --git a/recipes/telepathy/libtelepathy_0.2.0.bb b/recipes/telepathy/libtelepathy_0.2.0.bb
index cd221b1..335c97f 100644
--- a/recipes/telepathy/libtelepathy_0.2.0.bb
+++ b/recipes/telepathy/libtelepathy_0.2.0.bb
@@ -10,9 +10,5 @@ inherit autotools pkgconfig
 FILES_${PN} += "${datadir}/telepathy \
 		${datadir}/dbus-1"
 
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "a2083338ed480fd507925e00a93fd96b"
 SRC_URI[sha256sum] = "c33ef2820ea954aa2aa6d048f4540aa75f09cfc4c7915558d736dcedc1b8fa07"
diff --git a/recipes/telepathy/libtelepathy_0.3.3.bb b/recipes/telepathy/libtelepathy_0.3.3.bb
index 25567cf..732889d 100644
--- a/recipes/telepathy/libtelepathy_0.3.3.bb
+++ b/recipes/telepathy/libtelepathy_0.3.3.bb
@@ -12,9 +12,5 @@ inherit autotools pkgconfig
 FILES_${PN} += "${datadir}/telepathy \
 		${datadir}/dbus-1"
 
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "490ca1a0c614d4466394b72d43bf7370"
 SRC_URI[sha256sum] = "e0d230be855125163579743418203c6f6be2f10f98c4f065735c1dc9ed115878"
diff --git a/recipes/telepathy/telepathy-mission-control_4.21.bb b/recipes/telepathy/telepathy-mission-control_4.21.bb
index 98a7470..823039b 100644
--- a/recipes/telepathy/telepathy-mission-control_4.21.bb
+++ b/recipes/telepathy/telepathy-mission-control_4.21.bb
@@ -37,9 +37,5 @@ FILES_libmissioncontrol-dbg += "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg += "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg += "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "2ad61079a79b0426c81593ad69f56ada"
 SRC_URI[sha256sum] = "0b98c93fc64409aae43d8f2941784f8f11639ad68b67320417554fa471a86508"
diff --git a/recipes/telepathy/telepathy-mission-control_4.22.bb b/recipes/telepathy/telepathy-mission-control_4.22.bb
index 34aa7bf..6323bd2 100644
--- a/recipes/telepathy/telepathy-mission-control_4.22.bb
+++ b/recipes/telepathy/telepathy-mission-control_4.22.bb
@@ -37,9 +37,5 @@ FILES_libmissioncontrol-dbg += "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg += "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg += "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "aa8a8264c596c666f886f85356b56e09"
 SRC_URI[sha256sum] = "a36371f8f9d86cb767e4ea84ed378d6546750843d4b1c0d57f7e53153e8da51b"
diff --git a/recipes/telepathy/telepathy-mission-control_4.45.bb b/recipes/telepathy/telepathy-mission-control_4.45.bb
index 35b9694..ff0868d 100644
--- a/recipes/telepathy/telepathy-mission-control_4.45.bb
+++ b/recipes/telepathy/telepathy-mission-control_4.45.bb
@@ -37,9 +37,5 @@ FILES_libmissioncontrol-dbg += "${libdir}/.debug/libmissioncontrol.so.*"
 FILES_libmissioncontrol-config-dbg += "${libdir}/.debug/libmissioncontrol-config.so.*"
 FILES_libmissioncontrol-server-dbg += "${libdir}/.debug/libmissioncontrol-server.so.*"
 
-do_stage() {
-        autotools_stage_all
-}
-
 SRC_URI[md5sum] = "b7810e1a53579bc496796538aefcc014"
 SRC_URI[sha256sum] = "cb5565a66fb233d7c0b9418bcef53fe330c8a5a0f904a9a04de087ad0b4d0be9"
diff --git a/recipes/tilibs/libticables_3.9.2.bb b/recipes/tilibs/libticables_3.9.2.bb
index e36d431..df993f4 100644
--- a/recipes/tilibs/libticables_3.9.2.bb
+++ b/recipes/tilibs/libticables_3.9.2.bb
@@ -5,9 +5,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tilp/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-autotools_stage_all
-}
-
 SRC_URI[md5sum] = "354675bfbd881082a9447efde9935226"
 SRC_URI[sha256sum] = "1c091859f09d5a38c76f0d64a93db46aa2b5d637c8a7370d348f21e7be324c37"
diff --git a/recipes/tilibs/libticalcs_4.5.9.bb b/recipes/tilibs/libticalcs_4.5.9.bb
index 19304e2..5fbbf7a 100644
--- a/recipes/tilibs/libticalcs_4.5.9.bb
+++ b/recipes/tilibs/libticalcs_4.5.9.bb
@@ -7,10 +7,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tilp/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "8e93f2a4f4e67a9558d97166b4a4155f"
 SRC_URI[sha256sum] = "d9bc0f2f19eb8d21d8319a40dd85c2b1ef45a01499187a424a50173bbdd4ff12"
diff --git a/recipes/tilibs/libtifiles_0.6.5.bb b/recipes/tilibs/libtifiles_0.6.5.bb
index 3fe505a..8c538a7 100644
--- a/recipes/tilibs/libtifiles_0.6.5.bb
+++ b/recipes/tilibs/libtifiles_0.6.5.bb
@@ -5,10 +5,5 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/tilp/${P}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "cfac4188328b888e80995f0ef3f6e0bf"
 SRC_URI[sha256sum] = "2216944bee1bafe60bf64ec01f6b8cd27ed9adfd2d1a185b43617d6e80d8b2c8"
diff --git a/recipes/tinymail/libtinymail.inc b/recipes/tinymail/libtinymail.inc
index 1eefc6e..7945b99 100644
--- a/recipes/tinymail/libtinymail.inc
+++ b/recipes/tinymail/libtinymail.inc
@@ -48,7 +48,3 @@ FILES_tinymail-camel-lite-dev +=  "${libdir}/libcamel-lite*.so \
 				   ${libdir}/camel-lite-1.2/camel-providers/*.a "
 FILES_tinymail-camel-lite-dbg +=  "${libdir}/camel-lite-1.2/camel-providers/.debug"
 
-
-do_stage () {
-	autotools_stage_all
-}
\ No newline at end of file
diff --git a/recipes/tomoe/libtomoe-gtk_0.1.0.bb b/recipes/tomoe/libtomoe-gtk_0.1.0.bb
index 99f300e..283b28c 100644
--- a/recipes/tomoe/libtomoe-gtk_0.1.0.bb
+++ b/recipes/tomoe/libtomoe-gtk_0.1.0.bb
@@ -8,9 +8,5 @@ inherit autotools pkgconfig
 
 SRC_URI = "http://keihanna.dl.sourceforge.jp/tomoe/17171/libtomoe-gtk-0.1.0.tar.gz"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "e9b887189ee408902a0f85d9b1cde06f"
 SRC_URI[sha256sum] = "de00404262d5601edd953d2c83adc8e4897c2a34dfa2d8248f521136c266cc52"
diff --git a/recipes/tomoe/tomoe_0.2.1.bb b/recipes/tomoe/tomoe_0.2.1.bb
index a58cf08..401b1e1 100644
--- a/recipes/tomoe/tomoe_0.2.1.bb
+++ b/recipes/tomoe/tomoe_0.2.1.bb
@@ -5,10 +5,6 @@ LICENSE = "LGPL"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
-
 SRC_URI = "http://keihanna.dl.sourceforge.jp/tomoe/16048/tomoe-0.2.1.tar.gz"
 
 SRC_URI[md5sum] = "95eca127a1d519ff4e836b3d00d7fa84"
diff --git a/recipes/tracker/tracker_0.5.4.bb b/recipes/tracker/tracker_0.5.4.bb
index 9ab3974..6661d9a 100644
--- a/recipes/tracker/tracker_0.5.4.bb
+++ b/recipes/tracker/tracker_0.5.4.bb
@@ -16,10 +16,6 @@ do_install_append() {
 	install -m 0755 ${WORKDIR}/90tracker  ${D}/${sysconfdir}/X11/Xsession.d/
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${datadir}/dbus-1/"
 CONFFILES_${PN} += "${sysconfdir}/X11/Xsession.d/90tracker"
 
diff --git a/recipes/tracker/tracker_0.6.95.bb b/recipes/tracker/tracker_0.6.95.bb
index 20bd80c..906c60d 100644
--- a/recipes/tracker/tracker_0.6.95.bb
+++ b/recipes/tracker/tracker_0.6.95.bb
@@ -27,10 +27,6 @@ do_install_append() {
    install -m 0755 ${WORKDIR}/90tracker  ${D}/${sysconfdir}/X11/Xsession.d/
 }
 
-do_stage() {
-   autotools_stage_all
-}
-
 FILES_${PN} += "${datadir}/dbus-1/"
 FILES_${PN}-dbg += "${libdir}/*/*/.debug"
 
diff --git a/recipes/tremor/tremor_20041119.bb b/recipes/tremor/tremor_20041119.bb
index de8ee92..889b981 100644
--- a/recipes/tremor/tremor_20041119.bb
+++ b/recipes/tremor/tremor_20041119.bb
@@ -17,6 +17,3 @@ inherit autotools
 
 EXTRA_OECONF=" --enable-shared --disable-rpath  "
 
-do_stage() {
-    autotools_stage_all
-}
diff --git a/recipes/tremor/tremor_svn.bb b/recipes/tremor/tremor_svn.bb
index 29851f5..751d5f2 100644
--- a/recipes/tremor/tremor_svn.bb
+++ b/recipes/tremor/tremor_svn.bb
@@ -15,6 +15,3 @@ inherit autotools
 
 EXTRA_OECONF=" --enable-shared --disable-rpath  "
 
-do_stage() {
-	autotools_stage_all
-}
diff --git a/recipes/uim/uim_1.3.1.bb b/recipes/uim/uim_1.3.1.bb
index 7012356..c7ad67b 100644
--- a/recipes/uim/uim_1.3.1.bb
+++ b/recipes/uim/uim_1.3.1.bb
@@ -140,9 +140,5 @@ if [ -f /usr/bin/uim-module-manager ]; then
 fi
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "2832e23d4778bbacbfa4b49bf642d667"
 SRC_URI[sha256sum] = "ed2cfa15018a4fd2557e875f66fcb3f0b9dabe12fa0700aa2f11cca69c2cb256"
diff --git a/recipes/ulxmlrpcpp/ulxmlrpcpp_1.7.3.bb b/recipes/ulxmlrpcpp/ulxmlrpcpp_1.7.3.bb
index b5ca1cd..7c87598 100644
--- a/recipes/ulxmlrpcpp/ulxmlrpcpp_1.7.3.bb
+++ b/recipes/ulxmlrpcpp/ulxmlrpcpp_1.7.3.bb
@@ -15,10 +15,6 @@ do_configure_append() {
 	echo "#define ulxr_snprintf   snprintf" >>ulxmlrpcpp/ulxmlrpcpp.h
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 LEAD_SONAME = "libulxmlrpcpp.so"
 PACKAGES =+ "${PN}-examples ${PN}-contrib"
 FILES_${PN}-examples = "${bindir}/*"
diff --git a/recipes/unicap/unicap_0.9.3.bb b/recipes/unicap/unicap_0.9.3.bb
index 4a47bc4..21b908d 100644
--- a/recipes/unicap/unicap_0.9.3.bb
+++ b/recipes/unicap/unicap_0.9.3.bb
@@ -9,10 +9,6 @@ SRC_URI = "http://www.unicap-imaging.org/downloads/unicap-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-do_stage () {
-        autotools_stage_all
-}
-
 PACKAGES += "libucil unicapgtk"
 
 FILES_${PN} = "${libdir}/libunicap.*so.* ${libdir}/unicap2/cpi/lib*.*so.*  ${libdir}/unicap2/cpi/lib*.*so"
diff --git a/recipes/unicap/unicap_0.9.4.bb b/recipes/unicap/unicap_0.9.4.bb
index 8b6f8c3..b61372b 100644
--- a/recipes/unicap/unicap_0.9.4.bb
+++ b/recipes/unicap/unicap_0.9.4.bb
@@ -9,10 +9,6 @@ SRC_URI = "http://www.unicap-imaging.org/downloads/tisCMOS/unicap-${PV}.tar.gz \
 
 inherit autotools pkgconfig
 
-do_stage () {
-        autotools_stage_all
-}
-
 PACKAGES += "libucil unicapgtk"
 
 FILES_${PN} = "${libdir}/libunicap.*so.* ${libdir}/unicap2/cpi/lib*.*so.*  ${libdir}/unicap2/cpi/lib*.*so"
diff --git a/recipes/unicap/unicap_0.9.7.bb b/recipes/unicap/unicap_0.9.7.bb
index 222e233..c71b26d 100644
--- a/recipes/unicap/unicap_0.9.7.bb
+++ b/recipes/unicap/unicap_0.9.7.bb
@@ -8,10 +8,6 @@ SRC_URI = "http://www.unicap-imaging.org/downloads/unicap-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage () {
-        autotools_stage_all
-}
-
 PACKAGES += "libucil unicapgtk"
 
 FILES_${PN} = "${libdir}/libunicap.*so.* ${libdir}/unicap2/cpi/lib*.*so.*  ${libdir}/unicap2/cpi/lib*.*so"
diff --git a/recipes/upnp/gupnp-av_0.2.bb b/recipes/upnp/gupnp-av_0.2.bb
index d3d3b0f..a909616 100644
--- a/recipes/upnp/gupnp-av_0.2.bb
+++ b/recipes/upnp/gupnp-av_0.2.bb
@@ -6,10 +6,6 @@ SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz"
 inherit autotools
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-	autotools_stage_all
-}
-
 
 FILES_${PN} = "${libdir}/*.so.*"
 
diff --git a/recipes/upnp/gupnp_0.12.4.bb b/recipes/upnp/gupnp_0.12.4.bb
index 18a12bc..3b8a0b8 100644
--- a/recipes/upnp/gupnp_0.12.4.bb
+++ b/recipes/upnp/gupnp_0.12.4.bb
@@ -5,11 +5,6 @@ SRC_URI = "http://gupnp.org/sources/${PN}/${PN}-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/gupnp-binding-tool"
 
diff --git a/recipes/upnp/libupnp_1.3.1.bb b/recipes/upnp/libupnp_1.3.1.bb
index 1cd9e01..f48b751 100644
--- a/recipes/upnp/libupnp_1.3.1.bb
+++ b/recipes/upnp/libupnp_1.3.1.bb
@@ -6,13 +6,5 @@ LEAD_SONAME = "libupnp"
 SRC_URI = "${SOURCEFORGE_MIRROR}/upnp/${P}.tar.gz"
 inherit autotools pkgconfig
 
-
-
-do_stage() {
-autotools_stage_all
-}
-
-
-
 SRC_URI[md5sum] = "6646be5e31e58188e8f47c6ce64faa4c"
 SRC_URI[sha256sum] = "4d0d6a5302222757fb36ee21d8f8e1b3de849c2de658ab1105272f32ff78767d"
diff --git a/recipes/upnp/libupnp_1.6.5.bb b/recipes/upnp/libupnp_1.6.5.bb
index b772a93..71c76cd 100644
--- a/recipes/upnp/libupnp_1.6.5.bb
+++ b/recipes/upnp/libupnp_1.6.5.bb
@@ -11,9 +11,5 @@ inherit autotools
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
 
-do_stage() {
-	autotools_stage_all
-}
-
 SRC_URI[md5sum] = "2b0370e7c405a5bc80880085e6d7d827"
 SRC_URI[sha256sum] = "95b11e2db04c2e714c2f4fb05d9d31351d3388dababd4e1dd5300f4b0d5e8767"
diff --git a/recipes/upstart/upstart.inc b/recipes/upstart/upstart.inc
index 59f21c9..e67774a 100644
--- a/recipes/upstart/upstart.inc
+++ b/recipes/upstart/upstart.inc
@@ -9,10 +9,6 @@ inherit autotools pkgconfig
 # --enable-compat builds halt, reboot, shutdown tools
 EXTRA_OECONF += "--enable-compat"
 
-do_stage () {
- 	autotools_stage_all
-}
-
 # libupstart can be used for upstart event generation from other programs.
 # However it is not used by upstart itself, so package it seperately.
 PACKAGES =+ "libupstart libupstart-dev"
diff --git a/recipes/usbpath/usbpath-native_svn.bb b/recipes/usbpath/usbpath-native_svn.bb
index 866e877..a1b78e9 100644
--- a/recipes/usbpath/usbpath-native_svn.bb
+++ b/recipes/usbpath/usbpath-native_svn.bb
@@ -2,7 +2,3 @@ require usbpath_svn.bb
 inherit native
 DEPENDS = "virtual/libusb0-native"
 
-do_stage () {
-	autotools_stage_all
-}
-
diff --git a/recipes/usbpath/usbpath_svn.bb b/recipes/usbpath/usbpath_svn.bb
index 1cedf33..2266c52 100644
--- a/recipes/usbpath/usbpath_svn.bb
+++ b/recipes/usbpath/usbpath_svn.bb
@@ -13,7 +13,3 @@ S = "${WORKDIR}/usbpath"
 
 inherit autotools
 
-do_stage () {
-	autotools_stage_all
-}
-
diff --git a/recipes/util-linux/util-linux-native_2.12r.bb b/recipes/util-linux/util-linux-native_2.12r.bb
index c583883..b380efe 100644
--- a/recipes/util-linux/util-linux-native_2.12r.bb
+++ b/recipes/util-linux/util-linux-native_2.12r.bb
@@ -26,10 +26,5 @@ do_compile () {
 	oe_runmake
 }
 
-do_stage () {
-	autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "af9d9e03038481fbf79ea3ac33f116f9"
 SRC_URI[sha256sum] = "b8e499b338ce9fbd1fb315194b26540ec823c0afc46c9e145ac7a3e38ad57e6b"
diff --git a/recipes/vlc/libdvdcss_1.2.10.bb b/recipes/vlc/libdvdcss_1.2.10.bb
index be3ed90..694da45 100644
--- a/recipes/vlc/libdvdcss_1.2.10.bb
+++ b/recipes/vlc/libdvdcss_1.2.10.bb
@@ -10,14 +10,6 @@ inherit autotools
 EXTRA_OECONF = " --disable-doc "
 
 AUTOTOOLS_STAGE_PKGCONFIG = "1"
-do_stage() {
-	autotools_stage_all
-}
-
-
-
-
-
 
 SRC_URI[md5sum] = "ebd5370b79ac5a83e5c61b24a214cf74"
 SRC_URI[sha256sum] = "2394a75013ab66b592d8c91d53529ede392bc9faee37fe279bd29b455eff2220"
diff --git a/recipes/vlc/vlc-davinci_0.8.6h.bb b/recipes/vlc/vlc-davinci_0.8.6h.bb
index 71520bb..ed53508 100644
--- a/recipes/vlc/vlc-davinci_0.8.6h.bb
+++ b/recipes/vlc/vlc-davinci_0.8.6h.bb
@@ -51,10 +51,6 @@ do_configure() {
 	sed -i -e s:-L/usr/lib:-L${STAGING_LIBDIR}/:g vlc-config
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 RCONFLICTS_${PN} = "vlc"
 
 FILES_${PN} += "${bindir}/vlc \
diff --git a/recipes/vlc/vlc.inc b/recipes/vlc/vlc.inc
index 511d226..73fc006 100644
--- a/recipes/vlc/vlc.inc
+++ b/recipes/vlc/vlc.inc
@@ -50,11 +50,6 @@ do_configure() {
 	sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 FILES_${PN} += "${bindir}/vlc \
 	${datadir}/applications \
 	${datadir}/vlc/ \
diff --git a/recipes/vlc/vlc_0.9.2.bb b/recipes/vlc/vlc_0.9.2.bb
index b2c2bca..97dd079 100644
--- a/recipes/vlc/vlc_0.9.2.bb
+++ b/recipes/vlc/vlc_0.9.2.bb
@@ -48,11 +48,6 @@ do_configure() {
 	sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${S}/include\ -DSYS_LINUX:g ${S}/modules/gui/qt4/Makefile
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 FILES_${PN} += "${bindir}/vlc \
 	${datadir}/applications \
 	${datadir}/vlc/ \
diff --git a/recipes/vnc/libvncserver_0.9.1.bb b/recipes/vnc/libvncserver_0.9.1.bb
index 958f0a2..ad4f403 100644
--- a/recipes/vnc/libvncserver_0.9.1.bb
+++ b/recipes/vnc/libvncserver_0.9.1.bb
@@ -19,9 +19,6 @@ S = "${WORKDIR}/LibVNCServer-${PV}"
 EXTRA_OEMAKE_append=" SUBDIRS='libvncserver' "
 
 inherit autotools
-do_stage() {
-    autotools_stage_all
-}
 
 SRC_URI[md5sum] = "aa00efc3dabde82fde9509bfbab0aba4"
 SRC_URI[sha256sum] = "0fbda7fc37c1f360bdbeb586e48d6203a5ef56a8cfc3b78887d7d90db683f282"
diff --git a/recipes/vnc/libvncserver_0.9.bb b/recipes/vnc/libvncserver_0.9.bb
index 16a4cb1..9001457 100644
--- a/recipes/vnc/libvncserver_0.9.bb
+++ b/recipes/vnc/libvncserver_0.9.bb
@@ -13,10 +13,6 @@ S = "${WORKDIR}/LibVNCServer-${PV}"
 
 inherit autotools
 
-do_stage() {
-    autotools_stage_all
-}
-
 do_install_append() {
         install -d ${D}${bindir}
         install -m 0755 examples/storepasswd ${D}${bindir}
diff --git a/recipes/vte/vte.inc b/recipes/vte/vte.inc
index 490792e..e87afab 100644
--- a/recipes/vte/vte.inc
+++ b/recipes/vte/vte.inc
@@ -18,10 +18,6 @@ do_install_append() {
 	sed s/@VERSION@/${PV}/ <${WORKDIR}/vte.desktop.in >${D}${datadir}/applications/vte.desktop
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libvte vte-termcap gnome-pty-helper"
 FILES_libvte = "${libdir}/*.so.*"
 FILES_gnome-pty-helper = "${libexecdir}/gnome-pty-helper"
diff --git a/recipes/vte/vte_0.21.5.bb b/recipes/vte/vte_0.21.5.bb
index 8834887..eca9740 100644
--- a/recipes/vte/vte_0.21.5.bb
+++ b/recipes/vte/vte_0.21.5.bb
@@ -22,10 +22,6 @@ do_configure_prepend() {
 	echo "EXTRA_DIST = version.xml" > gtk-doc.make
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGES =+ "libvte vte-termcap gnome-pty-helper"
 FILES_libvte = "${libdir}/*.so.*"
 FILES_gnome-pty-helper = "${libexecdir}/gnome-pty-helper"
diff --git a/recipes/wv/wv_1.2.4.bb b/recipes/wv/wv_1.2.4.bb
index 89d0504..3d291c0 100644
--- a/recipes/wv/wv_1.2.4.bb
+++ b/recipes/wv/wv_1.2.4.bb
@@ -16,10 +16,6 @@ S = "${WORKDIR}/${PN}-${PV}"
 
 EXTRA_OECONF = ""
 
-do_stage () {
-	autotools_stage_all
-}
-
 do_compile () {
 	oe_runmake -f GNUmakefile 
 }
diff --git a/recipes/wvstreams/wvstreams_4.2.2.bb b/recipes/wvstreams/wvstreams_4.2.2.bb
index 4358ec1..47a5446 100644
--- a/recipes/wvstreams/wvstreams_4.2.2.bb
+++ b/recipes/wvstreams/wvstreams_4.2.2.bb
@@ -34,11 +34,6 @@ FILES_libwvstreams-base-dbg = "${libdir}/.debug/libwvutils.so.*"
 FILES_libwvstreams-extras     = "${libdir}/libwvbase.so.* ${libdir}/libwvstreams.so.*"
 FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debug/libwvstreams.so.*"
 
-
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[archive.md5sum] = "103230cb9926cb8f3f4d8dc8584f3b9c"
 SRC_URI[archive.sha256sum] = "8fa45a6bfe4d6ac3d9a457543844873090d0c7da817991ac0cd547732f475a14"
 SRC_URI[patch22.md5sum] = "58e1df79ce031b256417ba5992cce833"
diff --git a/recipes/wvstreams/wvstreams_4.4.1.bb b/recipes/wvstreams/wvstreams_4.4.1.bb
index 4506b05..abb500f 100644
--- a/recipes/wvstreams/wvstreams_4.4.1.bb
+++ b/recipes/wvstreams/wvstreams_4.4.1.bb
@@ -36,10 +36,5 @@ FILES_libwvstreams-base-dbg = "${libdir}/.debug/libwvutils.so.*"
 FILES_libwvstreams-extras     = "${libdir}/libwvbase.so.* ${libdir}/libwvstreams.so.*"
 FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debug/libwvstreams.so.*"
 
-
-do_stage() {
-    autotools_stage_all
-}
-
 SRC_URI[md5sum] = "907b0cba8931553d848620ea16f006b9"
 SRC_URI[sha256sum] = "cff48f9a87e94672c7a819661a3a5c893ee44e763c6e5775d00aff3de43619b1"
diff --git a/recipes/wvstreams/wvstreams_4.6.bb b/recipes/wvstreams/wvstreams_4.6.bb
index eb70fd2..25adf10 100644
--- a/recipes/wvstreams/wvstreams_4.6.bb
+++ b/recipes/wvstreams/wvstreams_4.6.bb
@@ -31,9 +31,6 @@ FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debu
 
 PARALLEL_MAKE = ""
 
-do_stage() {
-    autotools_stage_all
-}
 do_configure() {
         autoreconf
         oe_runconf
diff --git a/recipes/xapian/xapian-bindings-python_1.0.14.bb b/recipes/xapian/xapian-bindings-python_1.0.14.bb
index ae97779..0208bfe 100644
--- a/recipes/xapian/xapian-bindings-python_1.0.14.bb
+++ b/recipes/xapian/xapian-bindings-python_1.0.14.bb
@@ -36,10 +36,5 @@ do_install_append() {
         rm ${D}/${PYTHON_SITEPACKAGES_DIR}/xapian.py?
 }
 
-do_stage () {
-     autotools_stage_all
-}
-
-
 SRC_URI[md5sum] = "d6f86ccc3d1a534902e1cf8df1cb43f3"
 SRC_URI[sha256sum] = "05072405fd182425d90374d2d5b69c36fe9fd927f44e397c449a9bdd1a971218"
diff --git a/recipes/xapian/xapian-core.inc b/recipes/xapian/xapian-core.inc
index 080de12..cb39995 100644
--- a/recipes/xapian/xapian-core.inc
+++ b/recipes/xapian/xapian-core.inc
@@ -9,7 +9,3 @@ SRC_URI = "http://www.oligarchy.co.uk/xapian/${PV}/xapian-core-${PV}.tar.gz"
 
 inherit autotools pkgconfig
 
-do_stage () {
-     autotools_stage_all
-}
-
diff --git a/recipes/xcb/xcb-proto_1.6.bb b/recipes/xcb/xcb-proto_1.6.bb
index e3f1d43..c92396e 100644
--- a/recipes/xcb/xcb-proto_1.6.bb
+++ b/recipes/xcb/xcb-proto_1.6.bb
@@ -4,6 +4,3 @@ PR = "r1"
 SRC_URI[md5sum] = "04313e1d914b44d0e457f6c494fc178b"
 SRC_URI[sha256sum] = "f52bc1159b12496f002404eb5793c01277b20c82cb72c5ff076d7b25da9b5ca2"
 
-do_stage() {
-	   autotools_stage_all
-}
diff --git a/recipes/xcb/xcb-proto_git.bb b/recipes/xcb/xcb-proto_git.bb
index 447a868..f8fb4ae 100644
--- a/recipes/xcb/xcb-proto_git.bb
+++ b/recipes/xcb/xcb-proto_git.bb
@@ -8,7 +8,3 @@ PR = "r0"
 SRC_URI = "git://anongit.freedesktop.org/xcb/proto;protocol=git"
 S = "${WORKDIR}/git"
 
-do_stage() {
-	autotools_stage_all
-}
-
diff --git a/recipes/xcb/xcb-util.inc b/recipes/xcb/xcb-util.inc
index 4509a2b..b86e9e1 100644
--- a/recipes/xcb/xcb-util.inc
+++ b/recipes/xcb/xcb-util.inc
@@ -26,6 +26,3 @@ FILES_libxcbwm = "${libdir}/libXCBWM.so.*"
 
 inherit autotools pkgconfig
 
-do_stage () {
-	autotools_stage_all
-}
diff --git a/recipes/xfce-base/xfce-mcs-manager.inc b/recipes/xfce-base/xfce-mcs-manager.inc
index 4edbf9d..f4fc25b 100644
--- a/recipes/xfce-base/xfce-mcs-manager.inc
+++ b/recipes/xfce-base/xfce-mcs-manager.inc
@@ -9,11 +9,6 @@ PR = "r2"
 
 inherit xfce 
 
-do_stage() {
-	autotools_stage_all
-}
-
-
 do_stage_append () {
 	install -d ${PKG_CONFIG_DIR}
 	sed -e 's:^includedir=.*:includedir="/usr/include":;' ${S}/xfce-mcs-manager/xfce-mcs-manager.pc >${PKG_CONFIG_DIR}/xfce-mcs-manager.pc
diff --git a/recipes/xmms/xmms_1.2.10.bb b/recipes/xmms/xmms_1.2.10.bb
index 8b41914..0585a7f 100644
--- a/recipes/xmms/xmms_1.2.10.bb
+++ b/recipes/xmms/xmms_1.2.10.bb
@@ -69,10 +69,6 @@ python populate_packages_prepend () {
 	do_split_packages(d, visualisation_root, '^lib(.*)\.so$', 'xmms-plugin-visualization-%s', 'XMMS Visualization plugin for %s')
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} = "${bindir}/xmms ${bindir}/xmms.sh ${libdir}/libxmms*.so.* \
                ${datadir}/applications/xmms.desktop \
 	       ${datadir}/pixmaps/xmms_mini.xpm"
diff --git a/recipes/xorg-driver/xorg-driver-common.inc b/recipes/xorg-driver/xorg-driver-common.inc
index ff620dd..a8b0fb3 100644
--- a/recipes/xorg-driver/xorg-driver-common.inc
+++ b/recipes/xorg-driver/xorg-driver-common.inc
@@ -17,11 +17,6 @@ inherit autotools pkgconfig
 
 TARGET_CPPFLAGS += "-I${STAGING_DIR_HOST}/usr/include/xorg"
 
-
-do_stage() {
-	autotools_stage_all
-}
-
 # Another sucky behavor from Xorg configure scripts.
 # They use AC_CHECK_FILE to check for DRI headers. Yuck!
 # Of course this will blow up when cross compiling.
diff --git a/recipes/xorg-font/xorg-font-common.inc b/recipes/xorg-font/xorg-font-common.inc
index c5b0694..a928277 100644
--- a/recipes/xorg-font/xorg-font-common.inc
+++ b/recipes/xorg-font/xorg-font-common.inc
@@ -28,10 +28,6 @@ do_install_append() {
 	find ${D}${datadir}/fonts/X11 -type f -name fonts.scale | xargs rm -f	
 }
 
-do_stage() {
-	autotools_stage_all
-}
-
 PACKAGE_ARCH = "all"
 
 FILES_${PN} += " ${libdir}/X11/fonts ${datadir}"
diff --git a/recipes/xorg-xserver/xorg-xserver-common.inc b/recipes/xorg-xserver/xorg-xserver-common.inc
index a2a43ef..7f8beb7 100644
--- a/recipes/xorg-xserver/xorg-xserver-common.inc
+++ b/recipes/xorg-xserver/xorg-xserver-common.inc
@@ -106,10 +106,6 @@ PACKAGES =+ "${PN}-multimedia-modules"
 
 FILES_${PN}-multimedia-modules = "${libdir}/xorg/modules/multimedia/*drv*"
 
-do_stage() {
-	autotools_stage_all
-}
-
 do_install_append () {
 	ln -sf ${datadir}/fonts/X11 ${D}/${libdir}/X11/fonts
 }
-- 
1.6.4.2



