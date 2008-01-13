Received: from [209.85.146.181] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <theqmann@gmail.com>) id 1JE9Pm-0000xF-GN
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Jan 2008 21:26:51 +0100
Received: by wa-out-1112.google.com with SMTP id l24so3484517waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Jan 2008 12:26:14 -0800 (PST)
Received: by 10.115.106.7 with SMTP id i7mr1143253wam.18.1200255974367;
	Sun, 13 Jan 2008 12:26:14 -0800 (PST)
Received: by 10.114.47.16 with HTTP; Sun, 13 Jan 2008 12:26:14 -0800 (PST)
Message-ID: <c67f1650801131226v2e3c053cyc48e56595cec737@mail.gmail.com>
Date: Sun, 13 Jan 2008 12:26:14 -0800
From: QMan <theqmann@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: mtn disapprove
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
X-List-Received-Date: Sun, 13 Jan 2008 20:27:06 -0000
X-List-Received-Date: Sun, 13 Jan 2008 20:27:06 -0000
X-List-Received-Date: Sun, 13 Jan 2008 20:27:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Comment inline down below.

-John

> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org
> [mailto:openembedded-devel-bounces@lists.openembedded.org] On
> Behalf Of Koen Kooi
> Sent: Sunday, January 13, 2008 8:31 AM
> To: Using the OpenEmbedded metadata to build Distributions
> Subject: Re: [oe] mtn disapprove
>
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Rolf Leggewie schreef:
> | Thomas Kunze schrieb:
> |> Have only things in zaurus-2.6.inc that are common to all zaurus.
> |
> | Hehe, have a look at
> 4989371c8e7cec943a964b459ec3e71c0f547204 which I
> | committed yesterday. It already does exactly as you
> suggest.  My mail
> | about it has not made it to the list, though.  There seems
> to be a few
> | hours backlog with the OE ml.
>
> I suspect spamassassin.
>
> | From the commit message
> |
> | conf/machine/: fix configuration for Strongarm devices
> | * replace erroneous TARGET_CC_ARCH line optimising for
> xscale instead of
> |   strongarm
> | * remove inclusion of tune-strongarm.inc from collie.conf
> and replace it
> |   with the correct TARGET_CC_ARCH.  Collie is the only
> Strongarm 1110
> |   device in OE and thus needs special treatment
>
> Is it? Wikipedia[2] Tells a different story, and AFAIK simpad
> and htcwallaby are sa1110 as well.
>
> | * rename tune-strongarm.inc to tune-strongarm1100.inc and
> leave a short
> |   note to make it clear the file only applies to Strongarm
> 1100 devices.
> |
> | collie is apparently Strongarm 1110, all other Zaurus are 1100.
>
> ~From the gcc 4.1.2 manual[1]:
>
> - -->8------
> - -mcpu=name
> This specifies the name of the target ARM processor. GCC uses
> this name to determine what kind of instructions it can emit
> when generating assembly code. Permissible names are: `arm2',
> `arm250', `arm3', `arm6', `arm60', `arm600', `arm610',
> `arm620', `arm7', `arm7m', `arm7d', `arm7dm', `arm7di',
> `arm7dmi', `arm70', `arm700', `arm700i', `arm710', `arm710c',
> `arm7100', `arm7500', `arm7500fe', `arm7tdmi', `arm7tdmi-s',
> `arm8', `strongarm', `strongarm110', `strongarm1100', `arm8',
> `arm810', `arm9', `arm9e', `arm920', `arm920t', `arm922t',
> `arm946e-s', `arm966e-s', `arm968e-s', `arm926ej-s',
> `arm940t', `arm9tdmi', `arm10tdmi', `arm1020t',
> `arm1026ej-s', `arm10e', `arm1020e', `arm1022e',
> `arm1136j-s', `arm1136jf-s', `mpcore', `mpcorenovfp',
> `arm1176jz-s', `arm1176jzf-s', `xscale', `iwmmxt', `ep9312'.
>
> - -mtune=name
> This option is very similar to the -mcpu= option, except that
> instead of specifying the actual target processor type, and
> hence restricting which instructions can be used, it
> specifies that GCC should tune the performance of the code as
> if the target were of the type specified in this option, but
> still choosing the instructions that it will generate based
> on the cpu specified by a -mcpu= option. For some ARM
> implementations better performance can be obtained by using
> this option.
>
> - --8<------
>
> There's no 'strongarm1110' (four digits of which 3 ones)
> entry only strongarm (no digits) strongarm110 (three digits
> of which 2 ones) and strongarm1100 (four digits of which 2 ones)

It turns out a bunch of aliases were added for specific models that use the
same options as the generic family they belong to.  These aliases never made
it to the documentation.


> So I suggest using -mtune=strongarm for all strongarm
> devices, since that's the safest *documented* gcc tune option
> for strongarm CPUs. As for why OE was using -mtune=xscale:

Agreed.  Also, looking at the gcc source, it's pretty obvious that the
compiler uses the same options for all of the strongarm* tune options
anyway:

ARM_CORE("strongarm",     strongarm,    4,                   FL_MODE26 |
FL_LDSCHED | FL_STRONG, fastmul)
ARM_CORE("strongarm110",  strongarm110, 4,                   FL_MODE26 |
FL_LDSCHED | FL_STRONG, fastmul)
ARM_CORE("strongarm1100", strongarm1100, 4,                  FL_MODE26 |
FL_LDSCHED | FL_STRONG, fastmul)
ARM_CORE("strongarm1110", strongarm1110, 4,                  FL_MODE26 |
FL_LDSCHED | FL_STRONG, fastmul)

>
> ~  In a past a long time ago where bitbake needed 1GB of
> memory and multimachine wasn't around yet the distributions
> targeting strongarm devices (openzaurus and familiar) wanted
> to have a single feed for all devices (strongarm and pxa)
> without having a big speed penalty on xscale devices with a
> bigger pipeline. So the binaries run on both strongarm and
> xscale, but without the ~60% speedhit you would get without
> - -mtune-xscale. The downside is that the binaries are slower
> on actual strongarm cpus.
>
> But AFAIK nowadays all strongarm targetting distros use
> multimachine, so we can replace the xscale with strongarm and
> get a slight speed boost since gcc will optimize for a 5
> stage pipeline instead of a seven stage one.
>
> Summary:
> ~ * don't use undocumented gcc options
> ~ * tune for the correct cpu family
>
> regards,
>
> Koen
>
> [1] http://gcc.gnu.org/onlinedocs/gcc-4.1.2/gcc/ARM-Options.html
> [2] http://en.wikipedia.org/wiki/IPAQ
> [3] http://gcc.gnu.org/ml/gcc/2002-02/msg00508.html
>
> PS: there also is a sa1111, but that's a companion chip to
> the sa11x0 for things like usbhost.
>
> - --
> koen@dominion.kabel.utwente.nl will go go away in december
> 2007, please use k.kooi@student.utwente.nl instead.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFHijynMkyGM64RGpERAi7/AJ4vqWIdoCb57PY14AfyXlsfRwr3ogCeKw3L
> 0nxgQT9yk0GcS6APZFzaPyo=
> =jmYG
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

