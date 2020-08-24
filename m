Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
 by mx.groups.io with SMTP id smtpd.web12.190802.1598259368922203220
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 01:56:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=YlpiCO4l;
 spf=pass (domain: skidata.com, ip: 91.230.2.99, mailfrom: prvs=498d700d9=richard.leitner@skidata.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
  t=1598259369; x=1629795369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dCWcoHQQtCFVKt51nHRFfo/UNhJsaomUWaveqQBwXxE=;
  b=YlpiCO4lAA+mRiaV+MBYaOiGQYaOcwtkIympJTV4RYO6m2jmQVvfUDuN
   PpoRdrhiSobbJbADs9QicMzNWOoyV8XC4A1fdQkpl9T6yWdHyuAbNojeP
   pwWcRH3zhS7DRtl0VXECkBLYuXe0s1yRaxDiIchgeqL8e+fJfeoO/fLFM
   RqVj4m9tbfrKpkE0yPonEAN3uh9lpihu5T5YCXwC34KtWfCTDlVSBxfTl
   WjJXeHmILN8HN/4ZzH/nIaqsF9ypw8gqxIN2MrS96HRbG1BJZlVpo8KK5
   v0SAbfNaL3vtr7BUFhkS7CiU5tdGUlG7NwFKbVIBexErfNnXuNsyvpQVm
   g==;
IronPort-SDR: Ev3lkvBEK2eUZoirHNaGmDKNF0oqAhzAoGq3+aIkZl4N7prl97zUQNTjRbDrzKWgVWkdlCE/qr
 pz3jwq8pK+3/axyy/SodfGqfW3d8BJVMVHnrwKsjH66rSlHLcMD5IY1PO4T7ccvttj+pvO4iTB
 2X/ZqKNF6Ty1J8q6s+sCQRBpmfqKU50j9R3M6WWuUad8tKdTjqH2DqwPKko6TBzYVjn/WZ5EW7
 BbFDSmniKKwg1Fvc372GyRuFcepSI3kA7JZuHB4ZyizLPmWfgZEipCQi7w0r6uc5J3vSJnUmDG
 qCw=
X-IronPort-AV: E=Sophos;i="5.76,347,1592863200"; 
   d="scan'208";a="26330767"
Date: Mon, 24 Aug 2020 10:56:07 +0200
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Chencheng Zhang <chencheng@wittra.se>
CC: Alexander Kanavin <alex.kanavin@gmail.com>, Alex Kiernan
	<alex.kiernan@gmail.com>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>, <ricardo@ribalda.com>
Subject: Re: [oe] Failed to fetch URL https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
Message-ID: <20200824085607.GA2286@pcleri>
References: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
 <CANNYZj8dyU6LpUBiM--YNsF8of56SG4-+VxMsM2B9_SwY0+1dA@mail.gmail.com>
 <20200824065011.GE65616@pcleri>
 <CANNYZj_CMwME4mhX0FfhVJbe94eW00TzjXuthWqWBCg3tJULHA@mail.gmail.com>
 <20200824074554.GF65616@pcleri>
 <CAE5diG17Z6Mte=_mAxtU_=9u6cSgvWm=m6WtSsDqkv8Ot1OjLQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE5diG17Z6Mte=_mAxtU_=9u6cSgvWm=m6WtSsDqkv8Ot1OjLQ@mail.gmail.com>
Return-Path: richard.leitner@skidata.com
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex6srv.skidata.net (192.168.111.84) To
 sdex5srv.skidata.net (192.168.111.83)
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Aug 24, 2020 at 10:47:38AM +0200, Chencheng Zhang wrote:
> Hi again,
> Got another error:
> ERROR: openjdk-8-native-265-r0 do_fetch: Fetcher failure for URL: '
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=openjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=openjdk'.
> Unable to fetch URL from any source.

I'm already aware of this issue. It seems Oracle shut down the java.net
site. Please follow https://lists.openembedded.org/g/openembedded-devel/topic/meta_java_changes_from/76380470
for the discussion.

regards;rl

> /Chencheng
> 
> On Mon, 24 Aug 2020 at 09:45, Richard Leitner <richard.leitner@skidata.com>
> wrote:
> 
> > On Mon, Aug 24, 2020 at 09:24:21AM +0200, Alexander Kanavin wrote:
> > > Thanks! But I guess dunfell needs the same set of fixes?
> >
> > Yes. I'm currently running some tests and if they succeed I'll backport
> > a set of patches.
> >
> > regards;rl
> >
> > >
> > > Alex
> > >
> >
