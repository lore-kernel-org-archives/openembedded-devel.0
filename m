Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3F29577346
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 16:56:47 +0000 (UTC)
Received: by ioir85 with SMTP id r85so62506294ioi.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 08:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ne8eLP+jaUdBihS95V43WB4T2Wdy6tQCjOMOlPvwcs8=;
	b=nJqBe/iOBj+q+pTnZcB/j+vzup8iej3l5gEkajSWEfXxXeyuXwkwwEzPLEhsqxg98h
	ZuO92fT/Ox3LnozLeOfJ+odIp/2glLZUlQh47rn0df834UFPBkm0CCH7xrjXtFBezny0
	Do+QxXDW3afMHlgUBBbgtylnHy773izLcweHkm5MIw/SZF/g8/f9kHFG98JS2AVoDs3V
	i7UXo83oylsaRnPp1Wnpx2aK6smR37+SgX6NuKSDbeeqI5VjOzh+4BiwHpA/g/A1MEs/
	eLwwyEZMSGoy8g0wGv34hzmQUM4gDI7426xscmP/yW8C356UJvQAnKqFA0wDE32Sh9tu
	zF8Q==
X-Received: by 10.107.134.28 with SMTP id i28mr20830974iod.74.1447433808211;
	Fri, 13 Nov 2015 08:56:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.93.7 with HTTP; Fri, 13 Nov 2015 08:56:28 -0800 (PST)
In-Reply-To: <9A2ED550-50FC-4223-B79E-5801010FEF49@gmail.com>
References: <9A2ED550-50FC-4223-B79E-5801010FEF49@gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 13 Nov 2015 09:56:28 -0700
Message-ID: <CABcZAN=+c2SkEiZtVjZ1ZGtp5dXs79xYmRh2f1P50qV0Kzd2cw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] talloc: rename to libtalloc and cleanup dependency mess
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
X-List-Received-Date: Fri, 13 Nov 2015 16:56:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 8:53 AM, Jens Rehsack <rehsack@gmail.com> wrote:

> To avoid errors when building dev-images (talloc-dev is missing), and to
> avoid
> insane empty packages for that, rename talloc -> libtalloc as libtevent
> shows.
>
> With that, remove dependencies to attr/xattr and libbsd - unless
> explicitely
> enabled via PACKAGECONFIG.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>

Our recipe names should be named based on the upstream project name, not
the library they happen to ship.

Instead, either we could we should kill all the libtalloc bits in the
PACKAGES var, and let the debian shlib renaming handle renaming talloc* to
libtalloc*, or add a talloc-dev that pulls in libtalloc-dev & pytalloc-dev.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

