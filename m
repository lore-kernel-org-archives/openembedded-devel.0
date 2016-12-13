Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wj0-f195.google.com (mail-wj0-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id A968E71E43
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:30:25 +0000 (UTC)
Received: by mail-wj0-f195.google.com with SMTP id xy5so18600578wjc.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DHKUzuh95nNo32gNAR+m97h8aIFPg+ZuzIpVeQFn3t8=;
	b=uTmN8JpbwO5QpUCQU4cthqij2ak3Xo7L/mCaOJI78HbmMA6IXQfCqzSe3JFglFB+Qs
	+9ATPxwPr9ioC13/61xY45ui+szBI2ARlLGhVJTYAINQWcfAkwszrgDDOaytp/g5Vslj
	TzYOjogdfzG+tOgpO7GEEdLGXqG8Wpc5PCyvh5hLZcZPzP79KyITNW+sFmcWD1CXnkeA
	SEqqPg74bDJ/G0wNsXPHqD9WHdBwwnvq8vBMQdTP/9zkJ77WR0HQ8qWVTUy9SyJIMRU6
	hno90D7yNGJLr7X1Qd9xuUw3/qiIAOVIMQX92MgfOBKEEGKZl9pcpD4q5YYfgO+xi5Nu
	t1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DHKUzuh95nNo32gNAR+m97h8aIFPg+ZuzIpVeQFn3t8=;
	b=c+L/otOtWWYuZ9Gs9qayGkD4fXu0UgntXYZD/SEwj4OQ5c8Vqrt/sowqIl018jjP95
	EfKqGpwaml/ZRYc6IPozdkcIEbyI2ghzwsIzOjbFKlP5mod2EWUcZ+Uyrp047K3BOCVg
	goBBXobJrhXuk6oGW7TSCZW0a1ubVQZ1lUou4o68ffqboB5wbV3LsWEzbH7jXMOjc9EF
	w8jy8kEwWio8P9vcaPiwcAKEJbXZsogWfUYFbfUNi6R3VZFG23PzOOHxtNS2xBH2P8Xl
	TfWUmMrjbeiEs8sIZ0aMt8LaoRQRYkVd30qT/SNCrzkFK6ZcpFpZLtfXOcnL/lpZCS0F
	DJ5g==
X-Gm-Message-State: AKaTC033tdWlw9R4wESIa/QI81DQHr2uEHuJkbx51ix6W9T+nUg3LC8g4gVZ5d+jk+/pn16OiDm8tNtSSkofIw==
X-Received: by 10.194.0.167 with SMTP id 7mr82379015wjf.80.1481664626185; Tue,
	13 Dec 2016 13:30:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.69.70 with HTTP; Tue, 13 Dec 2016 13:30:05 -0800 (PST)
In-Reply-To: <CAMKF1soyeu_47SQ3GyjOCOEiuOX=NxzahEAd+d2GOwdaiUj0Wg@mail.gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
	<20161213210404.6940-7-ricardo.ribalda@gmail.com>
	<CAMKF1soyeu_47SQ3GyjOCOEiuOX=NxzahEAd+d2GOwdaiUj0Wg@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 13 Dec 2016 22:30:05 +0100
Message-ID: <CAPybu_3fk_MvXWQ-++XruYCqwHAsC5r-GMv0Hbx+O9jaj5UqHg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 7/8] opencv: Add new PACKAGECONFIG lapack
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
X-List-Received-Date: Tue, 13 Dec 2016 21:30:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem



On Tue, Dec 13, 2016 at 10:25 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> not that this problem does not exist right now but this is a dangling dependency
> what happens if I  dont have lapack in PACKAGECONFIG but lapack
> package is staged
> already may be via other deps
>

What is the proper way to to it? Add it as an RDEPENDS?

Sees a bit too much to require lapack for every build if it is only
used by an optional package.

Thanks!

