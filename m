Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 83D736D802
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 17:16:49 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id hz11so926151vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2013 09:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=edGCPFZuHt94Evstdv9Zdx/A87uCDdUTe6vMzRMZKPU=;
	b=EULjFhFLFVNy5NdBFeVZc5oNTCR1llRpwPgzL74/XIgTnuoEnjuVrx/cHSDFsYcIQz
	8UU8cJMYjc6Qdzg+1/Ql4o740dzSkjQpE/RN3OrptVPliN2Ao2JfM6YM3N/sFJKyAt/m
	IOqzMVCEO3IUxXXcRLahoNgoqcWcdzOnanaAidwdUVh7T6/w8ecG6sJjuUDHt+LKVm0r
	3RBH9cS8ycGZ6czO1Fg92ZAE9+lrzWAwNxqSjYhI9M7QLf10R62vKhrpwkWT85rOl61E
	6SCyFz7nJhUU8vWpretPLzakcktVMahToCF3/JzwYg13xuTLE9fJFt26RgN83tnFMjL7
	CzAg==
MIME-Version: 1.0
X-Received: by 10.58.254.38 with SMTP id af6mr302373ved.85.1384449410377; Thu,
	14 Nov 2013 09:16:50 -0800 (PST)
Received: by 10.52.185.9 with HTTP; Thu, 14 Nov 2013 09:16:50 -0800 (PST)
In-Reply-To: <CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
References: <CAFeBWL4xeq+4cL9gvnCDSU1Va8edf+1zT+G7BfYto7Yvp8HXXQ@mail.gmail.com>
	<CAFeBWL4R46JrAhCfe8GZXTipHAp_i+Fcu_BTTTuopfdfKf9r5g@mail.gmail.com>
	<11078227.Ap2jLt1X9L@helios>
	<CALbNGRSiUdEzPLoP5Le58QDV1cqKcLRRyWxxTGyG4dKu7tqB3Q@mail.gmail.com>
Date: Thu, 14 Nov 2013 09:16:50 -0800
Message-ID: <CAFeBWL4YZ-izwN-3oaqfoaPSi=h=WQ+M0=BU_eGOXtx=q6AfPw@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: libmpd-11.8.17 gets 404 Not Found
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
X-List-Received-Date: Thu, 14 Nov 2013 17:16:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

What should be my course of action? Add the new provider to the OE mirror,
or patch the entire recipe? I can do either, but just not sure what the
right thing to do. Trying not to pollute. Thanks.

On Thursday, November 14, 2013, Andreas M=FCller wrote:

> On Thu, Nov 14, 2013 at 12:57 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com <javascript:;>> wrote:
> > On Tuesday 12 November 2013 19:14:22 Adam Lee wrote:
> >> Sorry, I shouldn't have mentioned anything about updating to Dora from
> >> Dylan.
> >> This 404 is happening in Dylan build.
> >>
> >> On Tue, Nov 12, 2013 at 7:07 PM, Adam Lee <adam.yh.lee@gmail.com<javas=
cript:;>>
> wrote:
> >> > Hello everyone, my first post here. Not sure if I am posting at the
> right
> >> > place.
> >> > I am updating my meta layer to Dora from Dylan. At the moment,
> >> > libmpd-11.8.17 is getting 404 Not Found. It is here -
> >> >
> http://downloads.sourceforge.net/musicpd/libmpd/11.8.17/libmpd-11.8.17.ta=
r
> >> > .gz .
> >> >
> >> > Not sure if it's a temporary issue. Anyone else ran into this?
> >
> > Looks like it's vanished upstream... :/ I'm not familiar with this
> particular
> > project and I can't tell what's going on with this particular component=
,
> but I
> > did find an alternative download location:
> >
> > http://download.sarine.nl/Programs/gmpc/11.8/libmpd-11.8.17.tar.gz
> >
> > Until we figure out what's happened upstream we can add this to the OE
> source
> > mirror. Tom, could you please take care of that?
> >
> > Cheers,
> > Paul
> >
> I included (lib)mpd and am using it from time to time with XFCE
> environment.
>
> Somehow libmpd turned obsolete and libmpd's homepage is linked to mpd.
> Since I don't have time for it at the moment:
>
> Could somebody please fix download location?
>
> As soon as I have some spare cycles I will take care how to fix properly.
>
> Andreas
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org <javascript:;>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

