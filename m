Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RYy3f-0003bs-TN for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 11:52:06 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RYxx3-0007qP-Qr for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 11:45:13 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:45:13 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 11:45:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 09 Dec 2011 11:45:00 +0100
Message-ID: <jbsorc$ean$1@dough.gmane.org>
References: <1323419602-13546-1-git-send-email-koen@dominion.thruhere.net>
	<1323419602-13546-2-git-send-email-koen@dominion.thruhere.net>
	<20111209102409.GE3848@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <20111209102409.GE3848@jama.jama.net>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-efl 2/2] expedite: update runtime dependencies to match evas update
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
X-List-Received-Date: Fri, 09 Dec 2011 10:52:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-12-11 11:24, Martin Jansa schreef:
> On Fri, Dec 09, 2011 at 09:33:22AM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net> --- 
>> meta-efl/recipes-efl/e17/expedite_svn.bb |    5 ++++- 1 files changed,
>> 4 insertions(+), 1 deletions(-)
>> 
>> diff --git a/meta-efl/recipes-efl/e17/expedite_svn.bb
>> b/meta-efl/recipes-efl/e17/expedite_svn.bb index ee91c98..dfcbcde
>> 100644 --- a/meta-efl/recipes-efl/e17/expedite_svn.bb +++
>> b/meta-efl/recipes-efl/e17/expedite_svn.bb @@ -1,9 +1,10 @@ DESCRIPTION
>> = "Expedite is a comprehensive benchmarking suite for Evas" DEPENDS =
>> "eet evas" -RDEPENDS_${PN} = "expedite-themes evas-engine-buffer
>> evas-engine-fb evas-engine-software-generic evas-engine-software-x11
>> evas-engine-gl-x11 evas-loader-png" LICENSE = "MIT BSD" + SRCREV =
>> "${EFL_SRCREV_1.1.0}" PV = "1.1.0+svnr${SRCPV}" +PR = "r1"
>> 
>> inherit e SRC_URI =
>> "${E_SVN}/trunk;module=${SRCNAME};proto=http;scmdata=keep" @@ -27,3
>> +28,5 @@ EXTRA_OECONF = "\ "
>> 
>> FILES_${PN} += "${datadir}" +RDEPENDS_${PN} = "expedite-themes
>> evas-engine-fb evas-engine-software-generic evas-engine-software-x11
>> evas-engine-gl-x11 evas-loader-png" + -- 1.7.2.5
> 
> not using expedite here, but makes sense wrt evas changes so

Noone is, it lacks a license checksum, but I wanted to fix this issue right
now instead of waiting for someone to fix expedite completely :)

I guess I'll be drawing the short straw after our conversation about NEON :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7h5qoACgkQMkyGM64RGpGjLQCgoQORguHOb1z99m0D0LAX4oif
EHYAnjoqoabEZNmwmXkw+TJWvqsYPFng
=plE/
-----END PGP SIGNATURE-----



