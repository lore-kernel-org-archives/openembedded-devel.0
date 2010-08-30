Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1Oq8wI-0000Hz-4T
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Aug 2010 20:19:04 +0200
Received: by qyk8 with SMTP id 8so3309729qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Aug 2010 11:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=IZtYBAB8/bAO1yRnfVqcPL50cQw+baxClaDeks+jcIk=;
	b=K9MNJJtFBy9I0/qZKA6wzIFXe6cEECuhRQx/fXT4R5ntTNRg8/hcZGuIqPl25zTnGd
	XWGyxeS6aHjkxVVJXDZVy02XeQls06V66H8oFiwv3QB3EPDOyVKDFlQHJDjQ2ALMiqr3
	lZo0nQH1GM9D+jBT7ZgIWTTQXdBoyeUc+u140=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ajE+/kihqVKzxjSRl4XxkrfDAk3zmctoc1/dhqacBhr6ecDUvPjQh3dEcmjXwu+6a9
	tZaS5kD4XQavB1NmPif2cKPiBEJJO/VPYFbAU0n/gug4goSWsU0CausW2uBLLQDdX/IV
	twLTkL2EKBZR5DuNG8H4HAOKFtZcyWjrJb8Kg=
MIME-Version: 1.0
Received: by 10.229.215.67 with SMTP id hd3mr3348756qcb.74.1283192284763; Mon,
	30 Aug 2010 11:18:04 -0700 (PDT)
Received: by 10.229.23.1 with HTTP; Mon, 30 Aug 2010 11:18:04 -0700 (PDT)
In-Reply-To: <AANLkTimtj4nLzXBR5j=MJ6htymbtVQh93YK=F-Sa8bA0@mail.gmail.com>
References: <AANLkTik0bbo2=KrKw2+_Y4D-5Kc6O0OPynt8qd7cs6JH@mail.gmail.com>
	<AANLkTimBkaij-xQ2w+HEHgnZgss7dR4gJMXMtWU7qWX0@mail.gmail.com>
	<AANLkTikqFLr7yc-Q9ucNTaifi-Oup0hyhgSo7AmT1sJA@mail.gmail.com>
	<AANLkTinafU3d3yABuoieUrwLbhrw1qzkuLwdc2FNzFZj@mail.gmail.com>
	<AANLkTi=qX7ksv67Hj=7ocbfiSkM4mDU1w-fAUFWP9EJt@mail.gmail.com>
	<AANLkTimtj4nLzXBR5j=MJ6htymbtVQh93YK=F-Sa8bA0@mail.gmail.com>
Date: Mon, 30 Aug 2010 20:18:04 +0200
Message-ID: <AANLkTinr5r8Jtd+ZWznHaBBSK1cB=+XjzDRAPuet1+tr@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: esbenhaabendal@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: how to add file to SRC_URI for target only
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
X-List-Received-Date: Mon, 30 Aug 2010 18:19:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 30, 2010 at 7:07 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Mon, Aug 30, 2010 at 9:52 AM, Esben Haabendal
> <esbenhaabendal@gmail.com>wrote:
>
>> On Thu, Aug 26, 2010 at 4:27 PM, Chris Larson <clarson@kergoth.com> wrote:
>>
>> > Okay, how about..
>> >
>> > OVERRIDES =. "${@['', 'target:']['${BPN}' == '${PN}']}"
>>
>> I can also think of at least one way to do this without using anonymous
>> code.
>>
>> In base.bbclass:
>> RECIPE_TYPE = "target"
>> OVERRIDES =. "${RECIPE_TYPE}"
>>
>> In native.bbclass:
>> RECIPE_TYPE = "native"
>>
>> In cross.bbclass:
>> RECIPE_TYPE = "cross"
>
>
> And nativesdk, and sdk, and crosssdk, and cross-canadian, and.. ;)

Exactly.  But that is about it. The number of recipe types are really
quite limited.

This type of override is quite similar to the virtclass-* overrides,
just that it can be used independent on what recipe type is the
original one (not virtual).

Anyway, I were merely illustrating that a more efficient solution is
there, and could even be argued to be "cleaner" than the alternative.
Of-course, the last part is quite subjective, so anyone is free to
disagree.

/Esben


