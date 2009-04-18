Received: from [83.222.23.62] (helo=relay2.mail.masterhost.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <khimov@altell.ru>) id 1LvGgE-0005Jr-Jo
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 21:58:26 +0200
Received: from [UNAVAILABLE] ([84.17.11.114] helo=mate.hex)
	by relay2.mail.masterhost.ru with esmtp 
	envelope from <khimov@altell.ru> authenticated with rik@osrc.info
	message id 1LvGcB-0000YK-KN
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Apr 2009 23:54:15 +0400
From: Roman I Khimov <khimov@altell.ru>
Organization: Altell Ltd.
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Apr 2009 23:54:07 +0400
User-Agent: KMail/1.9.9
References: <200904151633.49146.khimov@altell.ru>
	<200904152325.47053.khimov@altell.ru>
	<200904160012.46743.raj.khem@gmail.com>
In-Reply-To: <200904160012.46743.raj.khem@gmail.com>
MIME-Version: 1.0
Message-Id: <200904182354.07709.khimov@altell.ru>
Subject: Re: [PATCH 03/11] linux-libc-headers 2.6.23: fix amd64 headers
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
X-List-Received-Date: Sat, 18 Apr 2009 19:58:26 -0000
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thursday 16 April 2009 11:12:41 Khem Raj wrote:
> On Wednesday 15 April 2009 12:25:46 pm Roman I Khimov wrote:
> > On Wednesday 15 April 2009 23:09:13 Khem Raj wrote:
> > > On (15/04/09 16:35), Roman I Khimov wrote:
> > > > --- a/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> > > > +++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.23.bb
> > > > @@ -63,4 +63,16 @@ do_stage () {
> > >
> > > is there any reason not to use sanitized header like we do in
> > > do_install even for do_stage
> >
> > I think this is the way to go for newer kernels and it can be generalized
> > in some .inc for future. This approach is used now in
> > linux-libc-headers_2.6.29.bb, but 2.6.23 historically uses this kind of
> > do_stage and I don't think we should change that now.
>
> OK. On that note can you test if your stuff works with 2.6.29 kernel
> headers ?

With minor correction of

--- a/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
+++ b/recipes/linux-libc-headers/linux-libc-headers_2.6.29.bb
@@ -47,3 +47,10 @@ do_stage () {
 	set_arch
 	oe_runmake headers_install INSTALL_HDR_PATH=${STAGING_DIR_HOST}${layout_prefix} ARCH=$ARCH
 }
+
+do_stage_append_multilib () {
+	install -d ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}
+	ln -s ../linux ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/linux
+	ln -s ../asm ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/asm
+	ln -s ../asm-generic ${STAGING_INCDIR}/${TARGET_SYS_MULTILIB}/asm-generic
+}

it works nice. As you can see, I'm using
${STAGING_INCDIR}/${TARGET_SYS_MULTILIB} for supplementary system headers.


