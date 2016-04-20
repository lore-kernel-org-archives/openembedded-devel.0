Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA0A6FFE8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 14:32:57 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id x201so41889284oif.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2016 07:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to; 
	bh=ZjtLrV6P1Mx/LzlBJOpuKL6OA1EFjF8742+hZN9tLl8=;
	b=x7cD7yR1o5aTAw5cA3D9XcmpO1gJ085ZsrvO4epQvkfwfAHHiFz7FZkC4faCGjVmro
	8kMdq4y3vIOfK8SJgUkPKV00qXs8IpvEqcazuFATnnrusvg65GjCJUuO2KVwdKpeZ0RD
	uMnVXIAXMQcghG0DyTtmzJ/oCkiTCoTS0PW3idb5R/3DiBRVjthH5F2B1ntCo7uZ7FZL
	mZ2Ci6f/Gvnbc/SHK8dq501r2ctEzZ82Z0QQNt4zwdWj26mBB7VM9+onnEHACayIxyLp
	0RpdTGzrOXDfwJvaPoJjTEq2ODN+oRSb1i2UMZNbuMFhedZUNuSQsK1WWzBH1odtxPPn
	IKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to;
	bh=ZjtLrV6P1Mx/LzlBJOpuKL6OA1EFjF8742+hZN9tLl8=;
	b=V3Y1E7qd1VPFGu2C94y4KNRseJSexhWe5EjWFhaheSLIEQIEcgDMiB6sE5PabpABS2
	QqkYfD8KLd60Z8+v9Mrbsn81xrqokQVetQwiU4ByrM228A6EKad986kvSYKi38yHvZmk
	NCk7E2DdjUNGEHgiaMyo5XceRe5O75GhsRaOAWFDOOV6KM1oedlU1vYERs+d7UKR/ElU
	5vghVQPfjbITMH6zSvsd+XSfNgLt/PqTXOyhJwTBZVmlcIpheJNV9lWmgyGN3sH/UvyU
	JBd2F9lIXRwBLnxODlpK4omxXT3xBTKi/h1a3Z5mjEvhsD7GsHyW84A4IgFvqpJsVRXf
	m/9g==
X-Gm-Message-State: AOPr4FVJLFqXQ/XTNteN1hpYEfcdpXsBNJt4jBeI/575dnZnHwrd+a0jXPkFcD/ebAevaWfNVw+kltrahzRocQ==
MIME-Version: 1.0
X-Received: by 10.157.54.54 with SMTP id w51mr3585637otb.186.1461162778344;
	Wed, 20 Apr 2016 07:32:58 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 20 Apr 2016 07:32:58 -0700 (PDT)
In-Reply-To: <57173E84.90703@felipetonello.com>
References: <1461080418-9229-1-git-send-email-eu@felipetonello.com>
	<1461080418-9229-2-git-send-email-eu@felipetonello.com>
	<CADkTA4Pi3dG1G4DZ+rNEfwVnMJZxDNBfXtXv_fMKprkgBmRquQ@mail.gmail.com>
	<CADkTA4OyR2b_yCXFQ_NFzfEck_v3NvXGF4gUJLPGKcjvuHCFHA@mail.gmail.com>
	<57173E84.90703@felipetonello.com>
Date: Wed, 20 Apr 2016 10:32:58 -0400
Message-ID: <CADkTA4NT_bLfG6wUTFpxN+4veyL6iwdk8VZgRQu5AF_5QsKuHQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 1/2] protobuf: add protobuf-c recipe
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
X-List-Received-Date: Wed, 20 Apr 2016 14:32:59 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 20, 2016 at 4:32 AM, Felipe Ferreri Tonello <
eu@felipetonello.com> wrote:

