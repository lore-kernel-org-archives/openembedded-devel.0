Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TePJM-0006gq-K7 for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 13:03:21 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TeP5h-0005xp-Qm for openembedded-devel@lists.openembedded.org;
	Fri, 30 Nov 2012 12:49:09 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 12:49:09 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2012 12:49:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 30 Nov 2012 12:48:50 +0100
Message-ID: <k9a6et$3en$1@ger.gmane.org>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH 1/6] freerdp: disable man pages generation
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
X-List-Received-Date: Fri, 30 Nov 2012 12:03:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I had trouble applying these from patchwork, can you provide a (rebased) git
branch where I can pull there from?

Op 28-11-12 20:30, Mario Domenech Goulart schreef:
> Man pages generation uses xmlto, and it seems that it is currently broken
> on OE.
> 
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br> --- 
> meta-oe/recipes-support/freerdp/freerdp_git.bb |    4 +++- 1 files
> changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/meta-oe/recipes-support/freerdp/freerdp_git.bb
> b/meta-oe/recipes-support/freerdp/freerdp_git.bb index 35228ad..099a80e
> 100644 --- a/meta-oe/recipes-support/freerdp/freerdp_git.bb +++
> b/meta-oe/recipes-support/freerdp/freerdp_git.bb @@ -7,7 +7,9 @@ inherit
> gitpkgv
> 
> PV = "gitr${SRCPV}" PKGV = "${GITPKGVTAG}" -PR = "${INC_PR}.0" +PR =
> "${INC_PR}.1" + +EXTRA_OECMAKE += "-DWITH_MANPAGES=OFF"
> 
> SRCREV = "e0f2b3ccc986a165d9c289a569b60eab66153792" SRC_URI =
> "git://github.com/FreeRDP/FreeRDP.git"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQuJ0iMkyGM64RGpERAp6nAJ9m+T3zIhckVKokIu0+ebv8psOheQCfd4K/
39G+sl2IPRuQJemkthsI+iM=
=rof6
-----END PGP SIGNATURE-----



