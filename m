Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 234FF77A41
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 10:30:10 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id m36so109304937qtb.0
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 03:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6NPDTeYnyjeA9YlrLlavO24zaAu3u+RJqxKQfuRfDKE=;
	b=Quxj4+zxKQEyVNlDsRUOjigNluGZ2aaLf0sIoVUXlDcJ34Y9433jDoNEceJEXZIWvk
	J4LHoUrqmdCpcvr4Rj8JUIc7WGflNlGnEm+c8HcOcCnOgTqY9IAQQF5B0geuKB0IRTFE
	yk0OkkXyFBWQ3iubumYswNTjrfk/QrCrqCZiM2yl8vLXumlm923uVm/VSTVfWnvkwYEG
	uZCS7Ki3+ykafdFQDmnmAcaP779FKLSrhumlofN8zdbWXzrJDuyr21suqhh0ROE2Jimc
	Hqt2iODMnWEYRfIQl7wffAJediuf6I93qXjVL7NT/QI8tgCaTSpkXYf9bXkFgnyHPPL3
	BxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6NPDTeYnyjeA9YlrLlavO24zaAu3u+RJqxKQfuRfDKE=;
	b=PMbEjj3BW+PCchJnzAcdBQJhjisDG53QzU8cM1hI60GIcmQRhbinLOmOj8FquCe0WT
	Bx7hdF0h5CHAc59F/TpDIxmUyA206p/Dk+LUEfT29vUmAJMyh0aoPSckzJnCRYiAIL/2
	m6ITIuUYezCt252vAuTgIY1Lh0fFoG2MEY1rQi5iO4RS34OmB4IKnAzevWWn4NE1JRKJ
	skow4MoQIcnnG1oFDmX9G5phWtXWK9qiEsLzCMvIReGouXu2C06JYPUPP7v/Dv4v9x+I
	XyZcVY5IgG96cacovVV21OpLP0cziObnt7TKriB482MV5itWU7l0xcsMhVHVV5RslVaG
	GibQ==
X-Gm-Message-State: AN3rC/7Jw1AjzHHDcMjXaiuylSJ8fGWmUPCT7VPRN9r6ED/TaI3+mOg1
	nRqG63CWjjdy4bTuLxGoU1dN7gSFN4OL
X-Received: by 10.200.34.242 with SMTP id g47mr24297300qta.109.1493029811817; 
	Mon, 24 Apr 2017 03:30:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 03:29:51 -0700 (PDT)
In-Reply-To: <CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
	<CADkTA4OgpwhRtmR4+4kurnhBUQoap3E3kKoRTe4fNMBFOEp8hw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 11:29:51 +0100
Message-ID: <CAJTo0LYc7nRX2zsPJkP3ZdmnenBxP=fCNUbc_H6L1vePDHjn_g@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 10:30:11 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 01:31, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> I wasn't able to bring up the linux-yocto one .. but the 4.10 linux Yocto
>> should be at a high enough stable
>> release to build with gcc7. So if there's a direct link to that error, I
>> can take a closer look.
>>
>
> And sure enough, after I sent that the error page with linux-yocto finally
> wheezed in.
>
> I see that it was the 4.1 kernel, which is expected to fail. I haven't
> looked into backporting gcc7 fixes
> that far, but if there's demand, it is something we can consider/look into.
>

| kernel/built-in.o: In function `update_wall_time':
| (.text+0x65ecc): undefined reference to `____ilog2_NaN'

I'm getting that with 4.9.15 from meta-intel, should I be telling Saul to
update the BSP with some fixes you've made?

Ross

