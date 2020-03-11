Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id F26FA61B94
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 10:06:03 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id p2so1762713wrw.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2020 03:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=u/OPQbvq9U4m4GRnfy9rHO6DhyhdNg+loZfLUce/A/Q=;
	b=rPh1Zrjblw3tKOAZOLlG8RcI1kELJN735EDI/zS5fDStPXCd/uQDoANC39qYsMIjqN
	pIo/0XnRsCVE/XQDYUL6NYwpUPYfV7Hl6w2tv+qRiwGm3/AjK4MHsDYGgyx7pXAtcgtO
	c5I4Mm4Gu0snFDGNFbnf42XyGUHcOhwasbderc4JEaK8hJfQjz1KVBeJLIy6YRsaUIZe
	6s04JNrSmgzpGqB4YROJNnAfOybp4j0Q4hkNnNjgkTerfOqgnxWR/RjlKvfts1jA4Ugo
	blvwwXFjttxIMwoF5hCyT4ZVs/6J4K/JAIkEBTAbshrUO4FIG6yeWhejuQO9J+kHP5g4
	ykeQ==
X-Gm-Message-State: ANhLgQ1z2/BLlY0zEr3y0cLQ1uLUA7afEGFJIe8Zjb7i6lvPsouzL1Kb
	yFSOSlCZZ/UpYAvP7kFTYYzFClim
X-Google-Smtp-Source: ADFU+vvmxszXTLNSzngn19FLqSx5xN/c9pnSaje+jckgGoStt6FDSuc+y4mX/TWqYCL+ODyVLLn8gw==
X-Received: by 2002:adf:e4c3:: with SMTP id v3mr3577476wrm.303.1583921164398; 
	Wed, 11 Mar 2020 03:06:04 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	n11sm36715401wrw.11.2020.03.11.03.06.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 03:06:03 -0700 (PDT)
Message-ID: <44513925f8e11e8f2c6afedce2558da0a9e608f0.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Mar 2020 10:06:03 +0000
In-Reply-To: <e50174e3f36143c1dc43f41cedc6232c34035578.camel@andred.net>
References: <20200311075513.9491-1-nick83ola@gmail.com>
	<e50174e3f36143c1dc43f41cedc6232c34035578.camel@andred.net>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] smem: matplotlib is an optional depencency
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
X-List-Received-Date: Wed, 11 Mar 2020 10:06:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-03-11 at 09:43 +0000, André Draszik wrote:
> On Wed, 2020-03-11 at 07:55 +0000, Nicola Lunghi wrote:
> > smem doesn't need matplotlib and numpy to run, is an optional dependency only
> > needed to produce graphs.
> 
> Right, that's why it's an RRECOMMENDS. If you don't want it in the image, just do
> BAD_RECOMMENDATIONS as per usual practice :-)

Also, smem really wants those to produce graphs. If you want something simple on
the target to just capture the data, there is smemcap as a separate utility
(and package).

A.

> 
> Cheers,
> Andre'
> 
> > This is needed to avoid to include and build matplotlib and numpy by default
> > 
> > Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > ---
> >  meta-oe/recipes-support/smem/smem_1.5.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta-oe/recipes-support/smem/smem_1.5.bb b/meta-oe/recipes-support/smem/smem_1.5.bb
> > index 90db9c3f3..446325e93 100644
> > --- a/meta-oe/recipes-support/smem/smem_1.5.bb
> > +++ b/meta-oe/recipes-support/smem/smem_1.5.bb
> > @@ -20,6 +20,9 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
> >  
> >  S = "${WORKDIR}/${BPN}-${HG_CHANGESET}"
> >  
> > +#PACKAGECONFIG ?= "graph"
> > +PACKAGECONFIG[graph] = ",,,python3-matplotlib python3-numpy"
> > +
> >  do_compile() {
> >          ${CC} ${CFLAGS} ${LDFLAGS} smemcap.c -o smemcap
> >  }
> > @@ -34,7 +37,6 @@ do_install() {
> >  }
> >  
> >  RDEPENDS_${PN} = "python3-core python3-compression"
> > -RRECOMMENDS_${PN} = "python3-matplotlib python3-numpy"
> >  
> >  PACKAGE_BEFORE_PN = "smemcap"
> >  
> > -- 
> > 2.20.1
> > 


