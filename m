Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9775A77AA6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 22:36:51 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id c45so126509631qtb.1
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 15:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+chfm1R7UihTPayRWunW6rTaW5XiurJX/TirfOMecW4=;
	b=nQEnSmXoh/SITzFYcRdSAc1/HFY42xZKQu45ICsBfCu7UFEguLYpjJ15FLFyFIq9Ip
	vLh7R9omcwBNrcAtB20NyPcTjmeeXZVz8LzxZ4pZp7WScycGt6zLHGHdOoZTLYDAOClL
	7EHUYsCmxQgif+EXOlyxU/TBfVsiL23Khx/1gjLo/EwFMz4oUXQ6/wuiJhUrWOSbEWOr
	T4l8B8Uym1r2qtU5aP1jEsG00ig8Xps66rZqxZX44IpUqBCO6wHsJcCdQiFYd1fCF7L3
	unfi3io9tsLBmIFfF0BIp64uJuQ/YmJtm814IgYXPmdPOEFFuEaoSyrnlQjCJ7wPPqK5
	p2BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+chfm1R7UihTPayRWunW6rTaW5XiurJX/TirfOMecW4=;
	b=cI8WiQ9Liyg1tbps5yCQgcthEU0m/PdE2IfZAAyQfQHJP/u9fUSv9ubrENU5g19Toz
	+mcoq+nfYNVyijFSBaI+2RhYW/ZTr1vRHhPqgxJ0H4fWqLyofPsOr0wtMCAuQMnqWikm
	+PBREGPFPz4KdBJROdAQleVCk/Y0uwFDvUk366X3YQR56py2BIw8Tuw/2B3jtvXPxn5k
	Zdfbk2GvAtUiCcIUQ+Plglu0KqyWDsg/ZjZSHklFGRY1cGbHKCzySdavovNCsZcqgcMJ
	WXLDowa6OkGjnqwsLIPThKr9CRQzkQTvKki1zL7z32Wkl1k72b5KLpcbPTAEoLuyEpur
	TyPw==
X-Gm-Message-State: AN3rC/6pYoT7qmyLOIr+0Ng+3IFv5xNdZRkdxlCBQX8is9Lzs9NBX1dH
	fBico7J3oMxs1tOJ9l8o5dSNtyAFumty
X-Received: by 10.200.41.108 with SMTP id z41mr27050102qtz.68.1493073412423;
	Mon, 24 Apr 2017 15:36:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 15:36:31 -0700 (PDT)
In-Reply-To: <CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
	<CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 23:36:31 +0100
Message-ID: <CAJTo0LYc-Ken=sp55QB1sz78s30gpVYjOzuL8w-J5oZ4DjM0Pw@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 22:36:51 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 01:31, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> I see that it was the 4.1 kernel, which is expected to fail. I haven't
> looked into backporting gcc7 fixes
> that far, but if there's demand, it is something we can consider/look into.
>

There's demand in that the gcc7 merge is blocking on either kernel 4.1
being fixed or removed.  Your choice. :)

Ross

