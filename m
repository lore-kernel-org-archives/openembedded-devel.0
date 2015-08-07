Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id CE09776762
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:35:07 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so30640525igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Aug 2015 05:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=+lxXUWToHEV4ufwpGuOKpg0I6Y5aLbqnLqY8qZPkTVs=;
	b=AE/hYQfxWFXjSdRtv/P18nEzWZ3y0PD7BXs36D7A4g4iAXLSoFdWrPwY6uuTROhz9V
	BzDhylO4yryGM0BIf9Kf0+2F4FTSwegwjw9nkkYmpA1YhCj6daIS4i0dm3wydyUxGznT
	IXKrlM9056oNC0mmS48DYGz3eE4icSSREKHslV0d+pkEO5wiBSVB9C5rLlEkGnWb+jTw
	rv7XTVMy8eRyT0OZZLdJEgBpUtYnirVSp2hFxm9CkmvvyvORu+cQNLQBonvmjtU6JImM
	WbGpCCPHbf1Jirl5j+ow4hjHR0qmf6ThYD0lhU0M/RRi5pbMXVa7uBAwcJ7rqnwIje9V
	hEtQ==
X-Gm-Message-State: ALoCoQn5wZaArR72Di92BNoyxgE+b316yFaoJS9WQxspnHYnsKvVNIXkGlI7n/nUIU/PPx/pf17H
X-Received: by 10.50.143.101 with SMTP id sd5mr2735390igb.44.1438950907484;
	Fri, 07 Aug 2015 05:35:07 -0700 (PDT)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180]) by smtp.gmail.com with ESMTPSA id
	i123sm6747960ioi.13.2015.08.07.05.35.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Aug 2015 05:35:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by ioii16 with SMTP id i16so110221103ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Aug 2015 05:35:06 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.7.214 with SMTP id g83mr8071948ioi.28.1438950906172;
	Fri, 07 Aug 2015 05:35:06 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Fri, 7 Aug 2015 05:35:06 -0700 (PDT)
In-Reply-To: <B399646F8CA055479BEC55F6B065A04A3703F1FD@FMSMSX108.amr.corp.intel.com>
References: <B399646F8CA055479BEC55F6B065A04A3703F105@FMSMSX108.amr.corp.intel.com>
	<CAMKF1soC4=mMLfhgSXEhd318AiHuAj+YF+otJ6fGtgE4+jy7gw@mail.gmail.com>
	<B399646F8CA055479BEC55F6B065A04A3703F1FD@FMSMSX108.amr.corp.intel.com>
Date: Fri, 7 Aug 2015 09:35:06 -0300
Message-ID: <CAP9ODKqTC3ohfvSS+=616CArZtTy=N=+D0XKnsr9putdLTaUCQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java] [Enabling-Openjdk-8-for-x86-hotspot-vm-and-arm-zero-vm]
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
X-List-Received-Date: Fri, 07 Aug 2015 12:35:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 10:59 PM, Awasthi, Vinay K
<vinay.k.awasthi@intel.com> wrote:
> Hotspot build for arm is not stable... I see various error related  (see below)

Drop INC_PR

We seem to have just one openjdk-8 recipe so squash the .inc files

Please address the send-email as comment in the patch is critical.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

