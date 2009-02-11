Received: from [213.165.64.20] (helo=mail.gmx.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <g.development@gmx.net>) id 1LXChR-0001RK-D5
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Feb 2009 11:52:13 +0100
Received: (qmail 6638 invoked by uid 0); 11 Feb 2009 10:51:04 -0000
Received: from 212.42.238.78 by www031.gmx.net with HTTP;
	Wed, 11 Feb 2009 11:51:04 +0100 (CET)
Date: Wed, 11 Feb 2009 11:51:04 +0100
From: "Ali Botorabi" <g.development@gmx.net>
In-Reply-To: <mailman.0.1234264323.11785.openembedded-devel@lists.openembedded.org>
Message-ID: <20090211105104.67620@gmx.net>
MIME-Version: 1.0
References: <mailman.0.1234264323.11785.openembedded-devel@lists.openembedded.org>
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #11512862
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX19sio5+V4RsJghkq3/hDzT6OGf4IlLS1yRmMRTFYo
	AEN1n5KUYZ/rHhaZjpHY7xoqwjNa679d8usg== 
X-GMX-UID: +cH5ISNPTlI8d3bJ2Ghr8S1OU2poZVkM
X-FuHaFi: 0.6
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
X-List-Received-Date: Wed, 11 Feb 2009 10:52:13 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hello,

I am trying to include some of the GStreamer plugins into an own image. The image bases on angstrom base and X11 images. Koen helped me to setup a task for the GStreamer plugins:

-------------------------------------
DESCRIPTION = "ToDo"
LICENSE = "ToDo"
PR = "r1.4"

#PREFERRED_PROVIDER_gst-plugin-alsa ?= "gst-plugins-good"

DEPENDS = "gst-plugins-base gst-plugins-bad gst-plugins-good gst-plugins-ugly libogg libvorbis directfb"
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
"

inherit task
------------------------------

This task is included by the image recipe. Bitbake evaluates the task and complains about various packages providing the plugins (base, good, ugly, bad). I have also tried to use PREFERRED_PROVIDER, it had no effect.

The major problem is that the plugins do not end in the image.

Any help is highly appreciated.

Cheers
Botorabi

-- 
Psssst! Schon vom neuen GMX MultiMessenger gehört? Der kann`s mit allen: http://www.gmx.net/de/go/multimessenger01


