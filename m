Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oy2gk-0003sS-TW for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 15:15:20 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Oy2gf-0000Je-3o for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 15:15:09 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 15:15:09 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 15:15:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 21 Sep 2010 15:14:59 +0200
Message-ID: <i7ab4j$ubk$1@dough.gmane.org>
References: <1284933592-4558-1-git-send-email-pirobk@gmail.com><4C9693E5.3040504@freyther.de>	<AANLkTim+VwnZH-yiNOPkQ-ZvbGLmjXpEz8U-WJOoPzt7@mail.gmail.com>
	<0B51A1E7C61D114DAE6FC10B0FD0ABA501A74218@deimsg40.de.net.world>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <0B51A1E7C61D114DAE6FC10B0FD0ABA501A74218@deimsg40.de.net.world>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qt4-embedded: avoid circular dependencies for reciped providing qt4-embedded
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
X-List-Received-Date: Tue, 21 Sep 2010 13:15:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

It was applied yesterday already:
http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=224e98468078e9267b0b4c2d72bfb0eb3b2863ec

On 21-09-10 11:18, Hauser, Wolfgang (external) wrote:
> Is it possible to apply this patch soon ? I need the gles version of qt4-embedded. At the time I workaround this problem by a modified qt4-embedded recipe.
>    
> -----Ursprüngliche Nachricht-----
> Von: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] Im Auftrag von Björn Krombholz
> Gesendet: Montag, 20. September 2010 20:16
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] [PATCH] qt4-embedded: avoid circular dependencies for reciped providing qt4-embedded
> 
> 2010/9/20 Holger Freyther <holger+oe@freyther.de>
>> On 09/20/2010 05:59 AM, Björn Krombholz wrote:
>>> @@ -1,4 +1,4 @@
>>> -DEPENDS_prepend = "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d, 1) == 'qt4-embedded')]}"
>>> +DEPENDS_prepend = "${@["qt4-embedded ", ""][(bb.data.getVar('PN', d, 1)[:12] == 'qt4-embedded')]}"
>>>  inherit qmake2
>>
>> use startsWith and avoid the extra array allocation?
> 
> Array slicing just provides a new mapping onto the original array and
> doesn't copy any data.
> 
> I chose this syntax to make it consistent with qt4x11.bbclass
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMmK/SMkyGM64RGpERAt+6AJ90NQAJvd/iJCE7hr35N54LvvzVAQCfVkqr
ePDrcvS2KaENyo6CzPgnd9I=
=uqo0
-----END PGP SIGNATURE-----



