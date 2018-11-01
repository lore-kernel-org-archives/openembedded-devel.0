Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3A96B747F3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Nov 2018 17:25:52 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id n12so12731850qkh.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Nov 2018 10:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mPl0bsM6tOnDc6lEw6eO01ASr41/ChsbCPvtrfkSIF0=;
	b=GnYGbErALby9iwVpmyNOysaSjJr9AVewDQyo3VaKaK+AIwFssdVcLZDuPNqUTUyKHs
	RDxW4ta2JPx/W9yTmYT+h3XqocVHrJ+n0WDzW7RObq1R0rMt3Dm5wttIXknU+R8KiMMe
	N5i/XDc73CD3AEezKejwydw5np1HMEOPcKB/BfJqezt1Tek4+fp2EPWYBuLrt1OKleAT
	OgsvZhwF4WZSgtAMGNH7Nj2uRekrA2l6DSFfW1kYaVu5yxMhlsrf+1YiSSkaph+fR8yd
	bqieR+iyZVzo/I5QBXd3s+gmTM3DCrKrGA4ul6a60muQU5r/LTk4vdQADADYRGymdSyv
	Hh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mPl0bsM6tOnDc6lEw6eO01ASr41/ChsbCPvtrfkSIF0=;
	b=QDy2vNgn8tf6HhMrzUQ1lr5hkuKOqw7IViN0VURpisG6uvXVkv/7vekxLSrE/+rs3I
	cws58wscHwLMjVXIU2qt4uI42qnKCgcJaCX8+SwEmOhnw7gy4BcWBmEV+7uP+c4cSXPd
	8egeW1JG4sNe7LTDIQ9KwtjonyHn/+Oy+HfszhZYSLYjwMhO1etD1TKGPRnmhMsxELaZ
	PfWQ4CjDdMrEkUGgehF+BtKWk7O0BZTxjo+dNwF736g76jNaPC7CQMpj+91jETB1Vlzd
	m3amXbhIGxdpp88e9EPtejjTK8g67PZypVmhy+CBtJ3rUnavyoelesbjv6f7mtxQI52g
	0dBQ==
X-Gm-Message-State: AGRZ1gKb1qZIPhROh2Ji/JAh8rzdz9Hcha1kJzGCgozQIawM9UHzWJ/U
	B+w5uR25K/24GvCufS0GG5TbbBqkqHCPTqTg5eo=
X-Google-Smtp-Source: AJdET5dd4c8Tv26hWIh/KlqEVI41hsza0xngsDu3YXER3UympWZj7JZKe6sxEaOxfaCF8WqqgjmVoKmAQkSEd0Kbmro=
X-Received: by 2002:a37:d408:: with SMTP id l8mr7318067qki.315.1541093152860; 
	Thu, 01 Nov 2018 10:25:52 -0700 (PDT)
MIME-Version: 1.0
References: <20181023160510.19604-1-JPEWhacker@gmail.com>
	<CA+chaQdztUVMJxae0F05=Bn4PZ1Nj+6=fK5vDR2e2_9uKcb9JQ@mail.gmail.com>
	<b547d0e296f044f8f6b0c4552f593977c9eb5ca1.camel@gmail.com>
In-Reply-To: <b547d0e296f044f8f6b0c4552f593977c9eb5ca1.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Nov 2018 10:25:26 -0700
Message-ID: <CAMKF1soXJ-689rO5UszO5N7kPrXq0pBkw1O4fxbUhOU1iSf75A@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][master][sumo][PATCH] rapidjson: Allow empty package
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
X-List-Received-Date: Thu, 01 Nov 2018 17:25:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 23, 2018 at 12:00 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
> On Tue, 2018-10-23 at 19:28 +0200, Martin Jansa wrote:
> > Why is installing useless empty packages sane?
>
> The development packages that get installed in the SDK are picked up
> grabbing the -dev that corresponds to each ${PN} being installed.
> However, you can't do that with RapidJSON as there is no ${PN} package
> because it is empty and therefore culled. Adding the empty ${PN}
> package seems to be a pretty low-risk way of making RapidJSON behave
> like all the other packages when it comes to building into an SDK;
> effectively, IMAGE_INSTALL += "rapidjson" is now sufficient to get it
> in the SDK.
> You could of course manually add "rapidjson-dev" to
> TOOLCHAIN_HOST_TASK, but that doesn't seem to be the precedent. This
> change is similar to those found in other header-only and staticdev-
> only recipes like libatomic-ops, gtest, libsrtp, tclap, ceres-solver,
> asio, and libinih.

we also have
RDEPENDS_${PN}-dev = ""

so we need to remove that if this is to be added.

> > On Tue, Oct 23, 2018 at 6:05 PM Joshua Watt <jpewhacker@gmail.com>
> > wrote:
> > > Causes the empty base package to be created so that RapidJSON can
> > > be
> > >
> > > sanely included in an SDK via IMAGE_INSTALL, RDEPENDS, and the
> > > like.
> > >
> > >
> > >
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > >
> > > ---
> > >
> > >  meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 1 +
> > >
> > >  1 file changed, 1 insertion(+)
> > >
> > >
> > >
> > > diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > > b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > >
> > > index 8ab35d224..76e01f824 100644
> > >
> > > --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > >
> > > +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> > >
> > > @@ -19,6 +19,7 @@ inherit cmake
> > >
> > >  EXTRA_OECMAKE += "-DRAPIDJSON_BUILD_DOC=OFF
> > > -DRAPIDJSON_BUILD_TESTS=OFF -DRAPIDJSON_BUILD_EXAMPLES=OFF"
> > >
> > >
> > >
> > >  # RapidJSON is a header-only C++ library, so the main package will
> > > be empty.
> > >
> > > +ALLOW_EMPTY_${PN} = "1"
> > >
> > >
> > >
> > >  FILES_${PN}-dev += "${libdir}/cmake"
> > >
> > >  RDEPENDS_${PN}-dev = ""
> > >
> > > --
> > >
> > > 2.17.1
> > >
> > >
> > >
> --
> Joshua Watt <JPEWhacker@gmail.com>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

