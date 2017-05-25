Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com
	[209.85.213.49])
	by mail.openembedded.org (Postfix) with ESMTP id C026278211
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 23:46:44 +0000 (UTC)
Received: by mail-vk0-f49.google.com with SMTP id y190so99818433vkc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 16:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mA/jB6UiKXSW+ZnFAtVseQ9MxlLp2dZfdp1lln+Z65E=;
	b=vGL/kcvF0/M2SGisMeR/szgGIcNplP65ki53EaGKw8pIGDUsLPSs9qNecdWMLjxktO
	smhdH+QhHqqUz/bNJjXBwnFmxsjtcu3LUg76798t6a/Y1kdm47ZCmVowaucdFhwgW4fx
	eCrdkG3dlM37jHsHhW9sbVTTN7xec7s6N9Fdjmo65knykam2rbEPmwUMAZdpnceXt27l
	JELK9FmLu3QfVn8un2/Q4NtJt1KpifV1+cK3vLj4kT4+kApj2LqCnvslisxTdEhorT28
	+B4M/CwaqikU49wylODfH1pOzurbBSqN2kv+3K43jaEA2prltiOUPcIY37ThwSIdqxic
	TduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mA/jB6UiKXSW+ZnFAtVseQ9MxlLp2dZfdp1lln+Z65E=;
	b=rm3ye3zSem72TIPwVflfUdc+TBc9/KZ2+wIlnXnQF5DiRTjNAHYa6RvY2n4A1Q0TnZ
	rYb3c3hs50Wmwb0y8yrHVM9FEVGebzTQQ6GfTb0eQAqnM0rKHQQLBgc2LGHWffFN2xxG
	dqqwZV2ONFxBD/NsbBnHG5bEJOOhC5ycJuOddhPaNh4ICtVtU1Ijgq6qTOGz2dH6tYxZ
	3Sqj1DqByCPJ9q/X7l4FO2u+o/WGGALMpCBJ8ULWW9lXiDwtDktEaYmdyH5N6oZwVPIm
	nqQJ2dVHrv80LVPhySATUUh5x2nL/8qTedATms517CzgHp8l98rnR5waFxiz/7pX13qj
	NWEw==
X-Gm-Message-State: AODbwcBpqk8OXvqUoVyqzKvQzs5UDSqgXLpQSs+vVYUvr0dN+6Wi61hD
	vS2V1fDf5Ol/Xq6jlu595/FvLLs7uA==
X-Received: by 10.31.89.68 with SMTP id n65mr15764030vkb.71.1495756005592;
	Thu, 25 May 2017 16:46:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Thu, 25 May 2017 16:46:45 -0700 (PDT)
In-Reply-To: <CAAfyv34V=J2dHaF35QUFASGP=-QWS8V8zj_Oe4cv7CKWpx6SZw@mail.gmail.com>
References: <alpine.LFD.2.20.1705250847490.19265@localhost.localdomain>
	<CAAfyv3517VgOHsPWRRHs2vdTr3hBt-dp+u=UGmwHZ+jdNh3sMw@mail.gmail.com>
	<alpine.LFD.2.20.1705251637150.5533@localhost.localdomain>
	<CAAfyv34V=J2dHaF35QUFASGP=-QWS8V8zj_Oe4cv7CKWpx6SZw@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Thu, 25 May 2017 19:46:45 -0400
Message-ID: <CAHUNapTdb6oKtL9fd6CVXzSR5egPHWax7r9ZLc3o1UbmGh-xWw@mail.gmail.com>
To: Belisko Marek <marek.belisko@gmail.com>
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: is there a reason meta-openembedded/meta contains a lonely libgpiod.bb recipe?
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
X-List-Received-Date: Thu, 25 May 2017 23:46:45 -0000
Content-Type: text/plain; charset="UTF-8"

>>> On Thu, May 25, 2017 at 9:10 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>> >   is there some rationale for libgpiod.bb to be the lone recipe
>>> > under meta-openembedded/meta? would that recipe not fit into some
>>> > other layer?

meta/meta/meta/meta/meta/meta/meta/meta...

someday that word is going to stop meaning anything ;-)

