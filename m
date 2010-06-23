Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ORNMo-0000Cj-Gv for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 12:39:53 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ORNIO-0002or-6i for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jun 2010 12:35:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 12:35:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Jun 2010 12:35:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Jun 2010 12:32:55 +0200
Message-ID: <hvsnsn$mvd$2@dough.gmane.org>
References: <AANLkTimD-uu-SpcUvHIMWE1cQ5wCSyisHRwyFfasdX90@mail.gmail.com>	<hvl1uc$bol$1@dough.gmane.org>	<AANLkTil2-UJTgWzmXJI6eESvqjTowq0y_kZTpm0zNAN8@mail.gmail.com>	<AANLkTikz8wGLZKz6Z-o4YpC8C62P-whW_znpSKlV8yEx@mail.gmail.com>	<hvsjso$8bh$1@dough.gmane.org>	<20100623103600.77c5a6d9@xora-desktop.xora.org.uk>	<AANLkTimwSjUiEgwAU-l66u9Da5ckM4p2yD4naQq3g_ZZ@mail.gmail.com>	<20100623110315.16293a95@xora-desktop.xora.org.uk>
	<4C21DCD6.4090509@balister.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <4C21DCD6.4090509@balister.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: introducing a new architecture/machine; policy ? (and a question)
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
X-List-Received-Date: Wed, 23 Jun 2010 10:39:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-06-10 12:07, Philip Balister wrote:
> On 06/23/2010 12:03 PM, Graeme Gregory wrote:
>> On Wed, 23 Jun 2010 11:54:21 +0200
>> Frans Meulenbroeks<fransmeulenbroeks@gmail.com>  wrote:
>>
>>> 2010/6/23 Graeme Gregory<dp@xora.org.uk>:
>>>>>>> Also I don't feel empowered to make changes in distribution
>>>>>>> specific files.
>>>>
>>>> Why not, chances are Angstrom maintainers would be quite happy for
>>>> you to patch angstrom*.conf if you ask us.
>>>>
>>>> Graeme
>>>
>>> distribution != angstrom
>>> There are more distributions out there.
> 
> Right now, toolchain selection is done in distro files not machine
> files. I agree this is not the clearest approach, however adding the
> toolchain selection to the machine files may have unexpected side effects.

Think of multimachine builds. What happens when someone else adds
*another* nios2 based machine with different toolchain versions, how do
I know which toolchain avahi_1.0_nios2.ipk was compiled with?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMIeLXMkyGM64RGpERAk0iAKCcXvyrUxGj2ZlsiV52sVhddsqr5wCcDgIS
Noq5qjHf0Qm7qObCuCRL1bM=
=VOH+
-----END PGP SIGNATURE-----



