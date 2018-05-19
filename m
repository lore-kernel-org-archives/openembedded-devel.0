Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7CF91745D1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 19:35:48 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id h197-v6so18576688lfg.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 May 2018 12:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dKyXtOAYZa9pyzmvGXCb/idYKn2yQNodMUKo99v7I4c=;
	b=hh1kK5+0RvRQ+yD1QU5ELHkjAfRbkMjcvfkuCHrR/3FqRsPuUynDwr80iOQVFV+TE3
	0Vcn9nzYagZx5RMtMxgx+pHSyWPRYON6T+MmNBlSne2n+jOuwn7JLOyK1Pju2C/GEszA
	eBdidKXH6jUADqSotKK756QO+CNcKDZV+KpZ116zYrG/ckQbPMJd2rxBB4XKudOCzpTm
	dg/nQ9ZpkrjXy2P2ZFyA6lkx2Wp+pV81Rnumgw1VQDBMenbcDq3lD9kdRLKukSswemwu
	BsIXCsrZCKmk1UKIqSNM7qk3daz8vJ8kLdqyk4By/fF/xZvgDBijPkaHi74m+4M6V/F5
	lmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dKyXtOAYZa9pyzmvGXCb/idYKn2yQNodMUKo99v7I4c=;
	b=WpNL2zvpIgY6+wZ90aUncEEnYcTgGtD8BFRuI24L6twfsSx75H+4Q79yCEOsscctOm
	mEao3ZsvqCqzGO8OzOYMJO7BmN4wPBHRYpsP/BS9GtUblqGaT1n6jsqN3ME+pXJGd/Hm
	lTmS+hq8bdDcxivc25f+MBg/F6OJeRLwox0GSZHS+rsQ8/KYl830yGvwt4coRHxWCoYO
	kxqLa1T0BJTt0s73SAfkjYrEOZVjz2xodir3Rkapw82gCWAcuLEBSWIHINhxVtBfdYZS
	kOz/q3EQo/b/3ljTXkGtsh4U0nw+PGtJHCURolEuLvtyrGm1bacHgUxP7A4DUmLUvrLG
	D6xQ==
X-Gm-Message-State: ALKqPwfxxkiyWnfLW1y7P/CiTCZGpHRh2Pghh/gtodNHHOe7XpefzqGd
	vxNHd0W1aGaenHOTqU0aTUycDgBEiL3kKIfW3Kk=
X-Google-Smtp-Source: AB8JxZp2zgmfnDo/4OB63fQKkgAkWyXpRUxQJqSRwZCbUeH2/ZdSHWvEaUOqgi8Y7+d4s2G6ANSXR+/cD/pwGSKWh3Q=
X-Received: by 2002:a2e:594e:: with SMTP id
	n75-v6mr8301461ljb.139.1526758548638; 
	Sat, 19 May 2018 12:35:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb48:0:0:0:0:0 with HTTP; Sat, 19 May 2018 12:35:47
	-0700 (PDT)
In-Reply-To: <c7fbbf37e1ff4631a0aa3b45c07544a9@XBOX02.axis.com>
References: <1526607046-8081-1-git-send-email-armccurdy@gmail.com>
	<4f227bea-48ae-8126-8326-7b51b4bbc5d1@gmail.com>
	<CAJ86T=Uey--sM3RS85duoaMc0EQi-+q8C0KPCj5xgBC0nMB0fA@mail.gmail.com>
	<CAMKF1sraQqZvTL3imQecXjwx5xQpS6EiiBmKp8+B0cb9Y7KSmw@mail.gmail.com>
	<CAJ86T=Xxw__E-+8Zf0PZnOAe1SeMB2ayMZZu-Gb=19ckh8=TtQ@mail.gmail.com>
	<CAHUNapQ0Ywt2-xtp0==FozFhsPSnbBTEDReckkE1TVaxdtCn3g@mail.gmail.com>
	<3f41b911-4fde-1ed1-76f7-650dab5dbb20@gmail.com>
	<c7fbbf37e1ff4631a0aa3b45c07544a9@XBOX02.axis.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 19 May 2018 15:35:47 -0400
Message-ID: <CAHUNapR44Bg55=N60PC1-qKKMjag4eVD7a_YoO3b-CDrJm5XOg@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 01/17] libwebsockets: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Sat, 19 May 2018 19:35:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, May 19, 2018 at 7:59 AM, Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> If you do, I think you should spin the patches for the clean ups as well.
> At least I agree with (most) of them, and on a whole they definitely
> improve the recipes.
>
> And I also agree with Andre, that in general it is too much trouble to
> generate clean up patches in their own, which is why it might be better
> to allow some clean ups together with actual changes. Otherwise they will
> not happen, which in the long run deteriorate the overall state of the
> recipes.
>

I'm happy to slowly go through the recipes and make formatting changes.
What is the accepted canonical order of variables and segments in a recipe
file? Oh, and did we agree on tabs, or spaces?

/me ducks...

