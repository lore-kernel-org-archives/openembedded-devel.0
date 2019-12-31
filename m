Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 00E4A7FA20
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Dec 2019 07:38:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47n5lM6pFqzRj;
	Tue, 31 Dec 2019 08:38:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1577777936;
	bh=uMwhP6yXFA5m1eYIaBeoHA4TEb/4QdlmI9AzgEzXxyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZLqPy+u7qclRJrmXbSlTKmWaoaUYMP8Uk/5QbmqRapEkbRVDlBEzIb91sJPlQfMe/
	3kf6VxtA69CEx3IOkvnCDKLcE0Uh90UxopE64+/rIFHE5Irl4VEOo7EVdx+0w2Ma/6
	PpbGDzEItQ/8AG8LneEmOMB/kwKrXYT1XMr6RitmHr/LgZWxY4n/LJDbn4XRjeEb4t
	q4YfFqv+eWoRLwcrDcAt7h8A+02PuaRYrMg2ek3wZPMIoEz74XeYQJnx4PLdFSw/8d
	MPzQDYzELVX90VKV2QutXDANq84cbqYIlirdpy0etBF+DpE/zcIWGT8PubUQqC4kV6
	483gTVDouDCjPNRY+zs2n5AoCYJZfJV3BDPpbrx1rT3yp0qqePrdsgjlSDI8nM/P/P
	7EtuGErmnXndpLu5/blXxiW+p7dISDzaW02ZYn7NovAx3o7jUKtenn1iFLIySYHdS1
	Pq64dQKKxlCbX9uVbTsYDBAV/Pkdzj9S81LXSd7sVwf3GILHrk7rCkbW08ApD5Mzwz
	0FrqoO31cYftb1HoppMs4uOvpMyAepSgeY+X1NImavk7c3fjohk8eI32Z0RxJaQ52O
	QTUGkBSlsXpV9ATQd9EC9qws6LbTcxRtw1tEhsToF2mlO3MaMNK7sYAtzaF1ICGQa6
	8ujggkz8u5QIv8hbMoeflRGQ=
Date: Tue, 31 Dec 2019 09:38:53 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191231073853.GB934@localhost>
References: <20191231010652.3206534-1-raj.khem@gmail.com>
	<20191231010652.3206534-5-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191231010652.3206534-5-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 5/8] sanlock: Upgrade to 3.8.0+
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
X-List-Received-Date: Tue, 31 Dec 2019 07:38:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 30, 2019 at 05:06:50PM -0800, Khem Raj wrote:
> The original SRCREV was at 3.7.3 even though PV was 3.8.0
>...
> -SRCREV = "7afe0e66f5c7f24894896fad20ffa6f39733d80f"
>...

This looks like 3.8.0 to me.

> this upgrades to latest on top of 3.8.0 to get py3 support
>...

This should also add +git to PV.

cu
Adrian

