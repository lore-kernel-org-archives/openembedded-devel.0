Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by mail.openembedded.org (Postfix) with ESMTP id 08697786C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 22:46:57 +0000 (UTC)
Received: by mail-yb0-f196.google.com with SMTP id s1so4751681ybm.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 14:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PGkSiNtBVO/wUjDbXmofnIPGDI9ZRQ9sLsZYgT/aLeA=;
	b=IrQxkZWE1tJGFq1yITOHhJBAyn6xWkqsAWoxu70o+o3p1y1xQY51FOTcwMj+nIuPwr
	ryOviVrnJ7PPO5ge72MSUisL8g57hQEcx01uommtk+V0c93eE1NcXSMBdZUqCyehC99y
	G8gGQIerKPs3dz1u21cnNX89iBgZUVeqjBV73vBrIeBZRy1IcPrX96/nBsDKqAyrbWTV
	j/IhW8BATK5PaLs7MwlA0ocltYZixBe3T6CPQ+dvcn7bVgDhO8a+JB4KCWKzXcLKwJNi
	18EGVHOYS6JXQRDc2Kex5uQmiS78Vv7K2+3wq+8NCv/Cw1cg+M+fZSbv8kFVsSJwKWzs
	qmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PGkSiNtBVO/wUjDbXmofnIPGDI9ZRQ9sLsZYgT/aLeA=;
	b=D8jbEbpK8lpF5u+kCbjr6OmXhQrFN932HT0WrCbqgyss7snivYXW8dYE4qhzuRb+xz
	fSqD2oci131lYBLI9Q4mLsyKn90K9zAAB+FhpMxsJ6JT6HjONF1kEv0V7qnb3YadUVYA
	+crieMYfjTU+joDSuwqGqFN3uoXyQocsyfQIH5yPd0SfkJYirbivEWmrt5pHx3hFrGhB
	lMhOLiDXOiMqgPtpmdwr00kjqs23WbPtqh0L8cExAxfMLKIZTuYrqWI+qcscSyHJay80
	wTdJFgP6G7QGeEgMNOawZmgnQbPJxZT+cC4FCxR5jBf+cH0VcCc3qyFbvGoUarXWXQZz
	MkWQ==
X-Gm-Message-State: AKGB3mIBaDN5ZIUtVFwp/n9j2lYd6ulWEZeXsnHfaveYYTPEIYOMUZX4
	r0JggpUYhejak4R1TZB/OeyKhm8ZaPSQYf32Aic=
X-Google-Smtp-Source: ACJfBoukTgk3SKth6N3oRj97vfTzhaXYhMyVYRVC+QQH5hN8RT/PZDF8vqzvMxsFuYA1RBsT1BinZD/bCL5DXcxlIZI=
X-Received: by 10.129.85.132 with SMTP id j126mr5385060ywb.295.1513291618628; 
	Thu, 14 Dec 2017 14:46:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.37.97.6 with HTTP; Thu, 14 Dec 2017 14:46:57 -0800 (PST)
In-Reply-To: <CAMKF1so8LTwxZsGT1xXXX0eo=KCJwg4G3u4wYiR1VDkWef1VtQ@mail.gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
	<20171214100929.11094-2-schnitzeltony@gmail.com>
	<CAMKF1so8LTwxZsGT1xXXX0eo=KCJwg4G3u4wYiR1VDkWef1VtQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 14 Dec 2017 23:46:57 +0100
Message-ID: <CALbNGRRefZ4qPeE8NiEztCgzM6RMJHWw+7BDyNfm+neRhffVNw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/5] fltk: add -fPIC to compile flags
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
X-List-Received-Date: Thu, 14 Dec 2017 22:46:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 14, 2017 at 6:30 PM, Khem Raj <raj.khem@gmail.com> wrote:

> I will test it out with PIE but
> I wonder if it will be better to add this to the Makefiles.
>
I've looked into this further and think fltk needs more love:

* native recipe makes fltk-config reachable - not the best idea. I
introduced native recipe but was looking for fluid only.
* all shared libraries are named like libfltk*_SHARED.so*. I think this is
the reason yoshimi links against static library because it cannot find
shared ones.

Long story short: What do you mean by 'PIE'? I would like to test that
either before sending out another rework of fltk.

Andreas

