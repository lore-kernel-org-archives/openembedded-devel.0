Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ol2cU-0004nq-6E for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 18:33:12 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ol2by-00061M-8h for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 18:32:34 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 18:32:34 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 18:32:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Aug 2010 18:32:23 +0200
Message-ID: <i4bp6n$8cv$1@dough.gmane.org>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>	<20100816132317.GA7983@zlo.nu>	<AANLkTikB5uioXp0BwFg4Gj6GV9MjgMmyOgvjLLOwS8fh@mail.gmail.com>
	<20100816140055.GB7983@zlo.nu>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <20100816140055.GB7983@zlo.nu>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 16:33:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-08-10 16:00, Marc Olzheim wrote:
> On Mon, Aug 16, 2010 at 03:43:10PM +0200, Frans Meulenbroeks wrote:
>>> Hmm, the "guidelines" do not mention anything about licenses. Thus the
>>> only version you left of coreutils after
>>> 82dcd385984ba059b346a0e37fd3e14d536074ad is infected with GPLv3, while
>>> the older (6.0) GPLv2 version works fine for us.  I do not know
>>> whether other people mind about licenses, but we cannot use any GPLv3
>>> software in our image, because of its viral nature.
>>>
>>> Marc
>>
>> Valid point.
>> I did not consider licenses. Although the company I work for has no
>> problems with GPLv2, I understand your concern
>> What would be the most recent version of coreutils that is still using v2?
>> We can reinstate that one.
> 
> In the case of coreutils, that is 6.0.
> GPLv2 is ok here as well. The problem with GPLv3 here is that as soon as
> we incorporate some GPLv3 package we need to provide the abilitiy for
> customers to rebuild their image (Right to Tinker), which we cannot and
> will not do.

And the patent clause isn't fun if your company has tons of IP in that
area (like mine).

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMaWgWMkyGM64RGpERAg6PAJ4+ANeicD6Iwz5VOFF7FXwBNIdtXgCeMZKK
Ue6O0IThYTeDJ8RcCKbwIjE=
=Rn2H
-----END PGP SIGNATURE-----



