Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9aDf-0000nC-N1 for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 10:44:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O9aA0-00041i-Nt for openembedded-devel@lists.openembedded.org;
	Wed, 05 May 2010 10:40:52 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 10:40:52 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 May 2010 10:40:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 05 May 2010 10:40:40 +0200
Message-ID: <hrrau9$gr$1@dough.gmane.org>
References: <1273041286-632-1-git-send-email-hvontres@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100421 Shredder/3.0.5pre
In-Reply-To: <1273041286-632-1-git-send-email-hvontres@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libtorrent / rtorrent: add latest upstream versions and fix crash on nslu2
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
X-List-Received-Date: Wed, 05 May 2010 08:44:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05-05-10 08:34, Henry von Tresckow wrote:
> - added version 0.12.6 of libtorrent and 0.8.6 of rtorrent
> - added FULL_OPTIMIZATION_nslu2 ="-mcpu=xscale -fexpensive-optimizations -frename-registers -O2 -fpermissive -fno-inline"

It would be better to stuff that in your $DISTRO as:

FULL_OPTIMIZATION_pn-rtorrent = "-mcpu=xscale -fexpensive-optimizations
- -frename-registers -O2 -fpermissive -fno-inline"

or

FULL_OPTIMIZATION_pn-rtorrent_nslu2 = "-mcpu=xscale
- -fexpensive-optimizations -frename-registers -O2 -fpermissive -fno-inline"

See the perl example in
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/conf/distro/include/angstrom-glibc.inc

And "-fexpensive-optimizations" should only be used after manually
verifying the performance increase, on ARM it usually doesn't work as
intended.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL4S8IMkyGM64RGpERAsQqAJ48FKOGVu0W2fWNjoj9nqabFo+dnwCeNqsa
d7h1UrgBA+KqUsQziN40OYY=
=U5hG
-----END PGP SIGNATURE-----



