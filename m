Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 3107977188
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 15:32:12 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id mw1so14232441igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 07:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zlUYKanMuFpb7ZsEQGFcTT/Pblh/B5ryKwxWyEGuNWo=;
	b=sZE3JUuvfdxZUcbeJgrp2bLcP+Hf5XZzE3f1KNJ2e3VflTtm3BmHBFLR7GsVjhkykW
	MBeWWh9rGBRjU8c6Xo9kFDTN8cU5cEVQXQTuTa+Er52JZaX2yXg7rMOJDDDb6Nf/Yva1
	QmgHLa5l3pUc9OGAUKkna7TI2oGPuL3KFigWYM18yPWRKRlFFCVQJHHlVTJ9NV6oyyFt
	hGknItioHQDDP0UGBV3+P7jviOOYumxfvg83ZTer/jxbCo091ET3POgpJX3YjDckoC7D
	xUaYVbCPy1MZRH/HD0fx1gzQqczzbeNN/a8K5FsdN8sV2eVP7JJkAIaVUcR9P0MEvZrb
	EZwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=zlUYKanMuFpb7ZsEQGFcTT/Pblh/B5ryKwxWyEGuNWo=;
	b=JVx/aeOYqxHJQNiTtiiLX9OMqS39qxr8p27lyxbyvRCdKsPsEN/ih+LkOiskWSmitL
	0217ob+HVnaaTXGrmFwTs5G0ZVKGlYkqrQS7MH3i1yVt2mjS6F14JpnQ8EMQAGOs1O63
	D9SXgM7pvDRKLOrp1lqR46QGMGuX0O6J4RvKv9zWtYEmSIh97svlmZKB9KXK67W/swUw
	vQ4S2LcIvkB7tzavoOJV6/RUTp/Ffg30EihN6bsYy4qjacvv/26PO4mTQW7CO/0qKlji
	ByowdQFdvOO14spCDXjyaaQyleA+a5hz2oxI3a5qyXyWcgESb7Bt5kA93Xccu5RhOvbE
	iENA==
X-Gm-Message-State: AG10YOQyEcjp354MZgH9H3yAIH6Y0K/Z5H30mmqja9uoslRm00lnGrhpGBwWQmw5H7AtyW7JAgm8kJcAwHxjdok6
X-Received: by 10.50.13.100 with SMTP id g4mr27894270igc.64.1453908733109;
	Wed, 27 Jan 2016 07:32:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 27 Jan 2016 07:31:53 -0800 (PST)
In-Reply-To: <20160127141013.GE2574@jama>
References: <20160127141013.GE2574@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jan 2016 15:31:53 +0000
Message-ID: <CAJTo0LaD+n3yj+wQit+BQ+7jvsYPc2P8aUyLzC9kNwp8u2uChQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2016-01-25
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
X-List-Received-Date: Wed, 27 Jan 2016 15:32:13 -0000
Content-Type: text/plain; charset=UTF-8

On 27 January 2016 at 14:10, Martin Jansa <martin.jansa@gmail.com> wrote:

>     * /openembedded-core/meta/recipes-kernel/cryptodev/
> cryptodev-module_1.8.bb, do_make_scripts
>     * /openembedded-core/meta/recipes-kernel/lttng/lttng-modules_git.bb,
> do_make_scripts
>

I can't replicate these with qemux86-64 and current oe-core master.  Do you
have any idea what could be causing this?

Ross

