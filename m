Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OWOiT-0003N8-BU
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 09:06:46 +0200
Received: by bwz10 with SMTP id 10so3710417bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 00:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=SvDp/7ci7nYxPuv2BVoGr6GtxlNf1TAsXNLmHTgMKKM=;
	b=Kdp4up9goCajD0wZzq1U1Y4PhDvO8uULl+qmAh6TfNwWAjn0Z5goHT2QaNW2TBGBwe
	VNbnwz2bXmV7yskCEzag1vZHj0HmBNw52mGL4Sc8e/cm9bX8rtape1MI+l8hReai7UDU
	Ztgabx6qPivivSgIO/pZT3wIFW0WEwFfaJRU0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=B8SdYLn2YqTSzPyZjICgy1FuXWl5dXv22EDpY0VqMccebvokLxIy5yqf0Qd52lEeYl
	6k74rzsM9X4k6uFc/oBFimDxWx+XoRTu7aKUmTVc5aH2SP5uCULldmc4lxCuNWqiirU0
	tlUaPTUwdv0M3AXjyquuybpuWPyFIMOqfBMYI=
MIME-Version: 1.0
Received: by 10.204.79.204 with SMTP id q12mr4729884bkk.123.1278486116404; 
	Wed, 07 Jul 2010 00:01:56 -0700 (PDT)
Received: by 10.204.66.68 with HTTP; Wed, 7 Jul 2010 00:01:56 -0700 (PDT)
In-Reply-To: <i108p5$hd$1@dough.gmane.org>
References: <i108p5$hd$1@dough.gmane.org>
Date: Wed, 7 Jul 2010 09:01:56 +0200
Message-ID: <AANLkTikgJStw6b_UmhbV9yIOdsjO7sBsX06dsDVTu-VX@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: commit 4d6a63850b4dc7ca2f060aedda26ddf4efa0e5cc
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
X-List-Received-Date: Wed, 07 Jul 2010 07:06:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/6 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Things like this:
>
> +LIBC = "glibc"
> +ANGSTROMLIBC = "${LIBC}"
>
> +PREFERRED_VERSION_gcc-cross = "4.1.2"
> +PREFERRED_VERSION_gcc-cross-initial = "4.1.2"
> +PREFERRED_VERSION_gcc-cross-intermediate = "4.1.2"
> +PREFERRED_VERSION_binutils = "2.17.50.0.12"
> +PREFERRED_VERSION_binutils-cross = "2.17.50.0.12"
> +PREFERRED_VERSION_glibc = "2.5"
> +PREFERRED_VERSION_glibc-initial = "2.5"
>
> +PREFERRED_VERSION_busybox_nios2 = "1.13.2"
>
> +ASSUME_PROVIDED += "linux-libc-headers-native"
>
> do NOT belong in a machine.conf (or machine include). Those belong in
> the distro (or local.conf), not in the machine.
>
> So please, move the offending bits into a distro include (minus the
> assume provided) to stop this kind of bad example from spreading further.

Being the one who made the commit I'd like to make a few remarks.

First of all I suggest that if you quote text, you also quote the
comments that go with the text you quote:

# for now we pin gcc, glibc and binutils
# as these are the only versions that have
# nios2 support.
PREFERRED_VERSION_gcc-cross = "4.1.2"
PREFERRED_VERSION_gcc-cross-initial = "4.1.2"
PREFERRED_VERSION_gcc-cross-intermediate = "4.1.2"
PREFERRED_VERSION_binutils = "2.17.50.0.12"
PREFERRED_VERSION_binutils-cross = "2.17.50.0.12"
PREFERRED_VERSION_glibc = "2.5"
PREFERRED_VERSION_glibc-initial = "2.5"

# uclibc does not work yet
# PREFERRED_VERSION_uclibc = "0.9.30.3"
# PREFERRED_VERSION_uclibc-initial = "0.9.30.3"

# for now busybox 1.13.2 is the only one
# patched and tested for nios2 so pin this
# one too, until the other versions are updated
# for nios2 too.
PREFERRED_VERSION_busybox_nios2 = "1.13.2"

# there are some issues cross-compiling when
# using linux-libc-headers-native as we get
# some native inc dirs when compiling crt stuff
# ASSUME_PROVIDED fixes this (but breaks compilation
# on old host systems like red hat 4.
ASSUME_PROVIDED += "linux-libc-headers-native"

Secondly, pinning LIBC to glibc in a machine conf or include is indeed
not too desirable but as neither uclibc or eglibc are working for this
architecture I needed a way to indicate this.
If there is a better solution for this, please let me know.

Next wrt the busybox pinning: this is just a temporary as indicated by
the comment. It'll disappear for sure in the near future (after I had
time to look at later busyboxes and fix those).

Wrt the ASSUME_PROVIDED += "linux-libc-headers-native":
I'll happily remove it once the include badness introduced by
linux-libc-headers-native is fixed. (there is a different thread on
this).

And finally the pinning of gcc/binutils/glibc.
I feel the machine (and not the distro) is the one who should be able
to specify which version(s) work for that machine and what the
preferred version is.
That is: for gcc and binutils. glibc might be a different case.
It might be that a distro wants to override this, and I can imagine we
want to support that. I'd say overriding in such a case is done on an
architecture or machine base, not in a generic override.

Note also that the current machine description makes things working
for *all* distros, whereas without it it would probably not be working
for any distro at all!

And lastly I am unaware of any place in the oe manual which states the
above is bad behaviour (and why this is bad).

Frans.

PS: as mentioned before there are currently 100+ pinnings in
conf/machine/* and conf/machine/include/* and at least two other
machines pin gcc

PPS: adding a new architecture to oe is quite some work. Picking on
people does not really encourage to contribute that work. I could have
equally well have kept this local.


