Received: from mail-iw0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYpV7-00031e-5R
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Jan 2010 00:34:48 +0100
Received: by iwn5 with SMTP id 5so759441iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 15:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aDwqaMs1FjKiqss3aQ+VIlS513yBOc1+MF8c8xWbLAI=;
	b=RLSnzmP9Hj0ZK0jHkHGIbMU56rmjNHWkJQcQ3wRAwPygyP7vE8LEh/r+Ai7uOON8k0
	0X6QZYlZ5mo3HGKBvUle1eOPTpHiW2zTvZXqIc2z9ovuFb9YbYn1zoPyT+xyRAXOfMg1
	w6eKrN84wO6d0KjO1SwphJq9f52k2Er12vDj8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=XOGskORfo3FsZXj4INHjTjMSp20dlRh4/SmDB1UIph/9sYeL2yZj5dLFKmO4e7Uk/o
	cle8f8X5xDmTo3LC9UgS6p1qrJmXoS1oDXvceCn5xsnqdM38f0ncOoXFVrpuIIU4gQkZ
	YmUoWdGEjo9K1roq/k3czMPmQ/K6bKWL+qHqg=
MIME-Version: 1.0
Received: by 10.231.160.205 with SMTP id o13mr5731449ibx.13.1264289545658; 
	Sat, 23 Jan 2010 15:32:25 -0800 (PST)
In-Reply-To: <op.u6zcpxd7mn1qzu@guohr-laptop-ubuntu>
References: <op.u6zcpxd7mn1qzu@guohr-laptop-ubuntu>
Date: Sat, 23 Jan 2010 15:32:25 -0800
Message-ID: <19c1b8a91001231532y27421c4fk33b7b2d961bc16cc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: undefined reference to `_restfpr_14_x' in gcc-4.4.2/libgcc/../gcc/unwind.inc:307 when building ppc603e
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
X-List-Received-Date: Sat, 23 Jan 2010 23:34:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 23, 2010 at 1:59 AM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =A0I am trying to building openembedded with the following configuration.
> MACHINE=3Dstorcenter
> DISTRO=3Dmicro
> LIBC=3Deglibc
> But I met the following error when compiling eglibc-2_10:
>
> =A0/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/cross/=
eglibc/ppc603e/lib/gcc/powerpc-oe-linux/4.4.2/libgcc_eh.a(unwind-dw2.o):
> In function `_Unwind_Backtrace':
> |
> /media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egli=
bc/ppc603e-oe-linux/gcc-cross-intermediate-4.4.2-r2.1/gcc-4.4.2/libgcc/../g=
cc/unwind.inc:307:
> undefined reference to `_restfpr_14_x'
> | collect2: ld returned 1 exit status
> | make[2]: ***
> [/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egl=
ibc/ppc603e-oe-linux/eglibc-2.10-r8.6/build-powerpc-oe-linux/elf/sln]
> Error 1
> | make[2]: *** Waiting for unfinished jobs....
> |
> /media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/cross/egl=
ibc/ppc603e/lib/gcc/powerpc-oe-linux/4.4.2/libgcc_eh.a(unwind-dw2.o):
> In function `_Unwind_Backtrace':
> |
> /media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egli=
bc/ppc603e-oe-linux/gcc-cross-intermediate-4.4.2-r2.1/gcc-4.4.2/libgcc/../g=
cc/unwind.inc:307:
> undefined reference to `_restfpr_14_x'
> | collect2: ld returned 1 exit status
> | make[2]: ***
> [/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/egl=
ibc/ppc603e-oe-linux/eglibc-2.10-r8.6/build-powerpc-oe-linux/elf/ldconfig]
> Error 1
>
> anyone has met the same question before?

Coincidently, I am seeing similar but not same type of error since
yesterday when I started to do qemu ppc work. I have a half cooked
patch
which still does not work yet.

> Is it caused by the incorrect toolchain set?

probably some gcc misconfiguration. What options are passed to gcc
configure and eglibc configure can you post them plz.

> Is there anyone who has ever built toolchain for powerpc successfully?
>

> Thanks a lot!
>
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


