Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MhJf3-0001kE-TC
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Aug 2009 10:51:50 +0200
Received: by qw-out-1920.google.com with SMTP id 4so628980qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 01:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=lJdi7hl6eW8G+Os6D3ZbLSYBYojRkDT4+G4JvrSR6oA=;
	b=e3xMIQ6x3YG68AOHh2bolaKz7qbm00KVg0Q6lc1/zLvutStGcVDI1tw+g0MfwDrFXG
	yD47z7V+pX2u4l7BF9UMg1fGnQzctRLpEY0M9ML79VnS+mRxFhLtlGKiG3ZvYk0e80Vd
	lgfs/4Ulphqp5rKlF9Poj+hu++5VgNQYkmU1A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xX9WkpbTkOiq1TNzluvegYHTPzFqCqI1Ej5uy30F8Y0ye0LUONG+HE8DdKD+D9zERO
	zSHcdX71HsHFsMTnse7dfNQ2zL6wv3JTe1O2rgN9b+8arWKaCn8l3CZmkGisPsRoEtR9
	IkPD+mSab7RDwVZ6wUzGOVnQQSFRU3eCO1HKM=
MIME-Version: 1.0
Received: by 10.229.18.140 with SMTP id w12mr1037923qca.77.1251534814245; Sat, 
	29 Aug 2009 01:33:34 -0700 (PDT)
In-Reply-To: <1251533696.4215.623.camel@lenovo.internal.reciva.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251533696.4215.623.camel@lenovo.internal.reciva.com>
Date: Sat, 29 Aug 2009 01:33:34 -0700
Message-ID: <19c1b8a90908290133l36f791b2lfe8db1a1c6f333b2@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS = linux-gnuspe for e500
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
X-List-Received-Date: Sat, 29 Aug 2009 08:51:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 29, 2009 at 1:14 AM, Phil Blundell<philb@gnu.org> wrote:
> On Fri, 2009-08-28 at 17:00 -0700, Khem Raj wrote:
>> Target triplet powerpc-*-linux-gnuspe is chosen for machines with SPE
>> which is e500 cores.
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0conf/distro/include/sane-toolchain-eglibc.inc | =C2=A0 =C2=A02 ++
>> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/conf/distro/include/sane-toolchain-eglibc.inc b/conf/distro=
/include/sane-toolchain-eglibc.inc
>> index 88719f5..6b66679 100644
>> --- a/conf/distro/include/sane-toolchain-eglibc.inc
>> +++ b/conf/distro/include/sane-toolchain-eglibc.inc
>> @@ -5,6 +5,8 @@
>>
>> =C2=A0TARGET_OS =3D "linux${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH=
',d,1) in ['arm', 'armeb'] and bb.data.getVar('MACHINE',d) not in ['collie'=
,'h3600', 'h3800', 'simpad', 'htcwallaby']]}"
>>
>> +TARGET_OS =3D "linux${@['','-gnuspe'][bb.data.getVar('TARGET_ARCH',d,1)=
 in ['ppc', 'powerpc'] and bb.data.getVar('MACHINE',d) in ['calamari', 'tqm=
8540']]}"
>> +
>
> This change looks like it will break the -gnueabi thing on ARM, which
> presumably isn't intended.

yes indeed see my previous reply
>
> Also, is this really specific to eglibc? =C2=A0Per our conversation on IR=
C
> the other day, I kind of feel that this sort of logic belongs somewhere
> else; it seems somewhat inappropriate for sane-toolchain-xx.inc to be
> frobbing fundamental variables like TARGET_OS in this way.

TARGET_OS is really equivalent of TARGET_TRIPLET here and it is tied
to system C library you choose.
so logically it seems ok to me. You can also define it in distro confs but =
then
you have to check like if LIBC =3D=3D uclibc do one thing  else LIBC =3D
glibc do other thing

Thx

-Khem

>

> p.
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


