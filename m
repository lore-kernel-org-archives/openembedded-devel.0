Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 570F47CE53
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 04:57:12 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w4so15716383qtc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2019 20:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kv01bxMehPAspegl4oTaG9GJMHUWw0Qy+QnAcZHBfsA=;
	b=r6TkLw7pjdtMD4rMsGHoUONNzWw+XORH/G/qsla0UuNm+db02A55KXLwHnfkFT1M4U
	fQc8HeMmQ41z6EKdvPKzrB8tgkbMh32Trm7K/10m8ZIz862ec7n9hml9vD7R7BcLHXjW
	WtYi88/g7A+CZhmYYVnlwbFEMWIDI/kPTciI2GLvONTcpVJfGesPUaKnvaLe5GTG8amc
	Xq0psbQ9gdqeU4thl4fPf89G4ucu9SsPPswoANVetbgUkvfzZwYoDKnodhor8KZSF9sF
	9dtYFK51vwy5bOt+MAVD+7nbxt/upTwvsvqWIF+YPmNTdaOfEZ/xNwFQMxe3JdSTajjj
	nDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kv01bxMehPAspegl4oTaG9GJMHUWw0Qy+QnAcZHBfsA=;
	b=d1XSHzTHprmTc4AhGDQ3rZJ2kQCkzAvXgcdtC5oiiPIlOBzB/9sNyFUcuKhUybipPX
	7akX4bPvSq1eyPCDeiXKu8ZXU0KuFAf+SGn8mX0diwU0GBl8aJehACv0aJEZWqQklbSJ
	zih1EdUqMPmvv3OXWWiICxmiyBVk3LJgGQE2JS1iAO2ju9qmQMhM1+jdn5d8DROqR6NQ
	w41bZAgUIOrbC2II/vU3zNVHSxDQB1ZsVVQsZMwsNiS9Uf5RxUybpSDm2me8z2PRrglC
	u5A58PIoeQTD34RNHqv0d1bq6TMN11tdClZ+0zB9mpjeLNwZ24FyFsBjba0ZiBzoT9gZ
	Fh9Q==
X-Gm-Message-State: APjAAAU0nyfJBiVccWIK49u4m8GJw5n7oBccIRG5QnqNtxFvBqXOuniU
	c0kSoy1/ybF3QBulFU4Vvx2wSd3kbFwOevunVtE=
X-Google-Smtp-Source: APXvYqyM4yp6YJ65DU1jfqYoyicHjiZeMTaybHPrSF8eh0IBltZ5MsVLZoux85GTAFaV3+7pR6+vnkbBOXG/pRrdOMI=
X-Received: by 2002:aed:2268:: with SMTP id o37mr8797272qtc.29.1551934632733; 
	Wed, 06 Mar 2019 20:57:12 -0800 (PST)
MIME-Version: 1.0
References: <20190306033908.173027-1-kai.kang@windriver.com>
	<e887e9d9-62fb-20fb-f753-4567b197ba20@gmail.com>
	<7e344437-fa22-0312-c211-c250f9f5ff2f@windriver.com>
	<CAMKF1srqqd3vgpyF9+pVEaXqjMK3X5x3uj9gB-0_YFHe69mTsQ@mail.gmail.com>
	<420bfc59-242c-ce16-1e7e-cc3dedb49a03@windriver.com>
	<007BD92917A2324FA403BCF9A464CF84F3768FB8@ALA-MBD.corp.ad.wrs.com>
	<CAMKF1spq-9_i74p0OcfgGJfk7u_htw0vQD1H6PVKsqVBr86g0w@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84F376A722@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F376A722@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2019 20:56:46 -0800
Message-ID: <CAMKF1sqwHeFf1MyNGx8CgSWkWgutWSPjVqRZN9yKVvA3nWhgJA@mail.gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] leveldb: fix compile errors for mips with DEFAULTTUNE mips
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Mar 2019 04:57:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2019 at 6:29 PM Slater, Joseph <joe.slater@windriver.com> wr=
ote:
>
> The particular failure we see might be a Wind River thing.  For our distr=
o's we set the DEFAULTTUNE's in an include file under layers/wrlinux/wrlinu=
x-distro and the multilib bbclass forces it to that.  It should probably be=
 mips32r2 instead of mips32.

