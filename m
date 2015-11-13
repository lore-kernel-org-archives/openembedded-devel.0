Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id AC5E8772E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 12:05:47 +0000 (UTC)
Received: by ioc74 with SMTP id 74so95111133ioc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 04:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ieTTKfMKNH22IoVysMWFYaDrD0r/KvY5gUt9F9NGRIs=;
	b=u4qGIGxgf5L8GLuKZL38M4r1E5LSv2CnLIzpG0g5cyhtFSaS0djJU23aOETloheyOY
	3zdKpN76mK6kI4mm0aCatNRyJlgVHYpY09LRaqzBpRPhh1EiS8+RDxbcw3TX2ZGIapoH
	Bxbsri3hquxdm99W31DfXXqbsqfMTv1uDbjSathNi4UuE8gbb2PcBrO5eiXiV8elHbFA
	vRaCfvV9zXMCroR7jduMYBCG1vJCprvFfAiDfSjEe2/rWCKoPjYmH3S4kYtQ1YvYJI7N
	Tf0kqG4sXPEqqhT4RHbTqQfK1OecXXxHd+Ytn0YMw9Lp7JDYVDNrKTe4LCFYPpztC14o
	BnZg==
MIME-Version: 1.0
X-Received: by 10.107.130.155 with SMTP id m27mr22148582ioi.133.1447416347418; 
	Fri, 13 Nov 2015 04:05:47 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Fri, 13 Nov 2015 04:05:47 -0800 (PST)
In-Reply-To: <5645CD5C.8040908@windriver.com>
References: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRQuQcD54T7raCZdhM3-fTpiiH2Xa2C=0svMq8w+HMrnkg@mail.gmail.com>
	<CA+chaQefhmSve7vJPMAFtzmay=+qgcrW-UJ-M3FY4Yoa8ZiAuQ@mail.gmail.com>
	<CALbNGRSt0Ws2KpBmqL9xuMGEj-CaZN+DXqg1N6Z8Cqj7frR3SA@mail.gmail.com>
	<5645CD5C.8040908@windriver.com>
Date: Fri, 13 Nov 2015 13:05:47 +0100
Message-ID: <CALbNGRSErpjVpHjKQp20u6y-QmNe7GE+GcBWCPhEwSB9==yGEw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] meta-xfce/layer: explicitly set networkmanager to NETWORK_MANAGER
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
X-List-Received-Date: Fri, 13 Nov 2015 12:05:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2015 at 12:45 PM, Hongxu Jia <hongxu.jia@windriver.com> wro=
te:
> On 11/13/2015 06:36 PM, Andreas M=C3=BCller wrote:
>>
>> On Fri, Nov 13, 2015 at 11:19 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>>
>>> Why not use VIRTUAL-RUNTIME variable like in other places? And if it's
>>> needed by xfce4-power-manager, then why don't you add it to RDEPENDS
>>> there?
>>>
>> networkmanager is already in RDEPENDS of xfce4-power-manager. I think
>> when building an image packagegroup-core-x11-sato there is a conflict.
>>
>> I looked into this a bit more and think:
>> 1. networkmanger support is optional so a packagroup would allow
>> conman and xfce4-power-manager live together in harmony
>> 2. I think the patch goes much to far: To have networkmanager in
>> images based on packagegroup-core-x11-sato the correct way would be to
>> write NETWORK_MANAGER =3D "networkmanager" in the image recipe.
>
>
> Hi Andreas,
>
> The condition of writing  NETWORK_MANAGER =3D "networkmanager" is
> packagegroup-core-x11-sato + xfce4-power-manager, I think it is not
> proper to test the existence of them in an image recipe.
Here I was wrong
>
> Hi Martin & Andreas,
>
> How about we still do the setting in meta-xfce's local.conf and replace
> networkmanager with variable ${NETWORK_MANAGER} in
> xfce4-power-manager's RDEPENDS.
>
> So we could globally control network manager by variable
> ${NETWORK_MANAGER} for the similar issue.
>
> //Hongxu
>>
>> Andreas
>
packagegroup-core-x11-sato ships a more or less complete
matchbox-desktop. Why build this together with xfce? OK even if you
really want to do that for some reason - I think this is a corner
case. So why adding a layer - global variable for this?

So I think
* If you want to use xfce4-power-manager + packagegroup-core-x11-sato
+ connman -> add a packageconfig in xfce4-power-manager
* If you are looking for a solution to make packagegroup-core-x11-sato
use networkmanager ask somwhere else this is not meta-xfce's job

Andreas

Andreas

