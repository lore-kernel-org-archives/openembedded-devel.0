Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P6NoL-0000v9-Na for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 15:25:37 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P6Nnr-0005ZT-Oe for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 15:25:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 15:25:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 15:25:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 14 Oct 2010 15:23:14 +0200
Message-ID: <i97082$i6g$2@dough.gmane.org>
References: <131E5DFBE7373E4C8D813795A6AA7F080310FFA839@dlee06.ent.ti.com>	<AANLkTik1nA1jC9f-Vvep2=8U9+VXAWBwPFaRaZC0f4Op@mail.gmail.com>	<131E5DFBE7373E4C8D813795A6AA7F080310FFA874@dlee06.ent.ti.com>
	<AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <AANLkTinfQjRpwjYYL-6+He_z3tB6wm3kcW0CSEAqFVuh@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Question about OVERRIDES precedence
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
X-List-Received-Date: Thu, 14 Oct 2010 13:25:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-10-10 23:38, Chris Larson wrote:
> On Wed, Oct 13, 2010 at 2:30 PM, Maupin, Chase <chase.maupin@ti.com> wrote:
> 
>> That was my thought as well but I can consistently cause this issue.  I
>> have tested a quick change that seems to fix the issue by reversing the list
>> before it is used in the for loop.  My change was:
> 
> 
> From discussion on IRC, we think we should just reverse the definition of
> OVERRIDES in OE, this avoids compatibility issues associated with changing
> the implementation.

Isn't the definition covered in the bitbake docs? I'm in favour of
fixing bitbake instead working around it in OE.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMtwRCMkyGM64RGpERAhyDAJ0ZKsVJEzs2Fo8iXR7F32ijePz+lwCeMuHT
vfpaqzI6gh8aKRBwE5h1WA4=
=9m/w
-----END PGP SIGNATURE-----



