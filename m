Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1676D748EE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 20:42:54 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id z8-v6so6739880qto.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2018 13:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ok+8Z9rcTkgEw9yiTkwul0Ty9xVC23r715M7SS6Q8w4=;
	b=biRocL8r5aVR4CNRCF9jq1AT+G6GjoMsuH/9Fb5zVRKJqa1LJew9iL2O9jMHDKv4jG
	VWeW3rPDIdhjSSFz0Wyw2XUVHQ7wV704znHl2UEM2EbU2OLFY3kHwf40XgcqurDjARa9
	c9vpwi4Il0MfxT9IremQkQgnrd2PiOlq+X33N56Z/lsbJvUN/Ucimb9VE8kcrB3kr2CO
	vhB4uHiihq2NZktR5VeGJD9msUDxT5xXwLh05N6PxuBsLBUnPDWngAKZgl0IA2ALy618
	iyF7GwzqeKd3wJqiwmGLWTf5OLeVxm4PFnBemuoSMoLWSCeTXplpGJ5CFgFg+1/C6kV3
	dsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ok+8Z9rcTkgEw9yiTkwul0Ty9xVC23r715M7SS6Q8w4=;
	b=nvyVNKdfJrI/qAM1DDHySVfDHfKgLhRpRy46CJYkIvZgRPMscrGnQtwnXXAT8RsoxU
	Ul6LTJWzSYF4t8XZSogr0wzyHiYtOHJSxcadQfpujrZ+M4Owh27QguTry5JqE9uOwogj
	6TDtuypAn4ZrCO0MaAWX5soYBLkQkkSFh9P5iFtlatEYeHgTfATVaTEPQwWED+d+tgqc
	uIZnlw9AZDKqvG949J0wkibIFupXb2DeFFYDL3L++xJE1AH//B1Bd9qk0RiX6brDrE42
	0w758bCm41RRG94HfSi/D85ZXxaEHV7MMb47THhIEDrnFV532CJrrF3hUkvQ9SHMyi3l
	knJQ==
X-Gm-Message-State: APzg51B6Ad+zqNb3j0+rCzMxbA22mq4sIpWjze/uJStweBsk12R8KGma
	sT0XcR16yALTKvSd+sQpS7Z+mDzrV+RfFg6r/B8=
X-Google-Smtp-Source: ANB0VdaOgskBOfuogj33rd7Y7EEqwfBmJ4/Fsp2mq+FxJzm06VEIZZ6mlTUhkimI4tiZtvIyDy27FeG+4oPx92LN/OQ=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr6505319qte.218.1536871375644; 
	Thu, 13 Sep 2018 13:42:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAFeBWL4q3Ug4jP6uj27jgh=A3y=NK1AeKt3cTnUmWj+Vy+Jewg@mail.gmail.com>
In-Reply-To: <CAFeBWL4q3Ug4jP6uj27jgh=A3y=NK1AeKt3cTnUmWj+Vy+Jewg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Sep 2018 13:42:28 -0700
Message-ID: <CAMKF1sp2mF-fmSoX4iNYYMwmm9U3oAGjgaQPDu0jp=+LwpdnhQ@mail.gmail.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: UART keyboard as /dev/input?
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
X-List-Received-Date: Thu, 13 Sep 2018 20:42:55 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Adam
On Thu, Sep 13, 2018 at 1:38 PM Adam Lee <adam.yh.lee@gmail.com> wrote:
>
> How can I get a UART keyboard to show up in `/dev/input/`? I believe
> `inputattach` was the tool that was favored until some years ago, but it
> appears that it no longer is being used in modern Linux systems. I can't
> seem to find the replacement for it, however.
>

You can add recipe for https://sourceforge.net/projects/linuxconsole
and send it for meta-oe layer

> Apologies if this question isn't suitable for this list. Feel free to
> suggest me another list.
>
> Adam
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

