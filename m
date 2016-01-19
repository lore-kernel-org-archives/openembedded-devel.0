Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id D11E96FFDA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:19:34 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id k1so355963024vkb.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=wkYwrxn+FCjHqY0BywHF99al5pHgztkGoW5wLreflac=;
	b=hMtPcpC5Yu4TBdQiOyyT/hFAG3dYjcSMhoaiDGRSo7nl/+CyH6WVpuVknMrxJfUubQ
	Cyj8T08zmPhxf+nYl1gBvpasjE+SCdu14LKPvaV7ySZtBnQOUi7LlSFzKUQ2aJSQPXqX
	x++FoZB3DS+ekJaghhqhtpgtrAaXsgVthN/ztISGXQJjnhbJseL05d9ai9ho302fu+8l
	6bRHjCdiHugQaLFqEchcHTMJYiU5bBVlCQID+K9NRNoLwFLkldjdve0h7QewhQX5vfJN
	+tO5SMxw69D8BCuTsQq1fzCMOG396vDJj9XkM2itdfyvxx9BLY4L7tF4gqEvaDOXRsL9
	djBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=wkYwrxn+FCjHqY0BywHF99al5pHgztkGoW5wLreflac=;
	b=InZTDFqJ7u209GnzhjM2AUTLzisEn13CtjD9WBM5IFd0VcRsyX+krjhdwN2mfSjARG
	rNEsPLG+ghQlW794seQX5C8TlvtUL/2CriF2XZMXkSUvtHxS4K5ddDm83+4adwCr9Byi
	/ZOwBT8uqZV+IQqtcEQschu5JudQ4dq9eQr5LWuJExT4bIsFkW2IFus9fDjMiS+3P/Hl
	V04j4U6u4qIaZh5CB5yh9dIwSiNUfLPtICFfMczWe2Ih3pcpqJ2/WSZGK9ENF8aGfM2C
	Q9/rXdO0g+FJJHM0LfHjFdqxmRryzU7BmVAbYzlszEBxIbv8DuepS6FpZecYcj2s+aPK
	hw+w==
X-Gm-Message-State: ALoCoQlxqRCJmBQyJrUzLaSBzOC3iMFKnMXNtBet6E09nz9H7pryqspB33yEP0WA6FEWuGhSIN2xEKtYbTrQHXEq9GH1qI7Pvw==
X-Received: by 10.31.168.135 with SMTP id r129mr22911435vke.7.1453238374717;
	Tue, 19 Jan 2016 13:19:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 19 Jan 2016 13:19:15 -0800 (PST)
In-Reply-To: <19952B04-FAF4-41D2-A38E-878C1F40A746@gmail.com>
References: <CADySD0EvwTFr-0hGLTJDGTVLyhEtju3Rgxj85R8Tv=etXnRPuw@mail.gmail.com>
	<CADySD0EPvpk+zwvn0PKFChZPBev6xz-XOgbPx8W7mgNkwzsDxQ@mail.gmail.com>
	<19952B04-FAF4-41D2-A38E-878C1F40A746@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 20 Jan 2016 10:19:15 +1300
Message-ID: <CADySD0G7-Dv3z3H7BqwVWr_1cFGbOB1=AE=R+8Mo12y+u4Wkqw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: meta-toolchain-qt5 error on fido branch
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
X-List-Received-Date: Tue, 19 Jan 2016 21:19:36 -0000
Content-Type: text/plain; charset=UTF-8

I looked at one file from fido and another from master :(
Things looks fine in fido, so back to same error situation..sorry for the
noise

Khem,
I will send patches once my build is complete and tested


On Wed, Jan 20, 2016 at 10:02 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Jan 19, 2016, at 12:48 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> >
> > Looks like the problem is because of partial inclusion of following
> patch:
> >
> > http://patchwork.openembedded.org/patch/91807/
> >
> > libgcov-dev has been removed from libgcc packages but
> > packagegroup-core-standalone-sdk-target still adds libgcov-dev to target
> >
> > Requesting to remove libgov-dev from
> > packagegroup-core-standalone-sdk-target as suggested in the above patch
> to
> > fix toolchain build error.
>
> For tracking purposes you should file bug at yoctoproject bugzilla if you
> are not going to send patches
> to fix them.
>
> >
> > thanks
> >
> >
> > On Tue, Jan 19, 2016 at 1:57 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> > wrote:
> >
> >> Hi,
> >>
> >> While building qt5 toolchain, I am getting this error :
> >>
> >> Collected errors:
> >> * satisfy_dependencies_for: Cannot satisfy the following dependencies
> for
> >> packagegroup-core-standalone-sdk-target:
> >> *     libgcov-dev *
> >> * opkg_install_cmd: Cannot install package
> >> packagegroup-core-standalone-sdk-target.
> >>
> >> ERROR: Function failed: do_populate_sdk
> >> ERROR: Logfile of failure stored in: /home/nws/yocto-fido-dev/oe-
> >>
> layersetup/build/arago-tmp-external-linaro-toolchain/work/cortexa8hf-vfp-neon-linux-gnueabi/meta-toolchain-qt5/1.0-r0/temp/log.do_populate_sdk.65427
> >> ERROR: Task 8
> >>
> (/home/nws/yocto-fido-dev/oe-layersetup/sources/meta-qt5/recipes-qt/meta/
> >> meta-toolchain-qt5.bb, do_populate_sdk) failed with exit code '1'
> >>
> >> Complete log @ http://pastebin.com/CNuJk2i2
> >>
> >> I have tried removing previous build tmp/work but still get this error
> on
> >> fresh builds.
> >>
> >> thanks
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

