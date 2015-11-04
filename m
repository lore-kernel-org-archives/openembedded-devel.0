Return-Path: <ian@boundarydevices.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 878E060124
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 01:50:29 +0000 (UTC)
Received: by wmeg8 with SMTP id g8so29631376wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 17:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=XIOP/4V/kzKjRlcUnufIZ2PYKly7aRE1cwzqqkbC8tU=;
	b=iJ46jYi/dplkIbAqN7UiV+NHVSyYrvcDEU22a9OBvSXGyXcooRp41hVQEGupIdyfUV
	TB7iTakumIN2VptoF74T/DYQGROTz12co9UzzRE4qixJepudIrGKBWGyDPO8me54JcxI
	EonBTYDpHd795Cu4vHmbPNg1oZUDvseb85Q5+QIYYQXP2CvNdIO8YzkO/rDIx6t9FAsD
	68W0+7pJuiDHSBea8J4O1YzwQOBplbm4kD/G5/HOtU5LhRScgfDua9Fp0lpmQmaWk/QF
	bIsrpNWQHxOII7DvjeWJk10ts008kBdx11OObDIiCCJz+9dGqyD/6f5n8RfjmSh+sBCr
	I8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=XIOP/4V/kzKjRlcUnufIZ2PYKly7aRE1cwzqqkbC8tU=;
	b=IYlS187Mx4KXj4Ocnp7/L8i9Lkg2mA4YcW1QnEKe9S1BGpJacsgiiDKOp0GTwiAoSD
	6s4lyxDoQxnMis8tPX/fgGv9NeMDnJFKvtvEWJatP1XfpkJD0LJ8GIf2U4Pd/D4wdbjE
	JDfu50Gdi0A+lASJ06vepKuuD64o6TBKi1I0uOeFgnvf01WNE6x1m7kP0W0VeWVbFt3M
	PIr9vl2I3AK7qWc3P1TOckOoQBQt5RVaTlvwiVeg/HAEuAzu/kyLq/55VuGN0QyRiugt
	em3Bcd1JGdKYdc+D9UkAa2lbF1z4B+3h544GdSwnhfUduww3G15lAZlAlX75Ht5NNOd4
	fniA==
X-Gm-Message-State: ALoCoQke3v76b3xDdhDS8/09TfkVaNPrLQmdIsDL1b2F1rLQR0uIFmZywmQOp1/ictmufY8ODYjT
MIME-Version: 1.0
X-Received: by 10.28.178.210 with SMTP id b201mr23257100wmf.78.1446601829845; 
	Tue, 03 Nov 2015 17:50:29 -0800 (PST)
Received: by 10.27.155.207 with HTTP; Tue, 3 Nov 2015 17:50:29 -0800 (PST)
In-Reply-To: <A3B887A5-3F5D-4B23-AAC2-A2F1EF8D3D6C@gmail.com>
References: <CADseiPkMQaDUwMWP5V67XW0=0sW3i5TfYk72eZ8OafdM2dO9Ww@mail.gmail.com>
	<A3B887A5-3F5D-4B23-AAC2-A2F1EF8D3D6C@gmail.com>
Date: Tue, 3 Nov 2015 17:50:29 -0800
Message-ID: <CADseiPmmHNMRaYwFR7k7PDQpgTJQ5x+5HxKignZq-c0FygPS9g@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-browser] chromium libffmpeg
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
X-List-Received-Date: Wed, 04 Nov 2015 01:50:36 -0000
Content-Type: text/plain; charset=UTF-8

It looks like it is statically set within the code in the function
InitializeMediaLibrary(module_dir)

Doing a `grep -r -B 5 -A 5 "initializeMediaLibrary" *` of the chromium code
shows a few places looking in DIR_EXE for the library instead of DIR_MODULE.

In particular, I see webmediaplayer_factory.cc initializing the media
library and looking in DIR_EXE. Is this what would play videos from an html
<video> tag?

I'm finding chromium looking in DIR_EXE for libffmpegsumo.so when chromium
is launched with this script:

#!/bin/sh
> export DISPLAY=:0
> export HOME=/tmp/chromium
> export GOOGLE_API_KEY=ZZZZ
> export GOOGLE_DEFAULT_CLIENT_ID=XXXX
> export GOOGLE_DEFAULT_CLIENT_SECRET=YYYY
> export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
> export CHROME_EXTRA_ARGS=" \
>         --user-data-dir=/tmp/chromium \
>         --data-path=/tmp/chromium \
>         --disk-cache-dir=/tmp/chromium \
>         --disk-cache-size=16777216 \
>         --use-gl=egl \
>         --gpu-no-context-lost \
>         --start-fullscreen \
>         --enable-logging=stderr \
>         --no-first-run \
>         --disable-touch-drag-drop \
>         --enable-file-cookies \
> "
> /usr/bin/chromium/chrome ${CHROME_EXTRA_ARGS} $@


and with this simple vid.html as the page source:

 <html>
> <div id="showvideo" style="display: none">
>           <video id="myVideo" height="240" autoplay loop>
>                <source src="/app/test.mp4" type="video/mp4">
>           </video>
> </div>
> </html>
>

Thoughts?
Thanks!
-Ian




On Tue, Nov 3, 2015 at 5:26 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Nov 3, 2015, at 5:12 PM, Ian Coolidge <ian@boundarydevices.com>
> wrote:
> >
> > Hello,
> >
> > In the chromium recipe, there is a package chromium-codecs-ffmpeg which
> > puts libffmpegsumo.so in /usr/lib/chromium/. However, it only seems to
> work
> > when placed in /usr/bin/chromium/.
> >
> > Is there a flag I can pass to chromium to look in /usr/lib/chromium/ for
> > that library? What step am I missing here?
> >
>
> can you check the chromium script and see if it needs the lib path to be
> specified there ?
>
> > Thanks!
> > -Ian Coolidge
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

