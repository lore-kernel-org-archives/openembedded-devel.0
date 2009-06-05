Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MCfLJ-0005ug-Av
	for openembedded-devel@openembedded.org; Fri, 05 Jun 2009 21:44:45 +0200
Received: (qmail 12201 invoked from network); 5 Jun 2009 19:35:33 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 5 Jun 2009 12:35:33 -0700
Date: Fri, 5 Jun 2009 12:35:32 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090605193532.GD26065@smtp.west.cox.net>
References: <1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<20090603160458.GK26065@smtp.west.cox.net>
	<fce2a370906050147v358df2f5s9433626b25fe9003@mail.gmail.com>
	<20090605154522.GU26065@smtp.west.cox.net>
	<fce2a370906051035j4fc55bb6td618695a85242728@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <fce2a370906051035j4fc55bb6td618695a85242728@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [PATCH 06/12] meta-toolchain-qte: initial qt embedded	toolchain version
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
X-List-Received-Date: Fri, 05 Jun 2009 19:44:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 05, 2009 at 08:35:56PM +0300, Ihar Hrachyshka wrote:
> On Fri, Jun 5, 2009 at 6:45 PM, Tom Rini<trini@embeddedalley.com> wrote:
> > On Fri, Jun 05, 2009 at 11:47:04AM +0300, Ihar Hrachyshka wrote:
> >> On Wed, Jun 3, 2009 at 7:04 PM, Tom Rini<trini@embeddedalley.com> wrote:
> >> > On Wed, Jun 03, 2009 at 06:37:16PM +0300, Ihar Hrachyshka wrote:
> >> >
> >> >> +do_populate_sdk_append() {
> >> >> +       script = "${SDK_OUTPUT}/${prefix}/environment-setup"
> >> >> +       touch $script
> >> >> +       echo 'export OE_QMAKE_CC=${TARGET_SYS}-gcc' >> $script
> >> >> +       echo 'export OE_QMAKE_CXX=${TARGET_SYS}-g++' >> $script
> >> >> +       echo 'export OE_QMAKE_LINK=${TARGET_SYS}-g++' >> $script
> >> >> +       echo 'export OE_QMAKE_LIBDIR_QT=${prefix}/${TARGET_SYS}/${layout_libdir}' >> $script
> >> >> +       echo 'export OE_QMAKE_INCDIR_QT=${prefix}/${TARGET_SYS}/${layout_includedir}/${QT_DIR_NAME}' >> $script
> >> >> +       echo 'export OE_QMAKE_MOC=${prefix}/${layout_bindir}/moc4' >> $script
> >> >> +       echo 'export OE_QMAKE_UIC=${prefix}/${layout_bindir}/uic4' >> $script
> >> >> +
> >> >> +       # Repack SDK with new environment-setup
> >> >> +       cd ${SDK_OUTPUT}
> >> >> +       fakeroot tar cfj ${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.tar.bz2 .
> >> >> +}
> >> >
> >> > I see two minor problems.  First, environment-setup is going to exist so
> >> > we don't need to touch it again.  In fact, the variable should still be
> >> > set, but for clarity we should just comment (in case the file gets
> >> > renamed to say environment-setup.sh (if we add in a *csh style one
> >> > too)).  Second, we should update, not recreate the tarball (tar -jf ...
> >> > --add-file=${prefix}/environment-setup, I think).
> >>
> >> 1) Touching existing file is not a problem.
> >
> > But changing the name (for say once my *csh using cowork or customer
> > bugs me about it) will break here.
> 
> Sorry, but I don't get your point... Please explain me.

I've gone back and forth with myself on this.  My point is that it's a
little fragile, if ${SDK_OUTPUT}/${prefix}/environment-setup is renamed
(it's bash/etc-centric and for example, if my tcsh using coworker bugs
me, or a customer asks, I'll certainly make a
${SDK_OUTPUT}/${prefix}/environment-setup.csh and then push upstream,
and probably rename the old one to
${SDK_OUTPUT}/${prefix}/environment-setup.sh).  But, this isn't
happening right now, and well, even with my suggestion (using $script as
it's already set) would still be probably equally as fragile.

So, I'm happy with things as-is, sorry for the back-and-forth :)

-- 
Tom Rini


