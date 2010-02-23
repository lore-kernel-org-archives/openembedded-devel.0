Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Njqj7-0007eP-I5 for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 10:06:49 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NjqgU-0004o3-By for openembedded-devel@lists.openembedded.org;
	Tue, 23 Feb 2010 10:04:02 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:04:02 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2010 10:04:02 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Feb 2010 10:03:51 +0100
Message-ID: <hm05ln$2cr$1@dough.gmane.org>
References: <18e217241002221429m1939c786u52da4672f626ca07@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100219 Shredder/3.0.3pre
In-Reply-To: <18e217241002221429m1939c786u52da4672f626ca07@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: using initramfs with openembedded.
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
X-List-Received-Date: Tue, 23 Feb 2010 09:06:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-02-10 23:29, C Michael Sundius wrote:
> We'd like to put our initial boottime file system into the initramfs in the
> kernel. But we also need to build some separate drivers to put into that
> filesystem image.
> 
> Of course we can't build those drivers without the kernel staging dir
> populated. (which doesn't happen until after the build of the kernel).
> 
> Has anyone run into this problem? how did you solve it? do I need to stage
> the headerfiles and config info before the kernel build?
> 
> maybe this problem is solved some other way.. I haven't really tried this so
> I'm just speculating here.
> 
> If anyone has some experience with this it would be great to hear how to go
> about this. thanks for you help

The common way right now is to use 2 kernel recipes. Not an optimal
situation, but it will get you there.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLg5n3MkyGM64RGpERAt6HAJ95plgifYy7yqC6mjovarzuokEPjwCgg0R1
d8Lfns4Aq/S9rwyV930RjME=
=2fyI
-----END PGP SIGNATURE-----



