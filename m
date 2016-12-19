Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 43AF97732F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 16:42:15 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id t79so106172733wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 08:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=iBiUiUxey1TXSB5cytIIUhrvrCuImkWhFIqs1+eX6qs=;
	b=HcC1RJChmZf+qjhdU3fIHzOoCkVpfhLxkEDHudWaMJ0lc6jyvxEkrQZmsjbroh3U7Y
	fSKLXT3qq/YyrPwSjzl/2XvdbRY7koxK7fB6v9ivElC7hT3qFKTpAOFK2/3eqsXu9C0G
	ZDYS6cVTdMQyPHXuPRUN4trfKI2TS9sv/3T/5lIibpE76yhQ3l5WLROgvAKadevUne55
	d8m4qwv9xur4adqhdb8utAlS2bzOuqPrlt1LJHkNLRGF6UTVSGq75clE4bJIVLAfkM1F
	PP7SDDta5CV7UwN1X9K/3srFrDpaGCXxrbJWDZ3aN5sYKQFqTUIu9mIWbbvcRa0AgFMc
	1CZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=iBiUiUxey1TXSB5cytIIUhrvrCuImkWhFIqs1+eX6qs=;
	b=CIi6sRasLn0W1fExosY1Q3zjtkt0jUNQQ+yPA2EBYNokYQJDn3QZsL1Henz+WhzhIQ
	EsY74PC/X/oviSR1CmFdPQ/3gdxROk4vwaHPkoJ1xMebmW98fTnItp5iY+CeFzOZpIyZ
	3V7r9RVILOttdr8mlU039bAcD2igP84asXayyRqnOKPh40kuc42C5OOQjSOgs0ebZQN5
	jZxSoyp3u0d30Ieln1bXimUZ9IfHnGE4WY65xS/alEPfWi7rkQr0pSWZ9hLPqXVN5uOq
	04fNM0Hjo0u/vRi87FNt/6Z4L+UfiZLvALwMrLrPEOfSAwPPqHg09vPC32GY1nTugu7E
	CaqA==
X-Gm-Message-State: AIkVDXKYu5DjecY4ecQTAXtfLcVqQLLaH45Mflv0K7IwWA18tE77cWN6t1mLSeLd7aNQWIfyIsEpmqqY7YHBew==
X-Received: by 10.28.211.72 with SMTP id k69mr14012430wmg.138.1482165736708;
	Mon, 19 Dec 2016 08:42:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.162.33 with HTTP; Mon, 19 Dec 2016 08:42:16 -0800 (PST)
In-Reply-To: <20161219145857.hg35ivv5vidlzdmf@ad.chargestorm.se>
References: <1482148888-3127-1-git-send-email-armccurdy@gmail.com>
	<CA+chaQeBUTnQQnVEGDhae8opjobSAPF=BU2R-772ECPf8KA4Pg@mail.gmail.com>
	<CAJ86T=UB6T+LpTNRy6_pZ5f0P7FzyJ+qMdgS=8FvDE5HcaG41w@mail.gmail.com>
	<CAJ86T=XDvJk93+Jc4-v5H+3nTSFJ1KcQbyeUt8yvhJwfTA=pnA@mail.gmail.com>
	<20161219142620.4hpmfdo3w3kk2zlu@ad.chargestorm.se>
	<CAJ86T=WzTb-z-WzdHc6Ke4uck_M9zOWWq35bo3qGyc59hQuUmg@mail.gmail.com>
	<20161219145857.hg35ivv5vidlzdmf@ad.chargestorm.se>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 19 Dec 2016 08:42:16 -0800
Message-ID: <CAJ86T=WJRG7XTeo-MQ-3t+F0O1YNQHGzyQR-o-6N6sEdzqHJcg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rapidjson: add initial recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 16:42:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 19, 2016 at 6:58 AM, Anders Darander <anders@chargestorm.se> wrote:
> * Andre McCurdy <armccurdy@gmail.com> [161219 15:46]:
>
>> On Mon, Dec 19, 2016 at 6:26 AM, Anders Darander <anders@chargestorm.se> wrote:
>> > * Andre McCurdy <armccurdy@gmail.com> [161219 15:12]:
>
>> >> On Mon, Dec 19, 2016 at 6:08 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
>> >> > On Mon, Dec 19, 2016 at 5:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> >> >> Please don't use github archives.
>
>> >> What's the recommended way to fetch from a git tag which doesn't sit
>> >> on a branch?
>
>> > Use nobranch=1, see eg
>> > meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb.
>
>> That seems to query the server on every do_fetch, so doesn't work so
>> well with BB_NO_NETWORK.
>
> It shouldn't do that. The problem with android-tools_5.1.1.r37.bb is
> that they're not checking out a SHA1, but a tag...
>
> ANDROID_TAG = "android-5.1.1_r37"
>
> That's not working without querying the server, due to how bitbake's git
> fetcher is implemented.

Right. So is there a combination of tag, nobranch and SRCREV which can
fetch from a tag which doesn't sit on a branch without querying the
server on ever do_fetch? I didn't find one yet.

> Cheers,
> Anders
>
> --
> Anders Darander, Senior System Architect
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

