Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pn7FU-0007Fo-HN for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 11:26:13 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pn7EN-0002tf-Tq for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 11:25:03 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 11:25:03 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Feb 2011 11:25:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 09 Feb 2011 11:20:14 +0100
Message-ID: <iitpou$ago$2@dough.gmane.org>
References: <20110203093253.GG4580@excalibur.local>	<201102031054.08764.ml@vdm-design.de>
	<20110203101242.GF3265@jama>	<20110203124244.GJ4580@excalibur.local>	<20110203140816.GM4580@excalibur.local>
	<20110209100006.GF28019@excalibur.local>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110209100006.GF28019@excalibur.local>
X-Enigmail-Version: 1.0.1
Subject: Re: libnl vs. libnl2 madness
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
X-List-Received-Date: Wed, 09 Feb 2011 10:26:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-02-11 11:00, Stefan Schmidt wrote:
> Hello.
> 
> On Thu, 2011-02-03 at 15:08, Stefan Schmidt wrote:
>>
>> On Thu, 2011-02-03 at 13:42, Stefan Schmidt wrote:
>>>
>>>> 85	ANGSTROM_BLACKLIST_pn-iw = "iw depends on libnl we want libnl2"
>>>
>>> Need to check latest version for libnl2 support. Should not be to hard to change
>>> it.
>>
>> Koen spotted that it should be workig with libnl2 and a build test was positive.
>>
>>>> I didn't check if those can be built with libnl2 or if they work properly with libnl2.
>>>
>>> As you can see I would be willing to work on some of these. Personally I would
>>> aim for getting the recipes over to libnl2 and the kill libnl1 for good in OE.
>>
>> I have an patch removing it but this may have just to many sideeffects on our
>> metadata. Koens pointed out that we maybe should switch the inc dir from libnl
>> to a "wrong" place and leave libnl2 header at the correct place. Obviously we
>> need to fix most of our recipes for libnl2 before such a step.
> 
> To make this step less frustrating for current users I added the libnl2
> includedir path for wpa-supplicant and iw in the recipe to get it working with
> libnl2.
> 
> After the release I would like to take it a step further and move the libnl2
> header files and adjust only the few recipes that have not been converted to
> libnl2. Which is of course also something I try to look at.

I'm looking at what is needed to get networkmanager up to nl2, but it
looks like we'd need to do the patches ourselves and get it into nm 0.9.

regards,

Koen

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNUmpdMkyGM64RGpERAjtWAKCC8MZqxIXGljlw0BDNDsObpADX1gCfatiP
+KjqpcvK5IWww1r6OQugilM=
=OOcI
-----END PGP SIGNATURE-----



