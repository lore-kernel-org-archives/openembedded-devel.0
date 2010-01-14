Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NVQR7-0007ko-Ed for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 15:12:37 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NVQOs-0000Vi-Ct
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jan 2010 15:10:14 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 15:10:14 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2010 15:10:14 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 Jan 2010 15:09:39 +0100
Message-ID: <hin8j3$2ml$1@ger.gmane.org>
References: <hill5g$ll0$1@ger.gmane.org>	<1263426466.457.286.camel@lenovo.internal.reciva.com>	<1263427123.15954.6.camel@dax.rpnet.com>	<hilp2s$ag$1@ger.gmane.org>	<himn94$8ui$1@ger.gmane.org>
	<hin7c8$ter$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100112 Shredder/3.0.2pre
In-Reply-To: <hin7c8$ter$1@ger.gmane.org>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: RFC: Sane default for SPLASH
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
X-List-Received-Date: Thu, 14 Jan 2010 14:12:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 14-01-10 14:48, Rolf Leggewie wrote:
> Koen Kooi wrote:
>> NAK, the needless SPLASH -> BOOTSPLASH will create too much work for
>> people to catch up to, and it messes up the docs on the subject.
> 
> With respect to "needless", the reasons for the change were given in
> this thread.  Please revisit the discussion.

Phil only said short names might clash, which I don't think 'SPLASH'
will ever do.

> And in any case, the tremendous (LOL) amount of work can be
> significantly reduced with the help of sed, as I'm sure you are aware.

You are assuming I have write access to everywhere and know about every
overlay in existence.

> With regard to docs:
> 
> $ rgrep SPLASH docs/
> $
> 
> The wiki has nothing on it, either.  Nothing but hot air?

No, internal docs

> This has become a non-core change,

image.bbclass is considered 'core' or has that changed lately?

> I don't feel bound by your NAK.

If you don't feel bound by NAKs you shouldn't be sending patches for
review, one NAK is enough for it to get rejected.

> That
> being said, I know of your tendency of "my way or the highway" and have
> prepared a new patch that omits the name change but is otherwise
> identical.  Since this addresses your "concerns" I await your ACK.

The patch below looks good to me:

Acked-by: Koen Kooi <koen@openembedded.org>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLTyWjMkyGM64RGpERAiiiAJ4joUTu0ZqcGvukFTFSNsrmYk13OACgmhSj
BudTZxUtiG8ImtjfZ0HUOwA=
=Ix9Y
-----END PGP SIGNATURE-----



