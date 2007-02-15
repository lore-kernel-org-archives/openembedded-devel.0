Received: from [206.18.177.54] (helo=alnrmhc14.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <golly@stellarwerx.com>) id 1HHlWc-0007fU-OS
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Feb 2007 19:40:11 +0100
Received: from gatekeeper.stellarwerx.com
	(c-68-57-212-205.hsd1.in.comcast.net[68.57.212.205])
	by comcast.net (alnrmhc14) with ESMTP
	id <20070215184008b1400a1pa5e>; Thu, 15 Feb 2007 18:40:09 +0000
Received: by gatekeeper.stellarwerx.com (Postfix, from userid 500)
	id 944FD7D65; Thu, 15 Feb 2007 13:46:10 -0500 (EST)
From: "Mark Gollahon" <golly@stellarwerx.com>
To: openembedded-devel@lists.openembedded.org
Cc: 
X-Originating-IP: 68.79.172.62
X-Mailer: Usermin 1.230
Message-Id: <1171565169.18829@gatekeeper.stellarwerx.com>
Date: Thu, 15 Feb 2007 13:46:09 -0500 (EST)
MIME-Version: 1.0
Subject: Building Distros Directly To HD (Was: Re: OE Booth during fosdem)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Feb 2007 18:40:13 -0000
Content-Type: multipart/mixed; boundary="bound1171565169"

--bound1171565169
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Jim Thompson wrote ..
> 
> On Feb 14, 2007, at 1:17 PM, gerwin van der kruis wrote:
> 
> > Op woensdag 14-02-2007 om 12:53 uur [tijdzone -1000], schreef Jim
> > Thompson:
> >
> >> And I'm willing to throw cash, hardware and time at this.
> >>
> >> Yes, we sell WRAP boards, but I'm not looking to get a bunch-o-free
> >> development out of the process.  (We sell a Gateworks ixp42x board
> >> too, just to be perfectly honest.)
> >>
> >> Years ago, I ran (and owned) 'musenki' (google for it or look here:
> >> http://he-colo.netgate.com/~jim/Musenki/.  We had build a  set of
> >> Motorola 8245/8241 boards, and I'd made linux run on them.  I
> >> remember spending a horrific amount of time with a (very) early
> >> version of "buildroot".  OE is so much more sophisticated that I'm a
> >> bit taken aback.
> >>
> >> The OE learning curve is still quite steep, but I think it would be
> >> less steep with a) a bit more documentation and b) an EZ way to start
> >> creating "little distros" that
> >> run on PCs using it.
> >
> > I remember we had this discussion before , the problem is the
> > bootloader, for example grub requires some extra handlings to get
> > installed probarly.
> 
> There appears to be a decent start on "here are the set of steps"  
> here: http://kbarr.net/bochs
> 
> (I've only recently discovered this.)

I've done this "a million times" when I was building Gentoo for WRAPs and Routerboards.  Its not hard to throw files onto a HD or CF, chroot into the "image", and push grub to install itself.  The three things needed were:

(1) x86-based PC that had a Pentium or better processor,
(2) IDE connection for the target media (i.e. CF-to-IDE adapter board for CF cards to be recognized as IDE HDs in the afore-mentioned PC), and
(3) the Linux<->grub drive mapping (usually very easy to figure out, but there are situations...).

Trying to do the grub install via a USB reader/external HD was touchy, but I did manage to figure out how to DD grub's stage 1 and 1.5 and make it work.  However, the CF-to-IDE adapter was much more reliable (but had the down-side of rebooting to change the CF card).

I'll see if I can dig up the instructions and post them.

> > I think if you write a script which automate the installation of for
> > example grub and than copies automatically the files over to cf you 
> > are
> > finished , I did it once long time ago for an embedded voip pabx.
> 
> I once made 'lilo' work with a buildroot-based system.  The makefile  
> is attached.
> 
> I never could get 'grub' to do the same thing, though I prefer grub  
> to lilo.

The scripts I had did all of the work except for the grub part.  Shouldn't be too difficult to resurrect the DD instructions for grub, though.

> > As Koen said I am working on x86 projects like wifi-radio (with a
> > mini-itx board and some small additions) a set top box and a thin
> > client.So we are working on it !!
> 
> Is the wifi-radio tree available anywhere?

Yea, I'd like to see that, too.

Regards,
-Mark Gollahon

--bound1171565169--
