Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id EC3276D8D5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 11:03:27 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VlzNR-0000ZK-ST for openembedded-devel@lists.openembedded.org;
	Thu, 28 Nov 2013 12:03:21 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 12:03:21 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 12:03:21 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 28 Nov 2013 12:03:09 +0100
Message-ID: <l777t2$pcq$1@ger.gmane.org>
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>	<14902072.IG3b8o4YqW@helios>
	<l77732$ggi$1@ger.gmane.org> <1825979.KGUos5WM3r@helios>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
In-Reply-To: <1825979.KGUos5WM3r@helios>
X-Enigmail-Version: 1.6
Subject: Re: [PATCH] packagekit: Updated to 0.8.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Nov 2013 11:03:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Paul Eggleton schreef op 28-11-13 11:58:
> On Thursday 28 November 2013 11:49:18 Koen Kooi wrote:
>> Paul Eggleton schreef op 28-11-13 11:32:
>>> Hi Koen / Felipe,
>>> 
>>> On Thursday 28 November 2013 10:22:31 Koen Kooi wrote:
>>>> Felipe F. Tonello schreef op 28-11-13 01:56:
>>>>> From: "Felipe F. Tonello" <eu@felipetonello.com> This recipe
>>>>> supports the backend for packagekit dynamically based on the
>>>>> IMAGE_PKGTYPE.
>>>> 
>>>> NAK! IMAGE_FEATURES should *never* change non-image recipe params. 
>>>> This breaks using feeds horribly.
>>> 
>>> IMAGE_PKGTYPE is influenced by PACKAGE_CLASSES; so this is not about 
>>> IMAGE_FEATURES, and correct me if I'm wrong but maintaining package
>>> feeds
>>> 
>>> would generally preclude switching to an alternative package
>>> manager,
>>> 
>>> right?
>> 
>> No, it's perfectly possible to build both opkg and rpm, which is what
>> I'm currently doing. When doing that the DISTRO.conf does need to make
>> a decision on what to support for things like packagekit.
>> 
>>> Some options:
>>> 
>>> 1) Apply the patch as-is. Changing the order/value of
>>> PACKAGE_CLASSES will mean this and anything that depends upon it will
>>> rebuild.
>>> 
>>> 2) Install the appropriate backend via some code in the image
>>> recipe. Obviously this means you have to do this for every image
>>> recipe though.
>>> 
>>> 3) Use non-dynamic PACKAGECONFIG. Of course this means you'll have
>>> to remember to change this manually if you change PACKAGE_CLASSES or
>>> it'll just be broken at runtime.
>>> 
>>> Honestly, option 1 sounds like the best course to me here. This is
>>> rather a special case compared to other recipes.
>> 
>> 1) will let you end up with packagekit_1.0.ipk that only supports RPM
> 
> Correct, it would. I agree that's not ideal. Neither is having it broken
> by default for some people though (unless you just set all backends to on
> by default, that is.)
> 
>> 2) Is what we would really want, but I don't think packagekit supports
>> that :(
> 
> This patch looks like it is splitting out the backends into separate 
> packages...

If that's the case, 2) is the route to go.

> 
>> So that leaves 3, which makes it a clear DISTRO decision, like it
>> should be.
> 
> It's worth pointing out that the patch sets PACKAGECONFIG with ??= so it
>  doesn't stop you from doing this.
> 
> Cheers, Paul
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSlyLtMkyGM64RGpERAmfuAJ9DTZhTFkAQ7AwRYQbSVzHGyRCtigCeLU92
psvh/e2iCRGJLTUfAWzoF5I=
=vIts
-----END PGP SIGNATURE-----


