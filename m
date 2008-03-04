Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JWKjZ-0004GA-Q7
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 01:10:20 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JWKiM-00065Q-Vw
	for openembedded-devel@openembedded.org; Tue, 04 Mar 2008 00:09:03 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 04 Mar 2008 00:09:02 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 04 Mar 2008 00:09:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Tue, 04 Mar 2008 01:08:53 +0100
Message-ID: <fqi3ul$e08$1@ger.gmane.org>
References: <1204303564.8126.38.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <1204303564.8126.38.camel@dax.rpnet.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Mar 2008 00:10:21 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Richard Purdie schreef:
| Hi,
|
| OE.dev is now just about ready to switch to using sysroot. The compilers
| have been updated to activate sysroot and the fixes I/Poky have for
| various pkgconfig issues have been committed. The final change is to
| actually change the layout.

I decided now is a good time to commit testlab.bbclass so people can
track down *image* differences quite easily before and after these
changes. Just add INHERIT += "testlab" to your local.conf and read the
comments in classes/testlab.bbclass to see what it does.

This was done in an effort to give everyone a CELF testlab at home, with
target regression testing a planned feature[1].

regards,

Koen

[1] Currently depends on how fast USPS can deliver to .nl and wether the
products from http://20sim.com are stable enough to finish my Control
Engineering assigments in a timely fashion ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHzJMVMkyGM64RGpERApVYAJ9bzjwoAS2ltORm3CTgLvMePp8fZgCeIl39
JPfYgVZjKMXeVnGCpIpa11k=
=Q2h6
-----END PGP SIGNATURE-----



