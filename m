Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.development@gmx.net>) id 1LZRtG-0000rg-CZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Feb 2009 16:29:42 +0100
Received: (qmail 18854 invoked by uid 0); 17 Feb 2009 15:27:39 -0000
Received: from 212.42.244.241 by www008.gmx.net with HTTP;
	Tue, 17 Feb 2009 16:27:39 +0100 (CET)
Date: Tue, 17 Feb 2009 16:27:39 +0100
From: "Ali Botorabi" <g.development@gmx.net>
Message-ID: <20090217152739.171050@gmx.net>
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #11512862
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1/wqiZFhgrwFpfMNKvU+vHtuiQRMmEsOMKSrO8udz
	7csnPtW9qnUl1phpe5+2jLd1+5k0dVCrJi5g== 
X-GMX-UID: U+CpfZMwf2IsN0nFw2xoXQ94dWxlc1b4
X-FuHaFi: 0.53
Subject: Problem with baking GStreamer Plugins
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
X-List-Received-Date: Tue, 17 Feb 2009 15:29:42 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

hello koen,

i have tried your suggestion, however it did not help. i have also tried to add the needed plugins into RDEPENDS and RRECOMMENDS such as:


RDEPENDS_${PN} = "\
		libid3tag \
		libsidplay \
		libvorbis \
		libogg \
		directfb \
		alsa-lib \
		gstreamer \
		gst-plugin-alsa \
		gst-plugin-icydemux \
		gst-plugin-asfdemux \
		gst-plugin-dvdlpcmdec \
		gst-plugin-mpegstream \
		gst-plugin-realmedia \
  gst-plugin-mad \
  gst-plugin-modplug \
  gst-plugin-ivorbis \
  gst-plugin-tcp \
  gst-plugin-audioconvert \
  gst-plugin-esd \
  gst-plugin-typefindfunctions \
  gst-plugin-decodebin \
  gst-plugin-volume \
"
but it did not helo either.

any other ideas?

cheers
botorabi


Koen wrote
##########

On 11-02-09 11:51, Ali Botorabi wrote:
> Hello,
>
> I am trying to include some of the GStreamer plugins into an own image. The image bases on angstrom base and X11 images. Koen helped me to setup a task for the GStreamer plugins:

[snip]

> The major problem is that the plugins do not end in the image.

There is a simple solution to this, but I'm not sure everyone will like it:

--- a/packages/gstreamer/gst-plugins.inc
+++ b/packages/gstreamer/gst-plugins.inc
@@ -3,8 +3,6 @@ DESCRIPTION = "Plugins for GStreamer"
  DEPENDS = "gstreamer libmikmod liboil libogg tremor libvorbis"
  DEPENDS += "${@base_conditional('ENTERPRISE_DISTRO', '1', '', 'libmad 
libid3tag', d)}"

-PACKAGES_DYNAMIC = "gst-plugin-*"
-

--- /dev/null   2008-08-09 15:46:29.777083446 +0200
+++ gst-plugins.bb      2009-02-11 12:43:23.000000000 +0100
@@ -0,0 +1,5 @@
+
+DEPENDS = "gst-plugins-good gst-plugins-bad gst-plugins-ugly"
+
+PACKAGES_DYNAMIC = "gst-plugin-*"
+

Doing it like that will git rid of the PACKAGES_DYNAMIC statements 
confusing eachother. It also means you have to build *all* plugin sets.

regards,

Koen


-- 
Jetzt 1 Monat kostenlos! GMX FreeDSL - Telefonanschluss + DSL 
für nur 17,95 Euro/mtl.!* http://dsl.gmx.de/?ac=OM.AD.PD003K11308T4569a


