Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PiFb3-0005HM-Te for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 01:20:23 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PiFaG-0004dI-0J for openembedded-devel@lists.openembedded.org;
	Thu, 27 Jan 2011 01:19:32 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 01:19:31 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jan 2011 01:19:31 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 27 Jan 2011 01:19:16 +0100
Message-ID: <ihqdm4$jaj$1@dough.gmane.org>
References: <4D4092E8.8040207@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D4092E8.8040207@atmel.com>
X-Enigmail-Version: 1.0.1
Subject: Re: Patching from a file containing a compressed directory (<directory>.tar.bz2)
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
X-List-Received-Date: Thu, 27 Jan 2011 00:20:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 26-01-11 22:32, Ulf Samuelsson wrote:
>     Trying to change the at91 linux recipes.
>     The "experimental" patches to be added on top of the "maxim" patch
>     can be downloaded from ftp://ftp.at91.com/ and that file
>     is generated from a directory of patches, which should be applied
>     in alphabetical order.
> 
>     When the "obvious" SRC_URI  is used:
> 
>     ftp://ftp.at91.com/<directory>.tar.bz2;apply=yes \
> 
>      the files do not get applied in alphabetical order.
> 
>     It looks to me like they get applied in reverse order,  but I did
> not check carefully.
>     I tried adding a "series" file, and recompress, but that failed as
> well.
> 
>     Any clue on how to get the patches applied in alphabetical order?
> 
>     If the patches are in a subdirectory to the recipe, and applied
> manually
>     everything is OK, but that seems to be a shame to have to resort to
> that.

We don't want such behaviour, putting the patches in OE and adding them
to SRC_URI is the only acceptable way to do this.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNQLoEMkyGM64RGpERAo3fAJoDwcnY3HrWprnEOFzwcp1+VU/biQCfd0oZ
dJ7RQ/b2cMdBSdP3NFQsx6M=
=ZC5T
-----END PGP SIGNATURE-----



