Received: from [62.169.194.2] (helo=fesscrpp1.tellas.gr)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <skoroneos@digital-opsis.com>) id 1Hi7wz-0007fi-B6
	for openembedded-devel@openembedded.org; Sun, 29 Apr 2007 13:52:21 +0200
Received: from dias (62.169.211.226) by fesscrpp1.tellas.gr (7.3.117)
	id 462338C400209231 for openembedded-devel@openembedded.org;
	Sun, 29 Apr 2007 14:42:18 +0300
From: "Stelios Koroneos" <skoroneos@digital-opsis.com>
To: "Using the OpenEmbedded metadata to build Distributions"
	<openembedded-devel@openembedded.org>
Date: Sun, 29 Apr 2007 14:43:29 +0300
Message-ID: <HOECLKEKOHLAMMGDLLBHCEACKOAA.skoroneos@digital-opsis.com>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3028
Importance: Normal
In-Reply-To: <463478B9.3010602@gmail.com>
Subject: Re: perl 5.8.8 is ready
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 Apr 2007 11:52:22 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

> perl-native-5.8.8 builds fine. But when I run bitbake perl-5.8.8,
> it alway try to build perl-native-5.8.7 and perl-5.8.7 first. Am I 
> missing something?
> 
> Gordon

You need to comment DEFAULT_PREFERENCE = "-1" so that it builds by default 

Stelios S. Koroneos

Digital OPSiS - Embedded Inteligence
http://www.digital-opsis.com


> -----Original Message-----
> From: openembedded-devel-bounces@openembedded.org 
> [mailto:openembedded-devel-bounces@openembedded.org]On Behalf Of 
> Junqian Gordon Xu
> Sent: Sunday, April 29, 2007 1:52 PM
> To: Using the OpenEmbedded metadata to build Distributions
> Subject: Re: [oe] perl 5.8.8 is ready
> 
> 
> Jamie Lenehan wrote:
> > Hi,
> >
> > I think I've got perl 5.8.8 to the stage where it is ready for use.
> > As this is a pretty big and complex system and I've made some rather
> > large changes to the way the build happens I'd like to get some
> > reports from other people that it works for them before removing the
> > DEFAULT_PREFERENCE = "-1".
> >
> > You need to build perl-native 5.8.8 and then perl 5.8.8. (You always
> > have to build the matching -native version of perl first.)
> >
> > So far I've tested sh4/glibc (build & run), i486/glibc (build only)
> > and sh4/uclibc (build only) using gcc 3.4.4 for sh4 and gcc 4.1.2 for
> > i486.
> >
> > The main visible changes are:
> >
> >  - Per-arch configurations and now gone, it should build for any
> >    target now without change.
> >
> >  - Installation paths have all been change to be match the debian
> >    style (which also happens to be FHS compliant).
> >
> >  - All configurations match (including native) and all configurations
> >    include threading and shared library support.
> >
> > The build should also be a lot more reliable and it should resolve
> > nearly all of the perl related bugzilla entries (yes, even the
> > /bin/sh is dash one ;)
> >
> > (Note that if you have any cpan modules they all need to rebuilt as
> > well when changing to 5.8.8 in order to get installed into the new
> > locations.)
> >
> >   
> Machine=Tosa
> Distro=Angstrom
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



