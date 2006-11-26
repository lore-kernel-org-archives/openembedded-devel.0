Received: from [66.249.82.224] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <abondarenko@gmail.com>) id 1GoI0x-0001R2-3J
	for openembedded-devel@lists.openembedded.org;
	Sun, 26 Nov 2006 12:17:39 +0100
Received: by wx-out-0506.google.com with SMTP id t14so1321769wxc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Nov 2006 03:14:24 -0800 (PST)
Received: by 10.100.48.7 with SMTP id v7mr1400000anv.1164539664412;
	Sun, 26 Nov 2006 03:14:24 -0800 (PST)
Received: by 10.100.44.9 with HTTP; Sun, 26 Nov 2006 03:14:24 -0800 (PST)
Message-ID: <2c3b62930611260314o5063204ctfeff4a338dd5f4a3@mail.gmail.com>
Date: Sun, 26 Nov 2006 14:14:24 +0300
From: "Andrey Bondarenko" <abondarenko@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <abf5c18a0611251639j135fe977g630e7c815d25ff20@mail.gmail.com>
MIME-Version: 1.0
References: <1164220048.821.1.camel@localhost>
	<abf5c18a0611251639j135fe977g630e7c815d25ff20@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: Glibc for Angstrom fails to build
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
X-List-Received-Date: Sun, 26 Nov 2006 11:17:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello!

Yes, I had done so and now it works. Thank you!

2006/11/26, Michal Panczyk <mpanczyk@gmail.com>:
>
> Hi !
> I am not sure if You still need help with that.
> I had similar problems while building image for h2200.
>
> Have You tried playing with Your build config like
>
> # adding qemu-native to ASSUME_PROVIDED
> ENABLE_BINARY_LOCALE_GENERATION = "0"
> ASSUME_PROVIDED += "qemu-native"
>
> ?
>
> My problem was that image for h2200 was build with gcc >v4 (inside the
> OE). Additionally to the config above You need to have the qemu
> package on Your system which is not going to be a problem if You are
> using gcc3.
>
> I hope it helps ...
>
> Michal
>
> On 11/22/06, Andrey A Bondarenko <abondarenko@gmail.com> wrote:
> > Hello!
> >
> > I am just fallowing the manual on the oe.org site. I can not build glibc
> > (i.e. can not build anything). I am using gcc 3.4 on Fedora Core 6.
> >
> > [shaman@localhost build]$ bitbake gpe-image
> > NOTE: Using cache in '/OE/build/tmp/cache/hx4700'
> > NOTE: Handling BitBake files: / (4045/4045) [100 %]
> > NOTE: Parsing finished. 3882 cached, 0 parsed, 163 skipped, 0 masked.
> >
> > NOTE: build 200611222009: started
> >
> > OE Build Configuration:
> > BB_VERSION     = "1.6.3"
> > OE_REVISION    = "7faa9e1500d9ce5c29c1b92c2545f05b296a34ea"
> > TARGET_ARCH    = "arm"
> > TARGET_OS      = "linux-gnueabi"
> > MACHINE        = "hx4700"
> > DISTRO         = "angstrom"
> > DISTRO_VERSION = "test-20061122"
> > TARGET_FPU     = "soft"
> >
> > NOTE: preferred version 2.5 of glibc not available
> > NOTE: package glibc-2.5: started
> > NOTE: package glibc-2.5-r3: task do_compile: started
> > NOTE: SITE
> > files /OE/org.openembedded.dev/site/endian-little
> /OE/org.openembedded.dev/site/arm-linux
> > NOTE: package glibc-2.5-r3: task do_compile: completed
> > NOTE: package glibc-2.5-r3: task do_install: started
> > NOTE: SITE
> > files /OE/org.openembedded.dev/site/endian-little
> /OE/org.openembedded.dev/site/arm-linux
> > NOTE: package glibc-2.5-r3: task do_install: completed
> > NOTE: package glibc-2.5-r3: task do_package: started
> > NOTE: preparing tree for binary locale generation
> > NOTE: SITE
> > files /OE/org.openembedded.dev/site/endian-little
> /OE/org.openembedded.dev/site/arm-linux
> > NOTE: generating locale es_NI (UTF-8)
> > NOTE: Task failed: localedef returned an error (command was
> >
> PATH="/OE/build/tmp/staging/i686-linux/bin/arm-angstrom-linux-gnueabi:/OE/build/tmp/staging/i686-linux/bin:/OE/build/tmp/cross/bin:/OE/bitbake/bin/:/usr/lib/qt-
> 3.3/bin:/usr/kerberos/bin:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/home/shaman/bin"
> I18NPATH="/usr/share/i18n" qemu-arm -r 2.6.16 -L
> /OE/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.5-r3/locale-tree
> /OE/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.5-r3/locale-tree/bin/localedef
> --force --old-style --no-archive
> --prefix=/OE/build/tmp/work/armv5te-angstrom-linux-gnueabi/glibc-2.5-r3/locale-tree
> --inputfile=/usr/share/i18n/locales/es_NI --charmap=UTF-8 es_NI).
> > NOTE: package glibc-2.5-r3: task do_package: failed
> > ERROR: TaskFailed event exception, aborting
> > NOTE: package glibc-2.5: failed
> > ERROR: Build of gpe-image failed
> >
> > --
> > WBR,
> > Andrey "Shaman007" Bondarenko
> >
> > http://mobilelinux.ru
> > http://mobilelinux.ru/wiki
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
>
> --
>
> Michal
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
WBR,
Andrey "Shaman007" Bondarenko

http://mobilelinux.ru

