Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
	[209.85.210.54])
	by mail.openembedded.org (Postfix) with ESMTP id EC3B27F388
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Aug 2019 14:02:27 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id l15so47434504oth.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Aug 2019 07:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cvR4QPd5nhMHQYRFIrgeYBG3yo/QJYUrsaLnikyZBwQ=;
	b=j+XkWtzv+0FXf3i4NiARqEJipmkHbqwzpbTgMIZ/EoKm21vWI+xJYptlXTNsxd2mzs
	3vUoA0I6ZOTRPARLNkggdz2taa7ww3Uj4a+cPKZ1GypGDzctHUOF8+e8HfKCGDrNb9n4
	NayFaFJ8aIph9Iqefml+7PaukIN8EdY30R4/qlX6vBC0wJLhra5GM/8OUsZVQsYrevJN
	GgAoDb99cf1XFvvB+MxHEx47ZrpFvLKgl5XKxqcPM+2GEXX8Pb9CgWoF1dCJUYNoA3LT
	jTQrnOVkEDMuM5KOaB3V1ZqFVumSS2QwEgi13XRr8CkqSRlyG5DiLqTJ++x2JdFIW6ht
	uGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cvR4QPd5nhMHQYRFIrgeYBG3yo/QJYUrsaLnikyZBwQ=;
	b=oeZPSe+553RKlHQSkPdV/IImzxWWk9gbjVPTRgur7BwJLr9TBXBtL6/zsE2FWquv8t
	6bT+gQpxwESeyF/RXOh/XO1/jQlcR1PnjY7BmlcsLmjsrfOjB/RIXdqpyI91fyBsMFQn
	IXhlr9eKpX6jKDFnzLy9ygqC1EmrwLMtjFvkDh/HVljgbuVF7GpSIdlbT4Ei9iXg+2Gy
	8SxS4A6stkfaC0gL66M3bzS1X5YeUVqOSh2Xj1w3eJGQmnaKh3PJ+W6TupF7scooIWwb
	LVvsO+TU3YQsjLcwyhonL8wSPKKd25hjQAj5fn1pgNm8ltww0mxUIhYwU6uzBPpxyptI
	xH/A==
X-Gm-Message-State: APjAAAX22ET+iLWhzIRnzI1pehTEW2zWijB266QVoci6RH8Qxvd6I+E6
	u18RKiEFBgwuvGNoa7641GHuU5vYUwpENcV1pTQ=
X-Google-Smtp-Source: APXvYqzZ9Tjt0ZGws7vPeFwz/k0J9OTvA0nXr1rjkciUU7X4APLIaLPa4TkhP4g2uTRWhIQwTzUWGMAGNbsVZJnLVeM=
X-Received: by 2002:a5e:9747:: with SMTP id h7mr9321234ioq.299.1565186549060; 
	Wed, 07 Aug 2019 07:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190807051707.8709-1-kai.kang@windriver.com>
In-Reply-To: <20190807051707.8709-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 7 Aug 2019 16:02:17 +0200
Message-ID: <CALbNGRQ-e5SvSJVeet6MsZJ9Ux0K06jrxxH_T=YztAgCqGOUug@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][Patch 0/2] Add recipe of xfce4-datetime-setter
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
X-List-Received-Date: Wed, 07 Aug 2019 14:02:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 7, 2019 at 7:18 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Hi Andreas,
>
> I add recipe of xfce4-datetime-setter which is from your repo from
> github. But I found it requires dbus service org.freedesktop.timedate1
> which is from systemd. So make xfce4-settings requires it only when init manger
> is sytemd. Any comment on that please?
>
> Regards,
> Kai
Hi Kai,

* had short glance on your patches: they look good to me. In the
'old-days' when datetime-setter was part of xfce-settings, there was a
packageconfig for it. That was enabled if systemd was in distro
features - so your suggestion should behave same.
* thanks for taking care for meta-xfce for very long time now
* would anybody complain making you maintainer of meta-xfce?

Regards


Andreas

