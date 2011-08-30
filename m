Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyOcp-00057O-9n for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 15:45:11 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QyOY8-0008IR-1m for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 15:40:20 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 15:40:20 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 15:40:20 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 30 Aug 2011 15:40:06 +0200
Message-ID: <j3ip7m$dn9$1@dough.gmane.org>
References: <cover.1314710438.git.noor_ahsan@mentor.com>
	<6fd3391284356229f914262016ff77276d88f054.1314710438.git.noor_ahsan@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
In-Reply-To: <6fd3391284356229f914262016ff77276d88f054.1314710438.git.noor_ahsan@mentor.com>
X-Enigmail-Version: 1.3
Subject: Re: [meta-oe][PATCH 1/1] debianutils: Add version 2.30 (initial recipe)
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
X-List-Received-Date: Tue, 30 Aug 2011 13:45:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 30-08-11 15:24, Noor, Ahsan schreef:
> From: Noor Ahsan <noor_ahsan@mentor.com>
> 
> * Imported from oe.dev commit id 280a17bc1d8132f97cf6a89b8bc08a32380fa357. * Merged .bb and .inc file
> 
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com> --- .../debianutils/debianutils_2.30.bb                |   49 ++++++++++++++++++++

> +pkg_prerm_${PN} () { +for app in add-shell  installkernel  mkboot  remove-shell run-parts  savelog  sensible-browser  sensible-editor  sensible-pager  tempfile  which ; do +   update-alternatives --remove $app $app.${PN} +done +} + +pkg_postinst_${PN} () { +#!/bin/sh +for app in add-shell
> installkernel  mkboot  remove-shell ; do +    update-alternatives --install ${sbindir}/$app $app $app.${PN} 100 +done +for app in savelog  sensible-browser  sensible-editor  sensible-pager  which ; do +    update-alternatives --install ${bindir}/$app $app $app.${PN} 100 +done +for app in
> run-parts  tempfile ; do +    update-alternatives --install ${base_bindir}/$app $app $app.${PN} 100 +done +}

The *insts are inconsistent, one has a shebang, the other doesn't and neither are safe to use in a cross environment.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOXOg2MkyGM64RGpERAjJ9AJ49QdImds18J3+35yKjLGJnKq/WzQCeJmGa
U0+Ri3DkNyu52JW5LJ9+QcU=
=l6E5
-----END PGP SIGNATURE-----



