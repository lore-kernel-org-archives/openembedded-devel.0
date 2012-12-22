Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TmRFR-0003JM-Ca for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 16:44:34 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TmR1L-0004KR-8m for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 16:29:51 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 16:29:51 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 16:29:51 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 22 Dec 2012 16:29:29 +0100
Message-ID: <kb4jkl$iuo$1@ger.gmane.org>
References: <1356098450-27475-1-git-send-email-koen@dominion.thruhere.net>
	<50D5BE1E.8060901@communistcode.co.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <50D5BE1E.8060901@communistcode.co.uk>
X-Enigmail-Version: 1.4.6
Subject: Re: [meta-oe][meta-multimedia][PATCH 1/6] xbmc: first try at making it build for non-GLES platforms
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
X-List-Received-Date: Sat, 22 Dec 2012 15:44:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-12-12 15:05, Jack Mitchell schreef:
> Hi Koen,
> 
> On 12/21/12 14:00, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
>> .../recipes-mediacentre/xbmc/xbmc_git.bb           |    7 ++++--- 1
>> files changed, 4 insertions(+), 3 deletions(-)
>> 
>> diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb 
>> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb index
>> 74bf710..6331306 100644 ---
>> a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb +++
>> b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb @@ -3,13 +3,13
>> @@ DESCRIPTION = "XBMC Media Center" LICENSE = "GPLv2" LIC_FILES_CHKSUM
>> = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff" -DEPENDS =
>> "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi 
>> mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug
>> libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer
>> virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca
>> avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl
>> jasper zip-native zlib libtinyxml" +DEPENDS = "libmad libusb1 libcec
>> libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba
>> fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms
>> cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3
>> libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0
>> libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native
>> zlib libtinyxml" #require recipes/egl/egl.inc SRCREV =
>> "82388d55dae79cbb2e486e307e23202e76a43efa"
>> 
> 
> I don't know how closely you follow XBMC, but there is a new release
> just round the corner, so it may be worth working with the beta builds
> rather than doing lots of work on an older version.
> 
> I'm sure you know what you're doing, but just a heads up in case the news
> had slipped past you!

That new release introduces a number of problems:

* more external libraries needed, none of them friendly to crosscompiling
* issues when using gold as linker
* Incompatibility with external libav
* python detection is broken in crossbuilds

And more. I do want to get the new version working since I need the PVR
addons to work, but that is a lot more work than cleaning up this
known-working version.

The patches I'm sending are part of my xmas vacation project to get my xbmc
setup streamlined and using the FRI2 ELC giveaway as frontend. The backend
portion is done (tvheadend + oscam), now it's time for frontend (xbmc + pvr
addon) and middleware (transcoding.
Ross has impeccable timing with his upnp work as well :)

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQ1dHZMkyGM64RGpERAtPrAKCsl3BUmq6AyGntF1UWKCYRTe7RFACgqDUD
yxGw+4SKqTE6ebVw9COcm6E=
=kL17
-----END PGP SIGNATURE-----



