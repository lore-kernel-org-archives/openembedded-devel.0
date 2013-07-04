Return-Path: <paul.betafive@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by mail.openembedded.org (Postfix) with ESMTP id E3F0E605F2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jul 2013 10:55:54 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id i4so1746882oah.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jul 2013 03:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=Zf5+qj+UitNd3+TtSXLVP76vFmNn7+/bCQb8Y1D8Q+A=;
	b=tEXZkYo/xgKO6yxhPQV2Kxdmb2DyIbgDutkxZidkrlfe0JwaLItUMxNy0F2TbOqXuz
	T0BBwqb+X5kmmhQykihL+f79RleDg9dhICJafJTtROYI71roP3Ie+gqiMkwQu0kSjncE
	u+pfotx7Mrrlgw8hGqYGzvmMLfe+pbIPPplZVuta7g0KJigpK6x0HyfEDUZWxNHxnjV4
	/+WvdB9ORveQv//JGiNFP9fDMAaGnC3KCFL6gENvzA0J72ff/PyeAfYlsuByUXwW4h59
	zW3nYCyJ0MqNpUoHetf+JGdRd4veFVZsASAsEpQbent8uNVKtz6Ka+RJVx+Q+uOB1rKQ
	VC6Q==
X-Received: by 10.182.81.202 with SMTP id c10mr5495785oby.27.1372935355303;
	Thu, 04 Jul 2013 03:55:55 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.76.102.11 with HTTP; Thu, 4 Jul 2013 03:55:15 -0700 (PDT)
In-Reply-To: <1721069.SICaQ1bLDa@helios>
References: <51D42561.8060907@ts.fujitsu.com> <49035936.yua4bikce8@helios>
	<CANyK_8eOaDbVANrOUuRAzhguRSBjv_puQdjjL+NbfVvv79pU7Q@mail.gmail.com>
	<1721069.SICaQ1bLDa@helios>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Thu, 4 Jul 2013 11:55:15 +0100
X-Google-Sender-Auth: wQmxpn_9Ij5J9CqRC_N7IQ5sRdU
Message-ID: <CANyK_8eNmm_jnpFgn44TwBLhOdSr1vyVouraHnvwz0T9iWfbkQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: bitbake dies with an python exception | AttributeError: 'NoneType' object has no attribute 'rfind'
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
X-List-Received-Date: Thu, 04 Jul 2013 10:55:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 4 July 2013 11:48, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>
> If this issue is reproducible I'd really appreciate some help in doing so; we
> shouldn't be showing tracebacks if we can show a meaningful error.
>

Not got time to try reproducing right now, but I did have a very quick
look in git.

On the bitbake side:
http://git.openembedded.org/bitbake/commit/?id=860ec42b220b7ed3f3bbe52c3546bba66644eac8

On the oe-core side:
http://git.openembedded.org/openembedded-core/commit/?id=003ea0fd1017dde50ced710179d0dc2e835d5185

If you're running bitbake with the linked commit applied it looks for
FAKEROOTCMD, if your oe-core doesn't have the linked commit it won't
find FAKEROOTCMD.

--
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

