Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id D1CFB77A2E
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:10:08 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id m36so108043538qtb.0
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 02:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H4+PUM7njEgtRmTiHD2PYpmZdk5vWWwfhXxAYGycgdI=;
	b=MhCmd7NSQ2Fi9vIgqeuB8V7w2WjOrOxHhlR/hu9M5QXXtx2yxIT/lAS4aiy1XjSjVl
	qxqdFIDK5CXWQbkncEkYmJNR18aPazAC3onoOGtAJpzEHeA4+sfAq0nVYoRkfkSCva9o
	v6SQNZamjFSSE12+9QnWJyamdGxjOycHR8wjwFBBIpYDTFI1edp4luWdLaap1IxuFLRl
	hW9b8FdCxY55ysVUzGX6cO4HPxOMTq8b9Dr/RzKOSlSRJksAoOt4yD6xkqQY5vaY7CTd
	UrZOORk1jxJ3+qdH3H3HCRFbWId+WCYKKELzfORsIGQSzW6ijeLdcDHRnYNY9v5/htKr
	oxTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H4+PUM7njEgtRmTiHD2PYpmZdk5vWWwfhXxAYGycgdI=;
	b=AV2oNs6aWKr//TBoD+7eZOn1Gsua+XI/M5TZLQeh3QXiyImyboHCuup0C5GbncluTc
	HPmWzSiMe2bd33NzGLlXf0080u+ouBe61ikBJw8CajPj/qJZ55VJs2tybqZW9H0VZ3FV
	yTU1bqovYP8xvmEtf3bVvW+aktnnfY7sB/KWz8Ye6n+eSaAaBQSYslXKJvGR7mIWAVJv
	Ip0OLR17T299SQCAHn5SQV1plzE6JQ+c2X7R95mwJehi0z5Ip/9uM43QOi8HSMcb6rdF
	gwem3hSR9s5cX0D0LbYUZU6AsQlzBHq5PCRrAkeUqkm3FZzsa9Ez5ZRHDqN7Co4Iv4vs
	/hIA==
X-Gm-Message-State: AN3rC/4iWievCOMc94lUIvu+NhHyWH0K4A6Sid7hKRM2tHhg17FcM3vF
	aVP1IsCpULzZyViDoSQzj92H81xTTbZ6
X-Received: by 10.200.46.26 with SMTP id r26mr26701948qta.197.1493025009433;
	Mon, 24 Apr 2017 02:10:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 24 Apr 2017 02:09:49 -0700 (PDT)
In-Reply-To: <CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
	<CAMKF1sqfvtQPWN5Yuz3RPYkXpneS+XWcYmit_=bcvKGo3_hx8w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Apr 2017 10:09:49 +0100
Message-ID: <CAJTo0LakaSZhJodT2KQx6u0TEaBL5Ruig3oOdfrtCzQUf1cxXg@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Apr 2017 09:10:09 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2017 at 06:45, Khem Raj <raj.khem@gmail.com> wrote:

> There are few other fixes that needs to be in there. glibc and gcc recipes
> also needed some fixes. I have pushed the whole series to kraj/master
> branch on contrib repo
>
> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/master
>
> give it a whirl again.
>

All merged, I'll fire in a moment.

Thanks Khem!

Ross

