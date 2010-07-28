Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stefan@datenfreihafen.org>) id 1OeB2q-0003qJ-7M
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 20:07:56 +0200
Received: from p5b0334de.dip.t-dialin.net ([91.3.52.222] helo=excalibur.local)
	by sirius.lasnet.de with esmtpsa 
	(Cipher TLS-1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.63 #1)
	id 1OeB2X-0002Ba-8Y by authid <stefan@sostec.de> with cram_md5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 20:07:40 +0200
Received: from stefan by excalibur.local with local (Exim 4.72)
	(envelope-from <stefan@excalibur.local>) id 1OeB2V-00064D-Jt
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 20:07:35 +0200
Date: Wed, 28 Jul 2010 20:07:35 +0200
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100728180735.GC20716@excalibur.local>
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>
	<1279651497-20918-2-git-send-email-morphis@gravedo.de>
	<20100726074601.GA27921@excalibur.local>
	<4C4DE8FA.7060707@gravedo.de>
	<20100728134438.GA20716@excalibur.local>
	<4C5066C9.4060902@gravedo.de>
MIME-Version: 1.0
In-Reply-To: <4C5066C9.4060902@gravedo.de>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 78.47.116.19
X-SA-Exim-Mail-From: stefan@datenfreihafen.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] lvm2: rebase all recipes on a global lvm2.inc recipe
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
X-List-Received-Date: Wed, 28 Jul 2010 18:07:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Wed, 2010-07-28 at 19:20, Simon Busch wrote:
> On 28.07.2010 15:44, Stefan Schmidt wrote:
> > 
> > On Mon, 2010-07-26 at 21:58, Simon Busch wrote:
> >> On 26.07.2010 09:46, Stefan Schmidt wrote:
> >>> Hello.
> >>>
> >>> On Tue, 2010-07-20 at 20:44, Simon Busch wrote:
> >>>> This rebases all specific versions of lvm2 on a global recipe lvm2.inc which defines the
> >>>> common parameters for building lvm2. Staging is overwritten as we don't need any of the
> >>>> executables or manpages the build of lvm2 produces for any related builds.
> >>>>
> >>>> Signed-off-by: Simon Busch <morphis@gravedo.de>
> >>>
> >>> Looks good. Two comments below.
> >>
> >> Thank you for commenting this patches!
> >>
> >>>
> >>>> diff --git a/recipes/lvm2/lvm2.inc b/recipes/lvm2/lvm2.inc
> >>>> new file mode 100644
> >>>> index 0000000..a7e37b5
> >>>> --- /dev/null
> >>>> +++ b/recipes/lvm2/lvm2.inc
> >>>> @@ -0,0 +1,20 @@
> >>>> +SECTION = "utils"
> >>>> +DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
> >>>> +LICENSE = "GPL"
> >>>> +DEPENDS = "device-mapper"
> >>>> +INC_PR = "r2"
> >>>> +
> >>>> +S = "${WORKDIR}/LVM2.${PV}"
> >>>> +SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
> >>>> +           file://crosscompile_fix.patch"
> >>>> +
> >>>> +# Unset user/group to unbreak install.
> >>>> +EXTRA_OECONF = "--with-user= --with-group= --disable-o_direct"
> >>>> +EXTRA_OECONF_arm = "--with-user= --with-group= --disable-o_direct"
> >>>
> >>> I can see that you just merged this in from an already existing recipe, but do
> >>> we know why we have an overrirde for ARM here which changes nothing? Looks bogus
> >>> to me.
> >>
> >> Hm, you are right. I checked it with recompiling without the
> >> EXTRA_OECONF_arm statement. It works fine. Is it ok if I supply an extra
> >> patch removing this statement or should I rework this patch?
> > 
> > Both is fine with me.
> > 
> >>>> +inherit autotools
> >>>> +
> >>>> +# We don't need to stage anything (the executables are no needed at build time by any
> >>>> +# other recipe)
> >>>> +do_stage() {
> >>>> +}
> >>>
> >>> While we don't need the executables the don't hurd either IMHO. Can we get rid
> >>> of this?
> >>>
> >>
> >> The problem was, that the executables and manpages where installed into
> >> the staging dir and never removed, when the packages was clean ur
> >> purged. So I added the empty do_stage block to avoid stage of anything
> >> from this package as we don't need them anyway.
> > 
> > Hm, this smells like a bug somewhere else. Did the staged binaries bring in
> > other problems or could they get staged until we find out why they are not
> > removed?
> 
> Staging this binaries let the recompile of the same package fail as it
> tries to install the binaries + man pages again.
> Any hints where the bug could be? Within the staging logic?

Good question. Maybe only a  bug in the clean step that it ignores the files
during cleaning. Anybody else an idea?

You could also add a do_install_append which removes the binaries again.

regards
Stefan Schmidt


