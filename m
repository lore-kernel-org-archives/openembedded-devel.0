Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0C34B78803
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 23:52:42 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id n206so1113559itg.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 15:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NiZcsx/A9ihjj1UOiLkNfACnZLPnvAvGCVxbtYrmlSQ=;
	b=PkRnUsK/vMY+ViT5AXofEbYTRyULsHQ5EdK9yLgfm4iLpW1GaHJYTlWllbPFex7BKn
	b5lv3SK/Ph2m/WzGj1yIrJiN88m2ph/X2y3EJ/7BhTMWgP2IIAJ5fNTM7bBFMbxt5yz4
	i2nLm6om/7fnk/3bDd56s0GEe7v18DF9kqVECU9K47cgj5qxzFY3CE9U2lpnmpV/UxBI
	dRTDPVlbyijm7qK60fYCTiPNpwmskYUgCFztzfb5/LpIZOGjKRJTbVDYLbGb82Jf/go/
	HI93zmlITqNOxg6iNi5Xii7WeoBDMR5jpD6FxS9fW+Q/75qDUuKA9RRuPyhcV8TVp1qQ
	wo6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NiZcsx/A9ihjj1UOiLkNfACnZLPnvAvGCVxbtYrmlSQ=;
	b=WQctMZuw7vPYHR2iKSFsXWI0oryZ/TuGZwBUDjZ9yZMH5/uNSWItP5JoQb27qyJ7eT
	tGDujfMtR9XnR5GyNqkcgcPwWlKKvAWM2eFvD5vjuxQaA9ocp1cEn+SmY+CJnkCCgzKU
	humrYIPYAl0vEdeld+fqeB4vDw8cFeGdxo9CjnfpLJ3sRSpTN2GMLkAGtPWjFzvZ69UP
	DVz2z1Z+tWtlFz3UyndWWIdRP0MDitmxT1M0grDOc5iQOjkE+vI5B5KOiNk/mYZRbuxQ
	PPzhbsNRPSreU6NIl9yunmMCo87STwq1l7mijdGW7jcIpvv0D8rj/YFDwwiVLt/5Wb+J
	6HRg==
X-Gm-Message-State: AKwxytc3LDogiq8A02Lm2Elx+Hjp7A8+uF9CxhGhlY52UCwOJtziiaVq
	4B9VvPWeefvHy/9X5/neAFE75d20FyJYZfRNb8DhIw==
X-Google-Smtp-Source: AH8x224IgUIzTX8HpemXcn+cXo/Nze9CGcxAgw+S90ypnDkLwtY1H4EiQBKHL495yhW/vireLm4l5f+NHGQiiRnk/LA=
X-Received: by 10.36.145.143 with SMTP id i137mr4661136ite.6.1517010763687;
	Fri, 26 Jan 2018 15:52:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Fri, 26 Jan 2018 15:52:23 -0800 (PST)
In-Reply-To: <20180126221034.GB2786@denix.org>
References: <1516085015-89929-1-git-send-email-denis@denix.org>
	<20180123223913.GA2786@denix.org>
	<CAJTo0LZDJDT8d+bGbeMLxAFD3Jr54PTbNr4GdA3mR-msbfPJSA@mail.gmail.com>
	<20180126221034.GB2786@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Jan 2018 23:52:23 +0000
Message-ID: <CAJTo0LaW1k-BvGN0jtQJMcNQj74uarz6QN7qBnMKUUw-9DpD2Q@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-networking][PATCH] ndisc6: need to set USE_NLS="yes" to use gettext.h
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
X-List-Received-Date: Fri, 26 Jan 2018 23:52:43 -0000
Content-Type: text/plain; charset="UTF-8"

Oh right, presumably your distro is turning off NLS.  Yeah if the upstream
doesn't understand how to turn it off, then yes this would be the
workaround.

Ross

On 26 January 2018 at 22:10, Denys Dmytriyenko <denis@denix.org> wrote:

> Not really:
>
> ERROR: ndisc6-1.0.4+gitAUTOINC+4c794b5512-r0 do_configure: Function
> failed: do_configure (log file is located at .../work/armv7ahf-neon-linux-
> gnueabi/ndisc6/1.0.4+gitAUTOINC+4c794b5512-r0/temp/log.do_configure.23315)
> ERROR: Logfile of failure stored in: .../work/armv7ahf-neon-linux-
> gnueabi/ndisc6/1.0.4+gitAUTOINC+4c794b5512-r0/temp/log.do_configure.23315
> Log data follows:
> | DEBUG: Executing shell function do_configure
> | cp: cannot stat '.../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> gitAUTOINC+4c794b5512-r0/recipe-sysroot-native/usr/share/gettext/gettext.h':
> No such file or directory
> | WARNING: .../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> gitAUTOINC+4c794b5512-r0/temp/run.do_configure.23315:1 exit 1 from 'cp
> .../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> gitAUTOINC+4c794b5512-r0/recipe-sysroot-native/usr/share/gettext/gettext.h
> .../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> gitAUTOINC+4c794b5512-r0/git/include'
> | ERROR: Function failed: do_configure (log file is located at
> .../work/armv7ahf-neon-linux-gnueabi/ndisc6/1.0.4+
> gitAUTOINC+4c794b5512-r0/temp/log.do_configure.23315)
> ERROR: Task (/OE/arago-rocko/sources/meta-openembedded/meta-networking/
> recipes-support/ndisc6/ndisc6_git.bb:do_configure) failed with exit code
> '1'
>
>
>
> On Wed, Jan 24, 2018 at 10:53:08AM +0000, Burton, Ross wrote:
> > That should only be true for native recipes?
> >
> > On 23 January 2018 at 22:39, Denys Dmytriyenko <denis@denix.org> wrote:
> >
> > > Ping.
> > >
> > >
> > > On Tue, Jan 16, 2018 at 01:43:35AM -0500, Denys Dmytriyenko wrote:
> > > > From: Denys Dmytriyenko <denys@ti.com>
> > > >
> > > > Otherwise we can get gettext-minimal-native dependency instead, which
> > > does not
> > > > provide gettext.h header.
> > > >
> > > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > > ---
> > > >  meta-networking/recipes-support/ndisc6/ndisc6_git.bb | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > > b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > > > index 48a83b8..58f1230 100644
> > > > --- a/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > > > +++ b/meta-networking/recipes-support/ndisc6/ndisc6_git.bb
> > > > @@ -22,6 +22,8 @@ EXTRA_OECONF += "PERL=${USRBINPATH}/perl"
> > > >  LDFLAGS += "-fuse-ld=gold"
> > > >  TOOLCHAIN = "gcc"
> > > >
> > > > +USE_NLS = "yes"
> > > > +
> > > >  do_configure_prepend() {
> > > >      cp ${STAGING_DATADIR_NATIVE}/gettext/gettext.h ${S}/include
> > > >      ${S}/autogen.sh
> > > > --
> > > > 2.7.4
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > >
>

