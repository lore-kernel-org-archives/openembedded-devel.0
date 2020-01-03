Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F10616010B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 08:49:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47pz9f2yptzRd;
	Fri,  3 Jan 2020 09:49:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1578041382;
	bh=0pKbpKNCqcsB00ZD99ns/5TYqcYjvCODdKknHa21HqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvyVmQ5i5v/4t5uZAnwBa0pq570ljyC2CuemdAzALjJJYfx6BojbN+H5KZQUF0z/+
	Nxe+iRESQJ/VYX6MCXkPCK8uAEitDcBlLs3L4gbSjhb1orXtJxvGjR9vytfI+x7Mf1
	kYnmP2fIqD18tYBQ2wXCn4yveQJUGKcIv9KS0HmjNETxG4FbLTEdkC1DJivTbHjuG0
	pfsIWjnARex4NxSPl/x0JGvD+E/LxE4MWxm55xnyzMCcK0KwBYAOd/QMoClZCUvYTZ
	7dGY0ceDcRGGjNmSkgxFTcuAYXmyuwPZ8OzGEM6yFiOWoWktyuOZwhsbOdVs7XlOtA
	gl/ZbCH26PMd/A5lWduvhOCfsZfz18p0jbPUOVsNFo6dBCxs1UCm0ACRKiotLSHtKc
	gS7aVSqnjBKzL8G274l50kZ+P6h1wJkmgap/is2iF8PGLvDfD39NOZF10PK6oyLjNk
	jkSl7Y39LyODe6gDzHsq5ceBpW0I/oCDr6PnRcW7OeLoZo4htqx0o6vi2iLHOGRMhx
	LrijwD6E7By2yfsyGrM+VcHszh83IlD1PUpZrIo6fFBafSzks7F5JVbVs74olcw7KX
	2vbzBWF4yLVOv6xGpEzLpXnsAjsRQ+pvrLNUWYZPzQPODP+i1SaHd1k+W2sL10+Cf1
	4WU7ENVExRfaVJ/CsGVf7aTY=
Date: Fri, 3 Jan 2020 10:49:40 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200103084940.GB19452@localhost>
References: <cover.1578019547.git.akuster808@gmail.com>
	<CAMKF1spJeTLGUwerZNSjk3W821puo=-wsGaDCUd6B4q6PL5uvw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spJeTLGUwerZNSjk3W821puo=-wsGaDCUd6B4q6PL5uvw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [zeus 00/17] Patch review
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
X-List-Received-Date: Fri, 03 Jan 2020 08:49:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Jan 02, 2020 at 07:38:38PM -0800, Khem Raj wrote:
> On Thu, Jan 2, 2020 at 6:49 PM Armin Kuster <akuster808@gmail.com> wrote:
>...
> > Khem Raj (9):
> >   grpc: Define libdir and cmakedir in terms of multilib
> >   tinyalsa: fix installation libdir path to match multilibs
> >   libqb: Add --enable-nosection-fallback with mips64/clang
> >   x11vnc: Fix build for 32bit arches with 64bit time_t
> >   evtest: Fix build for 32bit arches with 64bit time_t
> >   lirc: Fix build for 32bit arches with 64bit time_t
> >   utouch-evemu,utouch-frame: Fix build for 32bit arches with 64bit
> >     time_t
> >   directfb: Fix build for 32bit arches with 64bit time_t
> >   ruli: Fix install step and build samples too
> >
> 
> 64bit time_t fixes are not necessary but are not hurtful either, since the
> C libraries in zeus do not have the needed bits to enable 64bit time_t
> so unless someone else has issues with it, I am fine to bring them to zeus
>...

There are zero benefits and a non-zero regression risk if backporting them,
I would recommend against adding them to zeus.

cu
Adrian

