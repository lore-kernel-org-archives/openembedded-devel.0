Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OLhxP-0000uc-Qi
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Jun 2010 21:26:01 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 4BF54F84AE
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jun 2010 15:21:41 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 07 Jun 2010 15:21:41 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type:content-transfer-encoding;
	s=smtpout; bh=4rJlEVbctoPgylnytqbTNGarlCw=;
	b=PbSb5sdUSYw+DvQEX3RWgMzvBsfSRyM29x7cgqWiga7JE/9FWQhjFMRcfuRLJGS869f7tj1fP6BR3lHUjvQrQMOb1lkXstumH/hX+9QHAL2wuHm97b+Tb2vs2jSFTwTTc5iTj/sIy2u7WdwW+z044GCO2mltpdrNdB3Jh3ulhJs=
X-Sasl-enc: rexKxyuKsASJlBNmEELDzlJXxHNxoiSkxpH5rormUGDu 1275938500
Received: from [192.168.1.35] (hnvr-4d079fe3.pool.mediaWays.net [77.7.159.227])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 91D0A4E7133
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Jun 2010 15:21:40 -0400 (EDT)
Date: Mon, 7 Jun 2010 21:23:09 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTinh3moH04QQ_HvrikAgvY-9mrh-o7U4Vq7ubKg1@mail.gmail.com>
Message-ID: <alpine.LNX.2.00.1006072115450.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211250480.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211518470.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211537200.5274@asterix.crazy-teaparty.dyndns.org>
	<AANLkTim5DgTLfF1duohbONBtWCc1ASKfcACiJ2M66rr3@mail.gmail.com>
	<alpine.LNX.2.00.1005241813190.5274@asterix.crazy-teaparty.dyndns.org>
	<20100524182529.GA28464@gmail.com>
	<alpine.LNX.2.00.1005251636150.5274@asterix.crazy-teaparty.dyndns.org>
	<AANLkTimGQw84uTAjKDVjJLZKbsATtDZqrFeDfSGnfrQw@mail.gmail.com>
	<alpine.LNX.2.00.1005260730500.5274@asterix.crazy-teaparty.dyndns.org>
	<AANLkTinh3moH04QQ_HvrikAgvY-9mrh-o7U4Vq7ubKg1@mail.gmail.com>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.29
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [STABLE] powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Mon, 07 Jun 2010 19:26:04 -0000
Content-Type: TEXT/PLAIN; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On Tue, 25 May 2010, Khem Raj wrote:

