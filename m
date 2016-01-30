Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4DDF07706E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2016 13:30:20 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id 65so57521878pfd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2016 05:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:content-type; bh=M7JZ6wiB5jRZSEavCzKSBe0Rzbw2BsOkWD0vzVm+fo8=;
	b=Ws/Mnm17ZjaPpKVkdRVxNtIqo9AvBbWY2OsND7pnIz/+GKgC1j1k10t8vlBJPHNyJo
	ToBJi6o9wdz5rk4YaPyq2L4fKlaOQONsemn2B9puoqleY33y+wZ/hIeOJMqN+xNNWcmb
	0Rky7EX+rgpBDCMzGzOSJIWZkpeGJImwWLWxlTHGVmgeHDnyvJm7qnMWM/VhtAuuXZ8r
	4udYH3RNyBfEiGxMEFhbGGufO8BbhC+7aORGW4eB6LCgg1rzRRf3gb3quV5D9cF5FOdh
	ndpQkqzE+X9txTRP+TptrJGI2n519hFI5M6Ffynm2o2FKZbjXhm5ONK5T4IhKvK/54fC
	SMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=M7JZ6wiB5jRZSEavCzKSBe0Rzbw2BsOkWD0vzVm+fo8=;
	b=NHIl9PJWZCqOy0sT9gKvBreIAQ6ST5gE9XgF6BTMGw9w7S+gO9hggSaw90Fsd4YwzP
	1Y25s7GbdeVSaaQZDVIy+o+cIlZA4+pIT6cHyir/LW+19f880kBzl+eUFF5MGOsxJkjQ
	kudwh3n7iIlgbzzGJrWYcLW8eGlfD9ZtjmpOhm+ojkUkOWUlRxmPx963eyik2Ydkz0/c
	J8h0AHgSCHKqFGHrcUWpsVm1jQGrhCfaCTKsyQ2o6xzX+OyRj47fblPo7ZQTlUhUOBPc
	672VELZ/rbIREMiOFOqFncbYvqEQLT+uUW8M0NA+Sa0D8Y2huuoHZPBPhPE81Cjtf9Y7
	aIxw==
X-Gm-Message-State: AG10YORWptpllK/5jGZTaf5hWxA+3LpjVSAgK9MWaj8BsGdwSQZ7ExJDHetoA4/or8Qd4Q==
X-Received: by 10.98.87.196 with SMTP id i65mr21940459pfj.72.1454160621312;
	Sat, 30 Jan 2016 05:30:21 -0800 (PST)
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com.
	[209.85.220.41]) by smtp.gmail.com with ESMTPSA id
	xv2sm30676601pab.10.2016.01.30.05.30.19
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 30 Jan 2016 05:30:19 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f41.google.com with SMTP id ho8so56395737pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2016 05:30:19 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.129.232 with SMTP id nz8mr22275571pab.102.1454160618970; 
	Sat, 30 Jan 2016 05:30:18 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Sat, 30 Jan 2016 05:30:18 -0800 (PST)
In-Reply-To: <1454071809-2040-2-git-send-email-Paul.Vaduva@enea.com>
References: <1454071809-2040-1-git-send-email-Paul.Vaduva@enea.com>
	<1454071809-2040-2-git-send-email-Paul.Vaduva@enea.com>
Date: Sat, 30 Jan 2016 11:30:18 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqp2x44yK8v4BdxyCifVUbV9b05RZ7-pO4vTuTaggxvEA@mail.gmail.com>
Message-ID: <CAP9ODKqp2x44yK8v4BdxyCifVUbV9b05RZ7-pO4vTuTaggxvEA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv1 1/1] lua: Added ptest for lua
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
X-List-Received-Date: Sat, 30 Jan 2016 13:30:23 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 29, 2016 at 10:50 AM, Paul Vaduva <Paul.Vaduva@enea.com> wrote:
> This was added using a special recipe (lua-test_5.3.2.bb) so that we will
> not download the Lua test suites when not building with ptest.
>
> Signed-off-by: Andreas Sundstr
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> Signed-off-by: Paul Vaduva <Paul.Vaduva@enea.com>

You could append the SRC_URI if ptest is enabled. So it makes it a
single recipe.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

