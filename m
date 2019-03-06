Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2B9087C6B9
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 17:21:40 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id p25so13723294qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Mar 2019 09:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=10sEAvHfz2TxdNqD5ePU8c6wm03RQSceary+PqWhBY4=;
	b=hQ+8NdKUGqvdk45zGK7SpzI6/IhCaRH1QuwsKtEKEDE3z0h7pqsY0Mx3Wu0jxsZws8
	UU30aGWvC9Ina86KMGIX8XFzsPgu5o29TxycpHAs3cmt3C9FGH9JSxz505kWzYXO6dwH
	14xLi6/EZBFwHh3SZfn4VygPzcL7bPH04nDr8e5gyElK+ibIFBlFLF9mtwBr4GrXmMwS
	I0KUVxtHWCxurt6bTGbg8bju/1Lkp97mVjvOZV0fds+PYRcrpwhkMHmJgHuJZCiFeuUZ
	3a6RpVhq30MVFCa21Z5M2Bf6o9mU3FuuvI7KOKXlS4oziuaGA7pYeXjLT0fKO7DBPfds
	C5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=10sEAvHfz2TxdNqD5ePU8c6wm03RQSceary+PqWhBY4=;
	b=AdL1ttLSNRkIUCKd+QM9/QsRtHN/vFo7GSrvMU+AzDbqmjX1orexlDlDkd3Eo7MOgH
	rSV342T4yL1InRQSYDZQiEwNlHRjJX8kQFNrf0rXFxnVlqMd++aJi8iuKhaON7/yJm5h
	0WRjT1g5qPO4/7fKw/nw6kawxpz0TbOsbDmoFQIcGtmdIjK5NZdmV2kDeTedY9XrHwaF
	ingDgy9ykCUTVaAr7dZJOvs1LkeAVBNtNk/ic914RgqpPD6r4c8+lqbRR5+o5dFueg22
	QkBjZfpqI8skt6GAtuIx7g8fOFHIzG0dG1V1YSufMxMffGsGF9hj0VSWvliQBCorwyJP
	DP7g==
X-Gm-Message-State: APjAAAWulQpKFc9dHzKI49rrfADF3QkEQWAFhi+UiXZDWlfAbETIH64g
	QXLtwXW/l1KxCYVD+CSMUwZrf5HI67HpySowUOE=
X-Google-Smtp-Source: APXvYqwzY96ipru3Oq7TeHUdRWtvMu+UOTSOpD+pBxzSYVsEhmwv2RPC825zhaqaVZ3pIL/L6mbU2zRJ8OfOD2Q/aSg=
X-Received: by 2002:ac8:2562:: with SMTP id 31mr6708360qtn.253.1551892901618; 
	Wed, 06 Mar 2019 09:21:41 -0800 (PST)
MIME-Version: 1.0
References: <20190306033908.173027-1-kai.kang@windriver.com>
	<e887e9d9-62fb-20fb-f753-4567b197ba20@gmail.com>
	<7e344437-fa22-0312-c211-c250f9f5ff2f@windriver.com>
	<CAMKF1srqqd3vgpyF9+pVEaXqjMK3X5x3uj9gB-0_YFHe69mTsQ@mail.gmail.com>
	<420bfc59-242c-ce16-1e7e-cc3dedb49a03@windriver.com>
	<007BD92917A2324FA403BCF9A464CF84F3768FB8@ALA-MBD.corp.ad.wrs.com>
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84F3768FB8@ALA-MBD.corp.ad.wrs.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2019 09:21:15 -0800
Message-ID: <CAMKF1spq-9_i74p0OcfgGJfk7u_htw0vQD1H6PVKsqVBr86g0w@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Mar 2019 17:21:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2019 at 8:38 AM Slater, Joseph <joe.slater@windriver.com> wr=
ote:
>
> If we assume we do not really have "sync" for the failing case here, lib3=
2-leveldb, shouldn't we apply the no-sync patch with something like
>
> SRC_URI_pn-lib32-leveldb_mipsarcho32 +=3D "..."
>

my problem is that we have mips32r2 which is also mipsarcho32
and does have sync, I would rather suggest that you switch the
defaulttune for multilib to use mips32r2 since thats more or less
whats out there

