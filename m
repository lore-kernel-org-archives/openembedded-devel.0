Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1CA4460237
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Aug 2018 01:41:54 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id 126-v6so8737989qke.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Aug 2018 18:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HxF+M70I6MBXd3kT1eVS6ogxTEHtbEeOdw4qx7GQmmY=;
	b=edf1fNCK6bdyIJ8bfI3TTfgDlsum9GNDQT6phsLaEFHBnG7I5Gol9T1Rexfk+WiESy
	SRMuUf4yIqChT30MDu3uUpN5cNJptjjhgAV2yjTRlMPpemS2dU8GjK4y5k7Mry5ehwzE
	H4QPJWvduNzfPdbLl0C34Hy1uralDMKyPykX90HbLbZZxuK8yS7vkiQS8WdVtw4XHqys
	UX+g9ivNy+2fmAL8WBcCAfOPjIl39D6/Zzqy+D4EQJVYYeEg1O9RuTJmDALUTxteyQ2/
	RBuBqs0Ek4K1imNoZIwBqXNOXGZ6KpU5hcchS9BG6OVhNnHfLHuwNNznGHS0gt9iK/ay
	WNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HxF+M70I6MBXd3kT1eVS6ogxTEHtbEeOdw4qx7GQmmY=;
	b=EmlI49Dd65qVXPkuRWGs+YyqVe+4pb1+/nI7k4Szk94IQZY3c/e4iTMD+RgEo1NYEr
	neKWaPqENder13mILwU/HDK/c1WBNZfG33U57fV/BOfWIRtwe3gtNHJ48llRUipTYSMx
	wKYJchb2UtGU2NJOjdctozrNXUm0ofdIj53KWMlcJgBPoINPJMgAnJj4Mg2lJTLoAb+A
	3tZ/ogro5xzmBLWpN5QBvncuPPtDDyw98z867qgWCLDdcQA1ngu9eiYgbY6s5Y+CojWt
	u5EwVofBYsFYEryNNSAGYl5etR7um2lWqsVNvrSTvhYpfSDnXF9xhKgXzQc962TPoWkX
	Q10w==
X-Gm-Message-State: AOUpUlEF9KwrT2reKp28w4mfDBcQlq0V6I4FCLpA7x8pW9Ul7bmH+wqR
	xnxxKORSKDrG+z2FIjASDgCcs+38PDPiDpll5XI=
X-Google-Smtp-Source: AA+uWPza4E+T+otKY/rWs3RTwVny2wT0YYynemlgjBEPDcoxZbCnjHS2fXhdH2XaXvndkZCmAma8aMM3NS31AGEgekI=
X-Received: by 2002:a37:1be4:: with SMTP id
	m97-v6mr9843446qkh.12.1534642915665; 
	Sat, 18 Aug 2018 18:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <MAXPR01MB0348B0F7FCE0B995544DA5B291390@MAXPR01MB0348.INDPRD01.PROD.OUTLOOK.COM>
	<CAMKF1sosfZqgHsHaKi7ifNPobSiZxnzULf=15BLOXRw9TCa-nA@mail.gmail.com>
	<20180814075105.GN8291@hiutale>
In-Reply-To: <20180814075105.GN8291@hiutale>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 18 Aug 2018 18:41:29 -0700
Message-ID: <CAMKF1sr4tcDx98-gHnOHuXf+ugZb=0Y_cN1KxSTYxG6=rXV5LA@mail.gmail.com>
To: Mikko Rapeli <Mikko.Rapeli@bmw.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] ltrace: added alternate source
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
X-List-Received-Date: Sun, 19 Aug 2018 01:41:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 14, 2018 at 12:51 AM <Mikko.Rapeli@bmw.de> wrote:
>
> On Mon, Aug 13, 2018 at 11:23:49AM -0700, Khem Raj wrote:
> > On Mon, Aug 13, 2018 at 5:37 AM Aditya Tayade <Aditya.Tayade@kpit.com> wrote:
> > >
> > > Description:
> > > As alioth (the Debian service hosting anonscm) has been discontinued using https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz as a new source for ltrace.
> > > The new source tree SRCREV SHA "ea8928dab8" and old source tree (from discontinued link)SRCREV SHA "c22d359433" points to same git history but have some diffs.
> > > Hence added a patch which applies the diff to SHA "ea8928dab8" to make it same as SHA "c22d359433" from the earlier git source.
> > >
> >
> > it might be better to push a repo from
> > https://alioth-archive.debian.org/git/ltrace/ltrace.git.tar.xz into
> > github or some place. Have we asked the debian salsa migration team if
> > this is planned for migration at all ?
>
> Yes, but hosting the git repo feels like taking over maintenance of it too.
>

we might have to do that if we depend on it and no one else cares regardless

> This patch enables building ltrace from poky master and sumo again without
> ltrace sources in download caches. Thus I would take it.
>

I gave it a try and it failed in patching

Applying patch add-support-for-old-source-commit-SHA-c22d359433.patch
patching file sysdeps/linux-gnu/mksyscallent_s390
Hunk #2 FAILED at 37.
1 out of 2 hunks FAILED -- rejects in file sysdeps/linux-gnu/mksyscallent_s390
patching file sysdeps/linux-gnu/s390/syscalls31.h
Hunk #1 FAILED at 35.
Hunk #2 FAILED at 65.
Hunk #3 FAILED at 89.
Hunk #4 FAILED at 108.
Hunk #5 FAILED at 157.
Hunk #6 FAILED at 183.
Hunk #7 FAILED at 201.
Hunk #8 FAILED at 217.
Hunk #9 FAILED at 287.
Hunk #10 FAILED at 306.
Hunk #11 FAILED at 329.
11 out of 11 hunks FAILED -- rejects in file sysdeps/linux-gnu/s390/syscalls31.h
patching file sysdeps/linux-gnu/s390/syscalls64.h
Hunk #1 FAILED at 41.
Hunk #2 FAILED at 109.
Hunk #3 FAILED at 188.
Hunk #4 FAILED at 287.
Hunk #5 FAILED at 306.
Hunk #6 FAILED at 329.
6 out of 6 hunks FAILED -- rejects in file sysdeps/linux-gnu/s390/syscalls64.h
Patch add-support-for-old-source-commit-SHA-c22d359433.patch does not
apply (enforce with -f)



> -Mikko

