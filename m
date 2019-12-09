Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9577FCAF
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 15:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47Wmvd2B7nz3H;
	Mon,  9 Dec 2019 16:14:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575904494;
	bh=TEs49PYIZFVnORzfaFikVhB7/5q+8KI8OVCkVssvVjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SNJOZGLSiQb95ZE/UI5v/zASDn6uVLjJJaJx++aBwY0ALTtoKvXgn6OVUnDcelJQl
	FpZsFA01EGQPh24H4fwhLEoHXHmn6LA4jBdR0B94Ci+NzmNwySd0LOkYiPonq9tsl4
	RuDoRNfgHmNNcIVj2N3Ze0mDt/uP6rnVs0Z52wh9tql44TxW9RPhmR6svRyD26g+sP
	4Drq7xYKVEnn7DR7jEHqaQi/KSJwTQkamr+2tKiG58pFRp9nHRGQ47gqUjuOyMGubG
	fB6UjaatOhssq6RwHeMKKcDrSi6Jx3Z4Gp5Ab6aMmczYW5kE4tiUdyaChu1hrHreAt
	kCbyyDuLHtNVbSHpvALo6FayomoY5Rw/LLP+yD1A0x4LzPRkZASzOjCndGmEuZN2yv
	pvyIxNEwDssq0jcbWwqd4EhFErXbgkxp8itjqSJvPlGUy2v7TBy2/sUwBcqkPRIMBH
	APX6RumvtCwiCOwUUbEORLgb49AsaeSuG+BuSzLIj8BwR8PRV2CNzUtsNpSFcXEgL5
	K84gttjm2P//WX99Nb5UZn0Hz2wRJsXM5EUMZyCND2cqoD44nhhHsi045ZWpXLy61d
	VjtVU5GmYhZNL3BCA+CZp5UdN+bJxB8e0nLPWQpREbIoWEtCPB/UeFelzdIWx4Qvmj
	vgBumd6OYnVV80WNTBbyZX5E=
Date: Mon, 9 Dec 2019 17:14:51 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Stefano Babic <sbabic@denx.de>
Message-ID: <20191209151451.GC5701@localhost>
References: <20191209144601.21938-1-brgl@bgdev.pl>
	<c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
MIME-Version: 1.0
In-Reply-To: <c8092805-82d6-9cbf-83de-d7a8b8bc0062@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] librsync: new package
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
X-List-Received-Date: Mon, 09 Dec 2019 15:14:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Dec 09, 2019 at 03:53:33PM +0100, Stefano Babic wrote:
>...
> Don't you have any depends from zlib / bzip ? cmake tests it, if you do
> not add it, build will be fine but without support.
>...

Is it also working for you?
https://github.com/librsync/librsync/blob/master/CMakeLists.txt#L53-L57
https://github.com/librsync/librsync/issues/8

cu
Adrian

