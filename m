Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1PrAwY-0006mE-1H
	for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 16:11:26 +0100
Received: (qmail invoked by alias); 20 Feb 2011 15:10:09 -0000
Received: from p4FE0F124.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.224.241.36]
	by mail.gmx.net (mp011) with SMTP; 20 Feb 2011 16:10:09 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18ok6RUpL0oFzTV+2d8VSkaEsggs+rJ4t3ywaQqUs
	gzV9NwEbnqrtFO
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 20 Feb 2011 16:05:15 +0100
User-Agent: KMail/1.13.2 (Linux/2.6.34.7-56.fc13.i686.PAE; KDE/4.4.5; i686; ; )
References: <1298057187-2466-1-git-send-email-tom_rini@mentor.com>
	<AANLkTim-b=vO2vD5sgTo5bKduF=OYqAczS7f3YYdgPUy@mail.gmail.com>
	<4D612958.70402@mentor.com>
In-Reply-To: <4D612958.70402@mentor.com>
MIME-Version: 1.0
Message-Id: <201102201605.15986.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH] insane.bbclass: Make RPATH a non-fatal error
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
X-List-Received-Date: Sun, 20 Feb 2011 15:11:26 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 20 February 2011 15:46:48 Tom Rini wrote:
> On 02/20/2011 05:42 AM, Frans Meulenbroeks wrote:
> > 2011/2/19 Tom Rini<tom_rini@mentor.com>:
> >> On 02/19/2011 06:26 AM, Otavio Salvador wrote:
> >>> On Sat, Feb 19, 2011 at 11:52, Andreas Mueller<schnitzeltony@gmx.de>
> >>> 
> >>>   wrote:
> >>>> On Saturday 19 February 2011 10:45:38 Frans Meulenbroeks wrote:
> >>>>> I am fine with the patch, but perhaps a better solution would be to
> >>>>> introduce a var to decide whether it is a fatal or not.
> >>>>> That way people distro's that use libtool 2.4 can decide to make it a
> >>>>> fatal. (or individual users in their local.conf)
> >>>>> 
> >>>>> Frans
> >>>> 
> >>>> How comes that I sometimes feel handled as spammer ;-) ?
> >>>> 
> >>>> see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-
> >>>> February/029534.html
> >>>> 
> >>>> anyway - treating RPATH errors as fatal has lead to many QA fixes and
> >>>> further
> >>>> will follow...
> >>>> 
> >>>> my opinion now: keep RPATH errors fatal as developer's  whip :-)
> >>> 
> >>> I agree about keeping it configurable.
> >>> 
> >>> Besides I think that we ought to keep it fatal until quite near of
> >>> release since we'll be "forced" to fix most of many of them.
> >> 
> >> I just want to state, again, that most of these just go away with
> >> libtool 2.4.  Now, if people are looking for something to work on that
> >> won't just go away with an update to libtool 2.4:
> >> - iscsi-target needs some love again for various kernel versions as that
> >> looks to be killing calamari and neek for nas-server-image
> > 
> > Peeked at iscsi-target for calamari. Some inet fields have changed
> > name in 2.6.32 or so, and apparently this is not handled fully.
> > Instead of trying to fix it, I moved the calamari recipe to 2.6.34
> > (which I'm already using for half a year or so, but apparently never
> > pushed).
> 
> Thanks.
> 
> > I'll also see if I can update the neek version (probably also by
> > moving the kernel version forward.
> > Tomorrow I'll discuss this with Walter who afaik is the only other neek
> > user.
> 
> Note that I also see:
> - uclibc total failure, but I assume unsupported and I'll drop
> - minimal fails everywhere else with:
> ERROR: QA Issue with staging: libsupc++.la failed sanity test (workdir)
> in path
> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image/D
> ISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/lib
> ERROR: QA Issue with staging: libstdc++.la failed sanity test (workdir) in
> path
> /var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/native-sdk-image/D
> ISTRO/minimal/MACHINE/neek/label/sb-u1004/tmp/sysroots/nios2-linux/usr/lib
> ERROR: QA staging was broken by the package built above
Can you try this with the cross.bbclass patch?


