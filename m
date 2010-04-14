Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O2AtE-0006qx-Dm
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Apr 2010 00:16:57 +0200
Received: by bwz26 with SMTP id 26so740935bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Apr 2010 15:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=8KsFZ7xj9OCuD1s5vuPvDrsmm9vrEZ/uI1oqbNE1yoM=;
	b=oQ3HqEVZqp+F0i1JfNU32FSGMGlIazfGmOWEqU+UfZb8pbAAnqEOjdVSptUrnMgcbP
	w37fsRUirL7kILNCYmfnDHtfhvDCrWFOujJSRy+bqTfZYqVH740ujm2gycoyQW7BgSCE
	q62mMDDCiEVLAqJIx+vrzSWBOVbMYGg/nKnb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=XNQnLfeZGkqf4ZNQVG0EgA+TZ3PZiSa4NvxnWxXRXUeUsTPa35P5sPTGet4sSxRuMr
	lX58GdFZepjxpQi2bHcd/pYWZ8CGDxF113p3wLPnnPhHXmfBQu6z+AjHhV5B+IYkgQHX
	h0ijTVgKgqdVrco9wRLKSBa9FZw8E5mrCHpHI=
Received: by 10.102.222.5 with SMTP id u5mr4548205mug.134.1271283207334;
	Wed, 14 Apr 2010 15:13:27 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 25sm4583504mul.16.2010.04.14.15.13.25
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Apr 2010 15:13:26 -0700 (PDT)
Date: Thu, 15 Apr 2010 00:13:44 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100414221344.GG3616@jama>
References: <20100413141237.GE3616@jama>
MIME-Version: 1.0
In-Reply-To: <20100413141237.GE3616@jama>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL, BAYES_00, SPF_PASS,
	URI_HEX, WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Download status for all recipes in oe.dev
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
X-List-Received-Date: Wed, 14 Apr 2010 22:16:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

today I finished my manual download queue and everything I was able to
download or even find with google on some other mirror has now checksums
in recipe.

I would like to remove or at least rename checksums.ini file in oe.dev
to discourage anyone to put checksums there.

I think that checksums now in recipes are even better than what's stored
in checksums.ini, because in many recipes I had to update SRC_URI and
checksums.ini entry doesn't match anymore (and there was no need to
update it as well).

So now there is 245 recipes where the source isn't available at all. And
about 200-300 more where SRC_URI still doesn't work (when I found
archive on some strange site I didn't update SRC_URI to that site even
when it gave right checksum).

Strange how many recipes were also really broken, like double quotes
forcing staging helper to fail or patch:// in SRC_URI etc :/. Better QA
scripts/tests would be nice :).

./chillispot/chillispot_0.98.bb
HTML http://www.chillispot.org/download/chillispot-0.98.tar.gz cannot check archive integrity
./chillispot/chillispot_1.0RC3.bb
HTML  http://www.chillispot.org/download/chillispot-1.0RC3.tar.gz cannot check archive integrity

