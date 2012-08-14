Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1E6h-0006Jg-No for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 12:12:15 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1DvA-0006ik-Vf for openembedded-devel@lists.openembedded.org;
	Tue, 14 Aug 2012 12:00:20 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 12:00:20 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Aug 2012 12:00:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 14 Aug 2012 11:57:18 +0200
Message-ID: <k0d7ds$odu$2@dough.gmane.org>
References: <CAL2sKTn13OQ4edHfMwEVzLrpEO1prWGJ_V-1ueZj4KH4BBTDtA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <CAL2sKTn13OQ4edHfMwEVzLrpEO1prWGJ_V-1ueZj4KH4BBTDtA@mail.gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [RFC][PATCH] plowshare: Add Git version (initial recipe)
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
X-List-Received-Date: Tue, 14 Aug 2012 10:12:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-08-12 11:48, Matthieu schreef:
> Add recipe for plowshare (git repository).
> 
> Signed-off-by: Matthieu Crapet <mcrapet@gmail.com> --- plowshare_git.bb |
> 25 +++++++++++++++++++++++++ 1 file changed, 25 insertions(+) create mode
> 100644 plowshare_git.bb
> 
> diff --git a/plowshare_git.bb b/plowshare_git.bb

Directory structure?

> new file mode 100644 index 0000000..ec33bff --- /dev/null +++
> b/plowshare_git.bb @@ -0,0 +1,25 @@ +DESCRIPTION = "Command-line
> download/upload tool for file sharing hosters" +HOMEPAGE =
> "http://code.google.com/p/plowshare/" +SECTION = "console/utils" + 
> +LICENSE = "GPLv3" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504" + +PV =
> "gitr${SRCPV}"

No

> +PE = "1"

No

> +SRCREV = "${AUTOREV}"

Hell no!

> +DEPENDS = "bash curl"

RDEPENDS_${PN}

> +SRC_URI =
> "git://code.google.com/p/plowshare.git;protocol=http;branch=master" +S =
> "${WORKDIR}/git" + +inherit allarch + +# Nothing to compile, it's
> scripts! +do_compile() { +	: +} + +do_install() { +	oe_runmake
> PREFIX="${prefix}" DESTDIR="${D}" install +} -- 1.7.9.5
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQKiD+MkyGM64RGpERAnvKAKCz9+ARsy0k+JWrVQWjXnLfBqtF9wCgm6lN
ECd9h8ZSl49eDoOTSlbkiRo=
=MO1Y
-----END PGP SIGNATURE-----



