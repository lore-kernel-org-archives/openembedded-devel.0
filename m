Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by mail.openembedded.org (Postfix) with ESMTP id 35EA060897
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 19:20:26 +0000 (UTC)
Received: by mail-vb0-f48.google.com with SMTP id q16so693353vbe.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2013 12:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ru6ha+Ti58lcTq/dlURTwmplEH+390zsVerHXo85GC8=;
	b=m3ov69RDe2ggFHZJNFgaCetTneULMYMuxwG0UaV4UHE5JKr/SdseSCM2sb60+BOR3w
	ffsDY/mTwl922XpT0fDUCgOhaFh8ST2TjdobYJ+SfyuKa1eAMsN41ibH65xtVmhCuiXv
	b6cQk+RvBvwQo65q/DpdKhUnFO1yZBg7DhW7t7RRpc9z6pHoenEngsfPpDDcVSYZM7vT
	GH01xFeNDAmJN67hkCUtA7MS61hjtUmO69iffu81PCWB0K/SDymiZp1tL2lsZma4JcXy
	H02InBFnQhA/Y7iy2uft8zZ5cDGPJXfBtvKHvwNASjQNdl9Y4gPfhB4XQoweQ0CaQGGX
	mtsg==
MIME-Version: 1.0
X-Received: by 10.58.50.7 with SMTP id y7mr1518450ven.24.1369164026403; Tue,
	21 May 2013 12:20:26 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Tue, 21 May 2013 12:20:26 -0700 (PDT)
In-Reply-To: <04B2970B-A4CB-48F6-88FD-56862388393F@gmail.com>
References: <04B2970B-A4CB-48F6-88FD-56862388393F@gmail.com>
Date: Tue, 21 May 2013 21:20:26 +0200
Message-ID: <CALbNGRSBxa7=dYyX1DetnWOkeEVQ40VisrtLoPNzb4cxg=NMqg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: world build on angstrom-next
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
X-List-Received-Date: Tue, 21 May 2013 19:20:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 21, 2013 at 8:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi All
>
> I have run world build on angstrom and here are results if anyone is interested and provide fixes.
>
> http://sakrah.dontexist.org/files/eglibc.beaglebone.world.log
>
> There are a lot of parsing errors especially from meta-opie
>
> Thanks
> -Khem
>
Few errors should be fixed by my last series not yet applied (gtkhtml2
/ evince - this is not a ping :)

For chromium I have fixed some (not yet all) errors which came up with
gcc 4.8 update. Looking into webkit-efl error messages I think there
are similar issues (webkit). Hope to find the time to fix both next
week.

Hopefully an angel is blessing us with working arm-kernels then...

Andreas