> On Tue, May 25, 2010 at 10:34 PM, Vitus Jensen <vjensen@gmx.de> wrote:
>> On Tue, 25 May 2010, Khem Raj wrote:
>>> On Tue, May 25, 2010 at 8:15 AM, Vitus Jensen <vjensen@gmx.de> wrote:
>>>> On Mon, 24 May 2010, Khem Raj wrote:
>>>>> On (24/05/10 18:36), Vitus Jensen wrote:
>>>>
>>>>
>>>>>> Hmm, I'm using angstrom with glibc. =C2=A0And I'm testing on the r=
eal
>>>>>> device and saw that -mhard-float is implied by mcpu=3D603e. =C2=A0=
Using the
>>>>>> FPU would certainly explain differences between qemu and the real
>>>>>> thing. =C2=A0But __floatdidf is hard to understand, all macro. =C2=
=A0Is it
>>>>>> really using the FPU?
>>>>>
>>>>> Yeah that could be something to look at. In general if gcc is using
>>>>> fp instruction to schedule then it might be using them.
>>>>>
>>>>> You should try to find which libgcc is it linking to when using g++
>>>>> and gcc. It could be that its linking in two different libgcc versi=
ons
>>>>> secondly try to compile program statically and then run it.
>>>>
>>>> Using -static-libgcc and -shared-libgcc was interesting, it just=20
>>>> affects the gcc support code. =C2=A0static is default for C, shared =
for=20
>>>> C++ and forcing static for C++ produced correct output. =C2=A0When=20
>>>> comparing implementations:
>>>>
>>>> * static uses inline fpu code, source
>>>>
>>>> work/i686-ppc603e-sdk-angstrom-linux/gcc-cross-sdk-4.4.4-r2.1/gcc-4.=
4.4/gcc/libgcc2.c
>>>>
>>>> * shared calls into libgcc_s.so.1 which uses software, excerpt:
>>>> Dump of assembler code for function __floatdidf:
>>>> =3D> 0x0fe12878 <+0>: =C2=A0 =C2=A0 stwu =C2=A0 =C2=A0r1,-32(r1)
>>>> =C2=A0 0x0fe1287c <+4>: =C2=A0 =C2=A0 mflr =C2=A0 =C2=A0r0
>>>> =C2=A0 0x0fe12880 <+8>: =C2=A0 =C2=A0 stmw =C2=A0 =C2=A0r26,8(r1)
>>>> =C2=A0 0x0fe12884 <+12>: =C2=A0 =C2=A0mr =C2=A0 =C2=A0 =C2=A0r27,r4
>>>> =C2=A0 0x0fe12888 <+16>: =C2=A0 =C2=A0mr =C2=A0 =C2=A0 =C2=A0r26,r3
>>>> =C2=A0 0x0fe1288c <+20>: =C2=A0 =C2=A0srawi =C2=A0 r9,r26,31
>>>> =C2=A0 0x0fe12890 <+24>: =C2=A0 =C2=A0srawi =C2=A0 r10,r26,0
>>>> =C2=A0 0x0fe12894 <+28>: =C2=A0 =C2=A0stw =C2=A0 =C2=A0 r0,36(r1)
>>>> =C2=A0 0x0fe12898 <+32>: =C2=A0 =C2=A0mr =C2=A0 =C2=A0 =C2=A0r3,r10
>>>> =C2=A0 0x0fe1289c <+36>: =C2=A0 =C2=A0bl =C2=A0 =C2=A0 =C2=A00xfe312=
44 <__floatsidf@plt>
>>>> =C2=A0 0x0fe128a0 <+40>: =C2=A0 =C2=A0lis =C2=A0 =C2=A0 r5,16880
>>>>
>>>>
>>>> [STABLE/2009] There are 2 libgcc_s.so.1 versions in TMPDIR/cross, th=
e=20
>>>> bigger ./ppc603e/powerpc-angstrom-linux/lib/nof/libgcc_s.so.1 matche=
s=20
>>>> the installed version,
>>>
>>> thats the problem
>>>
>>> if one copies the smaller version (uses fpu code) to target:/lib/
>>>>
>>>> the results of -shared-libgcc applications are OK.
>>>>
>>>> So, hard-fpu and soft-fpu are incompatible? =C2=A0The incorrect vers=
ion=20
>>>> matches (strip; cmp -l) several paths in TMPDIR/work:
>>>
>>> its more the calling convention.

...
>>> actually it should have packaged the fpu version into /lib on target=20
>>> but its a bug that it instead copied nof version.
>>>
>>> I think I touched this area and saw this problem in past. Can you try=
 gcc
>>> 4.4.4 and see if the problem still happens there.

The problem is the order / preference in which libs are copied into the=20
target dir.  If one ports the following commit to the stable/2009 branch=20
the correct version remains on the target and resulting image should work=
:

commit 3fb59642b2b9afb7b8cd9769b53e24d85dc2f348
Author: Richard Purdie <rpurdie@linux.intel.com>
Date:   Thu Dec 17 21:07:31 2009 +0000

     gcc-pacpake-cross.inc: Clean up do_install function massively (from =
Poky)

     Signed-off-by: Richard Purdie <rpurdie@linux.intel.com>

I need to clean TMPDIR, rebuild the image and test on the device.  Will=20
post a patch if the result is good.

Vitus

--=20
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


