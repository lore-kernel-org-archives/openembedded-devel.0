Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni2wY-0007OR-G2 for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 10:45:13 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Ni2tw-0004s3-47 for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 10:42:28 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 10:42:28 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Feb 2010 10:42:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 18 Feb 2010 10:42:06 +0100
Message-ID: <hlj21d$fdf$1@ger.gmane.org>
References: <ac9c93b11001300235y22a60e82qf35d712b8323807d@mail.gmail.com>	<hk12nm$sdo$1@ger.gmane.org>
	<hlhc1p$t19$1@ger.gmane.org>	<ac9c93b11002171058o7f48b417yee87d06da09c7577@mail.gmail.com>	<hlhf2a$aei$1@ger.gmane.org>
	<ac9c93b11002180118m1512bc71sa6eb91624e83263e@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100212 Shredder/3.0.2pre
In-Reply-To: <ac9c93b11002180118m1512bc71sa6eb91624e83263e@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: {RFC] console-image.bb
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
X-List-Received-Date: Thu, 18 Feb 2010 09:45:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-02-10 10:18, Frans Meulenbroeks wrote:
> 2010/2/17 Koen Kooi <k.kooi@student.utwente.nl>:
> 
>>>> FYI: I popped a question three weeks ago.
>>>> Today Rolf asked me about the status in #oe.
>>>> As you can see above 4 people (Rolf, Mickey, Phil and me were in
>>>> favour of the proposal. In irc mckoan also backed the proposal.
>>>> There was one person opposed to it: you.
>>
>> And funnily enough I'm the maintainer, so I get the final say.
> 
> Still wondering what makes you the maintainer.
> 
> git log does not mention any changes for this file by you (apart from
> yesterdays revert):
> See http://cgit.openembedded.org/cgit.cgi/openembedded/log/recipes/images/console-base-image.bb

Git doesn't track renames properly, using the parent of the
packages->recipes commit:

http://cgit.openembedded.org/cgit.cgi/openembedded/log/packages/images/console-image.bb?id=fa6cd5a3b993f16c27de4ff82b42684516d433ba

And that stops on a rename as well.

> 
> Btw in the commit message you write
> "If you're touching a recipe at least make sure the creator/maintainer
> agrees with your changes."
> 
> How come this "rule" suddenly appears.

It hasn't suddenly appeared, and furthermore console-image is widely
used enough to label it 'core', so any changes will need to get
reviewed, which they weren't in this case.

And non-angstrom people created angstrom-named new recipes without any
approval from angstrom developers is just plain rude.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLfQtuMkyGM64RGpERAuLxAJ9nhJE4wv6U+TDleoStwvk+suGAhACguLZF
2RCLURHCtcP3Zq21cd3VjNo=
=tR5o
-----END PGP SIGNATURE-----



