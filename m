Return-Path: <leo.yan@linaro.org>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id BEA83610BA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2020 01:10:26 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d6so4248024pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Feb 2020 17:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/j1ECercVH56sFpqZ4JmyZ7kl75k/n4c7qDYNB5WnGM=;
	b=WY4T/tkzemmWMybzh1oNeIRYFQd/qJC0d5lBPFq/m7kj/bO9ZGr9lJW2k3lbpgzF1J
	mMjlou7QGwb1jjoLT/Tu70ZVn6BYbGOchdj+0Bcq6UQhB49muIIWsU9WHoDjd55409HM
	BJvCz+Sbde2cDLkBafcbx+PHkPfEDpGnT7lxHvaaDPLysqTIXq0K5UuFyRWzUBy3wyf3
	PWuEI5abuzOoNxzqrobA4Tpl2lAb7kZsHT2LJm5Xufa/wP1ODg7GcMIqFi/Ltea0p96K
	426npJf8MdyUu5/gja43Px0WMDF0/1+k04wPtAovkBJJrY7KB/3qCaa1nF/k1PKOXdks
	DjQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/j1ECercVH56sFpqZ4JmyZ7kl75k/n4c7qDYNB5WnGM=;
	b=q6IyaRGZGu9mmU/9X2dwkyRe57nR8NmYfR9RzG+/HK7GyHQD/MYKgC1m39GCfzMbst
	ffpQVhEPCnWsARnx52+aRNGZbo4t0Fnm5gpbc8QmMXWicmSJFy4WLrUl+vQ3MdX+jVfb
	D/VqJo3ma+HaKz/eNTF9kUE3s1YTKXKTVT7AwGHRFM7jpEo5aEvGogslRDRLqCqKwu+7
	2NzDcNvdeUVQuLjtmNJzyDi9JN1dqL60UKUBYbfH4ZPiz42TKYzadC+OFQaWojgKb+cv
	uQwqOo8H4JJFxFq/K1DNNMYcI3sLanDR6SUbLTGsux5wmmvvJ2BPamMq0qrlW5eje7AM
	QJ9g==
X-Gm-Message-State: APjAAAVH72XfygFQ8MAJfJQC+GCLOyYA4gP4fM+a3XXh6rv0drWBgZq6
	40L78XpRrXgF4YHUXsuo3OE0mw==
X-Google-Smtp-Source: APXvYqz9ThUiI+tujeHm0tR2bRfGBDlqZf/nfCNmfJPM7NZXCGGOsuDHj9GncPZWD8cLrsWwB3Cy/Q==
X-Received: by 2002:a63:9856:: with SMTP id l22mr50201139pgo.344.1582506627654;
	Sun, 23 Feb 2020 17:10:27 -0800 (PST)
Received: from leoy-ThinkPad-X240s ([2400:8902::f03c:91ff:fe3f:32da])
	by smtp.gmail.com with ESMTPSA id
	d69sm10777267pfd.72.2020.02.23.17.10.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 23 Feb 2020 17:10:27 -0800 (PST)
Date: Mon, 24 Feb 2020 09:10:17 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200224011017.GA5175@leoy-ThinkPad-X240s>
References: <20200223053549.7056-1-leo.yan@linaro.org>
	<3e126d8b-ed9e-3e5b-5fa7-61e043c10355@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3e126d8b-ed9e-3e5b-5fa7-61e043c10355@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] luajit: Upgrade to 2.1.0-beta3
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
X-List-Received-Date: Mon, 24 Feb 2020 01:10:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

On Sun, Feb 23, 2020 at 04:48:32PM -0800, Khem Raj wrote:
> On 2/22/20 9:35 PM, Leo Yan wrote:
> > Since luajit 2.1.0-beta3 can support architecture aarch64 and the old
> > misses to support aarch64, the patch upgrades to luajit 2.1.0-beta3.
> > 
> > Signed-off-by: Leo Yan <leo.yan@linaro.org>
> > ---
> >  .../luajit/{luajit_2.0.5.bb => luajit_git.bb}        | 12 ++++--------
> >  1 file changed, 4 insertions(+), 8 deletions(-)
> >  rename meta-oe/recipes-devtools/luajit/{luajit_2.0.5.bb => luajit_git.bb} (88%)
> > 
> > diff --git a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > similarity index 88%
> > rename from meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > rename to meta-oe/recipes-devtools/luajit/luajit_git.bb
> > index 93128dda8..afa60dba7 100644
> > --- a/meta-oe/recipes-devtools/luajit/luajit_2.0.5.bb
> > +++ b/meta-oe/recipes-devtools/luajit/luajit_git.bb
> > @@ -3,12 +3,9 @@ LICENSE = "MIT"
> >  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=10a96c93403affcc34765f4c2612bc22"
> >  HOMEPAGE = "http://luajit.org"
> >  
> > -PV .= "+git${SRCPV}"
> > -SRCREV = "02b521981a1ab919ff2cd4d9bcaee80baf77dce2"
> > -SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http \
> > -           file://0001-Do-not-strip-automatically-this-leaves-the-stripping.patch \
> > -           file://clang.patch \
> > -"
> > +PV = "2.1.0+${SRCPV}"
> 
> I think we will endup in trouble when 2.1.0 releases, so perhaps we
> should leave room for  sorting 2.1.0 higher than whatever we do now
> perhaps PV = ""2.0.5+2.1.0-beta3" would be workable.

This suggestion is fine for me.  But I have some concern for this since
the naming might introduce confusion when later someone reads this
recipe, which combines two different versions together.  So seems to
me PV = "2.1.0-beta3" is more directive, and it can reflect the exact
version for the building.  How about you think for this?

In next version, I will remove the two patches from 'luajit/luajit'
folder.  Also please let me know if you have any concern for this.

Thanks for reviewing and suggestions!
Leo

> > +SRCREV = "8271c643c21d1b2f344e339f559f2de6f3663191"
> > +SRC_URI = "git://luajit.org/git/luajit-2.0.git;protocol=http;branch=v2.1"
> >  
> >  S = "${WORKDIR}/git"
> >  
> > @@ -90,8 +87,7 @@ FILES_${PN}-dev += "${libdir}/libluajit-5.1.a \
> >  "
> >  FILES_luajit-common = "${datadir}/${BPN}-${PV}"
> >  
> > -# Aarch64/mips64/ppc/ppc64/riscv64 is not supported in this release
> > -COMPATIBLE_HOST_aarch64 = "null"
> > +# mips64/ppc/ppc64/riscv64 is not supported in this release
> >  COMPATIBLE_HOST_mipsarchn32 = "null"
> >  COMPATIBLE_HOST_mipsarchn64 = "null"
> >  COMPATIBLE_HOST_powerpc = "null"
> > 

