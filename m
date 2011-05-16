Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QLs4O-0006ap-6U for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 09:18:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QLs1b-0003tP-OY for openembedded-devel@lists.openembedded.org;
	Mon, 16 May 2011 09:15:31 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 09:15:31 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 May 2011 09:15:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 16 May 2011 09:15:19 +0200
Message-ID: <iqqiu6$5pp$1@dough.gmane.org>
References: <1305495926-21490-1-git-send-email-otavio@ossystems.com.br>
	<1305495926-21490-2-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305495926-21490-2-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH v1 2/3] libpcsclite: add version 1.7.2
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
X-List-Received-Date: Mon, 16 May 2011 07:18:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-05-11 23:45, Otavio Salvador wrote:
> The recipe name libpcsclite has been choosen since this is the most
> important and used part of the project. The daemon itself is optional
> and not always required to be installed.

Wouldn't debian.bbclass already take care of such renaming with proper
packaging?



> +++ b/meta-oe/recipes-support/pcsc-lite/libpcsclite_1.7.2.bb

> +INITSCRIPT_PACKAGES = "pcscd"
> +INITSCRIPT_NAME_pcscd = "pcscd"
> +INITSCRIPT_PARAMS_pcscd = "defaults"

These should go near the other _pscsd entries

> +
> +EXTRA_OECONF = " \
> +	--enable-libusb \
> +	--disable-libudev \

Please add the proper libusb to DEPENDS and a comment why udev is in
DEPENDS, but disabled
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN0M8GMkyGM64RGpERAsJXAJ9aFHqXmtSGZ2rDgvTSnu+5DAPK/wCeNonq
weHpoQIB5GTXDvMvOjT4d/w=
=rHle
-----END PGP SIGNATURE-----



