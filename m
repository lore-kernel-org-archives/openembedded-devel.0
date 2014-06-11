Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id D41DA6AD16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jun 2014 03:20:12 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id hz20so69561lab.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 20:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YT9AeyDyVd0EDcjiRe8bb4JldJv9YTvnhUuvBq/u4Tg=;
	b=EaujAoECyPbi1zoDD4u6nt3f/eD9xX9whYfR+mH/F/iaFtKgMjfbCUrQlpYAJRKg1e
	vp00hWV2QuCtCGtF4KW2GNrLNxt/RFIH1sI5R7krXCAQXjpsT4DHWfm3EoI6+yZN7A2U
	Uu2GmSPMXZEXJ059sRlAlEzFVDjBEe/l5YrRuSdnYMfLyZVGlbFWAy8D5u+JkprG4xwv
	Rj2BZFCMeFoFPPAWXM2bx21qjIIOi66cEuTDcCgoRMgtHRZkqac1AKth+BxL/Vbj9ocF
	0ahy/I8cL7s6Tivx3i0FIPTQbJ1rGmEf1taB01ZOCoGcs4EaInxUDo0BCvYHOV6EkXAQ
	WKjw==
X-Received: by 10.152.197.69 with SMTP id is5mr25662436lac.10.1402456813311;
	Tue, 10 Jun 2014 20:20:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.148.170 with HTTP; Tue, 10 Jun 2014 20:19:53 -0700 (PDT)
In-Reply-To: <1770553.GcPTkVXTr4@peggleto-mobl5.ger.corp.intel.com>
References: <1770553.GcPTkVXTr4@peggleto-mobl5.ger.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Tue, 10 Jun 2014 20:19:53 -0700
Message-ID: <CABcZAN=C89LopMeHf45bgHsLeFsUcs02FYxrZ9a0tzi00Z0+rA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>,
	Phil Blundell <pb@pbcl.net>
Subject: Re: Old OE history
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
X-List-Received-Date: Wed, 11 Jun 2014 03:20:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 9, 2014 at 10:34 AM, Paul Eggleton <paul.eggleton@intel.com>
wrote:

> Looking back through OE-Classic git commit history, the first commit (from
> Chris) is basically an import; so it seems to me that at one point we did
> have
> some more history from before then. This was before my time on the
> project so
> I'm not sure what we had before bitkeeper (if anything).
>

This doesn't seem accurate to me. The first commit is
bda361cba6cf49d92d21f44c87a9d2f13511d551, which created an initial mostly
empty repository, which was followed by
c11afe579262bdabdf3af8fdfcb24b3598bf0232 which added a couple initial
recipes, etc.

At one point we used cvs, which got imported into bk, which got re-exported
as cvs, which got imported into mtn, which got converted to git, or
something like that, if I'm remembering correctly, anyway :) And of course
I did some careful grafting of the earliest histories. I'm pretty sure we
have most of the historical repositories around somewhere or another. I
know I have copies of the bkbits repository for bitbake, the oz buildroot
repo from various places, and  the cvs exports of the bkbits repositories.
It is of course possible that something got lost in the translations
between scm types along the way, but I'm not aware of anything missing
offhand. And of course the initial repository was prior to bitbake being
split out, the split of the early history between bitbake and openembedded
was done by me, as carefully as I could, but iirc we still have the old
'oe' repository which was prior to the split.

If I dump a list of every file which has ever existed in the oe classic
repository, and then grep out qt.*/compile.patch from that, and use git log
on those files, you can see all the way back to the import of the initial
qt/qte patches from the oz buildroot, and subsequent changes to it after
that:

    git log -- (git rev-list --reverse HEAD | git diff-tree --stdin
--no-commit-id --name-only -r | sort -u | grep 'qt.*/compile.patch')

Aside: I have 'git rev-list --reverse HEAD | git diff-tree --stdin
--no-commit-id --name-only -r | sort -u' as a standalone git-ls-files-ever
script. this is particularly useful when splitting git repositories up, or
doing complete svn to git conversions, to ensure that you don't miss any
files, as git's --follow isn't always sufficient, nor are other uses of its
copy/move detection.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

