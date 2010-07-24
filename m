Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OclgR-0001XT-JI
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 22:51:02 +0200
Received: by gyd8 with SMTP id 8so604798gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 13:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=s1GUb4qnpfl6kx4/Tvwgtl5vegwqIYD4O4MLeBjgvYI=;
	b=j9zu0N/2XpGUUSdVMt4i5+SnAkTAdQjSgiPgfCpOJ1qonxlktflxly1usXUk+fYVp2
	xH1rLkgi2lKgEdLPAgBkvHPdCzFVteBH5c+FflsSBs3CQIswEp8WAYIfG6CcgpJhRBgu
	aS0G3ihh0vweKkGYktf0HmLwIvPkooRzBQNUI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=CY7dlrICHI8zzqsYS5NdsUFY2zeYHWH89acZRGYp+poveF2ytZK5nN6CILQRlxUv1h
	1Xv2tbN5xaWnDGbq9ArdqNqeN/NvM/JJsaP1iI80NobasQefDblxB4/Blq5eY0ib52T1
	iNwRkUSyNGrM9huHyguxdsU4EZnS2o4NhtG2k=
Received: by 10.100.128.16 with SMTP id a16mr5784825and.34.1280004630213; Sat, 
	24 Jul 2010 13:50:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.8.16 with HTTP; Sat, 24 Jul 2010 13:50:10 -0700 (PDT)
In-Reply-To: <4C4B387F.4040407@mlbassoc.com>
References: <4C4B387F.4040407@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Jul 2010 13:50:10 -0700
Message-ID: <AANLkTimJ7urU4OQ-1BXBJgU7SZFBRyw2D+Adzw-13eDa@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: Can't build on Fedora 13
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
X-List-Received-Date: Sat, 24 Jul 2010 20:51:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 24, 2010 at 12:01 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> Trying to build angstrom-gnome-image for beagleboard, fresh checkout
> of org.openembedded.dev:
> =A0commit 244deb462973a2d7a9bfcc3399843202f9d29d51
> =A0Author: Stanislav Brabec <utx@penguin.cz>
> =A0Date: =A0 Sat Jul 24 14:21:03 2010 +0000
>
> On Fedora 13, I get this error:
>
> ERROR: Function do_configure failed
> NOTE: Task failed: ('function do_configure failed',
> '/home/local/Angstrom_BeagleBoard/tmp/work/i686-linux/gawk-native-3.1.4-r=
3/temp/log.do_configure.10165')
> ERROR: Logfile of failure stored in:
> /home/local/Angstrom_BeagleBoard/tmp/work/i686-linux/gawk-native-3.1.4-r3=
/temp/log.do_configure.10165
> Log data follows:
> | automake (GNU automake) 1.11.1
> | Copyright (C) 2009 Free Software Foundation, Inc.
> | License GPLv2+: GNU GPL version 2 or later
> <http://gnu.org/licenses/gpl-2.0.html>
> | This is free software: you are free to change and redistribute it.
> | There is NO WARRANTY, to the extent permitted by law.
> |
> | Written by Tom Tromey <tromey@redhat.com>
> | =A0 =A0 =A0 =A0and Alexandre Duret-Lutz <adl@gnu.org>.
> | AUTOV is 1.11
> | NOTE:
> /home/local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/share/gettex=
t/config.rpath
> not found. gettext is not installed.
> | NOTE: Executing autoreconf --verbose --install --force --exclude=3Dauto=
point
> -I
> /home/local/Angstrom_BeagleBoard/tmp/work/i686-linux/gawk-native-3.1.4-r3=
/gawk-3.1.4/m4/
> -I/home/local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/share/aclo=
cal-1.11
> -I
> /home/local/Angstrom_BeagleBoard/tmp/sysroots/i686-linux/usr/share/acloca=
l
> | /usr/bin/autoreconf: unrecognized option `--exclude=3Dautopoint'
> | Try `/usr/bin/autoreconf --help' for more information.

Why dont you stage autoconf-native and automake-native

> | FATAL: autoreconf execution failed.
> NOTE: package gawk-native-3.1.4-r3: task do_configure: Failed
>
> The same tree builds on Fedora 12
>
> Any ideas how to work past this?
>
> Thanks
>
> --
> ------------------------------------------------------------
> Gary Thomas =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0Consulting for the
> MLB Associates =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0Embedded world
> ------------------------------------------------------------
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


