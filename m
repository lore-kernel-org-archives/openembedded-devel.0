Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id AE34F77D89
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 11:55:59 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id d201so34554919qkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Mar 2017 04:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nyc0g7KhpOL7c65kuF0stsU8gRyPInPCp+H9ZaXanWg=;
	b=ijw4qPr8UpgiRYVWuWfy2dhpV/CSRAXwcfJfy1pttYnXYTGqXsctiBmhrEJAWYiG5k
	6GEKLooNZdZLFM+/QjaelqVmAf+erxSlbvTzzR906qwXdU1cCJ6okXltmGGCPIyad8MD
	zapWVbwGBRQ9+f9e7oAExn1v7VeLKpw5XeaiyCjGGwVMiNm6zYkP4B2akOVLjZ8Og5UP
	re6+2+BLzUt0fMQCcUDpqrZ0Uv/0M1u8HlFB5c4U8+qsS6MOqooFo0BCqyQY+tF6nLwH
	r+CLRvm7kk8ePhDyL3DY36WP5jbazsDsKdoumS5E6APKZnXCSfBTLJ1jpb5m7wfJ34BO
	1c/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nyc0g7KhpOL7c65kuF0stsU8gRyPInPCp+H9ZaXanWg=;
	b=ITIQ6iSVc1piWfRydMqH34GKdBujQkEpGws4KG8w7p71ChUbWOnwzXMnMtTSaC1xKy
	M5doHSUDxGxJq/9GSg1cQPCObIJHoqlLQGZv0pCc+8K6hHo5QPRXqxsp68tFim0MJMvD
	OOQoIjptT797xbUN03N6nITUpYuC+sjBJR8oOc/e/TNOyFYWvom06FecnbAUFjUnPTj0
	xp+UpQWVkbJLqaGFZ7U8NFDhN+AvJkc1cwg3ph9+4jBld8bkyNI+WphTSFDTn0HXbtuC
	zd0+8gW4AwR0o0Ea6hA3fccp4OfclyyEp7jqao2C3c5C1nFoyUWqgPFDJEkcYFhcrfc4
	dkTA==
X-Gm-Message-State: AFeK/H3W9GfnxDuIqAJrICEyMm1yqdEy7aAKdKQEmkqrP0g6qqLDxuu0pdwC6x6qYXruqGWkisw4Ozsc2KEv3OhV
X-Received: by 10.55.20.100 with SMTP id e97mr2446079qkh.3.1490961361311; Fri,
	31 Mar 2017 04:56:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Fri, 31 Mar 2017 04:55:40 -0700 (PDT)
In-Reply-To: <20170330180636.GV15664@denix.org>
References: <20170327142231.21807-1-marex@denx.de>
	<1490624701.13980.267.camel@linuxfoundation.org>
	<5c037512-7bf1-8a3c-cb76-fda7230781a0@denx.de>
	<20170329215658.GP15664@denix.org>
	<a5b043f0-b0ee-a74b-fd55-4f8d20669cba@denx.de>
	<20170330132447.GU15664@denix.org>
	<a8de81ca-4056-ad2c-4e38-1bd1b4c62315@denx.de>
	<20170330180636.GV15664@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Mar 2017 12:55:40 +0100
Message-ID: <CAJTo0LYtO5P7cUvtcKfiQ1KbsaYFSfzoE1oryCPOx_LMnE6vkw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Marek Vasut <marex@denx.de>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Fri, 31 Mar 2017 11:56:01 -0000
Content-Type: text/plain; charset=UTF-8

On 30 March 2017 at 19:06, Denys Dmytriyenko <denis@denix.org> wrote:

> "Known devil is better than unknown angel"? :)
>

Agreed, fwiw.  It's late and u-boot is quite important: cherry-pick the
patch for Pyro and master can upgrade once it has branched.

Ross

