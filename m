Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <eha@doredevelopment.dk>) id 1IhL9B-0006xq-9B
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 10:17:58 +0200
Received: from ehavirtualbox ([87.62.18.129])
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id l9F8BTwE022514
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 10:11:35 +0200
From: "Esben Haabendal" <eha@doredevelopment.dk>
To: <openembedded-devel@openembedded.org>
References: <E1Ih50c-0005Xz-Bs@linuxtogo.org> <471263F8.30501@xora.org.uk>
In-Reply-To: <471263F8.30501@xora.org.uk>
Date: Mon, 15 Oct 2007 10:11:29 +0200
Message-ID: <009f01c80f03$00d29b60$0277d220$@dk>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcgOnsHafGg/VvYyQryL5/K5kwBTjwAYwerg
X-SPAMPOST-COUNTRY: DK
X-SPAMPOST-POPBEFORESMTP: Yes
Subject: Re: [oe-commits] org.oe.dev libid3tag: update to 0.15.1b, fix SRC_URI - close #3147
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2007 08:17:58 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: da

Hi Graeme

Sorry, I did not know there was such a variable. I just picked a random
package with upstream source on sf.net and did something similar.

Seems like a general cleanup could be needed:

esben@esben:/stuff/openembedded/packages$ grep --include="*.bb"
--include="*.inc" -r .sourceforge.net  .|grep SRC_URI|grep -v cvs:|grep -v
svn:
./madfu/madfu_1.2.bb:SRC_URI =
"http://heanet.dl.sourceforge.net/sourceforge/usb-midi-fw/madfuload-1.2.tar.
gz \
./tinyscheme/tinyscheme_1.35.bb:SRC_URI =
"http://tinyscheme.sourceforge.net/tinyscheme-${PV}.tar.gz"
./tuxnes/tuxnes_0.75.bb:SRC_URI =
"http://heanet.dl.sourceforge.net/sourceforge/tuxnes/tuxnes-0.75.tar.gz"
./bluez/bluez-utils3.inc:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-libs_3.7.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-libs-${PV}.tar.gz"
./bluez/bluez-utils_3.13.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-utils_3.16.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-utils_3.8.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-hcidump_1.37.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
./bluez/bluez-libs_3.8.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-libs-${PV}.tar.gz"
./bluez/bluez-utils_3.12.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-hcidump_1.32.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
./bluez/bluez-hcidump_1.31.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
./bluez/bluez-utils_3.17.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-hcidump_1.26.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
./bluez/bluez-gnome_0.13.bb:SRC_URI =
"http://bluez.sourceforge.net/download/${P}.tar.gz"
./bluez/bluez-libs.inc:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-libs-${PV}.tar.gz"
./bluez/bluez-hcidump_1.33.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
./bluez/bluez-gnome_0.14.bb:SRC_URI =
"http://bluez.sourceforge.net/download/${P}.tar.gz"
./bluez/bluez-utils.inc:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-hcidump_1.38.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
./bluez/bluez-hcidump_1.29.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-hcidump-${PV}.tar.gz"
./bluez/bluez-utils_3.15.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-libs_3.4.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-libs-${PV}.tar.gz"
./bluez/bluez-utils_3.11.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-gnome_0.10.bb:SRC_URI =
"http://bluez.sourceforge.net/download/${P}.tar.gz"
./bluez/bluez-utils_3.14.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-utils_3.4.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./bluez/bluez-utils_3.7.bb:SRC_URI =
"http://bluez.sourceforge.net/download/bluez-utils-${PV}.tar.gz \
./sidplayer/sidplayer_1.5.0.bb:SRC_URI =
"http://sidplayer.sourceforge.net/sidplayer.tar.gz \
./bogofilter/bogofilter_0.96.0.bb:SRC_URI =
"http://download.sourceforge.net/bogofilter/bogofilter-${PV}.tar.bz2 \
./ccxstream/ccxstream_1.0.15.bb:SRC_URI =
"http://surfnet.dl.sourceforge.net/sourceforge/xbplayer/${P}.tar.gz \
./netatalk/netatalk_2.0.3.bb:SRC_URI =
"http://ovh.dl.sourceforge.net/sourceforge/netatalk/netatalk-${PV}.tar.gz \
./libmad/libmad_0.15.1b.bb:SRC_URI =
"http://downloads.sourceforge.net/mad/libmad-${PV}.tar.gz"
./nonworking/bluez-bluefw/bluez-bluefw_0.9.bb:SRC_URI =
"http://bluez.sourceforge.net/download/${PN}-${PV}.tar.gz"
./enchant/enchant_1.1.3.bb:SRC_URI =
"http://download.sourceforge.net/abiword/enchant-1.1.3.tar.gz"
./xoscope/xoscope_1.12.bb:SRC_URI =
"http://prdownloads.sourceforge.net/xoscope/xoscope-${PV}.tgz"
./procps/procps.inc:SRC_URI =
"http://procps.sourceforge.net/procps-${PV}.tar.gz \
./bb/bb_1.2.bb:SRC_URI =
"http://prdownloads.sourceforge.net/aa-project/bb-1.2.tar.gz \
./jards/jards_1.0.bb:SRC_URI =
"${SOURCEFORGE_MIRROR}/gakusei/jards_gakusei.cvs.sourceforge.net__20070212.t
ar.gz"
./xaos/xaos_3.2.3.bb:SRC_URI =
"http://easynews.dl.sourceforge.net/sourceforge/xaos/XaoS-3.2.3.tar.gz \
./nail/nail_11.21.bb:SRC_URI =
"http://optusnet.dl.sourceforge.net/sourceforge/nail/nail-11.21.tar.bz2 \
./mpeg2dec/mpeg2dec_0.4.0b.bb:SRC_URI =
"http://libmpeg2.sourceforge.net/files/mpeg2dec-${PV}.tar.gz"
./kstars/kstars-embedded_0.8.5.bb:SRC_URI =
"http://kstars.sourceforge.net/kstars-embedded-${PV}.tar.gz"
./liba52/liba52_0.7.4.bb:SRC_URI =
"http://liba52.sourceforge.net/files/a52dec-${PV}.tar.gz"
./freedoom/freedoom_0.3.bb:SRC_URI =
"http://ovh.dl.sourceforge.net/sourceforge/freedoom/freedoom-iwad-0.3.zip"
./wv/wv_1.2.0.bb:SRC_URI =
"http://switch.dl.sourceforge.net/sourceforge/wvware/wv-${PV}.tar.gz"
./midpath/midpath.inc:SRC_URI =
"http://downloads.sourceforge.net/midpath/midpath-${PV}.tar.gz"
./txdrug/txdrug_0.1.bb:SRC_URI =
"http://teax.sourceforge.net/txdrug-${PV}.tar.gz \
./libxine/libxine-x11_1.0.bb:SRC_URI =
"http://heanet.dl.sourceforge.net/sourceforge/xine/xine-lib-${PV}.tar.gz \
./bacula/bacula-client_1.38.11.bb:SRC_URI =
"http://heanet.dl.sourceforge.net/sourceforge/bacula/bacula-1.38.11.tar.gz \
./djvulibre/djvulibre_3.5.19.bb:SRC_URI =
"http://downloads.sourceforge.net/djvu/djvulibre-${PV}.tar.gz \
./gallery/gallery_1.5.5.bb:SRC_URI =
"http://easynews.dl.sourceforge.net/sourceforge/gallery/gallery-${PV}-pl1.ta
r.gz"
./libid3tag/libid3tag_0.15.1b.bb:SRC_URI =
"http://downloads.sourceforge.net/mad/libid3tag-${PV}.tar.gz "
./libgmime/libgmime_2.1.7.bb:SRC_URI =
"http://spruce.sourceforge.net/gmime/sources/v2.1/gmime-${PV}.tar.gz \
./hnb/hnb_1.9.17+1.9.18pre7.bb:SRC_URI =
"http://hnb.sourceforge.net/.files/hnb-1.9.18.pre7.tar.gz"
./python/python-pycurl_7.16.4.bb:SRC_URI =
"http://${SRCNAME}.sourceforge.net/download/${SRCNAME}-${PV}.tar.gz"
./kxml2/kxml2_2.3.0.bb:SRC_URI =
"http://downloads.sourceforge.net/kxml/${JAR}"
./lisa/lisa_0.2.2.bb:SRC_URI =
"http://lisa-home.sourceforge.net/src/lisa-${PV}.tar.bz2 \
./rng-tools/rng-tools_2.bb:SRC_URI =
"http://heanet.dl.sourceforge.net/sourceforge/gkernel/${P}.tar.gz \
./linux-atm/linux-atm_2.4.1.bb:SRC_URI =
"http://heanet.dl.sourceforge.net/sourceforge/linux-atm/linux-atm-${PV}.tar.
gz \
./fxload/fxload_0.0.20020411.bb:SRC_URI =
"http://dfn.dl.sourceforge.net/sourceforge/linux-hotplug/fxload-2002_04_11.t
ar.gz \
./xournal/xournal_0.4.bb:SRC_URI =
"http://xournal.sourceforge.net/xournal-${PV}.tar.gz \
./xournal/xournal_0.3.3.bb:SRC_URI =
"http://xournal.sourceforge.net/xournal-${PV}.tar.gz \
./xournal/xournal_0.4.0.1.bb:SRC_URI =
"http://xournal.sourceforge.net/xournal-${PV}.tar.gz \


I guess that many (all?) of these should be fixed to use
${SOURCEFORGE_MIRROR} as well.

Best regards,
Esben

> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org [mailto:openembedded-
> devel-bounces@openembedded.org] On Behalf Of Graeme Gregory
> Sent: Sunday, October 14, 2007 8:46 PM
> To: openembedded-devel@openembedded.org
> Subject: Re: [oe] [oe-commits] org.oe.dev libid3tag: update to 0.15.1b,
> fix SRC_URI - close #3147
> 
> eha commit wrote:
> > -SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libid3tag-${PV}.tar.gz "
> > +SRC_URI = "http://downloads.sourceforge.net/mad/libid3tag-
> ${PV}.tar.gz"
> >  S = "${WORKDIR}/libid3tag-${PV}"
> >
> >
> Same with this shouldnt it be ${SOURCEFORGE_MIRROR}
> 
> Graeme
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



