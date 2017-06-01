Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1697D77D01
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 18:19:32 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id l14so23739921ywk.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jun 2017 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=srVdaJIGMC9V1XGyznj/tRBGDaQHmFqu+JyLD9ejajc=;
	b=Sxrn6cv7whJBKSoSuNxCMKMoxNWqFfnQ5N94FKx3Sf2BgHjOfXXmcPqwRPmAmusEx1
	VP0H3AHBdchLx1EhMq0U7FyRDZCmLF45p03egdGpsPsLeDY4dj48JsgMXJtVctoJ6ntz
	p+X5E9G6moHiOHP4yReQYyHJrMqHhCHt8KaNCMR/OUPTedOr0iz6aw4mwb8mOjoWeLgT
	mbvdYatogSLf4CtWhP55UTo2fhARTKwNcXiwdhVOEUGpBwIQaxpPbqENC807mhNpm5gv
	iu+2y1/9Xm+wRSMn6fkGjQlKtEPsH5uHaSGjyH7CcJg8HANq4Wp40yO3e7BzXNxbdrxx
	yjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=srVdaJIGMC9V1XGyznj/tRBGDaQHmFqu+JyLD9ejajc=;
	b=A092A6JAlqF6svaNJNn9NJ9YyrmWinl3fDamORZJrMFyKrcOOmjGGfeWVMnA5PVyEl
	2ti/T3LNsZgiQfwr+NfF9bmY5ONzrHWkEcG/eiNERwP8kIAFtpOsrYmxZZKFLjBVDsLf
	IIjFYlEVg7Q2PIOYYiSu1rOm3VWvukaGGyikEh3Hnc57JcFsdj58jUFajSEuSqbjvMwf
	kn2Ju4mNu6EjCswI1gO4FB4KDMx1wG6J4UYFgcyk4e6ERMnIydfrisLc+/wMPLyqnPmX
	O+HO+TiExxgeGq12Lo1Pw1J7mh4bpELQhPVZI7BBe2LJQ7Ksym7kq/mAYIvXlJAdqI9v
	9j0Q==
X-Gm-Message-State: AODbwcDZdWPZrPlhowDMuMnZHBTdaLD3cOQNydVl1YHt7fYN+ZzbA4wD
	b03o0c+7vQckPP5WAdxNRsdpDsCJFA==
X-Received: by 10.129.44.196 with SMTP id s187mr2399711yws.259.1496341173777; 
	Thu, 01 Jun 2017 11:19:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Thu, 1 Jun 2017 11:19:33 -0700 (PDT)
In-Reply-To: <CAMKF1sqzX+NBRvP9pCURo5cUPadVmngNpTv2RCv=BBs8bzNzmQ@mail.gmail.com>
References: <1496212846-21304-1-git-send-email-samuli.piippo@qt.io>
	<6780201c-a87e-730f-4cb2-9545d6ffe782@zonque.org>
	<a57704de-9be3-0182-dc47-201117ab41b0@gmail.com>
	<5b8de782-d675-642e-2622-ef4f93bbb3e4@zonque.org>
	<79f414a2-00db-068d-962a-a25b23c97190@gmail.com>
	<CAMKF1sqzX+NBRvP9pCURo5cUPadVmngNpTv2RCv=BBs8bzNzmQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Jun 2017 20:19:33 +0200
Message-ID: <CA+chaQeiXjtLBqOhnrBvQWohJj7A=WGxmNMJBhgJft6Nigmoww@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] Upgrade to Qt 5.9.0
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
X-List-Received-Date: Thu, 01 Jun 2017 18:19:34 -0000
Content-Type: text/plain; charset="UTF-8"

${BUILD_CC} for host's CC

On Thu, Jun 1, 2017 at 6:30 PM, Khem Raj <raj.khem@gmail.com> wrote:

> Export cc=${CC} or some such in recipe
>
> On Thu, Jun 1, 2017 at 6:17 AM Samuli Piippo <samuli.piippo@gmail.com>
> wrote:
>
> > On 01.06.2017 15:57, Daniel Mack wrote:
> > > On 06/01/2017 02:35 PM, Samuli Piippo wrote:
> > >> Parts of the chromium is built for the host and requires gcc-multilib
> to
> > >> be installed when building on a x64 host. I should have noted that in
> > >> commit message.
> > >>
> > >> My /usr/bin/cc is a symlink to gcc
> > >
> > > Hmm, same here, but that's not the case when when bitbake is executing
> > > it, as it modifies the PATH.
> > >
> >
> > OK found it. I didn't have new enough poky, so the HOSTTOOL filtering
> > was not used.
> >
> > We need to find proper place to add HOSTTOOLS += "cc c++" to whitelist
> > the needed tools for webengine.
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

