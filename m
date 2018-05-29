Return-Path: <andrew@aj.id.au>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 8747F74C85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 22:03:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 89E8321CE5;
	Tue, 29 May 2018 18:03:48 -0400 (EDT)
Received: from web6 ([10.202.2.216])
	by compute4.internal (MEProxy); Tue, 29 May 2018 18:03:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=dRiuH1I3Ij577fFro3kRGYQHolVnn
	wg7biOGGBuZLvU=; b=GjIo1myPvAC3zMIQoJYVRu48zoJEm+LC/UuO4dfbQ0UH7
	RKBf03zcEvy4mJmMaglWE1KH3zS0WV+Xd1HxFahMKxSb8eVi20dSv43kK9pumLRv
	EJqVnFQT2qB5CKI5ECSWGbSGOrdj7pZLDUp0PEYU2bOiBzwV1KWhKqfBesdXAQ+h
	eMFQO5butl8Zidk9d8+IOSOB/yn8Rry2Lpk5nUmOhXt12MRwFtdreYC42hIJjKX9
	Grnb7cq0zuBIhBRbvLBvjCJSqVpVQt9DIKHZ8pRDW3sdYocx6QFTwyAcbLOXqh8n
	2ygPXK4lkjqGtIlJC9RNsICB3h16P0WbwVL0cpTNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dRiuH1
	I3Ij577fFro3kRGYQHolVnnwg7biOGGBuZLvU=; b=VejyV+KjII3uRi1PQW50KY
	+7WG3UTOLE42vSxTBNwlsNMG/9s7oNI+noj5MGrZ62+b4ZL09DSYO7UrVPIiWHTg
	V13x+1EzWqQF/C2v2C8PykDg4/W2uMf7znq6N/r5YTShYntej5b7fFwQQr2FmVmW
	HHg2Lcl2Yi1Y5ydaQN98/TK4lOK614SbTySI5am6CjwCy/h6NnOfHxGYfwthn2uq
	Z0xZWUm8BuM3EcmA+gUW8PLH3ZHBCXn1/XTEOu+GpqmQ8e70tm46+2KXtfE1EO3E
	c3mkQAfHhxA/R2grypTWfrprzdgsqE1XDJyfIxmh3U6POx60si3zrzuO5z87iUlg
	==
X-ME-Proxy: <xmx:RM4NW5E3LZfY8B2CKVdeIA0pdJQqJq5k03Dh4yIBd-ua8CqvGEW5Jw>
X-ME-Proxy: <xmx:RM4NW5SF2CUiTpsH04s3Usja5VK7kZyb_JD-tb5zd_8sUczWQokjtw>
X-ME-Proxy: <xmx:RM4NW9y9unq0MfgvLb0hk5WLmhWzfKVK8DmKI75m2dCSVzJWT3Ricg>
X-ME-Proxy: <xmx:RM4NW90yl-keeVPe2DkfZNFdDktoDPhr3fHY7i8Evd0qryZA81J36w>
X-ME-Proxy: <xmx:RM4NWytJ4UHrt_F9NvRrdsm4Ne5cbk6p_GL46jOh7MWUgXJ9oIXC2A>
X-ME-Proxy: <xmx:RM4NWzMvXBpeK9dYSveOteMaZOzFHjBsW3SapxMvGJFyQuknAamifw>
X-ME-Sender: <xms:RM4NWwRbZVtuNX2_1hceKYHjHsp_IYR4O8bIjGLHz14fkMmOxazuZw>
Received: by mailuser.nyi.internal (Postfix, from userid 99)
	id 2AD6D4112; Tue, 29 May 2018 18:03:48 -0400 (EDT)
Message-Id: <1527631428.3392595.1389703584.53FF3C93@webmail.messagingengine.com>
From: Andrew Jeffery <andrew@aj.id.au>
To: Khem Raj <raj.khem@gmail.com>
MIME-Version: 1.0
X-Mailer: MessagingEngine.com Webmail Interface - ajax-397f98d6
References: <20180510063718.16913-1-andrew@aj.id.au>
	<1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
	<CAMKF1sp+qOKAhA3K1OqLuPBwY3w2xNFkzSnoUsEY9okKxT45ow@mail.gmail.com>
In-Reply-To: <CAMKF1sp+qOKAhA3K1OqLuPBwY3w2xNFkzSnoUsEY9okKxT45ow@mail.gmail.com>
Date: Wed, 30 May 2018 07:33:48 +0930
Cc: openbmc@lists.ozlabs.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Tue, 29 May 2018 22:03:47 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"



On Wed, 30 May 2018, at 02:34, Khem Raj wrote:
> On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> > On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
> >> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> >
> > Ping - is there anything I need to revise for this patch or the following two?
> >
> 
> There was a review comment for you to adress, see
> 
> https://patchwork.openembedded.org/patch/150467/
> 
> if you have addressed that please send a v3 for whole series.

That comment is on v1 of the series. This is v2, and I have reworked the recipe to simply clone the git repo instead of grab the tarball to avoid the issue that was pointed out.

Thanks,

Andrew

