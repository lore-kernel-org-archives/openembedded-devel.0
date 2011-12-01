Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RW8vJ-00034X-Oe for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 16:51:45 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RW8or-0005zr-PM for openembedded-devel@lists.openembedded.org;
	Thu, 01 Dec 2011 16:45:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 16:45:05 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2011 16:45:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 01 Dec 2011 16:44:51 +0100
Message-ID: <jb87dj$92e$1@dough.gmane.org>
References: <1322748446-29453-1-git-send-email-rafaelignacio.zurita@gmail.com>
	<20111201140933.GE2695@Boggieman>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <20111201140933.GE2695@Boggieman>
X-Enigmail-Version: 1.3.3
Subject: Re: [PATCH] directvnc: Add initial recipe with version 0.7.7
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
X-List-Received-Date: Thu, 01 Dec 2011 15:51:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-12-11 15:09, Kristoffer Ericson schreef:
> 
> Acked-by: Kristoffer Ericson <kristoffer.ericson@gmail.com>

Why do you ACK a recipe with obvious style issues?


> 
> On Thu, Dec 01, 2011 at 11:07:26AM -0300, Rafael Ignacio Zurita wrote:
>> DirectVNC provides a very thin VNC client for unix framebuffer
>> systems.
>> 
>> Signed-off-by: Rafael Ignacio Zurita <rafaelignacio.zurita@gmail.com> 
>> --- recipes/directvnc/directvnc_0.7.7.bb |   12 ++++++++++++ 1 files
>> changed, 12 insertions(+), 0 deletions(-) create mode 100644
>> recipes/directvnc/directvnc_0.7.7.bb
>> 
>> diff --git a/recipes/directvnc/directvnc_0.7.7.bb
>> b/recipes/directvnc/directvnc_0.7.7.bb new file mode 100644 index
>> 0000000..9e9afa7 --- /dev/null +++
>> b/recipes/directvnc/directvnc_0.7.7.bb @@ -0,0 +1,12 @@ +DESCRIPTION =
>> "DirectVNC provides a very thin VNC client for unix framebuffer
>> systems." +HOMEPAGE = "http://drinkmilk.github.com/directvnc/" +SECTION
>> = "utils" +LICENSE = "GPLv2" +DEPENDS_${PN} = "zlib libpng jpeg
>> directfb" + +SRC_URI =
>> "https://github.com/downloads/drinkmilk/directvnc/directvnc-${PV}.tar.gz"
>>
>> 
+
>> +inherit autotools + +SRC_URI[md5sum] =
>> "e30f1a0e45b440443c044148fb62ad6e" +SRC_URI[sha256sum] =
>> "ac8c0a6b6aaf0702411e71dd3626c655287c903233b659389fc07113114c9de3" -- 
>> 1.7.0.4

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7XoPMACgkQMkyGM64RGpHIVQCguP2wCvEyyLeEKQ3nbfeNj/bQ
6lgAn0rlf26OGEuPuNyK1nnlvDZjNb7q
=ixh+
-----END PGP SIGNATURE-----



