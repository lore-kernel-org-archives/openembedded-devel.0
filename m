Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NsNzZ-0005i3-BK
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 23:15:06 +0100
Received: by ywh35 with SMTP id 35so277683ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Mar 2010 15:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=bTbvIjiiLldDxCgXt8ICjuh2/tBAti0Q9Jq4H1D70ro=;
	b=qq7+qM4lUuV0EjIeK6hx8mlDHd5lw5djVYySTlGY906D8wHjdXmF1gX9CY0JdAuq2v
	vGBpTKmOtGGFkh+9EMi+T1jM1Go+0pC7jpjsuZSlup/As1suznj/Z9wI9TsiYqFY2ELI
	FS9GG91k/poQbCUUGFSWyC7xuapLH7S5VUwaI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DAzkL38wkFyhV1tu4sKEvFeMr1/LoGRe4tlE7g24UPViL+skm9LNuWrcUOt+DLMyvJ
	2JYmfQIcgChjDJpfoA1fBHCAVbNe+IdnHQ6relZw2na/Rieq+yA1hSrRbnR6ae+cEWXF
	ld9RV7iWIUd2LKaNty4VnL/GyFMPZ6qNToCXo=
MIME-Version: 1.0
Received: by 10.90.7.29 with SMTP id 29mr1682837agg.16.1268950315929; Thu, 18 
	Mar 2010 15:11:55 -0700 (PDT)
In-Reply-To: <d1ded4381003181509pef66757ya2c1b66505ab153f@mail.gmail.com>
References: <openembedded-devel@lists.openembedded.org>
	<1267830919-14718-1-git-send-email-aalonso00@gmail.com>
	<20100316190003.GA20970@excalibur.local>
	<d1ded4381003171500q63682e8dn3ae47f8c13f05765@mail.gmail.com>
	<19c1b8a91003171600u10444eb8obd60b8fceabd62f4@mail.gmail.com>
	<d1ded4381003180942n39cf2e4er2e88cfc5fa0c951e@mail.gmail.com>
	<19c1b8a91003181205r5bdca388s92006757c0b4b038@mail.gmail.com>
	<d1ded4381003181509pef66757ya2c1b66505ab153f@mail.gmail.com>
Date: Thu, 18 Mar 2010 15:11:55 -0700
Message-ID: <19c1b8a91003181511n789a7fecyeacb3385b567c5ec@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Thu, 18 Mar 2010 22:15:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2010 at 3:09 PM, Adrian Alonso <aalonso00@gmail.com> wrote:
> Hi Khem,
>
> gcc-cross-initial-4.3.3 and gcc-cross-intermediate-4.3.3 build correctly
> fixincl.o object
>
> tmp/work/ppc440-angstrom-linux/gcc-cross-initial-4.3.3-r11.1/gcc-4.3.3/bu=
ild.x86_64-linux.powerpc-angstrom-linux/fixincludes/fixincl.o:
> ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped
>
> tmp/work/ppc440-angstrom-linux/gcc-cross-intermediate-4.3.3-r11.1/gcc-4.3=
.3/build.x86_64-linux.powerpc-angstrom-linux/fixincludes/fixincl.o:
> ELF 64-bit LSB relocatable, x86-64, version 1 (SYSV), not stripped
>
> but gcc-cross fixincl.o reports
>
> tmp/work/ppc440-angstrom-linux/gcc-cross-4.3.3-r11.1/gcc-4.3.3/build.x86_=
64-linux.powerpc-angstrom-linux/fixincludes/fixincl.o:
> empty
>
> But is not the only object file that is not been generated


I think your host has buggy ccache installation. Disable ccache or
rather remove it from your build box and retry.

