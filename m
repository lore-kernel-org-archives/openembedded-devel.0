Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
	[209.85.160.178])
	by mail.openembedded.org (Postfix) with ESMTP id 7F571605C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Dec 2018 00:57:43 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id t13so393328qtn.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Dec 2018 16:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qk5iqFW8RupNvAsKAz0ayhkCfFrpkbnQI/radAQGaCQ=;
	b=TCx+zT1WkLANWhdZmLl2BnMXfLkRUZzR9DTdumEgEP6mcV07kEHEw6ScN6A28/NnTO
	zxr2XUGPWk2vK8UwGD/akJK9GAof8sGfBQ4wAbq6aKg5S+whRMx94Tcbjjn6U5Tv1YCX
	ehn1dCtP6Q7QBz46VMFIPzdQNxcfo3iRzCTCalwbKu0ckAn3UaS5nnKc19HRCHLzNPnV
	8Ma6b/yeKbUu8KUKPKMtbjEFQd7txjQcHIIxbWn199KUUok+VWO7SoVahjdlWskYDZkI
	m1I/zrPyszE0vncodzKGpZ/zVEOUxUSJxnxEZSmYXkd5DsGMT8W0KEw10J7j0BnYxhCG
	fW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qk5iqFW8RupNvAsKAz0ayhkCfFrpkbnQI/radAQGaCQ=;
	b=i4wvE4YTPXmq/AmyZD35X3SysalDNY5Bezk5AG/TRkbFXYIaA3uqZs9IOaCldYpbo+
	fWypAPhkRkfD19JDQ+wuVToRcNEYZopr+Vu+KQO1E7RTLRn67330WJCle45FXTH6wono
	SgaSQc+OJqb+TddzL+xCfaBfekJo20B8mBd+SMIAW+d3OpIDUaJzPEocx4EGTMnyw64g
	ehmaxfV6I6d4iThnFazNFOXvhIqYEuxDAgtFU0C7YayuceMJLsu+2vCHvWr1/+doKmU2
	UJFTag5lvIVmI6r4XqteCaw/NiV1ahXK7V/Yqgu5fK9qb3uE+xsiD9RNRqKSF4bnyf7Q
	d+aQ==
X-Gm-Message-State: AA+aEWa6UjMVwK3SJju9kscL/E/fA4CEu+qhh/BkbiK8QZRA51cW9Vf3
	8EA0pAjKVx6JKZQV8ipBk+pezpZznhaouLQbJyQ=
X-Google-Smtp-Source: AFSGD/U2SnJBkF5/8xP9KVQXfRyQp47oZSQQIgtcX5BmeDU2P58pdyV9QsTywbY0gIGd+4quqlJoY3xzKhZXrFgs4Dg=
X-Received: by 2002:ac8:36ba:: with SMTP id a55mr21740431qtc.236.1544662663979;
	Wed, 12 Dec 2018 16:57:43 -0800 (PST)
MIME-Version: 1.0
References: <3045fc0b-288e-322f-e4eb-d6ff637abf2f@linuxfoundation.org>
	<CAMKF1sqqSqzXoEYO==L6t_3t6BEHFsUC75Tv9H-2pHdmv-7mtg@mail.gmail.com>
	<2d3cdfda-317a-1f8f-3018-411dc7acd7d5@linuxfoundation.org>
	<CAMKF1spLVorCU+gv3ikyVTJcUrFUF=64Rs1RpSFZpyA-vy9XuA@mail.gmail.com>
	<be4e03f6-90c2-85c2-53d2-cdf573185e6d@balister.org>
In-Reply-To: <be4e03f6-90c2-85c2-53d2-cdf573185e6d@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Dec 2018 16:57:17 -0800
Message-ID: <CAMKF1sr4Sj9BbdajfztNZovjVe3mytK_Vzk7D_J6f74sDa=Amg@mail.gmail.com>
To: Philip Balister <philip@balister.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Shall we remove bad-checksum files on http://sources.openembedded.org/?
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
X-List-Received-Date: Thu, 13 Dec 2018 00:57:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Dec 12, 2018 at 3:40 PM Philip Balister <philip@balister.org> wrote:
>
> Can you look at what files get downloaded? mirrors exists to provide a
> place to download files that have disappeared from their original
> locations. People maintaining old systems should have saved local
> copies, but if not they depend on our source mirrors for GPL compliance
> exercises.
>
> It would be useful to know what "old"files are being downloaded to give
> us an idea how many people are using older "versions" of OpenEmbedded.
>

what purpose would it serve ?

> Philip
>
> On 12/12/2018 05:07 PM, Khem Raj wrote:
> > Not that I can think of.
> > On Wed, Dec 12, 2018 at 1:18 PM Michael Halstead
> > <mhalstead@linuxfoundation.org> wrote:
> >>
> >> I've removed all of those files and prevented them from being mirrored in the future.
> >>
> >> Are there any other files we should remove?
> >>
> >> On 12/12/18 10:48 AM, Khem Raj wrote:
> >>
> >> Yes they serve no purpose deleting them is in order
> >>
> >> I should also check the Jenkins job to ignore them
> >>
> >> On Wed, Dec 12, 2018 at 10:32 AM Michael Halstead <mhalstead@linuxfoundation.org> wrote:
> >>>
> >>> With the current setup files will accumulate on
> >>> http://sources.openembedded.org/ over time and none will be removed. Are
> >>> there any patterns that should be removed over time? *bad-checksum*
> >>> files seem like an obvious choice. Please share concerns or suggust
> >>> other patterns to remove.
> >>>
> >>> Thank you,
> >>>
> >>> --
> >>> Michael Halstead
> >>> Linux Foundation / SysAdmin
> >>>
> >> --
> >> Michael Halstead
> >> Linux Foundation / SysAdmin

