Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PhojT-0007F6-2T for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 20:39:15 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Phoij-00053B-SH for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 20:38:29 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 20:38:29 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 20:38:29 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 25 Jan 2011 20:38:18 +0100
Message-ID: <ihn8ra$scb$1@dough.gmane.org>
References: <1295983479-15511-1-git-send-email-coolaj86@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1295983479-15511-1-git-send-email-coolaj86@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] nodejs: updated recipe to v0.2.6
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
X-List-Received-Date: Tue, 25 Jan 2011 19:39:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 25-01-11 20:24, AJ ONeal wrote:
> * libev-cross-cc.patch - turns off execution so that cross-compile succeeds
> * node-cross-cc.patch - enables cross-compiling of v8 for x86, x86_64, arm, and mips
> ---
>  recipes/nodejs/files/libev-cross-cc.patch |   17 +++++---------
>  recipes/nodejs/files/node-cross-cc.patch  |   19 ++++++++++------
>  recipes/nodejs/nodejs_0.2.6.bb            |   34 +++++++++++++++++++++++++++++

You're changing the patches, but don't remove the old version, do they
still work?

> +PR = "r4"

New recipes start at r0

>
> +do_compile () {
> +  make

oe_runmake
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNPyaqMkyGM64RGpERAnOkAJ95KjEsJ7wv3Pp7TSbKoCeUGU4lCACeN/c7
cvS+zggRWmNGmrYA+bDBt7g=
=vFFV
-----END PGP SIGNATURE-----



