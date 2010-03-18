Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1NsNwp-0005aU-9k
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 23:12:16 +0100
Received: by ywh35 with SMTP id 35so276318ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=KcGdRzNvRyPFPpAk6bRtiDZMGMnkzzq1wCOQNwcifr0=;
	b=tZlli1LcZLqyopUG8V23h3bUovFIyXUcKl3rpGM0f1obUletO7Mu1R1iLMIWSN/Y4I
	9aOV/6cAT3WPkKC14sKp4VvnL7OxVIpd1LIvxzd7IVTwVUKfhTv2Gdh4LPx3PiINmbbC
	mhXMdG4GvOLbGiZmM4XqGujf8QRFMXI5bzJ7Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=tehJGyiS/Hx10aVS0mXl5l9uk0PzDZlVmw1LFRdzgRMLumbLM/hOL6DsUxHTsencJe
	5aZm9Ps6qNJ5p8qY8vDUJkHf2TYVia/PK7T1p+uNJ1zHGQWHFwpX2ypIfqZl60b7uoj1
	4Ul3KOJJSoe38NLHWLzHO5JGfTj62h5VXdkc0=
MIME-Version: 1.0
Received: by 10.90.11.7 with SMTP id 7mr649726agk.79.1268950145817; Thu, 18 
	Mar 2010 15:09:05 -0700 (PDT)
In-Reply-To: <19c1b8a91003181205r5bdca388s92006757c0b4b038@mail.gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<20100316190003.GA20970@excalibur.local>
	<d1ded4381003171500q63682e8dn3ae47f8c13f05765@mail.gmail.com>
	<19c1b8a91003171600u10444eb8obd60b8fceabd62f4@mail.gmail.com>
	<d1ded4381003180942n39cf2e4er2e88cfc5fa0c951e@mail.gmail.com>
	<19c1b8a91003181205r5bdca388s92006757c0b4b038@mail.gmail.com>
Date: Thu, 18 Mar 2010 16:09:05 -0600
Message-ID: <d1ded4381003181509pef66757ya2c1b66505ab153f@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/7] device_table_add-xsa: add dev nodes for system ace
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
X-List-Received-Date: Thu, 18 Mar 2010 22:12:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Khem,

gcc-cross-initial-4.3.3 and gcc-cross-intermediate-4.3.3 build correctly
fixincl.o object

tmp/work/ppc440-angstrom-linux/gcc-cross-initial-4.3.3-r11.1/gcc-4.3.3/build.x86_64-linux.powerpc-angstrom-linux/fixincludes/fixincl.o:
ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped

tmp/work/ppc440-angstrom-linux/gcc-cross-intermediate-4.3.3-r11.1/gcc-4.3.3/build.x86_64-linux.powerpc-angstrom-linux/fixincludes/fixincl.o:
ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped

but gcc-cross fixincl.o reports

tmp/work/ppc440-angstrom-linux/gcc-cross-4.3.3-r11.1/gcc-4.3.3/build.x86_64-linux.powerpc-angstrom-linux/fixincludes/fixincl.o:
empty

But is not the only object file that is not been generated

