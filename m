Return-Path: <athoik@gmail.com>
Received: from mail-yw0-f178.google.com (mail-yw0-f178.google.com
	[209.85.161.178])
	by mail.openembedded.org (Postfix) with ESMTP id A20966093C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 19:55:44 +0000 (UTC)
Received: by mail-yw0-f178.google.com with SMTP id r85so23997042ywg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jzwgu3qxSgE9TiRNHF3naYD1wmr5DDSFZwbLatfcrSU=;
	b=ltnDYWsfi0qoSCnsOT37gp3Ws/WhD9PxtcDwm+4HUGy/a1nnLkNxiAj7wYceUV6t75
	o+jzadl3jFEoA0SnH9xzurAFBCY5DwdqsrpNiehhXPupan5u7tZ+CAgXXPianRXDOWAI
	rAsKkfGiaEbcLEYqaLMfRsaydE61LnPI85ShdBn4y/6OG7t5vQ5z3yOg/ZHOtoFnnSw7
	iLWSzfkyYW3iDm4VPAZfcCMGv++lcDO80pD3Khe/6oKx4O/yrvRKn7iq4wyyp7JW48jX
	dPeqqhs6QxVXrVjyrVDawX7pf2M7O4j2Cspgy7pmJeRQ1sUcP7WCin6L35EAO85yMbVT
	W2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jzwgu3qxSgE9TiRNHF3naYD1wmr5DDSFZwbLatfcrSU=;
	b=o8cFdnXtoPK7QVDObWNIu6otx9c4WrT+VyY9ftvPOTX/7+JoGEyeRdgu2IGe4Yz5LE
	w8EK0Gk3AEE75CMib1qtt0atEoK8YsBDzhDW0zRO+D6lQLFO40U7R1aG4qSPF9sGJ9Oz
	jV9cY6Yp1S57Hv+yXM/R+8KYZOHhiCXV3KMrAwrfmZugn+rK6u2Pdo86zdSzFn6TvQkB
	MBCLc99qNV/RfnsXPOr0xbT/NnLH9xh+g6IVu9wbUUPKXDRY2gwiqrUxMQya5rr2zyYi
	LbuV/6MFtD46IHSoL/daARFvhxe4900O+FqbmqDjttOMjLRpN9y5s+ddBNObUQpYesTU
	UTLg==
X-Gm-Message-State: AHPjjUiRGfIvKWItdCdWRAzelqLriKZsEmzphLWVmTVOtvG+SWQilUxd
	7Bk1WKrXK38YtfEgIQdNeoOFF9qpyA==
X-Google-Smtp-Source: ADKCNb4AUIdpcaIk1ztRNjZPB5CB6toonpLuT9pQoK9yazR0a/wgsizQm1BBcNF3uE66rsVOVchsr5Uw9WlT5gsDBSg=
X-Received: by 10.13.221.197 with SMTP id g188mr10190449ywe.99.1505158309760; 
	Mon, 11 Sep 2017 12:31:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.190.82 with HTTP; Mon, 11 Sep 2017 12:31:49 -0700 (PDT)
In-Reply-To: <CA+chaQebLEPnMQk+P2XdVGH-FPB0FA41N8Cic5ovJifUvbdkgA@mail.gmail.com>
References: <1504993112-9111-1-git-send-email-athoik@gmail.com>
	<CA+chaQebLEPnMQk+P2XdVGH-FPB0FA41N8Cic5ovJifUvbdkgA@mail.gmail.com>
From: =?UTF-8?B?zpHOuM6xzr3OrM+DzrnOv8+CIM6fzrnOus6/zr3PjM68zr/PhQ==?=
	<athoik@gmail.com>
Date: Mon, 11 Sep 2017 22:31:49 +0300
Message-ID: <CANDbA3c8tGiOK-AUSNhe3rqZ=sCRn3=2NTdGF8o5y79d_aG7aA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] v4l-utils: added missing dependency on udev
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
X-List-Received-Date: Mon, 11 Sep 2017 19:55:44 -0000
Content-Type: text/plain; charset="UTF-8"

2017-09-11 16:17 GMT+03:00 Martin Jansa <martin.jansa@gmail.com>:
> This causes build failure (at least with gold enabled):
>
> ../../lib/libdvbv5/.libs/libdvbv5.so: error: undefined reference to
> 'pthread_cancel'
> ../../lib/libdvbv5/.libs/libdvbv5.so: error: undefined reference to
> 'pthread_create'

Most probably something unexpected with pthread and gold. I guess
adding -lpthread should fix that.

In order to test with gold enable just adding ld-is-gold to
DISTRO_FEATURES is enough?

Thanks,
Athanasios

