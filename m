Return-Path: <kergoth@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8675B76806
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 May 2016 03:43:46 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id z123so3050437itg.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 May 2016 20:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=exZqylFHqbErAvGIqJgmHwWtoLVVESu+e18gS4MAW2o=;
	b=HFzH2JYpGA5GSkfcee54HluCsNi78poVhbfw9AwOp+FQrlzRy9fxdIlRX8VR80rSke
	rOAZlLsbA/CuJBPOYX4ZyPeXitE/f3ns4Bwn5yYxMddBcBXKzz/WsJJEkP9qzPVBO6OP
	1/E31z205stDrN6YknIMcm+BI4JhEvx9W9PXL05CarwvND32Hzc9JWwSEQpJNKS9LrhU
	oaH7c9/jTtRBOEDj/iPRL+p/D/SjyZaNcDZcAcN7muXBm/Uy5aqX0z9WZK8IrzLBMWC6
	gDIa8QJtRKGHTG191XcQxj2uX8YSxG5FiIe+3iP0PPq6ssNaYBYMfQgAele1ewLO60jA
	XLHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=exZqylFHqbErAvGIqJgmHwWtoLVVESu+e18gS4MAW2o=;
	b=D2VGFhpwTk2K1q8RvJtOX5O+FMZjySfaeE8uVPC4x9UmpM1XMjH/qN4K9jh2myV1N5
	/hFRuP9svJ/5/PIxW5hzQSZc7dYynR07kbleGsNw8EH2EsZ/HKB6qPPCKEflZZh8liFg
	F+22w3MwvfNOSLzKbab3J1pGYAZGV4/G8ejRgxVqFj+mIDwfQMKgkW9crTPo8Xhk5oy8
	EsUY2yegKf8DQcxg1V9fNQHRBMi7D8h3qVcThlpyLFoJSyhBsFXOQtlpUZ4cXlujqGtE
	pq1dqW4R+gGem4fZs+pYH5Lt9ZJ5xfQzQ+bfaayUr/LdQbkCElQGD7VEcbWTf7SRaqL5
	Pa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=exZqylFHqbErAvGIqJgmHwWtoLVVESu+e18gS4MAW2o=;
	b=eBCBlpVv+7xaLU/+q6rtSt1vQZ5Hlet+020VZj+lEIW2WviGLiqhB4+bySZ+Yawt5g
	tMnOkyuJt50guQ8qhid/PVtQ9E2oSU1iEb2TXC3tFRoda3kz7dqoZ2GORkDmZ8EpiS/J
	TxV6LF8jzf0GHmDJ7tPbAh3XBytngkbbeVe6UAiCkW1E5Ouz0G6uev6VswqI38kUzztR
	s05Efpz3Npur3H2fZuBrl5MeHaqa88T+BFNFArEKg5CtsDT9qOThqUYq7iP55F+1eFiU
	DabwHP0xibwpVeaEHVvBaJB1s7csNjFCbRHrfVpUKo5E5oOblKP/efiy0EeYdocReGlY
	bboA==
X-Gm-Message-State: ALyK8tIEBceFIuWsJjF4r4rMr5umSzhnHN/KEtizD6RMHhLGAxGW9Fc52FKNXnqzTM+VinS9HC2xU9dfT4cPhg==
X-Received: by 10.36.218.68 with SMTP id z65mr3994624itg.19.1464493426877;
	Sat, 28 May 2016 20:43:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Sat, 28 May 2016 20:43:27 -0700 (PDT)
In-Reply-To: <CABcZAN=sp3YTzAMZFSE0RrH3ebv_xpE6w8yo7++S6fytNma+aw@mail.gmail.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
	<3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
	<328bdd83910d94b0c35eaff11abd98838c20493e.1463501350.git.chris_larson@mentor.com>
	<CABcZAN=sp3YTzAMZFSE0RrH3ebv_xpE6w8yo7++S6fytNma+aw@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Sat, 28 May 2016 20:43:27 -0700
X-Google-Sender-Auth: Y7pqv2l10lbXHeErsxCxnmqG_fM
Message-ID: <CABcZAN=sCH-O0HXsr1xGmtKa+8GxkORq=sGX-SUqhi+kYontEg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [meta-oe][PATCH 2/6] luajit: fix build issues, obey more vars
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
X-List-Received-Date: Sun, 29 May 2016 03:43:47 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, May 28, 2016 at 8:41 PM, Christopher Larson <chris_larson@mentor.com
> wrote:

> On Tue, May 17, 2016 at 9:10 AM, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Rework how variables are passed in to ensure that more of our flag vars
>> are
>> obeyed, make it obey more of our target path vars, and use fewer of its
>> hardcoded flags. Also add verbosity to the compile output for debugging.
>>
>> Without this, errors were seen for us:
>>
>>     | In file included from
>> .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/syslimits.h:7:0,
>>     |                  from
>> .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limits.h:34,
>>     |                  from luaconf.h:12,
>>     |                  from lua.h:16,
>>     |                  from lj_arch.h:9:
>>     |
>> .../lib/gcc/i686-pc-linux-gnu/5.2.0/include-fixed/64/sgxx-glibc/limits.h:168:61:
>> fatal error: limits.h: No such file or directory
>>     | compilation terminated.
>>     | Makefile:233: *** Unsupported target architecture.  Stop.
>>     | make[1]: Leaving directory '.../luajit/2.0.4-r0/LuaJIT-2.0.4/src'
>>
>> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>>
>
> Were there issues with this one? I noticed the other patches in this
> series were applied, but this one wasn't.
>

Ah, nevermind, I see it's on master-next.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

