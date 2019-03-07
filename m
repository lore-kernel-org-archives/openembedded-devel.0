Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56A277CE53
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 02:29:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x272Slv5022969
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Mar 2019 18:29:07 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.68]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0439.000;
	Wed, 6 Mar 2019 18:28:40 -0800
From: "Slater, Joseph" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v2] leveldb: fix compile errors for mips
	with DEFAULTTUNE mips
Thread-Index: AQHU08+s45Yb99h75k2GuZpcOgZpKKX+lbCAgAAEeICAAAOcAIAALsPggACT94CAABHHcg==
Date: Thu, 7 Mar 2019 02:28:39 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F376A722@ALA-MBD.corp.ad.wrs.com>
References: <20190306033908.173027-1-kai.kang@windriver.com>
	<e887e9d9-62fb-20fb-f753-4567b197ba20@gmail.com>
	<7e344437-fa22-0312-c211-c250f9f5ff2f@windriver.com>
	<CAMKF1srqqd3vgpyF9+pVEaXqjMK3X5x3uj9gB-0_YFHe69mTsQ@mail.gmail.com>
	<420bfc59-242c-ce16-1e7e-cc3dedb49a03@windriver.com>
	<007BD92917A2324FA403BCF9A464CF84F3768FB8@ALA-MBD.corp.ad.wrs.com>,
	<CAMKF1spq-9_i74p0OcfgGJfk7u_htw0vQD1H6PVKsqVBr86g0w@mail.gmail.com>
In-Reply-To: <CAMKF1spq-9_i74p0OcfgGJfk7u_htw0vQD1H6PVKsqVBr86g0w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.119.76]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 07 Mar 2019 02:29:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

