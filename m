Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OH9Iq-0007mL-Pr
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 07:37:18 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 06E62F8875
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 01:33:00 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Wed, 26 May 2010 01:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=/ddIuLDnfthrKO0DQjwzJhHJsTU=;
	b=RPs7x4yj8jr+N82cerMJfVuVtA0kBCnwbou2kSB1PlD2YlNgwZTXaFZMJUHYUnC8ExlwJ2D2qWu96vUZqMSuNQI+Szwvztu6BizMh1oKmSZtiZ/ZV/rEztn1ngcQBU4w9lyR57RLbP/xs+Aiwh1wIniYDoo80j23XfAM20KFL7A=
X-Sasl-enc: fIAqVMiSAu9t4BnWFzTvG776vmcxV2yLJVqCi5vieN3o 1274851979
Received: from [192.168.1.35] (hnvr-4d07b6da.pool.mediaWays.net [77.7.182.218])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 4A4C24C531B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 01:32:59 -0400 (EDT)
Date: Wed, 26 May 2010 07:34:26 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTimGQw84uTAjKDVjJLZKbsATtDZqrFeDfSGnfrQw@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1005260730500.5274@asterix.crazy-teaparty.dyndns.org>
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
	<AANLkTimGQw84uTAjKDVjJLZKbsATtDZqrFeDfSGnfrQw@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
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
X-List-Received-Date: Wed, 26 May 2010 05:37:18 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Tue, 25 May 2010, Khem Raj wrote:
> On Tue, May 25, 2010 at 8:15 AM, Vitus Jensen <vjensen@gmx.de> wrote:
>> On Mon, 24 May 2010, Khem Raj wrote:
>>> On (24/05/10 18:36), Vitus Jensen wrote:
>>
>>
>>>> Hmm, I'm using angstrom with glibc. =C2=A0And I'm testing on the rea=
l
>>>> device and saw that -mhard-float is implied by mcpu=3D603e. =C2=A0Us=
ing the
>>>> FPU would certainly explain differences between qemu and the real
>>>> thing. =C2=A0But __floatdidf is hard to understand, all macro. =C2=A0=
Is it
>>>> really using the FPU?
>>>
>>> Yeah that could be something to look at. In general if gcc is using
>>> fp instruction to schedule then it might be using them.
>>>
>>> You should try to find which libgcc is it linking to when using g++
>>> and gcc. It could be that its linking in two different libgcc version=
s
>>>
>>> secondly try to compile program statically and then run it.
>>
>>
>> Using -static-libgcc and -shared-libgcc was interesting, it just affec=
ts the
>> gcc support code. =C2=A0static is default for C, shared for C++ and fo=
rcing
>> static for C++ produced correct output. =C2=A0When comparing implement=
ations:
>>
>> * static uses inline fpu code, source
>> work/i686-ppc603e-sdk-angstrom-linux/gcc-cross-sdk-4.4.4-r2.1/gcc-4.4.=
4/gcc/libgcc2.c
>>
>> * shared calls into libgcc_s.so.1 which uses software, excerpt:
>> Dump of assembler code for function __floatdidf:
>> =3D> 0x0fe12878 <+0>: =C2=A0 =C2=A0 stwu =C2=A0 =C2=A0r1,-32(r1)
>> =C2=A0 0x0fe1287c <+4>: =C2=A0 =C2=A0 mflr =C2=A0 =C2=A0r0
>> =C2=A0 0x0fe12880 <+8>: =C2=A0 =C2=A0 stmw =C2=A0 =C2=A0r26,8(r1)
>> =C2=A0 0x0fe12884 <+12>: =C2=A0 =C2=A0mr =C2=A0 =C2=A0 =C2=A0r27,r4
>> =C2=A0 0x0fe12888 <+16>: =C2=A0 =C2=A0mr =C2=A0 =C2=A0 =C2=A0r26,r3
>> =C2=A0 0x0fe1288c <+20>: =C2=A0 =C2=A0srawi =C2=A0 r9,r26,31
>> =C2=A0 0x0fe12890 <+24>: =C2=A0 =C2=A0srawi =C2=A0 r10,r26,0
>> =C2=A0 0x0fe12894 <+28>: =C2=A0 =C2=A0stw =C2=A0 =C2=A0 r0,36(r1)
>> =C2=A0 0x0fe12898 <+32>: =C2=A0 =C2=A0mr =C2=A0 =C2=A0 =C2=A0r3,r10
>> =C2=A0 0x0fe1289c <+36>: =C2=A0 =C2=A0bl =C2=A0 =C2=A0 =C2=A00xfe31244=
 <__floatsidf@plt>
>> =C2=A0 0x0fe128a0 <+40>: =C2=A0 =C2=A0lis =C2=A0 =C2=A0 r5,16880
>>
>>
>> [STABLE/2009] There are 2 libgcc_s.so.1 versions in TMPDIR/cross, the =
bigger
>> ./ppc603e/powerpc-angstrom-linux/lib/nof/libgcc_s.so.1 matches the ins=
talled
>> version,
>
> thats the problem
>
> if one copies the smaller version (uses fpu code) to target:/lib/
>> the results of -shared-libgcc applications are OK.
>>
>> So, hard-fpu and soft-fpu are incompatible? =C2=A0The incorrect versio=
n matches
>> (strip; cmp -l) several paths in TMPDIR/work:
>
> its more the calling convention.
>
>>
>> ./ppc603e-angstrom-linux/gcc-4.2.4-r3/image/lib/libgcc_s.so.1
>> ./ppc603e-angstrom-linux/gcc-4.2.4-r3/gcc-4.2.4/build.powerpc-angstrom=
-linux.powerpc-angstrom-linux/gcc/nof/libgcc_s.so.1
>> ./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/install/libgcc/lib/libgcc_=
s.so.1
>> ./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/image/lib/libgcc_s.so.1
>> ./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/staging-pkg/cross/powerpc-=
angstrom-linux/lib/nof/libgcc_s.so.1
>> ./ppc603e-angstrom-linux/gcc-cross-4.2.4-r5/gcc-4.2.4/build.i686-linux=
.powerpc-angstrom-linux/gcc/nof/libgcc_s.so.1
>>
>> But there are 4 other smaller versions of that library, the good one c=
oming
>> from gcc-4.2.4. or gcc-cross-4.2.4. =C2=A0Which recipes decides which =
version to
>> copy into the image? =C2=A0For now it seems enough to copy a fpu-versi=
on by hand
>> into the image but this is hardly an universal solution.
>
> actually it should have packaged the fpu version into /lib on target
> but its a bug that it instead copied
> nof version.
>
> I think I touched this area and saw this problem in past. Can you try=20
> gcc 4.4.4 and see if the problem still happens there.

I really would like to but there is no gcc 4.4.4 in stable/2009.  And .de=
v=20
currently fails to build in virtual/kernel.

cp: cannot stat=20
`/home/oe/build/out.dev/work/n1200-angstrom-linux/linux-n1200-2.6.27-rc9+=
git-r3/linux-2.6.27-foonas-git//home/oe/build/out.dev/work/n1200-angstrom=
-linux/linux-n1200-2.6.27-rc9+git-r3/linux-2.6.27-foonas-git/arch/powerpc=
/boot/cuImage.thecus_n1200':=20
No such file or directory
ERROR: Function do_deploy failed

I think I have a buildable .dev state at work and will retry there.

Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


