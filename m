Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f178.google.com (mail-ua0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id C8A237732E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 17:24:09 +0000 (UTC)
Received: by mail-ua0-f178.google.com with SMTP id x12so34171383uax.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Feb 2017 09:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=+xLG3sPqtgTt4ixQqTfgolEXJ5jd1a26qzHnuix5PB0=;
	b=HoTJgPBV/yNUKbiM3ayI6DJJacDeZwydlHd2tRjH7feuqMcKT4CZBgkSj/EwgdRQ2s
	sieer+KKt64eAhqVEysfuUKKEXLleSrbNIcUPklF0duluB9OpytmM0PMwPx7zzvnh80G
	gDgfbLc+RwI/mwg3gLi+Bngd0a05iWxOQDvJ9PG8kT4FeJDDf50jvcSIdBzhI6l/4JMq
	CshvSPX83vpq3k+OGbo9sWgZmXfaMZ4mJG8q73MOJxcfQs1zDzpU53NTB0qlRVcG7UDJ
	zfYpYHymjPTe6EzSQRka0INnC60BGx2D7z4W2cNxZD6g7MuVemNrUCOXjUCOwe4syF5S
	ItXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=+xLG3sPqtgTt4ixQqTfgolEXJ5jd1a26qzHnuix5PB0=;
	b=W3XddWoQvFJbUEyXTZjA8x/byOkIEPBdgPM9bfL1tIZHVZhqz45+Xu7+Qnx9PiKR5m
	87g8cu2SkOAfmzxgPk+faWCyKNPTxF+BDtRmZsaQD49UJBD9W1cpbM7W2fIjCbVf6Ijd
	4PXuVZAR/CXXVsFn+4HDx6+OD25tLw0CIEzDC7hpYYIOR8rZiWxGpsNpClOa++ooRG6+
	P4rqe8Tsr94ClSrR4iujb8POfG3ysIjxk7jog0aY5pSq2KUxNIpBRjasXHVaT6Wvx8Rl
	XT2dr4WTbj9U6iB0PjoHsmwf+ca406Un7Bs2rByPA3i04d6/ua0UmtYuOLNGmnuZ54iB
	wlfA==
X-Gm-Message-State: AMke39kg7OshiZrRMjBQZrdfRlRLZVzBgf0ihvhOFGpPerwTEpD0oeLwXm5xYQDTD22/9+N8stl/QHKBv8NXpg==
X-Received: by 10.176.1.51 with SMTP id 48mr3973639uak.143.1487352249499; Fri,
	17 Feb 2017 09:24:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Fri, 17 Feb 2017 09:24:09 -0800 (PST)
In-Reply-To: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
References: <CAJTo0LZRyFFJC8nSTa=xDiAPFcOYGU5MHW04nEoPezydBz+3oA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Fri, 17 Feb 2017 18:24:09 +0100
Message-ID: <CALbNGRSPZw+LL3JXv4+D+k2C3DAV=5_U=44M8fcSU50V_-7KEw@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Fri, 17 Feb 2017 17:24:10 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 17, 2017 at 6:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
> The recent storm of breakage in meta-oe caused by recipe specific sysroots
> was quite dramatic:
>
> ross@flashheart ~/Yocto/meta-oe ((044e518...))
> $ git grep PNBLACKLIST| wc -l
> 320
>
> Is it time to talk about splitting meta-oe into smaller real repositories
> so they can be maintained at their own pace by more maintainers?
>
> Ross
What exactly gets better by splitting?

Splitting = Rotting to death due to unmanageable maintenance burden
caused by oe? Don't misunderstand me recipe specific sysroot is
basically a good thing. But I am tired of this game. As you can see in
meta-qt5-extra: I am interested in having cool images not in a cool
build system. Long live core-image-sato!

Andreas

