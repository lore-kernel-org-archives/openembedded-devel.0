Received: from [209.85.222.181] (helo=mail-pz0-f181.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <juanbackson@gmail.com>) id 1MkEY8-0003z1-L2
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Sep 2009 12:00:46 +0200
Received: by pzk11 with SMTP id 11so443490pzk.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Sep 2009 02:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=TPzBBB7YLV80T8aJ74dRjsplQ+7ov/UQWa6qWYih7A0=;
	b=kpXqVNwJ02yUGugnieVklRDTVmN/zGQgUJEvj+tVXN1jlaUF10EQ7qjxy85VHTttMh
	7A6Ie/uIOLlwDF1CiwFE4VhNssRElueQ78KuRQHb4Rhj/4QYxzoGogCDWD/pOHAKYA01
	QRwcss74EXexWEx7U/njr83VgyYPwijAby+jQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tEXBkKtRs/UqbGELyEW+eEg7edG0TpTP8OO/ehQFm/UTYPT0cL/c9BbIGIjdX9mKF6
	gx6MlYRa3ssdtdyzD63wPNQppEIvdt2UsnqQ6mJjTgG41aPf6OhmmkJFrI/x8tOgp94c
	pAwbO/fHK/PnkvIiEBpJH8PbHASc/8/u40KhU=
MIME-Version: 1.0
Received: by 10.142.8.40 with SMTP id 40mr440022wfh.60.1252230092942; Sun, 06 
	Sep 2009 02:41:32 -0700 (PDT)
In-Reply-To: <19c1b8a90909060117p70dbda1fk4df80fb3dcb55aed@mail.gmail.com>
References: <27c25bc40909050924o3632ba7dp8dd84e950a689617@mail.gmail.com>
	<19c1b8a90909051050s382dcbf1of5aed8482cfd25aa@mail.gmail.com>
	<1252181231.4490.148.camel@lenovo.internal.reciva.com>
	<19c1b8a90909051341w882f41aj9ed35a381eb3377a@mail.gmail.com>
	<27c25bc40909060001w4e236953v4503216cac29a12f@mail.gmail.com>
	<19c1b8a90909060117p70dbda1fk4df80fb3dcb55aed@mail.gmail.com>
Date: Sun, 6 Sep 2009 17:41:32 +0800
Message-ID: <27c25bc40909060241v5be9aca0xb2d6c647b03179ba@mail.gmail.com>
From: Juan Backson <juanbackson@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: unable to bitbake ortp
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Sep 2009 10:00:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

This may be a pretty dumb question.

I tried to git pull, but I am getting:

OE:beagleboard [juan@localhost openembedded]$ git pull
Already up-to-date.

Is it something to do with my config or I should remove something for it to
recognize that it is not the latest build?

Thanks,
jb
On Sun, Sep 6, 2009 at 4:17 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sun, Sep 6, 2009 at 12:01 AM, Juan Backson<juanbackson@gmail.com>
> wrote:
> > Hi
> >
> > I have the following in my ortp0.7 recipe.  How should I change it to get
> > bitbake to work?
>
> I have committed a fix for it on .dev if you are using .dev branch
> just update your copy.
>
>
> >
> > DESCRIPTION = "An LGPL implementation of RTP - RFC3550"
> > LICENSE = "LGPL"
> > DEPENDS = "glibc"
> >
> > PR = "r1"
> >
> > inherit autotools pkgconfig
> >
> > SRC_URI = "
> >
> http://download.savannah.nongnu.org/releases/linphone/${PN}/sources/${P}.tar.gz
> > "
> >
> > do_compile_append() {
> >        sed -i -e s:${STAGING_DIR_TARGET}::g \
> >               -e s:/${TARGET_SYS}::g \
> >                  ortp.pc
> >
> > }
>
>  _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