>
> ls -lah
> tmp/work/ppc440-angstrom-linux/gcc-cross-4.3.3-r11.1/gcc-4.3.3/build.x86_=
64-linux.powerpc-angstrom-linux/fixincludes
> total 160K
> drwxrwxr-x. 2 aalonso aalonso 4.0K 2010-03-18 15:19 .
> drwxrwxr-x. 9 aalonso aalonso 4.0K 2010-03-18 15:19 ..
> -rw-rw-r--. 1 aalonso aalonso 6.1K 2010-03-18 15:18 config.cache
> -rw-rw-r--. 1 aalonso aalonso 6.4K 2010-03-18 15:18 config.h
> -rw-rw-r--. 1 aalonso aalonso =A059K 2010-03-18 15:18 config.log
> -rwxrwxr-x. 1 aalonso aalonso =A038K 2010-03-18 15:18 config.status
> -rw-rw-r--. 1 aalonso aalonso =A0 =A00 2010-03-18 15:19 fixfixes.o
> -rw-rw-r--. 1 aalonso aalonso =A0 =A00 2010-03-18 15:19 fixincl.o
> -rwxr-xr-x. 1 aalonso aalonso =A014K 2010-03-18 15:19 fixinc.sh
> -rw-rw-r--. 1 aalonso aalonso =A0 =A00 2010-03-18 15:19 fixlib.o
> -rw-rw-r--. 1 aalonso aalonso =A0 =A00 2010-03-18 15:19 fixopts.o
> -rw-rw-r--. 1 aalonso aalonso =A0 =A00 2010-03-18 15:19 fixtests.o
> -rw-rw-r--. 1 aalonso aalonso 6.1K 2010-03-18 15:18 Makefile
> -rw-rw-r--. 1 aalonso aalonso 3.6K 2010-03-18 15:19 mkheaders
> -rw-rw-r--. 1 aalonso aalonso 3.6K 2010-03-18 15:18 mkheaders.almost
> -rw-rw-r--. 1 aalonso aalonso =A0 =A00 2010-03-18 15:19 procopen.o
> -rw-rw-r--. 1 aalonso aalonso =A0 =A00 2010-03-18 15:19 server.o
> -rw-rw-r--. 1 aalonso aalonso =A0 10 2010-03-18 15:18 stamp-h
>
> Any advise on how to fix this is welcome.
>
> Regards
> Adrian Alonso
>
> On Thu, Mar 18, 2010 at 1:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Thu, Mar 18, 2010 at 9:42 AM, Adrian Alonso <aalonso00@gmail.com>
>> wrote:
>> > Hi Khem,
>> >
>> > My host OS is
>> > Fedora 12 2.6.32.9-70.fc12.x86_64
>> >
>> > Gcc version installed in my system
>> > gcc (GCC) 4.4.3 20100127
>> >
>> > which is the late's version available
>> >
>> > cleaning and rebuilding gcc-cross doesn't make the error go away
>> >
>> > A complete log can be found at [1].
>> >
>> > [1] http://pastebin.com/BftKvgGA
>>
>>
>> go to your build directory and search of you have fixincl.o generated.
>> if yes then try to run file on it and see if it is for right
>> architecture which will be your host
>> or do some elf dumping to see if the file is a proper object.
>>
>> I have gcc 4.4.3 too on my ubuntu/lucid box and I dont see the error you
>> get
>> so it must have something to do with either the linker or assembler or
>> compiler on your host
>>
>> -Khem
>>
>> >
>> >
>> > Regards
>> >
>> > On Wed, Mar 17, 2010 at 5:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> >> On Wed, Mar 17, 2010 at 3:00 PM, Adrian Alonso <aalonso00@gmail.com>
>> >> wrote:
>> >> > Hi,
>> >> >
>> >> > I tested on my previous build and everything is ok (tested
>> >> console-image);
>> >> >
>> >> > Building from scratch arise a build error with
>> "gcc-cross_4.3.3.bbfailed"
>> >> > I'm going to track the changes in gcc-cross recipe to find out why =
is
>> >> > falling
>> >> > The complete error log can be found at [1].
>> >> >
>> >> > [1] http://pastebin.com/2m4TP2Vs
>> >>
>> >> seems more like your gcc on host is causing the problem here. What
>> >> host os do you have
>> >> and try to clean and rebuild gcc-cross that might fix it.
>> >>
>> >> >
>> >> > Regards
>> >> > Adrian Alonso
>> >> >
>> >> > On Tue, Mar 16, 2010 at 1:00 PM, Stefan Schmidt
>> >> > <stefan@datenfreihafen.org>wrote:
>> >> >
>> >> >> Hello.
>> >> >>
>> >> >> Back from holiday I found the time to test your patches. I needed =
to
>> >> adjust
>> >> >> one
>> >> >> manually due to a change going in between but that was easy enough=
.
>> >> >>
>> >> >> I tested and pushed them out now. Please test on your side if
>> everything
>> >> is
>> >> >> ok
>> >> >> and thanks for your contribution.
>> >> >>
>> >> >> regards
>> >> >> Stefan Schmidt
>> >> >>
>> >> >> _______________________________________________
>> >> >> Openembedded-devel mailing list
>> >> >> Openembedded-devel@lists.openembedded.org
>> >> >>
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >> >>
>> >> >
>> >> >
>> >> >
>> >> > --
>> >> > Saludos
>> >> > Adrian Alonso
>> >> > http://aalonso.wordpress.com
>> >> > _______________________________________________
>> >> > Openembedded-devel mailing list
>> >> > Openembedded-devel@lists.openembedded.org
>> >> >
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >> >
>> >>
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>> >>
>> >
>> >
>> >
>> > --
>> > Saludos
>> > Adrian Alonso
>> > http://aalonso.wordpress.com
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> Saludos
> Adrian Alonso
> http://aalonso.wordpress.com
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