> Joe
> ________________________________________
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Kang Kai [Kai.Kang@windrive=
r.com]
> Sent: Tuesday, March 05, 2019 9:44 PM
> To: Khem Raj
> Cc: openembeded-devel
> Subject: Re: [oe] [meta-oe][PATCH v2] leveldb: fix compile errors for mip=
s with DEFAULTTUNE mips
>
> On 2019/3/6 =E4=B8=8B=E5=8D=881:31, Khem Raj wrote:
> > On Tue, Mar 5, 2019 at 9:16 PM Kang Kai <Kai.Kang@windriver.com> wrote:
> >> On 2019/3/6 =E4=B8=8A=E5=8D=8811:49, Khem Raj wrote:
> >>>
> >>> On 3/5/19 7:39 PM, kai.kang@windriver.com wrote:
> >>>> From: Kai Kang <kai.kang@windriver.com>
> >>>>
> >>>> It fails to compile leveldb for qemumips with DEFAULTTUNE 'mips':
> >>>>
> >>>> | {standard input}: Assembler messages:
> >>>> | {standard input}:8004: Error: opcode not supported on this process=
or:
> >>>>     mips1 (mips1) `sync'
> >>>> | {standard input}:10296: Error: opcode not supported on this proces=
sor:
> >>>>     mips1 (mips1) `sync'
> >>>> | make: *** [out-shared/db/db_bench.o] Error 1
> >>>>
> >>>> Asm instruction 'sync' is called in platform-specific function
> >>>> MemoryBarrier() which is used by AtomicPointer(). Comment out the
> >>>> definition of MemoryBarrier() for mips to avoid the errors. And turn=
 to
> >>>> use AtomicPointer() based on C++11 <atomc>.
> >>>>
> >>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>>> ---
> >>>>    ...fine-function-MemoryBarrier-for-mips.patch | 43 ++++++++++++++=
+++++
> >>>>    meta-oe/recipes-dbs/leveldb/leveldb_git.bb    |  1 +
> >>>>    2 files changed, 44 insertions(+)
> >>>>    create mode 100644
> >>>> meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBar=
rier-for-mips.patch
> >>>>
> >>>> diff --git
> >>>> a/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryB=
arrier-for-mips.patch
> >>>> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryB=
arrier-for-mips.patch
> >>>>
> >>>> new file mode 100644
> >>>> index 000000000..fc7743030
> >>>> --- /dev/null
> >>>> +++
> >>>> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryB=
arrier-for-mips.patch
> >>>> @@ -0,0 +1,43 @@
> >>>> +It fails to compile leveldb for qemumips with default tune 'mips':
> >>>> +
> >>>> +| {standard input}: Assembler messages:
> >>>> +| {standard input}:8004: Error: opcode not supported on this proces=
sor:
> >>>> +  mips1 (mips1) `sync'
> >>>> +| {standard input}:10296: Error: opcode not supported on this
> >>>> processor:
> >>>> +  mips1 (mips1) `sync'
> >>>> +| make: *** [out-shared/db/db_bench.o] Error 1
> >>>> +
> >>>> +Asm instruction 'sync' is called in platform-specific function
> >>>> +MemoryBarrier() which is used by AtomicPointer(). Comment out the
> >>>> +definition of MemoryBarrier() for mips to avoid the errors. And tur=
n to
> >>>> +use AtomicPointer() based on C++11 <atomic>.
> >>>> +
> >>>> +Upstream-Status: Inappropriate [oe specific]
> >>>> +
> >>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >>>> +
> >>>> +---
> >>>> + port/atomic_pointer.h | 10 +++++-----
> >>>> + 1 file changed, 5 insertions(+), 5 deletions(-)
> >>>> +
> >>>> +diff --git a/port/atomic_pointer.h b/port/atomic_pointer.h
> >>>> +index 1c4c7aa..7025ac3 100644
> >>>> +--- a/port/atomic_pointer.h
> >>>> ++++ b/port/atomic_pointer.h
> >>>> +@@ -113,11 +113,11 @@ inline void MemoryBarrier() {
> >>>> + #define LEVELDB_HAVE_MEMORY_BARRIER
> >>>> +
> >>>> + // MIPS
> >>>> +-#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
> >>>> +-inline void MemoryBarrier() {
> >>>> +-  __asm__ __volatile__("sync" : : : "memory");
> >>>> +-}
> >>>> +-#define LEVELDB_HAVE_MEMORY_BARRIER
> >>>> ++//#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
> >>>> ++//inline void MemoryBarrier() {
> >>>> ++//  __asm__ __volatile__("sync" : : : "memory");
> >>>> ++//}
> >>>> ++//#define LEVELDB_HAVE_MEMORY_BARRIER
> >>>> +
> >>> this is punishing all mips o32 variants.
> >> How about only apply the patch when DEFAULTTUNE is 'mips', such as
> >> something looks like:
> >>
> >> python ()  {
> >>
> >>       if d.getVar('DEFAULTTUNE') =3D=3D 'mips':
> >>
> >>           d.appendVar('SRC_URI', '
> >> file://do-not-define-function-MemoryBarrier-for-mips.patch')
> >>
> >> }
> >
> > None of these are as good as first patch. Ideally you should change
> > the defaulttune
>
>
> But defaulttune could be overridden by user configure. Even could
> configure qemumips64 with defaulttune 'mips'.
> I'll try to fix it from oe side based on first patch.
>
> Kai
>
>
> >
>
> --
> Kai Kang
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

