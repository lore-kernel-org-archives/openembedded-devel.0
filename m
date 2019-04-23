Return-Path: <paul@betafive.co.uk>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id AC1B86D51A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 12:07:25 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 43DA622BCE;
	Tue, 23 Apr 2019 08:07:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Tue, 23 Apr 2019 08:07:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=9
	yWvTOVMEwD8xVo+pfIXgOzUaQuitHHD6Nemt9uUduM=; b=oKu04FIdg20R0Ffj2
	bV2dv3b3GFGdcA0QXCX6B/CQPNQlUdy1FReygDPGMTzF9EJepwqkVhjXivkCbAUT
	7BcBlfhgECCMVRXuC9bmmS1THU21tnplkRNBahXY55RFg0OcQzV5pKJJjFbCnyro
	0WMJMQbG94x+HMBbmFTLmn2zA4UuP388Ds0PCza576xRW8vYjhQIbvGjogWD3lfR
	c7+w++vgD0fqqjBIWcHaEZX6WHdGv5zsNHoAZa91q3FRoMzyZ+1LiTwVAIWkxiP1
	NfRNFkX6YAvFWJFHAhQfTQYgV1UUMufarcwUBbLoFqus+lgvjOJwXCnEQDt0qsYA
	0fdhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=9yWvTOVMEwD8xVo+pfIXgOzUaQuitHHD6Nemt9uUd
	uM=; b=TxKD3aFJQeLNILAA+Mn5dE99rf9pDKM6DU7Cg9KOE6ECL3tnXwy7N4kZB
	yAHFcqoniAZzYFSVgtOiAZJ4ppM4fgV2M3+ExBWRydP6Z7SDuEhntBTAFMcTfnRo
	ObI3d12XRnCmXq1EH++lxJC23/yWvbCe4RAcbuqEPHdSQ5S2IuKfDbvXQnu1jyrs
	kFlFNU0/yX3+M7KwHEWq/yu2jqhBbZN4gnRhq1roehg4BP5Ka9d7+t918O/v1L6w
	ukxcT/RrG+ADO0fEB98oDrwKfb34Ee+PLuurzV6pMHj0cnJsWobmsx8EE/Ln98xU
	uN/9OOZxgGq9FK1Ivognd69qUTvNg==
X-ME-Sender: <xms:-f--XOVNjmCEK45sjulDlY8gL_hjV293eH0Aq4h0j9BmYa1ezAdZFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrgeekgdefkecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefuvfhfhfhokffffgggjggtgfesthekredttdefjeenucfhrhhomheprfgruhhl
	uceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucfkphepke
	durddukeejrdefvddrudefkeenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegs
	vghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:-f--XD5YnD96XGWeCS6tCEBWfsIUDPQzQQ1D4cfhBGpW0SISJMhhpg>
	<xmx:-f--XJoVdxA7V3XY2TKScd8NFKVzkzDop-Rpc0NYTRL5pQfW2AXjFA>
	<xmx:-f--XGmtRAWnCYF3A0fJgJSnf0UHGVVySG0-K_WjPpbA5_i09RyC3g>
	<xmx:-v--XD157tuoxELgBXm2y4RDgWXE874mAS5Q_wvenh5rEsKZo8_HnA>
Received: from [192.168.2.138] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2A62910319;
	Tue, 23 Apr 2019 08:07:21 -0400 (EDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
	Adrian Bunk <bunk@stusta.de>
References: <20190422234617.5419-1-schnitzeltony@gmail.com>
	<e9587755-4b63-90cf-1738-930b808da883@betafive.co.uk>
	<CALbNGRQdfS-xNdheKuj=AA1zaChsA_g1gb6kMkiU8jGXngfw0g@mail.gmail.com>
	<20190423060805.GD18826@localhost>
	<CALbNGRQ1Va=0Yn_s17mnr6YeL1V0oNFViFZzeAf1184=WtW1gg@mail.gmail.com>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <ba049a6b-31ad-7bbf-3759-87a43f3d3d30@betafive.co.uk>
Date: Tue, 23 Apr 2019 13:07:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ1Va=0Yn_s17mnr6YeL1V0oNFViFZzeAf1184=WtW1gg@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] vlc: rework qt PACKAGECONFIG
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
X-List-Received-Date: Tue, 23 Apr 2019 12:07:26 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 23/04/2019 12:30, Andreas Müller wrote:
> On Tue, Apr 23, 2019 at 8:08 AM Adrian Bunk <bunk@stusta.de> wrote:
>>>> Perhaps we should have qt5 as a distro feature instead?
>>> Isn't that a different naming for the same thing not working properly
>>> if you don't have meta-qt5 in layers?
>>
>> Isn't this a reason for moving vlc out of meta-openembedded?
>> Or alternatively moving qt5 to meta-openembedded.
>>
>>> Andreas
>>
>> cu
>> Adrian
> This discussion turns into the same direction as seen before on other occasions:
> 
> My priority is building images where things work out of the box and it
> seems this expectation is not common here. There are several default
> configurations around reducing things down to death to save build time
> and make yocto script happy. I disagree completely but won't discuss
> further. So I will
> 
> * send V3 of this patch not enabling qt5 if meta-qt5 is in layers
> * add a bbappend to my meta-mortsgna because that's what distro layers are for
> 
> Andreas
> 

The issue here is the different 'out of the box' situations Yocto needs 
to support. Some of the boards I've deployed images on have 16MB flash 
for the rootfs (with a greatly reduced write speed to the volume due to 
hardware bugs), others currently have a 16GB SD card in them.

Distro layers are the right place for making cut off decisions on the 
minimum you'll support. A distro config that produces 'out of the box' 
working images for a subset of the boards Yocto Project supports is 
definitely a good thing to have.

Thanks,

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

