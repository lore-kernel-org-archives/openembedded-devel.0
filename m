Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C5BCA7E6B3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 05:22:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46JDdm3Llsz4s;
	Wed, 28 Aug 2019 07:22:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566969756;
	bh=h8LI2get0njOQVhqqX08hWxd5q2p55+RffjdEvI92mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oF3laP8tb+hzzupTd23qQJm+Q9R6DvY3u7BvfoSAWLnr/++eTJXuta4XTfCsn9UKW
	C+FNSuUZQNmtyPtoxuSXOsZhnYNEzz2Scfpjy8caCo6rpPPG2io8S4d++GOQP1a/L+
	uiUcCUdrn2F2DmIXcrVfNJ+/EWPr5oy2u0uBAGpwT+y2YjDhflja5sCOwlMxE7+Vru
	WxIN8VwWa1XIXq50YXBfbqJo0pbbcX9KADTf6Cg+JjHZHlPr5BjoPdzAwZFk4WyIod
	2N6M2GFvQutQHYQRH7+onjgfRsa7WfRzEzf4UDeZCku0vDjp3AtgWYsDQZLQJT+cA9
	2tGKVmpYjN1FsaRO5EqC5T7RCyAI3UzeCvVuksjVuoBPwL4ZJWF9MJKMUkcne6LPTU
	gA6L8cxwuPh6Xma+illvQz4civJn15nLMttFfKX4YfDSFgwKrxIoP/4RtizK8wMtnd
	40bBETSR5GpNJkUETzgxiMeKiwiagKZCSv4VwZbcrRBnoReVlLoMFBG/yFzyeh4NXa
	ObuvEWqnL87iKFcj95MNifiqY9+vHvGji109NOrrhW7eyJhMpuIdUko/isJ0qEsO9N
	E8yUXEkZXtSMGij4Vz27iZD2ADP7xcfKK0sJmn33h1Q2yRC0skxVKOWkOc870Iiv5o
	RAwdfEv+yjigLlB49SXDkelU=
Date: Wed, 28 Aug 2019 08:22:34 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190828052234.GA15528@localhost>
References: <20190828011436.24057-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190828011436.24057-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] libgpiod: Enable python3 in default packageconfig
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
X-List-Received-Date: Wed, 28 Aug 2019 05:22:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 27, 2019 at 06:14:36PM -0700, Khem Raj wrote:
> this recipe inherits python3native class conditionally, this condition
> depends on a given packageconfig, however inherit ${VAR} syntax requires
> VAR to be evaluated before inheriting it, therefore if someone appends
> python3 to packageconfig via a bbappend, then the packageconfig will
> become effective and add --enable-bindings-python to configure but
> inherit wont evaluate correctly since the expression adding to
> packageconfig
> 
> PACKAGECONFIG_append = " python3"
> 
> will be coming _after_ the inherit, and the builds will fail e.g.
> 
> | ../../../libgpiod-1.3/bindings/python/gpiodmodule.c:8:10: fatal error: Python.h: No such file or directory
> |  #include <Python.h>
> 
> This patch inverts the logic, meaning if someone has to disable python3
> bindings should write a bbappend e.g.
> 
> PACKAGECONFIG_remove = "python3"
> 
> This will still mean that python3native will be inherited but the
> effective configure option will be --disable-bindings-python and that
> will do the right thing
>...
>  # enable tools and cxx bindings
> -PACKAGECONFIG ?= "cxx tools"
> +PACKAGECONFIG ?= "cxx tools python3"
>...

It looks very fragile to me when a PACKAGECONFIG has this kind of 
unexpected side effects.

If I understand it correctly, for solving the problem you want 
python3native always inherited. And the simple way to do this would
be to make the inherit unconditionally without touching PACKAGECONFIG.

Anything I miss here?

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


