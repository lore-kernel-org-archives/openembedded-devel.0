Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OjChz-0002Tz-Q0 for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 16:55:13 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OjCho-0007K9-VR for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 16:55:00 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 16:55:00 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 16:55:00 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 11 Aug 2010 16:54:52 +0200
Message-ID: <i3udjt$8l9$1@dough.gmane.org>
References: <4C61E523.7070405@gmail.com>	<i3tp29$uvf$1@dough.gmane.org>
	<AANLkTin=ZaqVrBgzXYjfy_nchZVSh5eBUuqXQBRryEwt@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <AANLkTin=ZaqVrBgzXYjfy_nchZVSh5eBUuqXQBRryEwt@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Mass convert PREFERRED_VERSION_* to be weakly assigned.
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
X-List-Received-Date: Wed, 11 Aug 2010 14:55:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-08-10 13:56, Frans Meulenbroeks wrote:
> 2010/8/11 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 11-08-10 01:47, Graham Gower wrote:
>>> find conf -type f -exec sed -i -e 's/^PREFERRED_VERSION_\([^ \t]*\)\([ \t]*\)=/PREFERRED_VERSION_\1\2?=/' {} \;
>>
>> NAK, Angstrom pins things with a hard assignment for good reasons. We
>> are open to discuss specific issues you have with versions for various
>> recipes, though.
> 
> Well, I would like angstrom to move to the latest version of mythtv.
> Would that be possible (and if not what is the problem with mythtv 0.23)

For mythtv I try to use a grace period so other distros have the chance
to have packages for the new mythtv. My backend runs debian, so I
generally wait for debian-multimedia to catch up.
I think it's safe to switch to 0.23.x now, and for future releases we
can see if this policy can be thrown out.

mvg,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMYrm8MkyGM64RGpERAvGFAJ430CivFqaKP/JW6sZu25lepQUpEACdE4/1
jPgf5q35m+FLfbjXb1dpSCs=
=Q7IY
-----END PGP SIGNATURE-----



