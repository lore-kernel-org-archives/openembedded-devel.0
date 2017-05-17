Return-Path: <costamagna.gianfranco@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id 10A2E77E14
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 15:19:18 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id c207so536514ybf.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 08:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Yhvh0XAzE4BqFagRkBlv6U9keMFKtCrL6XDTEAWRY6Y=;
	b=uLJR8isPZiZmWwiD0gtFq8MmOhr8MNe6siCFQaAdFOk8jcwXlLj/j+OwVjFX5KHVBr
	iK3fugJERE/WxjZg1hB5OsXNmM9gH+t7WKeumRjOTV6c99DSRQVLmX/CJLxYuqnVPq6Y
	BGcqpEqqq3v4RK4bBH2eyqzKingwDtRAH6272BnD1COZaOpPbrOkCZigx0TqZZMEQAhW
	ygKVAQWfxDHYbc+s7l1QruDgsfrpH7Vv68Kdjv4Hy6fUCNlsE+ca1YdTB1Rn9FkflGGU
	tPjfMF56S6FMdoJU1GfYawA7M7k07fqrZAydF4LOSHrd6XFTE/3s036rughaFsKNrgBS
	i7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Yhvh0XAzE4BqFagRkBlv6U9keMFKtCrL6XDTEAWRY6Y=;
	b=P12WClUejI1komYrAWdjdyjsnMRMYfyKIg5u8TM/etNcsaheS0tfbmPpCvUvwZ23C5
	aDczF8mKW2WkpcL6wNZSDg6jbdrm+w5Rk7+D9CkMBDdSlCri7QJqB/Ad6xtB5Bjc6+E4
	+PeAw6SqF8EIS+a48htgJm9mnZ9kpL1knNl1+X7dbizhPMK8aSzbm77ULcRuYNRgmysK
	3MpVLJts+V34gW1sVZNrxJLmYuQs1ThJP1d5pMShSLAjJ67kulFX9BZ6b1DMaP7LV4YU
	+R3JpRgLtkh+ONUIP5RPfHcLWK6lXVc+qNvQDfiNZIvRaQJav+rgpUqKK9WuzZ1ztzfv
	tWqg==
X-Gm-Message-State: AODbwcAvDwl/Vn4GH8WsYX6SonUPFwW3XPHwSeBY6nXNa6uycZrWFUwj
	2L+zMlVg24e0NZaV5OGuYSwnROrZC56CX0s=
X-Received: by 10.37.122.199 with SMTP id v190mr3281295ybc.40.1495034359495;
	Wed, 17 May 2017 08:19:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.129.81.199 with HTTP; Wed, 17 May 2017 08:18:59 -0700 (PDT)
In-Reply-To: <20170517085858.GB3086@jama>
References: <1494505694-28118-1-git-send-email-costamagnagianfranco@yahoo.it>
	<20170517085858.GB3086@jama>
From: Gianfranco Costamagna <costamagna.gianfranco@gmail.com>
Date: Wed, 17 May 2017 17:18:59 +0200
Message-ID: <CAATN8PUphvRa8VWz8yAmiysA1aV5dBpMnPgZPSvB9YHVNnjjiA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/3] wxstreams: fix build with gcc-6 (patch from Debian). Remove blacklists for wvstreams and wvdial
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
X-List-Received-Date: Wed, 17 May 2017 15:19:19 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Martin,
(resending with the correct email)


> Was wvdial build tested? wvdial fails to build because it's missing
> pkgconfig
> inherit:
>
> http://errors.yoctoproject.org/Errors/Details/142780/
>

I think I tested it against morty or pyro, not against master, neither
master-next (I should probably need to go back with git history
on the date I committed that to reproduce the success).

I'm pretty sure I did test it, otherwise I wouldn't have sent that email.

Anyhow, I did setup a master-next build and added the missing pkgconfig
inherit.
I'll send the patch in some seconds
(sorry, I'm still a n00b with git send-email, please forgive me if you
receive it twice or badly formatted)

thanks!
>
> .Jansa@gmail.com <Martin.Jansa@gmail.com>
>

