Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbZyB-00014n-7o for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 17:12:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QbZuc-0007Z1-EP for openembedded-devel@lists.openembedded.org;
	Tue, 28 Jun 2011 17:09:14 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 17:09:14 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Jun 2011 17:09:14 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 28 Jun 2011 17:09:00 +0200
Message-ID: <iucqqc$61t$1@dough.gmane.org>
References: <201104102145.44766.patda293@student.liu.se>	<1309207347.21379.147.camel@mattotaupa>	<iubtnm$jkv$1@dough.gmane.org>
	<BANLkTi=yptqScBcJh87PYiyNMsXerAV1OA@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTi=yptqScBcJh87PYiyNMsXerAV1OA@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: python-numpy prone to use host libraries
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
X-List-Received-Date: Tue, 28 Jun 2011 15:12:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 28-06-11 17:03, Bob Cvengros wrote:
> Does that mean that numpy is a completely broken package, or is that a way
> to hack it to make it work? If it is broken and will stay that way, why
> don't we remove it from the recipe list? If that is the case then it's just
> misleading.

It works if you don't have (from the top of my head) g99 and blas-dev
installed on your host. I removed those and numpy builds for me.

regards,

Koen

> 
> Thanks,
> Bob
> 
> On Tue, Jun 28, 2011 at 1:52 AM, Koen Kooi <koen@dominion.thruhere.net>wrote:
> 
> On 27-06-11 22:42, Paul Menzel wrote:
>>>> Dear Patrik,
>>>>
>>>>
>>>> Am Sonntag, den 10.04.2011, 21:45 +0200 schrieb Patrik Dahlström
> (student):
>>>>
>>>> [&]
>>>>
>>>>> I am however uncertain on how to proceed with this and could use some
>>>>> assistance.
>>>>
>>>> did you find a generic solution for this problem?
> 
> It requires redoing the numpy buildsystem, it is broken by design. I
> tried to teach it about crosscompiling and sysroots last year, but gave
> up after a few days :(
> 
> regards,
> 
> Koen
>>
>>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOCe6MMkyGM64RGpERAtm7AJ4otnJkPoVsupxC4c95EdfKL9s/CwCfYb5A
+9ckzBIhVxGFCJ8Ict3fzug=
=Q31X
-----END PGP SIGNATURE-----



