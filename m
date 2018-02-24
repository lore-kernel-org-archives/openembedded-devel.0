Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id BD12D788BF;
	Sat, 24 Feb 2018 19:30:28 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id q27so3059211pgn.8;
	Sat, 24 Feb 2018 11:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=Z0pF6MUmV6y0QP7IIguEuXeCQ29MZbDePG08y3LZ90Y=;
	b=EGeu0AogrLNAeUzXOZfu4gV5YQGql5GwPZWaUApq8Xzi5oWNDZalAOP7D2/9Icv9h/
	TDE+zHy2+vULWpaIlwkwUkOU1/uHmiz2KOE2xggPuOnEL05FBt7FQHmPdb+AYK+iA4lk
	Ga5+guuEvGhYJAn+tODCTlNHa0EhPBShC7yp1rXrevTltIi/nR3+BvqDQwsL/ZikrJ22
	ZmMV4OMolJAvvGeC9jA5WRPLDrKUFYko1sEcza6dderhkSizyj4RCO5XRftUMIvdfXna
	a6Ism2rDZknSYX3/kisfV42lltgSa22gxNpuUZBASBFib+vfvxowv0XEmiIWVlOvbcdm
	LWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=Z0pF6MUmV6y0QP7IIguEuXeCQ29MZbDePG08y3LZ90Y=;
	b=GDTw9j7k3PTrUJ1Re005nEyzzMErrVuFckUZQ9wEjvOTj1Q7GTwfn7AGA0hrWx3SPn
	P8lkVkNvG6vb40ipftUYLW2g5y+4b24YEQk8VUFvZJE2LJKNF2u/mFIvvq5Nf563J96F
	VDosu+EluVl51kTLUDD66Kg+6pLqTLT7hViCobuWODpem53sSqjNwwgwnYte1mfT8C96
	OvlnxAzCLsPj3aNAQF8DV4YSFXdgmkjZhvVLzHQhDXaZr/sj30O3YE4QXqLNbRUqWUAR
	571ZNzQ6AykNbtQxkco7w3Pfc5KC749Lcz4FTmQKnL/q0Mn7Wl5uIu/Ls5nOZv7lAjry
	E6Bg==
X-Gm-Message-State: APf1xPDm4YURYnk/JXOJhvjkluLuHk8rN7AIu5dyFoyBMe1Hxlp6W/pY
	xUnluF2OGixAMKJGlOrQn8qT7Q==
X-Google-Smtp-Source: AH8x226cYjDHk+XbL7QtFgPD4sKvYsyxJpiqCS023Ki7D+r5PMGTfBLOypLF3LhNc2ar3SkcoGgs9g==
X-Received: by 10.101.98.201 with SMTP id m9mr4551134pgv.100.1519500629716;
	Sat, 24 Feb 2018 11:30:29 -0800 (PST)
Received: from ?IPv6:2601:202:4000:1184:301f:20d9:41ea:5ba?
	([2601:202:4000:1184:301f:20d9:41ea:5ba])
	by smtp.gmail.com with ESMTPSA id
	r62sm14816447pfi.52.2018.02.24.11.30.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 24 Feb 2018 11:30:29 -0800 (PST)
To: "MacDonald, Joe" <Joe_MacDonald@mentor.com>
References: <7e8d4f35-6212-46c1-84d3-a386aeae326d@email.android.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <61ed17a3-a0d3-6bc1-c84b-e914ecfcc399@gmail.com>
Date: Sat, 24 Feb 2018 11:30:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <7e8d4f35-6212-46c1-84d3-a386aeae326d@email.android.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] meta-openembedded/meta-oe re-org
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
X-List-Received-Date: Sat, 24 Feb 2018 19:30:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit



On 02/24/2018 10:26 AM, MacDonald, Joe wrote:
> Hey Armin,
>
> Your branch includes at least some (I haven't looked to see if it's
> all, seems likely) of the changes I have merged and ready to include
> for meta-networking. Since I haven't pushed them yet and wouldn't be
> before tonight at the earliest, do you want me to wait? Or were they
> just included in your tree for testing? I don't want to cause you
> unnecessary merge conflicts.
>
Yeah, After I sent it, I thought maybe I should have given the start and
end range.


"zsh: move to recipes-shells" to top "postgres: move to recipes-dbs"

- armin

> -J.
>
> On Feb 24, 2018 12:57 PM, akuster808 <akuster808@gmail.com> wrote:
>
>     Hello,
>
>     I am planning on moving some recipes to new locations that are more
>     in-line with their function.
>
>     Also, I plan on adding *-shells, *-dbs, *-security and *.crypto and
>     moving the appropriate recipes there.
>
>     This might help facilitate folks signing up to maintain a grouping
>     like
>     recipes-crypto if that is their thing.
>
>
>     I will be sending out patches later today for review.
>
>     I have staged the changes @
>     http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akuster/meta-oe-reorg
>
>     - armin
>
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


