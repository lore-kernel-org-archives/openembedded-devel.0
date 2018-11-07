Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8F979CD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 19:48:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA7JlTd2008310
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 7 Nov 2018 11:47:45 -0800
Received: from yow-masselst-lx1.localnet (128.224.60.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 11:47:27 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Nov 2018 14:47:26 -0500
Message-ID: <6258897.tBiN8WKPmR@yow-masselst-lx1>
Organization: Wind River
In-Reply-To: <CAMKF1sqevDPR1YsrW7wBEdZ1QJ2s-CnuxJsdsqia+Q4o_OmR7w@mail.gmail.com>
References: <1541608802-6985-1-git-send-email-mark.asselstine@windriver.com>
	<CAPuovEL1xTn-=qZYcpkuSO7-5GT0xfP+0L5Q59hnskhLME9RAg@mail.gmail.com>
	<CAMKF1sqevDPR1YsrW7wBEdZ1QJ2s-CnuxJsdsqia+Q4o_OmR7w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] meta-xfce: xfconf: fixup installed-vs-shipped QA issue
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
X-List-Received-Date: Wed, 07 Nov 2018 19:48:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, November 7, 2018 12:28:24 PM EST Khem Raj wrote:
> On Wed, Nov 7, 2018 at 9:12 AM Mark Asselstine <
> 
> mark.asselstine@windriver.com> wrote:
> > On Wed, Nov 7, 2018 at 12:02 PM Mark Asselstine
> > 
> > <mark.asselstine@windriver.com> wrote:
> > > On Wed, Nov 7, 2018 at 12:00 PM Mark Asselstine
> > > 
> > > <mark.asselstine@windriver.com> wrote:
> > > > On Wednesday, November 7, 2018 11:55:08 AM EST Khem Raj wrote:
> > > > > On Wed, Nov 7, 2018 at 8:40 AM Mark Asselstine
> > > > > 
> > > > > <mark.asselstine@windriver.com> wrote:
> > > > > > Since the xfconf uprev, commit 4222cac97678 [xfconf: 4.13.5 ->
> > > > > > 
> > > > > > 4.13.6], we are getting a QA issue:
> > > > > >   ERROR: xfconf-4.13.6-r0 do_package: QA Issue: xfconf:
> > Files/directories
> > 
> > > > > >   were installed but not shipped in any package:
> > > > > >   /usr/lib64/gio/modules/libxfconfgsettingsbackend.la
> > > > > >   Please set FILES such that these items are packaged.
> > 
> > Alternatively if
> > 
> > > > > >   they are unneeded, avoid installing them or delete them within
> > > > > >   do_install. xfconf: 1 installed and not shipped files.
> > > > > >   [installed-vs-shipped]
> > > > > >   ERROR: xfconf-4.13.6-r0 do_package: Fatal QA errors found,
> > 
> > failing task.
> > 
> > > > > >   ERROR: xfconf-4.13.6-r0 do_package: Function failed: do_package
> > > > > > 
> > > > > > We need to include the .la file in the -dev package to avoid this.
> > > > > 
> > > > > can we just delete it.
> > > > 
> > > > I am fine with that, it is of little use. In the past I have asked
> > 
> > Mark Hatle
> > 
> > > > for advice on package vs. delete and I never get a clear answer one
> > 
> > way or the
> > 
> > > > other. I am sure if you look at my patch history 50% of the time I
> > 
> > have some
> > 
> > > > that delete these and the other 50% I keep them.
> > > > 
> > > > In this case there are already other .la files in the -dev package so
> > 
> > I just
> > 
> > > > went along with the keep approach.
> > > 
> > > Sorry, I wasn't clear on what I will do. I will send a V2 and make use
> > > of remove-libtool to take care of the cleanup.
> > 
> > Actually, Khem, if we go back to our discussion back in June
> > 
> > http://lists.openembedded.org/pipermail/openembedded-devel/2018-June/11889
> > 6.html
> > 
> > we ended up packaging the .la files. If the distro were to use
> > remove-libtool then they would be cleaned up. So based on that I stand
> > by my V1.
> > 
> > Thoughts?
> 
> Yeah I think as long as packaging works ok in both cases I am fine

It does. Please consider my V1 for merge.

MarkA

> 
> > MarkA
> > 
> > > MarkA
> > > 
> > > > MarkA
> > > > 
> > > > > > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > > > > > ---
> > > > > > 
> > > > > >  meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb | 2 ++
> > > > > >  1 file changed, 2 insertions(+)
> > > > > > 
> > > > > > diff --git a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > > > b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb index
> > 
> > 191d0fd..2667ff9
> > 
> > > > > > 100644
> > > > > > --- a/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > > > +++ b/meta-xfce/recipes-xfce/xfconf/xfconf_4.13.6.bb
> > > > > > @@ -14,3 +14,5 @@ SRC_URI[sha256sum] =
> > > > > > "d1a3d442dae188b5a7380b5815377e5488578cdafb03ae363e9426e3b0>
> > > > > > 
> > > > > >  FILES_${PN} += "${libdir}/xfce4/xfconf/xfconfd \
> > 
> > ${libdir}/gio/modules/libxfconfgsettingsbackend.so \
> > 
> > ${datadir}/dbus-1/services/org.xfce.Xfconf.service"
> > 
> > > > > > +
> > > > > > +FILES_${PN}-dev += "${libdir}/gio/modules/
> > 
> > libxfconfgsettingsbackend.la"
> > 
> > > > > > --
> > > > > > 2.7.4
> > > > > > 
> > > > > > --
> > > > > > _______________________________________________
> > > > > > Openembedded-devel mailing list
> > > > > > Openembedded-devel@lists.openembedded.org
> > > > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > > > 
> > > > --
> > > > _______________________________________________
> > > > Openembedded-devel mailing list
> > > > Openembedded-devel@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel





