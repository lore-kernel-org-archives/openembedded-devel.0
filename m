Return-Path: <dmitri.vorobiev@movial.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9264374D46
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 14:54:38 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l1-v6so27169403wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2018 07:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=movial-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kbVu7RWJN8VZ+WU6/xBOrVrowQRxb62y0YxNdnmONaE=;
	b=JUfiHBkZAJ+xf8m8CUiIYuXitRkILiWpKkPkSu6fqAImeMztWBxELVi9bELkp3sI3N
	t6/NYIGq47B7fD5RCKJggm9l719IBTb8Py+8qKSZuc2VIEYpRrl8WCVqHUPePiMthFwj
	t5LN7NiUsIhQmOz4V7AmXQ/QTjEY4Rk+2mC0f1kGX5iWV3ouyi4lzP1hBrUxGTHxOM6d
	ScIJMmo4VmuxrZz7baQiqS7eQp/ueNC/fcXcl2auPmrTVxy4L5d8OsE9lSCo7b2tXbUU
	qHEGrvREpg9B/886pSHX7d8yfabSjz8/FRfXgIk7hmz6kck5jO1VB0mLeHRMoWPYARaS
	iEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kbVu7RWJN8VZ+WU6/xBOrVrowQRxb62y0YxNdnmONaE=;
	b=BBCODNPkjWIfm7valMA22W17jvLbHIsqL7wV7Ho8cjWS9saXsFCNG4bIdWgbOM4ob2
	mdTREykHwlkephIVjR6dOoZBzzGf+Hyi4q9c/3v/Cia38B5sQ8FHuNn5pJcizqLDCHXP
	N01DWBgxePdlP8wxlK6HyVjC52vPjECZkA0nfx5laqUMS6cojpxrGLy15I6BaaBwmg9x
	+6FfoaNwGi44rqxbu7Qmmfs6UTmbRUKDx+sqx1332C5YFGTahFTtmQB0VYstDNwC6OUT
	qt7e/cxrZ1zuo1kZuL+B3Noji48bYYR5vwZ210wDjQXoQojrmGShXeFxRu+uM7hTPsZM
	HgHA==
X-Gm-Message-State: ALKqPwfjkSt/gs4qpBPfO61zY3mUuCi15zktYG6pLKIpfFlnpa5NFWRt
	KLOI+7uOTzQw45bldZx9w9K+y6wPQbBmEI1gfZmdIw==
X-Google-Smtp-Source: AB8JxZpCGxVRhNt/ktYEeQHOqjwdYsZKovoYcUyM0ZVtYd62h6L7U/G/O4c25aciC96G0naet4VZFfjY1TQQauGfY00=
X-Received: by 2002:a1c:8045:: with SMTP id
	b66-v6mr10310251wmd.108.1526914479089; 
	Mon, 21 May 2018 07:54:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.147.228 with HTTP; Mon, 21 May 2018 07:53:58 -0700 (PDT)
In-Reply-To: <49c90165-022b-38b9-fec7-79c492777951@gmail.com>
References: <CAE3k13d8N02kfR+VmpXRZPywTdU1Rm6vaRhB-gb29G4Hqbo-kw@mail.gmail.com>
	<49c90165-022b-38b9-fec7-79c492777951@gmail.com>
From: Dmitri Vorobiev <dmitri.vorobiev@movial.com>
Date: Mon, 21 May 2018 17:53:58 +0300
Message-ID: <CAE3k13eTDf0SKc1Usz01_M=K+LG3fd6RxqFUuQpv1QF_7vug5w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Mon, 21 May 2018 14:54:39 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem,

Thanks for the request. Done.

Dmitri

On Fri, May 18, 2018 at 4:17 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Hi Dmitri
>
> Can you rebase this change on top of current master and resend ?
>
> Thanks
> -Khem
>

