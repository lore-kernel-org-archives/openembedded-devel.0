Return-Path: <samuli.piippo@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8AFF76FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 05:14:50 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id r24-v6so1843191ioh.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 22:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vTV44AhnRvEOMoIiPN7S4RXlbbNSUQVUhEWwQJyIFpM=;
	b=uJTtgSjG4yjVntIPra+uGpOAs8Rj/krcqOpg5m6X32Sxx0fN6vEixnMaHWsH6kq/1P
	qX+nIIpnaPHmfHK/o+qEmWrTI7FzsWQPtz8DKhPipoqCaWdwlYPDYR1QzReBPHTkHb8a
	G6LQeDPcR37IJHq9DNusdaA2nc24jPsOOSDUTTsxX7ElmGW9g6OFSVaEc1R2ssCGloVH
	Iu/zXKUWSI5X5NoCKBAfSsGgUR6zJF8USQTkdlW23YTx3plJj8jWvg9UVQewBfqfQQyA
	Ku3oUerexwrYDg5E7LD0Bx2srXeGr0IX79KCcPce8nq3quUHCtePW/ltJQNcAYnYMJWC
	yWsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vTV44AhnRvEOMoIiPN7S4RXlbbNSUQVUhEWwQJyIFpM=;
	b=dIUvKOFx7TCRYDpTVyJYm+BiagoDROwsrjS5fLxP3mkmF4uJQeQT9VfxMzvfWnRTk5
	R8R2P3W1y7yk7AI8KJ8EACDKYc22onbRAKwS4ZUt6UecaFhz0deFcBc3qN0WkeaRRHYo
	g3dgFbryATwD/WTe6J19sTzzqopxjOZTCS3lRPir0kvtzZB8HZeXJhDiK5ddKUT/U8/G
	x8BsE9QfsTLbQ/s4Le4D747xn6bCxFOQ3OI/bthUW6ZW7uGFSKJaf9nEZB984VT38W1z
	W1p4b7a0GM2WjsZFb6FkrcdGgcY6Mr4YScc/W7vy+ZDCXYCNJyz+7WDbrkmZc5Z9TAMx
	OZ7g==
X-Gm-Message-State: APt69E3t6hMse/tVrMBWERQEFZTFY7y16O7kL+mDWUZ+taLS0HMLUh9l
	cRv+Me5r94ypeMRZYrk1qvHQDbxdKLlKSMZSJgc=
X-Google-Smtp-Source: ADUXVKJZ6W+HtnriiAb83bgUbmonNUjKRTZjTb2W+5Ked8dVruFJt7IlleYIzANeqXKm1mvies5MTAy1Dqy43Koe4mI=
X-Received: by 2002:a6b:1ad1:: with SMTP id
	a200-v6mr18269589ioa.139.1529558091452; 
	Wed, 20 Jun 2018 22:14:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:88d0:0:0:0:0:0 with HTTP; Wed, 20 Jun 2018 22:14:50
	-0700 (PDT)
In-Reply-To: <20180620121927.GB3257@jama>
References: <20180529092556.25053-1-samuli.piippo@qt.io>
	<69a631ae-09ec-a7c0-5965-f5372ef463c7@zonque.org>
	<CA+chaQfXaWZvyUqWSE-Zq=nSW13Jwt=GVPhXTj0dVbzVGpebww@mail.gmail.com>
	<d2df5115-8f79-fb79-e761-919fed4cd50f@zonque.org>
	<20180620112953.GA3257@jama>
	<CABXoSoU8YpM1XNNDW7r=9vjhNtuJGwsT9Z+BCHvv7pBA=dy7wg@mail.gmail.com>
	<20180620121927.GB3257@jama>
From: Samuli Piippo <samuli.piippo@gmail.com>
Date: Thu, 21 Jun 2018 08:14:50 +0300
Message-ID: <CABXoSoWCCG9CmvyjfCk0BmS2uj3AHVymsBnNjFFk3=g0cA8+ow@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qt5: Update to Qt 5.11.0
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
X-List-Received-Date: Thu, 21 Jun 2018 05:14:50 -0000
Content-Type: text/plain; charset="UTF-8"

On 20 June 2018 at 15:19, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Jun 20, 2018 at 02:57:39PM +0300, Samuli Piippo wrote:
>> On 20 June 2018 at 14:29, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > 3) we cannot use nobranch=1, because that breaks AUTOREV
>>
>> How does it break AUTOREV?
>> We are using nobranch=1 when testing non-released Qt versions and
>> haven't seen issues with it.
>
> And are you using AUTOREV? How is it supposed to know which branch to
> track?

Had to test this myself and I still don't see problem here.
As long as there still is "branch=${QT_MODULE_BRANCH}" in the URI,
nobranch=1 doesn't seem to make difference for AUTOREV.
It only stops the SHA1 validation, when you do have SHA1 in SRCREV.

