Received: from dsl027-183-242.sfo1.dsl.speakeasy.net ([216.27.183.242]
	helo=mail.qvxlabs.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <afalls@qvxlabs.com>) id 1O2cyQ-0003Ih-A9
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 06:16:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.qvxlabs.com (Postfix) with SMTP id 3EDA8740002
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 21:12:41 -0700 (PDT)
Received: from earth.localnet (unknown [10.1.1.34])
	by mail.qvxlabs.com (Postfix) with ESMTP id E0A73740001
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Apr 2010 21:12:40 -0700 (PDT)
From: Ardavon Falls <afalls@qvxlabs.com>
Organization: QVXLabs Inc
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Apr 2010 21:12:40 -0700
User-Agent: KMail/1.12.4 (Linux/2.6.31-20-generic; KDE/4.3.5; x86_64; ; )
References: <201004150018.52834.afalls@qvxlabs.com>
	<201004151048.42034.holger+oe@freyther.de>
	<201004151837.59816.afalls@qvxlabs.com>
In-Reply-To: <201004151837.59816.afalls@qvxlabs.com>
MIME-Version: 1.0
Message-Id: <201004152112.40898.afalls@qvxlabs.com>
X-DSPAM-Result: Whitelisted
X-DSPAM-Processed: Thu Apr 15 21:12:41 2010
X-DSPAM-Confidence: 0.9982
X-DSPAM-Probability: 0.0000
X-DSPAM-Signature: 4bc7e3b915581124413756
X-SA-Exim-Connect-IP: 216.27.183.242
X-SA-Exim-Mail-From: afalls@qvxlabs.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Using patchfiles with bitbake
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
X-List-Received-Date: Fri, 16 Apr 2010 04:16:12 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

The solution was to set the patch source paths in the patch file to 
***  ../../unifdef.c.orig	2010-04-14 23:19:41.824235628 -0700
--- ../../unifdef.c	2010-04-14 23:20:53.874235836 -0700
The issue was that the source path structure didn't match the directory 
structure in the ./tmp/work directory

Ardy

On Thursday 15 April 2010 06:37:59 pm Ardavon Falls wrote:
> I tried with both
> *** ./files/unifdef.c.orig	2010-04-14 23:19:41.824235628 -0700
> --- ./files/unifdef.c	2010-04-14 23:20:53.874235836 -0700
> and
> *** files/unifdef.c.orig	2010-04-14 23:19:41.824235628 -0700
> --- files/unifdef.c	2010-04-14 23:20:53.874235836 -0700
> 
> neither worked :( it always failed with the same error.
> What is the directory that it attempts to apply the patch from? is it
> ${WORKDIR} or ${WORKDIR}../patches
> 
> Thanks
> 
> Ardy
> 
> On Thursday 15 April 2010 01:48:41 am Holger Hans Peter Freyther wrote:
> > On Thursday 15 April 2010 09:18:52 Ardavon Falls wrote:
> > > Every time I try and add my own patchfiles to a bitbake recipe it fails
> > > with the following error...
> > >
> > > No file to patch.  Skipping patch.
> > > 3 out of 3 hunks ignored
> > > Patch unifdef-native_2.6.18.patch does not apply (enforce with -f)
> > > ERROR: Printing the environment of the function
> > > ERROR: Error in executing:
> > > ERROR: Exception:<class 'CmdError'> Message:Command Error: exit status:
> > > 1 Output:
> > > Applying patch unifdef-native_2.6.18.patch
> > >
> > > I'm creating the patch with the following command line
> > >
> > > diff -crB unifdef.c.orig unifdef.c > unifdef-native_2.6.18.patch
> >
> > Hi,
> >
> > two things. The first one is you should consider using quilt as it makes
> >  your life more easy and you would avoid running into this problem.
> >
> > The other part is when you compare your patch with other patches in OE,
> >  most of them start with "--- a/...", "+++ b/" and by default we invoke
> > the patch command with "-p1" from the source directory. With your patch
> > this does not work as you have no additional slashes that could be
> > removed.
> >
> > The way out is to either add this context (e.g. by using quilt) or to use
> > ;pnum=0 behind your ;patch=1.
> >
> > i hope this helps
> > 	z
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> 

!DSPAM:4bc7e3b915581124413756!




