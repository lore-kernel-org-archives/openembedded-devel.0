Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id A5E5460290
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Nov 2016 21:41:22 +0000 (UTC)
Received: by mail-vk0-f54.google.com with SMTP id p9so94167088vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Nov 2016 14:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IVUg/mSmcTtnl4C/YcoE+WELQQyNM+drGnuanm2QOC8=;
	b=k5NV+8ttMUriBwQcp1RP5KIufWUYs2qS8yohCbWfvDdaYj2QQW+TIcIjUgXDcQ40vi
	0DwYPNjV5+YgfidDJs5jSjfScomU88zcFVhjVbSdJ9P73uwfdGUZWB4TV/Tw+sliINu6
	VXLLWpXDbvXbh3YeCPk12ZIegnX0XfgdW9t9m1eZWSdxkVZsnc41dz8/cZxhExS31GMn
	0JqLkN6uCOhfQCqyqbQ7UTO1kUOvIs1M35DrEwBj1M48fhx5UwixymI05m9PmV5blfmI
	HP8nbjqL12RTMCy2gZJRqwtfTf9RAGSutqgd1AV1+Fq0kwI7x6WD7YL8a3cSUJ1/fdTD
	Co1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IVUg/mSmcTtnl4C/YcoE+WELQQyNM+drGnuanm2QOC8=;
	b=kAvJIa3aVWqt221KYLboBZH+95I3GcRHnuR7SKUF6sy37lc/mMEE4nJRkSi5QE+lEQ
	oeLh8txNEWVebU4j2Ig1JHNZPUS2ksPibTY5tCK0IXYMRUrsQqvp2orGx7ZRm0hjziBF
	wbI6MaS8C15Rd2XoBzGCa1vEUia7lrwWywPIo9mrv4pDeq4y23Oku7YCtxJHxx/spXiH
	zuVm22y3CnKGuXRoKHNhK3D9ZfTP1IyQbiby2SanuhJOxC7g92xXavP03r574gMj9A+Q
	/dsTQwmsBKx5fk6NpcK6vR7l13QDhLgvRHJnv+Kk+cFExPf82tUv7U88VRP2nOscPns1
	hqHQ==
X-Gm-Message-State: ABUngvcmN9G+zyHxDvO/e6NWCmi3G53T8fECV4GxMLG4CmiPT0r1QoWFamMMhKHb0+FIG+c0kIN/wbaqPivUow==
X-Received: by 10.31.161.65 with SMTP id k62mr16163604vke.12.1478382083698;
	Sat, 05 Nov 2016 14:41:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Sat, 5 Nov 2016 14:41:23 -0700 (PDT)
In-Reply-To: <OF04FA5FC4.E8F1EE5F-ONC1258061.004ADD35-C1258061.004C6F4E@rohde-schwarz.com>
References: <OF04FA5FC4.E8F1EE5F-ONC1258061.004ADD35-C1258061.004C6F4E@rohde-schwarz.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sat, 5 Nov 2016 22:41:23 +0100
Message-ID: <CALbNGRREixk7qahQ2_pW-M48LiOb9HffAozOEmwvd2iyCu50ag@mail.gmail.com>
To: Thomas.Betker@rohde-schwarz.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qttools and QT_LIBINFIX
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
X-List-Received-Date: Sat, 05 Nov 2016 21:41:25 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 4, 2016 at 2:54 PM,  <Thomas.Betker@rohde-schwarz.com> wrote:
> Hello Andreas,
>
> in our project, we are using meta-qt5 with non-empty QT_LIBINFIX, and
> building qttools fails because "cannot find -lQt5Lucene". I think
> recipes-qt/qt5/qttools/0002-assistant-help-fix-linking-of-dependent-libraries.patch
> should read
>
>         LIBS += -lQtLucene$${QT_LIBINFIX}
>
> instead of
>
>         LIBS += -lQtLucene
>
> Could you have a look at this?
>
> Best regards,
> Thomas Betker
Hi Thomas,

to be honest even after googling around I did not really understand
what QT_LIBINFIX is for - OK I did not spend much time on it...

I'd suggest you send a patch for this. As QT_LIBINFIX is empty by
default this should go through build tests done by Martin.

Regards

Andreas

