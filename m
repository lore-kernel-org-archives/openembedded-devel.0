Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QewOt-0008JS-31
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 23:46:23 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QewLB-00064w-By
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jul 2011 23:42:33 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <CAMKF1so3q=Q_CQU3D5oYO_qgJOtcQqvWeHiRs=i=t5_mNbKY0A@mail.gmail.com>
References: <1309654060-29955-1-git-send-email-raj.khem@gmail.com>
	<1309772399.2633.97.camel@phil-desktop>
	<CAMKF1so3q=Q_CQU3D5oYO_qgJOtcQqvWeHiRs=i=t5_mNbKY0A@mail.gmail.com>
Date: Thu, 07 Jul 2011 22:42:17 +0100
Message-ID: <1310074937.18564.8.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [meta-oe][PATCH v2] systemd: Replace use of %m in printf formats
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
X-List-Received-Date: Thu, 07 Jul 2011 21:46:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-05 at 14:14 -0700, Khem Raj wrote:
> On Mon, Jul 4, 2011 at 2:39 AM, Phil Blundell <philb@gnu.org> wrote:
> > On Sat, 2011-07-02 at 17:47 -0700, Khem Raj wrote:
> >> +-        if ((fd = mkostemp(temp, O_CLOEXEC|O_CREAT|O_WRONLY)) < 0) {
> >> ++        if ((fd = mkstemp(temp)) < 0) {
> >
> > This change looks like it will effectively remove O_CLOEXEC without
> > reinstating it anywhere else.  Have you verified this is a safe thing to
> > do?
> 
> Initial tests on uclibc seems to work well. but this needs more testing
> thats why the patch is only applied for uclibc based systems

Just to reiterate what I mentioned on IRC the other day, I don't think
empirical testing is the right way to address this problem, at least not
in isolation.  Absent an exceptionally comprehensive testsuite, there is
too much risk that some kind of failure would be overlooked.  I think
code inspection is required here to establish whether O_CLOEXEC is
needed and what to do about it.  The easy answer to the latter is
probably just to add an appropriate fcntl() call.

> >> ++            char dev[20];
> >> +                 int prio = 0, k;
> >> +
> >> +                 if ((k = fscanf(m->proc_swaps,
> >> +-                                "%ms "  /* device/file */
> >> ++                                "%19s "  /* device/file */
> >> +                                 "%*s "  /* type of swap */
> >
> > Is 19 characters definitely enough?  If this is potentially a pathname
> > then it could be much longer than that.
> >
> 
> it just reads /dev/* so should be ok.

I haven't checked the actual code, but the implication from the variable
names and comments shown above is that it's reading /proc/swaps.  If
that's the case then, in the situation where you're swapping to a file,
the pathnames involved could be arbitrarily long.

p.




