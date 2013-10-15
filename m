Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 6C5686CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 11:40:46 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w7so6695634lbi.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Oct 2013 04:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=9zeOnOX16aV35WIXlGTtxEJL8SY5gYpZwhXAqzq7FuE=;
	b=hZaSHH8jpHV15uJGtRGhcKX8mn3QzNXmI2OmqFs/bj6NOQ7UDxHGrv3JpS/+cFGjSn
	vv5eESPM7k0nWGBcipYjLzqFkZY9kBF0+nCIZTnhApNDzGkeZSw8eYaiAQsqz/f85i9s
	bogU+dAZRx9AxvJORuWEH7OvcmUlE0SuhSCEBL2HD9JHP/we/ULBoMEKsM6/6BQfLClo
	cEtIKiBjA5/0fCuSq1S+HGgfsmnl5tp7oA2NUtlg5cwgjIZaNgou1hTHBowCJQ2I8KSz
	SDHyNyldBl/xisPaUjcPsFgRqtxpSpmxOHvadKmJw4xLwCBbNyZOdeiLA/7h03/S75H+
	5URg==
X-Gm-Message-State: ALoCoQm6ofZ7Ze1wxwkXad4jU4NlwbUXATstJwhq5GxitvjTassVJl17vdmn4K+ZJeW53Y+9cqDo
MIME-Version: 1.0
X-Received: by 10.112.51.227 with SMTP id n3mr769731lbo.54.1381837247581; Tue,
	15 Oct 2013 04:40:47 -0700 (PDT)
Received: by 10.112.173.66 with HTTP; Tue, 15 Oct 2013 04:40:47 -0700 (PDT)
In-Reply-To: <7AF48623-2F7B-443F-AC08-4241E115DAA1@dominion.thruhere.net>
References: <1381835734-6969-1-git-send-email-fathi.boudra@linaro.org>
	<7AF48623-2F7B-443F-AC08-4241E115DAA1@dominion.thruhere.net>
Date: Tue, 15 Oct 2013 14:40:47 +0300
Message-ID: <CAGNsrLC48yHc2LBkA2rVVOv6_d-kA-aHreA7phiEp=H+kNpTwA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] libjpeg-turbo: update to 1.3.0 release (svn r988)
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
X-List-Received-Date: Tue, 15 Oct 2013 11:40:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 15 October 2013 14:23, Koen Kooi <koen@dominion.thruhere.net> wrote:
>
> Op 15 okt. 2013, om 13:15 heeft Fathi Boudra <fathi.boudra@linaro.org> het volgende geschreven:
>
>> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
>
> Can you list in the commit message what made the license checksums change?

added in patch v2.

a line has been moved to the top:
+ * This file was part of the Independent JPEG Group's software:

and an explicit modifications line has been added
+ * Modifications:
+ * Copyright (C) 2009-2011, 2013, D. R. Commander.

>> ---
>> meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb | 9 ++++-----
>> 1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> index 4fd258f..f18d37d 100644
>> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
>> @@ -3,12 +3,11 @@ HOMEPAGE = "http://libjpeg-turbo.org/"
>>
>> LICENSE ="BSD-3-Clause"
>> LIC_FILES_CHKSUM = "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe21d \
>> -                    file://jpeglib.h;endline=14;md5=7bb9a39828a1b1e84acd4e8aec1e5532 \
>> -                    file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
>> +                    file://jpeglib.h;endline=14;md5=a08bb0a80f782a9f8da313cc4015ed6f \
>> +                    file://djpeg.c;endline=13;md5=03db065044529233c296324be85530ab \
>> "
>> -PV = "8d+1.2.1"
>> -PR = "r2"
>> -SRCREV = "837"
>> +PV = "8d+1.3.0"
>> +SRCREV = "988"
>> SRC_URI = "svn://libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=https;module=trunk"
>>
>> S = "${WORKDIR}/trunk"
>> --
>> 1.8.1.2
>>
>

