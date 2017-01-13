Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2C20371D9A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 14:25:01 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id 23so3841989vkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jan 2017 06:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=UFGTvGWUwvdOktk9UNGlcihat0XAVQETxrAV6nOrbxY=;
	b=ER/F2kSrhqh/kvO0/VADttGBMg2KmZfuYbsa/fkVUm7oxCB+CFxIsVVp7mPvWdnwS8
	/Cco+Xo7pp3pPIBzPo7HMB6a+lulz4KpCnoCSFRiNTk5sdxkAau1Y7fYQnXKFd8la/S4
	m1T9zfrRx8nbdvfxyovs9fAeFOGsqQlVvbs0NkxCmxRpIXlS+GKDa9aqFJi1qKDrSOXf
	mrRcmmqD3nq3Mr9CpJstik2de0LB+BkaegR9qR8a5OzfXqxMxb6PIXoSU7p/DnvP0x08
	/qBQ0e18Wj1cEj6Sq0K1WlDeBslwe85Ld9C4/p9PV+HUrKQ0B4lg8WZQSMM1fgwOlUrv
	q6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=UFGTvGWUwvdOktk9UNGlcihat0XAVQETxrAV6nOrbxY=;
	b=BINQUnXhAyC2HhF8VhKfvI8jmHifpZmmv/tJCF9goQtGYJlGE44DV7FNEUzT0dwa0S
	Tt+UY12Eilbh7t2nwZ3FioNRcYbgxSLIXpeJTAyqrUY4GdVu9bsZNV7/hjFs9jfkx1Ae
	vz1fQb24frb3kDC8y6aKbPJm3DTErFtsQMkqyuM1prMK0BnAmK9WazBPPzj8G4AxE9G8
	oVv0mp9OXFRonLa4elVqgX3xWG1kuQ1tdWEk8WFTrgsmsZhbn4HL7RpdxwT94mlaadiN
	7bBU7919e2wSW9VQUC7/itVIVVVXJkzTaIT25zeMFAhfCql1t6ANX1dhmhHgMXStKHUB
	slvA==
X-Gm-Message-State: AIkVDXJ7lBFUWWZpHIfWcJajDGeQVx6cw1xrts1epYLbh9Ddi5Nk7+UXkkr3i9pN2ijrrf4e9v+k+jD3tkFwOQ==
X-Received: by 10.31.179.73 with SMTP id c70mr7837805vkf.81.1484317501780;
	Fri, 13 Jan 2017 06:25:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.69.246 with HTTP; Fri, 13 Jan 2017 06:25:01 -0800 (PST)
In-Reply-To: <1484316051-25329-2-git-send-email-yannick.gicquel@iot.bzh>
References: <1484316051-25329-1-git-send-email-yannick.gicquel@iot.bzh>
	<1484316051-25329-2-git-send-email-yannick.gicquel@iot.bzh>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 13 Jan 2017 15:25:01 +0100
Message-ID: <CALbNGRTrEEanfyX5vR6Db+DriN9eUSZndfMQwOARxktjqeJrcg@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] cmake.bbclass: enable usage of ccache
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
X-List-Received-Date: Fri, 13 Jan 2017 14:25:03 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 13, 2017 at 3:00 PM, Yannick Gicquel
<yannick.gicquel@iot.bzh> wrote:
> This allows ccache usage for recipes which inherit cmake.bbclass.
> Since cmake v3.4, it can be enabled using some "-D" options.
>
> Here below are some metrics while using it for webkitgtk recipe.
> (machine is a 4x core i7 @ 3.4GHz)
>
> $ bitbake -c fetchall webkitgtk
> $ time bitbake webkitgtk
> <snip>
> real    56m25.191s
> user    359m32.003s
> sys     34m49.356s
>
> $ bitbake -c clean webkitgtk
> $ bitbake -c cleansstate webkitgtk
> $ time bitbake webkitgtk
> <snip>
> real    25m19.298s
> user    17m57.861s
> sys     6m20.157s
>
Wow your performance results look really impressive. Will give it a
try with all the kde/lxqt and others.

Andreas

