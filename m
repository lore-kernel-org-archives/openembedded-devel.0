Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PPKkH-0004xA-Q6
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 20:59:43 +0100
Received: by iwn8 with SMTP id 8so11015410iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 Dec 2010 11:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=FF/vDhpJSdqQrobj4ViEptN1MY0nPWb9CtHmNb2shN8=;
	b=RD0RW8kNWeaFtGXKNKGxBjL0UQ3wJPOEllQfFPm+U3DAEE8KiuhkSMwxBqfehyRMB8
	t4zrAgsGWlIn4p+taL36K+5GSdd+zS/r1+UPwm2L7r45t8y1jdKfvPGzNF5Gqky8da+D
	+qSIXSa3/78UoKKV6x6HbJLW/jYW3GJMMoi38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=HdhD0D9iIv0yGJYJGPR5i4xTmyV4DFJ5Uk6reqtb1R1Mu9bAcR4gg+BQHVfRAJRFUR
	bbAgPLoapzMwqfQB4nEDxDzHw5ZY7duGQI2yLZKBF7XOm9+FWxS5ZyPCTyk99/tTrE6y
	aiAONGdQQKgjU6xRR9xiI//86AcQmqTS6rJJc=
MIME-Version: 1.0
Received: by 10.231.191.4 with SMTP id dk4mr4861344ibb.82.1291579096602; Sun,
	05 Dec 2010 11:58:16 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sun, 5 Dec 2010 11:58:16 -0800 (PST)
Date: Sun, 5 Dec 2010 20:58:16 +0100
Message-ID: <AANLkTinoazy9yOU04JPZEJTB8+Huea6wPVW8uGfP2hKd@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS,URI_NOVOWEL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] remove AUTOTOOLS_STAGE_PKGCONFIG
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
X-List-Received-Date: Sun, 05 Dec 2010 19:59:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

As confirmed and proved by Robert (see
http://article.gmane.org/gmane.comp.handhelds.openembedded/40268/match=autotools_stage_pkgconfig
)
AUTOTOOLS_STAGE_PKGCONFIG is not used any more since about a year.

Proposal is to remove this var from all 4 classes that define it and
all 66 recipes.
Below is a list of all files.

If you disagree with this, or feel there are reasons to keep it,
please speak up.
And if you feel removal is OK, please reply with an ACK (that I then
will use when making the edit).

Thanks alot! Frans

PS: rationale for asking for ack's upfront is because if I author a
patch and wait two weeks some of the files will be touched, causing
additional work or a repeated edit session.
The plan is to remove only the lines mentioned below. As there is no
function change (the var is dead), no PR bump or so is needed.

classes/efl.bbclass:AUTOTOOLS_STAGE_PKGCONFIG = "1"
classes/gnomebase.bbclass:AUTOTOOLS_STAGE_PKGCONFIG = "1"
classes/xfce.bbclass:AUTOTOOLS_STAGE_PKGCONFIG = "1"
classes/xfce46.bbclass:AUTOTOOLS_STAGE_PKGCONFIG = "1"

bluez/bluez4-libs.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
bluez/bluez4.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
boxee/tre_0.7.5.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
device-mapper/device-mapper_1.02.28.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
devicekit/devicekit-disks_004.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
fann/fann_2.0.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
farsight/farsight2_0.0.22.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
farsight/farsight2_0.0.9.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
farsight/libnice_0.0.13.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
farsight/libnice_0.0.6.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
ggz/libggz_0.0.14.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
gnome/gnome-python-extras_2.25.3.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
gnome/hippo-canvas_0.3.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
gnome/libsoup_2.2.100.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
gnutls/libtasn1_1.7.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
gstreamer/gst-common.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
icon-slicer/icon-slicer-native_0.3.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
jpeg/jasper_1.900.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
kde4/gmm_3.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
kde4/kde4.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
kde4/strigi_0.5.10.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
lcms/lcms_1.17.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
libdlo/libdlo_git.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
libexif/libexif.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
libusb/libusb-compat_0.1.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
libusb/libusb-compat_0.1.3.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
libusb/libusb1_1.0.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
mml-widget/gtkmathview_0.8.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = 1
musicpd/libmpd_0.17.96.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
musicpd/libmpd_0.20.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
mythtv/gmyth-upnp_0.7.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
mythtv/gmyth_0.7.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
obexftp/obexftp_0.23.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
openmax/libomxil-bellagio_0.9.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
openmax/libomxil-bellagio_0.9.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
openmax/libomxil-bellagio_0.9.2.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
openmax/libomxil-bellagio_0.9.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
pango/pangomm_2.26.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
pulseaudio/libcanberra_0.12.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
pulseaudio/libcanberra_0.14.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
pulseaudio/libcanberra_0.17.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
redland/redland_1.0.8.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
schroedinger/schroedinger_1.0.9.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sdr/hamlib_1.2.10.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-artwork_0.82.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-artwork_0.84.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-base_0.82.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-base_0.83.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-base_0.84.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-datastore_0.82.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-datastore_0.84.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-presence-service_0.82.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-presence-service_0.84.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-toolkit_0.82.11.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-toolkit_0.83.3.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar-toolkit_0.84.4.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar_0.82.9.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar_0.83.4.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
sugar/sugar_0.84.6.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
telepathy/telepathy-farsight_0.0.7.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
telepathy/telepathy-gabble_0.7.27.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
telepathy/telepathy-glib_0.7.29.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
telepathy/telepathy-mission-control_4.67.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
upnp/gupnp-av_0.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
upnp/libupnp_1.6.5.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
vlc/libdvdcss_1.2.10.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"