The particular failure we see might be a Wind River thing.  For our distro'=
s we set the DEFAULTTUNE's in an include file under layers/wrlinux/wrlinux-=
distro and the multilib bbclass forces it to that.  It should probably be m=
ips32r2 instead of mips32.=0A=
=0A=
Joe=0A=
________________________________________=0A=
From: Khem Raj [raj.khem@gmail.com]=0A=
Sent: Wednesday, March 06, 2019 9:21 AM=0A=
To: Slater, Joseph=0A=
Cc: Kang, Kai; openembeded-devel=0A=
Subject: Re: [oe] [meta-oe][PATCH v2] leveldb: fix compile errors for mips =
with DEFAULTTUNE mips=0A=
=0A=
On Wed, Mar 6, 2019 at 8:38 AM Slater, Joseph <joe.slater@windriver.com> wr=
ote:=0A=
>=0A=
> If we assume we do not really have "sync" for the failing case here, lib3=
2-leveldb, shouldn't we apply the no-sync patch with something like=0A=
>=0A=
> SRC_URI_pn-lib32-leveldb_mipsarcho32 +=3D "..."=0A=
>=0A=
=0A=
my problem is that we have mips32r2 which is also mipsarcho32=0A=
and does have sync, I would rather suggest that you switch the=0A=
defaulttune for multilib to use mips32r2 since thats more or less=0A=
whats out there=0A=
=0A=
> Joe=0A=
> ________________________________________=0A=
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Kang Kai [Kai.Kang@windrive=
r.com]=0A=
> Sent: Tuesday, March 05, 2019 9:44 PM=0A=
> To: Khem Raj=0A=
> Cc: openembeded-devel=0A=
> Subject: Re: [oe] [meta-oe][PATCH v2] leveldb: fix compile errors for mip=
s with DEFAULTTUNE mips=0A=
>=0A=
> On 2019/3/6 =1B$B2<8a=1B(B1:31, Khem Raj wrote:=0A=
> > On Tue, Mar 5, 2019 at 9:16 PM Kang Kai <Kai.Kang@windriver.com> wrote:=
=0A=
> >> On 2019/3/6 =1B$B>e8a=1B(B11:49, Khem Raj wrote:=0A=
> >>>=0A=
> >>> On 3/5/19 7:39 PM, kai.kang@windriver.com wrote:=0A=
> >>>> From: Kai Kang <kai.kang@windriver.com>=0A=
> >>>>=0A=
> >>>> It fails to compile leveldb for qemumips with DEFAULTTUNE 'mips':=0A=
> >>>>=0A=
> >>>> | {standard input}: Assembler messages:=0A=
> >>>> | {standard input}:8004: Error: opcode not supported on this process=
or:=0A=
> >>>>     mips1 (mips1) `sync'=0A=
> >>>> | {standard input}:10296: Error: opcode not supported on this proces=
sor:=0A=
> >>>>     mips1 (mips1) `sync'=0A=
> >>>> | make: *** [out-shared/db/db_bench.o] Error 1=0A=
> >>>>=0A=
> >>>> Asm instruction 'sync' is called in platform-specific function=0A=
> >>>> MemoryBarrier() which is used by AtomicPointer(). Comment out the=0A=
> >>>> definition of MemoryBarrier() for mips to avoid the errors. And turn=
 to=0A=
> >>>> use AtomicPointer() based on C++11 <atomc>.=0A=
> >>>>=0A=
> >>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>=0A=
> >>>> ---=0A=
> >>>>    ...fine-function-MemoryBarrier-for-mips.patch | 43 ++++++++++++++=
+++++=0A=
> >>>>    meta-oe/recipes-dbs/leveldb/leveldb_git.bb    |  1 +=0A=
> >>>>    2 files changed, 44 insertions(+)=0A=
> >>>>    create mode 100644=0A=
> >>>> meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBar=
rier-for-mips.patch=0A=
> >>>>=0A=
> >>>> diff --git=0A=
> >>>> a/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryB=
arrier-for-mips.patch=0A=
> >>>> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryB=
arrier-for-mips.patch=0A=
> >>>>=0A=
> >>>> new file mode 100644=0A=
> >>>> index 000000000..fc7743030=0A=
> >>>> --- /dev/null=0A=
> >>>> +++=0A=
> >>>> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryB=
arrier-for-mips.patch=0A=
> >>>> @@ -0,0 +1,43 @@=0A=
> >>>> +It fails to compile leveldb for qemumips with default tune 'mips':=
=0A=
> >>>> +=0A=
> >>>> +| {standard input}: Assembler messages:=0A=
> >>>> +| {standard input}:8004: Error: opcode not supported on this proces=
sor:=0A=
> >>>> +  mips1 (mips1) `sync'=0A=
> >>>> +| {standard input}:10296: Error: opcode not supported on this=0A=
> >>>> processor:=0A=
> >>>> +  mips1 (mips1) `sync'=0A=
> >>>> +| make: *** [out-shared/db/db_bench.o] Error 1=0A=
> >>>> +=0A=
> >>>> +Asm instruction 'sync' is called in platform-specific function=0A=
> >>>> +MemoryBarrier() which is used by AtomicPointer(). Comment out the=
=0A=
> >>>> +definition of MemoryBarrier() for mips to avoid the errors. And tur=
n to=0A=
> >>>> +use AtomicPointer() based on C++11 <atomic>.=0A=
> >>>> +=0A=
> >>>> +Upstream-Status: Inappropriate [oe specific]=0A=
> >>>> +=0A=
> >>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>=0A=
> >>>> +=0A=
> >>>> +---=0A=
> >>>> + port/atomic_pointer.h | 10 +++++-----=0A=
> >>>> + 1 file changed, 5 insertions(+), 5 deletions(-)=0A=
> >>>> +=0A=
> >>>> +diff --git a/port/atomic_pointer.h b/port/atomic_pointer.h=0A=
> >>>> +index 1c4c7aa..7025ac3 100644=0A=
> >>>> +--- a/port/atomic_pointer.h=0A=
> >>>> ++++ b/port/atomic_pointer.h=0A=
> >>>> +@@ -113,11 +113,11 @@ inline void MemoryBarrier() {=0A=
> >>>> + #define LEVELDB_HAVE_MEMORY_BARRIER=0A=
> >>>> +=0A=
> >>>> + // MIPS=0A=
> >>>> +-#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)=0A=
> >>>> +-inline void MemoryBarrier() {=0A=
> >>>> +-  __asm__ __volatile__("sync" : : : "memory");=0A=
> >>>> +-}=0A=
> >>>> +-#define LEVELDB_HAVE_MEMORY_BARRIER=0A=
> >>>> ++//#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)=0A=
> >>>> ++//inline void MemoryBarrier() {=0A=
> >>>> ++//  __asm__ __volatile__("sync" : : : "memory");=0A=
> >>>> ++//}=0A=
> >>>> ++//#define LEVELDB_HAVE_MEMORY_BARRIER=0A=
> >>>> +=0A=
> >>> this is punishing all mips o32 variants.=0A=
> >> How about only apply the patch when DEFAULTTUNE is 'mips', such as=0A=
> >> something looks like:=0A=
> >>=0A=
> >> python ()  {=0A=
> >>=0A=
> >>       if d.getVar('DEFAULTTUNE') =3D=3D 'mips':=0A=
> >>=0A=
> >>           d.appendVar('SRC_URI', '=0A=
> >> file://do-not-define-function-MemoryBarrier-for-mips.patch')=0A=
> >>=0A=
> >> }=0A=
> >=0A=
> > None of these are as good as first patch. Ideally you should change=0A=
> > the defaulttune=0A=
>=0A=
>=0A=
> But defaulttune could be overridden by user configure. Even could=0A=
> configure qemumips64 with defaulttune 'mips'.=0A=
> I'll try to fix it from oe side based on first patch.=0A=
>=0A=
> Kai=0A=
>=0A=
>=0A=
> >=0A=
>=0A=
> --=0A=
> Kai Kang=0A=
>=0A=
> --=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

