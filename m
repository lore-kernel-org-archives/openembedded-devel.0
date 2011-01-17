Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PekEP-0004XX-VP for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 09:14:30 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PekDp-0003Qo-Qh for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 09:13:53 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:13:53 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 09:13:53 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Jan 2011 09:13:42 +0100
Message-ID: <ih0tnm$ra$1@dough.gmane.org>
References: <1295220721.13967.13.camel@mattotaupa>	<1295220990.13967.18.camel@mattotaupa>
	<1295221434.13967.25.camel@mattotaupa>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295221434.13967.25.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 3/3] libomxil-bellagio_git: add Git version
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
X-List-Received-Date: Mon, 17 Jan 2011 08:14:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-01-11 00:43, Paul Menzel wrote:
> Date: Mon, 17 Jan 2011 00:15:51 +0100
> 
> The last release is over a year old (2009-12-23).
> 
> Build tested with `angstrom-2008.1` for `MACHINE = "beagleboard"`.
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> 1. I hope the package numbering is correctly. I used the Freesmartphone packages as an example.
> 2. Is a `DP = "-1"` needed? Users of this recipe speak up please!

> +SRCREV = "772f0eca88b242ffb5469e8e381c63ce1f7cd3e1"
> +SRC_URI = "git://omxil.git.sourceforge.net/gitroot/omxil/omxil;protocol=git"
> +PV = "0.9.2.1+gitr${SRCPV}"
> +PR = "${INC_PR}.0"

For get recipes we generally do:

PR_append = "+gitr${SRCPV}" to keep the ugly hash out of PV, but keep it
available to the users
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNM/o2MkyGM64RGpERAiHnAJsGOFj7m3bh8Z5NepPB1ny1Z0hFBACgh9jW
LLatQnq+F8sl+/wKpvm+PbQ=
=IoJM
-----END PGP SIGNATURE-----



