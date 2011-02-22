Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Ps17T-00082c-RY
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 23:54:11 +0100
Received: (qmail invoked by alias); 22 Feb 2011 22:52:53 -0000
Received: from p5DE48DA2.dip.t-dialin.net (EHLO localhost.localdomain)
	[93.228.141.162]
	by mail.gmx.net (mp063) with SMTP; 22 Feb 2011 23:52:53 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19PZFRQqNpP5MfrPzHV1jGftjK+rnuZrLiIofOBMA
	fNpG0xI/aouACd
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Feb 2011 23:47:29 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1298116419-18277-1-git-send-email-schnitzeltony@gmx.de>
	<4D631509.30602@mentor.com> <4D63CF6F.4080000@mentor.com>
In-Reply-To: <4D63CF6F.4080000@mentor.com>
MIME-Version: 1.0
Message-Id: <201102222347.29684.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] cross.bbclass: Fix many QA RPATH errors for distros preferring libtool-2.2
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
X-List-Received-Date: Tue, 22 Feb 2011 22:54:11 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 22 February 2011 15:59:59 Tom Rini wrote:
> On 02/21/2011 06:44 PM, Tom Rini wrote:
> > On 02/19/2011 06:23 PM, Khem Raj wrote:
> >> On (19/02/11 13:11), Eric Benard wrote:
> >>> Hi Andreas,
> >>> 
> >>>> index 1a6d906..50c0f63 100644
> >>>> --- a/classes/cross.bbclass
> >>>> +++ b/classes/cross.bbclass
> >>>> @@ -75,6 +75,6 @@ sysroot_stage_all() {
> >>>> 
> >>>> #
> >>>> # Cross .la files have more path issues we have to correct only for
> >>>> libtool< 2.4
> >>>> -SYSROOTEXTRALIBDIRSED_OLD = " -e
> >>>> \"/^libdir=/s,.*,libdir=${STAGING_DIR_TARGET}${target_libdir},g\" -e
> >>>> \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\"
> >>>> " +SYSROOTEXTRALIBDIRSED_OLD = " -e
> >>>> \"/^libdir=/s,.*,libdir=${target_libdir},g\" -e
> >>>> \"/^dependency_libs=/s,\([[:space:]']\)-L${STAGING_LIBDIR_NATIVE},,g\"
> >>>> "
> >>>> 
> >>>> SYSROOTEXTRALIBDIRSED =
> >>>> "${@["${SYSROOTEXTRALIBDIRSED_OLD}",""][("${LIBTOOL_HAS_SYSROOT}" ==
> >>>> "yes")]}"
> >>> 
> >>> I was just finishing to test a similar fix and this seems to be the
> >>> right direction. Now testing your fix which is cleaner.
> >> 
> >> Also try meta-toolchain targets
> > 
> > I'm kicking off a subset of my normal matrix with this change applied
> > and hope to report back results in the morning (-0700).
> 
> Results look good.  The results are at http://i.imgur.com/3zmKi.png and
> the failures here are:
> - qemux86 + libpcap2 + current kheaders aren't happy
> 
> - A lot of failures like:
> | checking host system type...
> | configure: error: invalid value of canonical host
> 
> NOTE: package xextproto-1_7.1.2-r2.0: task do_configure: Failed
> ERROR: Function 'do_configure' failed (see
> /var/hudson/workspace/sb_openembedded_autobuilder_quicktest/BBPKGS/qt4e-dem
> o-image/DISTRO/minimal/MACHINE/qemush4/label/sb-u1004/tmp/work/sh4-oe-linux
> /xextproto-1_7.1.2-r2.0/temp/log.do_configure.13916 for further
> information)
> ERROR: Task 2867
> (/var/hudson/workspace/sb_openembedded_autobuilder_quicktest/BBPKGS/qt4e-de
> mo-image/DISTRO/minimal/MACHINE/qemush4/label/sb-u1004/recipes/xorg-proto/x
> extproto_7.1.2.bb, do_configure) failed with exit code '1'
> 
> Which I need to dig into.
wow - your job getting the release out of the door is really impressive - thanks 
a lot!

Andreas


