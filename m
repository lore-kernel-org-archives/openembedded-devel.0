Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pakh4-0002ze-20 for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 08:55:34 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pakgg-0006Se-JZ for openembedded-devel@lists.openembedded.org;
	Thu, 06 Jan 2011 08:55:10 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 08:55:10 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jan 2011 08:55:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 06 Jan 2011 08:54:55 +0100
Message-ID: <ig3sgf$f5j$1@dough.gmane.org>
References: <1294253374472299500@rkmorris.us>	<AANLkTikeER27XKSAJQ_A+ujdKAqtuowqZBD0jsG0ZoES@mail.gmail.com>	<1294268823607761500@rkmorris.us>
	<1294288661406628500@rkmorris.us>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294288661406628500@rkmorris.us>
X-Enigmail-Version: 1.0.1
Subject: Re: H1940 Boot Issues -> Executable Build Problems?
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
X-List-Received-Date: Thu, 06 Jan 2011 07:55:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06-01-11 05:37, Russell Morris wrote:
> Hi,
> 
> OK, a few more updates ...
> - I built using the angstrom-2008.1 distro, but I have the same issue. I also ran the helloworld application on the target as well, getting the error message "Illegal instruction" (the same as qemu, which I guess is good).
> - I found the .config file that you are referring to, and made this change. I built and ran the debug kernel, but no more information is provided (other than "Illegal instruction").
> - as a side note, I have to edit sumversion.c to fix a "known" issue (http://linux.derkeiler.com/Mailing-Lists/Kernel/2007-05/msg08279.html). You may want to update this in the master branch.

Does your kernel have EABI turned on? If it's built using linux.inc in
OE it will, but if it isn't using linux.inc, double check. Or add
'require linux.inc' to the recipe, that usually helps a lot.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNJXVPMkyGM64RGpERAn1YAJ0ZDBCI50yTboMvzrKs6l5Upb3kGACgiN9J
XlKDkdcTtrk74k7QmIhVlQs=
=pSaG
-----END PGP SIGNATURE-----



