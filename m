Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 9601077A50
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:47:32 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id u75so15069036qka.3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3mnf19FLvlG/IaqPMiDD2ubnzbzU5evfWB0kAdymzXY=;
	b=Qyx1/FPP+NXMpdtLCHZIu4XMefkcE6pWU8aOo+wxI6N7wLADMwvXWDy6N8oRfJi1Di
	zHnxUV7DUOSE7ZZLGbk3iFColmTHTkdwsBWuZvnZDgB1bjqEb5HgPTNn9IPhq3+TQFJX
	muyY1q6/OV+UWvD87/M+DJU+So0+Q7HKYpZpMov3xhMsSGPEGUMrSeUz1GCxgPXJiMqz
	jtWFMshcwE19W4zDgTfOv38l4fcQAfteOzBWheY3a01EupKRnV2HRSohVdvD1NxFq7Ge
	1dNc12Mmmy2vuShNZpZXa5wU8wqP2XGhFeAXQGMge+RqOt1ErbGAZsyvjZCvS4dUCOEO
	XJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3mnf19FLvlG/IaqPMiDD2ubnzbzU5evfWB0kAdymzXY=;
	b=pjebQoy9d38+9rZyyp9AxAH5kTOdYxlkdrpSBmzYyr6UNuaRHMRdPsAHMjIBohMYDb
	ydE7pVsG5QwUJI9JNZzKZz0taXpsHWwIivKCYefQH0q4gVql9IEDw4/BGMF9KTN5kGaa
	/wmmUEdtTY9veS1i5tlOS6hgGRzMIloC/olSItToT4lGZ45E/8cfU5HeZ3d/dBWJAFrx
	70pqe1BrgVHvm8Ksrvu5F0Fakkh+kzIYc7xbMiGNKoY4XL02ejVUKeVf15u1oT/kdCXH
	930YwAEv4XbjSL4xof2cQbPeW3OAFs7EvFrdIAecVn9b4UJ6wl1zgClE0D3RPu7lO4bf
	GodA==
X-Gm-Message-State: AN3rC/4Kuly0dluCM28r5oIQR88k71NuMTOL1d2E+acG4xfxfjLnBsPt
	FuhITpetqStwmmdE4aMlODTjE2w7t0lL
X-Received: by 10.55.17.224 with SMTP id 93mr22053986qkr.244.1493027254196;
	Mon, 24 Apr 2017 02:47:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 02:47:13 -0700 (PDT)
In-Reply-To: <CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
	<CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 10:47:13 +0100
Message-ID: <CAJTo0LaWkRxjaF4j1HHhUqFDYYTmGADTuiLo8zqPwR+wKSbY2A@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 09:47:33 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 10:09, Burton, Ross <ross.burton@intel.com> wrote:

> All merged, I'll fire in a moment.
>

The updated glibc recipe doesn't appear to be very happy:
https://autobuilder.yocto.io/builders/buildtools/builds/240/steps/BuildImages/logs/stdio

Ross

