Return-Path: <bounce+4d9b4d.3a5685-openembedded-devel=lists.openembedded.org@asterius.io>
Received: from mail4.static.mgsend.net (mail4.static.mgsend.net
	[104.130.122.4])
	by mail.openembedded.org (Postfix) with ESMTP id AF706731C4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 18:23:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=asterius.io; q=dns/txt;
	s=mailo; t=1470334991; h=Content-Type: To: Subject: Message-ID: Date:
	From: References: In-Reply-To: MIME-Version: Sender;
	bh=BX9x7J5BIY5rk25b0gO5an4iAeIc6bHySdIj3Jwr4L0=;
	b=MD+T1s+e3InbUnKV6JEHxvTn02VX1Gt+u3oIir6pc4N3AFOJigyvLvvvK/P2y2f7V3kxkUfe
	msg/iyY0k0oGgd1iUuJDyk2yVsOTGtYrhSJmW7kqlJfC7UHcZQb7SYg9WlD1ekzFTLdOuwSq
	jXm2iK+vaDw0hLmRxAx5lzWRy2I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=asterius.io; s=mailo;
	q=dns; h=Sender: MIME-Version: In-Reply-To: References: From: Date:
	Message-ID: Subject: To: Content-Type;
	b=ag0mr4P/NaCNDxRNmRZwBcwouDv3LWMX9l7FXGx0Ex6Y+7nk/hR38uN9d3PMWCxAyhFXB6
	pdvqdDOXSvC0WJA2ad+c5MtEdlgaylDnlGy7NHnU2OrvbAAdtAiKcmFjjdbm7Uuvt2hzHxjK
	SX+Tqro2A4FK2/Yq3aVd9gmb53lDY=
Sender: derek@asterius.io
X-Mailgun-Sid: WyIzN2NkMyIsICJvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyIsICIzYTU2ODUiXQ==
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mxa.mailgun.org with ESMTP id 57a3880e.7f1c38af3af0-in6;
	Thu, 04 Aug 2016 18:23:10 -0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 38so278706093iol.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2016 11:23:10 -0700 (PDT)
X-Gm-Message-State: AEkooutsYYNW2Y45t+A92UPusaMwUoNxrlSgLMuP6T0zximAQNt/sMzly3J2FBorWWYlsck3lb3HR6b+bu36Sw==
X-Received: by 10.107.63.70 with SMTP id m67mr71952017ioa.157.1470334990044;
	Thu, 04 Aug 2016 11:23:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.213 with HTTP; Thu, 4 Aug 2016 11:23:09 -0700 (PDT)
In-Reply-To: <39CCB7BB-6A06-4616-858E-381AB781321B@gmail.com>
References: <1470162087-5919-1-git-send-email-derek@asterius.io>
	<39CCB7BB-6A06-4616-858E-381AB781321B@gmail.com>
From: Derek Straka <derek@asterius.io>
Date: Thu, 4 Aug 2016 14:23:09 -0400
X-Gmail-Original-Message-ID: <CADNbA1pB8Z2bJiVHOpYmwL+Eytfujh5AgpTdiV8D8qXXJJsUag@mail.gmail.com>
Message-ID: <CADNbA1pB8Z2bJiVHOpYmwL+Eytfujh5AgpTdiV8D8qXXJJsUag@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libgit2: add a recipe for libgit2 version 0.24.1
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
X-List-Received-Date: Thu, 04 Aug 2016 18:23:13 -0000
Content-Type: text/plain; charset=UTF-8

Agreed.  I'll put out a v2 to fix that.

On Thu, Aug 4, 2016 at 4:33 AM, Khem Raj <raj.khem@gmail.com> wrote:

>
> > On Aug 2, 2016, at 11:21 AM, Derek Straka <derek@asterius.io> wrote:
> >
> > Signed-off-by: Derek Straka <derek@asterius.io>
> > ---
> > meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb | 24
> +++++++++++++++++++++++
> > 1 file changed, 24 insertions(+)
> > create mode 100644 meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
> >
> > diff --git a/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
> b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
> > new file mode 100644
> > index 0000000..e580308
> > --- /dev/null
> > +++ b/meta-oe/recipes-support/libgit2/libgit2_0.24.1.bb
> > @@ -0,0 +1,24 @@
> > +SUMMARY = "the Git linkable library"
> > +HOMEPAGE = "http://libgit2.github.com/"
> > +LICENSE = "GPL-2.0-with-GCC-exception"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=34197a479f637beb9e09e56893f48b
> c2"
> > +
> > +DEPENDS = "openssl zlib"
> > +
> > +SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v0.24"
> > +SRCREV = "211e117a0590583a720c53172406f34186c543bd"
> > +
> > +S = "${WORKDIR}/git"
> > +
> > +inherit cmake
> > +
> > +EXTRA_OECMAKE = "\
> > +     -DTHREADSAFE=ON \
> > +     -DBUILD_CLAR=OFF \
> > +     -DSHA1_TYPE="builtin" \
> > +     -DCMAKE_BUILD_TYPE=RelWithDebInfo \
> > +     -DBUILD_SHARED_LIBS=OFF \
>
> I think we should not disable shared objects unconditionally here.
>
> > +     -DBUILD_EXAMPLES=OFF \
> > +"
> > +
> > +BBCLASSEXTEND = "native"
> > --
> > 1.9.1
> >
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