./madwifi/madwifi-modules_cvs.bb
cvs [checkout aborted]: Unable to parse file size sent by server, `E cvs checkout: Couldn't open rcsinfo template file /cvsroot/madwifi/CVSROOT/rcstemplate: No such file or directory'
./makeself/makeself-native_cvs.bb
cvs [checkout aborted]: connect to cvs.icculus.org(74.81.175.20):2401 failed: Connection refused
./networkmanager/networkmanager_svn.bb
moved to GIT NOTE: Fetch svn://svn.gnome.org/svn/NetworkManager/;module=trunk;proto=http
./opencvs/opencvs_cvs.bb
NOTE: Task failed: Unknown fetch Error: [Errno 21] Is a directory: '/OE/downloads/cvs'
./opensync/msynctool_svn.bb
multisync is gone only opensync there
./silo/silo_1.4.8.bb
HTML  http://www.sparc-boot.org/pub/silo/silo-1.4.8.tar.bz2 cannot check archive integrity
./skype/skype-static_2.0.0.72.bb
404 http://download.skype.com/linux/skype_static-2.0.0.72.tar.bz2
./skype/skype_2.0.0.72.bb
404 http://download.skype.com/linux/skype-2.0.0.72.tar.bz2
./vlc/vlc-davinci_0.8.6h.bb
branch does not exist now
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/git_git.videolan.org.vlc.git_e712a114e04a1070f1afdf31ec668cb28eda513c.tar.gz'
./sdr/dttsp_svn.bb
svn: Can't connect to host '206.216.146.154': Connection timed out
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/dttsp-ng_206.216.146.154_.svn.repos_sdr_linux.branches.ab2kt_241_.tar.gz'
./ti/gstreamer-ti_svn.bb
NOTE: Task failed: Unknown fetch Error: [Errno 2] No such file or directory: '/OE/downloads/gstreamer_ti_gforge.ti.com_.svn.gstreamer_ti.trunk_573_.tar.gz'
./tinymail/libtinymail_svn.bb
moved to GIT
./tinymail/tmut_svn.bb
moved to GIT
./u-boot/u-boot-omap3_git.bb
fatal: The remote end hung up unexpectedly
./waimea/waimea_cvs.bb
domain gone cvs://anoncvs:@cvs.waimea.org/cvs/waimea;module=waimea;method=pserver
./agg/agg-minimal_2.5.bb
404 http://www.wxsvg.org/files/agg-2.5_cygming.patch

./asterisk/asterisk_1.6.0-beta8.bb
404 http://ftp.digium.com/pub/asterisk/releases/asterisk-1.5.0+1.6.0beta8.tar.gz
./bootmenu/bootmenu_0.6.bb
404 http://www.cosmicpenguin.net/pub/bootmenu/bootmenu-0.6.tar.gz

./obsolete/gtk-webcore/midori_0.0.10.bb
HTML http://software.twotoasts.de/media/midori/midori-0.0.10.tar.gz cannot check archive integrity
./obsolete/gtk-webcore/midori_0.0.11.bb
HTML http://software.twotoasts.de/media/midori/midori-0.0.11.tar.gz cannot check archive integrity
./obsolete/gtk-webcore/midori_0.0.12.bb
HTML http://software.twotoasts.de/media/midori/midori-0.0.12.tar.gz cannot check archive integrity
./obsolete/gtk-webcore/midori_0.0.13.bb
HTML http://software.twotoasts.de/media/midori/midori-0.0.13.tar.gz cannot check archive integrity
./obsolete/gtk-webcore/midori_0.0.15.bb
HTML http://software.twotoasts.de/media/midori/midori-0.0.15.tar.gz cannot check archive integrity
./obsolete/gtk-webcore/midori_0.0.17.bb
HTML http://software.twotoasts.de/media/midori/midori-0.0.17.tar.gz cannot check archive integrity
./obsolete/gtk-webcore/midori_0.0.8.bb
HTML: http://software.twotoasts.de/media/midori/midori-0.0.8.tar.gz cannot check archive integrity
./tsclient/tsclient_0.132.bb
HTML http://www.gnomepro.com/tsclient/tsclient-0.132.tar.gz cannot check archive integrity
./tsclient/tsclient_0.140.bb
HTML http://www.gnomepro.com/tsclient/tsclient-0.140.tar.gz cannot check archive integrity
./unicap/unicap_0.9.3.bb
HTML http://www.unicap-imaging.org/downloads/unicap-0.9.3.tar.gz cannot check archive integrity
./unicap/unicap_0.9.4.bb
404 http://www.unicap-imaging.org/downloads/tisCMOS/unicap-0.9.4.tar.gz
./cpusage/cpusage_0.1.bb
404 http://www8.in.tum.de/~schneifa/group/sources/cpusage-0.1.tar.gz
./dash/dash_0.5.5.1.bb
404 http://ftp.debian.org/debian/pool/main/d/dash/dash_0.5.5.1-2.3.diff.gz
./debianutils/debianutils_2.19.bb
404 ftp://ftp.debian.org/debian/pool/main/d/debianutils/debianutils_2.19.tar.gz
./dgen/dgen-sdl_1.23.bb
HTML http://pknet.com/~joe/dgen-sdl-1.23.tar.gz
./dhcdbd/dhcdbd_1.14.bb
404 https://fedorahosted.org/releases/d/h/dhcdbd/dhcdbd-1.14.tar.bz2
./dialog/dialog_1.0-20050306.bb
404 ftp://invisible-island.net/dialog/dialog-1.0-20050306.tgz
./directfb/fusionsound_1.1.0+git20070709.bb
fatal: unable to connect a socket (Connection refused)
./directfb/lite_0.9.26+cvs20070207.bb
cvs [checkout aborted]: connect to cvs.directfb.org(212.227.87.76):2401 failed: Connection refused
./fontconfig/fontconfig_2.6.99.bb
no such dir fatal: The remote end hung up unexpectedly
./gpsdrive/gpsdrive-pda_2.10pre2.bb
404 http://www.gedanken.demon.co.uk/gpsdrive-ipaq/gpsdrive-2.10pre2-ipaq-r4.tar.gz
./gtk2-ssh-askpass/gtk2-ssh-askpass_0.3.bb
HTML http://src.gentoo.pl/distfiles/gtk2-ssh-askpass-0.3.tar.gz
./hibernate-script/hibernate-script_1.12.bb
HTML http://www.suspend2.net/downloads/all/hibernate-script-1.12.tar.gz
./ica/ica-bin_8.0.bb
ERROR: Exception:<type 'exceptions.AttributeError'> Message:'NoneType' object has no attribute 'rfind' in Function ica_do_fetch failed
./ipatience/ipatience_0.1.bb
cvs [checkout aborted]: connect to keithp.com(63.227.221.253):2401 failed: Connection refused
./konqueror/konqueror-embedded_20060404.bb
wrong dir? NOTE: Fetch svn://anonsvn.kde.org/home/kde/tags/KDE/3.5.1;module=kdelibs;date=20060404
./madwifi/madwifi-modules_cvs-bsd.bb
cvs [update aborted]: Unable to parse file size sent by server, `E cvs update: Couldn't open rcsinfo template file /cvsroot/madwifi/CVSROOT/rcstemplate: No such file or directory'
./mailx/mailx_8.1.2-0.20020411cvs.bb
404 ftp://ftp.debian.org/debian/pool/main/m/mailx/mailx_8.1.2-0.20020411cvs.orig.tar.gz

