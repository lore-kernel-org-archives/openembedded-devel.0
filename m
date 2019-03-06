Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id F03A36069C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Mar 2019 05:31:48 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id p48so11584408qtk.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Mar 2019 21:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=wP6zLiyErZEhjUppcdR7xad/NKlwjzO6QS2dtEW05Ic=;
	b=KUGoNFRmdfyQ0ZZvpYZJQLOp6QAKSdsrE5CgDQpLCwmsFyJWHRiVVw4rS13eekClkI
	QHt2iH+nzHVa5W6dFK18sZpSDEbpOA7RwWBHXnuAFtnmkpxLDg+bikW2GceHXVapCMuq
	L2dTQDmG2icAXL/PWXq9w7dgBrlrxTz9ErCRVhnIpjWEtpFQfu/Mm5ueeP+dDUHINUFh
	clDEyBCPnQ/RnGriCIyYa+odlOb6Q5mRHTYuP01AwCDpi6+J1N70sQymvmdShqlOZUZx
	LGQEGOmvRE45DTr5njyzwKAZ3HBWRhVcOxNKvCM3FPOdfI3umwds+3zoHmAfChJ6PXWx
	GSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=wP6zLiyErZEhjUppcdR7xad/NKlwjzO6QS2dtEW05Ic=;
	b=TRjfWEU+E2Omj2JhgBwiH6zRWhN7fnsNmVLYp2w5soOp7+C5Kq1BtAxEWFhc6nDKyv
	E5cGBrgAXZCwy9hsBWyO+xGO/JHZQZiyF0iokOes19WCiVobkR3dFd7EWzoF9jgqZUMI
	lhtw+T/wbygBZxaaeuy4N4lFq4iMwpHmBmeFotz1XRFnxMIgbWiwmmIK6ocfgtix5UZo
	ngCrZQedOMXrbIiOBAZwkCna5b3Tuo2h6cQ19mCA1ER7OjcvdrWq7qyMqUUpJo8sJLEX
	0GVhOAVxu5jsoi1QwGU/CP/gYfi0U+mpsO9mJW8Ff3DRlQN4rWBX8nhs1LMiwjlIjuxs
	gk4g==
X-Gm-Message-State: APjAAAXehgYpQHHf5VndIdq/AaT6fIDNFwxgZ3HMnW5/4EZUx0sv510H
	i+RqmuAwQ2xnKuR94pBqobRLUIIrOpg4taW0fYNw1w==
X-Google-Smtp-Source: APXvYqyIHlqVOLkSVX1X3ur+CZOJV56ccBoVlGuBClCT7S2pzLB7rnmtFBi9+VL2NTwnZ+9Q0eVvA1w8UJi3hrS7vvI=
X-Received: by 2002:aed:2268:: with SMTP id o37mr4366382qtc.29.1551850309634; 
	Tue, 05 Mar 2019 21:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20190306033908.173027-1-kai.kang@windriver.com>
	<e887e9d9-62fb-20fb-f753-4567b197ba20@gmail.com>
	<7e344437-fa22-0312-c211-c250f9f5ff2f@windriver.com>
In-Reply-To: <7e344437-fa22-0312-c211-c250f9f5ff2f@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2019 21:31:23 -0800
Message-ID: <CAMKF1srqqd3vgpyF9+pVEaXqjMK3X5x3uj9gB-0_YFHe69mTsQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
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
X-List-Received-Date: Wed, 06 Mar 2019 05:31:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2019 at 9:16 PM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/3/6 =E4=B8=8A=E5=8D=8811:49, Khem Raj wrote:
> >
> >
> > On 3/5/19 7:39 PM, kai.kang@windriver.com wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> It fails to compile leveldb for qemumips with DEFAULTTUNE 'mips':
> >>
> >> | {standard input}: Assembler messages:
> >> | {standard input}:8004: Error: opcode not supported on this processor=
:
> >>    mips1 (mips1) `sync'
> >> | {standard input}:10296: Error: opcode not supported on this processo=
r:
> >>    mips1 (mips1) `sync'
> >> | make: *** [out-shared/db/db_bench.o] Error 1
> >>
> >> Asm instruction 'sync' is called in platform-specific function
> >> MemoryBarrier() which is used by AtomicPointer(). Comment out the
> >> definition of MemoryBarrier() for mips to avoid the errors. And turn t=
o
> >> use AtomicPointer() based on C++11 <atomc>.
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   ...fine-function-MemoryBarrier-for-mips.patch | 43 +++++++++++++++++=
++
> >>   meta-oe/recipes-dbs/leveldb/leveldb_git.bb    |  1 +
> >>   2 files changed, 44 insertions(+)
> >>   create mode 100644
> >> meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBarri=
er-for-mips.patch
> >>
> >> diff --git
> >> a/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBar=
rier-for-mips.patch
> >> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBar=
rier-for-mips.patch
> >>
> >> new file mode 100644
> >> index 000000000..fc7743030
> >> --- /dev/null
> >> +++
> >> b/meta-oe/recipes-dbs/leveldb/leveldb/do-not-define-function-MemoryBar=
rier-for-mips.patch
> >> @@ -0,0 +1,43 @@
> >> +It fails to compile leveldb for qemumips with default tune 'mips':
> >> +
> >> +| {standard input}: Assembler messages:
> >> +| {standard input}:8004: Error: opcode not supported on this processo=
r:
> >> +  mips1 (mips1) `sync'
> >> +| {standard input}:10296: Error: opcode not supported on this
> >> processor:
> >> +  mips1 (mips1) `sync'
> >> +| make: *** [out-shared/db/db_bench.o] Error 1
> >> +
> >> +Asm instruction 'sync' is called in platform-specific function
> >> +MemoryBarrier() which is used by AtomicPointer(). Comment out the
> >> +definition of MemoryBarrier() for mips to avoid the errors. And turn =
to
> >> +use AtomicPointer() based on C++11 <atomic>.
> >> +
> >> +Upstream-Status: Inappropriate [oe specific]
> >> +
> >> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> +
> >> +---
> >> + port/atomic_pointer.h | 10 +++++-----
> >> + 1 file changed, 5 insertions(+), 5 deletions(-)
> >> +
> >> +diff --git a/port/atomic_pointer.h b/port/atomic_pointer.h
> >> +index 1c4c7aa..7025ac3 100644
> >> +--- a/port/atomic_pointer.h
> >> ++++ b/port/atomic_pointer.h
> >> +@@ -113,11 +113,11 @@ inline void MemoryBarrier() {
> >> + #define LEVELDB_HAVE_MEMORY_BARRIER
> >> +
> >> + // MIPS
> >> +-#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
> >> +-inline void MemoryBarrier() {
> >> +-  __asm__ __volatile__("sync" : : : "memory");
> >> +-}
> >> +-#define LEVELDB_HAVE_MEMORY_BARRIER
> >> ++//#elif defined(ARCH_CPU_MIPS_FAMILY) && defined(__GNUC__)
> >> ++//inline void MemoryBarrier() {
> >> ++//  __asm__ __volatile__("sync" : : : "memory");
> >> ++//}
> >> ++//#define LEVELDB_HAVE_MEMORY_BARRIER
> >> +
> >
> > this is punishing all mips o32 variants.
>
> How about only apply the patch when DEFAULTTUNE is 'mips', such as
> something looks like:
>
> python ()  {
>
>      if d.getVar('DEFAULTTUNE') =3D=3D 'mips':
>
>          d.appendVar('SRC_URI', '
> file://do-not-define-function-MemoryBarrier-for-mips.patch')
>
> }


None of these are as good as first patch. Ideally you should change
the defaulttune

