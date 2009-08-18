Received: from [71.6.201.124] (helo=easi.embeddedalley.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <trini@embeddedalley.com>) id 1MdR86-0007U5-El
	for openembedded-devel@openembedded.org; Tue, 18 Aug 2009 18:01:49 +0200
Received: (qmail 20253 invoked from network); 18 Aug 2009 15:44:41 -0000
Received: from easi.embeddedalley.com (HELO localhost) (easi@71.6.201.124)
	by easi.embeddedalley.com with SMTP; 18 Aug 2009 08:44:41 -0700
Date: Tue, 18 Aug 2009 08:44:40 -0700
From: Tom Rini <trini@embeddedalley.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090818154440.GQ2227@smtp.west.cox.net>
References: <20090814215138.GB31011@gmail.com>
	<20090815022703.GH14883@smtp.west.cox.net>
	<19c1b8a90908151021s67bbdd9fh52a07dce6d51ace8@mail.gmail.com>
	<20090817234049.GH2227@smtp.west.cox.net>
	<19c1b8a90908172329p55250179od552cd94fa4cbff5@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <19c1b8a90908172329p55250179od552cd94fa4cbff5@mail.gmail.com>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: [RFC] Adding eglibc versions of minimal and micro distro
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
X-List-Received-Date: Tue, 18 Aug 2009 16:01:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 17, 2009 at 11:29:31PM -0700, Khem Raj wrote:
> On Mon, Aug 17, 2009 at 4:40 PM, Tom Rini<trini@embeddedalley.com> wrote:
> > On Sat, Aug 15, 2009 at 10:21:31AM -0700, Khem Raj wrote:
> >> On Fri, Aug 14, 2009 at 7:27 PM, Tom Rini<trini@embeddedalley.com> wrote:
> >> > On Fri, Aug 14, 2009 at 02:51:38PM -0700, Khem Raj wrote:
> >> >
> >> >> Hi
> >> >>
> >> >> I would like to add minimal-eglibc and micro-eglibc distros on same
> >> >> lines as -uclibc one's
> >> >>
> >> >> Any objections ?
> >> >
> >> > minimal-uclibc and micro-uclibc should go away and just pickup from LIBC
> >> > being passed in / set.
> >>
> >> Ideally yes but there are other things like libintl libiconv etc which
> >> needs special handling
> >> for uclibc. So having uclibc counterparts is good.
> >
> > I don't follow.  LIBC, and the associated inc file set the preferred
> > providers correctly.  Or are you talking about sharing the same TMPDIR
> > for > 1 distro ?
> 
> If u dont set LIBC then by default glibc is picked. Now it will pick

If you don't set LIBC that's not a valid distribution configuration.

> eglibc instead
> not many users override LIBC in there local.conf this way eglibc will
> get more tested

So the default should be: LIBC ?= "eglibc" then for minimal, to pull in
the eglibc.inc file that sets libintl/iconv/etc.

-- 
Tom Rini


