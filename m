Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id EDB987808C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 15:55:26 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id m103so63146iod.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=0083bGbJC0eCKQLacpoQcOw2BpT81PmmaYQzBBhqP6Y=;
	b=Fj6T85NMQSC0U/R61ScpD8IMCJTI9Al4sxLHwvl7BvqDFjjTYsdTdKGowwK6woCYh7
	PGLn5sT9PlklInygXRbDJGS/yDxs2lF7pS3rBguQZ6OtmNmEExrlWX/n8xIC2CjtJZOL
	GZ3pG2x8M6YsGxLvdZ+DZjB8x8cBUTBY1VdoXrssMSPn7Gzp+mvDiC7dGm+IVyFLfSQ3
	OGUNpZojkDwCvU5mJbfe2fDj+bruOBAUGBORRe9OAThACQIvuof8z9tZrT0hI9LC2GbP
	avsjlsWVe+IE9oLuEQYFacdcoSrbdUjG+zexrnEG2lKcc8CqkJecT8XFDeEwWfaym1q9
	NOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=0083bGbJC0eCKQLacpoQcOw2BpT81PmmaYQzBBhqP6Y=;
	b=MCoe7fSrmSJb1yfH+5WXmB4+1YtoEQ71cpJrx4xOZNZ5d1eVFmjSpt+O4dbvMgE7nb
	vaMLe9IjwvlJgpQoxhVSdxxKDxAKo1X9YDWHZaVxxdke7C9FzmiuVxJX6oQvJYYvbTs9
	E++lXwIHg9qNmgWLAQCHK81ZJY7HSJYHN9NSesTrvqPsv8ZKjY3FxUbiH5g3G5Ckxnxh
	DTLJFj+vIZ9vheEYtFIWx0xmSlkJmSTwgeryH2yyiZKFZAEw+NWHoRzVGCQh9yVx1JzS
	GSqt0cZ1jXbgMVEQI3vrUseu8b5ETjIGQgIRvKUaLbqvS4L8Um8AUpjyadyE67T36BrM
	EXgg==
X-Gm-Message-State: AHPjjUhgbA9tsMHCcvoJ4ajgZs7o7o2BTTr6a+V8bRxDBnTm5uwd4d/b
	hkRK6J+L0h8VgSf1S2Uljqe62BsH5tDVqvIOWLEZrw==
X-Google-Smtp-Source: AOwi7QAYDFjmhzoRxKsV1qyB7/ZtDawfg9HlAbBodcgoEaPGyMjAoCARlz6US60M5r8GFKbZ/w6gXhZy5MtbXM4QuUc=
X-Received: by 10.107.133.92 with SMTP id h89mr2311077iod.208.1505836527886;
	Tue, 19 Sep 2017 08:55:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Tue, 19 Sep 2017 08:55:06 -0700 (PDT)
In-Reply-To: <d2cf577f-a995-9cc2-380b-9a1922926abd@igalia.com>
References: <CAJTo0LaTCgNx-g8jyhULWNs3bNiouu2JbptobWE5vbFVwgVnxQ@mail.gmail.com>
	<d2cf577f-a995-9cc2-380b-9a1922926abd@igalia.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Sep 2017 16:55:06 +0100
Message-ID: <CAJTo0LYtC2MVYqwz_LkGEAvNuDKCQByH1r5QBv-TZKBi499meQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [OE-core] Use of github /archive/ tarballs in SRC_URI
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
X-List-Received-Date: Tue, 19 Sep 2017 15:55:27 -0000
Content-Type: text/plain; charset="UTF-8"

On 19 September 2017 at 15:34, Carlos Alberto Lopez Perez <clopez@igalia.com
> wrote:

> On 19/09/17 10:09, Burton, Ross wrote:
> > Then the tarball for one of Erlang's repositories changed, and was
> noticed
> > by the checksum in the recipe (thanks Gunnar Andersson for reporting
> > this).  The extracted contents are identical, but the tarball itself has
> > changed.  I'm presuming this is due to the old tarball expiring in their
> > cache, and a newly generated tarball using a later version of tar.
>
> I don't think tar is the one to blame, but gzip.
> I have just tested GNU tar (versions 1.29 and 1.26) and BSD tar (from
> OpenBSD 5.8) and the 3 have produced identical archives (same md5sum)
> when invoked like git archive does.
>
> However, the .tar.gz file generated was different in the case of BSD.
> It even had a different file size.
>
> I bet that if you uncompress both files, the .tar will have the same
> checksum in both cases.
>

In the situation that I was talking to Gunnar with, the source is the tar
itself.

https://paste.fedoraproject.org/paste/rP67aSPn1IuYbQcz2UNY3g

They have identical length
> $ wc -c new-OTP-18.2.3.tar
> 159068160 new-OTP-18.2.3.tar
> 159068160 orig-OTP-18.2.3.tar
> ...but different content
> $ cmp new-OTP-18.2.3.tar orig-OTP-18.2.3.tar
> $ new-OTP-18.2.3.tar orig-OTP-18.2.3.tar differ: byte 79122433, line
> 2004431
>

Basically, both tar and gzip can cause problems.

Ross

