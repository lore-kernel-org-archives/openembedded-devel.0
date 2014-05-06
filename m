Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id B309A609C1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 00:41:37 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id hi2so2280350wib.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 17:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ueUA565JIYgcW3yrAh/fIiS40IIdEIsKRRCYeEHwfgE=;
	b=vqXqyVwZ3QyYmjitY8AonLBuu9nRm/rJpsNURLH4QPpuk49d8wuw0Cv9rceRqXh9xu
	ugbvZoCmUD2nRX4MHO4zEpyFUMi8TdDluZADJFuMBhBIpJ0ah4rcrJBI9X4nSk271/hW
	s8Kfk2VblA796OOQ5kfzbLplfqCOoOwokkedoTtZXv4hEzAtOIPkCF8UONukleOHWD3k
	aqqN1+pNsuiR10ZV9H0X4qyJDIN8cnsEe2PgvpDiYsvc54TMa8zVTAGoQvKeBTlU70r6
	5PT4gHjiGhR9ZPHY+SW1BQF6QAlMckf+R5X/rNojHQ+hNzKcvg3SvDa7+PuStBYndB+I
	0Zrg==
MIME-Version: 1.0
X-Received: by 10.180.91.161 with SMTP id cf1mr18169332wib.49.1399336897401;
	Mon, 05 May 2014 17:41:37 -0700 (PDT)
Received: by 10.194.135.76 with HTTP; Mon, 5 May 2014 17:41:37 -0700 (PDT)
In-Reply-To: <CABcZANmF+fmDwEU3zMHCRqsF+Mxkysk8Ks62xKhv9EKSHK=ohg@mail.gmail.com>
References: <CAFeBWL52YdcY9KaLW3BuUQBKrSkbkAN4+h=PcxFM9nfXn5Znhg@mail.gmail.com>
	<CABcZANmF+fmDwEU3zMHCRqsF+Mxkysk8Ks62xKhv9EKSHK=ohg@mail.gmail.com>
Date: Mon, 5 May 2014 17:41:37 -0700
Message-ID: <CAOLEWZV8z8qCt+cjd_ZJeoXWtM0yjdF4ZX8dOp46DtOiWy3iZw@mail.gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: systemd networking.service masked?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 May 2014 00:41:40 -0000
Content-Type: text/plain; charset=UTF-8

Well, none of my rpi or bbb images use systemd/connman/networkmanager and
I'm just fine with that as the baseline.

Steve


On Mon, May 5, 2014 at 5:37 PM, Christopher Larson <clarson@kergoth.com>wrote:

> On Mon, May 5, 2014 at 5:31 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
>
> > I noticed networking.service is masked by default -
> >
> >
> http://cgit.openembedded.org/cgit.cgi/openembedded-core/tree/meta/recipes-core/systemd/systemd-compat-units.bb?h=master
> > .
> >
> > I guess I can use the Network Manager to bring up eth0 on boot, but I
> > rather not.
> >
> > What's the harm in networking.service?
> >
>
> Is it really needed? Does systemctl enable dhcpcd@eth0 not do the job, or
> am I missing something?
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

