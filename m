Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RYzSd-0007jI-5U for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 13:21:55 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RYzM2-00082Q-4a for openembedded-devel@lists.openembedded.org;
	Fri, 09 Dec 2011 13:15:06 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 13:15:05 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Dec 2011 13:15:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 09 Dec 2011 13:14:53 +0100
Message-ID: <jbsu3u$img$1@dough.gmane.org>
References: <cover.1323432272.git.otavio@ossystems.com.br>
	<9641b1aa618783af7dd82f10d4c1a6ae4d693d15.1323432272.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <9641b1aa618783af7dd82f10d4c1a6ae4d693d15.1323432272.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-oe][PATCH 1/2] qconnman: add
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
X-List-Received-Date: Fri, 09 Dec 2011 12:21:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 09-12-11 13:04, Otavio Salvador schreef:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> meta-oe/recipes-qt/qconnman/qconnman_git.bb |   16 ++++++++++++++++ 1
> files changed, 16 insertions(+), 0 deletions(-) create mode 100644
> meta-oe/recipes-qt/qconnman/qconnman_git.bb
> 
> diff --git a/meta-oe/recipes-qt/qconnman/qconnman_git.bb
> b/meta-oe/recipes-qt/qconnman/qconnman_git.bb new file mode 100644 index
> 0000000..51b458b --- /dev/null +++
> b/meta-oe/recipes-qt/qconnman/qconnman_git.bb @@ -0,0 +1,16 @@ 
> +DESCRIPTION = "ConnMan management interface done in Qt" +DEPENDS =
> "connman" + +LICENSE = "LGPLv2.1" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=4fbd65380cdd255951079008b364516c" + +inherit
> autotools qt4x11 + +EXTRA_QMAKEVARS_PRE += "PREFIX=/usr" +EXTRA_OEMAKE +=
> "INSTALL_ROOT=${D}" + +PV = "0.0+gitr${SRCPV}" +SRCREV =
> "9bab120f426e41552c369b7030414c792dd25a91" +SRC_URI =
> "git://github.com/OSSystems/qconnman.git" + +S = "${WORKDIR}/git/"

Can I talk you into adding a 'inherit qt4e' version as well?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7h+7sACgkQMkyGM64RGpHAxgCgsBxvzbjbLz0GII6RmgCNGU2H
smQAn1CPeCyO5X8N+eO9wqtE+v1G7OxA
=LtMP
-----END PGP SIGNATURE-----



