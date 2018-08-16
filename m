Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id F07D360236
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 14:24:35 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id z8-v6so4831938qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Aug 2018 07:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RhJ7jqKI5UOATrbgg+Dz8h7+6PHqFQ/QR22cJuJVZug=;
	b=QLA4YXJH0sQvCWcTqpBtcTATxnAFTKXRJTD/PolMUNjvdorS867FnxpWn4yw3xXqYq
	WUYEzuXI2N6xlLxX1z5rRBFzb02e9vvFH8wEcQEiN0ieeS+dl4m03k3rBU1mGy5XwKvx
	dnFHUH1rw3YdOiC/Dfm0IPOGrxMf/7l2N+JMfYVqId9VKqcc7jS81rN1Y4she3ApgOPp
	sKrJy7hk9H9amasj5wIhYwH0K9s+gPRo8zZ52hYstCD3tf6rRGr4BtDsFRcYprGBbufR
	mCO3eNWczoix3NfV7eE73igmdbeN+LZKPpE1O9PwDMWvyd5vDcv9Xxf1XUti1qHj+SNv
	of8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RhJ7jqKI5UOATrbgg+Dz8h7+6PHqFQ/QR22cJuJVZug=;
	b=AHIDrYhBtqSV+X7yesvAMaxM5xGoShzYK+wgfn5/1odDne/sf4RpLMRuE7SUHlxW18
	HXdacY2l+GBiuFB6B0+s7TS0tU/YG6tIiSFsBLuGM4ub85YQ5HHAieU1VYRvR+3Ko0+R
	eZ1pm1R9w8D98wK2Lv/Z7/uvycJIfTl6PnqFlrzJpVn3FR0Ky/w/yXQ8PWMDPHIYCdcL
	/+6VieTdTkMB3PFBapADtq8XQ/htxKobqfo8VXy75gmNOzQnQuQDdcfnbKL4szjr0xU2
	Y5KzXvJOMuAZPC0szdEjektTyl1qV0nbCM0aYXJrG/n0OHngEn+7WvIim1goUtY3oVrx
	B40g==
X-Gm-Message-State: AOUpUlH7Y5LFSDhfN8pQYMEtDVvMdbND5oAbiOTn+bLpyk/XCeKM94+3
	kdrX2DqjfNeKwqwCqWHx6uUJ3x5QASDsk8XonuA=
X-Google-Smtp-Source: AA+uWPxJN3vU+UU5i1sWsHsWsy80mQVIdcRLH75AcQc2oYjOv5OhcUgO49BWiPvCcW/6rCPTghX/31q2LasdAKIrLJE=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr30181699qta.117.1534429476700; 
	Thu, 16 Aug 2018 07:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAGCTLNRr7118-2whFfsWw-KbaT23bCKmp4J-HmyBZMFWw750Bw@mail.gmail.com>
In-Reply-To: <CAGCTLNRr7118-2whFfsWw-KbaT23bCKmp4J-HmyBZMFWw750Bw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Aug 2018 07:24:10 -0700
Message-ID: <CAMKF1sr2se=QBu8UjieWGXUPT=Jyj3PesogniqK-F6BnzsrWZA@mail.gmail.com>
To: Mohamed Dawod <mhm.dawod@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [qt5]: qt5 support
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
X-List-Received-Date: Thu, 16 Aug 2018 14:24:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 16, 2018 at 6:26 AM Mohamed Dawod <mhm.dawod@gmail.com> wrote:
>
> can i run qt5 apps on image that support wayland weston without x11 ?
> and how ?
>

add qtwayland to IMAGE_INSTALL and use '-platform wayland'

>
> --
>
> Mohamed Dawod
> Computer Engineering Department
> Faculty of Engineering
> Cairo University
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

