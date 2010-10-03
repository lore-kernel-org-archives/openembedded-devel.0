Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P2CUM-0005YS-Sq
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Oct 2010 02:31:40 +0200
Received: by iwn2 with SMTP id 2so5386476iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Oct 2010 17:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=OANVsj5Dx8KDAhW5OmmAKfyWfZEAF882uHNV/uFICBM=;
	b=JILt3rrynUXxzpAregOaYojgfKxPb2gexBD/lWqCACcK2BgjKLqBkCQ4gXsstdmRKP
	2S0/kRv1Kkf9mC1KFwBIw14K242H7z+VfObxWsja+87o4IqrYm+WYRKuo/20Ucn+meSD
	TaRigbSB4HJfHdBElFET0zz0Y7ibF2n032nj0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=embiQgbSF5oWn8afHSyE3WmUSTT7txZU1QIItD2r9EmNwtou6hRF1z/ZgfJQlWTOY4
	4SoA+Q5KFEfKG0C4Z8On62GC+uvSMeKCCf3fsz2an6lEsS9WgXQilSZvgXOgXuGoNg/F
	r9qcIpnNfmNrRQibXgVklwZSK5tjcF/pLdUYM=
Received: by 10.231.10.139 with SMTP id p11mr7868520ibp.179.1286065883025;
	Sat, 02 Oct 2010 17:31:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Sat, 2 Oct 2010 17:31:02 -0700 (PDT)
In-Reply-To: <1285836574.3805.42.camel@mattotaupa>
References: <1285792594-10032-1-git-send-email-obi@opendreambox.org>
	<1285792594-10032-7-git-send-email-obi@opendreambox.org>
	<1285836574.3805.42.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 2 Oct 2010 17:31:02 -0700
Message-ID: <AANLkTin6=N4BaKiYkRVmwT4gKjGkr2JoPpMON5maVZKm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 06/18] netkit-base-0.17: fix compile with gcc-4.x
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
X-List-Received-Date: Sun, 03 Oct 2010 00:31:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 30, 2010 at 1:49 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Am Mittwoch, den 29.09.2010, 20:36 +0000 schrieb Andreas Oberritter:
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>> =C2=A0.../netkit-base-0.17/gcc4_buildfix.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 11 +++++++++++
>> =C2=A0recipes/netkit-base/netkit-base_0.17.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A03 ++-
>> =C2=A02 files changed, 13 insertions(+), 1 deletions(-)
>> =C2=A0create mode 100644 recipes/netkit-base/netkit-base-0.17/gcc4_build=
fix.patch
>>
>> diff --git a/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch b/=
recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch
>> new file mode 100644
>> index 0000000..f284f1a
>
> As written in my answer to your introductory message [1], it would be
> nice to add a patch header [2].
>
>> --- /dev/null
>> +++ b/recipes/netkit-base/netkit-base-0.17/gcc4_buildfix.patch
>> @@ -0,0 +1,11 @@
>> +--- bla/inetd/servtab.c =C2=A0 =C2=A0 =C2=A02000-07-22 22:20:50.0000000=
00 +0200
>> ++++ bla/inetd/servtab.c =C2=A0 =C2=A0 =C2=A02006-03-01 15:26:46.0000000=
00 +0100
>> +@@ -771,7 +771,7 @@
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
return;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> +-#define SWAP(type, a, b) {type c=3D(type)a; (type)a=3D(type)b; (type)b=
=3D(type)c;}
>> ++#define SWAP(type, a, b) {type c=3D(type)a; a=3D(type)b; b=3D(type)c;}
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sep->se_wait may be =
holding the pid of a daemon
>> diff --git a/recipes/netkit-base/netkit-base_0.17.bb b/recipes/netkit-ba=
se/netkit-base_0.17.bb
>> index c9864ae..4e70164 100644
>> --- a/recipes/netkit-base/netkit-base_0.17.bb
>> +++ b/recipes/netkit-base/netkit-base_0.17.bb
>> @@ -1,11 +1,12 @@
>> =C2=A0SECTION =3D "base"
>> =C2=A0DESCRIPTION =3D "netkit-base includes the inetd daemon."
>> =C2=A0LICENSE =3D "BSD"
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =C2=A0SRC_URI =3D "ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/ne=
tkit-base-${PV}.tar.gz \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://configure.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://mconfig.patch \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gcc4_buildfix.patch \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://inetd.conf"
>
> I build tested your patch for `MACHINE =3D "beagleboard"` for the
> distributions `minimal-{libc,eglibc,uclibc}` and it worked. It compiled
> for `angstrom-2008.1` but failed with a quality assurance warning which
> probably has been there before and is for a separate patch.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ more /oe/build/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/netkit-base-0.17-r2/temp/log.package_do_package.4223
> =C2=A0 =C2=A0 ERROR: QA Issue with netkit-base: No GNU_HASH in the elf bi=
nary: '/oe/build/angstrom-dev/work/armv7a-angstrom-linux-gnueabi/netkit-bas=
e-0.17-r2/packages-split/netkit-base/usr/sbin/inetd'
> =C2=A0 =C2=A0 FATAL: QA run found fatal errors. Please consider fixing th=
em.
> =C2=A0 =C2=A0 ERROR: Error in executing python function in: /oe/openembed=
ded/recipes/netkit-base/netkit-base_0.17.bb
> =C2=A0 =C2=A0 ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
> =C2=A0 =C2=A0 ERROR: Printing the environment of the function
> =C2=A0 =C2=A0 ERROR: Function do_package_qa failed
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$ more /oe/build/angstrom-dev/work/armv7a-angs=
trom-linux-gnueabi/netkit-base-0.17-r2/temp/log.qa_package
> =C2=A0 =C2=A0 LDFLAGS ignored, netkit-base, /work/armv7a-angstrom-linux-g=
nueabi/netkit-base-0.17-r2/packages-split/netkit-base/usr/sbin/inetd
>


Could you also fix this error ?
add TARGET_CC_ARCH +=3D "${LDFLAGS}"
in recipe that probably should be enough

-khem


