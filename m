Return-Path: <eu@felipetonello.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id E80BA6E242
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Dec 2013 01:17:56 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id a1so4081208wgh.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2013 17:17:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Ep9K72Tpw2JzQdTSQrYIwDtB6bLxWNfLkbuvv5wdRTU=;
	b=bBujIxawLzTlTNoAJ/et8UrnOyweZgavVn4Ml8YytPVYevOML6lu7EkjwK9ngZNBnN
	JosgPrBixNyo4sOaOrVM9BVhDjoQgw7aYl5f5rt6r054C+wQPCdsIY7rx2i4Nq8vzmGL
	ubzFegqde7HpdrM/eixib6d2OtGEUQ1lR0Ds/taKbVFUOD2/GecGgHqFkPCkhR7qWIsr
	JBZA/E0BOHZw6xKIfX/+Go/uBxlM13U4dhsI1JyIl6y6kGSQMtctp3GxHSaIGVRULUQV
	20zarxovgsAGvfAv9tO7pGRZwMeP+Y1HbBq0ErfysOv578KHbGBaNhWicTExVEmQ52Y0
	atLA==
X-Gm-Message-State: ALoCoQm4r5cq3hBNM+VpLMrtgJRviVr7pYk/mZuBIMop1C/olNtuphV2Dxjb02y0Ma5s2KLeaK27
MIME-Version: 1.0
X-Received: by 10.180.108.162 with SMTP id hl2mr16767837wib.56.1386638276168; 
	Mon, 09 Dec 2013 17:17:56 -0800 (PST)
Received: by 10.194.240.201 with HTTP; Mon, 9 Dec 2013 17:17:56 -0800 (PST)
In-Reply-To: <l777t2$pcq$1@ger.gmane.org>
References: <1385600219-18495-1-git-send-email-eu@felipetonello.com>
	<14902072.IG3b8o4YqW@helios> <l77732$ggi$1@ger.gmane.org>
	<1825979.KGUos5WM3r@helios> <l777t2$pcq$1@ger.gmane.org>
Date: Mon, 9 Dec 2013 17:17:56 -0800
Message-ID: <CAGrhNMxYxbA-dL0iQFB_mD-s94nrKupCx-vJaijp=sPy5herwQ@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 10 Dec 2013 01:17:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Koen,

On Thu, Nov 28, 2013 at 3:03 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Paul Eggleton schreef op 28-11-13 11:58:
>> On Thursday 28 November 2013 11:49:18 Koen Kooi wrote:
>>> Paul Eggleton schreef op 28-11-13 11:32:
>>>> Hi Koen / Felipe,
>>>>
>>>> On Thursday 28 November 2013 10:22:31 Koen Kooi wrote:
>>>>> Felipe F. Tonello schreef op 28-11-13 01:56:
>>>>>> From: "Felipe F. Tonello" <eu@felipetonello.com> This recipe
>>>>>> supports the backend for packagekit dynamically based on the
>>>>>> IMAGE_PKGTYPE.
>>>>>
>>>>> NAK! IMAGE_FEATURES should *never* change non-image recipe params.
>>>>> This breaks using feeds horribly.
>>>>
>>>> IMAGE_PKGTYPE is influenced by PACKAGE_CLASSES; so this is not about
>>>> IMAGE_FEATURES, and correct me if I'm wrong but maintaining package
>>>> feeds
>>>>
>>>> would generally preclude switching to an alternative package
>>>> manager,
>>>>
>>>> right?
>>>
>>> No, it's perfectly possible to build both opkg and rpm, which is what
>>> I'm currently doing. When doing that the DISTRO.conf does need to make
>>> a decision on what to support for things like packagekit.
>>>
>>>> Some options:
>>>>
>>>> 1) Apply the patch as-is. Changing the order/value of
>>>> PACKAGE_CLASSES will mean this and anything that depends upon it will
>>>> rebuild.
>>>>
>>>> 2) Install the appropriate backend via some code in the image
>>>> recipe. Obviously this means you have to do this for every image
>>>> recipe though.
>>>>
>>>> 3) Use non-dynamic PACKAGECONFIG. Of course this means you'll have
>>>> to remember to change this manually if you change PACKAGE_CLASSES or
>>>> it'll just be broken at runtime.
>>>>
>>>> Honestly, option 1 sounds like the best course to me here. This is
>>>> rather a special case compared to other recipes.
>>>
>>> 1) will let you end up with packagekit_1.0.ipk that only supports RPM
>>
>> Correct, it would. I agree that's not ideal. Neither is having it broken
>> by default for some people though (unless you just set all backends to on
>> by default, that is.)
>>
>>> 2) Is what we would really want, but I don't think packagekit supports
>>> that :(
>>
>> This patch looks like it is splitting out the backends into separate
>> packages...
>
> If that's the case, 2) is the route to go.
>

It does split into packages. I splited it up in packages just so if
the user wants to have different backend options, it can.

The problem with this aproach, is that you will add the apt and opkg
dependency to the build even if the user doesn't care about it. I
don't like this option to be honest.

Felipe

