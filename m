Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0CC8873206
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 10:32:58 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b205so149067960wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 02:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jpOpKDRN1Feid6Uino80THi7rT1LR76ltQHHQgOf8vk=;
	b=EvvA+ZnsOqHRJA09ELXRUA/4nJ652S9bm9TelB/oFgP3Jf6X581EF1xraZ8yLW/FSq
	JUk+TPKUF0rezZZaGTUcLLRjFMfz5/7xFAkHKHBsCqdU3F15vg/wtGfc4XE1GMyPECs+
	Ou9+Vo9YldA9CiYXSG6CT2jTb4N/aVaAuiYa25mcKEVwRVsidhvBWmXZrK3cwMKpjU2X
	09RgzHVLkypcwXE7HT5JPdINKAz1CIFwg7fUHMwo255pw6272dF3jPJSkE4wk6gcrnd4
	i3AaCY9fouCHr3mXbW55dX3ttyXoOGZq+xVFBxSqsFo5eYuFIlglFxEHy6RCpkVYiBIf
	Ht1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=jpOpKDRN1Feid6Uino80THi7rT1LR76ltQHHQgOf8vk=;
	b=gaCqHPcIVoY2keAD4xnCBT0d9CmuABTaTC6SAk4KRXuMbGnl/xk7iLA8qffs7BGJkX
	oi/nyqSIB0T//kQyqJrAZuKJWxqGEA5SM8AXx4KxS0nIGw+ZLV0vEllRZycLmtqaF15k
	e3uL9/Nfe8uE7j2u7twgGPRo1g9ruExVKwaNJCpUR0xcjAw4axFKRX9c2nOoZGf6/sUp
	iXuaS/1iCNxGrSxsd0/dcE1rAq9EAXXs6SyoCWyD1KHzmLhvFyEWBBxrFbpOD9CrwVog
	qDbJvOIvLyBeOgWvSWUdrCDLXIrctdDu7t8Dyv8VknCUzKh4hCG9u4mjsNTLD4TraV+K
	rNbg==
X-Gm-Message-State: AG10YORgKILzfzFeg8irqNB8Jn3Fx2JeCPZVEPuVJ8QWrUT83LqS5geXMeNc2Devij4DAIB6xyeh1TcSngMG2w==
MIME-Version: 1.0
X-Received: by 10.28.176.200 with SMTP id z191mr11854317wme.91.1456137178889; 
	Mon, 22 Feb 2016 02:32:58 -0800 (PST)
Received: by 10.194.58.176 with HTTP; Mon, 22 Feb 2016 02:32:58 -0800 (PST)
In-Reply-To: <56CAE338.7040002@mlbassoc.com>
References: <56CAE338.7040002@mlbassoc.com>
Date: Mon, 22 Feb 2016 11:32:58 +0100
Message-ID: <CA+chaQfxh9R_EN8XSsrPGCv4OsQ31jSTV+EYsFHqJ=thipjAKQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser] ARM support in Chromium
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
X-List-Received-Date: Mon, 22 Feb 2016 10:32:59 -0000
Content-Type: text/plain; charset=UTF-8

Yes it can, because cortex-a7 is armv7a.

On Mon, Feb 22, 2016 at 11:30 AM, Gary Thomas <gary@mlbassoc.com> wrote:

> A recent change to the chromium recipe restricts it to only
> armv6 and armv7a.  I've built (and successfully run) previous
> versions of chromium on my LS102x board which is cortexa7hf.
> It's not clear to me what arm revision that works out to be
> (where does one look for this info?) but I'd like to see if
> chromium can still be used on my board?
>
> Thanks for any pointers
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