ls -lah
tmp/work/ppc440-angstrom-linux/gcc-cross-4.3.3-r11.1/gcc-4.3.3/build.x86_64-linux.powerpc-angstrom-linux/fixincludes
total 160K
drwxrwxr-x. 2 aalonso aalonso 4.0K 2010-03-18 15:19 .
drwxrwxr-x. 9 aalonso aalonso 4.0K 2010-03-18 15:19 ..
-rw-rw-r--. 1 aalonso aalonso 6.1K 2010-03-18 15:18 config.cache
-rw-rw-r--. 1 aalonso aalonso 6.4K 2010-03-18 15:18 config.h
-rw-rw-r--. 1 aalonso aalonso  59K 2010-03-18 15:18 config.log
-rwxrwxr-x. 1 aalonso aalonso  38K 2010-03-18 15:18 config.status
-rw-rw-r--. 1 aalonso aalonso    0 2010-03-18 15:19 fixfixes.o
-rw-rw-r--. 1 aalonso aalonso    0 2010-03-18 15:19 fixincl.o
-rwxr-xr-x. 1 aalonso aalonso  14K 2010-03-18 15:19 fixinc.sh
-rw-rw-r--. 1 aalonso aalonso    0 2010-03-18 15:19 fixlib.o
-rw-rw-r--. 1 aalonso aalonso    0 2010-03-18 15:19 fixopts.o
-rw-rw-r--. 1 aalonso aalonso    0 2010-03-18 15:19 fixtests.o
-rw-rw-r--. 1 aalonso aalonso 6.1K 2010-03-18 15:18 Makefile
-rw-rw-r--. 1 aalonso aalonso 3.6K 2010-03-18 15:19 mkheaders
-rw-rw-r--. 1 aalonso aalonso 3.6K 2010-03-18 15:18 mkheaders.almost
-rw-rw-r--. 1 aalonso aalonso    0 2010-03-18 15:19 procopen.o
-rw-rw-r--. 1 aalonso aalonso    0 2010-03-18 15:19 server.o
-rw-rw-r--. 1 aalonso aalonso   10 2010-03-18 15:18 stamp-h

Any advise on how to fix this is welcome.

Regards
Adrian Alonso

On Thu, Mar 18, 2010 at 1:05 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Thu, Mar 18, 2010 at 9:42 AM, Adrian Alonso <aalonso00@gmail.com>
> wrote:
> > Hi Khem,
> >
> > My host OS is
> > Fedora 12 2.6.32.9-70.fc12.x86_64
> >
> > Gcc version installed in my system
> > gcc (GCC) 4.4.3 20100127
> >
> > which is the late's version available
> >
> > cleaning and rebuilding gcc-cross doesn't make the error go away
> >
> > A complete log can be found at [1].
> >
> > [1] http://pastebin.com/BftKvgGA
>
>
> go to your build directory and search of you have fixincl.o generated.
> if yes then try to run file on it and see if it is for right
> architecture which will be your host
> or do some elf dumping to see if the file is a proper object.
>
> I have gcc 4.4.3 too on my ubuntu/lucid box and I dont see the error you
> get
> so it must have something to do with either the linker or assembler or
> compiler on your host
>
> -Khem
>
> >
> >
> > Regards
> >
> > On Wed, Mar 17, 2010 at 5:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Wed, Mar 17, 2010 at 3:00 PM, Adrian Alonso <aalonso00@gmail.com>
> >> wrote:
> >> > Hi,
> >> >
> >> > I tested on my previous build and everything is ok (tested
> >> console-image);
> >> >
> >> > Building from scratch arise a build error with
> "gcc-cross_4.3.3.bbfailed"
> >> > I'm going to track the changes in gcc-cross recipe to find out why is
> >> > falling
> >> > The complete error log can be found at [1].
> >> >
> >> > [1] http://pastebin.com/2m4TP2Vs
> >>
> >> seems more like your gcc on host is causing the problem here. What
> >> host os do you have
> >> and try to clean and rebuild gcc-cross that might fix it.
> >>
> >> >
> >> > Regards
> >> > Adrian Alonso
> >> >
> >> > On Tue, Mar 16, 2010 at 1:00 PM, Stefan Schmidt
> >> > <stefan@datenfreihafen.org>wrote:
> >> >
> >> >> Hello.
> >> >>
> >> >> Back from holiday I found the time to test your patches. I needed to
> >> adjust
> >> >> one
> >> >> manually due to a change going in between but that was easy enough.
> >> >>
> >> >> I tested and pushed them out now. Please test on your side if
> everything
> >> is
> >> >> ok
> >> >> and thanks for your contribution.
> >> >>
> >> >> regards
> >> >> Stefan Schmidt
> >> >>
> >> >> _______________________________________________
> >> >> Openembedded-devel mailing list
> >> >> Openembedded-devel@lists.openembedded.org
> >> >>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >> >>
> >> >
> >> >
> >> >
> >> > --
> >> > Saludos
> >> > Adrian Alonso
> >> > http://aalonso.wordpress.com
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> >
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >> >
> >>
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >>
> >
> >
> >
> > --
> > Saludos
> > Adrian Alonso
> > http://aalonso.wordpress.com
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

