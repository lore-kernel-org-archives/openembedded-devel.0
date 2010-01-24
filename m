Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NZ5Ie-0007D0-DF for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 17:26:59 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NZ5GP-0003di-9I
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 17:24:37 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 17:24:37 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jan 2010 17:24:37 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 24 Jan 2010 17:24:10 +0100
Message-ID: <hjhs7a$3oc$1@ger.gmane.org>
References: <201001241235.23795.holger+oe@freyther.de>	<hjhfid$tqo$1@ger.gmane.org>
	<4B5C6D35.1030002@nospam.arcornews.de>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100113 Shredder/3.0.2pre
In-Reply-To: <4B5C6D35.1030002@nospam.arcornews.de>
X-Enigmail-Version: 1.0
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Request to revert latest devicekit patch
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
X-List-Received-Date: Sun, 24 Jan 2010 16:26:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 24-01-10 16:54, Rolf Leggewie wrote:
> Koen Kooi wrote:
>> On 24-01-10 12:35, Holger Hans Peter Freyther wrote:
>>> Can anyone ack the revert please?
>>
>> The commit says:
>>
>> Note: Another (maybe better) fix would be to package up docbook-xsl but
>> that is overkill for these two recipes.
> 
> To introduce something new that patch breaks something for somebody else
> that was previously working. 

That patch doesn't introduce anything new. It turns of an undocumented
dependency on host software.

We can argue what is better, to rely on stuff without documenting it or
to fetch missing stuff from the interwebs.

My preference would be to do as the commit message says and add the
missing recipe to OE, that would be a better way forward than breaking
one or the other.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLXHQqMkyGM64RGpERAj4dAJ49V6wQ1t/4Ie7bkD1zAOWIMesoEACfTQdX
/H84ncwWoyJiv85hKWqbYIk=
=TPfv
-----END PGP SIGNATURE-----



