Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NdNUl-0007E6-SN for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 13:41:14 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NdNRw-0007ot-G6 for openembedded-devel@lists.openembedded.org;
	Fri, 05 Feb 2010 13:38:16 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2010 13:38:16 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Feb 2010 13:38:16 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 05 Feb 2010 13:37:32 +0100
Message-ID: <hkh3ea$jf9$1@ger.gmane.org>
References: <D15778FFF6A6CA4FAF01B8D2C3780300499DAE1590@ushqwmb02.palm1.palmone.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <D15778FFF6A6CA4FAF01B8D2C3780300499DAE1590@ushqwmb02.palm1.palmone.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Issues with .list files
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
X-List-Received-Date: Fri, 05 Feb 2010 12:41:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-02-10 04:24, Michael Morrell wrote:
> If I understand the algorithm in package_do_shlibs correctly, each package creates a .list file which is a list of all the shared libraries provided by that package.  It also generates a list of all the libraries that it needs and looks for those in .list files created by other packages so it can create a runtime dependency against that package.
> 
> The way it looks for .list files is to simply scan all *.list files in the directory.  This has two problems that I can see.
> 
> First, it is inefficient.  It should only have to look through .list files creates by packages created by bb files which were DEPENDed on by this bb file.

Ehm, no. If it did that you'd get missing shlibs in lots of cases. OE
won't error out, but you're stabbing users of the packages in the eye
since they get stuck with the mess.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLbBEMMkyGM64RGpERAnVlAJ4sLpf6WokOnRUEL+ecgeygyVsndgCdHMIm
P6+zfodeyheiFvYv63SJ6IE=
=Y2X0
-----END PGP SIGNATURE-----



