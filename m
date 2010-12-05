Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@erafx.com>) id 1PP5ac-0000gY-VV
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Dec 2010 04:48:44 +0100
Received: by vws6 with SMTP id 6so4318261vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 04 Dec 2010 19:47:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.97.17 with SMTP id j17mr935973vcn.26.1291520835128; Sat,
	04 Dec 2010 19:47:15 -0800 (PST)
Received: by 10.220.194.65 with HTTP; Sat, 4 Dec 2010 19:47:15 -0800 (PST)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <AANLkTimOUSrRJd+bVLmprX+e+tCTtQHLQEC52GNgMCZ=@mail.gmail.com>
References: <AANLkTimOUSrRJd+bVLmprX+e+tCTtQHLQEC52GNgMCZ=@mail.gmail.com>
Date: Sat, 4 Dec 2010 22:47:15 -0500
Message-ID: <AANLkTikHELkGRimSceVK+979mAA8bAVugKBZqaQHtbSN@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: robert@erafx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW,URI_NOVOWEL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: AUTOTOOLS_STAGE_PKGCONFIG still used?
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
X-List-Received-Date: Sun, 05 Dec 2010 03:48:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

$ git log --pretty=oneline -S'{AUTOTOOLS_STAGE_PKG'
b66fa6b32686ef5a750de1bb2fb317448c682863 autotools.bbclass: Separate out
useful staging functions into base.bbclass and call from autotools classes
(from Poky)

Diff of b66fa6 (it was removed here)
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b66fa6b32686ef5a750de1bb2fb317448c682863


<http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=b66fa6b32686ef5a750de1bb2fb317448c682863>It
appears unused.


On Sat, Dec 4, 2010 at 6:31 PM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> Dear all.
>
> Is AUTOTOOLS_STAGE_PKGCONFIG still of any use?
> I was trying to fidn out what I did, I ran a grep on both my
> openembedded dir (results see below) and my yocto tree, both trees at
> git head.
> I see a lot of places where it is set but no place where it is used.
>
> Anyone who can confirm that this is a stale var? Or otherwise anyone
> who can explain how this is used. (and no, bitbake does not know the
> var either, not that I had expected it)
>
> frans@linux-suse:~/oe/openembedded> grep -r AUTOTOOLS_STAGE_PKGCONFIG .
> ./recipes/gnome/libsoup_2.2.100.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/gnome/gnome-python-extras_2.25.3.bb:AUTOTOOLS_STAGE_PKGCONFIG =
> "1"
> ./recipes/gnome/hippo-canvas_0.3.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/openmax/libomxil-bellagio_0.9.2.1.bb:AUTOTOOLS_STAGE_PKGCONFIG =
> "1"
> ./recipes/openmax/libomxil-bellagio_0.9.1.bb:AUTOTOOLS_STAGE_PKGCONFIG =
> "1"
> ./recipes/openmax/libomxil-bellagio_0.9.0.bb:AUTOTOOLS_STAGE_PKGCONFIG =
> "1"
> ./recipes/openmax/libomxil-bellagio_0.9.2.bb:AUTOTOOLS_STAGE_PKGCONFIG =
> "1"
> ./recipes/musicpd/libmpd_0.17.96.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/musicpd/libmpd_0.20.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/libexif/libexif.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/obsolete/pixman/pixman_0.17.6.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/mml-widget/gtkmathview_0.8.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = 1
> ./recipes/ggz/libggz_0.0.14.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/vlc/libdvdcss_1.2.10.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/gnutls/libtasn1_1.7.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/gstreamer/gst-common.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/mythtv/gmyth_0.7.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/mythtv/gmyth-upnp_0.7.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/lcms/lcms_1.17.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/jpeg/jasper_1.900.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/redland/redland_1.0.8.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/telepathy/telepathy-gabble_0.7.27.bb:AUTOTOOLS_STAGE_PKGCONFIG =
> "1"
> ./recipes/telepathy/telepathy-farsight_0.0.7.bb:AUTOTOOLS_STAGE_PKGCONFIG
> = "1"
> ./recipes/telepathy/telepathy-mission-control_4.67.bb:
> AUTOTOOLS_STAGE_PKGCONFIG
> = "1"
> ./recipes/telepathy/telepathy-glib_0.7.29.bb:AUTOTOOLS_STAGE_PKGCONFIG =
> "1"
> ./recipes/kde4/gmm_3.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/kde4/kde4.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/kde4/strigi_0.5.10.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/device-mapper/device-mapper_1.02.28.bb:AUTOTOOLS_STAGE_PKGCONFIG
> = "1"
> ./recipes/sdr/hamlib_1.2.10.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/libusb/libusb-compat_0.1.3.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/libusb/libusb-compat_0.1.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/libusb/libusb1_1.0.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/bluez/bluez4-libs.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/bluez/bluez4.inc:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/boxee/tre_0.7.5.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/fann/fann_2.0.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/pango/pangomm_2.26.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/icon-slicer/icon-slicer-native_0.3.bb:AUTOTOOLS_STAGE_PKGCONFIG
> = "1"
> ./recipes/sugar/sugar_0.83.4.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-datastore_0.82.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-artwork_0.84.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-toolkit_0.82.11.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-datastore_0.84.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-base_0.82.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-artwork_0.82.0.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar_0.82.9.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-toolkit_0.84.4.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-toolkit_0.83.3.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-presence-service_0.82.2.bb:AUTOTOOLS_STAGE_PKGCONFIG
> = "1"
> ./recipes/sugar/sugar-base_0.84.1.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-presence-service_0.84.0.bb:AUTOTOOLS_STAGE_PKGCONFIG
> = "1"
> ./recipes/sugar/sugar_0.84.6.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/sugar/sugar-base_0.83.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/schroedinger/schroedinger_1.0.9.bb:AUTOTOOLS_STAGE_PKGCONFIG =
> "1"
> ./recipes/devicekit/devicekit-disks_004.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/upnp/gupnp-av_0.2.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/upnp/libupnp_1.6.5.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/libdlo/libdlo_git.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/obexftp/obexftp_0.23.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/pulseaudio/libcanberra_0.17.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/pulseaudio/libcanberra_0.14.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/pulseaudio/libcanberra_0.12.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/farsight/farsight2_0.0.9.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/farsight/libnice_0.0.13.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/farsight/farsight2_0.0.22.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./recipes/farsight/libnice_0.0.6.bb:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./classes/xfce.bbclass:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./classes/gnomebase.bbclass:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./classes/xfce46.bbclass:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> ./classes/efl.bbclass:AUTOTOOLS_STAGE_PKGCONFIG = "1"
> frans@linux-suse:~/oe/openembedded>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

