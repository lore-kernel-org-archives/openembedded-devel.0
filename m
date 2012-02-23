Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S0eNr-0003U0-6u for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 20:31:19 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S0eFj-00075u-CC for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 20:22:55 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 20:22:55 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 20:22:55 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 23 Feb 2012 20:22:42 +0100
Message-ID: <ji63m1$2j9$1@dough.gmane.org>
References: <cover.1330012144.git.otavio@ossystems.com.br>
	<50fc468523586eeb1c2d57252bce1afdaa9cb26c.1330012144.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
In-Reply-To: <50fc468523586eeb1c2d57252bce1afdaa9cb26c.1330012144.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.3.5
Subject: Re: [PATCH][meta-oe 1/1] toscoterm: add
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
X-List-Received-Date: Thu, 23 Feb 2012 19:31:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Otavio and I had an offline talk about this and I moved a better version of
this.

Op 23-02-12 16:49, Otavio Salvador schreef:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br> --- 
> meta-oe/recipes-support/toscoterm/toscoterm_git.bb |   26
> ++++++++++++++++++++ 1 files changed, 26 insertions(+), 0 deletions(-) 
> create mode 100644 meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> 
> diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
> b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb new file mode
> 100644 index 0000000..d31b529 --- /dev/null +++
> b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb @@ -0,0 +1,26 @@ 
> +DESCRIPTION = "A very small and simple terminal emulator" +SECTION =
> "x11/applications" +DEPENDS = "vte" +RDEPENDS += "glibc-gconv-ibm437" + 
> +LICENSE = "GPLv3" +LIC_FILES_CHKSUM =
> "file://main.c;start_line=5;end_line=16;md5=9ae4bf20caf291afa94530026bd15229"
>
> 
+
> +# 0.2 version +SRCREV = "8586d617aed19fc75f5ae1e07270752c1b2f9a30" 
> +SRC_URI = "git://github.com/OSSystems/toscoterm.git" + +S =
> "${WORKDIR}/git" + +inherit gitpkgv pkgconfig + +do_compile() { +
> oe_runmake \ +		CC="${CC}" \ +		CFLAGS="`pkg-config --cflags
> vte`${CFLAGS}" \ +		LDFLAGS="`pkg-config --libs vte` ${LDFLAGS}" +} + 
> +do_install() { +	oe_runmake PREFIX="/usr" DESTDIR="${D}" install +}

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9GkfwACgkQMkyGM64RGpGgRACeOZFLeeHFvQvVa9Glt4ETQa/R
6l0AoJOvi8DB4lScBFOtu/XC13COJjId
=GzJD
-----END PGP SIGNATURE-----



