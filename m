Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id D17076C18F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 17:20:04 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id r71so7795250qkr.10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 09:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bBUR9P9x/s/qA+O1VbgAuqo8ZIWoxh8qMJIbDG7vsTY=;
	b=GEHEuj0dNCf+zFTIxBgJhAZa0SEeXBOgK0ErCpoGvy3QvVJVdFUwqiwHOaD9FqBmZI
	q8r/kDpQY5L8SztOkiTqAido1WJDbRhvhDaqj+pHjLMeDg1p+oeIEkUXLfqmH4IIVgj5
	z5bNJiF8ldntLaXrNQ7FDGbluRJ+nKILFCCPLolqDIhIDpZ5m1pRkvLlwQ/8apXkF/Rh
	Zukh1y5YVJncRLkmdtNfjI4wwUOhE6wPv88uUtyR69jiI0zoxhPUHCyPWaCuftOxRIKH
	IHnGE2yTBnzq8SEnR4m/I+YFp51wN8JvsG+y7qXQuioRxdnHjAXoaG6OS7qRAKYoaPaf
	rLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bBUR9P9x/s/qA+O1VbgAuqo8ZIWoxh8qMJIbDG7vsTY=;
	b=NswDvI8A7gVQ7odppcMDq9BToYpZDFTcFsvq1vHFfJ1ujdSPaqE//rVIn98ibLAlNE
	OiJNf9JXlpJxsJMDZTMMyYXoJpHYAFUOwlI4Iuks4m0SlTjtdTtBAujAYDge/Cg3OYBK
	fYfqcqC61RhKdQbclnt1I/vt1mOYlehaMK3DMaVFKxIc4fP0EMZQfPxaVaGxCB42oStj
	2c91TLsU2OCMEFwhsOOvO1ONcuY+aHBcYMD5rIY7QpR70bn2VuB1uS7OH6G4xeXekA2x
	GZZYVZTQMMkHvE7eShd1jzlh9L/wam0m+i6zzEcpObRZZGHogMZiRYBXcKzNj6gDk09V
	MRzg==
X-Gm-Message-State: AA+aEWYBVXPLTHOGTjiylfCimP9Ayda5vPvtAwR9pl0m6sL2yWKcnEJ/
	2sEkUGhgSfbNDKmjsU86z2I4MwOELYeGso8yQbY=
X-Google-Smtp-Source: AFSGD/WChQoZ9hw+UAwz5fKOCqYIL7zxuqZTjPkN9iBx/zNmOwWSJaWt3vGmT+ooel1kQMvTGcG+NAyz83Mp8RILsQQ=
X-Received: by 2002:a37:ac05:: with SMTP id e5mr15943682qkm.102.1543857605454; 
	Mon, 03 Dec 2018 09:20:05 -0800 (PST)
MIME-Version: 1.0
References: <CAD9sEJvYu=QUUraaJmXtYNnFgU8Hex1_H3dKA84KOU1Sma3bkw@mail.gmail.com>
	<1A48FFA9-1E49-4892-BD92-8C1200DB3D45@gmail.com>
In-Reply-To: <1A48FFA9-1E49-4892-BD92-8C1200DB3D45@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 09:19:39 -0800
Message-ID: <CAMKF1srM_dMEyyYp0VWJmVTjfEoe7gn3gUpBQ3k8EXgUXh+eTQ@mail.gmail.com>
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: theknoppix@gmail.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: progress of gnome3-full-desktop-environment
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
X-List-Received-Date: Mon, 03 Dec 2018 17:20:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 3, 2018 at 5:41 AM <brendank310@gmail.com> wrote:
>
> The initial patch series has been posted and I have the revisions in progress. I should have a v2 series posted this week.
>


thanks for update I will give a whirl on v2

> -Brendan
>
> > On Dec 2, 2018, at 11:59 PM, Knoppix <theknoppix@gmail.com> wrote:
> >
> > Hi,
> > How can I learn what is the progress of gnome3 DE support? I know that
> > there are serios work to implement full-gnome3 on oe-devel but I dont know
> > how can I check last status (I mean which recipes has not implemented yet
> > etc)
> >
> > Regards.
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

