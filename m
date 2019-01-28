Return-Path: <krussell7711@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id 271217C585
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 18:50:39 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id h128so3908612vkg.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 10:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iV4pP1RrfVIajhsW9yU/ipzMYuTjR/wk2q21WHwo4Kc=;
	b=sTovgdrre7nLbeAEuHY1/98tFmqXL6glIWxDrwGeI9ZMiPTi20Qc3rfr2aJ4oN6czk
	bhZjHCZ53mqG2A19JNTrTDhAS0TMDY0GrCuZpxoO4/IIzXg0Ww2e8ocGiQJEu9WsJvJG
	/ifxoXxs2wq7+wXO/suEXbfVbHlokWnzQ25+skC/be98G8kF/4epZN5UvLPKkKZiUzE1
	wcC3LS7jyt/QlD3ajn5wgsa+YzADpjEamiXBNdKCr2X+mzKOeI33AuNGIiE9+i47WbUq
	Md8JRK1Kh7VGlHiooM57ry9mn3O1UfRF6tKTIOETV8hg2cK73DqGyTSoVlIUBZmSofFo
	r5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iV4pP1RrfVIajhsW9yU/ipzMYuTjR/wk2q21WHwo4Kc=;
	b=kXwYLy1KzruKS9elOItZckp1S7I3ElxYP+0uD4zWBIisg+2Hn3zXz9iD5s28YGN2vC
	i07fquyd7gPd32cQNDkUcBVhWVDt0fXfBuoIC7Ze7jtI5fIz9XtYXr1xqRZa/sezWJq0
	/hYXMwf5qzz1LilBMW8ldkfZItD3w1MxmMfP2PtqNI9FQmzdGuMYmJbzQVL8Bg8lZw8o
	6HXpClgtcImytzfvZkDp20lYHbP5GOua/qSv5v5foVZG9WIBsm2GlcUOw8eC5KUs/MIi
	tst5DXXSoZwKXqI6kO5Cti5DFl6rnFH4c0yCUFyFhdOc0oMXHUZ/i7ULkKFhgt/71kux
	Mhvw==
X-Gm-Message-State: AJcUukcLeMdjY83tz3eNKsLs/G3OXyRRRisgnHu0ifiSRlnTa9JHKmVf
	wzPcNCQenD8U7f3TMp7SOsLAoNTBdObea071hqc=
X-Google-Smtp-Source: ALg8bN4awTeytptSFCSdleJ41vcXhzKtXnhFiVBIXd1eSbQwkQ72RTsBWL4RLu4fbVYFc0A1GhSV4wrqY+2pkNU6qlA=
X-Received: by 2002:a1f:2f48:: with SMTP id v69mr9349989vkv.20.1548701439514; 
	Mon, 28 Jan 2019 10:50:39 -0800 (PST)
MIME-Version: 1.0
References: <CAAsqSTcN2Bkk_k_MLEWSTesEFEJURrXvHdyY2TzuA_fEh4iJUw@mail.gmail.com>
	<6c8e0af4-bb46-ba48-eafb-a91a60bc837d@skidata.com>
	<CAAsqSTdT-+0y=m_Oo2+8JEAmcGfVWLktUgXLG5LZ5qSmkHfVSw@mail.gmail.com>
	<ae008457-e85f-59b8-07cd-fbe13eb55cdf@skidata.com>
	<CAAsqSTcUVka9cWOueYVEKQj=tzx0Xuge3oED3dVdp9M-CXZPzw@mail.gmail.com>
In-Reply-To: <CAAsqSTcUVka9cWOueYVEKQj=tzx0Xuge3oED3dVdp9M-CXZPzw@mail.gmail.com>
From: Kyle Russell <bkylerussell@gmail.com>
Date: Mon, 28 Jan 2019 13:50:27 -0500
Message-ID: <CAFrQVPP5yfGuW=pQM7W0TLEO-SA1t0w9mVLcZ1piPNtNpt+ZHA@mail.gmail.com>
To: attie.grande@argentum-systems.co.uk
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH 2/2] openjdk-8: better interface invocations
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
X-List-Received-Date: Mon, 28 Jan 2019 18:50:39 -0000
Content-Type: text/plain; charset="UTF-8"

I encountered the same problem on ARM, and arrived at the same upstream
patch independently.  Would you like me to send my meta-java patch prefixed
with [sumo]?  I'd be interested in having this fix backported, if you're
still taking fixes for sumo.

On Mon, Dec 17, 2018 at 10:12 AM Attie Grande <
attie.grande@argentum-systems.co.uk> wrote:

> > No problem, please just put [sumo] in the subject then.
>
> Sure, thanks for letting me know
>
> > Ok. Just fyi: We will likely update to 8u181b13 soon
> > (see https://patchwork.openembedded.org/patch/156314/)
>
> Great - I'll keep a lookout!
>
> There is further information about my issue on jdk-dev.
> The thread starts here:
>
>   http://mail.openjdk.java.net/pipermail/jdk-dev/2018-November/002246.html
>
> Attie
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

