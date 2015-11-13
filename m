Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id AA02F7735D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 17:02:10 +0000 (UTC)
Received: by igvi2 with SMTP id i2so40011747igv.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zHPXkz8c0inpUI//44uPioht0faLaiZnV/wdzEmeKUE=;
	b=B0hsCStQkquy/0LPu/qBTMxzIJjPGSqtw60J1GIyfEDmZ07WuRJLiLQFpX95SAtPyF
	4CtFyj8ZeM/gXyQH1xRp+PxeaqQHxVeXuKFR6UIZja7wRrRcmTr+i8SZq+41NpCNgl+q
	ChQBcZD5fPrnCQv7UXgTmgap7Wx1G/hUGLqORAlMhrFL6tIC0KnCp2QQ23A5jMcXdDcs
	93tF8xHiPf5ETTy84hp4H/sD4zcLv80va47LwN+9bIr2nivKinOFV/fNgW3FWbLrJE5O
	CRcTeiq96Jjhf8CNCJAmuQgarubJx4MwSQxw3HNb7IciqWjb1qigyg8ksVmWARjnvou3
	hJmA==
X-Received: by 10.50.13.72 with SMTP id f8mr4601465igc.38.1447434130652; Fri,
	13 Nov 2015 09:02:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.93.7 with HTTP; Fri, 13 Nov 2015 09:01:50 -0800 (PST)
In-Reply-To: <CABcZAN=+c2SkEiZtVjZ1ZGtp5dXs79xYmRh2f1P50qV0Kzd2cw@mail.gmail.com>
References: <9A2ED550-50FC-4223-B79E-5801010FEF49@gmail.com>
	<CABcZAN=+c2SkEiZtVjZ1ZGtp5dXs79xYmRh2f1P50qV0Kzd2cw@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Fri, 13 Nov 2015 10:01:50 -0700
Message-ID: <CABcZAN=EgNrRxnML=Jb_ipNL-yYiFfwZRQLVaoNT2qBmpHA+rQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 13 Nov 2015 17:02:15 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 13, 2015 at 9:56 AM, Christopher Larson <kergoth@gmail.com>
wrote:

> On Fri, Nov 13, 2015 at 8:53 AM, Jens Rehsack <rehsack@gmail.com> wrote:
>
>> To avoid errors when building dev-images (talloc-dev is missing), and to
>> avoid
>> insane empty packages for that, rename talloc -> libtalloc as libtevent
>> shows.
>>
>> With that, remove dependencies to attr/xattr and libbsd - unless
>> explicitely
>> enabled via PACKAGECONFIG.
>>
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>
>
> Our recipe names should be named based on the upstream project name, not
> the library they happen to ship.
>
> Instead, either we could we should kill all the libtalloc bits in the
> PACKAGES var, and let the debian shlib renaming handle renaming talloc* to
> libtalloc*, or add a talloc-dev that pulls in libtalloc-dev & pytalloc-dev.
>

I just realized this may sound critical, but that wasn't intended. The
other changes look great, thanks for your work on making those dependencies
optional, it's good stuff.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

