Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr6gE-0001Qn-QR for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 10:33:52 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nr6dJ-0002bj-IC for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 10:30:45 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 10:30:45 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 10:30:45 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 15 Mar 2010 10:30:32 +0100
Message-ID: <hnkunp$sju$1@dough.gmane.org>
References: <201003081300.19058.holger+oe@freyther.de>	<201003150446.26284.holger+oe@freyther.de>	<ac9c93b11003150030i69015e69t78a3b16e6c11d2e5@mail.gmail.com>
	<201003150846.33517.holger+oe@freyther.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <201003150846.33517.holger+oe@freyther.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: samba-essential upgrade or remove?
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
X-List-Received-Date: Mon, 15 Mar 2010 09:33:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 15-03-10 08:46, Holger Hans Peter Freyther wrote:
> On Monday 15 March 2010 08:30:09 Frans Meulenbroeks wrote:
> 
>> Do we feel we have that responsibility?
>>
>> I didn't feel that sentiment when it came to removing other legacy
>> recipes (some of which definitely also will have security issues).
>> E.g. for openssl we have
>> openssl_0.9.7e.bb
>> openssl_0.9.7g.bb
>> openssl_0.9.7m.bb
>> openssl_0.9.8g.bb
>> openssl_0.9.8m.bb
>> I'm pretty certain the last one will fix some vulnerabilities present
>> in the first one.
> 
> Well you are comparing two different things here. One is having the _default_ 
> of a recipe with known security issues, and one is keeping old non default 
> recipes with security issues.
> 
> If a distro maker decides to use an ancient version of OpenSSL it was his 
> choice, if he just typed bitbake foo-image and he has a vulnerable daemon 
> waiting to be owned in his default image... the story is a bit different.
> 
> I think we have at least three options on how to deal with it:
> 
> 1.) Put a big fat warning on Openembedded.org saying it should not be used for 
> users that have network connectivity or might put a SDcard/Storage with 
> content on a device as we don't care about fixing vulnerable software.
> 
> 2.) Adopt a policy of addressing vulnerabilities in our defaults right away..
> 
> 3.) Remove recipes for vulnerable software when no one is updating them in 
> time... This can be combined with option 2...

I don't think 1) is a realistic option, if we go with that, we should
just redirect oe.org to buildroot.org and go home.

I my vote goes to 2) and I like 3) as well.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLnf44MkyGM64RGpERAmzaAKCp0hTPChpWBSA+ZNOu4EONro5SdACggdvk
i1RVEm4+eqwaPItxFiYzE9Q=
=2RGA
-----END PGP SIGNATURE-----



