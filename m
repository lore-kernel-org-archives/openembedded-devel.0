Return-Path: <ticotimo@gmail.com>
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 960697FD44;
	Mon, 27 Jan 2020 18:46:41 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id f16so8343567ilk.11;
	Mon, 27 Jan 2020 10:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UwMm/n7mDebtw/u+kdYgWZmR5sWwer0X2H+e0iqshkA=;
	b=JtUdjjz9WAmsj59aERLYZ5AZkvrg8nqjC9YgZJBg48jbGzgLhof9gPdDrS3iJy4oNc
	ljOBnmCvQqggnMTc5LpTAOKJomRHSywX5419Yy8qX7xh9OhiUwZ2BmOU3wMNCgK8237w
	r2/LWaMLA7aHwj24Wu2rldZiDNw5Hc75jjLoD1erlwVi4foPP4PXG+yTK78V7doQuSDa
	p7vHFifqGQY9Vs6BrNv+ECAfNP5GtLPWS/30BxDE1+IDjHhyNLd0k2SkU9DZyWKP1nic
	dmkzd2IV0ySifq6Tb+wplAmyB3+yPTMYGYAuymOhKbGJV2Hd2iJIHYmZ1SxU++dE9g7F
	bkbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UwMm/n7mDebtw/u+kdYgWZmR5sWwer0X2H+e0iqshkA=;
	b=b/xlFV4PcYGJUtRSCuTa6fIrCXTpq+1AEqGU0LgQm2rd97RJ25SxnbLmB42wHisLsf
	ft+rqHt2/npMvidnQZq+XWZrq9NHb2ndtKvstENaYBEXLkW6lPfenc2s9xl0s0j9lFn/
	W3Yg8lFpCDGLPFLh/5r6qg4ES/uVETvo89G3kvbcNBUlTPNzlNXC7PKj0OpWuaL9vHQk
	A/P9eoIu/yf5aPj1IFQOD84KdoAEExaOz3xLN8ZIkg/chlPRME6kh4bcO+mjpMdfja/M
	8mqfzOmY7neLiQeSmTZVuK7SX8AWlW/2PRfmB81gYRiPOFKSDZrXltHibEBtIOrpC3Kk
	CFUA==
X-Gm-Message-State: APjAAAV7V2jEX3zW5wp4BKtGfJDI7gsQlZfeG+1Afpz9vS4FR7H4f+bw
	SMmUnV7om/4AYsBbhF+tqjDIPnWm7BTmtQ1yJPs=
X-Google-Smtp-Source: APXvYqyuh0MI8SDQFE/qWx4qhgTINwTIHTOqOKA7PVqGSOlZ1Ff69dTOFRwcfvXNcH19c72PquB24IDrnMh3WAaRAH0=
X-Received: by 2002:a92:911b:: with SMTP id t27mr16047438ild.142.1580150802238;
	Mon, 27 Jan 2020 10:46:42 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sryUbCcpRxpqi4ytZJ+j+AgksfS8pxd=_O6DtWrkCx+Lg@mail.gmail.com>
	<CAHtQpK6cp2D3Zb2pkDgYwdKR=AX6AWnwpWEs=qqzNYQ64uL28w@mail.gmail.com>
	<24c2080a-8465-ee2e-484a-ff817485fbf4@gmail.com>
	<CAHtQpK4O1eDuq8EcNcFgLasY_PE-_WtzWYA6pOVE9NFQkBbTxg@mail.gmail.com>
	<CAMKF1sqK8kdDdJry4+fp5bJvbUwwPo0SY8VJtpiDhY3y-e7PJg@mail.gmail.com>
	<CAHtQpK4P3nxZPhWC0T84016toXJ5SoEnH1xuyw94jQCjXWV7Bg@mail.gmail.com>
	<CAMKF1spddmi=Sk55Dyb_eS6m6cwa1M_bBfzyqcyn6y_RG7r6wA@mail.gmail.com>
