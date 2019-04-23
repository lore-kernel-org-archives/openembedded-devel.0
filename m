Return-Path: <paul@betafive.co.uk>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC9060043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 00:41:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 1726821111;
	Mon, 22 Apr 2019 20:41:29 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Mon, 22 Apr 2019 20:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=subject:to:cc:references:from:message-id:date:mime-version
	:in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=e
	QuGf9XCh7W6QUZFvNPPG4AqTTDsQ3PMw7hGI2Zf99g=; b=jzfkx56M2FE4btHdj
	Ocg37NoHlrRPsg6swvUyyBPLFYEE+H1Kq9c2TTm7GOoDrKrzqWlLPuS6DIv/w/VS
	tcVE8NNkYxJkvWOoMwsyH8Hwu96zTJKKiuu1z4hWpA2hrFkYMqgaRXN2evpp1wzC
	QDI/ANvFt/ZVD37znxswGat+SMp0SJ0bruWwRURxRqoiEmNCmA9XHgUkJomD94Xm
	kEv2Q6wcdH1ZIWjUomtESkhorGp6PmwNpBri3fGEe3yaRlEbJEmEckbHJOVcuJx4
	poqmuTLq+5H3R5FJTqc9LWR+8EcLHcgHt5YmvoYkZ9w5wkm6RqicKtdnGsELf3bX
	p0/Mw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=eQuGf9XCh7W6QUZFvNPPG4AqTTDsQ3PMw7hGI2Zf9
	9g=; b=atiknZOTBgpd3IMMgRlg0XK/5DMvhjmGlzcO7u00sTJgVF+WoBLGQ2y7w
	HDc0/YBJYtPqao/EAEkVfMcGvwZXn9lL/DRamLecYsOz1hNH/tIbAyHgAulqzfQ4
	dRg1OebwUw4w8tEH8nFXT3pWo0TFj6TSelkV2wiQqf3ZCb70gC9wSK7kAUVKpciJ
	heT40gdAr/oaUkdZC5Kj2zwCyWtbW96BSpPPna5Z8BnJlMWlV6ftCbydqaCeEuMO
	uMRZ+1oIVPXRWJihv+u4EQytRlVFEE/dItfpgfUHPS2jEu5yfX6ofG7Own5T411i
	8QBdiPRLb50N6dQKX2+Zm5Ouwv/og==
X-ME-Sender: <xms:OF--XK-749STalfWixI8-ldvSXgW7cAET-uhCpqaLS7ngmv_5Rnk_g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrgeejgddvkecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefuvfhfhfhokffffgggjggtgfesthekredttdefjeenucfhrhhomheprfgruhhl
	uceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucffohhmrg
	hinhephihotghtohhprhhojhgvtghtrdhorhhgnecukfhppeekuddrudekjedrfedvrddu
	feeknecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtoh
	druhhknecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:OF--XCkulSHHIMyPIMogqXzFTgp9EBecp1dvneeX7a5ioK6Tm6vI9A>
	<xmx:OF--XPbcfCNqBxUAUIaWw31TcFnqkCAU5iwUPzdMEyTXWKsxVgb6wQ>
	<xmx:OF--XKOgyGUqjcu6VxWlNwK0d52imCFBssGQiGqYcRef2Q5iMSQ9ng>
	<xmx:OV--XJkv-KKPi-heDaDu7RQu_O4JemS2jrIxv_MwB-SY4Du5-SOn2Q>
Received: from [192.168.2.138] (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2402BE415C;
	Mon, 22 Apr 2019 20:41:28 -0400 (EDT)
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>
References: <20190422234617.5419-1-schnitzeltony@gmail.com>
	<e9587755-4b63-90cf-1738-930b808da883@betafive.co.uk>
	<CALbNGRQdfS-xNdheKuj=AA1zaChsA_g1gb6kMkiU8jGXngfw0g@mail.gmail.com>
From: Paul Barker <paul@betafive.co.uk>
Organization: Beta Five Ltd
Message-ID: <16abe617-eaaf-afe4-6190-f51315494712@betafive.co.uk>
Date: Tue, 23 Apr 2019 01:41:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQdfS-xNdheKuj=AA1zaChsA_g1gb6kMkiU8jGXngfw0g@mail.gmail.com>
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
X-List-Received-Date: Tue, 23 Apr 2019 00:41:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 23/04/2019 01:07, Andreas Müller wrote:
> On Tue, Apr 23, 2019 at 1:55 AM Paul Barker <paul@betafive.co.uk> wrote:
>>
>> On 23/04/2019 00:46, Andreas Müller wrote:
>>> * qt4 support is gone -> move to qt5
>>> * enable qt5 gui in case meta-qt5 is in layers (it is more or less useless
>>>     without gui)
>>> * while at it remove noop libtool copy
>>>
>>> Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
>>> ---
>>> V1 -> V2: Aargh again typo in commit messeage...
>>>    .../recipes-multimedia/vlc/vlc.inc            | 25 ++++++++++++-------
>>>    1 file changed, 16 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>> index 19ac8206c..6ba1444b5 100644
>>> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
>>> @@ -36,12 +36,18 @@ EXTRA_OECONF = "\
>>>        --enable-realrtsp \
>>>        --disable-libtar \
>>>        --enable-avcodec \
>>> -    ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}/moc4 \
>>> -    ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}/rcc4 \
>>> -    ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}/uic4 \
>>> +    ac_cv_path_MOC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/moc \
>>> +    ac_cv_path_RCC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/rcc \
>>> +    ac_cv_path_UIC=${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/uic \
>>>    "
>>>
>>> -PACKAGECONFIG ?= " live555 dc1394 dv1394 notify fontconfig freetype dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
>>> +PACKAGECONFIG ?= " \
>>> +    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
>>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
>>> +    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)} \
>>
>> I don't like this change based on BBFILE_COLLECTIONS, it's just a
>> different way of having things change when you add an extra layer. We
>> wouldn't want an unconditional bbappend in meta-qt5 to set this and so
>> we don't want to set it here when that layer is added.
>>
>> Perhaps we should have qt5 as a distro feature instead?
> Isn't that a different naming for the same thing not working properly
> if you don't have meta-qt5 in layers?
> 

Agreed, we shouldn't give people more opportunities to shoot themselves 
in the foot!

For my builds I have all layers added all the time and just 
enable/disable features as needed. So just because meta-qt5 is included 
as a layer doesn't mean I'm even building an x11 or weston 
configuration, it could be command line only in which case I wouldn't 
want this extra PACKAGECONFIG creeping in.

meta-virtualization handles this by gating overrides on a 
'virtualization' distro feature and adding a sanity check that you 
enabled that distro feature when adding the layer 
(http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/classes/sanity-meta-virt.bbclass). 
The sanity check can be disabled by setting SKIP_META_VIRT_SANITY_CHECK. 
I find it a bit messy but it does work.

What would work for this case is a bbappend in meta-qt5 which checks for 
the 'qt5' distro feature. The benefit of using a distro feature is that 
we can gate changes to other recipes on the same configuration setting 
so that we don't need to set lots of PACKAGECONFIG values explicitly in 
a distro or local.conf.

Forgive my 01:40 AM brain if any of that doesn't make sense.

> Andreas
> 

-- 
Paul Barker
Managing Director & Principal Engineer
Beta Five Ltd

