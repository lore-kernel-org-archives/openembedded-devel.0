Return-Path: <mike.holmes@linaro.org>
Received: from mail-ob0-f175.google.com (mail-ob0-f175.google.com
	[209.85.214.175])
	by mail.openembedded.org (Postfix) with ESMTP id BBB7460232
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 20:19:17 +0000 (UTC)
Received: by mail-ob0-f175.google.com with SMTP id wn1so3551316obc.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Oct 2014 13:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=I3VkCLaSOkyRy1gXp7Mv6I4McbdJgxCC2HNVsDgd/RM=;
	b=fCRSrmIpdhTK/Z/chqnDSK/8DI8jxSD36SMjISG2StCwUrOX6FgrjJrRwUzLTSdHdt
	EDr94+SMzVYonC4oerS3N+Pm1ueVXKYRbk5BIco9djVLaN9nAdjKtUFPZdy5OaK4UsAp
	949RQUKA6B8BX0pV3P2kIHPmNc92G26CNHTAZaUcMClffE9Vvd/bNrTv/RpAXFu2ESA3
	oEFYOGc5PyTWUZNvVfq1ZUeQqVVXBXj9FrVlAdkQZjH5b44Mdhss8ELFdqWBfIopw3sj
	t7seGPMSdz7SHG1E5pkXXRMp528mdktRzQMImatSgPkU2as8vn2ocIV+rRFwvnw5HFoB
	j31g==
X-Gm-Message-State: ALoCoQn7MoW9bG/nGHedJ5omKTgfvgyPdayQ98hvNvTngyU3/zuEclqykTA5dp/GCco20ZmXEAa8
MIME-Version: 1.0
X-Received: by 10.182.38.135 with SMTP id g7mr263464obk.19.1414009157409; Wed,
	22 Oct 2014 13:19:17 -0700 (PDT)
Received: by 10.76.68.201 with HTTP; Wed, 22 Oct 2014 13:19:17 -0700 (PDT)
In-Reply-To: <20141022162140.GJ2455@jama>
References: <1413992945-33655-1-git-send-email-mike.holmes@linaro.org>
	<20141022162140.GJ2455@jama>
Date: Wed, 22 Oct 2014 16:19:17 -0400
Message-ID: <CADz3at2pcrG1NgAJJNV2Tfk2JxhDYnNYwPxmf-Or45ZSB3qT3Q@mail.gmail.com>
From: Mike Holmes <mike.holmes@linaro.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] add CUnit test suite
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Oct 2014 20:19:25 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2014 12:21, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Wed, Oct 22, 2014 at 11:49:05AM -0400, Mike Holmes wrote:
> > Signed-off-by: Mike Holmes <mike.holmes@linaro.org>
> > ---
> >  meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> >
> > diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> > new file mode 100644
> > index 0000000..e869852
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> > @@ -0,0 +1,18 @@
> > +DESCRIPTION = "CUnit is a C framework for unit testing. Test output
> supports comandline and GUI reults reporting"
> > +HOMEPAGE = "http://cunit.sourceforge.net"
> > +LICENSE = "LGPL-2.0"
> > +SECTION = "libs"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=7734aa853b85d6f935466f081490ddbb"
> > +
> > +S = "${WORKDIR}/CUnit-${PV}"
> > +
> > +SRC_URI = "
> http://downloads.sourceforge.net/project/cunit/CUnit/${PV}/CUnit-${PV}.tar.bz2
> "
> > +SRC_URI[md5sum] = "b5f1a9f6093869c070c6e4a9450cc10c"
> > +SRC_URI[sha256sum] =
> "f5b29137f845bb08b77ec60584fdb728b4e58f1023e6f249a464efa49a40f214"
> > +
> > +inherit autotools-brokensep
> > +
> > +EXTRA_OECONF = "--enable-debug --enable-memtrace --enable-automated
> --enable-basic --enable-console"
> > +
> > +FILES_${PN}-doc += "${prefix}/doc"
>
> Why doesn't it use ${datadir}/doc == ${docdir} as everything else?
>

I think the reason is because CUnit places its docs in /usr/doc/CUnit which
is not the same as docdir (usr/share/doc)


>
> > +FILES_${PN}-dev += "${datadir}"
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
*Mike Holmes*
Linaro  Sr Technical Manager
LNG - ODP

