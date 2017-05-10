Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f180.google.com (mail-wr0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2C0EF71A75
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 May 2017 05:47:26 +0000 (UTC)
Received: by mail-wr0-f180.google.com with SMTP id l50so27457495wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 May 2017 22:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NOQjBErl3ccQsZgoLWWswiK4fIKvyx/EmBH1OxJZ7WM=;
	b=JxRKfwjqCmDV5eo1JjvXVh6GltvDBHPhYx2AodfEMSbkXebg6D0cbnbOQiNoDPsaYW
	gpkTaUccej++5eXFd1xLT6NtivQxuMLDEybRr/yDjf4b4ufw0ZUtOMAkS2wP7yfuGawk
	a8fc8Dkk2CaYgMDETghssOtBigUsa5M/8HTrUqVCszgdPCi28cI78V+QmZbLPmK+sHTs
	tjaTiqeALz5b28Qox5qo0Bof3gFQdHbDOVU1hW9sF79pmgyF85VdpieLsASsBc7d8DB3
	QBHDlBNTdkcSGLzdJcbp4RjyYsnMn8CTGgER5n/GjI5CRZKKmLDInwBJW/xBm+YgqJ+h
	Jkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NOQjBErl3ccQsZgoLWWswiK4fIKvyx/EmBH1OxJZ7WM=;
	b=h7slRsvuWhoMr8Fac3MLfAqryv3aHda9LJNl+m8xg62zfkKq+n0uM5P//EnNdS63DX
	Espg7W240sgFZISCxwW52y1W6RGkX1vAEEzi4XXuPDieuEo/nN9y1XuNk+6Gbk+MrYeM
	uRIxNZCGMgt5EjzoFKqeyC2f5cSFc7wRCJmb6WoJKs0uaLFpV8Nqv5UfR1/GrST0AGWj
	eZb2l5Y2y4w0Ya8p+kqcY1LMc7DLEDVdTuOz16vjA+JwDyw5rF/mEsUCf1GCXnVbRnXv
	XMinPZJbmCpPxkCQW4CL6ApwwaD+GSCFx6LbRCR8oY+vqfLfkKrscf81op/oK+/mX8xI
	JYrw==
X-Gm-Message-State: AODbwcAIkf1tKXCPsKCoBTc2q+dqz/6e1D7rnLNHnLCE+XNn3oahhB74
	KP79seOoBKpbO3oSYLu03HDR7e0SBQ==
X-Received: by 10.80.182.50 with SMTP id b47mr2826859ede.123.1494395247837;
	Tue, 09 May 2017 22:47:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Tue, 9 May 2017 22:46:57 -0700 (PDT)
In-Reply-To: <e9ec2489-e51f-222b-a4e0-2f537eff1e7d@siemens.com>
References: <e9ec2489-e51f-222b-a4e0-2f537eff1e7d@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 May 2017 22:46:57 -0700
Message-ID: <CAMKF1sqbD4106u6rkQUTkAyzhqXyR6yMMByrLqFVyZGAS9KeNQ@mail.gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-java: Building openjre-8 on a non-gcc-6 host
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
X-List-Received-Date: Wed, 10 May 2017 05:47:28 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 9, 2017 at 10:34 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> Hi all,
>
> seems like the current cross rules for openjre-8 at least break if the
> host compiler < gcc-6: -fno-lifetime-dse gets injected based on the
> cross compiler version, which is 6, but is also used for the few native
> pieces of that build.
>
> Any suggestions how to fix that properly? I had to temporarily redirect
> my default gcc from 4.8 to gcc-6.
>

see if you can check  -fno-lifetime-dse options is supported in
Makefiles before using the option, that way you can ensure that its
only used with
compilers which support it

> Thanks,
> Jan
>
> --
> Siemens AG, Corporate Technology, CT RDA ITP SES-DE
> Corporate Competence Center Embedded Linux
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

