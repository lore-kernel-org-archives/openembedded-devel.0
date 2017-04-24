Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0F7FF77A49
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 10:52:27 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id u75so16133460qka.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xTuYtdVezjCJsBU5I2Kr7+gT6G/d9Fpo/KkKckjoIbQ=;
	b=Rxyz7gYYk7TxWjR4RlRc4EPKBCuEs+ob4u7qJuTdW97R4ifCsgSOnBU7ma99JmZnBP
	Gi9WhiKsHo6gON/1TAlonj++JzVU4L/FHE0UFoOgbNvcX8f0hwjbQN2XbdjGEpWynHey
	06Xg5tedIS+4zHy1Eh5eXZMfXj5CD5E2wuso3ZUyVcFjyQZU6LoppfIP7pDzvJ+on/Qo
	5Hyp53TwtJAFCXvkSRnoxtiGLEhihFnCFzRRxMTpLeyOGPNY0qPt/h3JNA/ne7rfygCJ
	wmQe3RYUDJkEvfFF0OyqJh9DUXXgOpYABWN1LGXPzh6md2dEFUsMgc6v3ME3YVk4wIOL
	SUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xTuYtdVezjCJsBU5I2Kr7+gT6G/d9Fpo/KkKckjoIbQ=;
	b=Abkh5NdtxSdTxUvneUj79JwNzA0bT76nqSkIb0TAGmwndmTYBNwBdLaFAina2aaTZ3
	nmvj9wDvoI1vneyme0WBf4qV2oySWhRd0wwJPvw/J8FjwTrBOyFLxnxYjsz/hQD+pFIr
	lRbzHvVoDgjkpEI+syphX7P7gqumd+Z4ieQ08QvzjstaKP4KxhGF4DaTmREiylkF3UEL
	ryVShGtHYDKINvhSFeKVpoXBNMqZoLzKiyGKH6c+w3malqI0MG+apB9wnzAzXJw4917O
	xAmiqZ+Vqb1Qpkp3Y9kazt8DDrE+JfqIpHk4xr3vSJOEohwNZj4rZ405g7LoD6QdtumT
	LEfA==
X-Gm-Message-State: AN3rC/6Z6Ii3XAvst4lT4k4geqUSmvwg6m/g6W3005kCssWsyrO71WQu
	212PgS+iuHFJJU+ypoDVrJka1fbvd6xW
X-Received: by 10.55.40.41 with SMTP id o41mr26106269qkh.3.1493031148954; Mon,
	24 Apr 2017 03:52:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 03:52:08 -0700 (PDT)
In-Reply-To: <CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 11:52:08 +0100
Message-ID: <CAJTo0LaT_7RHzG=2UyZ=Y5W=XCCWGq_P_e-E0jO3jteyhVMF-w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 24 Apr 2017 10:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 06:45, Khem Raj <raj.khem@gmail.com> wrote:

> There are few other fixes that needs to be in there. glibc and gcc recipes
> also needed some fixes. I have pushed the whole series to kraj/master
> branch on contrib repo
>

grub is still failing on musl on the autobuilder:

| ../../grub-2.00/grub-core/video/i386/pc/vbe.c: In function
'vbe2videoinfo':
| ../../grub-2.00/grub-core/video/i386/pc/vbe.c:882:28: error: this
statement may fall through [-Werror=implicit-fallthrough=]
|        mode_info->mode_type |= GRUB_VIDEO_MODE_TYPE_CGA;
|        ~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~

https://autobuilder.yocto.io/builders/nightly-musl/builds/243/steps/BuildImages/logs/stdio

Ross

