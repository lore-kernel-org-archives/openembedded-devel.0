Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NeOxg-0000qj-IR for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 09:27:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NeOvG-0000Qj-G7 for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 09:24:46 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 09:24:46 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 09:24:46 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 08 Feb 2010 09:24:25 +0100
Message-ID: <hkohno$vbt$1@ger.gmane.org>
References: <000001caa883$7bdd6710$73983530$@in>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <000001caa883$7bdd6710$73983530$@in>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Facing problem while building Angstrom Image with help of openembedded
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
X-List-Received-Date: Mon, 08 Feb 2010 08:27:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-02-10 06:56, Tejas wrote:

Let's trim the log a bit:

> Resolving ftp.gnu.org... failed: Temporary failure in name resolution.
> 
> wget: unable to resolve host address `ftp.gnu.org'
> NOTE: fetch ftp://mirrors.kernel.org/gnu/coreutils/coreutils-7.2.tar.gz
> failed: Temporary failure in name resolution.
> 
> wget: unable to resolve host address `download.savannah.gnu.org'
> 
> NOTE: fetch
> http://www.angstrom-distribution.org/unstable/sources/quilt-0.46.tar.gz
> failed: Temporary failure in name resolution.
> 
> wget: unable to resolve host address `www.angstrom-distribution.org'

That is not an OE problem, that is most likely a problem with your
corporate firewall, contact your IT department to get that fixed.

There is a bug in bitbake where it doesn't honour GIT_PROXY_COMMAND, but
you shouldn't be running into that since all the git stuff for
stable/2009 is already mirrored on htttp
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLb8o5MkyGM64RGpERAlfNAJ9FO1WvxJ6Baw4DXLlEok/+KKLuEgCbBVIm
zWiq1kwYJDdanQr7273TId0=
=qLSY
-----END PGP SIGNATURE-----



