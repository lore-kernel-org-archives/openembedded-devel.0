Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PKz6d-0005TN-AR
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 21:04:50 +0100
Received: from [192.168.178.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 2E1B91B40D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Nov 2010 21:04:51 +0100 (CET)
Message-ID: <4CEC1E17.1030208@sensortherm.de>
Date: Tue, 23 Nov 2010 21:03:35 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,URI_HEX
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: I've downloaded oe
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
X-List-Received-Date: Tue, 23 Nov 2010 20:04:50 -0000
X-Groupsio-MsgNum: 26498
Content-Type: multipart/mixed; boundary="------------010109030100000109030607"

--------------010109030100000109030607
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

i've downloaded oe with this script (thanks frans):

#!/bin/sh

export OE=/home/klaus/development/oe/
export BBPATH=${OE}build:${OE}openembedded
export PATH=${OE}bitbake/bin:${PATH}
export MACHINE=dm355-evm

RECIPES="${OE}/openembedded/recipes"
LOGFILE="fetchsrc.log"

#Find recipes how changed this week
#FIND_OPTIONS="-atime 7"

for i in $(find ${RECIPES} -name '*.bb' -type f ${FIND_OPTIONS} | sort )
do
	echo $i
	bitbake -c fetch -b $i
done > ${LOGFILE} 2>&1

egrep -n 'ERROR.*bb..failed' ${LOGFILE}
egrep -n 'KeyError' ${LOGFILE}





I found a lot of errors, see attachment! The whole logfile is on my 
homepage:
http://fbi.hooster.de/download/sonstiges/oe/fetchsrc.log.tar.gz

How can i/we fix this errors?





--------------010109030100000109030607
Content-Type: text/x-log;
 name="error.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="error.log"

437:KeyError: '/home/klaus/development/oe/openembedded/recipes/adobe-flash/flash-plugin_10.0.22.87.bb'
670:KeyError: '/home/klaus/development/oe/openembedded/recipes/alsa/alsa-driver_0.9.6-hh4c.bb'
1827:KeyError: '/home/klaus/development/oe/openembedded/recipes/apache/apache_2.0.54.bb'
2679:KeyError: '/home/klaus/development/oe/openembedded/recipes/arm-kernel-shim/arm-kernel-shim_1.5.bb'
2934:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/aspell/aspell_0.60.6.bb'
6782:KeyError: '/home/klaus/development/oe/openembedded/recipes/at91bootstrap/at91bootstrap_2.10.bb'
6794:KeyError: '/home/klaus/development/oe/openembedded/recipes/at91bootstrap/at91bootstrap_2.11.bb'
6823:KeyError: '/home/klaus/development/oe/openembedded/recipes/at91bootstrap/at91bootstrap_2.4.bb'
7417:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/atk/atk_1.28.0.bb'
7440:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/atk/atk_1.30.0.bb'
7531:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/autoconf/autoconf213_2.13.bb'
7554:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/autoconf/autoconf_2.61.bb'
7577:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/autoconf/autoconf_2.63.bb'
7600:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/autoconf/autoconf_2.65.bb'
7757:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/automake/automake_1.10.2.bb'
7780:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/automake/automake_1.10.3.bb'
7803:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/automake/automake_1.11.1.bb'
7826:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/automake/automake_1.9.6.bb'
8093:KeyError: '/home/klaus/development/oe/openembedded/recipes/avr-evtd/avr-evtd_1.7.2.bb'
8105:KeyError: '/home/klaus/development/oe/openembedded/recipes/avr-libc/avr-libc_1.0.3.bb'
9601:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/bcel/bcel_5.2.bb'
11287:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/bison/bison_2.0.bb'
11310:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/bison/bison_2.3.bb'
12681:KeyError: '/home/klaus/development/oe/openembedded/recipes/bluez/bluez-libs_3.33.bb'
12694:KeyError: '/home/klaus/development/oe/openembedded/recipes/bluez/bluez-libs_3.36.bb'
12707:KeyError: '/home/klaus/development/oe/openembedded/recipes/bluez/bluez-libs_4.42.bb'
12720:KeyError: '/home/klaus/development/oe/openembedded/recipes/bluez/bluez-utils_3.33.bb'
12733:KeyError: '/home/klaus/development/oe/openembedded/recipes/bluez/bluez-utils_3.36.bb'
14637:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/byacc/byacc_20081225.bb'
14818:KeyError: '/home/klaus/development/oe/openembedded/recipes/c3110x/cx3110x_1.1.bb'
16996:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/cgreen/cgreen_svn.bb'
59347:KeyError: '/home/klaus/development/oe/openembedded/recipes/chumby/chumby-firmware_1.2.bb'
61414:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/classpath/inetlib_1.1.1.bb'
61437:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/classpathx/gnujaf_1.1.1.bb'
61460:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/classpathx/gnumail_1.1.2.bb'
62373:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/confuse/confuse_2.7.bb'
62929:KeyError: '/home/klaus/development/oe/openembedded/recipes/cpuburn/cpuburn_1.4.bb'
63196:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/cramfs/cramfs_1.1.bb'
63799:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/curl/curl_7.21.1.bb'
63873:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/cwautomacros/cwautomacros_20090610.bb'
64831:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/dbus/dbus_1.4.0.bb'
65001:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/dbus/dbus_git.bb'
65024:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/dbus/dbus-glib_0.74.bb'
65047:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/dbus/dbus-glib_0.78.bb'
65070:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/dbus/dbus-glib_0.86.bb'
66365:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/desktop-file-utils/desktop-file-utils_0.16.bb'
67105:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/dfu-util/dfu-util_0.1.bb'
69122:KeyError: '/home/klaus/development/oe/openembedded/recipes/dmidecode/dmidecode_2.10.bb'
69134:KeyError: '/home/klaus/development/oe/openembedded/recipes/dmidecode/dmidecode_2.9.bb'
69559:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/dosfstools/dosfstools_2.11.bb'
71625:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/dvnixload/dvnixload_0.2.6.bb'
78362:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/e2fsprogs/e2fsprogs_1.41.9.bb'
78940:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/ed/ed_0.5.bb'
78963:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/ed/ed_1.5.bb'
79214:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/efl1/ecore_svn.bb'
79857:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/efl1/eet_svn.bb'
85716:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/eggdbus/eggdbus_0.6.bb'
131207:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/elftoaout/elftoaout_2.3.bb'
141504:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/expat/expat_2.0.1.bb'
142830:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/fastjar/fastjar_0.98.bb'
143111:KeyError: '/home/klaus/development/oe/openembedded/recipes/fbprogress/fbprogress_1.1.bb'
144475:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/file/file_4.18.bb'
144498:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/file/file_4.21.bb'
144521:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/file/file_5.04.bb'
144595:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/findutils/findutils_4.2.29.bb'
144618:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/findutils/findutils_4.5.5.bb'
144641:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/findutils/findutils_4.5.9.bb'
144964:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/flex/flex_2.5.31.bb'
144987:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/flex/flex_2.5.35.bb'
147994:KeyError: '/home/klaus/development/oe/openembedded/recipes/freesmartphone/fso-apm_git.bb'
148765:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/freetype/freetype_2.4.3.bb'
150509:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gawk/gawk_3.1.4.bb'
252990:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gdbm/gdbm_1.8.3.bb'
253411:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/genromfs/genromfs_0.5.2.bb'
253434:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/genromfs/genromfs_git.bb'
253901:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gettext/gettext_0.17.bb'
253924:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gettext/gettext_0.18.bb'
254167:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/giflib/giflib_4.1.6.bb'
254622:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/glib-1.2/glib-1.2_1.2.10.bb'
255028:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/glib-2.0/glib-2.0_2.22.4.bb'
255051:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/glib-2.0/glib-2.0_2.23.6.bb'
255074:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/glib-2.0/glib-2.0_2.24.0.bb'
255097:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/glib-2.0/glib-2.0_2.24.1.bb'
270681:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gmp/gmp_4.2.4.bb'
270704:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gmp/gmp_5.0.1.bb'
270727:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gmp/gmp-canadian_4.2.4.bb'
270750:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gmp/gmp-native_4.2.4.bb'
271629:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnome/gnome-common_2.28.0.bb'
271703:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnome/gnome-doc-utils_0.19.2.bb'
273529:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnome/scrollkeeper_0.3.14.bb'
273750:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnu-config/gnu-config_20050701.bb'
273773:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnu-config/gnu-config_git.bb'
274469:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnutls/gnutls_2.10.1.bb'
274492:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnutls/gnutls_2.10.2.bb'
274515:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnutls/gnutls_2.8.5.bb'
274538:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gnutls/gnutls_2.8.6.bb'
274803:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gobject-introspection/gobject-introspection_0.9.10.bb'
278839:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gperf/gperf_3.0.3.bb'
282277:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/grep/grep_2.7.bb'
282667:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/groff/groff_1.19.2.bb'
282690:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/groff/groff_1.20.1.bb'
282702:KeyError: '/home/klaus/development/oe/openembedded/recipes/grub/grub_0.97.bb'
286775:KeyError: '/home/klaus/development/oe/openembedded/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb'
287662:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gtk-doc/gtk-doc.bb'
289240:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gtk+/gtk+_2.14.2.bb'
290894:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gtk+/gtk+_2.18.6.bb'
290917:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gtk+/gtk+_2.20.0.bb'
290940:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gtk+/gtk+_2.20.1.bb'
293913:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/gzip/gzip_1.4.bb'
293925:KeyError: '/home/klaus/development/oe/openembedded/recipes/h2200-bootloader/h2200-bootloader.bb'
294660:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/help2man/help2man_1.37.1.bb'
296275:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/htmldoc/htmldoc_1.8.27.bb'
296298:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/htmldoc/htmldoc_1.9.x-r1571.bb'
298995:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/imagemagick/imagemagick_6.3.5-10.bb'
299018:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/imagemagick/imagemagick_6.4.4-1.bb'
300531:KeyError: '/home/klaus/development/oe/openembedded/recipes/images/slugos-extd-image.bb'
300543:KeyError: '/home/klaus/development/oe/openembedded/recipes/images/slugos-image.bb'
303193:KeyError: '/home/klaus/development/oe/openembedded/recipes/ipaq-boot-params/ipaq-boot-params.bb'
303302:KeyError: '/home/klaus/development/oe/openembedded/recipes/iphone/apple-csu_0.30.bb'
303314:KeyError: '/home/klaus/development/oe/openembedded/recipes/iphone/gcc-iphone-cross_git.bb'
303326:KeyError: '/home/klaus/development/oe/openembedded/recipes/iphone/iphone-rootfs_2.2.1.bb'
303338:KeyError: '/home/klaus/development/oe/openembedded/recipes/iphone/iphone-sdks_2.2.1.bb'
303351:KeyError: '/home/klaus/development/oe/openembedded/recipes/ipkg/ipkg_0.99.163.bb'
304532:KeyError: '/home/klaus/development/oe/openembedded/recipes/irrlicht/irrlicht-examples-gles.bb'
305433:KeyError: '/home/klaus/development/oe/openembedded/recipes/ixp4xx/ixp4xx-npe_2.1.bb'
305445:KeyError: '/home/klaus/development/oe/openembedded/recipes/ixp4xx/ixp4xx-npe_2.3.2.bb'
305457:KeyError: '/home/klaus/development/oe/openembedded/recipes/ixp4xx/ixp4xx-npe_2.4.bb'
305825:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jacl/jacl_1.4.1.bb'
306591:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jakarta-commons/commons-logging_1.1.1.bb'
306614:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jakarta-commons/commons-net_1.4.1.bb'
306684:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jakarta-libs/avalon-framework-api_4.3.bb'
306707:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jakarta-libs/bsf_2.4.0.bb'
306730:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jakarta-libs/log4j1.2_1.2.15.bb'
306753:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jakarta-libs/logkit_1.2.2.bb'
306776:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jakarta-libs/oro_2.0.8.bb'
306816:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jakarta-libs/regexp_1.5.bb'
307095:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jcraft/jsch_0.1.40.bb'
307118:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jcraft/jzlib_1.0.7.bb'
307141:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jdepend/jdepend_2.9.bb'
307403:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jikes/jikes_1.21.bb'
307426:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jikes/jikes_1.22.bb'
307623:KeyError: '/home/klaus/development/oe/openembedded/recipes/jlime/jlime-extras-ben-nanonote_1.0.0.bb'
307635:KeyError: '/home/klaus/development/oe/openembedded/recipes/jlime/jlime-extras-jornada6xx_1.0.0.bb'
307647:KeyError: '/home/klaus/development/oe/openembedded/recipes/jlime/jlime-extras-jornada7xx_1.0.0.bb'
307659:KeyError: '/home/klaus/development/oe/openembedded/recipes/jlime/jlime-extras-mp900c_1.0.0.bb'
307746:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jpeg/jbig2dec_0.11.bb'
307769:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jpeg/jpeg_6b.bb'
307792:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jpeg/jpeg_8b.bb'
307815:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/jpeg/openjpeg_1.3.bb'
308012:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/junit/junit_3.8.2.bb'
308035:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/junit/junit4_4.3.1.bb'
309962:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/kakasi/kakasi_2.3.4.bb'
310503:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/kbd/kbd_1.15.2.bb'
312751:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/lemon/lemon_3.5.4.bb'
312921:KeyError: '/home/klaus/development/oe/openembedded/recipes/libacpi/libacpi_0.2.bb'
314721:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libelf/libelf_0.8.13.bb'
316271:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libfribidi/fribidi_0.19.2.bb'
316311:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libftdi/ftdi-eeprom_0.2.bb'
316334:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libftdi/ftdi-eeprom_0.3.bb'
316357:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libftdi/libftdi_0.18.bb'
316492:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgcrypt/libgcrypt_1.2.4.bb'
316515:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.0.bb'
316538:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgcrypt/libgcrypt_1.4.1.bb'
316632:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgee/libgee_0.5.2.bb'
316655:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgee/libgee_0.6.0.bb'
316678:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgee/libgee_git.bb'
317830:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgpg-error/libgpg-error_1.0.bb'
317853:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgpg-error/libgpg-error_1.3.bb'
317876:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libgpg-error/libgpg-error_1.4.bb'
318883:KeyError: '/home/klaus/development/oe/openembedded/recipes/libiconv/libiconv_1.11.bb'
318896:KeyError: '/home/klaus/development/oe/openembedded/recipes/libiconv/libiconv_1.12.bb'
318909:KeyError: '/home/klaus/development/oe/openembedded/recipes/libiconv/libiconv_1.13.1.bb'
320428:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libmpc/libmpc_0.8.1.bb'
320451:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libmpc/libmpc_0.8.2.bb'
322006:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libpng/libpng_1.2.44.bb'
324443:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libtiff/tiff_3.9.4.bb'
325017:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libunwind/libunwind_0.99.bb'
326338:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libxml/libxml2_2.7.3.bb'
326361:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libxml/libxml2_2.7.6.bb'
326384:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libxml/libxml2_2.7.7.bb'
326407:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libxml/libxml2_2.7.8.bb'
326650:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libxslt/libxslt_1.1.21.bb'
326673:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libxslt/libxslt_1.1.22.bb'
326696:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/libxslt/libxslt_1.1.26.bb'
326963:KeyError: '/home/klaus/development/oe/openembedded/recipes/lilo-sh/lilo-sh_21.bb'
328315:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/chumby-kernel_2.6.16-chumby-1.2.bb'
328327:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/compulab-pxa270_2.6.16.bb'
328339:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/devkitidp-pxa255_2.6.19.bb'
328351:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/ep93xx-kernel_2.6.17+2.6.18-rc1.bb'
328363:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/ep93xx-kernel_2.6.19+2.6.20-rc7.bb'
328553:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/fsg3-kernel_2.6.18.bb'
328656:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/handhelds-pxa_2.4.19-rmk6-pxa1-hh42.bb'
328668:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/handhelds-sa_2.4.19-rmk6-pxa1-hh42.bb'
328761:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/ipod_2.4.24-ipod0.bb'
328773:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/ixp4xx-kernel_2.6.18.bb'
328785:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/ixp4xx-kernel_2.6.19.bb'
328797:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/ixp4xx-kernel_2.6.20.bb'
328809:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/ixp4xx-kernel_2.6.21.6.bb'
328821:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/ixp4xx-kernel_2.6.23.8.bb'
328833:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/LAB-kernel_2.6.13-hh2.bb'
328845:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/LAB-kernel_cvs.bb'
328868:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.11.1.bb'
328891:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.15.99.bb'
328914:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.18+2.6.19-rc1.bb'
328937:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.18.bb'
328960:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.20.bb'
328983:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.22.bb'
329006:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb'
329029:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.24.bb'
329052:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.25.bb'
329075:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb'
329098:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.30.bb'
329121:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.31.bb'
329144:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.32.bb'
329167:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.34.bb'
329190:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.7.0.bb'
329213:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/linux-libc-headers/linux-libc-headers_2.6.8.1.bb'
329684:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-amsdelta-2.6_2.6.16-omap2.bb'
329713:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-bd-neon-2.6_2.6.22.bb'
329725:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-bfin_svn.bb'
329737:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-bug_2.6.27.2.bb'
329749:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-colinux_2.4.28.bb'
329761:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-colinux_2.6.10.bb'
329773:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-davinci_2.6.25.bb'
329785:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-davinci_2.6.27.bb'
329797:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-davinci_2.6.28.bb'
329860:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-dht-walnut_2.6.20.bb'
329872:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-dht-walnut_2.6.23.bb'
329884:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ea3250_2.6.27.8.bb'
329896:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-efika_2.6.18+2.6.19-rc6.bb'
329908:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-efika_2.6.20.20.bb'
329920:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-efika_2.6.20.bb'
329932:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-efika_2.6.21+git.bb'
329944:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-efikamx_2.6.31.bb'
329956:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-efikamx_git+2.6.36-rc7.bb'
329968:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-epia_2.6.11.bb'
329980:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-epia_2.6.12.bb'
329992:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-epia_2.6.19.2.bb'
330004:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-epia_2.6.8.1.bb'
330016:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-eten_2.6.28-rc4+git.bb'
330028:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-geodegx_2.4.24.bb'
330040:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-geodelx_2.6.11.bb'
330069:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-h1940_2.6.11-bk1-h1940.bb'
330081:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-h1940_2.6.14-h1940.bb'
330093:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-h1940_2.6.17-h1940.bb'
330105:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-h6300-omap1_2.6.12-rc5.bb'
330117:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-h6300-omap1_2.6.14.3.bb'
330129:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-h6300-omap1_2.6.16.16.bb'
330141:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-hackndev-2.6_git.bb'
330153:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-handhelds-2.6_2.6.16-hh9.bb'
330165:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-handhelds-2.6_2.6.17-hh4.bb'
330177:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-handhelds-2.6_2.6.18-hh2.bb'
330189:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-handhelds-2.6_2.6.19-hh13.bb'
330201:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-handhelds-2.6_2.6.20-hh10.bb'
330213:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-handhelds-2.6_2.6.21-hh20.bb'
330225:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-handhelds-2.6_cvs.bb'
330237:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-igep2_2.6.28.10-0.bb'
330249:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-igep2_2.6.33.7-0.bb'
330261:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-imx_git.bb'
330273:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ixp4xx_2.6.18.bb'
330285:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ixp4xx_2.6.19.bb'
330297:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ixp4xx_2.6.20.bb'
330309:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ixp4xx_2.6.21.7.bb'
330321:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ixp4xx_2.6.23.14.bb'
330333:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ixp4xx_2.6.24.7.bb'
330345:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ixp4xx_2.6.27.8.bb'
330357:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ixp4xx_2.6.29.bb'
330369:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-ben-nanonote_2.6.36.bb'
330381:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-current.bb'
330393:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada6xx_2.6.11.bb'
330405:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada6xx_2.6.17.bb'
330417:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada6xx_2.6.21rc5.bb'
330429:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada6xx_2.6.25.bb'
330441:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada6xx_2.6.32.bb'
330453:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada7xx_2.6.17.bb'
330465:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada7xx_2.6.18.bb'
330477:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada7xx_2.6.19rc6.bb'
330489:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-jlime-jornada7xx_2.6.34+git.bb'
330552:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-kexecboot_2.6.29.bb'
330615:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-kirkwood_2.6.29.5.bb'
330627:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-kirkwood_2.6.30.5.bb'
330639:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-kirkwood_2.6.31.bb'
330651:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc1.bb'
330663:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-kirkwood_2.6.33-rc5.bb'
330675:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ks8695_2.6.16.bb'
330687:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-leviathan_git.bb'
330699:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-linkstationppc_2.6.28.4.bb'
330711:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-magicbox_2.6.18.6.bb'
330723:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-magicbox_2.6.19.2.bb'
330735:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-mainstone_2.6.25.bb'
330747:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-mini2440_2.6.30+git.bb'
330759:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-mini2440_2.6.31+git.bb'
330771:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-ml403-mvista-2.6.x_git.bb'
330783:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-msm7_git.bb'
330795:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-mtx-1_2.4.27.bb'
330807:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-mtx-1u_2.4.27.bb'
330819:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-mtx-2_2.4.27.bb'
330831:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-mtx-3_2.6.15.4.bb'
330843:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-mtx-3_2.6.15.bb'
330855:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-n1200_2.6.27-rc9+git.bb'
330867:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-navman_2.6.18.bb'
330879:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-neuros_2.6.15.bb'
330891:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-neuros_git.bb'
330920:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-nokia800_2.6.18-osso40.bb'
330932:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-nokia800_2.6.21-osso71.bb'
330944:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.12-rc2.bb'
330956:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.18+git.bb'
330968:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.18-omap1.bb'
330980:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.19-omap1.bb'
330992:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.20-omap1.bb'
331004:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.22-omap1.bb'
331016:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.23-omap1.bb'
331028:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.24-omap1.bb'
331040:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.25-omap1.bb'
331052:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap1_2.6.x+git.bb'
331081:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap_2.6.26.bb'
331093:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap_2.6.27.bb'
331105:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap_2.6.28.bb'
331117:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap_2.6.29.bb'
331129:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap_2.6.31.bb'
331141:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap_2.6.32.bb'
331153:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap_2.6.37rc.bb'
331165:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap2_git.bb'
331177:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap3_2.6.34-psp04.00.00.06.bb'
331189:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap4_2.6.35.3.bb'
331201:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omapandroid_2.6.29.bb'
331213:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-archos_2.6.22.1-omap1.bb'
331225:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-archos_2.6.27.10-omap1.bb'
331237:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap_git.bb'
331249:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-hah_2.6.31.bb'
331261:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-multi-psp_2.6.32.bb'
331273:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-pm_2.6.28.bb'
331285:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-pm_2.6.29.bb'
331297:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-pm_git.bb'
331309:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-psp_2.6.29.bb'
331321:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-psp_2.6.31.bb'
331333:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-psp_2.6.32.bb'
331345:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omapzoom_git.bb'
331357:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-zoomsync_2.6.31.bb'
331369:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-omap-zoomsync_2.6.32.bb'
331381:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-openmoko_2.6.34.bb'
331393:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-orion_2.6.28.4.bb'
331405:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-palm-omap1_2.6.22-omap1.bb'
331451:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-powerpc-fsl_2.6.35.bb'
331463:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-powerpc-fsl_git.bb'
331475:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-qsd8_git.bb'
331487:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-replicant_git.bb'
331499:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-rp_2.6.23.bb'
331511:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-rp_2.6.24.bb'
331523:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-rp_2.6.25+2.6.26-rc4.bb'
331535:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-rp_2.6.26.bb'
331598:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-sakoman_2.6.35.bb'
331610:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-sequoia_2.6.21.bb'
331622:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-sgh-i900_2.6.32.bb'
331634:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-smdk2440_2.6.20+git.bb'
331646:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-smdk2443_2.6.20+git.bb'
331658:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-storcenter_2.6.27.7.bb'
331670:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-sun4cdm_2.4.26.bb'
331682:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-sun4cdm_2.6.8.1.bb'
331694:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-titan-sh4_2.6.21.bb'
331706:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-tornado-omap2_2.6.16.16.bb'
331718:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-turbostation_2.6.20.2.bb'
331730:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-wrap-geode_2.6.17.bb'
331742:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-wrt_2.4.20.bb'
331754:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-wrt_2.4.30.bb'
331766:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-x86_2.6.17.9.bb'
331778:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-x86_2.6.20.bb'
331790:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-xilinx_git.bb'
331802:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-xilinx-ml507_git.bb'
331814:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-xilinx-slab_git.bb'
331826:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-xo_git.bb'
331838:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-xxs1500_2.4.21.bb'
331850:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-z_2.6.20.bb'
331862:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/linux-zigbee_git.bb'
331874:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/logicpd-pxa270_2.6.17-rc5.bb'
331886:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/logicpd-pxa270_2.6.19.2.bb'
331898:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/mainstone-kernel_2.6.11.bb'
331910:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/mainstone-kernel_2.6.18.bb'
331922:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/mnci-ramses_2.4.21-rmk2-pxa1.bb'
331934:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/mx21ads-kernel_2.6.19rc6.bb'
331946:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/netbook-pro-kernel_2.6.17.bb'
331958:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/openezx-kernel_git.bb'
331970:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/triton-kernel_2.6.11.bb'
331982:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/xanadux-ba-2.6_2.6.12.bb'
331994:KeyError: '/home/klaus/development/oe/openembedded/recipes/linux/xanadux-un-2.6_2.6.12.bb'
332217:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/lksctp-tools/lksctp-tools_1.0.7.bb'
332274:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/llvm/llvm-common.bb'
332631:KeyError: '/home/klaus/development/oe/openembedded/recipes/lockstat/lockstat_1.4.10.bb'
335069:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/lua/lua5.1_5.1.4.bb'
335504:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/lzip/lzip_1.11.bb'
335527:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/lzma/lzma_4.65.bb'
335550:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/lzo/lzo_1.08.bb'
335573:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/lzo/lzo2_2.03.bb'
337439:KeyError: '/home/klaus/development/oe/openembedded/recipes/maemo/nokia770-init_1.0.bb'
338642:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/makedevs/makedevs_1.0.0.bb'
338665:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/make/make_3.81.bb'
338688:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/make/make_3.82.bb'
338877:KeyError: '/home/klaus/development/oe/openembedded/recipes/mamona/cx3110x-770he_0.8.1.bb'
338889:KeyError: '/home/klaus/development/oe/openembedded/recipes/mamona/cx3110x-chinooke_2.0.15.bb'
338901:KeyError: '/home/klaus/development/oe/openembedded/recipes/mamona/cx3110x-diablo_2.0.15.bb'
339127:KeyError: '/home/klaus/development/oe/openembedded/recipes/mamona/uinput_2.6.21.bb'
342072:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/mcpp/mcpp_2.7.2.bb'
346303:KeyError: '/home/klaus/development/oe/openembedded/recipes/meta/slugos-packages.bb'
346492:KeyError: '/home/klaus/development/oe/openembedded/recipes/micro-evtd/micro-evtd_3.3.0.bb'
366364:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/mozilla/rhino_1.7r1.bb'
367371:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/mpfr/mpfr_3.0.0.bb'
367394:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/mpfr/mpfr-canadian_3.0.0.bb'
367417:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/mpfr/mpfr_svn.bb'
371120:KeyError: '/home/klaus/development/oe/openembedded/recipes/nasm/nasm_0.98.38.bb'
371149:KeyError: '/home/klaus/development/oe/openembedded/recipes/native/native-kernel.bb'
371349:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/ncurses/ncurses_5.4.bb'
371372:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/ncurses/ncurses_5.7.bb'
375825:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/nkf/nkf_2.07.bb'
375899:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/nodejs/nodejs_0.2.1.bb'
379863:KeyError: '/home/klaus/development/oe/openembedded/recipes/nslu2-binary-only/nslu2-linksys-firmware_2.3r63.bb'
379875:KeyError: '/home/klaus/development/oe/openembedded/recipes/nslu2-binary-only/nslu2-linksys-libs_2.3r63.bb'
379887:KeyError: '/home/klaus/development/oe/openembedded/recipes/nslu2-binary-only/nslu2-linksys-ramdisk_2.3r63.bb'
380527:KeyError: '/home/klaus/development/oe/openembedded/recipes/nvidia-drivers/nvidia-display_1.0-8756.bb'
380539:KeyError: '/home/klaus/development/oe/openembedded/recipes/nvidia-drivers/nvidia-display_190.42.bb'
380551:KeyError: '/home/klaus/development/oe/openembedded/recipes/nvidia-drivers/nvidia-nforce_1.0-0310.bb'
387531:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/c7x0-kernels-2.4-embedix.bb'
387543:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernel-24-8_2.4.18-rmk7-pxa3-embedix20030509.bb'
387555:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernel-32-0_2.4.18-rmk7-pxa3-embedix20030509.bb'
387567:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernel-32-32_2.4.18-rmk7-pxa3-embedix20030509.bb'
387579:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernel-40-24_2.4.18-rmk7-pxa3-embedix20030509.bb'
387591:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernel-48-16_2.4.18-rmk7-pxa3-embedix20030509.bb'
387603:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernel-58-6_2.4.18-rmk7-pxa3-embedix20030509.bb'
387615:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernel-58-6-debug_2.4.18-rmk7-pxa3-embedix20030509.bb'
387627:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernel-64-0_2.4.18-rmk7-pxa3-embedix20030509.bb'
387639:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/collie-kernels-2.4-embedix.bb'
387651:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/corgi-kernel-2.4-embedix.bb'
387663:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/husky-kernel-2.4-embedix.bb'
387727:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/opensimpad_2.4.25-vrs2-pxa1-jpm1.bb'
387739:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/opensimpad_2.4.27-vrs1-pxa1-jpm1.bb'
387751:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/opensimpad-64+0_2.4.25-vrs2-pxa1-jpm1.bb'
387763:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/opensimpad-64+0_2.4.27-vrs1-pxa1-jpm1.bb'
387775:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/openzaurus-pxa_2.4.18-rmk7-pxa3-embedix20031107.bb'
387787:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/openzaurus-pxa27x_2.4.20-rmk2-embedix20050602.bb'
387799:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/openzaurus-sa_2.4.18-rmk7-pxa3-embedix20030509.bb'
387811:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/poodle255-kernel-2.4-embedix.bb'
387823:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/poodle-kernel-2.4-embedix.bb'
387835:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/poodle-kernels-2.4-embedix.bb'
387847:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/linux/shepherd-kernel-2.4-embedix.bb'
388408:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/openmoko2/openmoko-alsa-scenarios_svn.bb'
389830:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/obsolete/pixman/pixman_0.17.6.bb'
389997:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/sharp-binary-only/sharp-camera-support_2.4.18-rmk7-pxa3-embedix.bb'
390009:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/sharp-binary-only/sharp-sdmmc-support.bb'
390021:KeyError: '/home/klaus/development/oe/openembedded/recipes/obsolete/shr/alsa-scenarii-shr_git.bb'
405734:KeyError: '/home/klaus/development/oe/openembedded/recipes/ogre/ogre-egl_svn.bb'
405997:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/omniorb/omniorb_4.1.4.bb'
409634:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/openjade/openjade_1.3.2.bb'
417517:KeyError: '/home/klaus/development/oe/openembedded/recipes/opie-camera/opie-camera_1.2.3.bb'
417529:KeyError: '/home/klaus/development/oe/openembedded/recipes/opie-camera/opie-camera_1.2.4.bb'
417541:KeyError: '/home/klaus/development/oe/openembedded/recipes/opie-camera/opie-camera_cvs.bb'
434976:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/opkg-utils/opkg-utils_svn.bb'
435101:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/orc/orc_0.4.3.bb'
435124:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/orc/orc_0.4.4.bb'
435147:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/orc/orc_0.4.5.bb'
435170:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/orc/orc_0.4.9.bb'
435552:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/oxnas-boot-tools/oxnas-boot-tools_0.1.bb'
436228:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/pango/pango_1.24.4.bb'
436251:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/pango/pango_1.28.3.bb'
436476:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/patchelf/patchelf_0.5.bb'
436619:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/pax-utils/pax-utils_0.1.13.bb'
436642:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/pax-utils/pax-utils_0.1.19.bb'
437096:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libalgorithm-diff-perl_1.1902.bb'
437119:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libarchive-tar-perl_1.30.bb'
437142:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libarchive-zip-perl_1.30.bb'
437201:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcache-cache-perl_1.06.bb'
437224:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libclass-container-perl_0.12.bb'
437247:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libclass-data-inheritable-perl_0.08.bb'
437270:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libclass-factory-util-perl_1.7.bb'
437293:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libclass-inspector-perl_1.24.bb'
437316:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libclass-methodmaker-perl_2.15.bb'
437339:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libclass-singleton-perl_1.4.bb'
437402:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcompress-zlib-perl_1.42.bb'
437425:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcompress-zlib-perl_2.015.bb'
437485:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libconvert-binhex-perl_1.119.bb'
437508:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb'
437531:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcrypt-openssl-random-perl_0.04.bb'
437554:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb'
437613:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcrypt-unixcrypt-perl_1.0.bb'
437636:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcurses-perl_1.28.bb'
437659:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libcurses-ui-perl_0.9607.bb'
437682:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdata-optlist-perl_0.101.bb'
437705:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdate-manip-perl_5.54.bb'
437728:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdatetime-format-builder-perl_0.80.bb'
437751:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdatetime-format-iso8601-perl_0.07.bb'
437774:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdatetime-format-strptime-perl_1.1000.bb'
437797:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdatetime-locale-perl_0.45.bb'
437820:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdatetime-perl_0.61.bb'
437843:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdatetime-timezone-perl_1.21.bb'
437984:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdb-file-perl_1.820.bb'
438007:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdbi-perl_1.607.bb'
438066:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdevel-stacktrace-perl_1.13.bb'
438089:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdevice-serialport-perl_1.04.bb'
438112:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdigest-hmac-perl_1.02.bb'
438135:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdigest-sha1-perl_2.11.bb'
438158:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libdigest-sha_5.47.bb'
438181:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libemail-date-format-perl_1.002.bb'
438204:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libencode-detect-perl_1.01.bb'
438227:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liberror-perl_0.17004.bb'
438250:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liberror-perl_0.17016.bb'
438273:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libexception-class-perl_1.23.bb'
438328:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libextutils-cbuilder-perl_0.18.bb'
438351:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libextutils-depends-perl_0.205.bb'
438374:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libextutils-parsexs-perl_2.16.bb'
438397:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libextutils-pkgconfig-perl_1.07.bb'
438420:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libfile-slurp-perl_9999.13.bb'
438443:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libfilesys-df-perl_0.92.bb'
438509:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libhtml-parser-perl_3.60.bb'
438532:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libhtml-parser-perl_3.64.bb'
438555:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libhtml-tagset-perl_3.20.bb'
438578:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libhtml-treebuilder-perl_3.23.bb'
438601:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libhttp-cache-transparent-perl_1.0.bb'
438624:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libimage-size-perl_3.230.bb'
438823:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libio-socket-inet6-perl_2.61.bb'
438846:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libio-socket-ssl-perl_1.32.bb'
438869:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libio-stringy-perl_2.110.bb'
438923:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libio-zlib-perl_1.04.bb'
438946:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libio-zlib-perl_1.10.bb'
438969:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libip-country-perl_2.27.bb'
438992:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libipc-sharelite-perl_0.09.bb'
439015:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liblingua-en-numbers-ordinate_1.02.bb'
439038:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liblinux-dvb-perl_1.0.bb'
439061:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liblist-moreutils-perl_0.22.bb'
439084:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liblocale-gettext-perl_1.05.bb'
439107:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liblog-dispatch-perl_2.13.bb'
439130:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liblog-log4perl-perl_1.06.bb'
439153:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libmail-dkim-perl_0.37.bb'
439207:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libmail-spf-perl_2.007.bb'
439230:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libmailtools-perl_2.06.bb'
439303:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libmime-lite-perl_3.024.bb'
439326:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libmime-tools-perl_5.427.bb'
439421:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libmodule-load-perl_0.16.bb'
439444:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libnetaddr-ip-perl_4.027.bb'
439467:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libnet-cidr-perl_0.13.bb'
439564:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libnet-dns-perl_0.66.bb'
439587:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb'
439610:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libnet-ident-perl_1.20.bb'
439633:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libnet-ip-perl_1.25.bb'
439656:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libnetpacket-perl_0.41.1.bb'
439783:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libnet-ssleay-perl_1.36.bb'
439806:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libole-storage-lite-perl_0.19.bb'
439829:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libparams-util-perl_0.20.bb'
439852:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libparams-validate-perl_0.95.bb'
439925:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libphp-serialization-perl_0.30.bb'
440046:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libsoap-lite-perl_0.712.bb'
440069:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libsocket6-perl_0.23.bb'
440092:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libsub-exporter-perl_0.970.bb'
440115:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libsub-install-perl_0.922.bb'
440138:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libsub-uplevel-perl_0.13.bb'
440161:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libsys-hostname-long-perl_1.4.bb'
440184:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libsys-mmap-perl_0.13.bb'
440207:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libtask-weaken-perl_1.03.bb'
440230:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libterm-progressbar-perl_2.09.bb'
440253:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libtermreadkey-perl_2.30.bb'
440348:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libtest-exception-perl_0.22.bb'
440457:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libtest-pod-perl_1.42.bb'
440480:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libtext-diff-perl_0.35.bb'
440503:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libtimedate-perl_1.20.bb'
440526:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libtree-dag-node-perl_1.06.bb'
440585:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libunicode-string-perl_2.09.bb'
440608:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libunicode-utf8simple-perl_1.06.bb'
440631:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/liburi-perl_1.55.bb'
440654:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libversion-perl_0.6701.bb'
440677:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libversion-perl_0.82.bb'
440700:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libwww-mechanize-perl_1.60.bb'
440723:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libwww-perl_5.834.bb'
440746:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libx10-perl_0.03.bb'
440769:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-dom-perl_1.44.bb'
440792:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-generator-perl_1.03.bb'
440815:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-libxml-perl_1.70.bb'
440838:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-namespacesupport-perl_1.11.bb'
440861:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb'
440884:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-regexp-perl_0.03.bb'
440907:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-sax-perl_0.96.bb'
440930:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-simple-perl_2.18.bb'
440953:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-twig-perl_3.35.bb'
440976:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-writer-perl_0.606.bb'
440999:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libxml-xpath-perl_1.13.bb'
441022:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/perl/libyaml-perl_0.62.bb'
448964:KeyError: '/home/klaus/development/oe/openembedded/recipes/pivotinit/pivotinit_1.0.0.bb'
449929:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/pngcrush/pngcrush_1.7.9.bb'
450397:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/popt/popt_1.14.bb'
450420:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/popt/popt_1.7.bb'
451507:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/postfix/postfix_2.0.20.bb'
451530:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/postfix/postfix_2.2.12.bb'
451553:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/postfix/postfix_2.7.0.bb'
452041:KeyError: '/home/klaus/development/oe/openembedded/recipes/powervr-drivers/bc-cube_0.1.0.bb'
452053:KeyError: '/home/klaus/development/oe/openembedded/recipes/powervr-drivers/bc-cube_0.2.0.bb'
452084:KeyError: '/home/klaus/development/oe/openembedded/recipes/powervr-drivers/libgles-omap3_3.01.00.02.bb'
452096:KeyError: '/home/klaus/development/oe/openembedded/recipes/powervr-drivers/libgles-omap3_3.01.00.06.bb'
452108:KeyError: '/home/klaus/development/oe/openembedded/recipes/powervr-drivers/libgles-omap3_3.01.00.07.bb'
452120:KeyError: '/home/klaus/development/oe/openembedded/recipes/powervr-drivers/libgles-omap3_4.00.00.01.bb'
465135:KeyError: '/home/klaus/development/oe/openembedded/recipes/progear/progear-ac_0.1.bb'
465147:KeyError: '/home/klaus/development/oe/openembedded/recipes/progear/progear-battery_0.3.bb'
468017:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-cheetah_2.0.1.bb'
468159:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-cython_0.13.bb'
468267:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-divmodepsilon_0.5.11.bb'
468324:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-docutils_0.5.bb'
468466:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-epydoc_3.0.1.bb'
468897:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-m2crypto_0.20.2.bb'
469232:KeyError: '/home/klaus/development/oe/openembedded/recipes/python/python-psyco_1.6.bb'
469970:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-pyrex_0.9.8.5.bb'
470282:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-scons_1.3.0.bb'
470322:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-setuptools_0.6c11.bb'
470345:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/python/python-setuptools_0.6c9.bb'
470998:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/qemu/qemu_0.12.5.bb'
471270:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/qmake/qmake2_2.10a.bb'
489672:KeyError: '/home/klaus/development/oe/openembedded/recipes/qt4/qt4-embedded-gles_4.6.0.bb'
489684:KeyError: '/home/klaus/development/oe/openembedded/recipes/qt4/qt4-embedded-gles_4.6.2.bb'
489696:KeyError: '/home/klaus/development/oe/openembedded/recipes/qt4/qt4-embedded-gles_4.6.3.bb'
492478:KeyError: '/home/klaus/development/oe/openembedded/recipes/qt4/qt4-x11-free-gles_4.5.2.bb'
492490:KeyError: '/home/klaus/development/oe/openembedded/recipes/qt4/qt4-x11-free-gles_4.6.0.bb'
492502:KeyError: '/home/klaus/development/oe/openembedded/recipes/qt4/qt4-x11-free-gles_4.6.2.bb'
492514:KeyError: '/home/klaus/development/oe/openembedded/recipes/qt4/qt4-x11-free-gles_4.6.3.bb'
492526:KeyError: '/home/klaus/development/oe/openembedded/recipes/qt4/qt4-x11-free-gles_4.7.0.bb'
494184:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/readline/readline_4.3.bb'
494207:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/readline/readline_5.2.bb'
494230:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/readline/readline_6.1.bb'
498167:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/ruby/ruby_1.8.7-p302.bb'
501541:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/sed/sed_4.1.1.bb'
501663:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/sed/sed_4.2.1.bb'
502009:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/servlet-api/servlet2.3_4.1.37.bb'
502398:KeyError: '/home/klaus/development/oe/openembedded/recipes/sgalib/sgalib_0.1.0.bb'
504275:KeyError: '/home/klaus/development/oe/openembedded/recipes/skype/skype_2.0.0.72.bb'
504287:KeyError: '/home/klaus/development/oe/openembedded/recipes/skype/skype-static_2.0.0.72.bb'
505713:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/sox/sox_13.0.0.bb'
506689:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/sqlite/sqlite_2.8.17.bb'
506712:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/sqlite/sqlite3_3.6.13.bb'
506735:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/sqlite/sqlite3_3.6.20.bb'
506758:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/sqlite/sqlite3_3.6.23.1.bb'
506781:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/squashfs-tools/squashfs-tools_4.0.bb'
508562:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/stat/stat_3.3.bb'
511348:KeyError: '/home/klaus/development/oe/openembedded/recipes/sun-jre/sun-jre6_1.6.0.10.bb'
512701:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/swig/swig_1.3.31.bb'
512724:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/swig/swig_1.3.38.bb'
512747:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/swig/swig_1.3.39.bb'
512770:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/swig/swig_2.0.0.bb'
513785:KeyError: '/home/klaus/development/oe/openembedded/recipes/sysconf/sysconf_0.1.bb'
514728:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/tar/tar_1.18.bb'
514751:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/tar/tar_1.20.bb'
514774:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/tar/tar_1.23.bb'
515058:KeyError: '/home/klaus/development/oe/openembedded/recipes/tasks/task-dvb.bb'
515648:KeyError: '/home/klaus/development/oe/openembedded/recipes/tasks/task-mythfront.bb'
516204:KeyError: '/home/klaus/development/oe/openembedded/recipes/tasks/task-slugos.bb'
516433:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/tcltk/tcl_8.5.8.bb'
516580:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/tcltk/tk_8.5.8.bb'
517446:KeyError: '/home/klaus/development/oe/openembedded/recipes/temper/temper_0.0.1.bb'
517521:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/termcap/termcap_1.3.1.bb'
517544:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/termcap/termcap_2.0.8.bb'
518333:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/am-benchmarks_svn.bb'
518610:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/matrix-gui_1.1.bb'
518622:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/matrix-gui_1.2.bb'
518634:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/matrix-gui-common_1.1.bb'
518646:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/matrix-gui-common_1.2.bb'
518658:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/matrix-gui-common_1.3.bb'
518670:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/matrix-gui-e_1.1.bb'
518682:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/matrix-gui-e_1.2.bb'
518739:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/time/time_1.7.bb'
519217:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/ti-audio-soc-example_1.00.00.02.bb'
519229:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/ti-biospsp_01.30.01.bb'
519258:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/ti-c6accel_1.00.00.04.bb'
519270:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/ti-c6accel_1.01.00.01.bb'
520669:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/ti-dmai_2.05.00.14.bb'
520717:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/ti-dmai_2.20.00.04.bb'
520729:KeyError: '/home/klaus/development/oe/openembedded/recipes/ti/ti-dmai_2.20.00.06.bb'
527832:KeyError: '/home/klaus/development/oe/openembedded/recipes/u-boot/u-boot_2010.03-psp04.00.00.05.bb'
528053:KeyError: '/home/klaus/development/oe/openembedded/recipes/u-boot/u-boot_2010.06-psp04.00.00.07.bb'
528065:KeyError: '/home/klaus/development/oe/openembedded/recipes/u-boot/u-boot-bug_svn.bb'
528535:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/u-boot/u-boot-mkimage_1.3.2.bb'
529057:KeyError: '/home/klaus/development/oe/openembedded/recipes/u-boot/u-boot-omap3pandora_git.bb'
529588:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/bfin-uclibc_svn.bb'
529652:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc_0.9.28.bb'
529664:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc_0.9.29.bb'
529676:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc_0.9.30.1.bb'
529688:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc_0.9.30.2.bb'
529700:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc_0.9.30.3.bb'
529712:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc_0.9.30.bb'
529724:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc_0.9.31.bb'
529736:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc_git.bb'
529748:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.28.bb'
529760:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.29.bb'
529772:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.30.1.bb'
529784:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.30.2.bb'
529796:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.30.3.bb'
529808:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.30.bb'
529820:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc-initial_0.9.31.bb'
529832:KeyError: '/home/klaus/development/oe/openembedded/recipes/uclibc/uclibc-initial_git.bb'
529872:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/udev/attr_2.4.44.bb'
530774:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/unifdef/unifdef_2.4.bb'
530947:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/unrar/unrar_3.9.9.bb'
530970:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/unzip/unzip_552.bb'
531382:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/update-rc.d/update-rc.d_0.7.bb'
531751:KeyError: '/home/klaus/development/oe/openembedded/recipes/upslug/upslug2_10.bb'
531763:KeyError: '/home/klaus/development/oe/openembedded/recipes/upslug/upslug2_11.bb'
531775:KeyError: '/home/klaus/development/oe/openembedded/recipes/upslug/upslug2_8.bb'
531787:KeyError: '/home/klaus/development/oe/openembedded/recipes/upslug/upslug2-native_11.bb'
531799:KeyError: '/home/klaus/development/oe/openembedded/recipes/upslug/upslug2-native_8.bb'
531811:KeyError: '/home/klaus/development/oe/openembedded/recipes/upslug/upslug-native_1.0.bb'
531823:KeyError: '/home/klaus/development/oe/openembedded/recipes/upslug/upslug-native_cvs.bb'
532647:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.13.1.bb'
532670:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.14.bb'
532693:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.15.bb'
532716:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.16.bb'
532739:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/util-linux-ng/util-linux-ng_2.17.bb'
533123:KeyError: '/home/klaus/development/oe/openembedded/recipes/v86d/v86d_0.1.9.bb'
533286:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/vala-dbus-binding-tool/vala-dbus-binding-tool_git.bb'
533326:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/vala/vala_0.11.0.1.bb'
533349:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/vala/vala_0.8.1.2.bb'
533372:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/vala/vala_0.9.3.2.bb'
533395:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/vala/vala_0.9.6.1.bb'
533407:KeyError: '/home/klaus/development/oe/openembedded/recipes/valgrind/valgrind_3.6.0.bb'
558082:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/which/which_2.17.bb'
558105:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/which/which_2.20.bb'
560480:KeyError: '/home/klaus/development/oe/openembedded/recipes/wrt/loader_0.04.bb'
563094:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xalan-j/xalan-j_2.7.1.bb'
563151:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xapian/xapian-core_1.0.13.bb'
563174:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xapian/xapian-core_1.0.14.bb'
563197:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xapian/xapian-core_1.0.5.bb'
563220:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xapian/xapian-core_1.0.7.bb'
563482:KeyError: '/home/klaus/development/oe/openembedded/recipes/xbmc/xbmc_svn.bb'
563660:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libpthread-stubs_0.1.bb'
563683:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb'
563706:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libpthread-stubs_0.3.bb'
563729:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libxcb_0.9.91.bb'
563752:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libxcb_0.9.92.bb'
563775:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libxcb_0.9.93.bb'
563798:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libxcb_1.0.bb'
563821:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libxcb_1.6.bb'
563844:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/libxcb_git.bb'
563901:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/xcb-proto_0.9.91.bb'
563924:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/xcb-proto_0.9.92.bb'
563947:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/xcb-proto_0.9.93.bb'
563996:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/xcb-proto_1.0.bb'
564019:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/xcb-proto_1.6.bb'
564042:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xcb/xcb-proto_git.bb'
564809:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xerces-j/xerces-j_2.9.1.bb'
567131:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/x-load/signgp.bb'
567160:KeyError: '/home/klaus/development/oe/openembedded/recipes/x-load/x-load-omap3pandora_git.bb'
567732:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xml-commons/jaxp1.3_1.3.04.bb'
567774:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xml-commons/xml-commons-resolver1.1_1.2.bb'
568571:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/bdftopcf_1.0.2.bb'
568594:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/bdftopcf_1.0.3.bb'
569417:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/mkfontdir_1.0.5.bb'
569440:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/mkfontdir_1.0.6.bb'
569463:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/mkfontscale_1.0.7.bb'
569486:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/mkfontscale_1.0.8.bb'
570857:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/xcursorgen_1.0.3.bb'
570880:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/xcursorgen_1.0.4.bb'
572146:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/xkbcomp_1.1.1.bb'
572169:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-app/xkbcomp_1.2.0.bb'
576113:KeyError: '/home/klaus/development/oe/openembedded/recipes/xorg-driver/xf86-input-vmmouse_12.6.10.bb'
576125:KeyError: '/home/klaus/development/oe/openembedded/recipes/xorg-driver/xf86-input-vmmouse_12.6.5.bb'
576846:KeyError: '/home/klaus/development/oe/openembedded/recipes/xorg-driver/xf86-video-geode_2.11.10.bb'
576858:KeyError: '/home/klaus/development/oe/openembedded/recipes/xorg-driver/xf86-video-geode_2.11.6.bb'
580635:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-font/font-util_1.1.1.bb'
580658:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-font/font-util_1.2.0.bb'
580783:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/diet-x11_1.1.5.bb'
580857:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libfontenc_1.0.5.bb'
580880:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libfontenc_1.1.0.bb'
580937:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libice_1.0.6.bb'
580960:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libice_1.0.7.bb'
581051:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libsm_1.1.1.bb'
581074:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libsm_1.2.0.bb'
581114:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libx11_1.1.5.bb'
581137:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libx11_1.3.2.bb'
581160:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libx11_1.3.6.bb'
581183:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libx11_1.3.99.903.bb'
581206:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libx11-trim_1.1.5.bb'
581229:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxau_1.0.5.bb'
581252:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxau_1.0.6.bb'
581360:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxcursor_1.1.10.bb'
581383:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxcursor_1.1.11.bb'
581440:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxdmcp_1.0.3.bb'
581463:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxdmcp_1.1.0.bb'
581520:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxext_1.1.1.bb'
581543:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxext_1.2.0.bb'
581566:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxfixes_4.0.4.bb'
581589:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxfixes_4.0.5.bb'
581612:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxfont_1.4.1.bb'
581635:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxfont_1.4.3.bb'
581777:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxkbfile_1.0.6.bb'
581800:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxkbfile_1.0.7.bb'
581959:KeyError: 'virtual:nativesdk:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxrandr_1.2.1.bb'
581982:KeyError: 'virtual:nativesdk:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxrandr_1.3.0.bb'
582005:KeyError: 'virtual:nativesdk:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxrandr_1.3.1.bb'
582028:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxrender_0.9.5.bb'
582051:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxrender_0.9.6.bb'
582142:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxt_1.0.7.bb'
582165:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/libxt_1.0.9.bb'
582375:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/pixman_0.12.0.bb'
582398:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/pixman_0.13.2.bb'
582421:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/pixman_0.16.2.bb'
582444:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/pixman_0.18.4.bb'
582467:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/pixman_0.20.0.bb'
582490:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/pixman_0.21.2.bb'
582513:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/pixman_0.9.6.bb'
582553:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/xtrans_1.2.5.bb'
582576:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-lib/xtrans_1.2.6.bb'
582630:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.0.bb'
582653:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/bigreqsproto_1.1.1.bb'
582897:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/fixesproto_4.1.1.bb'
582920:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/fixesproto_4.1.2.bb'
582943:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/fontcacheproto_0.1.3.bb'
582966:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/fontsproto_2.1.0.bb'
582989:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/fontsproto_2.1.1.bb'
583095:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/inputproto_2.0.1.bb'
583118:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/inputproto_2.0.bb'
583141:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/kbproto_1.0.4.bb'
583164:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/kbproto_1.0.5.bb'
583218:KeyError: 'virtual:sdk:/home/klaus/development/oe/openembedded/recipes/xorg-proto/randrproto_1.2.1.bb'
583241:KeyError: 'virtual:sdk:/home/klaus/development/oe/openembedded/recipes/xorg-proto/randrproto_1.3.1.bb'
583264:KeyError: 'virtual:sdk:/home/klaus/development/oe/openembedded/recipes/xorg-proto/randrproto_1.3.2.bb'
583352:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/renderproto_0.11.1.bb'
583375:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/renderproto_0.11.bb'
583607:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.0.bb'
583630:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xcmiscproto_1.2.1.bb'
583653:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xextproto_7.0.5.bb'
583676:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xextproto-70-includes_7.0.5.bb'
583699:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xextproto_7.1.1.bb'
583722:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xextproto_7.1.2.bb'
583745:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xf86bigfontproto_1.2.0.bb'
583933:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xproto_7.0.16.bb'
583956:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-proto/xproto_7.0.19.bb'
584079:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-util/makedepend_1.0.2.bb'
584102:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-util/makedepend_1.0.3.bb'
584125:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-util/util-macros_1.11.0.bb'
584148:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xorg-util/util-macros_1.3.0.bb'
585462:KeyError: '/home/klaus/development/oe/openembedded/recipes/xorg-xserver/xserver-kdrive-glamo_1.3.0.0+git.bb'
585474:KeyError: '/home/klaus/development/oe/openembedded/recipes/xorg-xserver/xserver-kdrive-imageon_1.2.0.bb'
585486:KeyError: '/home/klaus/development/oe/openembedded/recipes/xorg-xserver/xserver-kdrive-nomadik_1.3.0.0.bb'
585498:KeyError: '/home/klaus/development/oe/openembedded/recipes/xorg-xserver/xserver-kdrive-xomap_1.1.99.3.bb'
587989:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xz/xz_4.999.9beta.bb'
588012:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/xz/xz_git.bb'
588035:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/yaffs2/yaffs2-utils_cvs.bb'
588058:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/yasm/yasm_0.7.2.bb'
588275:KeyError: '/home/klaus/development/oe/openembedded/recipes/zaurus-utils/encdec-updater.bb'
588287:KeyError: '/home/klaus/development/oe/openembedded/recipes/zaurus-utils/nandlogical_1.0.0.bb'
588299:KeyError: '/home/klaus/development/oe/openembedded/recipes/zaurus-utils/nandlogical-klibc_1.0.0.bb'
588311:KeyError: '/home/klaus/development/oe/openembedded/recipes/zaurus-utils/zaurus-installer.bb'
588323:KeyError: '/home/klaus/development/oe/openembedded/recipes/zaurus-utils/zaurus-legacy-tar.bb'
588335:KeyError: '/home/klaus/development/oe/openembedded/recipes/zaurus-utils/zaurus-updater.bb'
588749:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/zip/zip_2.32.bb'
588812:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/zlib/zlib_1.2.3.bb'
588835:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/zlib/zlib_1.2.5.bb'
589429:KeyError: 'virtual:native:/home/klaus/development/oe/openembedded/recipes/zziplib/zziplib_0.13.59.bb'
505:ERROR: '/home/klaus/development/oe/openembedded/recipes/agg/agg-minimal_2.5.bb' failed
893:ERROR: '/home/klaus/development/oe/openembedded/recipes/alsa/alsa-scenario_git.bb' failed
3642:ERROR: '/home/klaus/development/oe/openembedded/recipes/asterisk/asterisk_1.2.24.bb' failed
3709:ERROR: '/home/klaus/development/oe/openembedded/recipes/asterisk/asterisk_1.2.28.bb' failed
4788:ERROR: '/home/klaus/development/oe/openembedded/recipes/asterisk/asterisk_1.6.0-beta8.bb' failed
4845:ERROR: '/home/klaus/development/oe/openembedded/recipes/asterisk/asterisk-addons_1.6.0-beta2.bb' failed
6253:ERROR: '/home/klaus/development/oe/openembedded/recipes/asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb' failed
6327:ERROR: '/home/klaus/development/oe/openembedded/recipes/asterisk/asterisk-moh-freeplay-g729_0.0.0.bb' failed
6414:ERROR: '/home/klaus/development/oe/openembedded/recipes/asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb' failed
6613:ERROR: '/home/klaus/development/oe/openembedded/recipes/asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb' failed
11179:ERROR: '/home/klaus/development/oe/openembedded/recipes/binutils/mingw-binutils_2.20.bb' failed
11264:ERROR: '/home/klaus/development/oe/openembedded/recipes/binutils/mingw-binutils-canadian-cross_2.20.bb' failed
12533:ERROR: '/home/klaus/development/oe/openembedded/recipes/bluez/bluez-gnome_cvs.bb' failed
13130:ERROR: '/home/klaus/development/oe/openembedded/recipes/bmon/bmon_2.1.0.bb' failed
13609:ERROR: '/home/klaus/development/oe/openembedded/recipes/bootmenu/bootmenu_0.6.bb' failed
16784:ERROR: '/home/klaus/development/oe/openembedded/recipes/cdtool/cdtool_2.1.8.bb' failed
17933:ERROR: '/home/klaus/development/oe/openembedded/recipes/chillispot/chillispot_0.98.bb' failed
17968:ERROR: '/home/klaus/development/oe/openembedded/recipes/chillispot/chillispot_1.0RC3.bb' failed
59266:ERROR: '/home/klaus/development/oe/openembedded/recipes/chromium/chromium_svn.bb' failed
61625:ERROR: '/home/klaus/development/oe/openembedded/recipes/clearsilver/clearsilver_0.10.3.bb' failed
63076:ERROR: '/home/klaus/development/oe/openembedded/recipes/cpusage/cpusage_0.1.bb' failed
63621:ERROR: '/home/klaus/development/oe/openembedded/recipes/cumulus/cumulus_cvs.bb' failed
63962:ERROR: '/home/klaus/development/oe/openembedded/recipes/cxcrypt/cxcrypt_1.0.bb' failed
64226:ERROR: '/home/klaus/development/oe/openembedded/recipes/dash/dash_0.5.5.1.bb' failed
64274:ERROR: '/home/klaus/development/oe/openembedded/recipes/dasher/dasher-gpe_0.0-svn.bb' failed
65154:ERROR: '/home/klaus/development/oe/openembedded/recipes/dcetest/dcetest.bb' failed
66194:ERROR: '/home/klaus/development/oe/openembedded/recipes/debianutils/debianutils_2.19.bb' failed
66527:ERROR: '/home/klaus/development/oe/openembedded/recipes/detect-stylus/detect-stylus_svn.bb' failed
66696:ERROR: '/home/klaus/development/oe/openembedded/recipes/devicekit/devicekit-power_009.bb' failed
67174:ERROR: '/home/klaus/development/oe/openembedded/recipes/dgen/dgen-sdl_1.23.bb' failed
67225:ERROR: '/home/klaus/development/oe/openembedded/recipes/dhcdbd/dhcdbd_1.14.bb' failed
67992:ERROR: '/home/klaus/development/oe/openembedded/recipes/dialog/dialog_1.0-20050306.bb' failed
68440:ERROR: '/home/klaus/development/oe/openembedded/recipes/dircproxy/dircproxy_1.1.0.bb' failed
68848:ERROR: '/home/klaus/development/oe/openembedded/recipes/disko/disko_1.6.0.bb' failed
70774:ERROR: '/home/klaus/development/oe/openembedded/recipes/dtc/dtc_20070216.bb' failed
70925:ERROR: '/home/klaus/development/oe/openembedded/recipes/dtc/dtc-native_20070216.bb' failed
130741:ERROR: '/home/klaus/development/oe/openembedded/recipes/ekg/ekg_1.6.bb' failed
137189:ERROR: '/home/klaus/development/oe/openembedded/recipes/emelfm2/emelfm2_0.0.8.bb' failed
140605:ERROR: '/home/klaus/development/oe/openembedded/recipes/esc/esc-gst_6.bb' failed
140672:ERROR: '/home/klaus/development/oe/openembedded/recipes/esc/esc-media_4.bb' failed
140739:ERROR: '/home/klaus/development/oe/openembedded/recipes/esc/esc-media_5.bb' failed
141417:ERROR: '/home/klaus/development/oe/openembedded/recipes/exmap-console/exmap-console_svn.bb' failed
143346:ERROR: '/home/klaus/development/oe/openembedded/recipes/fbreader/fbreader_0.12.1.bb' failed
145701:ERROR: '/home/klaus/development/oe/openembedded/recipes/fltk/fltk_1.1.4.bb' failed
146458:ERROR: '/home/klaus/development/oe/openembedded/recipes/fpdf/fpdf_1.53.bb' failed
148998:ERROR: '/home/klaus/development/oe/openembedded/recipes/frotz/frotz_2.42.bb' failed
253530:ERROR: '/home/klaus/development/oe/openembedded/recipes/geode-drivers/geode-accessbus5536_2.6.11.bb' failed
253592:ERROR: '/home/klaus/development/oe/openembedded/recipes/geode-drivers/geode-aeslx_2.6.11.bb' failed
253654:ERROR: '/home/klaus/development/oe/openembedded/recipes/geode-drivers/geode-alsa5536_2.6.11.bb' failed
271141:ERROR: '/home/klaus/development/oe/openembedded/recipes/gnet/gnet_cvs.bb' failed
271753:ERROR: '/home/klaus/development/oe/openembedded/recipes/gnome/gnome-games_2.30.2.bb' failed
272465:ERROR: '/home/klaus/development/oe/openembedded/recipes/gnome/libbacon_svn.bb' failed
274867:ERROR: '/home/klaus/development/oe/openembedded/recipes/gomunicator/gomunicator_cvs.bb' failed
275557:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-autostarter/gpe-autostarter_svn.bb' failed
276601:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-clock/gpe-clock_svn.bb' failed
277241:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-edit/gpe-edit_svn.bb' failed
278736:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-ownerinfo/gpe-ownerinfo_svn.bb' failed
279416:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-su/gpe-su_svn.bb' failed
280425:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-todo/gpe-todo_svn.bb' failed
280507:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-what/gpe-what_0.30.bb' failed
280558:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-what/gpe-what_0.31.bb' failed
280609:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpe-what/gpe-what_0.33.bb' failed
281400:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpsbabel/gpsbabel_1.3.6.bb' failed
281816:ERROR: '/home/klaus/development/oe/openembedded/recipes/gpsdrive/gpsdrive-pda_2.10pre2.bb' failed
287500:ERROR: '/home/klaus/development/oe/openembedded/recipes/gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb' failed
291407:ERROR: '/home/klaus/development/oe/openembedded/recipes/gtkhtml/gtkhtml-2.0_2.6.3.bb' failed
293047:ERROR: '/home/klaus/development/oe/openembedded/recipes/gtk-theme-torturer/gtk-theme-torturer_git.bb' failed
294152:ERROR: '/home/klaus/development/oe/openembedded/recipes/hal/hal_git.bb' failed
294749:ERROR: '/home/klaus/development/oe/openembedded/recipes/hibernate-script/hibernate-script_1.12.bb' failed
294863:ERROR: '/home/klaus/development/oe/openembedded/recipes/horizon/horizon_cvs.bb' failed
295297:ERROR: '/home/klaus/development/oe/openembedded/recipes/hotplug-qcop/hotplug-qcop_cvs.bb' failed
295348:ERROR: '/home/klaus/development/oe/openembedded/recipes/howl/howl_0.9.7.bb' failed
296560:ERROR: '/home/klaus/development/oe/openembedded/recipes/hvsc/hvsc_45.bb' failed
296954:ERROR: '/home/klaus/development/oe/openembedded/recipes/ica/ica-bin_8.0.bb' failed
298313:ERROR: '/home/klaus/development/oe/openembedded/recipes/icedtea/icedtea6-native_1.8.bb' failed
302730:ERROR: '/home/klaus/development/oe/openembedded/recipes/inkspill/inkspill_0.1.bb' failed
305305:ERROR: '/home/klaus/development/oe/openembedded/recipes/irssi/xirssi_cvs.bb' failed
305509:ERROR: '/home/klaus/development/oe/openembedded/recipes/ixp4xx/ixp4xx-npe-native_2.1.bb' failed
307955:ERROR: '/home/klaus/development/oe/openembedded/recipes/juce/juce_1.29.bb' failed
310310:ERROR: '/home/klaus/development/oe/openembedded/recipes/kanjipad/kanjipad_svn.bb' failed
311332:ERROR: '/home/klaus/development/oe/openembedded/recipes/kismet/kismet_2007-10-R1.bb' failed
311397:ERROR: '/home/klaus/development/oe/openembedded/recipes/kismet/kismet-newcore_svn.bb' failed
311445:ERROR: '/home/klaus/development/oe/openembedded/recipes/kismet/kismet_svn.bb' failed
311698:ERROR: '/home/klaus/development/oe/openembedded/recipes/konqueror/konqueror-embedded_20060404.bb' failed
313795:ERROR: '/home/klaus/development/oe/openembedded/recipes/libcontactsdb/libcontactsdb_cvs.bb' failed
314121:ERROR: '/home/klaus/development/oe/openembedded/recipes/libdessert/libdessert_0.86.14.bb' failed
314681:ERROR: '/home/klaus/development/oe/openembedded/recipes/libeina/libeina_0.96.5.bb' failed
316609:ERROR: '/home/klaus/development/oe/openembedded/recipes/libgdbus/libgdbus_git.bb' failed
318312:ERROR: '/home/klaus/development/oe/openembedded/recipes/libgsasl/libgsasl_1.4.0.bb' failed
319618:ERROR: '/home/klaus/development/oe/openembedded/recipes/libmailwrapper/libmailwrapper_cvs.bb' failed
319745:ERROR: '/home/klaus/development/oe/openembedded/recipes/libmatthew/libmatthew_0.7.bb' failed
321460:ERROR: '/home/klaus/development/oe/openembedded/recipes/libopie/libopie2_cvs.bb' failed
321575:ERROR: '/home/klaus/development/oe/openembedded/recipes/libopieobex/libopieobex0_cvs.bb' failed
321690:ERROR: '/home/klaus/development/oe/openembedded/recipes/libopietooth/libopietooth1_cvs.bb' failed
322058:ERROR: '/home/klaus/development/oe/openembedded/recipes/libqanava/libqanava_0.0.7.bb' failed
322187:ERROR: '/home/klaus/development/oe/openembedded/recipes/libqpe/libqpe-opie_cvs.bb' failed
322302:ERROR: '/home/klaus/development/oe/openembedded/recipes/libqtaux/libqtaux2_cvs.bb' failed
324066:ERROR: '/home/klaus/development/oe/openembedded/recipes/libspf2/libspf2_1.2.9.bb' failed
324204:ERROR: '/home/klaus/development/oe/openembedded/recipes/libsvdrp/libsvdrp_hg.bb' failed
326627:ERROR: '/home/klaus/development/oe/openembedded/recipes/libxsettings/libxsettings_svn.bb' failed
332177:ERROR: '/home/klaus/development/oe/openembedded/recipes/litestream/litestream_1.3RC3.bb' failed
332867:ERROR: '/home/klaus/development/oe/openembedded/recipes/logrotate-script/logrotate-script_cvs.bb' failed
335243:ERROR: '/home/klaus/development/oe/openembedded/recipes/lvm2/lvm2_2.02.75.bb' failed
336564:ERROR: '/home/klaus/development/oe/openembedded/recipes/madwifi/madwifi-ng_r3878-20081204.bb' failed
338342:ERROR: '/home/klaus/development/oe/openembedded/recipes/mailx/mailx_8.1.2-0.20020411cvs.bb' failed
338567:ERROR: '/home/klaus/development/oe/openembedded/recipes/mailx/mailx_8.1.2-0.20040524cvs.bb' failed
338808:ERROR: '/home/klaus/development/oe/openembedded/recipes/makeself/makeself-native_cvs.bb' failed
339381:ERROR: '/home/klaus/development/oe/openembedded/recipes/maradns/maradns_1.0.39.bb' failed
340030:ERROR: '/home/klaus/development/oe/openembedded/recipes/matchbox-applet-tasks/mb-applet-tasks_1.0.0.bb' failed
340824:ERROR: '/home/klaus/development/oe/openembedded/recipes/matchbox-panel/matchbox-panel_svn.bb' failed
341004:ERROR: '/home/klaus/development/oe/openembedded/recipes/matchbox-themes-extra/matchbox-theme-sato_svn.bb' failed
341443:ERROR: '/home/klaus/development/oe/openembedded/recipes/mathomatic/mathomatic_12.4.2.bb' failed
341495:ERROR: '/home/klaus/development/oe/openembedded/recipes/mathomatic/mathomatic_unstable.bb' failed
341581:ERROR: '/home/klaus/development/oe/openembedded/recipes/maxima/maxima_5.21.1.bb' failed
346752:ERROR: '/home/klaus/development/oe/openembedded/recipes/microwindows/microwindows-snapshot.bb' failed
348203:ERROR: '/home/klaus/development/oe/openembedded/recipes/minipredict/dictionary_en-GB.bb' failed
348546:ERROR: '/home/klaus/development/oe/openembedded/recipes/misc-binary-only/tda1004x-firmware.bb' failed
349638:ERROR: '/home/klaus/development/oe/openembedded/recipes/modphp/modphp_5.1.6.bb' failed
368053:ERROR: '/home/klaus/development/oe/openembedded/recipes/mplayer/mplayer-maemo_svn.bb' failed
369159:ERROR: '/home/klaus/development/oe/openembedded/recipes/murasaki/murasaki_0.8.8.bb' failed
369397:ERROR: '/home/klaus/development/oe/openembedded/recipes/musicpd/gmpc_svn.bb' failed
370489:ERROR: '/home/klaus/development/oe/openembedded/recipes/mux/mux_git.bb' failed
372044:ERROR: '/home/klaus/development/oe/openembedded/recipes/netpipes/netpipes_4.2.bb' failed
375047:ERROR: '/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-app-photoalbum_git.bb' failed
375119:ERROR: '/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-app-vplayer_git.bb' failed
375191:ERROR: '/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-lib-gui_git.bb' failed
375263:ERROR: '/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-lib-widgets_git.bb' failed
375335:ERROR: '/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-mainmenu_git.bb' failed
375407:ERROR: '/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-nwm_git.bb' failed
375479:ERROR: '/home/klaus/development/oe/openembedded/recipes/neuros-public/neuros-qt-plugins_git.bb' failed
375751:ERROR: '/home/klaus/development/oe/openembedded/recipes/nis/ypbind-mt_1.18.bb' failed
376273:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/bogl/bogl-utils-native_0.1.9.bb' failed
376535:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/bogl/libbogl_0.1.9.bb' failed
376704:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/freenx/nxagent_1.5.0-90.bb' failed
376771:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/freenx/nxcomp_1.5.0-65.bb' failed
376821:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/freenx/nxcompext_1.5.0-16.bb' failed
376871:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/freenx/nxdesktop_1.5.0-61.bb' failed
377006:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/freenx/nxssh_1.5.0-21.bb' failed
377073:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/freenx/nxviewer_1.5.0-14.bb' failed
377123:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/freenx/nxwin_1.5.0-3.bb' failed
377173:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/freenx/nx-X11_1.5.0-15.bb' failed
377681:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/imkit/imkit_0.4.5.bb' failed
377740:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/kde/arts_1.2.2.bb' failed
377791:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/libbtctl/libbtctl_0.4.1.bb' failed
378306:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/mISDN/misdn_cvs.bb' failed
378371:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/nylon/simple-firewall.bb' failed
378569:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/opie-dagger/opie-dagger_cvs.bb' failed
378652:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/opie-dasher/opie-dasher_cvs.bb' failed
378699:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/opie-mediaplayer1-libmpeg3plugin/opie-mediaplayer1-libmpeg3plugin_cvs.bb' failed
378781:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/python/python-itools_0.50.1.bb' failed
378951:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/remind/remind_03.00.22.bb' failed
378986:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/r/r_1.9.1.bb' failed
379257:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/unionfs/unionfs-modules_1.0.13.bb' failed
379512:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/unison/unison_2.9.1.bb' failed
379611:ERROR: '/home/klaus/development/oe/openembedded/recipes/nonworking/zethereal/zethereal_1.0.0.bb' failed
379938:ERROR: '/home/klaus/development/oe/openembedded/recipes/ntfs-3g/ntfs-3g_1.0.bb' failed
381639:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/didiwiki/didiwiki_0.2.bb' failed
381690:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/didiwiki/didiwiki_0.4.bb' failed
381738:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/e17/bubble-keyboard_svn.bb' failed
381803:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/e17/edje-player_svn.bb' failed
381868:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/e17/essential-dialer_svn.bb' failed
381933:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/e17/gridpad_svn.bb' failed
381981:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/e17/intuition_svn.bb' failed
384002:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/efl1/libefso_svn.bb' failed
384209:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gaim/gaim_1.0.3.bb' failed
384260:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gaim/gaim_1.1.0.bb' failed
384311:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gaim/gaim_1.1.1.bb' failed
384362:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gaim/gaim_1.1.2.bb' failed
384413:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gaim/gaim_1.4.0.bb' failed
384463:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gaim/gaim_2.0.0-cvs-mco1.bb' failed
384570:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gimp/gimp_2.2.10.bb' failed
384626:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gimp/gimp_2.3.7.bb' failed
384661:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/addressbook_0.1.bb' failed
384709:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/addressbook_svn.bb' failed
384757:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/almmgrd_svn.bb' failed
384792:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/audioplayer_1.0.bb' failed
384857:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/calendar2_svn.bb' failed
384956:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/dialer_svn.bb' failed
385004:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/firewall_svn.bb' failed
385137:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/gpe-applauncher_svn.bb' failed
385240:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libabenabler_0.1.bb' failed
385322:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libabenabler2_svn.bb' failed
385370:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libabenabler_svn.bb' failed
385418:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libalmmgr_svn.bb' failed
385505:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libgemwidget_0.1.bb' failed
385571:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libgemwidget_svn.bb' failed
385655:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libgpephone_svn.bb' failed
385690:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libiac_0.1.bb' failed
385755:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libiac2_svn.bb' failed
385854:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libim2_svn.bb' failed
385919:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/liblipsevent2_svn.bb' failed
385984:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libmsgenabler2_svn.bb' failed
386032:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libmsgenabler_svn.bb' failed
386067:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/librecord_0.1.bb' failed
386149:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/librecord2_svn.bb' failed
386214:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libsettings_svn.bb' failed
386262:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libtapi_svn.bb' failed
386327:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/libvoc_svn.bb' failed
386392:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/machined_svn.bb' failed
386474:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/ptim-engine_svn.bb' failed
386539:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/ptim-headers_svn.bb' failed
386604:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/ptim-helper_svn.bb' failed
386669:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/ptim-manager_svn.bb' failed
386717:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/quickdial_svn.bb' failed
386816:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gpephone/useen_svn.bb' failed
386936:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gtk-webcore/midori_0.0.10.bb' failed
386971:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gtk-webcore/midori_0.0.11.bb' failed
387006:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gtk-webcore/midori_0.0.12.bb' failed
387041:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gtk-webcore/midori_0.0.13.bb' failed
387076:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gtk-webcore/midori_0.0.15.bb' failed
387111:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gtk-webcore/midori_0.0.17.bb' failed
387163:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/gtk-webcore/midori_0.0.8.bb' failed
388096:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/olsr/olsrd_0.4.8.bb' failed
388147:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/olsr/olsrd_0.4.9.bb' failed
389116:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/openmoko-3rdparty/babiloo-efl_2.0.9-3.bb' failed
390656:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/xmame/xmame_0.86.bb' failed
390704:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/xmame/xmame_0.87.bb' failed
390752:ERROR: '/home/klaus/development/oe/openembedded/recipes/obsolete/xmame/xmame_0.95.bb' failed
404518:ERROR: '/home/klaus/development/oe/openembedded/recipes/octave/octave_2.9.19.bb' failed
406103:ERROR: '/home/klaus/development/oe/openembedded/recipes/openal/openal_0.0.8.bb' failed
409538:ERROR: '/home/klaus/development/oe/openembedded/recipes/openh323/openh323_1.13.5.4.bb' failed
409756:ERROR: '/home/klaus/development/oe/openembedded/recipes/openjdk/openjdk-6_6b18-1.8.bb' failed
410418:ERROR: '/home/klaus/development/oe/openembedded/recipes/openmoko-3rdparty/babiloo-efl_bzr.bb' failed
410617:ERROR: '/home/klaus/development/oe/openembedded/recipes/openmoko-3rdparty/epiano_0.3.1.bb' failed
410877:ERROR: '/home/klaus/development/oe/openembedded/recipes/openmoko-3rdparty/mcnavi_0.2.13.bb' failed
410930:ERROR: '/home/klaus/development/oe/openembedded/recipes/openmoko-3rdparty/mcnavi_0.2.5.bb' failed
412510:ERROR: '/home/klaus/development/oe/openembedded/recipes/openmoko-projects/tichy_git.bb' failed
412967:ERROR: '/home/klaus/development/oe/openembedded/recipes/openocd/openocd-native_svn.bb' failed
413015:ERROR: '/home/klaus/development/oe/openembedded/recipes/openocd/openocd_svn.bb' failed
414402:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/libopensync_0.22.bb' failed
414470:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-evo2-sync_0.22.bb' failed
414552:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-file_0.18.bb' failed
414620:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-file-sync_0.22.bb' failed
414702:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-gpe_0.18.bb' failed
414750:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-irmc_0.18.bb' failed
414818:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-irmc-sync_0.22.bb' failed
414900:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/libopensync-plugin-syncml-client-plugin_0.1.bb' failed
415070:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/msynctool_0.22.bb' failed
415135:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/msynctool_svn.bb' failed
415203:ERROR: '/home/klaus/development/oe/openembedded/recipes/opensync/syncml-client_0.1.bb' failed
415583:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-aboutapplet/opie-aboutapplet_cvs.bb' failed
415698:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-addressbook/opie-addressbook_cvs.bb' failed
415813:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-advancedfm/opie-advancedfm_cvs.bb' failed
415899:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-alarm/opie-alarm_cvs.bb' failed
416014:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-appearance/opie-appearance_cvs.bb' failed
416100:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-aqpkg/opie-aqpkg_cvs.bb' failed
416215:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-autorotateapplet/opie-autorotateapplet_cvs.bb' failed
416301:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-backgammon/opie-backgammon_cvs.bb' failed
416416:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-backup/opie-backup_cvs.bb' failed
416533:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-bartender/opie-bartender_cvs.bb' failed
416648:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-batteryapplet/opie-batteryapplet_cvs.bb' failed
416734:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-bluepin/opie-bluepin_cvs.bb' failed
416873:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-bluetoothapplet/opie-bluetoothapplet_cvs.bb' failed
416988:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-bluetoothmanager/opie-bluetoothmanager_cvs.bb' failed
417074:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-bounce/opie-bounce_cvs.bb' failed
417189:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-brightnessapplet/opie-brightnessapplet_cvs.bb' failed
417304:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-button-settings/opie-button-settings_cvs.bb' failed
417419:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-buzzword/opie-buzzword_cvs.bb' failed
417505:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-calculator/opie-calculator_cvs.bb' failed
417609:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-cardapplet/opie-cardapplet_cvs.bb' failed
417691:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-cardmon/opie-cardmon_cvs.bb' failed
417806:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-checkbook/opie-checkbook_cvs.bb' failed
417923:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-citytime/opie-citytime_cvs.bb' failed
418009:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-clipboardapplet/opie-clipboardapplet_cvs.bb' failed
418095:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-clockapplet/opie-clockapplet_cvs.bb' failed
418210:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-clock/opie-clock_cvs.bb' failed
418325:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-confeditor/opie-confeditor_cvs.bb' failed
418444:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-console/opie-console_cvs.bb' failed
418559:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-datebook-birthdayplugin/opie-datebook-birthdayplugin_cvs.bb' failed
418674:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-datebook-chrisholidayplugin/opie-datebook-chrisholidayplugin_cvs.bb' failed
418813:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-datebook-nationalholidayplugin/opie-datebook-nationalholidayplugin_cvs.bb' failed
418930:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-datebook/opie-datebook_cvs.bb' failed
419045:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-deco-flat/opie-deco-flat_cvs.bb' failed
419131:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-deco-liquid/opie-deco-liquid_cvs.bb' failed
419246:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-deco-polished/opie-deco-polished_cvs.bb' failed
419361:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-doctab/opie-doctab_cvs.bb' failed
419447:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-drawpad/opie-drawpad_cvs.bb' failed
419600:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-dvorak/opie-dvorak_cvs.bb' failed
419717:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-embeddedkonsole/opie-embeddedkonsole_cvs.bb' failed
419846:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-euroconv/opie-euroconv_cvs.bb' failed
419932:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-examples/opie-examples_cvs.bb' failed
420018:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-examples-python/opie-examples-python_cvs.bb' failed
420133:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-eye/opie-eye_cvs.bb' failed
420219:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-fifteen/opie-fifteen_cvs.bb' failed
420334:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-formatter/opie-formatter_cvs.bb' failed
420449:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-freetype/opie-freetype_cvs.bb' failed
420535:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-ftplib/opie-ftplib_cvs.bb' failed
420650:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-ftp/opie-ftp_cvs.bb' failed
420736:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-go/opie-go_cvs.bb' failed
420822:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-gutenbrowser/opie-gutenbrowser_cvs.bb' failed
420908:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-handwriting/opie-handwriting_cvs.bb' failed
420994:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-helpbrowser/opie-helpbrowser_cvs.bb' failed
421041:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-help-en/opie-help-en_1.2.3.bb' failed
421087:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-help-en/opie-help-en_1.2.4.bb' failed
421139:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-help-en/opie-help-en_cvs.bb' failed
421254:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-homeapplet/opie-homeapplet_cvs.bb' failed
421731:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-i18n/opie-i18n_cvs.bb' failed
421926:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-i18n/opie-lrelease-native_cvs.bb' failed
422069:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-i18n/opie-lupdate-native_cvs.bb' failed
422250:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-irc/opie-irc_cvs.bb' failed
422365:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-irdaapplet/opie-irdaapplet_cvs.bb' failed
422480:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-jumpx/opie-jumpx_cvs.bb' failed
422595:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-kbill/opie-kbill_cvs.bb' failed
422710:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-kcheckers/opie-kcheckers_cvs.bb' failed
422825:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-keyboard/opie-keyboard_cvs.bb' failed
422911:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-keypebble/opie-keypebble_cvs.bb' failed
422998:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-keytabs/opie-keytabs_cvs.bb' failed
423084:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-keyview/opie-keyview_cvs.bb' failed
423199:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-kjumpx/opie-kjumpx_cvs.bb' failed
423314:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-kpacman/opie-kpacman_cvs.bb' failed
423400:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-language/opie-language_cvs.bb' failed
423486:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-launcher-settings/opie-launcher-settings_cvs.bb' failed
423572:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-libqrsync/opie-libqrsync_cvs.bb' failed
423687:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-light-and-power/opie-light-and-power_cvs.bb' failed
423773:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-lockapplet/opie-lockapplet_cvs.bb' failed
423859:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-login/opie-login_cvs.bb' failed
423974:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-logoutapplet/opie-logoutapplet_cvs.bb' failed
424089:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mailapplet/opie-mailapplet_cvs.bb' failed
424206:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mail/opie-mail_cvs.bb' failed
424292:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer1-libmadplugin/opie-mediaplayer1-libmadplugin_cvs.bb' failed
424383:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer1-libmodplugin/opie-mediaplayer1-libmodplugin_cvs.bb' failed
424474:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer1-libtremorplugin/opie-mediaplayer1-libtremorplugin_cvs.bb' failed
424560:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer1-libwavplugin/opie-mediaplayer1-libwavplugin_cvs.bb' failed
424690:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer1/opie-mediaplayer1-core_cvs.bb' failed
424827:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer2/opie-mediaplayer2_cvs.bb' failed
424918:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default_cvs.bb' failed
425009:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-default-landscape_cvs.bb' failed
425100:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-pod_cvs.bb' failed
425191:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediaplayer2/opie-mediaplayer2-skin-techno_cvs.bb' failed
425306:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mediummount/opie-mediummount_cvs.bb' failed
425392:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-memoryapplet/opie-memoryapplet_cvs.bb' failed
425507:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-mindbreaker/opie-mindbreaker_cvs.bb' failed
425622:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-minesweep/opie-minesweep_cvs.bb' failed
425708:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-multikeyapplet/opie-multikeyapplet_cvs.bb' failed
425823:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-multikey/opie-multikey_cvs.bb' failed
425909:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-networkapplet/opie-networkapplet_cvs.bb' failed
425995:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-networksettings/opie-networksettings_cvs.bb' failed
426124:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-notesapplet/opie-notesapplet_cvs.bb' failed
426239:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-notes/opie-notes_cvs.bb' failed
426372:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-odict/opie-odict_cvs.bb' failed
426682:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-oxygen/opie-oxygen_cvs.bb' failed
426797:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-oyatzee/opie-oyatzee_cvs.bb' failed
426912:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-packagemanager/opie-packagemanager_cvs.bb' failed
426998:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-parashoot/opie-parashoot_cvs.bb' failed
427125:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-pcmciaapplet/opie-pcmciaapplet_cvs.bb' failed
427216:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-pickboard/opie-pickboard_cvs.bb' failed
427341:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-pics/opie-pics_cvs.bb' failed
427427:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-pimconverter/opie-pimconverter_cvs.bb' failed
427542:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-powerchord/opie-powerchord_cvs.bb' failed
427671:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-pyquicklaunchapplet/opie-pyquicklaunchapplet_cvs.bb' failed
427786:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-qasteroids/opie-qasteroids_cvs.bb' failed
427901:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-qcop/opie-qcop_cvs.bb' failed
427987:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-qss/opie-qss_cvs.bb' failed
428102:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-quicklauncher/opie-quicklauncher_cvs.bb' failed
428217:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-rdesktop/opie-rdesktop_cvs.bb' failed
428354:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-reader/opie-reader_cvs.bb' failed
428405:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-reader/uqtreader_cvs.bb' failed
428491:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-recorder/opie-recorder_cvs.bb' failed
428577:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-remote/opie-remote_cvs.bb' failed
428663:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-restartapplet2/opie-restartapplet2_cvs.bb' failed
428791:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-restartapplet/opie-restartapplet2_cvs.bb' failed
428843:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-restartapplet/opie-restartapplet_cvs.bb' failed
428958:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-rotateapplet/opie-rotateapplet_cvs.bb' failed
429073:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-screenshotapplet/opie-screenshotapplet_cvs.bb' failed
429159:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-search/opie-search_cvs.bb' failed
429274:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-security/opie-security_cvs.bb' failed
429360:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-securityplugins/opie-securityplugin-blueping_cvs.bb' failed
429410:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-securityplugins/opie-securityplugin-dummy_cvs.bb' failed
429496:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-securityplugins/opie-securityplugin-notice_cvs.bb' failed
429582:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-securityplugins/opie-securityplugin-pin_cvs.bb' failed
429668:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-sfcave/opie-sfcave_cvs.bb' failed
429754:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-sheet/opie-sheet_cvs.bb' failed
429840:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-sh/opie-sh_cvs.bb' failed
430005:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-snake/opie-snake_cvs.bb' failed
430120:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-solitaire/opie-solitaire_cvs.bb' failed
430207:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-sounds/opie-sounds_cvs.bb' failed
430293:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-sshkeys/opie-sshkeys_cvs.bb' failed
430379:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-stumbler/opie-stumbler_cvs.bb' failed
430465:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-style-flat/opie-style-flat_cvs.bb' failed
430551:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-style-fresh/opie-style-fresh_cvs.bb' failed
430637:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-style-liquid/opie-style-liquid_cvs.bb' failed
430723:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-style-metal/opie-style-metal_cvs.bb' failed
430838:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-style-phase/opie-style-phase_cvs.bb' failed
430924:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-style-web/opie-style-web_cvs.bb' failed
431039:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-suspendapplet/opie-suspendapplet_cvs.bb' failed
431125:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-symlinker/opie-symlinker_cvs.bb' failed
431211:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-sysinfo/opie-sysinfo_cvs.bb' failed
431297:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-systemtime/opie-systemtime_cvs.bb' failed
431383:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-tableviewer/opie-tableviewer_cvs.bb' failed
431474:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-taskbar/opie-taskbar_cvs.bb' failed
431676:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-taskbar/opie-taskbar-images_cvs.bb' failed
431791:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-tetrix/opie-tetrix_cvs.bb' failed
431877:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-textedit/opie-textedit_cvs.bb' failed
432022:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-theme/opie-theme_cvs.bb' failed
432108:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-tictac/opie-tictac_cvs.bb' failed
432194:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-tinykate/opie-tinykate_cvs.bb' failed
432309:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-today-addressbookplugin/opie-today-addressbookplugin_cvs.bb' failed
432424:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-today-datebookplugin/opie-today-datebookplugin_cvs.bb' failed
432539:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-today-fortuneplugin/opie-today-fortuneplugin_cvs.bb' failed
432654:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-today-mailplugin/opie-today-mailplugin_cvs.bb' failed
432740:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-today/opie-today_cvs.bb' failed
432855:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-today-stocktickerplugin/opie-today-stocktickerplugin_cvs.bb' failed
432970:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-today-todolistplugin/opie-today-todolistplugin_cvs.bb' failed
433085:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-today-weatherplugin/opie-today-weatherplugin_cvs.bb' failed
433171:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-todo/opie-todo_cvs.bb' failed
433257:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-tonleiter/opie-tonleiter_cvs.bb' failed
433360:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-unikeyboard/opie-unikeyboard_cvs.bb' failed
433489:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-vmemo/opie-vmemo_cvs.bb' failed
433604:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-vmemo-settings/opie-vmemo-settings_cvs.bb' failed
433719:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-volumeapplet/opie-volumeapplet_cvs.bb' failed
433834:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-vtapplet/opie-vtapplet_cvs.bb' failed
433920:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-wellenreiter/opie-wellenreiter_cvs.bb' failed
434063:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-wirelessapplet/opie-wirelessapplet_cvs.bb' failed
434178:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-wordgame/opie-wordgame_cvs.bb' failed
434264:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-write/opie-write_cvs.bb' failed
434393:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-zkbapplet/opie-zkbapplet_cvs.bb' failed
434508:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-zlines/opie-zlines_cvs.bb' failed
434594:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-zsafe/opie-zsafe_cvs.bb' failed
434680:ERROR: '/home/klaus/development/oe/openembedded/recipes/opie-zsame/opie-zsame_cvs.bb' failed
441469:ERROR: '/home/klaus/development/oe/openembedded/recipes/pf_ring/libpfring_svn.bb' failed
441518:ERROR: '/home/klaus/development/oe/openembedded/recipes/pf_ring/pf-ring_svn.bb' failed
448395:ERROR: '/home/klaus/development/oe/openembedded/recipes/picocom/picocom_1.3.bb' failed
448462:ERROR: '/home/klaus/development/oe/openembedded/recipes/pidgin/msn-pecan_git.bb' failed
448595:ERROR: '/home/klaus/development/oe/openembedded/recipes/pimlico/contacts_svn.bb' failed
448677:ERROR: '/home/klaus/development/oe/openembedded/recipes/pimlico/dates_svn.bb' failed
448742:ERROR: '/home/klaus/development/oe/openembedded/recipes/pimlico/tasks_svn.bb' failed
449906:ERROR: '/home/klaus/development/oe/openembedded/recipes/pmtools/pmtools_20050926.bb' failed
452169:ERROR: '/home/klaus/development/oe/openembedded/recipes/powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb' failed
464814:ERROR: '/home/klaus/development/oe/openembedded/recipes/prism54/prism54-module_1.2.bb' failed
464881:ERROR: '/home/klaus/development/oe/openembedded/recipes/prism54/prism54-module_cvs.bb' failed
467206:ERROR: '/home/klaus/development/oe/openembedded/recipes/pwc/pwc_10.0.6a.bb' failed
467303:ERROR: '/home/klaus/development/oe/openembedded/recipes/pwc/pwc_10.0.9-rc1.bb' failed
467651:ERROR: '/home/klaus/development/oe/openembedded/recipes/pwlib/pwlib_1.6.6.4.bb' failed
470924:ERROR: '/home/klaus/development/oe/openembedded/recipes/qc-usb/qc-usb-messenger_0.8.bb' failed
470975:ERROR: '/home/klaus/development/oe/openembedded/recipes/qc-usb/qc-usb-messenger_1.1.bb' failed
493061:ERROR: '/home/klaus/development/oe/openembedded/recipes/quake/quake1_0.0.1.bb' failed
493308:ERROR: '/home/klaus/development/oe/openembedded/recipes/quake/quetoo_0.6.1.bb' failed
493666:ERROR: '/home/klaus/development/oe/openembedded/recipes/qxmp/qxmp_1.0.bb' failed
494466:ERROR: '/home/klaus/development/oe/openembedded/recipes/redfang/redfang.bb' failed
498048:ERROR: '/home/klaus/development/oe/openembedded/recipes/rtmp/get-iplayer_2.64.bb' failed
498314:ERROR: '/home/klaus/development/oe/openembedded/recipes/rxvt/rxvt_2.7.9.bb' failed
498361:ERROR: '/home/klaus/development/oe/openembedded/recipes/rxvt/rxvt_2.8.0.bb' failed
498507:ERROR: '/home/klaus/development/oe/openembedded/recipes/rxvt-unicode/rxvt-unicode_5.2.bb' failed
499307:ERROR: '/home/klaus/development/oe/openembedded/recipes/sablevm/sablevm_1.1.9.bb' failed
499359:ERROR: '/home/klaus/development/oe/openembedded/recipes/sablevm/sablevm-classpath_1.11.3.bb' failed
499567:ERROR: '/home/klaus/development/oe/openembedded/recipes/sablevm/sablevm-classpath_1.1.9.bb' failed
499908:ERROR: '/home/klaus/development/oe/openembedded/recipes/samsung-soc-utils/s3c2410-boot-usb-native_svn.bb' failed
500059:ERROR: '/home/klaus/development/oe/openembedded/recipes/sapwood/sapwood_svn.bb' failed
500329:ERROR: '/home/klaus/development/oe/openembedded/recipes/schroedinger/gst-plugin-schroedinger_1.0.9.bb' failed
500802:ERROR: '/home/klaus/development/oe/openembedded/recipes/scsi-idle/scsi-idle_2.4.23.bb' failed
500850:ERROR: '/home/klaus/development/oe/openembedded/recipes/scummvm/opie-scummvm_1.0.1.bb' failed
503848:ERROR: '/home/klaus/development/oe/openembedded/recipes/sidplay-base/sidplay-base_1.0.9.bb' failed
503913:ERROR: '/home/klaus/development/oe/openembedded/recipes/silo/silo_1.4.8.bb' failed
504775:ERROR: '/home/klaus/development/oe/openembedded/recipes/snes232/snes232_cvs.bb' failed
505673:ERROR: '/home/klaus/development/oe/openembedded/recipes/soundtracker/soundtracker-gtk2_0.6.7.bb' failed
505821:ERROR: '/home/klaus/development/oe/openembedded/recipes/sparse/sparse_snapshot.bb' failed
505872:ERROR: '/home/klaus/development/oe/openembedded/recipes/spca5xx/spca5xx_20060501.bb' failed
506018:ERROR: '/home/klaus/development/oe/openembedded/recipes/sphinx-search/sphinx_0.9.8.bb' failed
508465:ERROR: '/home/klaus/development/oe/openembedded/recipes/startup-notification/startup-notification_0.5.bb' failed
512975:ERROR: '/home/klaus/development/oe/openembedded/recipes/swt/swt3.5-gtk_3.5.1.bb' failed
514705:ERROR: '/home/klaus/development/oe/openembedded/recipes/tango/tango-icon-theme-extras_0.1.0.bb' failed
518175:ERROR: '/home/klaus/development/oe/openembedded/recipes/thc/hydra_4.4.bb' failed
519055:ERROR: '/home/klaus/development/oe/openembedded/recipes/tinymail/libtinymail_svn.bb' failed
519139:ERROR: '/home/klaus/development/oe/openembedded/recipes/tinymail/tmut_svn.bb' failed
519336:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.0.21.bb' failed
519385:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.0.22.bb' failed
519434:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.0.23.bb' failed
519483:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.11.bb' failed
519532:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.12.bb' failed
519581:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.13.bb' failed
519630:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.14.bb' failed
519679:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.15.bb' failed
519728:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.16.bb' failed
519776:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.17.bb' failed
519825:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.5.bb' failed
519874:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_6.1.9.bb' failed
519923:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_7.0.1.bb' failed
519972:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_7.0.2.bb' failed
520021:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-cgt6x_7.0.3.bb' failed
520231:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm355_3.10.00.00.bb' failed
520280:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm365_3.10.00.02.bb' failed
520329:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm365_3.10.00.05.bb' failed
520448:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-codecs-dm6467_1.0.0.bb' failed
520639:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-dm365mm-module_1.0.1.bb' failed
521026:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-dvsdk-demos_3.10.00.11.bb' failed
521075:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-dvsdk-demos_3.10.00.14.bb' failed
521126:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-dvtb_4.20.12.bb' failed
521458:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-xdais_6.23.bb' failed
521492:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-xdais_6.24.01.06.bb' failed
521544:ERROR: '/home/klaus/development/oe/openembedded/recipes/ti/ti-xdais_6.25.00.07.bb' failed
523148:ERROR: '/home/klaus/development/oe/openembedded/recipes/treecc/treecc_0.3.6.bb' failed
523183:ERROR: '/home/klaus/development/oe/openembedded/recipes/treecc/treecc-native_0.3.6.bb' failed
523397:ERROR: '/home/klaus/development/oe/openembedded/recipes/tsclient/tsclient_0.132.bb' failed
523432:ERROR: '/home/klaus/development/oe/openembedded/recipes/tsclient/tsclient_0.140.bb' failed
523499:ERROR: '/home/klaus/development/oe/openembedded/recipes/tslib/tslib_git.bb' failed
525759:ERROR: '/home/klaus/development/oe/openembedded/recipes/u2nl/u2nl_1.3.bb' failed
528803:ERROR: '/home/klaus/development/oe/openembedded/recipes/u-boot/u-boot-omap3beagleboard_1.1.4.bb' failed
530515:ERROR: '/home/klaus/development/oe/openembedded/recipes/uml-utilities/uml-utilities_20040406.bb' failed
530643:ERROR: '/home/klaus/development/oe/openembedded/recipes/unicap/unicap_0.9.3.bb' failed
530695:ERROR: '/home/klaus/development/oe/openembedded/recipes/unicap/unicap_0.9.4.bb' failed
531620:ERROR: '/home/klaus/development/oe/openembedded/recipes/upnp/gupnp-tools_0.8.bb' failed
531688:ERROR: '/home/klaus/development/oe/openembedded/recipes/upnp/gupnp-vala_0.6.2.bb' failed
532333:ERROR: '/home/klaus/development/oe/openembedded/recipes/usbutils/usbmodeswitch_1.0.7.bb' failed
537903:ERROR: '/home/klaus/development/oe/openembedded/recipes/waimea/waimea_cvs.bb' failed
537985:ERROR: '/home/klaus/development/oe/openembedded/recipes/watchdog/watchdog_5.2.6.bb' failed
538053:ERROR: '/home/klaus/development/oe/openembedded/recipes/watchdog/watchdog_5.4.bb' failed
558603:ERROR: '/home/klaus/development/oe/openembedded/recipes/whois/whois_5.0.0.bb' failed
558859:ERROR: '/home/klaus/development/oe/openembedded/recipes/whois/whois_5.0.5.bb' failed
559632:ERROR: '/home/klaus/development/oe/openembedded/recipes/wlags-modules/kernel-module-wlags49-h1-cs_718.bb' failed
559687:ERROR: '/home/klaus/development/oe/openembedded/recipes/wlags-modules/kernel-module-wlags49-h2-cs_718.bb' failed
560586:ERROR: '/home/klaus/development/oe/openembedded/recipes/wrt/wrt-utils.bb' failed
563255:ERROR: '/home/klaus/development/oe/openembedded/recipes/xapian/xapian-quickstartindex_1.0.bb' failed
563290:ERROR: '/home/klaus/development/oe/openembedded/recipes/xapian/xapian-quickstartindex-native_1.0.bb' failed
563973:ERROR: '/home/klaus/development/oe/openembedded/recipes/xcb/xcb-proto_0.9.bb' failed
566202:ERROR: '/home/klaus/development/oe/openembedded/recipes/xfce-extras/xfcalendar_4.2.3.bb' failed
566537:ERROR: '/home/klaus/development/oe/openembedded/recipes/xffm/xffm_4.3.99.2.bb' failed
566693:ERROR: '/home/klaus/development/oe/openembedded/recipes/xfsprogs/xfsprogs_3.1.2.bb' failed
567108:ERROR: '/home/klaus/development/oe/openembedded/recipes/xl2tpd/xl2tpd_1.2.6.bb' failed
568466:ERROR: '/home/klaus/development/oe/openembedded/recipes/xmonobut/xmonobut_0.4.bb' failed
588622:ERROR: '/home/klaus/development/oe/openembedded/recipes/zd1211/zd1211_r85.bb' failed

--------------010109030100000109030607--
