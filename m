Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id AB7767866F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 22:11:55 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id z73so20435387wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Mar 2018 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZEM665+DG+FIS9I2eFSNT1MA4kHS8kckgiIt3hf4YRw=;
	b=f/9x8vqiJyLLqDoBnyr3U17ZQyM1jqkGg8vUXzWTdZ7xIwESu8JwAa43smxWdZrQ/o
	3pAMtHfgqv9uMr9zv62phWCcQAse1YkPFpqUFptkOJOfXm/nuN0lXk6MglrwLNg0Yyij
	pyQr690RYaYkw/dQZrIy512EPDxIAiiYfI15h3V5nYqZ45Qj7H56JfXt2BfOVXV2IXU5
	E4jy1TwfFoaja6cL31ErrxoWjyLKmX1ShG4zqEhKHSgl0uwk1HO9ec1IWxGazPo46jAD
	QqVw/1zoCf7CzaXyh7oHRVycIBm5T1KpnZPl+U1dkNE4UVd45iDjskyyCPub9Z69NAGb
	0kOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZEM665+DG+FIS9I2eFSNT1MA4kHS8kckgiIt3hf4YRw=;
	b=RRRIk8aSgP0PhXG/Db32HJvI0EYu1rItB/RvOsJzt3cLgcls7bRFRq4iRyqS44fdCF
	rVk17/7CqI+icAZg4y3lZruqyksqjPtnadM1Y/2KHR7ifN2W1wYqvoEh01wpS9RAsMfa
	timobzZAUPQag+Uq7q8oSTMRtaRcKK7oTVoY+b3Zta56RTlkhFrHEeMNQPaQjGImamUZ
	FhCYhN/z1gjdUPvGENyIv74D97P+yCa6XAyUYgWzO4FZgOp1yx1zL/cYPm0OOFMRFD5S
	db+BBrpsjrt0yoYgN2ajAfVT62fIfAqj9b0+vZkOTvkU3SDrbtIr57mSUHbYOrP2/uMl
	LrQA==
X-Gm-Message-State: AElRT7E4kW4XgqDrP84ChQe78YS6R2XTGR2/P+rjT5rTDeaNWx3EFJYq
	m7uFdVPnY/CMIrDxHHZRoz6PiuPZG9voYslu4Es=
X-Google-Smtp-Source: AG47ELvvurfVEhTvnbXkkUmvcP8A79fnBdrO80dJtu6RdCEM60uS4aNjIXag3vBjeTdmOhce/9kp/Q21BZ9zJQs8YYc=
X-Received: by 10.223.142.13 with SMTP id n13mr30005414wrb.133.1522102316664; 
	Mon, 26 Mar 2018 15:11:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Mon, 26 Mar 2018 15:11:55 -0700 (PDT)
In-Reply-To: <CALbNGRTNSvJT-PO1GMSaaVxpdGjuJKxZTotkXj9dFXLJVV7e-w@mail.gmail.com>
References: <CA+chaQdLz1OuDFa2BMTRz-D=xwFk4PFbASJOsxR=578_jQuP4w@mail.gmail.com>
	<20180326214334.26378-1-Martin.Jansa@gmail.com>
	<CALbNGRTNSvJT-PO1GMSaaVxpdGjuJKxZTotkXj9dFXLJVV7e-w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Mar 2018 00:11:55 +0200
Message-ID: <CA+chaQdxLj2hAqfvK1YKKKAsg0e3PxGor_K0nfamN+NWAw7hcw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv3] mozjs: refresh patches
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
X-List-Received-Date: Mon, 26 Mar 2018 22:11:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mostly because I find the proper patch headers useful.

When doing the refresh now, I find it useful to also add original author
and patch headers even to patches which currently apply cleanly, so that
next time I can just use "git am foo/*" (or use git as a PATCHTOOL) and get
usable results.

I understand that it adds unnecessary changes (not needed to fix the
WARNING), but IMHO better in separate "refresh patches" commit, than next
time someone uses devtool for actual mozjs upgrade which might refresh the
patches even more to make them applicable on new base version.

Regards,

On Tue, Mar 27, 2018 at 12:02 AM, Andreas M=C3=BCller <schnitzeltony@gmail.=
com>
wrote:

> On Mon, Mar 26, 2018 at 11:43 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > WARNING: mozjs-17.0.0-r0 do_patch:
> > Some of the context lines in patches were ignored. This can lead to
> > incorrectly applied patches.
> > The context lines in the patches can be updated with devtool:
> >
> >     devtool modify <recipe>
> >     devtool finish --force-patch-refresh <recipe> <layer_path>
> >
> > Then the updated patches and the source tree (in devtool's workspace)
> > should be reviewed to make sure the patches apply in the correct place
> > and don't introduce duplicate lines (which can, and does happen
> > when some of the context is ignored). Further information:
> > http://lists.openembedded.org/pipermail/openembedded-core/
> 2018-March/148675.html
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D10450
> > Details:
> > Applying patch Manually_mmap_heap_memory_esr17.patch
> > patching file js/src/gc/Memory.cpp
> > Hunk #1 succeeded at 309 with fuzz 1 (offset 3 lines).
> > Hunk #2 succeeded at 391 (offset 3 lines).
> >
> > Now at patch Manually_mmap_heap_memory_esr17.patch
> >
> Why don't you adjust the patch mentioned in the warning only? Might
> sound lazy but touching all patches is dangerous business. I have seen
> cases where devtool does unexpected/unnecessary modifications so I
> tend to keep diff small. My workflow:
> * run devtool commands
> * if the patches are at different place (files -> recipename) -> move
> them back (of course only those build complained)
> * remove / checkout those patches which were OK
> * use git add -p <patchfile> to check in only those parts important
> * git checkout remaining changes
> * commit
>
> Andreas
>

