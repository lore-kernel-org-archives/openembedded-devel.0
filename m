Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id AA2EA748DC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 09:53:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a137-v6so215472wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 02:53:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pvDWWVd4QF/wJKZ2kv3RNAuOFleF3rY3oAJiberOhiw=;
	b=EIjimpaRrAcdQzzWtioOxm1CoC6EYlOGYGZSgWbJVYDd57pqC5Z1G7aDdaRrhjwjME
	B+DpmkuSpQ9hd7PyqzFSP7GgIdMLmbdSWsRhmqbhKbrdOWvzxaSfyEWFvstkORFlGwpD
	F7CgT0Fyy9aYL5M2uCuPXdXDDkaH+NWoFBI4uPXHaggWmNEPPl5RxMbQUD+d3DmO6IbD
	FIOyyEUit5XD3/BK6yoo7+sQXJSx+wn2ldpYCunygpFWGDIXCljoT37ordzJnASYfh6X
	xA5X+I8sgPynb1ruRYcASYq/OBFSqMKJQjgvchx1clHZEBdUn1+M0ol1KB2lz+AxUt/Y
	EB9A==
X-Gm-Message-State: ALKqPweJbHUAZFAU+U+QpBjH71PplO/zk4bRWfyGMbV1+a2on3zlGIb4
	17N4x50Wf7ta+qk3pAByyWc=
X-Google-Smtp-Source: AB8JxZqtznstOwCJvKJSx3DY2wmezQOtl/9CEIsYQB2CnjqIGzE5sutEW8MI9bokbUQosIlYxW37BQ==
X-Received: by 2002:a50:da0e:: with SMTP id z14-v6mr271008edj.62.1526464405053;
	Wed, 16 May 2018 02:53:25 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v14-v6sm1165825edi.91.2018.05.16.02.53.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 02:53:24 -0700 (PDT)
Message-ID: <1526464403.32156.13.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 May 2018 10:53:23 +0100
In-Reply-To: <CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
References: <20180503094308.7549-1-mac@mcrowe.com>
	<20180504183725.22134-1-mac@mcrowe.com>
	<CAJTo0LZ2G_4cMxoAQm2AWgRnkeP5VXRURH9c82qaBpA0bop59A@mail.gmail.com>
X-Mailer: Evolution 3.26.5-1 
Mime-Version: 1.0
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Mike Crowe <mac@mcrowe.com>
Subject: Re: [meta-java][PATCHv2] jdepend: Retrieve source from Git rather than tarball
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
X-List-Received-Date: Wed, 16 May 2018 09:53:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Would it be useful to add a check to patchreview.py (or elsewhere?) to
reject patches that contain references to github archive URLs in the recipe?

Cheers,
Andre'

On Tue, 2018-05-08 at 10:28 +0100, Burton, Ross wrote:
> http://lists.openembedded.org/pipermail/openembedded-devel/2017-September/
> 114916.html,
> fwiw
> 
> Ross
> 
> On 4 May 2018 at 19:37, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > When Bitbake downloads jdepend-2.9.1.zip itself and I download
> > https://github.com/clarkware/jdepend/blob/master/dist/jdepend-2.9.1.zip
> > ,
> > the calculated hashes don't match the ones included in the recipe.
> > 
> > The hashes were last changed in commit
> > dd5c43fca8289b8795a9214aee616775e1493109 on 1st March, but GitHub claims
> > that the file being downloaded was published on 20th January, so I can't
> > explain why they are wrong.
> > 
> > It seems that we can't really rely on these tarballs to remain
> > unchanged,
> > so let's download the Git hash that corresponds to v2.9.1 instead. This
> > should always remain valid.
> > 
> > Cc: André Draszik <andre.draszik@jci.com>
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  recipes-core/jdepend/jdepend_2.9.1.bb | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> > 
> > I'll let whoever wants to merge this decide whether to take v1 with
> > the updated hashes or v2 using the Git repository.
> > 
> > diff --git a/recipes-core/jdepend/jdepend_2.9.1.bb b/recipes-
> > core/jdepend/
> > jdepend_2.9.1.bb
> > index 5f09a8b..dfbf493 100644
> > --- a/recipes-core/jdepend/jdepend_2.9.1.bb
> > +++ b/recipes-core/jdepend/jdepend_2.9.1.bb
> > @@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=
> > f5777d32a7709d558c2877d4a6616230"
> > 
> >  HOMEPAGE = "https://github.com/clarkware/jdepend"
> > 
> > -SRC_URI = "https://github.com/clarkware/jdepend/archive/${PV}.zip;
> > downloadfilename=${BP}.zip"
> > +SRC_URI = "git://github.com/clarkware/jdepend"
> > +SRCREV = "57980590313a5dbde236a3eb2c8958e9e53e6a10"
> > +S = "${WORKDIR}/git"
> > 
> >  inherit java-library
> > 
> > @@ -18,7 +20,4 @@ do_compile() {
> >    fastjar cf ${JARFILENAME} -C build .
> >  }
> > 
> > -SRC_URI[md5sum] = "9b91efe1d770e023893f89f4dde8434e"
> > -SRC_URI[sha256sum] = "536b5082d64e4f4dddd514ce30178f
> > 36c7a31b34d969275f278f72e522e7f7c9"
> > -
> >  BBCLASSEXTEND = "native"
> > --
> > 2.11.0
> > 
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > 

