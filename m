Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 928AD71989
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 08:42:53 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id 23so10020533vkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 00:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=lSS2wmwLpMNRPcfhWM/mqtKwcrxixrXSEky/Evyk+vk=;
	b=sxqOebrtb2hpB3OIPG1bTaaerJhSgvcekTZ3U55jGTCQBEtmce/34ukkkpok/lEEhH
	VQXoaJk+eMOXsu/WpRPd6etAH4B7+wC0zW0pJaMHP9z3hFgtDhfep2e/PYAyxDbBTW29
	27oJCLbrT9lcbRnH8M4cyjoGDT9BK1Cdesccc7JjiEfMqTdqoDbXDchYHW+8sAWqmU2V
	oNR2meWw/iK0CR801WmEIX0scTC/H+HuOv8bt/Ay4IJxFk824PDbCNLystWaeMFskbh/
	YDsFYW+Uifyr9ZW6c6iRUw8NaGlARhtI+hrSR4yfGwfeBlaEO0Qcif/JRFuMuP+JmHB9
	ML/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=lSS2wmwLpMNRPcfhWM/mqtKwcrxixrXSEky/Evyk+vk=;
	b=D0pTVOFnwyM+k3jeWov5jSw7dwdcolJk22qdH0uqHKtb6tmzdnCjZm9M6haVP+C5bF
	jYk40DbzOkeSDCfqC1JU4P93Hq0Au0XWkqljW/AB8GNod1jZknieXX+/EI3KfSOw5hbz
	G15nZRGoknr+SfkkLD9qvzr5772PCy2oY4CjwWw9vzfr0OmSQdpCxDbJGk4HQpHWZqyY
	Qv2X4JlPpOqAAZDugWqdHSEnD2xMOFfCF0G74ZxHV71s0vEZRoyUvWDNXKszQPmtr0rZ
	Zfm2GkuQotoMKW5SbGigAXZKCCBCtOwu3eavFXheSWp3rp7WgiM/MgU5JMm1bXenq6Il
	WwlQ==
X-Gm-Message-State: AMke39lC+In+WQ6q/yGS5+9NS303I6z10cbG9xLtQ99mq11Wr2TzLBLWSz8+s4jSK2ju1tP7jdFhGTO6B1h37Q==
X-Received: by 10.31.8.147 with SMTP id 141mr12987445vki.111.1487666574240;
	Tue, 21 Feb 2017 00:42:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.72 with HTTP; Tue, 21 Feb 2017 00:42:53 -0800 (PST)
In-Reply-To: <CALbNGRSktvJjZj42x1uX+YjYC=E9ZjmnBVeoSjKa1p1j1Q9h1Q@mail.gmail.com>
References: <20170220180700.29836-1-schnitzeltony@googlemail.com>
	<20170220180700.29836-9-schnitzeltony@googlemail.com>
	<CALbNGRSktvJjZj42x1uX+YjYC=E9ZjmnBVeoSjKa1p1j1Q9h1Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 21 Feb 2017 09:42:53 +0100
Message-ID: <CALbNGRQN5vrCT8C-aRV3NQUBiZ6O80fA_SyznjfMUy5rmmx8Kw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 08/44] mpd: rework DEPENDS and unblacklist
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
X-List-Received-Date: Tue, 21 Feb 2017 08:42:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 20, 2017 at 11:24 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Feb 20, 2017 at 7:06 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> To be honest: Have no idea why it failed detecting icu-i18n
>>
>> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ...
>> +inherit autotools useradd systemd
> ^ I bet it still fails. Guess pkgconfig is missing here...
>
I have rebased rss-fixes-andmore branch and send V2 for both mpd patches

Andreas

