Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 40B8F7F2F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 01:57:48 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id 44so1893930qtg.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2019 18:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YloP+WZJxaxgEpHxWfRFM0e/1Yp4jt7qvdj+t3YJGIg=;
	b=pqLlEWf8HpK7B/I+BqvUcV1qWBQvHng4ov3JZpiN8HvlYhNqQiBY/0l53FNPxgUici
	qfAiKTKPLtGC8g/r1+jEAXJ1VQHLeVZ2CYd032X5WOz0qkHY10jp+5S1yLgHjwt+hfaq
	bqrvMMUdhR/jio3HLTSRmpiJeIMlrnU80iz4+dZE80FHfttoWQca8cgankFk3vJK88vr
	YfcQLqGPuW/YmCopRVgwb64QaNfstKf5Ve/CORGZrSmVy0PijTVEU1HeRARBE0Y2EyRs
	zu4bX7zbSNgMGMv3ji9/PnIHH8uriiXEA9bRQpmogojNauc5FO9eBWA1y3Ipeps9p9an
	ngMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YloP+WZJxaxgEpHxWfRFM0e/1Yp4jt7qvdj+t3YJGIg=;
	b=kNpReevgaEUjvU98rI9UvCh6ZJsonzJz5fXQk9ZoVCIewhFu0HhS+ZUvIVjq1CFjhh
	Dx8nw8PXzY036Er9SLdD5/m8R2VeahO3QF4BVubOl7q7AsgpW6ja39QSRU+BgYuNz0ms
	B+SfaB7epMzIDg8MEwKMnENiMqBfErdByE17EWHP14eN+0PiwI6A6zi+JHPsfHMOBw3f
	zVtkA/BDuP+PRtpYvASuEK969FCJbsIyLYgs4SmXzLz+4iFnkO4tijAqeTyggd9pYoqV
	0tH3ohD96vUIgflN1wfZYllbLpewQKU776CtiGJ6huNfOWLkiJs9qX80owCLWuzC4eY2
	z8Vw==
X-Gm-Message-State: APjAAAVLdiU0v8rTv3O4/GNObhN8jPeMg/PPX+/mUiWWmUnqw7j1ykzG
	0FzckCdcocciqXblt3v5p3qdqPvdipfZ03t6iumRtOZGPlA=
X-Google-Smtp-Source: APXvYqwCe6GM5/X6+PYP38sQa2J9BB+oB/v0h0N8QB0Yn4QPyYMcy2u0Ta0gD/f/9eJ+8TfL202FetZcQ1+a0Phu5GE=
X-Received: by 2002:ac8:764f:: with SMTP id i15mr7384261qtr.194.1567043868911; 
	Wed, 28 Aug 2019 18:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190828034307.182169-1-kai.kang@windriver.com>
	<CAMKF1sroS6zWjdRmh2GLbCF62Hnmifzdr282t8JZBB-ONzd82Q@mail.gmail.com>
	<20190828180616.GA3044@localhost>
	<CAMKF1sq84RHmHY3dyj7rpO=w3xDQry3jAHG6ZeOiQvLMiMnRVg@mail.gmail.com>
	<20190828195635.GB3044@localhost>
	<CAMKF1srYu8m58Mbvek7wsXgty=K1YT-TBQuXcPnZsSU7rbaDOw@mail.gmail.com>
	<20190828214003.GE3044@localhost>
	<0454f751-2c68-6654-0ba0-8aa0b4d72259@windriver.com>
In-Reply-To: <0454f751-2c68-6654-0ba0-8aa0b4d72259@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Aug 2019 18:57:22 -0700
Message-ID: <CAMKF1srNLP=ZZqVBSGVriWP_MDxW6-KxLdU5Z_Ry4d55ciZKLA@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][RFC PATCH 0/1] Failed to compile networkmanager with musl
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
X-List-Received-Date: Thu, 29 Aug 2019 01:57:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 6:47 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/8/29 =E4=B8=8A=E5=8D=885:40, Adrian Bunk wrote:
> > On Wed, Aug 28, 2019 at 01:32:52PM -0700, Khem Raj wrote:
> >> On Wed, Aug 28, 2019 at 12:56 PM Adrian Bunk <bunk@stusta.de> wrote:
> >>> On Wed, Aug 28, 2019 at 11:53:27AM -0700, Khem Raj wrote:
> >>>> On Wed, Aug 28, 2019 at 11:06 AM Adrian Bunk <bunk@stusta.de> wrote:
> >>>>> What about marking networkmanager as incompatible with musl instead=
 of
> >>>>> maintaining an ever-growing mess?
> >>>>>
> >>>> if the fix is specifically done for musl alone then I would agree, b=
ut
> >>>> in many cases, the fixes
> >>>> have been cleaning up assumptions in kernel UAPI headers on glibc
> >>>> provided headers
> >>>> which is a good thing, and it does take some time for kernel header
> >>>> changes to flow upstream
> >>>> but eventually, they do. e.g. see [1]
> >>> This is not a cleanup, this is a workaround for a misfeature of musl.
> >>>
> >>> The kernel userspace headers are the userspace ABI of the kernel for
> >>> usage by all C libraries provided in one place, they are not tied to
> >>> any specific C library.
> >>>
> >>> musl upstream does not even try to use the kernel userspace headers.
> >>>
> >>> The kernel userspace headers used to be a mess, but after more than 1=
0
> >>> years of cleanup there is no excuse for musl to insist on providing o=
wn
> >>> definitions of what is already provided by the kernel headers.
> >> I was citing an example, you might have good feedback maybe bring it u=
p
> >> upstream with musl or
> > musl upstream says the patched kernel-headers package from sabotage
> > linux should be used:
> >    https://wiki.musl-libc.org/faq.html#Q:-Why-am-I-getting-
>
> There has been a patch of networkmanger for the headers issue. And I
> update it then this problem gone.
>
>
> >
> >> ...
> >>> There is a benefit of a small C library when your flash space is
> >>> single-digit megabytes, but maintaining plenty of not upstreamable
> >>> OE-only patches for using networkmanager on musl without a sane
> >>> usecase is a waste of effort.
> >> I have said it before as well, I will say it again if we can improve a=
n upstream
> >> packages portability that itself is a good thing, but we should not go=
 overboard
> >> if its too much of work.
> > Networkmanager doesn't aim at portability and is too much work.
>
> Yes, another following issue is that NetworkManger uses non-posix
> portable functions mrand48_r() and struct drand48_data. musl doesn't
> recognize them.
> After adapt to posix functions jrand48(), it segment fault when startup.
> (The point of segment fault is far from my patch). Still working on it. :=
(
>

Can you look at
https://code.foxkit.us/adelie/packages/tree/master/user/networkmanager
especially https://code.foxkit.us/adelie/packages/blob/master/user/networkm=
anager/random.patch

> Regards,
> Kai
>
>
> >
> >> there are container distros using musl so we
> >> have a wide
> >> list of packages which work well with musl, and this list is always
> >> increasing, so I
> >> would refrain from pushing musl to a narrow usecase
> > AFAIK OE is the only distribution trying to build software like systemd
> > or networkmanager with musl, and container distros optimized for size
> > are only supporting smaller alternatives.
> >
> > cu
> > Adrian
> >
>
> --
> Kai Kang
>

