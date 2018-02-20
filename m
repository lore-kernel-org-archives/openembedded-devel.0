Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f47.google.com (mail-pg0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id F115D786B9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 18:49:06 +0000 (UTC)
Received: by mail-pg0-f47.google.com with SMTP id m19so7462711pgn.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 10:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=ws30rDriBsIuBakUY/1z1aBV53EpS5TsRaqbFNO95ts=;
	b=OuWzGm/jr5Q++xOo1B1DqtO0dnbvc9SviDlZeCOOSdAk2SlyuN9BRa4MVoh8F5noP3
	/6fYJ+0lYNzER5yiQU6HXUkg0BKpMZS87lFcNGTWIDiTh5LJKPDRAaA12HqmXadzve/t
	LeXbaYDhDxgxfcNrzWin84w/72cjmrsTh886koEe7l61bIBEWyuX4+nI6nt/XBr95IAy
	TbOh4vi1Gef7KoPKjXOWAV6UT2/yUzx1arkmAqAXuE4k59aEh2EXJ6XawFE2wzbNvtiW
	ZrCVTiyphPDF/ruuGcx3cFPYe6LqM0aVwcq6Mpg5Lv4U7uNNKktxuW1LbpwPvoT9JIJ6
	4irA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ws30rDriBsIuBakUY/1z1aBV53EpS5TsRaqbFNO95ts=;
	b=MI52ax9Ar3NNBp1AdadmORPbAwhpYyyiIWrNUm1pFebiV8v8DrGUJHgLnAYKVs4KSY
	2SIPT3+ZtZhk5xeta31mm3rZqMm1NaLrVSUSabhXGHH/T5aQp8yXkxyXGj7RQn6D6CCv
	YiEk3cjRIwrzxURKOW/Ch28B56GdBsbcWbHh85bKbgih8ICv2vSkDqNwYeATihzSY3hp
	Z6mJZVG+lZNdLquJ7dj9cm0gte3McW05Vva5Uz++SqBfxqQUyubZWvWVnFFYI4TuAARV
	DBSgSqHfJUwTSW97pMRF6j7WY7ibHQu/IfL5vavi/a4anTEiKikrMYvjIMwbBwGNCdIL
	7f0w==
X-Gm-Message-State: APf1xPA8LV35JJVsG/HmjM0YGTDAqhZvWncWptNdjKao4IrpI+7DRDmc
	wbFn0xdlaAyQEMRWzKjWSAqO87Vi
X-Google-Smtp-Source: AH8x225INWAdV1nYgmgjhror7YQPxaolNOFtFVr0ZCKI7KoUAhZjtJz0GfFsgKXIdbI97k99RcPV2g==
X-Received: by 10.101.88.138 with SMTP id d10mr488734pgu.52.1519152547791;
	Tue, 20 Feb 2018 10:49:07 -0800 (PST)
Received: from ?IPv6:2601:646:8880:466c:1018:c2d5:2fd:6d43?
	([2601:646:8880:466c:1018:c2d5:2fd:6d43])
	by smtp.gmail.com with ESMTPSA id
	z25sm61177955pfe.0.2018.02.20.10.49.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Feb 2018 10:49:07 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <68430da0-1d98-abdd-ede3-48f85135dffb@gmail.com>
Date: Tue, 20 Feb 2018 10:49:05 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Tue, 20 Feb 2018 18:49:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/20/18 2:45 AM, Burton, Ross wrote:
> Hi,
> 
> Is now a good time to talk about splitting up meta-oe?  Some layers are
> actively developed and maintained (one example: meta-python), others are
> basically bitrotting and only get touched when something else causes them
> to break world builds (one example: meta-gnome).  I've long felt that
> meta-oe should be split up and the high quality layers managed in their own
> repositories so patches to them don't get held up by breakage in other
> sub-layers.

lets improve them and add them to YP, you might mask the ones you don't
like, feed the results back to community and lets see what then
maintainers think about split etc. IMO split is least of issues. patches
get held up for oe-core too because they break meta-gpl2 :) its just
nature of stuff.

split should not be take out these layers because some folks are now
interested in them and leave others, because that will create another
meta-oe in few years. If split has to happen it has to happen by
completely retiring meta-openembedded.


> 
> Another advantage of splitting out the high quality layers is that we'd
> like to look at running more community layers through the Yocto
> autobuilder, and granular layers make that easier to manage.

why do we have to split layers for them to be usable with YP
autobuilder, I fail to understand.

> 
> Comments?
> 
> Ross
> 


