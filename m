Received: from [208.97.132.66] (helo=homiemail-a21.g.dreamhost.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sebastian@SSpaeth.de>) id 1N2mbL-0006qV-6Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Oct 2009 15:00:46 +0100
Received: from [192.168.1.154] (unknown [195.190.170.102])
	by homiemail-a21.g.dreamhost.com (Postfix) with ESMTPA id 98A6F300064
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2009 06:59:38 -0700 (PDT)
Message-ID: <4AE6FCC8.8090704@SSpaeth.de>
Date: Tue, 27 Oct 2009 14:59:36 +0100
From: Sebastian Spaeth <Sebastian@SSpaeth.de>
Organization: ETH Zurich
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4AE6F615.4080204@SSpaeth.de> <hc6tgk$bvp$1@ger.gmane.org>
In-Reply-To: <hc6tgk$bvp$1@ger.gmane.org>
X-Enigmail-Version: 0.95.7
OpenPGP: id=C827A062
X-SA-Exim-Connect-IP: 208.97.132.66
X-SA-Exim-Mail-From: Sebastian@SSpaeth.de
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: gst-plugins-base -> gnome-vfs question
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
X-List-Received-Date: Tue, 27 Oct 2009 14:00:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 27-10-09 14:31, Sebastian Spaeth wrote:
>> Current "gst-plugins-base" in org.oe.dev unconditionally depends on
>> "gnome-vfs" which in turn pulls in stuff like "avahi".

> It's already optional, don't install gst-plugin-gnomevfs
Thanks for the quick reply.
I was referring to the fact that the "gst-plugins-base" package directly
depends on gnome-vfs.

eg.
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/gstreamer/gst-plugins-base_0.10.22.bb
contains:
DEPENDS += "libtheora alsa-lib libsm virtual/libx11 freetype gnome-vfs
libxv"

This does not look very optional to me. I keep thinking that there must
be something very obvious that I have missed.

>> I don't want avahi on my Freerunner, just because I want sound on it :-).
> I think you are confusing avahi and pulseaudio, in both cases you need
> to read up on the subject.

I do know the difference between avahi and pulseaudio, thank you ;-).

> You overlooked that installing gst-plugin-gnomevfs is completely your
> own choice

but gst-plugins-base pulling in gnome-vfs in its DEPENDS is not
optional, right?

Anyway, thanks for you quick reply. I guess I must have overlooked
something glaringly obvious here...

spaetz


