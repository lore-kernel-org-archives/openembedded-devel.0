Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id C4A3C6FFEA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 20:41:05 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id e126so33036436ioa.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 12:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=d3tn193CvixxNuk4mYWBHA6qb09bnZVRHxqRRGvM7Oo=;
	b=JBV9YAdiUujDyklMT69mfukIHcTaNHtMZJd0CJJIpO5YJVymg/CG1HTIj4H74czGgS
	0Q4tIb9JyQxk1QvUTtglXmGdBi5nm6xq+DAyjGacBrXyjVSDhTDPKPCyR2FwGHhiobZw
	J6CRfv/DBksactigpF+0VSSEA4KJOHi7GIgT6YwRDPGDcpl17veEkAnOtcAnKMkilthz
	v4OK2C/QU9bbLMaPRKtUWnCyBIsHhbIBG57j/k1Zry9EOlJuXfuQU3pZo2E4s0js1Cxv
	V/zNqolEJeimn5PQUBBDUtOYIHnA7iLCEi/a1T2hAlJhiaec+JQYrzWT9WBrhNCcYjBr
	6sXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=d3tn193CvixxNuk4mYWBHA6qb09bnZVRHxqRRGvM7Oo=;
	b=cjcrQmPxDs+qJekjKmrfLo7HUuH+05cSooBOfEAiF89rKZDdCbK/vb0Ni8WQYTylzq
	u3R4ej0ciwy20SNGKBPDqB6BRxe3GHSGq0tTuYg2zWXkJmeZnA78qS3+qDh62lKOB0Fi
	2xM0Dp9MT7PgxGx6nc6omgaZXWppE9AKxs5yrmI57sGS5DWT1ruEhFzw7tYyXA3n5zrP
	Q2nomIZTGHOecsyFaA47TOD0BrLRMwyRHYgRjrFIrl6VgzGt7U0JeR5ZRnep5+6ZjUp9
	ePBWRtR3uINl5VEUBTYIqX1rxtR5+Y5xaaSaUyteZtEPOzAtmpCn3B3W2TI8eJ4BgxyR
	WFzQ==
X-Received: by 10.107.134.78 with SMTP id i75mr9970904iod.74.1450212065798;
	Tue, 15 Dec 2015 12:41:05 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.69.129 with HTTP; Tue, 15 Dec 2015 12:40:46 -0800 (PST)
In-Reply-To: <20151215194939.GE2556@jama>
References: <cover.1450208019.git.chris_larson@mentor.com>
	<20151215194939.GE2556@jama>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 15 Dec 2015 13:40:46 -0700
X-Google-Sender-Auth: 8HQLhjsN8knAY77MnatlVP7VApA
Message-ID: <CABcZANkY6LRBpB6xRbhknu8+2AbDGTht70f-nXJ8Pe+KyFDWQw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 0/3] Add bits to save/restore URI headrevs
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
X-List-Received-Date: Tue, 15 Dec 2015 20:41:08 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 12:49 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Tue, Dec 15, 2015 at 12:37:44PM -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > This is useful to support BB_NO_NETWORK with AUTOREV, by letting someone
> ship
> > dumped headrevs to the user, who then inherit this class, which ensures
> that
> > the cached headrevs are used, and upstream is not contacted at parse
> time.
> > BB_SRCREV_POLICY will be set to "cache" as well, if it's not already
> set, as
> > otherwise bitbake will contact upstream to update the cached values.
> >
> > This is helpful when shipping downloads to someone when there's a desire
> to
> > support both BB_NO_NETWORK and AUTOREV.
> >
> > The restore_headrevs.bbclass will restore dumped headrevs at config
> parse time
> > (add to INHERIT), and the oe.headrevs python module provides a function
> one
> > can call to dump the headrevs.
>
> Maybe I'm missing something, but what's advantage of shipping something
> with AUTOREV which is then used together with BB_NO_NETWORK?
>

It's quite useful to not have to go through and manually lock down all your
kernels recipes when doing a release. All our releases ship with sources
and are BB_NO_NETWORK-capable, as that's a requirement for a lot of folks.


> We already have some implementation in bitbake which dumps latest
> SRCREVs used by all recipes (including AUTOREV) onces so I would expect
> that the release will ship this .inc files with locked revisions and if
> the user of such release wants to use BB_NO_NETWORK he will also include
> that .inc file with locked revisions.
>
> Is it because it's easier of faster to dump them from the headrefs db
> you already ship with release and you don't want to generate .inc from
> buildhistory?


Actually, this was in my patch queue from before buildhistory existed, and
I somehow managed to forget about buildhistory-collect-srcrevs :) Feel free
to ignore this, in that case.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

