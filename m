Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCAri-0004q2-In for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 15:21:14 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCApT-0000BE-55 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 15:18:55 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 15:18:55 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 15:18:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Apr 2011 15:18:41 +0200
Message-ID: <iok23h$rqo$1@dough.gmane.org>
References: <1303213631-7082-1-git-send-email-michael.lippautz@gmail.com>	<iojvfl$aue$1@dough.gmane.org>
	<BANLkTindS0_R+7PrTWPizgT+hAm0yvEe4g@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTindS0_R+7PrTWPizgT+hAm0yvEe4g@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe] fakeroot: Add LIC_FILES_CHKSUM
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
X-List-Received-Date: Tue, 19 Apr 2011 13:21:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-04-11 14:47, Michael Lippautz wrote:
> 2011/4/19 Koen Kooi <koen@dominion.thruhere.net>:
> On 19-04-11 13:47, Michael Lippautz wrote:
>>>> Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
>>>> ---
>>>>  meta-oe/recipes-core/fakeroot/fakeroot_1.12.4.bb |    1 +
> 
> Thank you for your patch, but I'm not sure if it should go in or not. In
> oe-core we switched to pseudo-native as fakeroot-native replacement, so
> the fakeroot recipe seems redundant.
> Does anyone have a need for fakeroot(-native) or can it get deleted?
> 
> Michaels immediate need for fakeroot-native was addressed with
> http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-texasinstruments/commit/
> 
>> Since I could build the omap-psp kernel with the new fix, I have no
>> need for it anymore. It looks like not that much ppl are actually
>> using the bsp layer, or otherwise this should have come up earlier ;)
> 
>> meta-oe seems to be free of DEPENDS on fakeroot, however
> 
>>  openembedded-core/meta $ grep -r "DEPENDS" * | grep "fakeroot"
>>     classes/populate_sdk.bbclass:DEPENDS = "virtual/fakeroot-native sed-native"
>>     recipes-connectivity/portmap/portmap.inc:DEPENDS = "virtual/fakeroot-native"
>>     recipes-core/meta/external-python-tarball.bb:DEPENDS =
>> "opkg-native opkg-utils-native virtual/fakeroot-native sed-native"

virtual/fakeroot should point to pseudo now. Anyway, I'll put your patch
in since it makes fakeroot work, we can always delete it later :)

> 
>> -Michael
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

iD8DBQFNrYuxMkyGM64RGpERAjPwAJ9cY2Wj7R/YfhX8oArRj/qCCm5C2wCfdncX
B9ktSad9a6n+1P/5lnJS7cs=
=xfbw
-----END PGP SIGNATURE-----



