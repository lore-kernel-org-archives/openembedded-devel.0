Return-Path: <ian@boundarydevices.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id D4E3460125
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Nov 2015 02:17:39 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so23233866wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Nov 2015 18:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Oz6xdKQ4qcIV8NjLrbC39OZ5WAjdexA3pXofnXA0RHo=;
	b=Cv6xpvtCiKJBXbzsX/r79TsMSJkB7HiFl2AlCND7Ryx2ZBv0o16JA5/rPuW5bLSTaq
	CsuP5Ln5fEVhDLASbVrZgcL0/ReiRlwphmZHM2CJWIEBOSwxfK1d5BdC5MxK+ktf5ftS
	KbrJc9SkQt8UDGvvUzYkaWFxpkDNtXDdkzqiNo7F2/N26Rzu8BuASUI3bOEGIXyBfn2r
	ifxT8NMXVtYR3fE0NfvmwMm02dxpeHc1CWi4E378ooRWxzpRoQ2enh9ppsZW8uCOu0aG
	cPbIdLOALCkobqxrm3pa2Ciuz3QSy7TPJQQoB4YIa+ZZqNgEIwTxgH/zeACExA5U+bhS
	GdHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Oz6xdKQ4qcIV8NjLrbC39OZ5WAjdexA3pXofnXA0RHo=;
	b=IgTi9vQaZ71Gomey4YdxBzW8cK2+jjKb2ZgvfCkCpVswIb33rybDKrlE73Ykrtt6HP
	2skMgL5SEAWXoAjNE9K36/jTzCeW98TMu5yTmjAl59b35wyI6yjlk3A1sUxzz/zMvJ75
	FON6ncWDbG3edWnhJA3Y6VNYkk7Q/nQu/cnyjxa3t0CdsMC0PgO+RO1QWRg5wFdbdGKS
	9GeqrdIUO6zlBeBQ1wOU7IDfkEeY+Tqr2rXL49xS5vxdyKsndxyH0PgtdoQJAv0XW45p
	mkKJaPwG9IeGPuVcc2ppVDUP+aSSj0BfmlHgztTyHyD/E4O1a+nSXN9eTkUs9PKsxtqQ
	2AoA==
X-Gm-Message-State: ALoCoQm9Eug3zgmbzI1nLMaKgAE7zjfmISCz6IYHtRpBBFyf414703LdJYb1Affs0uFZtPO6rOQy
MIME-Version: 1.0
X-Received: by 10.194.63.7 with SMTP id c7mr32366597wjs.70.1446603459023; Tue,
	03 Nov 2015 18:17:39 -0800 (PST)
Received: by 10.27.155.207 with HTTP; Tue, 3 Nov 2015 18:17:38 -0800 (PST)
In-Reply-To: <E72BA3F9-5A08-424D-AF04-13BDAD9CD089@gmail.com>
References: <CADseiPkMQaDUwMWP5V67XW0=0sW3i5TfYk72eZ8OafdM2dO9Ww@mail.gmail.com>
	<A3B887A5-3F5D-4B23-AAC2-A2F1EF8D3D6C@gmail.com>
	<CADseiPmmHNMRaYwFR7k7PDQpgTJQ5x+5HxKignZq-c0FygPS9g@mail.gmail.com>
	<E72BA3F9-5A08-424D-AF04-13BDAD9CD089@gmail.com>
Date: Tue, 3 Nov 2015 18:17:38 -0800
Message-ID: <CADseiPmKUNX8ta-6kJ-eAbopx=NOCF0sGcVH5oQz7g9mk=071g@mail.gmail.com>
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
X-List-Received-Date: Wed, 04 Nov 2015 02:17:44 -0000
Content-Type: text/plain; charset=UTF-8

I actually tried that already. Didn't work.

Passing LD_LIBRARY_PATH=/usr/lib/chromium doesn't work either.

On Tue, Nov 3, 2015 at 6:13 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Nov 3, 2015, at 5:50 PM, Ian Coolidge <ian@boundarydevices.com>
> wrote:
> >
> > It looks like it is statically set within the code in the function
> > InitializeMediaLibrary(module_dir)
> >
> > Doing a `grep -r -B 5 -A 5 "initializeMediaLibrary" *` of the chromium
> code
> > shows a few places looking in DIR_EXE for the library instead of
> DIR_MODULE.
> >
> > In particular, I see webmediaplayer_factory.cc initializing the media
> > library and looking in DIR_EXE. Is this what would play videos from an
> html
> > <video> tag?
> >
> > I'm finding chromium looking in DIR_EXE for libffmpegsumo.so when
> chromium
> > is launched with this script:
>
> for tests can you put library in  /usr/lib/chromium-browser and see if it
> finds it
>
> >
> > #!/bin/sh
> >> export DISPLAY=:0
> >> export HOME=/tmp/chromium
> >> export GOOGLE_API_KEY=ZZZZ
> >> export GOOGLE_DEFAULT_CLIENT_ID=XXXX
> >> export GOOGLE_DEFAULT_CLIENT_SECRET=YYYY
> >> export CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
> >> export CHROME_EXTRA_ARGS=" \
> >>        --user-data-dir=/tmp/chromium \
> >>        --data-path=/tmp/chromium \
> >>        --disk-cache-dir=/tmp/chromium \
> >>        --disk-cache-size=16777216 \
> >>        --use-gl=egl \
> >>        --gpu-no-context-lost \
> >>        --start-fullscreen \
> >>        --enable-logging=stderr \
> >>        --no-first-run \
> >>        --disable-touch-drag-drop \
> >>        --enable-file-cookies \
> >> "
> >> /usr/bin/chromium/chrome ${CHROME_EXTRA_ARGS} $@
> >
> >
> > and with this simple vid.html as the page source:
> >
> > <html>
> >> <div id="showvideo" style="display: none">
> >>          <video id="myVideo" height="240" autoplay loop>
> >>               <source src="/app/test.mp4" type="video/mp4">
> >>          </video>
> >> </div>
> >> </html>
> >>
> >
> > Thoughts?
> > Thanks!
> > -Ian
> >
> >
> >
> >
> > On Tue, Nov 3, 2015 at 5:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >>
> >>> On Nov 3, 2015, at 5:12 PM, Ian Coolidge <ian@boundarydevices.com>
> >> wrote:
> >>>
> >>> Hello,
> >>>
> >>> In the chromium recipe, there is a package chromium-codecs-ffmpeg which
> >>> puts libffmpegsumo.so in /usr/lib/chromium/. However, it only seems to
> >> work
> >>> when placed in /usr/bin/chromium/.
> >>>
> >>> Is there a flag I can pass to chromium to look in /usr/lib/chromium/
> for
> >>> that library? What step am I missing here?
> >>>
> >>
> >> can you check the chromium script and see if it needs the lib path to be
> >> specified there ?
> >>
> >>> Thanks!
> >>> -Ian Coolidge
> >>> --
> >>> _______________________________________________
> >>> Openembedded-devel mailing list
> >>> Openembedded-devel@lists.openembedded.org
> >>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >>
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

