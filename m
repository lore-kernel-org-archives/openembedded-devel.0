Received: from [212.227.126.177] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <joerg@hakker.de>) id 1Lp76z-0007KH-Hn
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Apr 2009 22:32:43 +0200
Received: from tristan.localnet (port-92-202-38-39.dynamic.qsc.de
	[92.202.38.39])
	by mrelayeu.kundenserver.de (node=mrelayeu8) with ESMTP (Nemesis)
	id 0ML31I-1Lp74g05v1-0004b3; Wed, 01 Apr 2009 22:30:14 +0200
From: =?iso-8859-15?q?J=F6rg_Bakker?= <joerg@hakker.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 1 Apr 2009 22:30:11 +0200
User-Agent: KMail/1.11.1 (Linux/2.6.27-11-generic; KDE/4.2.2; i686; ; )
References: <SNT105-W5667C19202F0CB199F6AF6908A0@phx.gbl>
	<SNT105-W291629ECBDDF1A26627D6C908B0@phx.gbl>
	<49D394A5.2060805@gmx.net>
In-Reply-To: <49D394A5.2060805@gmx.net>
MIME-Version: 1.0
Message-Id: <200904012230.12120.joerg@hakker.de>
X-Provags-ID: V01U2FsdGVkX1/4ANLZJq/OxzUBXq9yQHVUtfly6GNaPIADjJa
	5Uvif9lUf3keQ5kQkJDYyNN4mgYylH9awbbORq9sIqT15N1VIU
	EVSv2FAhSF3/S9PAGnv6g==
X-SA-Exim-Connect-IP: 212.227.126.177
X-SA-Exim-Mail-From: joerg@hakker.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Does your own system matter
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
X-List-Received-Date: Wed, 01 Apr 2009 20:32:44 -0000
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Here's another one using Ubuntu 8.10. Currently building basic bootstrap 
images with and w/o X, distro is angstrom, branch is org.openembedded.dev, all  
glibc. The stable branches bumped out very early (think it was the shasum 
package), so I stayed with org.openembedded.dev.

So far, two patches were needed (gcc-cross-kernel and kernel). I also had one 
issue with intltool:

| checking for XML::Parser... configure: error: XML::Parser perl module is 
required for intltool
| FATAL: oe_runconf failed
NOTE: Task failed: /home/jb/devel/cc/jammsession/oe/build/tmp/work/i586-
angstrom-linux/intltool-0.40.3-r2/temp/log.do_configure.21467
NOTE: package intltool-0.40.3-r2: task do_configure: failed

and fixed this by running:
bitbake libxml-parser-perl-native

Hope that gets you further down the road ...
Joerg

Am Mittwoch 01 April 2009 18:21:57 schrieb Robert Schuster:
> Hi,
>
> Mauri Sandberg schrieb:
> > ----------------------------------------
> >
> >> Date: Wed, 1 Apr 2009 15:10:41 +0200
> >> From: theBohemian@gmx.net
> >>
> >> I am using Ubuntu 8.10 (x86) and Debian squeeze (amd64) for OE
> >> development. Works like a charm.
> >
> > That sounds reassuring. Are you building uclibc at all? Also,
> > does it matter what versions of gcc and g++ packages you have
> > installed locally? I am using what ever is the latests, 4.x.
>
> I've not build uclibc for some time. Will try again to build a current
> image for a AVR32-based NGW when I at that machine.
>
> Regards
> Robert



