Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5A924745F0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 21:08:25 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c41-v6so5246454plj.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 May 2018 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=htB9yBRSvhairHq8g4ADiqdx6AUyukqBdJVeZDzu/DI=;
	b=PTrORAR6xeWkYEmrhvP1o5+QjoQmen6fwiKlVokQfzExuEQ+M+RQ03VBCoRInL9XWp
	z8Ny4HHfNRiTnCY1SMw5tUn1LBHI1/ZAp3jt6yk5FVvY+Vk16dhmHAFvKikeIf71WZ/9
	G1qqRYeBHC0kv397ffQNk2pWGO5RSTGlSrzFhB3dRryDSNYBI8q4FtMUYudx8r5VnZPJ
	sFJTMyROc+usnPt4lssW0rlRw61EPw5bvT09CHnAuG/gT3v3UTvXfpgs5e7BmSn/TVUj
	U0Kd0yoau5KMkUQggD9e5/vMgKQg8x4NQnFkeuqhBBx/j8jAd0FvQ7qOQTTZlI3nKO60
	BPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=htB9yBRSvhairHq8g4ADiqdx6AUyukqBdJVeZDzu/DI=;
	b=LlchYcy7ojMJET1fOqax23wi1S9ndzJZnqa4Cub8dPWDgpfYZdvyDcEyseLg4aCkDI
	gw8dULBEwksToMgcKKs1jyt35BsU6tXC7J/0AB1mMfxYjYluJoyT32RZ06xJOuzzL0re
	mT1E8iWFUr2SqF5sFSpsvbss269y4aBozR6blc7h1Lu2vxZxQQb+4vN5dpIvSwZaUptV
	4xaXw4iHiAdUdPTVDxLx1dmT/lKX5B70Y5N/OKXF8NHgjdB2jLsoXfBsgs+BZtcDjueN
	lDaTpVUwCfRzNhiP2FQ/Yfki72yW27bgFRPyFKSvjUTjAWquc3VVVr509HMWzgnOdIb2
	Nh4A==
X-Gm-Message-State: ALKqPweUdTHlRfaa3WFM8U/bOSYLs8I+ANtm1uWEiUSJasA5puKHkmAT
	F2Y30e1sVr0VeDV/F6PKe69NWs6X6vxeoyUEgPs=
X-Google-Smtp-Source: AB8JxZoeQ6cU+2jqi17DffVHzQnSFTcMxFlQ7deaDwJNRJLboqSeUfT/fqEXcb5pV/lhF3m+sHr/SSQ6tnTWequUR8c=
X-Received: by 2002:a17:902:28ab:: with SMTP id
	f40-v6mr11132538plb.208.1526677302446; 
	Fri, 18 May 2018 14:01:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Fri, 18 May 2018 14:01:12
	-0700 (PDT)
In-Reply-To: <CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 May 2018 14:01:12 -0700
Message-ID: <CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 May 2018 21:08:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 18, 2018 at 12:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, May 17, 2018 at 6:56 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi Andre
>>
>> This series is fine, except that it has some formatting changes mixed with
>> cmake related changes. It would be preferable to have them as separate
>> pulls. I reckon that both types of changes are good.
>
> The formatting cleanups are all minor and probably not worth
> submitting on their own.
>

OK thats fine, drop then in v2

>> On 5/17/18 6:30 PM, Andre McCurdy wrote:
>>>
>>> The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
>>> ${datadir}/cmake end up in the dev package, so recipes no longer need
>>> to provide custom packaging rules to handles these files.
>>>
>>>
>>> http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93
>>>
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>>   meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git
>>> a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>>> b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>>> index 9354799..6b9c545 100644
>>> --- a/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>>> +++ b/meta-oe/recipes-connectivity/libwebsockets/libwebsockets_2.1.0.bb
>>> @@ -24,5 +24,4 @@ PACKAGECONFIG[testapps] =
>>> "-DLWS_WITHOUT_TESTAPPS=OFF,-DLWS_WITHOUT_TESTAPPS=ON,
>>>     PACKAGES =+ "${PN}-testapps"
>>>   -FILES_${PN}-dev += "${libdir}/cmake"
>>>   FILES_${PN}-testapps += "${datadir}/libwebsockets-test-server/*"
>>>
>>

