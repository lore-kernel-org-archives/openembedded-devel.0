Return-Path: <dbaryshkov@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3C53B6D75A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 23:31:51 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id tp5so4331466ieb.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=swTcS6EUPvPDG35dgLnNoDDe6og9h/MYI5xoO33KGQI=;
	b=FmGnT0b2ND3GG0gmJWcACnCQknjoahTa64S6RjaTFU6ZYDj3oVRZ5NSfLHeiKcT2lS
	nB+hP3KAotee9NyW4QczN9HKAmTnBVINV0tCnhWGwhmUQoxVHuC9V/Og/HB+RHGixnrk
	aleD6HjxDi4oY5AX0r+LXvnbuRWp4etng2gu3HANygFvOCUiISJWzDiu0oHpCo20pwix
	RoPSzl+ngF5yGagsFlwheAzxS55ZCqeTAvOQSAkynPoFY4O6JpASE7QF0x7O3z6aLofa
	gFKdOEqVq14WpXUs95oNVtL+XS29L2iFyVzknbcInPZ0vbQRUi0SqsvN14HnR8u8HWyC
	NlBw==
MIME-Version: 1.0
X-Received: by 10.50.57.115 with SMTP id h19mr17399182igq.2.1384299112727;
	Tue, 12 Nov 2013 15:31:52 -0800 (PST)
Received: by 10.64.250.37 with HTTP; Tue, 12 Nov 2013 15:31:52 -0800 (PST)
In-Reply-To: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
References: <1384292479-15815-1-git-send-email-andrea.adami@gmail.com>
Date: Wed, 13 Nov 2013 03:31:52 +0400
Message-ID: <CALT56yO=e=o-ZJQqjFS=tYGjeX6YcgfRosTuxn_NnM7g1dHB4Q@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-handheld][PATCH] linux-yocto: collie: add pcmcia clock fixes for sa11xx
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
X-List-Received-Date: Tue, 12 Nov 2013 23:31:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Wed, Nov 13, 2013 at 1:41 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  .../linux/linux-yocto-3.10/collie/collie.scc       |   5 +-
>  .../patches-sa1100/pcmcia-clock-alias-sa1111.patch |  31 +++++++
>  .../pcmcia-sa1100-device-clock.patch               | 100 +++++++++++++++++++++
>  .../pcmcia-sa1111-device-clock.patch               |  44 +++++++++

I'd suggest to get only pcmcia-sa1100-device-clock.patch and drop two
other patches.
They are not of use for collie, since they are for devices with sa1111
companion chip

-- 
With best wishes
Dmitry

