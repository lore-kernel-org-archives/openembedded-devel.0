Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9E364788A1;
	Mon,  8 Jan 2018 16:01:46 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id r8so10412365qke.6;
	Mon, 08 Jan 2018 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MEwkl84lWIgjitaF0ESDw2rBsVUPlwF37A9m7Gg5Feo=;
	b=mhNC8Du2WJGzwWHwGnwBQF0yy9tAbD9ygE6lYsQEhM3r27N2ZIbGu0BsT8mr3vPric
	mNPLCfjD3oPmJGh8GT7a4PkyUSiyMNnvflO/aIvwNAsYMezcdLsnD+OzlSvy5ApwprDt
	GQ9gmoMfpUu2s9oF4dGv7Kbw3V97wGO46lne6srZyqbqHHo/aHjZjF3tqrhNybByc6rq
	kP1v/6JmMH9qJoMWdbFvfh2kiY/7pkY2m6ca8GaSb8Hho//LMfluAezDHNA5wM6aCXnA
	KiyfG0LUmbew12u7/M+EIIYERyuFWCb58TIMHZfma5rOkePHtYBcXa1qnSKHWl8WC7ox
	8IlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MEwkl84lWIgjitaF0ESDw2rBsVUPlwF37A9m7Gg5Feo=;
	b=A0V7sVQ9vcaJpX+VKgKSXPswEEARrZk8KUJPADwd1rDWyHdTmB7UgcKxW4feYJu337
	NRPh3n0JSn7XlyMktmpRkzx/8TyLOXcXFqdUlxV8BtE8HpNMXPAAdWzhEbw2cDXsWmaN
	ORFMDeZUXj2Az5iVvrq/c1xu/TkyOi0KxeCQ1w4YPdrqQuUpjrd5n+24bgRlI87BlC4H
	sX8BKx2P90ax4zbCklz5JqCFxEQjlQv8QayNYq/09ISIWC/Up739w9mxHmiMMwSx33gl
	6ssd9HbU6RE+TQZiPXk/L+1Cth3ca7kn4SKk9x+SpqhSpXXQOkhbDzVojEYu5bvEf47h
	xzxA==
X-Gm-Message-State: AKwxytcexSkTTGXFo0A4ZVc8YmxkT14JO7O6dKORi0oUoQDMpgQTdKbo
	cYu6uVJ0udVml0EkJCW6/l0i2qzJTzDBHX2yZl0=
X-Google-Smtp-Source: ACJfBounI1O3Aqp97h+ToqVq4Tb52sjAswMREYw5FixJC6wvZX6o0Hy2bKCIyQ9gX2rqoc7DEThNMAqWZUlwli5thdA=
X-Received: by 10.55.200.148 with SMTP id t20mr16379486qkl.141.1515427307711; 
	Mon, 08 Jan 2018 08:01:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Mon, 8 Jan 2018 08:01:47 -0800 (PST)
In-Reply-To: <161986bc-e04c-3cdd-c744-5cebff1d4fb7@gmail.com>
References: <161986bc-e04c-3cdd-c744-5cebff1d4fb7@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 8 Jan 2018 11:01:47 -0500
Message-ID: <CADkTA4M_b8e3d3bRCE+jY44F_atCy6ej51wdVEmFKE5y12nKVA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Yocto vrs K.O kernel, wireguard go Boom
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
X-List-Received-Date: Mon, 08 Jan 2018 16:01:48 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 8, 2018 at 10:08 AM, akuster808 <akuster808@gmail.com> wrote:

> Hello,
>
> Wireguard in meta-networking is failing do to compat.h issues on newer
> kernels. I have updated the package and it fixed  my problem on 4.14 K.O
> kernel. Now I build it with the Yocko 4.12 and it fails. It wont fail with
> a 4.12 K.O kernel. The is one commit that was backported from 4.13 K.O to
> yocto 4.12 which is causing the issue.
>
> random: add get_random_{bytes,u32,u64,int,long,once}_wait family
>
> 6e4990d8d226e1861a5a2b632cf93bc70feab3af
> <http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&id=6e4990d8d226e1861a5a2b632cf93bc70feab3af>
>
>
>
If you try the 4.9 kernel, does it also have issues ? Either way, it is
likely just a -stable
fix that hasn't made it into our 4.12 maintenance cycle yet, and that is
something we
can fix by adding anything that is required to get things building again.

But knowing the 4.9 status would be a good data point, since I have more
-stable
updates queued (and not sent). So if it blows up, and then doesn't with
AUTOREV,
we have a small set of commits to look at.

Bruce


>
>  I know Yocto is maintaining the 4.12 beyond the K.O release process so I
> don't know if this a kernel bug or if I need to come up with some other
> solution.
>
>
> regards,
> Armin
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

