Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QEIhY-0007UT-Pa for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 12:07:32 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QEIfB-0006LY-Sj for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 12:05:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 12:05:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Apr 2011 12:05:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 25 Apr 2011 12:04:54 +0200
Message-ID: <ip3h06$kfq$1@dough.gmane.org>
References: <1303725452-1908-1-git-send-email-sgh@sgh.dk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1303725452-1908-1-git-send-email-sgh@sgh.dk>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] wvstreams: Added recipe for wxstreams 4.6.1.
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
X-List-Received-Date: Mon, 25 Apr 2011 10:07:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-04-11 11:57, Søren Holm wrote:

> +LICENSE = "LGPL"

That needs a version number, e.g. LGPLv2.1

> +DEPENDS = "zlib openssl (>= 0.9.8)"

There's no < 0.9.8 in the tree anymore

> +# dbus detection currently broken in configure.ac; remember to add "dbus (>= 1.2.14)" to DEPENDS  when fixed

has it been fixed?

> +EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-dbus"

The pam stuff needs to be converted into something like:

DEPENDS += "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"

${@base_contains('DISTRO_FEATURES', 'pam', '--with-pam',
'--without-pam', d)}

> +
> +PACKAGES_prepend = "libuniconf libuniconf-dbg "
> +PACKAGES_prepend = "uniconfd uniconfd-dbg "
> +PACKAGES_prepend = "libwvstreams-base libwvstreams-base-dbg "
> +PACKAGES_prepend = "libwvstreams-extras libwvstreams-extras-dbg "

Change that to a single PACKAGES =+


> +do_configure() {
> +        autoreconf
> +        oe_runconf
> +}

Why not stock autotools_do_configure?

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNtUdGMkyGM64RGpERAsajAJ9nepgViPPFhbWwsS2AchhCw/tlBACfbVUa
JdSqbThI5m5aFsEd0cajYB4=
=gUZN
-----END PGP SIGNATURE-----



