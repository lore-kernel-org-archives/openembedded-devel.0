Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PUkeN-0000xg-Ow
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Dec 2010 19:39:59 +0100
Received: by gwj22 with SMTP id 22so1763984gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 10:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=bqHEQ9+dnl9yV2bJe707Aq/KtT8NKdoFmN7GJ0ycjeI=;
	b=qnTsmczJD9Sbu28RFpvrfVJ4ZVHWfUYVCSuZNHGraSJe8oPM4NrJBo/KMo1ulnXonF
	xpQbtL8KUZjxE9LhIvgTTrDRhFWKRNAewaMJAqqj2V1UMT3qcC5QIkAesCl6AEOlBw81
	k9Lo91zn4qlPMKEaWOg0defC2mhQgfvS3b6zA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=gGiHV/D4lmzhRObg43uNh0pDScctP4fRE1bA5MV/YpyaJpYhkoe+QqW2BHXzLhrdpw
	DLSLmJplfUfKdAvy9UInoDsHlhewwJTI913/NEUCD4C+Ytoif/pEAugr1ntN1TelqGfq
	H2pNRFOxxSUr4JCbw+ptux3Fqv6QhdfHKfICM=
Received: by 10.91.163.27 with SMTP id q27mr5855523ago.139.1292870392769; Mon,
	20 Dec 2010 10:39:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Mon, 20 Dec 2010 10:39:32 -0800 (PST)
In-Reply-To: <1292859750.1713.3.camel@mattotaupa>
References: <1292667009.12094.13.camel@mattotaupa>
	<4D0C8BCC.9050800@eukrea.com>
	<AANLkTik2cV=NMv1=Xj1gd6pBaL-kVVo7=tUH9gmqTxCE@mail.gmail.com>
	<1292859750.1713.3.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Dec 2010 10:39:32 -0800
Message-ID: <AANLkTinTz=s4K7zbkFKh22HJWRjMDDW0iP5CKxV0HrOX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: minimal{, -uclibc}: linux-omap-psp_2.6.32: task `do_compileconfigs` fails
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
X-List-Received-Date: Mon, 20 Dec 2010 18:40:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2010 at 7:42 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Samstag, den 18.12.2010, 22:46 -0800 schrieb Khem Raj:
>> On Sat, Dec 18, 2010 at 2:24 AM, Eric B=C3=A9nard <eric@eukrea.com> wrot=
e:
>
>> > On 18/12/2010 11:10, Paul Menzel wrote:
>> >>
>> >> Error: selected processor does not support ARM mode `smc #0'
>> >
>> > this seems to be a known problem with gcc 4.5 :
>> > https://bugs.launchpad.net/ubuntu/+source/gcc-4.5/+bug/669912
>>
>> Its not a gcc problem to clarify. Its just that older compilers did
>> not differentiate security extentions presence.
>> http://kernel.ubuntu.com/git?p=3Dubuntu/ubuntu-natty.git;a=3Dcommitdiff;=
h=3D1ebe13dea156358f1044a7a755f02945ad3890e4;hp=3Df31ff7673ef77d04e74e1a1e4=
5bb2940781f35f0
>>
>> http://kernel.ubuntu.com/git?p=3Dubuntu/ubuntu-natty.git;a=3Dcommitdiff;=
h=3D99340d7b23f3df75d9b752fb25088a10064cd0a6;hp=3D9523bd6810e0229a8147e8c3d=
6498e2f40b38974
>>
>> are the fixes you should apply to kernel.
>
> I just wanted to add that `linux-omap-psp_2.6.32` builds fine with
> `angstrom-2010.x` (without the above mentioned patches) which uses the
> following toolchain.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0conf/distro/angstrom-2010.x.conf:ANGSTROM_GCC_=
VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ?=3D "4.5"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0conf/distro/angstrom-2010.x.conf:ANGSTROM_BINU=
TILS_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D "2=
.20.1"

yes it will work with binutils < 2.21 the patch I previously implied
is in assembler.


