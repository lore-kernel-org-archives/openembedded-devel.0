Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 17DAA601F6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 01:02:16 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id k12so1568383qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Oct 2018 18:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dF7luz7axyFRKGMV+mcXuhpi9dmASpwQaALt36H2MEk=;
	b=FIjplVI74WkKawRPudUbJiAbDdiY33CW+rB8DRwr3gi6FSKzyMv6+Gn559JN/dN5YM
	5+0jt0E7db4zhppNkfaYjNDTymSJI4Lq7dgtvVp4TCZjbYXCSRx8Lpryj0Bb+ryY34/B
	BtCVX5b6F909tisHLF3T2f7Z0WxsMiBdleOL4geA5pHtQ7lEMC5AL8I5MrzWxcMy8x0b
	YqChsGilpmKZMGnfKdjskYPjXA6RCOMXI8TtSawR8r6p62M4KITEIINQywN/uDm5xOOc
	1vwKKGB1aVfp1s6nCdmm52MkEyFZuFQ/SpOFgZMpLpHMc1pEtSf96dLMr6SxGT/VBmwY
	LzWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dF7luz7axyFRKGMV+mcXuhpi9dmASpwQaALt36H2MEk=;
	b=SQKRFCykkSLxaH0bEwbClg72sNxaytpXPYGrjU/IL+OPrAKPMaYdJ1Wl8kUGObqSAx
	fVgsh7121169u3SAtioxgZ1z4OOcn7F1OJBMGBQCupoCx+cnkEP97ZY8833Zj5fAbjR+
	Avfi7FsG2xmvqbCay8RgwWmS/mXrYZvC9pP0xbnGAsgJBvnjDkppN7r9Ky0aP+s70MdJ
	ktuGB8vZZ10SUgQ5jop5v3qRFz8c7i7nAHG+huxknx0+8lwdE/1ZpIbl1cx3PFaBky+N
	Sgf+gkf0nZimTAlDD9DofGRT4ueaEGXZd4YxsR7wbFOSZGnij0RNOv9Mngr/TG32tcF4
	Yr8w==
X-Gm-Message-State: AGRZ1gKSylnS2qILuLwx2jL1LjukTW2K7WkLzlHxqep6Onezw8faQbp8
	1afhUxkPVI0yGcdK6nIJ3ZxRL+3UpvyqRMGLqDnIV5W9
X-Google-Smtp-Source: AJdET5fRTkzebDrA2kJmJJyRt8pQjueh7+2ZC3lYQFNfpQaTyjkkyawuCLWgsfYzE78Ui5LbzIlb9XCRom2bFxAZd98=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr1241794qvq.55.1540774937600; 
	Sun, 28 Oct 2018 18:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <ba059985c4c24fd2b748631eea646ecd@innerrange.com>
In-Reply-To: <ba059985c4c24fd2b748631eea646ecd@innerrange.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 Oct 2018 18:02:06 -0700
Message-ID: <CAMKF1sqGQwkMinhNAjcmjkHHBmjuvrc_dCzumE-_eaL+x6WKXg@mail.gmail.com>
To: Craig McQueen <craig.mcqueen@innerrange.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: samba minimal smbclient
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
X-List-Received-Date: Mon, 29 Oct 2018 01:02:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 22, 2018 at 11:59 PM Craig McQueen <craig.mcqueen@innerrange.com>
wrote:

> I'd like to use smbclient in a project, with minimal functionality (just
> to copy files onto a Windows machine). But the samba package adds something
> like 10 MB to the project. Is it possible to get a cut-down smbclient-only
> package?
>
> Previously I was using Yocto morty, and I managed to cut the samba package
> down quite a bit with a suitable bbappend. Now I'm trying to move to Yocto
> rocko or sumo, and finding my previous methods don't work so well, so it's
> increasing my project image size by 8 or 9 MB.


I think you should check the packageconfigs and secondly check the runtime
dependencies which are now new as compared to older version I think
trimming it via a bbappend is a good approach

>
>
> --
> Craig McQueen
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