./nonworking/nylon/simple-firewall.bb
4g domain, really? NOTE: Fetch svn://gruen.4g/svn/trunk/application;module=simple-firewall;proto=http
./obsolete/didiwiki/didiwiki_0.2.bb
Really? how to get it there? :) SRC_URI = "http://sources.openembedded.org/didiwiki-${PV}.tar.gz"
./obsolete/didiwiki/didiwiki_0.4.bb
Really? how to get it there? :) SRC_URI = "http://sources.openembedded.org/didiwiki-${PV}.tar.gz"
./obsolete/gaim/gaim_2.0.0-cvs-mco1.bb
cvs server: cannot find module `gaim' - ignored

./opensync/libopensync-plugin-syncml-client-plugin_0.1.bb
syncml-client dir is gone NOTE: Fetch svn://svn.opensync.org/plugins/syncml-client/plugin/tags;module=release-0.22+svn20100413;proto=http
./opensync/syncml-client_0.1.bb
404 http://hem.bredband.net/miko22/syncml-client-0.1.tar.gz

./pmtools/pmtools_20050926.bb
404 http://kernel.org/pub/linux/kernel/people/lenb/acpi/utils/pmtools-20050926.tar.bz2
./rtmp/get-iplayer_2.64.bb
404 http://linuxcentre.net/get_iplayer/get_iplayer-2.64/get_iplayer

./sablevm/sablevm-classpath_1.1.9.bb
404 http://sablevm.org/download/release/1.1.9/sablevm-classpath-1.1.9.tar.gz
./sablevm/sablevm_1.1.9.bb
404 http://sablevm.org/download/release/1.1.9/sablevm-1.1.9.tar.gz
./schroedinger/gst-plugin-schroedinger_1.0.9.bb
404 http://www.diracvideo.org/download/schroedinger/gst-plugin-schroedinger-1.0.9.tar.gz
./servlet-api/jsp2.0_5.5.26.bb
| /OE/tmpdir-micro/work/armv5teb-linux-gnueabi/jsp2.0-5.5.26-r0/temp/run.staging_helper.18591: line 468: syntax error near unexpected token `('
./smpeg/smpeg_0.4.4+0.4.5cvs20040311.bb
cvs [checkout aborted]: connect to cvs.icculus.org(74.81.175.20):2401 failed: Connection refused
./soundtracker/soundtracker-gtk2_0.6.7.bb
404 http://mutab0r.chat.ru/soundtracker-0.6.7.gtk2.tar.bz2
./u-boot/u-boot-omap3beagleboard_1.1.4.bb
404 http://www.sakoman.net/omap3/u-boot.tar.gz
./wrt/wrt-utils.bb
cvs [checkout aborted]: connect to openwrt.org(78.24.191.177):2401 failed: Connection refused

./misc-binary-only/tda1004x-firmware.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./xapian/xapian-quickstartindex-native_1.0.bb:#CHECKSUMS.INI MISMATCH: I got this instead:
./xapian/xapian-quickstartindex_1.0.bb:#CHECKSUMS.INI MISMATCH: I got this instead:
./fltk/fltk_1.1.4.bb:#CHECKSUMS.INI MISMATCH: I've got this instead
./desktop-file-utils/desktop-file-utils_0.3.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./linux/linux-geodegx_2.4.24.bb:# CHECKSUMS.INI MISMATCH: I got this instead:
./linux/linux-sun4cdm_2.6.8.1.bb:# CHECKSUMS.INI MISMATCH: I got this:
./mathomatic/mathomatic_unstable.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./geode-drivers/geode-aeslx_2.6.11.bb:# CHECKSUMS.INI MISMATCH: I've got this instead:
./geode-drivers/geode-accessbus5536_2.6.11.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./geode-drivers/geode-alsa5536_2.6.11.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./minipredict/dictionary_en-GB.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./sphinx-search/sphinx_0.9.8.bb:# CHECKSUMS.INI MISMATCH: I've got this instead:
./dt/dt_15.14.bb:# CHECKSUMS.INI MISMATCH: I got this:
./thc/hydra_4.4.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./startup-notification/startup-notification_0.5.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./quake/quetoo_0.6.1.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./fpdf/fpdf_1.53.bb:# CHECKSUMS.INI MISMATCH: I've got this instead:
./u2nl/u2nl_1.3.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./asterisk/asterisk-moh-freeplay-alaw_0.0.0.bb:# CHECKSUMS.INI MISMATCH: I've got this instead:
./asterisk/asterisk-moh-freeplay-g729_0.0.0.bb:# CHECKSUMS.INI MISMATCH: I've got this instead
./asterisk/asterisk-moh-freeplay-ulaw_0.0.0.bb:# CHECKSUMS.INI MISMATCH: I've got this instead
./asterisk/asterisk_1.2.24.bb:# CHECKSUMS.INI MISMATCH: I've got this instead:
./asterisk/asterisk-moh-freeplay-gsm_0.0.0.bb:# CHECKSUMS.INI MISMATCH: I've got this instead
./netpipes/netpipes_4.2.bb:#CHECKSUMS.INI MISMATCH: I've got this instead
./gpephone/libgemwidget_0.1.bb:# CHECKSUMS.INI MISMATCH: I got this:
./microwindows/microwindows-snapshot.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
./openal/openal_0.0.8.bb:#CHECKSUMS.INI MISMATCH: I've got this instead:
-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


