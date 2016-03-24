Return-Path: <ryanelkholy@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 663816011A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 13:01:05 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id l20so11576194igf.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2016 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=JlXDy0oVbPZ8EPInsGYkpHlpAnnQInT1oXm9/GK324k=;
	b=GC5h4jP1TJzo0Int4a7mWxKk9Csq+3smw6k9V/IdAL6mRlZXQDcwh8p4ex0vVx6gA3
	vuf6dTYjU5gYaVZGtAHmL9Gzuxh1dTEuMenFWZDlaNWdBoKjddEkhnj78vWQYjC0e7/A
	OO0sQq9AvzouB9OaFNR2IyworB9tQI3QtJS/TqYNOUX6Vx2LT/MRl+6zcyBzzpQ3CdFC
	S8MNuWXhX/RKo8QdA+O9bcbmSN/ASEoatU4ttaS29kHlwg6/2whk2vAUfPhsq744tkwD
	oy4mC/rXqehYCRbmnGS/BqfuhkhdhuQL8bDKF7XZw5JUnI6gFB86POXdkJf6uLlXYAma
	L1wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=JlXDy0oVbPZ8EPInsGYkpHlpAnnQInT1oXm9/GK324k=;
	b=bzr4xyaBWl/M38ulsYr4v8M44TM4YD7H4Jq0u7v7cTmOGcr6FyAAN3XM6MDhIArhSZ
	viFCfod8NsKo3piFmoKZfqJFI31Qis0O2AzqC+KB/j9CVoydck6zOYu63+bKF+ILsKas
	bl+NwMrfiR8G22tq9u679sglHjis4yKx76vOlD/mGi5S7X1aLdRz4d3s8yDAO9KRQaq/
	SwA1Mft8+8Es0w2bQKmgoX2a4qudzQ9tJGxsJNcQpvK+DfXnr3ZYvxUbNQ/MD8LEvBzM
	fGQBDkmjsjvI20+xKNn77v4ewhqt6TyJoM8sYFrdDqros7szuH93zqLb9eMswkrj0u9v
	DRRA==
X-Gm-Message-State: AD7BkJKp9DfcDB4hgD1qUHYoBwUSkc9etntGIti13N+7pq8U7A6Fv8E+KBeOM525Ajb1ttsSz9uirPQp3HH8QA==
MIME-Version: 1.0
X-Received: by 10.50.92.5 with SMTP id ci5mr28621249igb.70.1458824465551; Thu,
	24 Mar 2016 06:01:05 -0700 (PDT)
Received: by 10.64.69.138 with HTTP; Thu, 24 Mar 2016 06:01:05 -0700 (PDT)
In-Reply-To: <CAMKF1sqxb2y6KPxNbB5wVSvRjN2vCq5m_TT08TzjGFxvPBAp_A@mail.gmail.com>
References: <CAMZfsd6f67zTGSsSfQdVViX69qykeNmKE6gP+u60WAOKGOWodA@mail.gmail.com>
	<CAMKF1sqxb2y6KPxNbB5wVSvRjN2vCq5m_TT08TzjGFxvPBAp_A@mail.gmail.com>
Date: Thu, 24 Mar 2016 09:01:05 -0400
Message-ID: <CAMZfsd4OVdAiwpC9vMD=hJOCyEsoPp5v0+Ad-6xh5psYrirzCQ@mail.gmail.com>
From: "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5] Unable to Build due to qtbase error
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
X-List-Received-Date: Thu, 24 Mar 2016 13:01:06 -0000
Content-Type: text/plain; charset=UTF-8

I am using core-image-base. Isn't opengl already included? I see it as
below when I use

bitbake custom-image-base -e | grep DISTRO_FEATURES

DISTRO_FEATURES="alsa argp bluetooth ext2 irda largefile pcmcia usbgadget
usbhost wifi xattr nfs zeroconf pci 3g nfc ipv4 ipv6 libc-backtrace
libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets
libc-crypt libc-crypt-ufc libc-db-aliases libc-envz libc-fcvt libc-fmtmsg
libc-fstab libc-ftraverse libc-getlogin libc-idn libc-inet-anl libc-libm
libc-locales libc-locale-code libc-memusage libc-nis libc-nsswitch
libc-rcmd libc-rtld-debug libc-spawn libc-streams libc-sunrpc libc-utmp
libc-utmpx libc-wordexp libc-posix-clang-wchar libc-posix-regexp
libc-posix-regexp-glibc libc-posix-wchar-io largefile opengl ptest
multiarch pulseaudio sysvinit bluez5"

If not, how do I add it in local.conf as a distro feature? Please note that
I did the following: DISTRO_FEATURES_remove = " x11 wayland"

For reference, here is what I have added to local.conf

#BB_NUMBER_THREADS ?= "${@oe.utils.cpu_count()}"
BB_NUMBER_THREADS = "8"
#PARALLEL_MAKE ?= "-j ${@oe.utils.cpu_count()}"
PARALLEL_MAKE = "-j 8"

MACHINE = "valleyisland-64"

SDKMACHINE ?= "x86_64"

EXTRA_IMAGE_FEATURES = "debug-tweaks ssh-server-openssh tools-debug
tools-sdk dev-pkgs"

LICENSE_FLAGS_WHITELIST = "commercial"
INHERIT += "rm_work"
DISTRO_FEATURES_remove = " x11 wayland"
IMAGE_INSTALL_append = " \
    dbus \
    openssh-sftp-server \
    qtbase \
    qt3d \
    qtconnectivity \
    qtmultimedia \
    qtserialport \
    qtwebsockets \
    qtsvg \
    cinematicexperience \
    "

On Thu, Mar 24, 2016 at 12:22 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Do you have opengl in distro features
> On Mar 23, 2016 7:49 PM, "Ryan Elkholy, PhD, PE" <ryanelkholy@gmail.com>
> wrote:
>
> > Hello,
> >
> > I have been trying to build an image using meta-qt5 for quite a while
> now.
> > I am building using the meta-intel layer for an x86-64 architecture. The
> > build keeps failing due to qtbase. The error log is here:
> > http://pastebin.com/qcRQxTsH
> >
> > I cannot for the life of me figure out how to fix this error. Any help
> > would be greatly appreciated!
> >
> > -Ryan
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

