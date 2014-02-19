Return-Path: <koen.kooi@linaro.org>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0F9306E7FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 09:23:53 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id q59so97250wes.23
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2014 01:23:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=SYzW7YW5oladlDU1TrHZxbEa3m4DszWHUvoC8tmecXo=;
	b=SKM4plr6RwD0n7Obq+QjpvuOVLcLkOnE89iheFCaJvRXiH6bLZ0KDpbLnNKyZI88dK
	hAzSAMVanIfNO7fJsKYkO88vcWBB6/wrtvSECM2IoRvk/YnjdGYjwGzrNFXbJGUZHoTi
	2CQmFwxpCgSQtYWKq2oqqussI/aPVZEPr0qpsEaUCXGu9mtv+kg86sU0yAVBB4purD3u
	fFk/Q3ayI+uArAW7clVt+tButLQMqYzOehF9EQdo/izGDGSlUfjn7IAlDLgAW0WHShNH
	/5syBp+/jc3PMOxw43AEu2VAeXz7a6Ob9P9izF5IALAGRgXzE+Yv0x8Q7Ib4OLPtZ5WR
	8HKA==
X-Gm-Message-State: ALoCoQlNim1e5oEOWiMNQPbr0x7nM32krVte8CzvtSLrCe2q3m8bsRV7ucbZy6Y/UPvr1yWgrIYu
X-Received: by 10.194.86.130 with SMTP id p2mr244032wjz.88.1392801834305;
	Wed, 19 Feb 2014 01:23:54 -0800 (PST)
Received: from ?IPv6:2001:610:612:0:5e51:4fff:fec8:7c15?
	([2001:610:612:0:5e51:4fff:fec8:7c15])
	by mx.google.com with ESMTPSA id hy8sm52252919wjb.2.2014.02.19.01.23.53
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 01:23:53 -0800 (PST)
Message-ID: <53047828.701@linaro.org>
Date: Wed, 19 Feb 2014 10:23:52 +0100
From: Koen Kooi <koen.kooi@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Diego Sueiro <diego.sueiro@gmail.com>, 
	openembedded-devel@lists.openembedded.org
References: <1392798218-17950-1-git-send-email-koen.kooi@linaro.org>
	<CAMCfZKEbvjyBJ-WJSmB1OfO6rGZT3ya87upAqeO4KfY71NMJHw@mail.gmail.com>
In-Reply-To: <CAMCfZKEbvjyBJ-WJSmB1OfO6rGZT3ya87upAqeO4KfY71NMJHw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] mariadb: move linker fix to .inc
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Feb 2014 09:23:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/19/2014 10:03 AM, Diego Sueiro wrote:
>
> On Wed, Feb 19, 2014 at 5:23 AM, Koen Kooi <koen.kooi@linaro.org
> <mailto:koen.kooi@linaro.org>> wrote:
>
>     +           file://fix-link-error-ub1310.patch \
>
>
> Should not the patch name and description to be modified since it is no
> longer associated with Ubuntu 13.10?

To be honest: the patch shouldn't have gone in named like that, since 
it's a binutils problem, not an ubuntu problem.

You are correct that a renamed would be good, but I'm too lazy to do 
that right now :)

-- 
Koen Kooi
Builds and Baselines | Release Manager
Linaro.org | Open source software for ARM SoCs

