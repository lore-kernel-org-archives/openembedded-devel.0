Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P5stq-0001Zb-9w
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 06:25:13 +0200
Received: by vws3 with SMTP id 3so1724308vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 21:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=YWRxZ/uGgJ8kXwyyOV3fV4Iso7EtTqAPId8ITaAGotQ=;
	b=lBBL7gyzb6O+N1i5CzzbtGUe80Hn66IB1LTxtFKxWX1OvXqVaBi6SJOY6vboXDY3na
	yuyPxdZ+rdfF4vQcmYBsLyOSrUaha4tmRybH9CFeWyuuBjWAAJ8ih9PG/XW48t61Bu+U
	zrJcRsq4BV0Mbm6HHsuTs6YLSk9dyQKUJmocQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=vX+OeX0z7yIr1LDCXfxKHzNWy+79QqouZtqSpOP+kFOiVyyDsBmpv0nWTEWbUHRCJT
	hJj/nhRZd1q4V51zTQWPJ3zMVGMyc0p0DAuIZBqLcqfMfViZL5kbC8PU2ENWjSa5Y7mZ
	wdnAO26UQr3gxa07Vfpm+630FTgGTe8mWcmBc=
MIME-Version: 1.0
Received: by 10.220.97.12 with SMTP id j12mr2625909vcn.36.1286943872674; Tue,
	12 Oct 2010 21:24:32 -0700 (PDT)
Received: by 10.220.201.141 with HTTP; Tue, 12 Oct 2010 21:24:32 -0700 (PDT)
In-Reply-To: <AANLkTi=C+v2LfaXUuwTARn6hTmriWcUdBqKfq6pHPTAr@mail.gmail.com>
References: <AANLkTi=C+v2LfaXUuwTARn6hTmriWcUdBqKfq6pHPTAr@mail.gmail.com>
Date: Tue, 12 Oct 2010 21:24:32 -0700
Message-ID: <AANLkTi=3=kmAAgBLDfo7JReyL-O3YugdEOdnMX51kAPW@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Libprelude fails on oe_runmake
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
X-List-Received-Date: Wed, 13 Oct 2010 04:25:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 12, 2010 at 12:18 PM, J. L. <vwyodapink@gmail.com> wrote:
> Anyone have any ideas as how to fix this or what may be causing this?
> I bumped my image to using barnyard2 and brought up this issue for me.
> Thanks for the help, I am only posting part of the error as its really
> long:
>
> | arm-angstrom-linux-gnueabi-libtool: compile:
> arm-angstrom-linux-gnueabi-g++ -march=3Darmv7-a -mtune=3Dcortex-a8
> -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thumb
> -DHAVE_CONFIG_H -I. -I../..
> -I/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-l=
inux
> -isystem/home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/include
> -O2 -g -I../.. -I../../src/include -I../../src/include
> -I../../src/libprelude-error -I../../bindings/c++/include
> -I../../libmissing -I../../libmissing
> -isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include
> -isystem/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/include
> -fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2
> -ggdb2 -fpermissive -fvisibility-inlines-hidden -MT
> PreludeEasy_la-PreludeEasy.lo -MD -MP -MF
> .deps/PreludeEasy_la-PreludeEasy.Tpo -c PreludeEasy.cxx =A0-fPIC -DPIC
> -o .libs/PreludeEasy_la-PreludeEasy.o
> | In file included from
> /home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-lin=
ux/missing.h:16:0,
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from
> /home/vdubhack/overo-oe/tmp/sysroots/i686-linux/usr/lib/ruby/1.8/i686-lin=
ux/ruby.h:755,
> | =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0from PreludeEasy.cxx:856:
> | ../../libmissing/sys/time.h:85:58: error: conflicting declaration
> 'void* restrict'
> | ../../libmissing/sys/time.h:85:42: error: 'restrict' has a previous
> declaration as 'timeval* restrict'
> | make[3]: *** [PreludeEasy_la-PreludeEasy.lo] Error 1
> | make[3]: Leaving directory
> `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelud=
e-1.0.0-r0/libprelude-1.0.0/bindings/ruby'
> | make[2]: *** [all-recursive] Error 1
> | make[2]: Leaving directory
> `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelud=
e-1.0.0-r0/libprelude-1.0.0/bindings'
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> `/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelud=
e-1.0.0-r0/libprelude-1.0.0'
> | make: *** [all] Error 2
> | FATAL: oe_runmake failed
> NOTE: Task failed:
> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/libprelude=
-1.0.0-r0/temp/log.do_compile.30120
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of
> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/libprelude/libprelud=
e_1.0.0.bb
> do_compile failed
> ERROR: Task 15 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/libp=
relude/libprelude_1.0.0.bb,
> do_compile) failed
> NOTE: Tasks Summary: Attempted 1090 tasks of which 1084 didn't need to
> be rerun and 1 failed.
> ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/libprelude/l=
ibprelude_1.0.0.bb'
> failed
>

As my debugging and figuring these things out is very minimal I gave
the cflags_append =3D -Os a try as I saw it posted to try with a
different package and still got a failure. Thanks for any tips or
pointers


