Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmDsz-0002x5-PC
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 23:14:51 +0100
Received: by iwn10 with SMTP id 10so2672241iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 14:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=YqzEPf4+UX4mAA2urpPE1kPTbGtoznl6+YbG1/coHIw=;
	b=OjpQqbko08mp3y8YPXM7i2vCSPOjYeKa/g7Ngf+VkkFupMM+0swTmfhzxkb67JwE7N
	ixKxXd9EbvgHKYyTh3tBnGjn5chxxrNOOT6gjfBc2Zk5wvzuoiaxOP0OSXzbJfhOA1Rn
	TWvjzyYYk2oCD8h6z/Oj/T2i+IhrMzUO/TF7U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NMNbm2w1DhHPwHyzbjoI3FArwftA141go3L00Ebjh3YvalTS0KkEKshmWYv5hAGXFy
	E7nQWoEh6e8FooRoyhMJFjb/To2elcuOWMf5EdUyzrr50bt1YbmMJs3HFvTLDwechhNz
	z8zlF+MOZ/ygxiD5DZdV74KXLJ9veDu+zGeU8=
MIME-Version: 1.0
Received: by 10.231.147.199 with SMTP id m7mr159690ibv.87.1267481514225; Mon, 
	01 Mar 2010 14:11:54 -0800 (PST)
In-Reply-To: <1267392928.13054.1.camel@andromeda>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<1267392928.13054.1.camel@andromeda>
Date: Mon, 1 Mar 2010 14:11:54 -0800
Message-ID: <19c1b8a91003011411p420a449dw3c03d03c6f5cec9a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Mon, 01 Mar 2010 22:14:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Feb 28, 2010 at 1:35 PM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> Am Sonntag, den 28.02.2010, 20:39 +0100 schrieb Frans Meulenbroeks:
>> We have 26 glib-2.0 recipes (and 8 native ones). (see ls below)
>> Only a few versions are used (see also the grep below)
>>
>> for glib-2.0:
>> "2.12.12"
>> "2.16.4"
>> "2.18.3"
>> "2.20.3"
>> "2.22.1"
>> "2.22.4"
>> "2.6.4"
>> "2.8.6"
>>
>> for glib-2.0-native:
>> "2.16.1"
>> "2.18.0"
>> "2.22.1"
>> "2.22.4"
>>
>> Both include the last two versions
>> Proposal is to remove all versions that are not used.
>>
>> How do people feel about this?
>
> Sounds good to me, althoug I'd recommend not removing them but just
> moving them out of sight, i.e. in an 'old' folder. That way we could
> please both the lets-keep-everything-no-matter-how-rotten and also the
> lets-strive-for-few-high-quality recipes.
>

FWIW I like the idea of having 'obsolete' recipes so moving them to
recipes/obsolete
may not be so bad.


> Cheers,
>
> --
> :M:
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


