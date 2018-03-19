Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id DB89678945
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 10:47:20 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u46so4047877wrc.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 03:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mPj7eXrBc8feU/8UvTbwKEdsUCd5t7/nxrtQ3SMksws=;
	b=KWBepK11hJVOVhBoiu2BOLcNoEh2T9AEfzjFBGfpYjCqUcqAg+WrVbwFb/IeVONKH6
	5utxEwhZk4pHc7fOM26z2l5uMu2CdK4VceGg7xO6OBQjEyfxtv/NVjKPbllkEsVRbxiV
	R5nPA7GYJcNSDV8cf27PiKFmcbH+DOd/sV0jWiuXJ0FCTU6VQJtcSeU40VLcxMNTntHK
	6FjEq+KDZo/2frOe2NfkPlsJt/BBj6dFAxEZfBWlRWP+zb1Z1zCcdxtM5wDy0m/Yzhse
	Uw+s4FJMiCIGMDT3sUS84rbVKKa2lsslp6oFc3vbAs0rvrGQ2BPT43cuhGkr5ozgRrP8
	qFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mPj7eXrBc8feU/8UvTbwKEdsUCd5t7/nxrtQ3SMksws=;
	b=Dy8foYT9tHIDsSRveX+5BRXSTUilogz2OVqiMIiA+aiZbG2imAXB5DLq2Kal+rpw1U
	G/L2NF4QOy7I7uVP+2qt9jHxNCMfGhOq3MxVVwUtItAHeYtOMmVagP/J7dO2vW3CuKaM
	EPV+vo3XHrC08VdolNN2XH7cwq1nVI5FlUEgYRDDYyUH9eAMMNS2Hd7BYNm9aekDJB2a
	JaUZLHGIA1obt7CFJQNDv2yTcJI13IwSu0eAqSxOCMpNrTBwvtdBFHxqm3LGKBP97CAr
	dhXp45ebFm7i6rXGXulN2qvmEU1pn0duGbg+uW/MIXiVAUytEunuvLICt0opbhb7/bfZ
	/N1g==
X-Gm-Message-State: AElRT7FjvHRCERLZVgvggsJIywEgWu1stIvMKkZZxSHHIShbMxK3z6gj
	KWXOV7iCqr4YuTHRe6V+BdvDqqPQB1/P2IzukHE=
X-Google-Smtp-Source: AG47ELv88ZVtsj0j8vSKLoVsbuoG3BhcvLkeqTUG6cfcqSbb3by3bE/JVbq7mkcQxwMJeGmuOyVSlqrfuPuzQTvDbZE=
X-Received: by 10.223.146.230 with SMTP id 93mr8583463wrn.241.1521456441605;
	Mon, 19 Mar 2018 03:47:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Mon, 19 Mar 2018 03:47:20 -0700 (PDT)
In-Reply-To: <CAMKF1sqJhAeFwH22g-0CA0T1=i_fg6CTQym8xBCYefw+vfSRhQ@mail.gmail.com>
References: <48f2945a-e330-4bc8-a4da-ab970b63ea5f@gmail.com>
	<CAMKF1sqJhAeFwH22g-0CA0T1=i_fg6CTQym8xBCYefw+vfSRhQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 19 Mar 2018 11:47:20 +0100
Message-ID: <CA+chaQfh5zOSjGMTyDQdQSkMb4aCUOqHGTs=H4gM2QTQvDWYmA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-openembedded Layers
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
X-List-Received-Date: Mon, 19 Mar 2018 10:47:21 -0000
Content-Type: text/plain; charset="UTF-8"

> 2) I plan removing meta-filesystem and moving recipes to other layers.

I don't have a strong opinion about this, but why meta-filesystems?

In previous discussion there were some requests for smaller, better
manageable layers and this one with 19 recipes and only dependency on
oe-core and meta-oe doesn't look too bad from that POV.

If you move some recipes from it to meta-oe, then some people might
complain even more that meta-oe has too many recipes and doesn't serve any
specific purpose.

Regards,

On Sun, Mar 18, 2018 at 10:38 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Mar 18, 2018 at 2:32 PM, akuster808 <akuster808@gmail.com> wrote:
> > Hello all,
> >
> > I have been reviewing the meta-openembedded sub-layers and I plan on
> > taking the following actions:
> >
> > Please keep your comments focused on the 3 items below.
> >
> >
> > 1) I plan on resetting the sub-layer maintainers. Several maintainers
> > listed have been inactive.
> >
> > If a currently listed maintainer is interested in continuing, please
> > send me an email.  I plan on removing in-active maintainers in 12 days (
> > March 30th).
> >
>
> This sounds like a good plan.
>
> >
> > 2) I plan removing meta-filesystem and moving recipes to other layers.
> >
>
> LGTM, this also means some changes in external layers who might
> depends on this layer explicitly. I hope those layer maintainers will
> take needed action.
>
> >
> > 3)  Meta-gnome, I have heard feed back regarding this layer. Does it
> > make sense to remove it and push needed recipes out to  other layers?
> >
>
> Agreed here again, I have only fixed this layer in past to keep it afloat
> to
> reduce compile failures e.g. with clang or musl.
>
> >
> > I want to get any restructuring done prior to sumo release to lessen
> > impact on the Sumo maintainer.
> >
> >
> > regards,
> >
> > Armin
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

