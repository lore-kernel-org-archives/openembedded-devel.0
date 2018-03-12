Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id 742377198F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 20:29:04 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id k40so3080793ywh.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Mar 2018 13:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sQpyASu6o2VIh7FJ2axfQg1nnDk9LKAvewHDwx9aUP0=;
	b=gGoBKjeEI6yAOlB5BeILBUPWe6xZZCgv1UiILYhfsF0lp+Ynjxixqc1HBG+RMjoWsB
	MY35Y9/fAFTIrCFkeyFdB3JMLCjEZE4GrV9myCKHlMOEK+ur9cOUrJAKVXII28S0Trs5
	rFMktkVoksWodgtUSidsjCsBKVaXzExz/Vk+ejhj1dluT00mfTdQ6nKSYYIcXlT68JYC
	+0Uu9SHG3sQXmjgk6gOyvVmmK3zbZYsspetpJAStzcs2z+iF+5IakHCY9WaVtIR9cCGW
	kAK4DgJ5KPda3mgTgb/pbGENA/xczIZx6rmMMvimznVK+htYMG39r0rofnv59O2mG3Y+
	WTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sQpyASu6o2VIh7FJ2axfQg1nnDk9LKAvewHDwx9aUP0=;
	b=Hrpl3POI32nVVLpcm2LOpuxzyF2CSKUCBOCGIt5pu71jBYwE6tWo0ZUvBtCh+89rKJ
	zdZJcFXtYxBkW/LkO+TTnJaLuJAi0Xse23kg2YcGuLyXUiJx2+WH7Y9fHIs2p+XCvBY0
	UKTuxZmi4fuX1SX9V0KbwoR2UuG2l+VJY8PVbMLiyU7keSHROTXKXgA1/7YTFzrE9KdA
	9yoCl6qwI6gYLt54k8b5eisS1tYE2H9+l6GNv8OhR/qcWprf+I9i6qIusDmOXaX3z8ah
	IkLj7Hs2by7ZpJzlKJnckUMee+jIL8pL1z0Rr8bE0rWIjMgcpmss0+f3Ek2e2qS4Zzj1
	c+LA==
X-Gm-Message-State: AElRT7FaEGimYAt6t1AboTNgI/qQJVSBkx7d37hSGk3HQT+s/aKbqZni
	fl4avyvVWKwGslsX1KhUknbldLY5wC2rdfpX9s8=
X-Google-Smtp-Source: AG47ELtqxwTuVwjc3t2/q2ZwMIKLmcgyMAy+5FOd/JnTxP9GKbnK4YL43tE6d18ow6kFWXQYVwAb9YBkPuY4d/AUy/M=
X-Received: by 10.129.175.86 with SMTP id x22mr5589739ywj.158.1520886545520;
	Mon, 12 Mar 2018 13:29:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 13:29:05
	-0700 (PDT)
In-Reply-To: <20180312181226.GA28033@linux-uys3>
References: <20180301230148.2284-1-schnitzeltony@gmail.com>
	<CALbNGRSZrac1fEjm-=T19_wUHNcAp=n80KY8hcAWfwgV3QDv4g@mail.gmail.com>
	<CAHUNapT5Cr7LVZsT9c70mtEvGg4tTQeNpqyWyeuDrmxxLL49Qw@mail.gmail.com>
	<20180312181226.GA28033@linux-uys3>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 12 Mar 2018 21:29:05 +0100
Message-ID: <CALbNGRTbLR9bt2jkg5-BcRHuxHqKcrS4VKxKxc=RZHf8vrBsGw@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/12] meta-xfce updates + fix
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
X-List-Received-Date: Mon, 12 Mar 2018 20:29:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 12, 2018 at 7:12 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Mon 2018-03-12 @ 02:07:53 PM, Trevor Woerner wrote:
>> You can monitor patchwork to see the status of your patches:
>> https://patchwork.openembedded.org/project/oe/patches/
>> In this case your xfce patchset is listed as "Master Under Test" which
>> means it's making the rounds in the various "state of the world" builds. If
>> it passes those builds, it likely gets in.
>> "State of the world" builds usually take a couple weeks.
>
> PS if a patch doesn't move from New to "MUT", it probably means the
> maintainers weren't able to apply it cleanly (which often happens if someone
> else has submitted a patch for the same file before you that ends up messing
> up your patch, even though your patch might apply cleanly to the current
> master)
They're not in master-next so I don't think they are included to world builds.

Andreas

