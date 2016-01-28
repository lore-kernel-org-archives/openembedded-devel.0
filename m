Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 42F8977114
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 21:43:53 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id d63so52481280ioj.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2016 13:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QC41/1wdRKuRapE5IlvvLet1XNwDD+Oox5Ge+UvnVo0=;
	b=r+e81dR8H6DBFoKkzIBktQfZYdueGUI2DzsDwVnu6it5uLZKLIIH+4/ODOg7J7mmKG
	xFXf2BfKqKJbWSgZ3nqjI88lItndTexM9Q7MWJ3kW2J6XganISS+gKnfbPnINs/wPoLJ
	mWCuaWVicr7Ez3vuQsa+h6CPSTtsPGURzZosJNvux77+uzVkNDt2T+TX6Ptt8FPblSvq
	wn26U2WQ/HPxabUvFyRVlomqTeSi0Gb/m73FvQzkpd4DyHoE7ceuFer6OKnIbhhsLwC3
	aRS0bLxXX0faRegOdQj0dakR3nQ0ghxP8k1hCLngqkypsI7Dy60wkj7eL546DJt9mzUX
	Iugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QC41/1wdRKuRapE5IlvvLet1XNwDD+Oox5Ge+UvnVo0=;
	b=UCifBlblten4UDkHk60nbCuNVqmuinXLY19Npm77G4QasHNlkCMD8BoyF5Op/7VtYF
	9yztz8hzMwLkmM7Mv2g2xSBLe8mreS7R16eOjyFbWUFYXyr+PRliSinH1XFGLlxmUwGH
	JZsF0WiwAqumA6ySooL0NrbaaynTMeK5AUpHIZ7Aoq8OiQcSQ+0sui2Af7Qq2ESCvbq8
	gxho0zC+kaUvtaiskH41g+sWVAobOzQ4BZm8KT2Y0BkxYuoJN1hFSq6K03O5mDzx4zNA
	D5tjx6CDyusIoEVhXiYkdtF4Peq5NPr+9W+08m0Dtf+3R08L8Jdwacx4fbx1sKCu86y9
	LFYA==
X-Gm-Message-State: AG10YOQbq7vfibX4lMHEay/+An7DJ0inND+qWE2+DyMhgP1Oz/UfljAy487G+eGiISVDjsEAhXg3lAUgPn/gr++i
X-Received: by 10.107.135.104 with SMTP id j101mr7174361iod.133.1454017434312; 
	Thu, 28 Jan 2016 13:43:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 28 Jan 2016 13:43:34 -0800 (PST)
In-Reply-To: <CAD2C2VRqrrOKLixFBBXq-Vxu-nb5DzSXqV8Xrr2yuwb6auds5w@mail.gmail.com>
References: <CAD2C2VRqrrOKLixFBBXq-Vxu-nb5DzSXqV8Xrr2yuwb6auds5w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Jan 2016 21:43:34 +0000
Message-ID: <CAJTo0LbUkpF3Oq5FDXgizhUW6ANbwcyiTrrzZATBsZ_7ABsHEg@mail.gmail.com>
To: Bryan <just4tech83@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "Development list for the linux-yocto*.git Linux kernel repositories"
	<linux-yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Chander.kashyap@gmail.com,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Poky Project <poky@yoctoproject.org>,
	bitbake-devel <bitbake-devel@lists.openembedded.org>
Subject: Re: [linux-yocto] Plymouth support in yocto
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
X-List-Received-Date: Thu, 28 Jan 2016 21:43:55 -0000
Content-Type: text/plain; charset=UTF-8

On 28 January 2016 at 18:01, Bryan <just4tech83@gmail.com> wrote:

>    Can  we integrate plymouth package in yocto  so that we can properly
> display splash screen on different resolution monitors.
>
>
http://layers.openembedded.org/layerindex/recipe/39966/

Ross

