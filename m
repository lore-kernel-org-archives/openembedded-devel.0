Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ngl0B-0003c7-R4 for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 21:23:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ngkxf-0004wW-IS for openembedded-devel@lists.openembedded.org;
	Sun, 14 Feb 2010 21:20:59 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 21:20:59 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Feb 2010 21:20:59 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 14 Feb 2010 21:20:44 +0100
Message-ID: <hl9luq$dgl$1@ger.gmane.org>
References: <20100214170414.GG30265@mx.loc>	<20100214173347.2B1D61817E775@dd20204.kasserver.com>
	<20100214183759.GH30265@mx.loc>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100204 Shredder/3.0.2pre
In-Reply-To: <20100214183759.GH30265@mx.loc>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: = ? UTF-8 ? B ? Ww== ? =oe= ? UTF-8 ? B ? XQ== ? = How to sane replace a path in a pkgconfig file ?
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
X-List-Received-Date: Sun, 14 Feb 2010 20:23:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-02-10 19:37, Bernhard Reutner-Fischer wrote:

> classes/pkgconfig.bbclass suggests that .pc are fixed up in
> do_install_prepend() (why does the efl class duplicate this, btw?)
> and that this depends on stage.

Because the efl classes suck, they also override things like PACKAGES.
With new-style staging and the current state of e svn we should be able
to get rid of that crap altogether.

That reminds me, I wanted to add

do_configure_prepend() {
	autopoint
}

to those clase to make the modules build again.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLeFscMkyGM64RGpERAi25AKCtuADXMEd569iE9OeUE6Yc6kXfTQCdEw2b
35Qg7/ZldiOSulSB71Pbo44=
=kiKn
-----END PGP SIGNATURE-----



