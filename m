Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 50DDC77A1F
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 11:12:14 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id g60so110242078qtd.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qQbTcCIv3/f/t1/KHIuZB7MIPvf3Q6Hd3V8BLylp5xU=;
	b=1R3YgZm79bvXb1SIEOSBOhrv5q8x22s4zN64h9FJ97tQWmeFinKdNpuT7y87WI5lsS
	ESZbBvRG81EKWgYvny3HHHOV7zRKRZ1UED29FnhJAU5va2iObiQColvIxK0hPZIUo1sR
	WYsiof1pimgHrllC2zkrvMMMRqMKbn/qxqY60vV6CPTqBaI2BD4Qgrr4wkZC2V9KxuCv
	buTZsCmGLm/pxXHgdd5bXRY8W8lhVZH5uuDdARizsAp+8qV4Xvrfa6nmhV4jWD0YXXpM
	1vP5BNLvnqrIWNKc+ncRK55pH3XQHgEYAhc/gWiOvUMRo1XGScENmAau51xumP4qnq+A
	+lHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qQbTcCIv3/f/t1/KHIuZB7MIPvf3Q6Hd3V8BLylp5xU=;
	b=d0HUlHc1DZL780tyzq30w542CTua7dEsHC+yjb2I3VOE6itQNQFuwIjLpEt596KsqA
	tQKU2C8tRPxbsGxZql/qkR8KkPngEUWCrFYSGiiMgyHH6uKjp+WSIGKvxXTV/UCNIv+a
	kj6O7l0tig61DaS9HHoxajs4OzkmEnFfq7cuGCyttzrnHERtYu02/Xo54sVD9C80nngO
	6VCXL4xtr4sO+bwxxV/kdqmIYszOlwkJXpsrOjVyfWo97S33GRnUIRfU6fhz2uYKDuSx
	qPA/xu4n49GzU1xeRapDPCAaVqmguzmcEm0DX6rQk/+xxHNmFE1hXBWYjoYEDOZTyxdK
	f7Kw==
X-Gm-Message-State: AN3rC/6vMBhMpMEiaeEhGzjx3m4KB2KKW2eaa+AftHtXCiFf+bNeIVGv
	X2mh3dBaFuASiISUtpQoe702Jvdt+GSC
X-Received: by 10.200.34.242 with SMTP id g47mr24441015qta.109.1493032336251; 
	Mon, 24 Apr 2017 04:12:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 04:11:55 -0700 (PDT)
In-Reply-To: <CAJTo0LYc7nRX2zsPJkP3ZdmnenBxP=fCNUbc_H6L1vePDHjn_g@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
	<CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
	<CAJTo0LYc7nRX2zsPJkP3ZdmnenBxP=fCNUbc_H6L1vePDHjn_g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 12:11:55 +0100
Message-ID: <CAJTo0LZxsyHC7zjc7Z=wdS5_7NizgnCh=qkPM5munBkGWOmyGg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 11:12:16 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 11:29, Burton, Ross <ross.burton@intel.com> wrote:

> I'm getting that with 4.9.15 from meta-intel, should I be telling Saul to
> update the BSP with some fixes you've made?
>

Or ideally telling myself to update meta-intel for the fixes that Saul has
already merged...

Ross

