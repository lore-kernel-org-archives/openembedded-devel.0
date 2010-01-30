Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NbGIA-0000wP-J0 for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 17:35:29 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NbGFr-0006Hj-Oz for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 17:33:03 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 17:33:03 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 17:33:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 30 Jan 2010 17:32:43 +0100
Message-ID: <hk1mv9$vao$1@ger.gmane.org>
References: <6594c4541001300748n1e9939f2t2ef47cb7738f2f4d@mail.gmail.com>
	<6594c4541001300751j40b0c294g8f185063f80d1607@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100114 Shredder/3.0.2pre
In-Reply-To: <6594c4541001300751j40b0c294g8f185063f80d1607@mail.gmail.com>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Problems with building minimial-image for AVR32
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
X-List-Received-Date: Sat, 30 Jan 2010 16:35:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 30-01-10 16:51, clemens novak wrote:
> Dear all,
> 
> I'm fairly new to Openembedded, and try to build a system for the
> Atmel NGW100. I proceeded according to the getting started guide
> (obtaining bitbake and checking out openembedded). My local.conf sets
> DL_DIR, BBFILES,
> MACHINE = "atngw100"
> TARGET_OS = "linux-uclibc"
> DISTRO = "angstrom-2008.1"
> ANGSTROM_MODE = "uclibc"
> ANGSTROMLIBC = "uclibc"

Remove the TARGET_OS setting, local.conf is not the place to poke at
that, the ANGSTROM_MODE will do the right thing already.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLZF8qMkyGM64RGpERAqQwAJ9xLOXBzkj7PDpUP3bQa8ASbCN0OwCgtODf
EdY0DbG0OCh+4C+ohgJ4kGA=
=hFY0
-----END PGP SIGNATURE-----