> Hi Bruce,
>
> On 19/04/16 20:55, Bruce Ashfield wrote:
> > On Tue, Apr 19, 2016 at 3:46 PM, Bruce Ashfield <
> bruce.ashfield@gmail.com>
> > wrote:
> >
> >>
> >>
> >> On Tue, Apr 19, 2016 at 11:40 AM, Felipe F. Tonello <
> eu@felipetonello.com>
> >> wrote:
> >>
> >>> Initial version of recipe. The main package could be split into two to
> >>> separate the compiler. This also applies to protobuf recipe.
> >>>
> >>>
> >> More precisely, this is the initial version outside of
> meta-virtualization
> >> which enea added
> >> in 2012 :) It was added as a dependency for criu (hence why it was put
> in
> >> meta-virt).
> >>
> >> If we move it to meta-oe, we at least owe that other implementation a
> >> reference in the commit.
> >>
> >>
> > s/if/when/.
> >
> > I'm happy to purge all the protobuf* recipes from meta-virt, since they
> > were only there as
> > support mechanisms (and I wasn't involved in their original merge).
> >
> > But if you can take a look at what's in the meta-virt recipe, I'll do
> some
> > runtime testing with your
> > variant here, and drop the meta-virt ones when I can confirm criu works.
> >
>
> Regular protobuf recipe is already part of meta-oe. That's why I added
> this one there too.
>

Sure. That's obvious from the layer index, as is the existence of the one
in meta-virt.

Credit, where credit is due. It's not my work, so I'm not asking for any
credit,
but simply duplicating something that already exists without a nod to the
older one
isn't ideal.

All I was asking was that if you could a link to the meta-virt one in the
commit header
so that someone not familiar with the layer index can see the two options
.. and
at the same time I was wondering if you'd seen the meta-virt one and did
this one
differently for technical reasons. That makes it easier for me to drop
recipes as they
get cloned around to new (and better) locations.

Bruce


> > Cheers,
> >
> > Bruce
> >
> >
> >> Did you check the version we have there for deltas ? There are
> differences
> >> in the recipe, and
> >> it would be good to know if you've looked and determined they aren't
> >> necessary.
> >>
> >> Cheers,
> >>
> >> Bruce
> >>
> >>
> >>> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
> >>> ---
> >>>  .../recipes-devtools/protobuf/protobuf-c_1.2.1.bb  | 26
> >>> ++++++++++++++++++++++
> >>>  1 file changed, 26 insertions(+)
> >>>  create mode 100644 meta-oe/recipes-devtools/protobuf/
> protobuf-c_1.2.1.bb
> >>>
> >>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> >>> b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> >>> new file mode 100644
> >>> index 000000000000..88cdb0bccd8e
> >>> --- /dev/null
> >>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.2.1.bb
> >>> @@ -0,0 +1,26 @@
> >>> +SUMMARY = "Protocol Buffers - structured data serialisation mechanism"
> >>> +DESCRIPTION = "This is protobuf-c, a C implementation of the Google
> >>> Protocol Buffers data \
> >>> +serialization format. It includes libprotobuf-c, a pure C library
> that \
> >>> +implements protobuf encoding and decoding, and protoc-c, a code
> >>> generator that \
> >>> +converts Protocol Buffer .proto files to C descriptor code, based on
> the
> >>> \
> >>> +original protoc. protobuf-c formerly included an RPC implementation;
> >>> that code \
> >>> +has been split out into the protobuf-c-rpc project."
> >>> +HOMEPAGE = "https://github.com/protobuf-c/protobuf-c"
> >>> +SECTION = "console/tools"
> >>> +LICENSE = "BSD-2-Clause"
> >>> +
> >>> +DEPENDS = "protobuf-native protobuf"
> >>> +
> >>> +PACKAGE_BEFORE_PN = "${PN}-compiler"
> >>> +
> >>> +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=235c3195a3968524dc1524b4ebea0c0e"
> >>> +SRC_URI = "
> >>> https://github.com/protobuf-c/protobuf-c/archive/v${PV}.tar.gz"
> >>> +
> >>> +SRC_URI[md5sum] = "b884aeba4283309445a8e3b6e7322dd6"
> >>> +SRC_URI[sha256sum] =
> >>> "2d708fb3c024b9e6e86df141faff802194f5db90a4b79e6d4aa6bd61dd983dd6"
> >>> +
> >>> +inherit autotools pkgconfig
> >>> +
> >>> +FILES_${PN}-compiler = "${bindir}"
> >>> +
> >>> +BBCLASSEXTEND = "native nativesdk"
> >>> --
> >>> 2.8.0
> >>>
> >>> --
>
> Felipe
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

