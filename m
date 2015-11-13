Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 775A9772DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 10:36:00 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so11873962igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OaOBWXmkRQoDqeAcXXQTvYe816XbN1LoCreuiDgVa4s=;
	b=zzFw6bvGB7Le38sSUkbbbLbgReP3qAHE+uCir9hFgCtqfOsOHHn5cWawjIMDOyTfIx
	vd5jOPlGkl4PQA4lj7m6k43v2xPxEfFwkLpYVW9JwmqoKoXY8nZWkqidor6Rfv0xnesa
	YgyKdr7VJfe8mvCP5UsDXO01gCRKkyuGCLGw+foOlkPVsGLE4bYSLX4ReHBQTJztuPLl
	s5UJ+UDTfFz8GZ8vZmFmB3ea6cJBHyjcvZDrRtCvr+A+gSQ4jc1DUfiax+tCvneFnWJN
	CX81pKN7hoBKHiXanpnIsGvD1n1cc1tfOwjAl/BPmpHYtd2iVPXbBwuI6T7ZP3Oeqcv9
	0zCw==
MIME-Version: 1.0
X-Received: by 10.50.79.129 with SMTP id j1mr2466616igx.52.1447410961223; Fri,
	13 Nov 2015 02:36:01 -0800 (PST)
Received: by 10.36.31.131 with HTTP; Fri, 13 Nov 2015 02:36:01 -0800 (PST)
In-Reply-To: <CA+chaQefhmSve7vJPMAFtzmay=+qgcrW-UJ-M3FY4Yoa8ZiAuQ@mail.gmail.com>
References: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRQuQcD54T7raCZdhM3-fTpiiH2Xa2C=0svMq8w+HMrnkg@mail.gmail.com>
	<CA+chaQefhmSve7vJPMAFtzmay=+qgcrW-UJ-M3FY4Yoa8ZiAuQ@mail.gmail.com>
Date: Fri, 13 Nov 2015 11:36:01 +0100
Message-ID: <CALbNGRSt0Ws2KpBmqL9xuMGEj-CaZN+DXqg1N6Z8Cqj7frR3SA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
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
X-List-Received-Date: Fri, 13 Nov 2015 10:36:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 11:19 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why not use VIRTUAL-RUNTIME variable like in other places? And if it's
> needed by xfce4-power-manager, then why don't you add it to RDEPENDS there?
>
networkmanager is already in RDEPENDS of xfce4-power-manager. I think
when building an image packagegroup-core-x11-sato there is a conflict.

I looked into this a bit more and think:
1. networkmanger support is optional so a packagroup would allow
conman and xfce4-power-manager live together in harmony
2. I think the patch goes much to far: To have networkmanager in
images based on packagegroup-core-x11-sato the correct way would be to
write NETWORK_MANAGER = "networkmanager" in the image recipe.

Andreas

