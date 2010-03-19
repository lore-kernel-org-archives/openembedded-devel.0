Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nsl1e-0003G0-Rc for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 23:50:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Nskyh-0003mw-9r for openembedded-devel@lists.openembedded.org;
	Fri, 19 Mar 2010 23:47:39 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 23:47:39 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Mar 2010 23:47:39 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 19 Mar 2010 23:47:16 +0100
Message-ID: <ho0utk$tqs$1@dough.gmane.org>
References: <201003182212.31873.roman@khimov.ru>	<201003190004.37865.roman@khimov.ru>	<201003190023.36525.roman@khimov.ru>	<201003200005.35468.roman@khimov.ru>
	<20100319211220.GI2425@xora-desktop.xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100314 Shredder/3.0.4pre
In-Reply-To: <20100319211220.GI2425@xora-desktop.xora.org.uk>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC/PATCH] Perl 5.10.1 and a bunch of modules
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
X-List-Received-Date: Fri, 19 Mar 2010 22:50:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-03-10 22:12, Graeme Gregory wrote:
> On Sat, Mar 20, 2010 at 12:05:35AM +0300, Roman I Khimov wrote:
>> В сообщении от Пятница 19 марта 2010 00:23:25 автор Roman I Khimov написал:
>>> В сообщении от Пятница 19 марта 2010 00:04:30 автор Roman I Khimov написал:
>>>> В сообщении от Четверг 18 марта 2010 23:47:01 автор Roman I Khimov 
>> написал:
>>>>> No. You mean, this one?
>>>>> http://git.pokylinux.org/cgit.cgi/poky/commit/?id=ca5f36ee6ad756e1e5402
>>>>> 88 a5 6a504c1d8ecc7a3
>>>>>
>>>>> Looks like a good thing to have, so if Richard will push it to OE.dev I
>>>>> can do a rebase of my patchset.
>>>>
>>>> Actually, the better sequence is
>>>>  * drop 5.8.4 and 5.8.7
>>>>  * bring in staging changes
>>>>  * bring in 5.10.1
>>>>
>>>> I'll prepare 5.8.4/5.8.7 removal patch.
>>>
>>> Updated rik/perl-5.10 branch with removal patch, please ACK.
>>
>> Tried to compile for arm, succeeded with perl, discovered and fixed some 
>> problems in modules. Updated the branch.
>>
>> I think I need some ACK's for dusty old Perl versions removal and then 
>> Richard's Perl staging update could be merged better on top of that (CC'ing 
>> Richard) and than I'll update 5.10.1 to new staging and push the series. At 
>> least, that's how I think it should be. If there are any problems with staging 
>> update and it's not ready to be pushed in OE.dev, I think we can merge 5.10.1 
>> as it is now.
>>
> For removal of old perl versions
> 
> Acked-by: Graeme Gregory <dp@xora.org.uk>

Acked-by: Koen Kooi <koen@openembedded.org>
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLo/70MkyGM64RGpERAixEAJwJOkgBATjeiofMEyyZGpH4WhMk8ACeMn2t
4wFDmIwNNd1tgnO0Syx94dE=
=Vzni
-----END PGP SIGNATURE-----



