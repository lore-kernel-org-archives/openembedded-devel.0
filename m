Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OkxzS-0006Hk-4e for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 13:36:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Okxz9-0002Gd-W8 for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 13:36:11 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 13:36:11 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Aug 2010 13:36:11 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 16 Aug 2010 13:36:01 +0200
Message-ID: <i4b7r1$sf8$1@dough.gmane.org>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>	<i4auje$u5g$1@dough.gmane.org>	<AANLkTimpAxxt7GR=1VV9ZrAWubMp63sX771+PfhLjWTu@mail.gmail.com>	<AANLkTi=pVCajY==ZdehO_Bw33xsrYcvBnYHfN4s2Vne=@mail.gmail.com>	<i4b3dl$vbk$1@dough.gmane.org>
	<AANLkTim8Et4FHon4o2dsTOyFe-8huxTmmFEYA5PNZirw@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100718 Shredder/3.0.7pre
In-Reply-To: <AANLkTim8Et4FHon4o2dsTOyFe-8huxTmmFEYA5PNZirw@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Aug 2010 11:36:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 16-08-10 13:10, Frans Meulenbroeks wrote:
> 2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 16-08-10 11:30, Frans Meulenbroeks wrote:
>>> 2010/8/16 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>>>> 2010/8/16 Koen Kooi <k.kooi@student.utwente.nl>:
>>>>> -----BEGIN PGP SIGNED MESSAGE-----
>>>>> Hash: SHA1
>>>>>
>>>>> You removed the default openssl version (0.9.8) without bumping PR for
>>>>> recipes using that, so now my autobuilder is quite red due to do_rootfs
>>>>> failures (among other build errors related to these removals).
>>>>
>>>> I will reinstate openssl 0.9.8
>>>> conf did not show any pinning but i missed the DEFAULT_PREFERENCE = "-1' in 1.0
>>>> seems a good plan to upgrade to 0.9.8o though as it fixes some
>>>> security vulnerabilities
>>>>
>>>
>>> reverted the commit for removal of 0.9.8
>>> I was unaware that a PR bump of recipes using another recipe needed to be done.
>>
>> For libraries, certainly, as in this case SOVERSION changed, so the
>> resulting packagenames changes from
>> libssl0.9.8_0.9.8m-r12.0.5_armv7a.ipk to
>> libssl1.0.0_1.0.0-r12.2.5_armv7a.ipk. OE removes the first one, but
>> other packages still have it in DEPENDS.
>>
>> And if SOVERSION doesn't change, bumping PR for dependant recipes is
>> needed for things that statically link to it (or even dynamically in
>> some case).
> 
> Tanks for the explanation.
> It would be nice if oe would detect those cases and force a rebuild.

That doesn't help if you're using packagemanagement. Now you have
"foo_1.0-r0.ipk" in the feeds that statically linked to openssl 0.9.8
and "foo_1.0-r0.ipk" locally that statically links to 1.0.0. So users
still don't get the fixes that went into openssl.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMaSKgMkyGM64RGpERAix5AJ4zlAIGz7P1C0RyH72fldJXE641lQCbB6XD
13E4ujSzXcPoW94ZdaqE9Ek=
=LGlu
-----END PGP SIGNATURE-----