In-Reply-To: <CAMKF1spddmi=Sk55Dyb_eS6m6cwa1M_bBfzyqcyn6y_RG7r6wA@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 27 Jan 2020 10:46:31 -0800
Message-ID: <CANx9H-BkTeXKaZpON-+2Q2B5thd25n4B+dC2+0Zp0rKahTfTrQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] python2-less meta-openembedded build results
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
X-List-Received-Date: Mon, 27 Jan 2020 18:46:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 27, 2020 at 10:06 AM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Jan 27, 2020 at 8:54 AM Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> >
> > On Mon, Jan 27, 2020 at 4:24 PM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Awesome, thanks for the help!
> >
> > No probs!
> >
> > I've actually looked into the list and would have couple of
> > components, which are sort-of "python2-only":
> > - dnssec-conf: did not receive any update since 9(!) years, written
> > totally in python2. Should this be bumped up of bumped out of
> > [oe-core]?
>
> yes meta-python2 is a good place for them if they are primarily
> written in python, otherwise retire or blacklist them
>

I agree. This is one of use cases for which meta-python2 was created.

>
> > - mozjs: this one pulls the most of dependencies and produces the most
> > of errors. It's version is also quite old (60.9.0esr), and there is a
> > lot of python2-only code inside. Should this one be bumped out? Latest
> > ESR version available upstream is
> > 68.4.2esr [1], dated 01/20/2020
> >
>
> Andreas is working on it IIRC, we have updated to latest 60.x ESR
> but perhaps 68.x might be a path if it addresses py3 migration.
>
> > For some other recipes I would send out the patch series later today.
> >
>
> thanks
>
> > [1]: https://archive.mozilla.org/pub/firefox/releases/68.4.2esr/source/
> >
> > >
> > > On Mon, Jan 27, 2020 at 2:51 AM Andrey Zhizhikin <andrey.z@gmail.com>
> wrote:
> > > >
> > > > Hello Raj,
> > > >
> > > > On Fri, Jan 24, 2020 at 8:27 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > > >
> > > > > On 1/20/20 8:51 AM, Andrey Zhizhikin wrote:
> > > > > > On Mon, Jan 20, 2020 at 4:52 PM Khem Raj <raj.khem@gmail.com>
> wrote:
> > > > > >>
> > > > > >> Hi all
> > > > > >>
> > > > > >> Recently py2 is removed from oe-core, So I did quick patches to
> get a
> > > > > >> world build going. And
> > > > > >> here are initial failures, please help out with recipes your
> can or
> > > > > >> care for. Eventually, the remaining
> > > > > >> ones we can blacklist for 3.1 release.
> > > > > >>
> > > > > >> http://errors.yoctoproject.org/Errors/Build/97185/
> > > > > >>
> > > > > >> I will post more arches as they become available. If you want
> to try
> > > > > >> the same for machines/distros you can try yoe/mut for meta-oe
> > > > > >
> > > > > > I've actually asked Ross about similar failures, specifically in
> > > > > > [meta-openembeeded/meta-python] where there is a good mix of
> Pytho2
> > > > > > and Python3 still present. I've started to remove those
> yesterday, and
> > > > > > would continue with that layer further.
> > > > > >
> > > > > >>
> > > > > >>
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=yoe/mut
> > > > > >>
> > > > >
> > > > > All these changes are now in master and its again buildable, with
> or
> > > > > without meta-python2, with meta-python2, its back to where it was
> with
> > > > > everything  building however, without py2 layer we have some work
> to do
> > > > > so if you are interested in this here [1] is initial list of
> failures
> > > > > I will keep posting more as we go along.
> > > > >
> > > >
> > > > Thanks a lot for the update! I've actually saw this in the master
> > > > before this mail and went ahead with pulling the latest - my builds
> > > > for i.MX8M series went fine.
> > > >
> > > > I'd also have a look at remaining things and try to fix some of those
> > > > as I'll progress.
> > > >
> > > > > [1]
> > > > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/220/steps/8/logs/errors
> > > >
> > > > --
> > > > Regards,
> > > > Andrey.
> >
> >
> >
> > --
> > Regards,
> > Andrey.
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

