Received: from mail-ey0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QnuLO-0005f3-Uz
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Aug 2011 17:23:50 +0200
Received: by eye4 with SMTP id 4so6440023eye.37
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Aug 2011 08:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=pt/SUGybhvVwrFyT5PGNDA6UvagafYoCNzsuld6c5tU=;
	b=Z0StUObgjEn8S5qp0u+SBNQZuudSDIzAxVWJCP481VhJEkXB32l3K65wruOq2hFd8+
	ua4txNPdo5swTOM7IOyFQ5MRy5IAfzcaCEQJWfRRIrq4e0QkRsj5PcA6kA95u9S9uNu9
	G+trTB6udNBK6Ugi10fwcCDcxLngUCnUn/FFY=
MIME-Version: 1.0
Received: by 10.213.3.198 with SMTP id 6mr790219ebo.15.1312211970296; Mon, 01
	Aug 2011 08:19:30 -0700 (PDT)
Received: by 10.213.113.196 with HTTP; Mon, 1 Aug 2011 08:19:30 -0700 (PDT)
In-Reply-To: <4E365C54.3000205@gmail.com>
References: <1311980287-31536-1-git-send-email-agnel.joel@gmail.com>
	<BAF0F415-E659-485C-855F-271AD4ABE73B@beagleboard.org>
	<CAD=GYpbN-8O1yWnbPGE_XLThnBSAoKosw2998Hq1MqWMjbMQAg@mail.gmail.com>
	<4E365C54.3000205@gmail.com>
Date: Mon, 1 Aug 2011 10:19:30 -0500
Message-ID: <CAD=GYpah28zXcTtMtWN-5LPKExfFBHJj+hVEDuK=UUjUqq5KJA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Vladimir Pantelic <vladoman@gmail.com>
Cc: Jason Kridner <jdk@ti.com>, Joel A Fernandes <joelagnel@ti.com>,
	beagleboard@googlegroups.com, Koen Kooi <koen@beagleboard.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [beagleboard] [PATCH] gst-plugins-good: v4l2src: Make Leapoard Imaging VGA Camera work out of the box
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
X-List-Received-Date: Mon, 01 Aug 2011 15:23:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Vladimir,

On Mon, Aug 1, 2011 at 2:57 AM, Vladimir Pantelic <vladoman@gmail.com> wrot=
e:
> Joel A Fernandes wrote:
>
>>>> =A0+From d5a1f365bfd4420912735709bcb8004d3ad7226c Mon Sep 17 00:00:00 =
2001
>>>> =A0+From: Joel A Fernandes<agnel.joel@gmail.com>
>>>> =A0+Date: Fri, 29 Jul 2011 17:23:43 -0500
>>>> =A0+Subject: [PATCH] v4l2src: Add UYVY color format to the list of
>>>> enumerations
>>>> =A0+
>>>> =A0+OMAP3 ISP returns -EINVAL for VIDIOC_ENUM_FMT ioctl on video node.=
 Due
>>>> to this, format negotiation fails. This adds UYVY format to the list o=
f
>>>> enumerations.
>>>
>>> =A0I must be missing something, but what has negotation failure to do w=
ith
>>> adding a new format? I would expect adding new formats not to have any
>>> effect if negotiation fails.
>>
>> The way it works is:
>>
>> Enumerate formats -> =A0Negotiate formats between source and sink pads
>> and set the format
>>
>> Enumerate formats doesn't return UYVY (The driver is supposed to
>> return this but ENUM_FMT ioctl is not implemented in ISP like I was
>> saying). Due to this, the negotiate function is either unable to find
>> a matching format on the sink pad (if you used a UYVY caps filter
>> element) or fails to set the format if you used a more general
>> element.
>
> and why not make ENUM_FMT ioctl return what is needed??? Instead
> of "hacking" the gst driver?
>
>

That'll be a hack as well:
http://www.mail-archive.com/linux-media@vger.kernel.org/msg29718.html

Regards,
Joel


