Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 27B7373CC7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 22:23:18 +0000 (UTC)
Received: by wicne3 with SMTP id ne3so131599991wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 15:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jCiQVbrsMgoUkvt+SUtSni+xeS1zWklP/aSV3YwdTls=;
	b=smSF0zWgBxBzKtWXtXo3bK2xuVYe8ansVV/rG6wmzY7JQ2CVug92vCDCwTsPzhHGoh
	+hLLPD4YG80Vi26TeXC46TSESHLXNex7sZhZA1k4nboX+QrAPQ1vQj1SIRGyFDYJf2N9
	mBlEkr8MaGtQksdWBumn5gsl2jTeoI4zImSnYLWeFfqd0hdYC6Zr8S23kVgPpGqndLPf
	5xAkZlvj1QeP7Mg9xPZscv3e2KBX9E9wZjPGFvXScES+v64xYtC7rH9fsMS9LaDKXq6X
	geaU8GMU6r0OqjCpJe3A3FLvenc15bTSQlLurmdFk7SWu0yhrYt0wi9LXVEi5linz12y
	98Sg==
MIME-Version: 1.0
X-Received: by 10.194.176.201 with SMTP id ck9mr27874164wjc.108.1440022998744; 
	Wed, 19 Aug 2015 15:23:18 -0700 (PDT)
Received: by 10.28.64.196 with HTTP; Wed, 19 Aug 2015 15:23:18 -0700 (PDT)
In-Reply-To: <1440021908.2377.11.camel@Saturn.local.all>
References: <1439137213-18585-1-git-send-email-max.oss.09@gmail.com>
	<20150818112042.GC30532@jama>
	<1440021908.2377.11.camel@Saturn.local.all>
Date: Thu, 20 Aug 2015 00:23:18 +0200
Message-ID: <CA+chaQdrpDHRCaGNPP3BZMuiM5jFvs8b9yObtHjPO+C6Sh7SQw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Max Krummenacher <max.krummenacher@solnet.ch>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libvpx: fix build errors for gcc 5
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
X-List-Received-Date: Wed, 19 Aug 2015 22:23:19 -0000
Content-Type: text/plain; charset=UTF-8

Sure, send v2 when ready.

On Thu, Aug 20, 2015 at 12:05 AM, Max Krummenacher <
max.krummenacher@solnet.ch> wrote:

> Hi Martin
>
> > Please test your patches.
> Sorry about that.
>
> >
> > gcc-5-max_align_t.patch and in SRC_URI there is:
> > file://fix_build_with_gcc5.patch
> >
> > I'll fix it this time when cherry-picking to master-next.
> >
> It is far worse than just a last minute filename change.
> Actually I had the missing file in another layer as I started the fix
> from a libvpx_xx.bbappend.
> So no obvious failure during bitbake and git status.
>
> The patch as it is now, even with the fixed filename, will do no harm
> but will also not fix anything.
> Can you not pull in the patch into master and give me some time to fix
> it properly?
>
> Regards
> Max
>
>

