Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O4xLo-0006Zb-I8 for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 16:25:57 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O4xIJ-0003eV-Ca for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 16:22:19 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 16:22:19 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 16:22:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 22 Apr 2010 16:22:05 +0200
Message-ID: <hqpm2d$d7p$1@dough.gmane.org>
References: <20100422134322.f79d1365.ospite@studenti.unina.it>	<1271937343.24079.176.camel@mill.internal.reciva.com>
	<20100422144638.7c78d45c.ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <20100422144638.7c78d45c.ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: About having a static /dev
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
X-List-Received-Date: Thu, 22 Apr 2010 14:25:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-04-10 14:46, Antonio Ospite wrote:
> On Thu, 22 Apr 2010 12:55:43 +0100
> Phil Blundell <philb@gnu.org> wrote:
> 
>> On Thu, 2010-04-22 at 13:43 +0200, Antonio Ospite wrote:
>>>  2. If I install any package which depends on udev then udev is brought
>>>     in and the static layout is gone at the next boot.
>>
>> I think your best option is probably to make udev be a DISTRO_FEATURE
>> and not set it for your own distribution.
>>
>> If you genuinely want udev to be selected (for your particular DISTRO)
>> on a per-MACHINE basis then you'll have to invent some way to nobble its
>> startup script so that it just doesn't do anything on machines where it
>> isn't wanted.
>>
> 
> A per-MACHINE way would be better IMHO

That would break the case where you want static devs for one image (e.g.
initramfs, rescue fs), but other options (e.g. udev, devtempfs, mdev,
something else) for other images on the same machine.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL0FuNMkyGM64RGpERAs2oAJ9bxwZhqGcesRA3EpEoMJ6vR9rwCACgjEcq
as1zs5zE8iuE806tNVdekBU=
=85tD
-----END PGP SIGNATURE-----



