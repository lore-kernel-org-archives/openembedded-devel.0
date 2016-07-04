Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id ECB4F6013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:55:13 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f126so90977810wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jul 2016 23:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=G4qETpijcX7CW1N8s3XWT5QwHtUukjWEGXEzz6bo01g=;
	b=F+R5ZxiSE/+4MJsjqydRPbLTip74wdSy64p8bAB9g8EmDVjXV8g60A2Z70l7/swpYO
	BLpKyTcvNpgFb4ON1v/OU5IqqNrIv7S/GnMm7ADJGuwirB6qWzZSkZ0xajBdJeEyC9/Y
	ZhqJjG6MgrWTa0IKm1idtZu2H908tCBiiIoFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=G4qETpijcX7CW1N8s3XWT5QwHtUukjWEGXEzz6bo01g=;
	b=Eva3HECQHaoqsFCfWZiu/xS3eWc3eJOjMDbPaZ9beuOQ+ZHqcqZhNyF6+28vRKEncR
	rn5iujBJEpMoNCzYCCdi7fFu+AqDNHYP1iW3uWQ0yFEqJ270NmAYKTrYkQqU1W+xCedH
	D+0mYadIfiddxk+GYz7Vx3XYqfIIc/wltGaOtLc3wPFSXV9hKAHPG+SqaoIxu2A8DQEL
	ubuCoRApvEJdIWvswcmwXFLEWlsWl3YCqT9FYYoeBDDKxkagA2I6EjOziI69gTCTgQNW
	fKWjz9CS704wapU19dkm6j0511+gXvLoAQxbnne4xOq8XvXkgMhdOHEieGuAqdldgCpy
	8vrA==
X-Gm-Message-State: ALyK8tKZYdqtxCCLYmr8H6655K8yfJvQjrYD5aNN5fPMUk+LHHIX1iZwLIyRNRjG96ff/YcS/vcT+VL1ErgyFKr8
X-Received: by 10.194.85.34 with SMTP id e2mr7565523wjz.153.1467615313363;
	Sun, 03 Jul 2016 23:55:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.163.225 with HTTP; Sun, 3 Jul 2016 23:54:53 -0700 (PDT)
In-Reply-To: <CAMKF1srWbfeeihoVr_8M55Y_NfiPvAw==PHZ14jAjNQnniwgiA@mail.gmail.com>
References: <20160701051457.20909-1-raj.khem@gmail.com>
	<CAGNsrLAET5WkH9MkfqqTAE+=x0kRgNt1QBXimzeUywag_MTQMw@mail.gmail.com>
	<CAMKF1srWbfeeihoVr_8M55Y_NfiPvAw==PHZ14jAjNQnniwgiA@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 4 Jul 2016 08:54:53 +0200
Message-ID: <CAP71Wjw_aSj4Daa=hqSFq9msScNeuSKJYJXUgAjLN8tA5S_0iA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] android-tools: Fix, enhance and move from meta-shr
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
X-List-Received-Date: Mon, 04 Jul 2016 06:55:14 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jul 2, 2016 at 7:15 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Obviously, it doesn't prevent to get current recipe moved to meta-oe.
>> It's just a heads up :)
>
> Thanks for.update. I think this really should go into oe core. Since sparse
> file system is across many devices

+1. for sure.. that would be very nice.

