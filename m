Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
	[209.85.222.182])
	by mail.openembedded.org (Postfix) with ESMTP id 756EF7E3BC
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Oct 2019 16:57:01 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id y189so8845737qkc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Oct 2019 09:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UO53qJH7VcDI4gQN4f07WH4boQWhbuA4uj41Tg8mkdo=;
	b=REbPHh+XrO5grtEn68WuskrFGJblR9f6FY0sCrb9D5E41ZyciHlAaKs4i9FpEmoPSg
	TtbmaBpkjfTWBKKrsb9ZmNHFCRaM/GMZuyTEgc9z8T1UctYOBMwa+nlC5QXbLd9x3D0F
	yqhpaOiifDB80UKU15mtoIo1E8ckxDjsrsfsMpJGk1b1NRRoro7P5vEdPfZUIgXsvZRH
	O1HKbwQEK4JLA5Ihn7W+/5Od+YLrpyxHaZVj2DhmSMNEsEqm23e0Xw6C0D383WdFFZwx
	eFfRHEYgkwW9gilLbUod+7UWkdIu9icAV9g095S4PdwWOks2sjdt2pRX9ZKffWWp+vHh
	9hAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UO53qJH7VcDI4gQN4f07WH4boQWhbuA4uj41Tg8mkdo=;
	b=a9Jdu/O3WysuJS2GWw/3mYurrroP3gG+AR/6BnFruY6y+N+841x0iCqaWufhux7Szo
	TzdvPUswkHaOeei5qqnqwcwIC4XUwDP2ZzYH7EZHEETrhag1pQsJbxFTQYLHk0Mg0BCt
	OjBpY5/bJQPlzeChh+CccEVBXfbI5Ay5C7KsdsArEXrSW0j8lYE6FR6cLqq5Wu7FcqMc
	OYJ5kUPSQcsvS/Syn2WPGlBZlw9lIi+DRJmyqir+/uDV+qvesZC7f5gVoieQYAFGlM12
	ctyqI3V299KiCQ4lfux3phvysIEfBoUUhW+ItrbnoMzHPi0w9n71wSlXaBiOMwMA114+
	Zbcw==
X-Gm-Message-State: APjAAAUlwA5rcDqR5a4XuDFris7ISCdjWy7YTQ4MAulkk//c2HsdRVSt
	BfaMMOWSrx21KQ6BPuwpBJj4pUE9cP6HED/rBgM=
X-Google-Smtp-Source: APXvYqy7an/WVCEI2To7Y/UOhIv4ggwDjS+BIo9Q0ttmdPKcfSUULmzeE5KzueoDWPSwAOUqr+H3xs3neL6eWO44C1c=
X-Received: by 2002:a37:5d83:: with SMTP id r125mr16316127qkb.9.1570294622054; 
	Sat, 05 Oct 2019 09:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <1569632199-7446-1-git-send-email-denis@denix.org>
	<20190929124339.GC30130@localhost> <20190929162007.GZ30018@denix.org>
	<20190929181449.GD30130@localhost>
	<59a54a48-0e0f-8cdf-f51b-0e5fdd70744e@gmail.com>
In-Reply-To: <59a54a48-0e0f-8cdf-f51b-0e5fdd70744e@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 5 Oct 2019 09:56:35 -0700
Message-ID: <CAMKF1sp94wxzUrxb_t7FdzvcLHye1pr67S3YXY31o5EHd_HmDQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [thud][PATCH] mariadb: update SRC_URI, as 5.5.64 has moved to archive
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
X-List-Received-Date: Sat, 05 Oct 2019 16:57:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 5, 2019 at 9:12 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 9/29/19 11:14 AM, Adrian Bunk wrote:
> > On Sun, Sep 29, 2019 at 12:20:07PM -0400, Denys Dmytriyenko wrote:
> >> On Sun, Sep 29, 2019 at 03:43:39PM +0300, Adrian Bunk wrote:
> >>> On Fri, Sep 27, 2019 at 08:56:39PM -0400, Denys Dmytriyenko wrote:
> >>>> From: Denys Dmytriyenko <denys@ti.com>
> >>>>
> >>>> The old URL now gives 404 Not Found
> >>>> ...
> >>>> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >>>> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >>>> @@ -4,7 +4,7 @@ SECTION = "libs"
> >>>>  LICENSE = "GPLv2"
> >>>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
> >>>>
> >>>> -SRC_URI = "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz \
> >>>> +SRC_URI = "http://archive.mariadb.org/${BP}/source/${BP}.tar.gz \
> >>>> ...
> >>> This change should first go into master (and also warrior).
> >> Yeah, let me just go downgrade master and warrior to this old version,
> >> so I can fix the download URL...
> > archive.mariadb.org has all versions, including some that are even more
> > recent than the version currently in master.
> >
> > Not changing the URL in master now will only bring us the same problem
> > in zeus later.
>
> Currently Thud is broken and needs this fix. Being proactive to avoid a
> future issue should not be a reason not to take this patch.
>

using archive.mariadb.org makes sense for master too, so I have gone
and adapted the patch to apply to master as well. however, it wont be
a straight backport for thud so you have apply the proposed patch as
such to thud. What is done on warrior needs to be figured out as well.
see

https://patchwork.openembedded.org/patch/165527/


> - armin
> >
> >> Denys
> > cu
> > Adrian
> >
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

