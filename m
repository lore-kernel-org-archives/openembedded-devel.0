Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OGwUY-0006ov-EW
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 May 2010 17:56:42 +0200
Received: by iwn2 with SMTP id 2so4328706iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 May 2010 08:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=/jbvJjgyQr1hyvvpNJ+giT7+Pd6ARLIb+T36tdrojGA=;
	b=n0VJlPCDZUsGz8gSDkvtJYdogmAUD8uTBd6MB6z7CDYxPW69Q88GvOxi3nugtt0phM
	W4Dt7cpnp3IPX1n4yf2LGKIgxFv9dPMatdOXrGhGzHXjnNaC2z/5TSUDLYhfVMgR4Ztv
	8z7tjI8bA0Bhs6UMTm5XaYyRDNXAAsiey4W8s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ArVvh2gmc5n8U6QVQ2IufHMB0ROgWBwoKKIAkHK7EgDmlzHXv0mYWM+EsDFnqO68uw
	1ZmcKhrAb+glii/bGvAHIN23Y66h6ggODmvTxFO2rs/FjzDILWrRjVsvS7ySAjJCSesa
	hzl3j77quMBIjzJ9EhkwrVNhLYfWLSY1jG+gs=
MIME-Version: 1.0
Received: by 10.231.149.143 with SMTP id t15mr6550454ibv.29.1274802744636; 
	Tue, 25 May 2010 08:52:24 -0700 (PDT)
Received: by 10.231.30.67 with HTTP; Tue, 25 May 2010 08:52:24 -0700 (PDT)
In-Reply-To: <alpine.LNX.2.00.1005251636150.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005191726560.21508@asterix.crazy-teaparty.dyndns.org>
	<ht14oq$ok6$1@dough.gmane.org>
	<alpine.LNX.2.00.1005211250480.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211518470.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211537200.5274@asterix.crazy-teaparty.dyndns.org>
	<AANLkTim5DgTLfF1duohbONBtWCc1ASKfcACiJ2M66rr3@mail.gmail.com>
	<alpine.LNX.2.00.1005241813190.5274@asterix.crazy-teaparty.dyndns.org>
	<20100524182529.GA28464@gmail.com>
	<alpine.LNX.2.00.1005251636150.5274@asterix.crazy-teaparty.dyndns.org>
Date: Tue, 25 May 2010 08:52:24 -0700
Message-ID: <AANLkTimGQw84uTAjKDVjJLZKbsATtDZqrFeDfSGnfrQw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Tue, 25 May 2010 15:56:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2010 at 8:15 AM, Vitus Jensen <vjensen@gmx.de> wrote:
> On Mon, 24 May 2010, Khem Raj wrote:
>>
>> On (24/05/10 18:36), Vitus Jensen wrote:
>
>
>>> Hmm, I'm using angstrom with glibc. =A0And I'm testing on the real
>>> device and saw that -mhard-float is implied by mcpu=3D603e. =A0Using th=
e
>>> FPU would certainly explain differences between qemu and the real
>>> thing. =A0But __floatdidf is hard to understand, all macro. =A0Is it
>>> really using the FPU?
>>
>> Yeah that could be something to look at. In general if gcc is using
>> fp instruction to schedule then it might be using them.
>>
>> You should try to find which libgcc is it linking to when using g++
>> and gcc. It could be that its linking in two different libgcc versions
>>
>> secondly try to compile program statically and then run it.
>
>
> Using -static-libgcc and -shared-libgcc was interesting, it just affects =
the
> gcc support code. =A0static is default for C, shared for C++ and forcing
> static for C++ produced correct output. =A0When comparing implementations=
:
>
> * static uses inline fpu code, source
> work/i686-ppc603e-sdk-angstrom-linux/gcc-cross-sdk-4.4.4-r2.1/gcc-4.4.4/g=
cc/libgcc2.c
>
> * shared calls into libgcc_s.so.1 which uses software, excerpt:
> Dump of assembler code for function __floatdidf:
> =3D> 0x0fe12878 <+0>: =A0 =A0 stwu =A0 =A0r1,-32(r1)
> =A0 0x0fe1287c <+4>: =A0 =A0 mflr =A0 =A0r0
> =A0 0x0fe12880 <+8>: =A0 =A0 stmw =A0 =A0r26,8(r1)
> =A0 0x0fe12884 <+12>: =A0 =A0mr =A0 =A0 =A0r27,r4
> =A0 0x0fe12888 <+16>: =A0 =A0mr =A0 =A0 =A0r26,r3
> =A0 0x0fe1288c <+20>: =A0 =A0srawi =A0 r9,r26,31
> =A0 0x0fe12890 <+24>: =A0 =A0srawi =A0 r10,r26,0
> =A0 0x0fe12894 <+28>: =A0 =A0stw =A0 =A0 r0,36(r1)
> =A0 0x0fe12898 <+32>: =A0 =A0mr =A0 =A0 =A0r3,r10
> =A0 0x0fe1289c <+36>: =A0 =A0bl =A0 =A0 =A00xfe31244 <__floatsidf@plt>
> =A0 0x0fe128a0 <+40>: =A0 =A0lis =A0 =A0 r5,16880
>
>
> [STABLE/2009] There are 2 libgcc_s.so.1 versions in TMPDIR/cross, the big=
ger
> ./ppc603e/powerpc-angstrom-linux/lib/nof/libgcc_s.so.1 matches the instal=
led
> version,

thats the problem

if one copies the smaller version (uses fpu code) to target:/lib/
> the results of -shared-libgcc applications are OK.
>
> So, hard-fpu and soft-fpu are incompatible? =A0The incorrect version matc=
hes
> (strip; cmp -l) several paths in TMPDIR/work:

its more the calling convention.

>
> ./ppc603e-angstrom-linux/gcc-4.2.4-r3/image/lib/libgcc_s.so.1
> ./ppc603e-angstrom-linux/gcc-4.2.4-r3/gcc-4.2.4/build.powerpc-angstrom-li=
nux.powerpc-angstrom-linux/gcc/nof/libgcc_s.so.1
> ./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/install/libgcc/lib/libgcc_s.s=
o.1
> ./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/image/lib/libgcc_s.so.1
> ./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/staging-pkg/cross/powerpc-ang=
strom-linux/lib/nof/libgcc_s.so.1
> ./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/build.i686-linux.po=
werpc-angstrom-linux/gcc/nof/libgcc_s.so.1
>
> But there are 4 other smaller versions of that library, the good one comi=
ng
> from gcc-4.2.4. or gcc-cross-4.2.4. =A0Which recipes decides which versio=
n to
> copy into the image? =A0For now it seems enough to copy a fpu-version by =
hand
> into the image but this is hardly an universal solution.

actually it should have packaged the fpu version into /lib on target
but its a bug that it instead copied
nof version.

I think I touched this area and saw this problem in past. Can you try
gcc 4.4.4 and see if the problem still
happens there.

>
> Vitus
>
> --
> Vitus Jensen, Hannover, Germany, Universe (current)
> pgp public key available from keyservers
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


