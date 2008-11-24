Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1L4jtb-00087S-2x
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Nov 2008 23:27:07 +0100
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0DB4C8400A2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2008 23:24:15 +0100 (CET)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 40B7084009E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2008 23:24:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_05
	autolearn=ham version=3.2.5
Received: from rhein.familie-heinold.de (e178118032.adsl.alicedsl.de
	[85.178.118.32]) by mail.familie-heinold.de (Postfix) with ESMTPA
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2008 23:24:14 +0100 (CET)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9F3003C1EF; Mon, 24 Nov 2008 23:24:13 +0100 (CET)
Date: Mon, 24 Nov 2008 23:24:13 +0100
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20081124222413.GA5591@rhein.zuhause.netz>
References: <20081117185942.GN15695@smtp.west.cox.net>
	<20081124163938.GB4535@smtp.west.cox.net>
MIME-Version: 1.0
In-Reply-To: <20081124163938.GB4535@smtp.west.cox.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [BUG 4797] task-sdk.bb and task-sdk-bare.bb duplicate some	functionality
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Nov 2008 22:27:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 24, 2008 at 09:39:38AM -0700, Tom Rini wrote:
> On Mon, Nov 17, 2008 at 11:59:42AM -0700, Tom Rini wrote:
> 
> > [ Both patches are also attached to bug 4797 ]
> > 
> > Currently, we have task-sdk.bb, which provides task-sdk-bare, and will
> > bring in just abstracted ${LIBC}, $[LIBC}-dev and libgcc-dev.  We also
> > have task-sdk-bare.bb which brings in a number of glibc packages, libgcc
> > and libstdc++/libstdc++-dev and as far as I can tell is the only
> > task-sdk-bare actually used.  The attached patch consolidates both so
> > that task-sdk-bare.bb will be useful on both glibc and uclibc.
> > 
> > Signed-off-by: Tom Rini <trini@embeddedalley.com>
> 
> Anyone?
> 
> > task-sdk-bare: Update and abstract to support uclibc
> > task-sdk.bb provided a task-sdk-bare version that supported uclibc, but
> > this wasn't used anymore.  Update task-sdk-bare.bb to have glibc / uclibc
> > abstractions and delete the unused file.
> > 
> > diff --git a/packages/tasks/task-sdk-bare.bb b/packages/tasks/task-sdk-bare.bb
> > index d2d40f6..ea0ab31 100644
> > --- a/packages/tasks/task-sdk-bare.bb
> > +++ b/packages/tasks/task-sdk-bare.bb
> > @@ -5,7 +5,7 @@ ALLOW_EMPTY = "1"
> >  
> >  PACKAGES = "${PN}"
> >  
> > -RDEPENDS_${PN} = "\
> > +GLIBC_PKGS = "\
> >      glibc \
> >      glibc-dbg \
> >      glibc-dev \
> > @@ -18,6 +18,16 @@ RDEPENDS_${PN} = "\
> >      glibc-gconv-iso8859-1 \
> >      glibc-gconv-iso8859-15 \
> >      locale-base-en-gb \
> > +    "
> > +
> > +LIBC_PKGS_linux = "${GLIBC_PKGS}"
> > +LIBC_PKGS_linux-gnueabi = "${GLIBC_PKGS}"
> > +LIBC_PKGS_linux-uclibc = "uclibc uclibc-dev"
> > +LIBC_PKGS_linux-uclibcgnueabi = "uclibc uclibc-dev"
> > +
> > +RDEPENDS_${PN} = "\
> > +    ${LIBC_PKGS} \
> >      libgcc \
> >      libstdc++ \
> > +    libstdc++-dev \
> >  "
> > diff --git a/packages/tasks/task-sdk.bb b/packages/tasks/task-sdk.bb
> > deleted file mode 100644
> > index 79e9fef..0000000
> > --- a/packages/tasks/task-sdk.bb
> > +++ /dev/null
> > @@ -1,22 +0,0 @@
> > -DESCRIPTION = "SDK packages"
> > -PR = "r8"
> > -LICENSE = "MIT"
> > -ALLOW_EMPTY = "1"
> > -
> > -PACKAGES = "\
> > -    task-sdk-bare \
> > -    "
> > -
> > -DEPENDS = "virtual/libc"
> > -
> > -LIBC_linux = "glibc"
> > -LIBC_linux-uclibc = "uclibc"
> > -LIBC_linux-gnueabi = "glibc"
> > -LIBC_linux-uclibcgnueabi = "uclibc"
> > -
> > -
> > -RDEPENDS_task-sdk-bare = "\
> > -    ${LIBC} \
> > -    ${LIBC}-dev \
> > -    libgcc \
> > -    "
> > -- 
> > 1.5.2.5
> > 
> > As an addition to the previous patch, add uclibc-thread-db to the list
> > of uclibc packages to install, based on glibc bringing in
> > glibc-thread-db.
> > diff --git a/packages/tasks/task-sdk-bare.bb b/packages/tasks/task-sdk-bare.bb
> > index ea0ab31..ab338e6 100644
> > --- a/packages/tasks/task-sdk-bare.bb
> > +++ b/packages/tasks/task-sdk-bare.bb
> > @@ -22,8 +22,8 @@ GLIBC_PKGS = "\
> >  
> >  LIBC_PKGS_linux = "${GLIBC_PKGS}"
> >  LIBC_PKGS_linux-gnueabi = "${GLIBC_PKGS}"
> > -LIBC_PKGS_linux-uclibc = "uclibc uclibc-dev"
> > -LIBC_PKGS_linux-uclibcgnueabi = "uclibc uclibc-dev"
> > +LIBC_PKGS_linux-uclibc = "uclibc uclibc-dev uclibc-thread-db"
> > +LIBC_PKGS_linux-uclibcgnueabi = "uclibc uclibc-dev uclibc-thread-db"
> >  
> >  RDEPENDS_${PN} = "\
> >      ${LIBC_PKGS} \
> > 
> > -- 
> > Tom Rini
> > 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> -- 
> Tom Rini

Hm,

is this a core change or not? If yes +1 from and by the way if Tom Rini
wants it, I suggest he gets git rw status, because he submitted a lot
of good patches.

Bye Henning


