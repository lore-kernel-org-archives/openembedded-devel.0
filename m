Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id B304460601
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 09:05:34 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so18026421wgh.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jan 2015 01:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zsSF4KPPOthzqI6463R0U4ZueZNNgzcZRkonbomUq44=;
	b=sE3zooRBvnwJ9Qdtjni9BCebE6xF2KMtpQSwrhiYo0nw/FFcSWYvy3Gif2mdsQwYHa
	D4hzoFApm83XP0Yb1Hgnc4px+vC6uaf4Zy/dLaJ+aC2PF41RYAmcysp3u5fHKNLiHAaf
	N7IU+BdoSbrT0OAQdyhrB9DOoFEO4z8j5zgTlM3rPCNN7r4Ne3VgM4jVL+aMtlN9vXZb
	jQWOU96LrteFWv/4TJLQaekXSWdPfS8cteUwmiVq1JmwZ8XrD83BQ0oCO8OucYGqIFqR
	gg14tRdU4VYykTgV6rY+HGmTvcZsT1wDJ+04od5Dja2/XYWNk2PQm9uPUBIsDzM2z66+
	A4Fg==
MIME-Version: 1.0
X-Received: by 10.194.243.1 with SMTP id wu1mr55479569wjc.69.1421053534534;
	Mon, 12 Jan 2015 01:05:34 -0800 (PST)
Received: by 10.194.7.170 with HTTP; Mon, 12 Jan 2015 01:05:34 -0800 (PST)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAD2A74F0E@ALA-MBB.corp.ad.wrs.com>
References: <1415262147-15816-1-git-send-email-jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AAD2A5639D@ALA-MBB.corp.ad.wrs.com>
	<1B858668EC6A94408DCA5225FDFA85AAD2A74F0E@ALA-MBB.corp.ad.wrs.com>
Date: Mon, 12 Jan 2015 10:05:34 +0100
Message-ID: <CA+chaQfh_Fw6CR6_cwtZppbU+w2Qna7=m=exAz2DWrFZMarZRg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] vim: add recipe for vim-tiny
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
X-List-Received-Date: Mon, 12 Jan 2015 09:05:41 -0000
Content-Type: text/plain; charset=UTF-8

http://permalink.gmane.org/gmane.comp.handhelds.openembedded/66016

On Mon, Jan 12, 2015 at 4:30 AM, Huang, Jie (Jackie) <
Jackie.Huang@windriver.com> wrote:

> Ping, I see the state in patchwork is "Changes Requested" but I don't see
> any comment for this,
> I'm not sure what need to be changed.
>
> Thanks,
> Jackie
>
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-
> > bounces@lists.openembedded.org] On Behalf Of Huang, Jie (Jackie)
> > Sent: Friday, December 19, 2014 2:17 PM
> > To: openembedded-devel@lists.openembedded.org; Martin.Jansa@gmail.com;
> > paul@paulbarker.me.uk; raj.khem@gmail.com
> > Subject: Re: [oe] [meta-oe][PATCH v2] vim: add recipe for vim-tiny
> >
> > Ping.
> >
> > > -----Original Message-----
> > > From: openembedded-devel-bounces@lists.openembedded.org
> > > [mailto:openembedded-devel- bounces@lists.openembedded.org] On Behalf
> > > Of jackie.huang@windriver.com
> > > Sent: Thursday, November 06, 2014 4:22 PM
> > > To: openembedded-devel@lists.openembedded.org; Martin.Jansa@gmail.com;
> > > paul@paulbarker.me.uk; raj.khem@gmail.com
> > > Subject: [oe] [meta-oe][PATCH v2] vim: add recipe for vim-tiny
> > >
> > > From: Jackie Huang <jackie.huang@windriver.com>
> > >
> > > Changes:
> > > - Add bb for vim-tiny based on vim.bb
> > > - Change PACKAGECONFIG and do_install for vim-tiny
> > > - Change BPN to vim in vim.bb so it works fine when required by
> > > vim-tiny
> > > - Add proper alternative links for vim and vim-tiny to avoid conflicts
> > > - Don't use do_install_append in vim.bb so it works fine when required
> > > by vim-tiny
> > >
> > > Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> > > ---
> > >  meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb | 13 +++++++++++++
> > >  meta-oe/recipes-support/vim/vim_7.4.481.bb      | 20
> +++++++++++++-------
> > >  2 files changed, 26 insertions(+), 7 deletions(-)  create mode 100644
> > > meta-oe/recipes- support/vim/vim-tiny_7.4.481.bb
> > >
> > > diff --git a/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb
> > > b/meta-oe/recipes-support/vim/vim-
> > > tiny_7.4.481.bb
> > > new file mode 100644
> > > index 0000000..bb8f2b7
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-support/vim/vim-tiny_7.4.481.bb
> > > @@ -0,0 +1,13 @@
> > > +require vim_${PV}.bb
> > > +
> > > +SUMMARY += " (with tiny features)"
> > > +
> > > +PACKAGECONFIG += "tiny"
> > > +
> > > +do_install() {
> > > +    install -d ${D}/${bindir}
> > > +    install -m 0755 ${S}/vim ${D}/${bindir}/vim.tiny }
> > > +
> > > +ALTERNATIVE_PRIORITY = "90"
> > > +ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
> > > diff --git a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> > > b/meta-oe/recipes- support/vim/vim_7.4.481.bb index b85ff63..7490229
> > > 100644
> > > --- a/meta-oe/recipes-support/vim/vim_7.4.481.bb
> > > +++ b/meta-oe/recipes-support/vim/vim_7.4.481.bb
> > > @@ -12,9 +12,9 @@ SRC_URI = "hg://
> vim.googlecode.com/hg/;protocol=https;module=vim \  "
> > >  SRCREV = "v7-4-481"
> > >
> > > -S = "${WORKDIR}/${BPN}/src"
> > > +S = "${WORKDIR}/vim/src"
> > >
> > > -VIMDIR =
> "${BPN}${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
> > > +VIMDIR =
> "vim${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
> > >
> > >  inherit autotools update-alternatives  inherit autotools-brokensep @@
> > > -59,7 +59,9 @@ EXTRA_OECONF = " \
> > >      STRIP=/bin/true \
> > >  "
> > >
> > > -do_install_append() {
> > > +do_install() {
> > > +    autotools_do_install
> > > +
> > >      # Work around rpm picking up csh or awk or perl as a dep
> > >      chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/vim132
> > >      chmod -x ${D}${datadir}/${BPN}/${VIMDIR}/tools/mve.awk
> > > @@ -67,6 +69,9 @@ do_install_append() {
> > >
> > >      # Install example vimrc from runtime files
> > >      install -m 0644 ../runtime/vimrc_example.vim
> > > ${D}/${datadir}/${BPN}/vimrc
> > > +
> > > +    # we use --with-features=big as default
> > > +    mv ${D}${bindir}/${BPN} ${D}${bindir}/${BPN}.${BPN}
> > >  }
> > >
> > >  PARALLEL_MAKEINST = ""
> > > @@ -97,7 +102,8 @@ RDEPENDS_${PN} = "ncurses-terminfo-base"
> > >  # Recommend that runtime data is installed along with vim
> > > RRECOMMENDS_${PN} = "${PN}-syntax ${PN}-help ${PN}-tutor ${PN}-vimrc
> ${PN}-common"
> > >
> > > -ALTERNATIVE_${PN} = "vi"
> > > -ALTERNATIVE_TARGET[vi] = "${bindir}/${BPN}"
> > > -ALTERNATIVE_LINK_NAME[vi] = "${base_bindir}/vi"
> > > -ALTERNATIVE_PRIORITY[vi] = "100"
> > > +ALTERNATIVE_${PN} = "vi vim"
> > > +ALTERNATIVE_TARGET = "${bindir}/${BPN}.${BPN}"
> > > +ALTERNATIVE_LINK_NAME[vi] = "${bindir}/vi"
> > > +ALTERNATIVE_LINK_NAME[vim] = "${bindir}/vim"
> > > +ALTERNATIVE_PRIORITY = "100"
> > > --
> > > 2.0.0
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-devel mailing list
> > > Openembedded-devel@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

