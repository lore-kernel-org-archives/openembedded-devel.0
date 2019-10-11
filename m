Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B67AC7F37D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2019 19:05:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46qcpq53N8z4S;
	Fri, 11 Oct 2019 21:05:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1570820723;
	bh=DIMnWbkGZffbFGHTGWpWjFTDc9+8eIn7TCz0TiddB/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJu0oVYx71+iHMYGMNbUdG14W1BVGMeDnSrr2Papv2gjmEP2fFZA5k2t7K8AIP1aO
	9vPlUpSv9CWSIyujtXQEzzFWQiiAb2Z6CJ/KrY7NtNdKrag77/Jsu44c6uU92YciXU
	EL9WuD5CXbYG32d9FVtGek2/zwO1XtC/WTEW4uIQ4Tv8zvxHJeNQTC3P+KG2AQ3AY5
	2OHcLPx7lj+h7nnqUjv14LutuoJWuKm1snKytUkdeKaH31PAuRItFR4ltddznHbN9q
	5edAFTBY3T8s5r24G+AH8O12uASqBRlNza+5SDOWkoOsHjtoo6wY8a+eE590nK406Z
	JBh5Cc1QuapgWjyMpyXkOxMFfJfNXJBP57f+yONVU8UOjComumnjVhQK+iJssDnzcH
	J3UNP021bsuorin/aP2T/xo/hLPO5Ky3pL2gFuGz874vK5xCTh3QX2K6sn/jIEmx9S
	U0Ma5nJXU/tTJBbB/Wvhiu60aTEPAl6jsS8BwBlGgv5HKp9zEisvADlYlkeDF1tNcw
	Y8QUAeAwr0TO/1dgZaQsjSlS2Dho1F721I62PSznvid/WNs4KvPjB5yhGTAqby4uyY
	knREsyLxFFQw4z/x0MVgvyvbln/fHRSaTvOeaeP4FPpb7x56O0v66O9qfe9sIEjrjX
	J+hE3HI38XkNLS6x1/7B7TNY=
Date: Fri, 11 Oct 2019 22:05:21 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191011190521.GA20513@localhost>
References: <20191011172818.718226-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191011172818.718226-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] wvstreams: Disable calls to makecontext on musl
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
X-List-Received-Date: Fri, 11 Oct 2019 19:05:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 11, 2019 at 10:28:18AM -0700, Khem Raj wrote:
> makecontext API is deprecated and not implemented in musl
>...

Does the resulting binary work correctly with musl?

The whole patch looks like turning a turning a build failure into
broken runtime code, and that disabling the recipe with musl would
be the only sane action.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


