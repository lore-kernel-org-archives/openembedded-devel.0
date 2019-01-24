Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 0CDD26C376
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 12:24:23 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 3CAA45C27D7;
	Thu, 24 Jan 2019 13:24:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1548332664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=m5r5DVgTbxSRsuLAVZmot7bzIRDF+W6XfZOywHcdgSg=;
	b=kuyAqY/AuBvIPAF7LyWKw+z7zLKft0pxuPoBupDV5m+Bkx2qCqr3ca4OEPCCXb0g7XdYT0
	IutJGjkvl28oX2KqCQcsxluFY7KSIEpW74DiovYdRffwGlRYUg19ZIvFxKmeE8jRYL0wJb
	UogpDh/RMY0rwxx3y1FUny1jvEy3gd4=
MIME-Version: 1.0
Date: Thu, 24 Jan 2019 13:24:24 +0100
From: Stefan Agner <stefan@agner.ch>
To: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <5C47D961.6080605@windriver.com>
References: <20190117162629.47677-1-stefan@agner.ch>
	<20190117162629.47677-3-stefan@agner.ch>
	<CALbNGRTLbuAi7czFzrSw4knWDR4t4Nq_pzsuTT6pVeY3vLYTig@mail.gmail.com>
	<d198417638781fb108e77e953ae95550@agner.ch>
	<6021b113-7a55-7bb7-c813-b7d768147f57@windriver.com>
	<CAMKF1spfqh71NCqVa4SweQehNMGMgezBJdnkMdoGAErt5f2g6A@mail.gmail.com>
	<5C47D961.6080605@windriver.com>
Message-ID: <d24c3fcca886726418acf1eab1e06bf0@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.7
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [PATCH 3/5] xfce4-power-manager: enable polkit depending on distro feature
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
X-List-Received-Date: Thu, 24 Jan 2019 12:24:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.01.2019 04:02, Yu, Mingli wrote:
> On 2019年01月21日 02:07, Khem Raj wrote:
>> On Thu, Jan 17, 2019 at 4:30 PM Randy MacLeod
>> <randy.macleod@windriver.com> wrote:
>>>
>>> On 1/17/19 1:39 PM, Stefan Agner wrote:
>>>> On 17.01.2019 18:53, Andreas Müller wrote:
>>>>> On Thu, Jan 17, 2019 at 5:27 PM Stefan Agner <stefan@agner.ch> wrote:
>>>>>>
>>>>>> From: Stefan Agner <stefan.agner@toradex.com>
>>>>>>
>>>>>> systemd and polkit are not directly related. It is just fine to build
>>>>>> with systemd but without polkit.
>>>>> Surely it builds but is it still usable as unpriviledged user?
>>>>
>>>> TBH, I don't know, did not run XFCE.
>>>
>>> We do! :)
>>>
>>>>
>>>> If it is unusable, we probably should not make it an option anyway? Just
>>>> enable it always and make polkit a fixed dependency?
>>>
>>> Grace,
>>> Please apply this series of patches and check if
>>> xfce4-power-manager is usable as an unprivileged user?
>>
>> Thanks for testing it out, I will wait to hear from you
> 
> Hi Randy and Khem:
> 
> It's usable as an unprivileged user when project configured with below
> items altogether:
> 1, with systemd DISTRO_FEATURES
> 2, without polkit DISTRO_FEATURES
> 3, polkit package installed.
> BTW, if we don't install polkit, there comes below error:
> Missing or unbuildable dependency chain was:
> ['packagegroup-xfce-base', 'xfce4-session', 'polkit']

I don't understand this. In this case, you have polkit *not* in
DISTRO_FEATURES and this patch applied?

In that case, packageconfig polkit should not be enabled, and hence
polkit should not be a dependency.


> 
> And there also comes a question about
> "[oe] [PATCH 1/5] polkit: add polkit as a required distro feature" as
> there is a logic as REQUIRED_DISTRO_FEATURES = "polkit" added, but why
> does it inherit distro_features_check?

polkit does not inherit distro_features_check, but should I guess?

You probably meant to ask "why does it *not* inherit
distro_features_check?"

Good catch, will send a patch to add distro_features_check.

--
Stefan

