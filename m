Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JVtxm-000051-FC
	for openembedded-devel@openembedded.org; Sun, 02 Mar 2008 20:35:15 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JVtwi-0001RT-7X
	for openembedded-devel@openembedded.org; Sun, 02 Mar 2008 19:34:04 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 02 Mar 2008 19:34:04 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Sun, 02 Mar 2008 19:34:04 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Sun, 02 Mar 2008 20:33:58 +0100
Message-ID: <fqevf6$8tq$1@ger.gmane.org>
References: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803021104s4470cb31o45e1295b7564e876@mail.gmail.com>
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
Subject: Re: content addressable fetching of packages, through MD5SUM or SHA1SUM?
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
X-List-Received-Date: Sun, 02 Mar 2008 19:35:15 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| Hello,
|
|
| I wonder if someone knows about a content addressable file server, or
| content addressable URL server?
|
| The idea is that the bitbake fetcher does not use the SRC_URI provided
| URL per se, but can fall back to use the SHA1SUM or MD5SUM to ask
| "something" for alternative locations of the package.
|
|
| Such a "server" would implement a two table database:
|
| |authentic file name|md5sum|sha1sum|
|
| (the primary key is |md5sum|sha1sum|)
|
| In a different table, all instances of valid URI that provide this
| content are collected
|
| |md5sum|sha1sum|URI|
|
|
| Now, this might be a Google SoC project, and something that Google
| should have already.

what about:

for archive in * ; do
~   ln -sf $archive $(md5sum $archive)
~   ln -sf $archive $(sha256sum $archive)
done

That's the quick and dirty way :) If someone comes up with a script, I
can run in on the angstrom source mirror for people to test against.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFHywEmMkyGM64RGpERAk6GAKC7coKtqUP26q5zkV9pRc3881A5FACff8hi
XlTJA8PXuOnBxCVRWNNQCt0=
=Kg6V
-----END PGP SIGNATURE-----



