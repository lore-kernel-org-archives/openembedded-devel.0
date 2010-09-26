Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzoMb-0007Af-1g
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Sep 2010 12:21:47 +0200
Received: by iwn2 with SMTP id 2so1984453iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Sep 2010 03:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=7SEM3F2UDjiVWLuItaVQ7HlfDBgYx1/SIyXixEi4mxI=;
	b=xwZjP5Gjq+/eirq4wsRC5vvLTDUkH6WWDDBj50+aT66BJ5KfYUHyMsM0gpopq1+Twm
	jU7WmS7FhPEiJYULPesLa5k6yzDAhWG+jqkNCqBsoLWkfWOyJ/fraPp1W3w+CsBF8kqW
	AyVs6R0l8yc+Vy3QQ7VeXLrO4d8q7XX9v9BCs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cl9abfCWiSq55iX/nNWnkfllEjISY0S3/4gL66FjRHRkR1L7+0yhoRakjOAn/bWMgz
	uyUOCsLvJkdCqzujFeHLJmipTOgMFMhyyo+KAs31pV3y2sSQqVd7xgFABVcIIVgsegtq
	tKxxSNJmSRUnTDyA24zdeEoH8yA42T9Lo8NL8=
MIME-Version: 1.0
Received: by 10.231.148.195 with SMTP id q3mr6775662ibv.199.1285496496042;
	Sun, 26 Sep 2010 03:21:36 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 26 Sep 2010 03:21:36 -0700 (PDT)
Date: Sun, 26 Sep 2010 12:21:36 +0200
Message-ID: <AANLkTi=Wt1eRcSoXzjwMJizLBgQ-+hV=Xj1UWW155MWQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: some more non fetching recipes
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
X-List-Received-Date: Sun, 26 Sep 2010 10:21:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Apart from the opensync and uclibc recipes that did not fetch and were
reported before, I did get fetch issues for the files below.
Haven't had time to dig into these, so some of these might be false alarms.
If anyone feels attached to a recipe or can say something about it,
please take action.

Frans.

PS: I removed the ti folder in this test; that one has recipes for
which the SRC_URI seems to depend upon an external var (or vars) or
which needed to be downloaded manually

binutils/mingw-binutils-canadian-cross_2.20.bb
binutils/mingw-binutils_2.20.bb
bluez/bluez-gnome_cvs.bb
cacao/cacao-native_hg.bb
cumulus/cumulus_cvs.bb
dpkg/dpkg-native_1.14.29.bb
dpkg/dpkg_1.14.29.bb
gpe-edit/gpe-edit_svn.bb
gpsdrive/gpsdrive-pda_2.10pre2.bb
gstreamer/gst-plugins-ugly-sid_0.10.7.bb
hal/hal_git.bb
kismet/kismet-newcore_svn.bb
kismet/kismet_svn.bb
konqueror/konqueror-embedded_20060404.bb
linux-uml/linux-uml_2.4.26.bb
linux-uml/linux-uml_2.6.11-rc2-mm1.bb
maemo/nokia770-init_1.0.bb
mamona/cx3110x-770he_0.8.1.bb
mamona/cx3110x-chinooke_2.0.15.bb
mamona/cx3110x-diablo_2.0.15.bb
mamona/uinput_2.6.21.bb
matchbox-panel/matchbox-panel_svn.bb
mplayer/mplayer-maemo_svn.bb
musicpd/gmpc_svn.bb
networkmanager/networkmanager_svn.bb
openmoko-projects/paroli_git.bb
openmoko-projects/tichy_git.bb
openmoko2/openmoko-alsa-scenarios_svn.bb
openmoko2/openmoko-contacts2_svn.bb
openmoko2/openmoko-dates2_svn.bb
openmoko2/openmoko-tasks2_svn.bb
pidgin/msn-pecan_git.bb
pimlico/contacts_svn.bb
pimlico/dates_svn.bb
pimlico/tasks_svn.bb
powervr-drivers/bc-cube_0.1.0.bb
powervr-drivers/bc-cube_0.2.0.bb
powervr-drivers/libgles-omap3_3.01.00.02.bb
powervr-drivers/libgles-omap3_3.01.00.06.bb
powervr-drivers/libgles-omap3_3.01.00.07.bb
powervr-drivers/omap3-sgx-modules_1.4.14.2514.bb
powervr-drivers/omap3-sgx-modules_1.4.14.2616.bb
python/python-psyco_1.6.bb
qt4/qt4-embedded-gles_4.6.0.bb
qt4/qt4-embedded-gles_4.6.2.bb
qt4/qt4-embedded-gles_4.6.3.bb
qt4/qt4-x11-free-gles_4.5.2.bb
qt4/qt4-x11-free-gles_4.6.0.bb
qt4/qt4-x11-free-gles_4.6.2.bb
qt4/qt4-x11-free-gles_4.6.3.bb
qt4/qt4-x11-free-gles_4.7.0.bb
rp-pppoe/rp-pppoe_3.5.bb
schroedinger/gst-plugin-schroedinger_1.0.9.bb
tinymail/libtinymail_svn.bb
tinymail/tmut_svn.bb
tinymail/libtinymail_svn.bb
tinymail/tmut_svn.bb
u-boot/u-boot-bug_svn.bb
u-boot/u-boot-omap3beagleboard_1.1.4.bb
u-boot/u-boot-omap3pandora_git.bb
u-boot/u-boot_git.bb
xffm/xffm_4.3.99.2.bb
xorg-driver/xf86-input-vmmouse_12.6.10.bb
xorg-driver/xf86-input-vmmouse_12.6.5.bb
xorg-driver/xf86-video-geode_2.11.6.bb
xorg-driver/xf86-video-geode_2.11.9.b


