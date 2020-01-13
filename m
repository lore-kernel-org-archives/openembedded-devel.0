Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 696F27F87E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 20:38:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e5so10343515qtm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jan 2020 12:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Kwme+U+CBvG/A8fgLQFxKUPM5VYKYiGyihCmptJa17s=;
	b=d9yRxIxVGEsbRUKeyovaaZJcQFNERFZfOYYglOMoWABBG2FPmBtT20zgRTuf0LMXdr
	JjQ+LwbV3Dq3wylVBf/kv5NXMQ9V37vUpVtM3+xZx7wmXqFDtTw+QVm9UaXCVWBhAvqH
	0pRys2fEJ37rnL5vscItxolNJrVxMbDgAf5xHcXxsFxrA5MmiySoyfcggtvRp+KSAf27
	u68O/HHoiu19A3ZATNhSry8ZvxzoUujW1PjPp8szJjZzoUPfFblzjp86dDNIGpT3BI++
	0RNb2d5mKoEGzqd6p/uGK8F4iTBHRlo1VdMxbZY7IT/IwrBxPMlhoFe/R4EFKSxfPbDg
	zmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Kwme+U+CBvG/A8fgLQFxKUPM5VYKYiGyihCmptJa17s=;
	b=ru9ODn34nMu82Qa4dlI0wS0CaevNHL8a8o89kFAryS5P7YqNv9j8JkX4GvDoBEcRyJ
	3rW4+AdxQibl/D38xq8tM4FmI7fhPX9GOkxIGxRS9J38BrEzd+8Dxdg5NlxGkRiVM1yH
	Rfpw7LOeSMVe+fLbyiy9qF6xL36MvXovrGf9OSxUt0EVNacRMAi0ZZX5axExeKjLQAq/
	Q0ZVPD9E0Rxw0dvAyJG5myLC4BEo/WLNny2T6+5oCIWtVQIBgVkFL399cjc13s3MDATr
	aRpCZmpc0/Oq6X6zTKGcOXyB7ko4DT/uqyUi7upNpMEYXVjg5JfpsZFdqcBSQ//P+y1X
	HPOQ==
X-Gm-Message-State: APjAAAW+r5p//KqgdRi6FxzOSaecXUJYhtvvVuqMSutc5pxXhZiMQyoL
	X0zewazyZpHJpEYjRqMNnNfK5mK/PRUf7tUhQHY=
X-Google-Smtp-Source: APXvYqyWca71bMNMqNGEagI3dk859JBUfjvvtJXWwfY2uSAUOYrbVWAEt+MrqZlYbVVTMEfiNh6Brs0Wss6YSHqhxNA=
X-Received: by 2002:ac8:4657:: with SMTP id f23mr425203qto.378.1578947925888; 
	Mon, 13 Jan 2020 12:38:45 -0800 (PST)
MIME-Version: 1.0
References: <20200113170209.95601-1-alex.kanavin@gmail.com>
	<20200113170209.95601-3-alex.kanavin@gmail.com>
	<CA+chaQec=MyVT6a7FkmKPG5izt5UydqhSXqv6-POKh558Y4etA@mail.gmail.com>
	<CANNYZj-j42s83n9RsWoDpKyTpQUhWMGx9=82zVt0Doa=MDFy9g@mail.gmail.com>
	<CA+chaQdXtycq=z3+2i2VK7+7TDQKjU3JCcE4nFxcav37z1cOwQ@mail.gmail.com>
	<CANNYZj_p5cHwcM8BntPOPGC-vSHQRBVpKF5WU8UHssPG=k42jg@mail.gmail.com>
	<CA+chaQeRLhqmbWvXh5TPokUumfdtfdERkmcs6X1Rd2+AqMZHTQ@mail.gmail.com>
In-Reply-To: <CA+chaQeRLhqmbWvXh5TPokUumfdtfdERkmcs6X1Rd2+AqMZHTQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Jan 2020 12:38:19 -0800
Message-ID: <CAMKF1srVEtGfgX9ozygNAqfK0N6BSOW4rOTEEwom0+sOsCuCUw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/3] sysprof: move from meta-oe to meta-gnome
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
X-List-Received-Date: Mon, 13 Jan 2020 20:38:45 -0000
Content-Type: text/plain; charset="UTF-8"

I have queued Martin's reworked patches

On Mon, Jan 13, 2020 at 11:18 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> Yo're welcome!
> Current 2/2 is the same as 3/3 was, I wasn't resolving any conflicts.
>
> On Mon, Jan 13, 2020 at 8:14 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
> > It does not figure out the 2/3, and still forces a conflict resolution.
> > Thanks for doing it (if you correctly resolved the conflicts), but I still
> > think it's entirely unnecessary.
> >
> > Alex
> >
> > On Mon, 13 Jan 2020 at 19:58, Martin Jansa <martin.jansa@gmail.com> wrote:
> >
> >> Doing "git mv" in interactive rebase of the first commit should be really
> >> easy to do and if git doesn't figure out the 2/3 automatically, than you
> >> can still check that the rebased 2/3 looks like the current 3/3 did (and if
> >> doesn't then just squash git diff into it), I don't see how this is error
> >> prone.
> >>
> >> On Mon, Jan 13, 2020 at 7:52 PM Alexander Kanavin <alex.kanavin@gmail.com>
> >> wrote:
> >>
> >>> Because I already had the patches ready, and simply added the move
> >>> between layers on top of them. Placing it to the right layer requires
> >>> either a patchset do-over from scratch, or resolving a merge conflict with
> >>> possibility for mistakes.
> >>>
> >>> Alex
> >>>
> >>> On Mon, 13 Jan 2020 at 19:15, Martin Jansa <martin.jansa@gmail.com>
> >>> wrote:
> >>>
> >>>> Why don't you add it to the right layer in the 1/3 change?
> >>>>
> >>>> On Mon, Jan 13, 2020 at 6:03 PM Alexander Kanavin <
> >>>> alex.kanavin@gmail.com> wrote:
> >>>>
> >>>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> >>>>> ---
> >>>>>  .../files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch  | 0
> >>>>>  {meta-oe => meta-gnome}/recipes-kernel/sysprof/sysprof_3.34.1.bb  | 0
> >>>>>  2 files changed, 0 insertions(+), 0 deletions(-)
> >>>>>  rename {meta-oe =>
> >>>>> meta-gnome}/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> >>>>> (100%)
> >>>>>  rename {meta-oe => meta-gnome}/recipes-kernel/sysprof/
> >>>>> sysprof_3.34.1.bb (100%)
> >>>>>
> >>>>> diff --git
> >>>>> a/meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> >>>>> b/meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> >>>>> similarity index 100%
> >>>>> rename from
> >>>>> meta-oe/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> >>>>> rename to
> >>>>> meta-gnome/recipes-kernel/sysprof/files/0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch
> >>>>> diff --git a/meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
> >>>>> b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
> >>>>> similarity index 100%
> >>>>> rename from meta-oe/recipes-kernel/sysprof/sysprof_3.34.1.bb
> >>>>> rename to meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
> >>>>> --
> >>>>> 2.17.1
> >>>>>
> >>>>> --
> >>>>> _______________________________________________
> >>>>> Openembedded-devel mailing list
> >>>>> Openembedded-devel@lists.openembedded.org
> >>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>>>>
> >>>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