right, thats what I am suggesting, it might be better for your to switch
to mips32r2 internally.
>
> Joe
> ________________________________________
> From: Khem Raj [raj.khem@gmail.com]
> Sent: Wednesday, March 06, 2019 9:21 AM
> To: Slater, Joseph
> Cc: Kang, Kai; openembeded-devel
> Subject: Re: [oe] [meta-oe][PATCH v2] leveldb: fix compile errors for mip=
s with DEFAULTTUNE mips
>
> On Wed, Mar 6, 2019 at 8:38 AM Slater, Joseph <joe.slater@windriver.com> =
wrote:
> >
> > If we assume we do not really have "sync" for the failing case here, li=
b32-leveldb, shouldn't we apply the no-sync patch with something like
> >
> > SRC_URI_pn-lib32-leveldb_mipsarcho32 +=3D "..."
> >
>
> my problem is that we have mips32r2 which is also mipsarcho32
> and does have sync, I would rather suggest that you switch the
> defaulttune for multilib to use mips32r2 since thats more or less
> whats out there
>
> > Joe
> > ________________________________________
> > From: openembedded-devel-bounces@lists.openembedded.org [openembedded-d=
evel-bounces@lists.openembedded.org] on behalf of Kang Kai [Kai.Kang@windri=
ver.com]
> > Sent: Tuesday, March 05, 2019 9:44 PM
> > To: Khem Raj
> > Cc: openembeded-devel
> > Subject: Re: [oe] [meta-oe][PATCH v2] leveldb: fix compile errors for m=
ips with DEFAULTTUNE mips
> >
> > On 2019/3/6 =E4=B8=8B=E5=8D=881:31, Khem Raj wrote:
> > > On Tue, Mar 5, 2019 at 9:16 PM Kang Kai <Kai.Kang@windriver.com> wrot=
e:
> > >> On 2019/3/6 =E4=B8=8A=E5=8D=8811:49, Khem Raj wrote:
> > >>>
> > >>> On 3/5/19 7:39 PM, kai.kang@windriver.com wrote:
> > >>>> From: Kai Kang <kai.kang@windriver.com>
> > >>>>
> > >>>> It fails to compile leveldb for qemumips with DEFAULTTUNE 'mips':
> > >>>>
> > >>>> | {standard input}: Assembler messages:
> > >>>> | {standard input}:8004: Error: opcode not supported on this proce=
ssor:
> > >>>>     mips1 (mips1) `sync'
> > >>>> | {standard input}:10296: Error: opcode not supported on this proc=
essor:
> > >>>>     mips1 (mips1) `sync'
> > >>>> | make: *** [out-shared/db/db_bench.o] Error 1
> > >>>>
> > >>>> Asm instruction 'sync' is called in platform-specific function
> > >>>> MemoryBarrier() which is used by AtomicPointer(). Comment out the
> > >>>> definition of MemoryBarrier() for mips to avoid the errors. And tu=
rn to
> > >>>> use AtomicPointer() based on C++11 <atomc>.
> > >>>>
> > >>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > >>>> ---
> > >>>>    ...fine-function-MemoryBarrier-for-mips.patch | 43 ++++++++++++=
+++++++
> > >>>>    meta-oe/recipes-dbs/leveldb/leveldb_git.bb    |  1 +
> > >>>>    2 files changed, 44 insertions(+)
> > >>>>    create mode 100644
> > >>>> meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryB=
arrier-for-mips.patch
> > >>>>
> > >>>> diff --git
> > >>>> a/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-Memor=
yBarrier-for-mips.patch
> > >>>> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-Memor=
yBarrier-for-mips.patch
> > >>>>
> > >>>> new file mode 100644
> > >>>> index 000000000..fc7743030
> > >>>> --- /dev/null
> > >>>> +++
> > >>>> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-Memor=
yBarrier-for-mips.patch
> > >>>> @@ -0,0 +1,43 @@
> > >>>> +It fails to compile leveldb for qemumips with default tune 'mips'=
:
> > >>>> +
> > >>>> +| {standard input}: Assembler messages:
> > >>>> +| {standard input}:8004: Error: opcode not supported on this proc=
essor:
> > >>>> +  mips1 (mips1) `sync'
> > >>>> +| {standard input}:10296: Error: opcode not supported on this
> > >>>> processor:
> > >>>> +  mips1 (mips1) `sync'
> > >>>> +| make: *** [out-shared/db/db_bench.o] Error 1
> > >>>> +
> > >>>> +Asm instruction 'sync' is called in platform-specific function
> > >>>> +MemoryBarrier() which is used by AtomicPointer(). Comment out the
> > >>>> +definition of MemoryBarrier() for mips to avoid the errors. And t=
urn to
> > >>>> +use AtomicPointer() based on C++11 <atomic>.
> > >>>> +
> > >>>> +Upstream-Status: Inappropriate [oe specific]
> > >>>> +
> > >>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > >>>> +
> > >>>> +---
> > >>>> + port/atomic_pointer.h | 10 +++++-----
> > >>>> + 1 file changed, 5 insertions(+), 5 deletions(-)
> > >>>> +
> > >>>> +diff --git a/port/atomic_pointer.h b/port/atomic_pointer.h
> > >>>> +index 1c4c7aa..7025ac3 100644
> > >>>> +--- a/port/atomic_pointer.h
> > >>>> ++++ b/port/atomic_pointer.h
> > >>>> +@@ -113,11 +113,11 @@ inline void MemoryBarrier() {
> > >>>> + #define LEVELDB_HAVE_MEMORY_BARRIER
> > >>>> +
> > >>>> + // MIPS
> > >>>> +-#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
> > >>>> +-inline void MemoryBarrier() {
> > >>>> +-  __asm__ __volatile__("sync" : : : "memory");
> > >>>> +-}
> > >>>> +-#define LEVELDB_HAVE_MEMORY_BARRIER
> > >>>> ++//#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
> > >>>> ++//inline void MemoryBarrier() {
> > >>>> ++//  __asm__ __volatile__("sync" : : : "memory");
> > >>>> ++//}
> > >>>> ++//#define LEVELDB_HAVE_MEMORY_BARRIER
> > >>>> +
> > >>> this is punishing all mips o32 variants.
> > >> How about only apply the patch when DEFAULTTUNE is 'mips', such as
> > >> something looks like:
> > >>
> > >> python ()  {
> > >>
> > >>       if d.getVar('DEFAULTTUNE') =3D=3D 'mips':
> > >>
> > >>           d.appendVar('SRC_URI', '
> > >> file://do-not-define-function-MemoryBarrier-for-mips.patch')
> > >>
> > >> }
> > >
> > > None of these are as good as first patch. Ideally you should change
> > > the defaulttune
> >
> >
> > But defaulttune could be overridden by user configure. Even could
> > configure qemumips64 with defaulttune 'mips'.
> > I'll try to fix it from oe side based on first patch.
> >
> > Kai
> >
> >
> > >
> >
> > --
> > Kai Kang
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

