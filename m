Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8883B78307
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 15:47:05 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id d124so1475893vkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Aug 2017 08:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OWkLVG6SvhTH9FBcdFoCBndSnVP1j4kwps0D2SHDKP0=;
	b=CkiSdWvCwJYwPQxe1o9maj2enMXl3EZkq22cp6QOiDyksRqpPAxN+yxrxTuT2Q/msd
	DhgDjQre2gzvkBIZBMwfGrcROP8k32jshOSasO3wA3psnyy6/36R0vOV9YAn8BAqhWJB
	Ie7cdajPJhmGdCzBbvJ7fxJHzqJUkcf5Y02h/MNT/T9CFDHW70jS28KFZOjv1yRAXDKS
	F1uKIwIgMmbV0lR/B1FLey/C1ke/9uHzRNs4qZ7vqc+I02DPhC2y9EX9fUL0mSV73c/q
	l4JE8lZuqTL2LSsUvfXti6cMwYcS1OCJOnHBntAVIpLwdCS0R+qMLYA65nt98lD4aTiL
	sgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OWkLVG6SvhTH9FBcdFoCBndSnVP1j4kwps0D2SHDKP0=;
	b=Lfm6//kee9jdATXGcXQS8z+jo+RI0XVKrCiwLMj/rk6j3BlLDo4Udqp5eHwa2uULbQ
	rHbxd0Mrat4AVL3KlUhbkAHJpdR75sdKncifg/vwI/HefEzy5/D+c0Q1RzhbOAQwtGrN
	YWwLqoryJthnssmuG6yu/4vzApdYseVtJsXY9Y7W5Vl6f7Fv2Am7Sb4JXO4wDayEjzjR
	z+Se0sUXkXQOeZJ48Nw6gC+X2UkP/5/Qft6GjtHRTxKQQT7Ex74YjhZfVAMOBihYIQ9o
	FwoAlsZCKT8jf6pBtjIQvPOILWVEMVZngHe1VLWghHe7jCB+csexZ62I6UWwjjDcB03y
	01rg==
X-Gm-Message-State: AHYfb5itItTUjnaorXqNR/6HSGfv/rUfiijA2+NzaIr9E8yLOm++Tl4I
	t3vve9myhouq8eERq+ypZl6rILTIAQ==
X-Received: by 10.31.176.132 with SMTP id z126mr453453vke.1.1504021626376;
	Tue, 29 Aug 2017 08:47:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Tue, 29 Aug 2017 08:47:05 -0700 (PDT)
In-Reply-To: <CAMKF1soDqjV2xP1-+XyC23okmZaGPgXV+Z08tH1k9gi2hXd7+A@mail.gmail.com>
References: <20170828163937.29460-1-adrian.ratiu@ni.com>
	<20170828163937.29460-3-adrian.ratiu@ni.com>
	<CAMKF1soDqjV2xP1-+XyC23okmZaGPgXV+Z08tH1k9gi2hXd7+A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 29 Aug 2017 17:47:05 +0200
Message-ID: <CA+chaQcJzL_P1wiMWZ9xzpUNQVhPNzgVfQjAszBpfbXRMLJQ2A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] smbnetfs: unblacklist recipe
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
X-List-Received-Date: Tue, 29 Aug 2017 15:47:05 -0000
Content-Type: text/plain; charset="UTF-8"

That's probably caused by my change in master-next to remove blacklisted
recipes (and their patch files), I've removed smbfs from that commit, but
forgot to restore the .patch file

On Tue, Aug 29, 2017 at 5:45 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Aug 28, 2017 at 9:39 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> wrote:
> > All its dependencies have been fixed and it builds correctly.
> >
>
> I see
> ERROR: smbnetfs-git-r0 do_fetch: Fetcher failure for URL:
> 'file://configure.patch'. Unable to fetch URL from any source.
>
> > Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> > ---
> >  meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_
> git.bb b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> > index 6995ad3f5..f1420fbed 100644
> > --- a/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> > +++ b/meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
> > @@ -24,5 +24,3 @@ PACKAGECONFIG ??= ""
> >  PACKAGECONFIG[gnome-keyring] = "--with-gnome-keyring=yes,--
> with-gnome-keyring=no,libgnome-keyring"
> >
> >  S = "${WORKDIR}/git"
> > -
> > -PNBLACKLIST[smbnetfs] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/132827/ - the recipe will
> be removed on 2017-09-01 unless the issue is fixed"
> > --
> > 2.14.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

