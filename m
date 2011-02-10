Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pnd1u-0006Np-1T for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 21:22:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pnd0r-0004AC-Vs for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 21:21:13 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 21:21:13 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 21:21:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 10 Feb 2011 21:21:03 +0100
Message-ID: <ij1hbf$2st$1@dough.gmane.org>
References: <AANLkTinb5Yueix_q94X84VpwHbAUBJ09myVj9DCTbE86@mail.gmail.com>
	<4D544652.4090709@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D544652.4090709@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: how to add multiple versions?
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
X-List-Received-Date: Thu, 10 Feb 2011 20:22:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-02-11 21:10, Tom Rini wrote:
> On 02/10/2011 12:24 PM, AJ ONeal wrote:
>> I've got
>>
>> nodejs-0.2.6.bb
>> and
>> nodejs-0.4.0.bb
>>
>> If I do
>>    `bitbake nodejs-0.2.6`
>> it builds 0.4.0 anyway with this message
>>
>> ERROR: Multiple .bb files are due to be built which each provide nodejs
>> (/home/coolaj86/overo-oe/org.openembedded.dev/recipes/nodejs/nodejs_0.2.6.bb/home/coolaj86/overo-oe/org.openembedded.dev/recipes/nodejs/
>>
>> nodejs_0.4.0.bb).
>>   This usually means one provides something the other doesn't and should
>>
>> How do I make the file such that it knows one is different from the
>> other?
>>
>> There's api breakage, so current users may want to continue using the
>> 0.2.x
>> branch. I don't want to remove that in favor of 0.4.0 quite yet.
> 
> There's a few ways to do this.  The first is to just put D_P = -1 on the
> new version and let distros opt to upgrade everything at once.  The
> second is to play virtual games like we do for libusb.  The first option
> is easier to implement than the second and depending on how wide spread
> the usage is might be the best route.

Or go the libsoup route and make them parallel installable

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNVEiuMkyGM64RGpERAmU5AJsH+WKJ9pQPaURH9SDCR964XH76VwCgl3cP
uhnNtfANhgsPApUna1H+NqE=
=GIAM
-----END PGP SIGNATURE-----



