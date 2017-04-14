Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id DAF0077EA1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 19:34:48 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id z109so55131368wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rNCYMrTTvq1uS1l8ysoMvBy3BwFJQugzs1cYOe/9QUc=;
	b=KUFwWjUPdYCyxhg4jxQPA7Qj+yckZ8ETmmtxuG33oiib6pPU0R9/DF1jQUU9WJ6Ty3
	tae5wSG91has4qw57hrvgcsUS/XcX+wPobsbS0efG/X3VCFUwsmtlI10gdla+8fDD8pm
	01CjBDubUH/BgjtrZumCKiuOhimo1vum5DBXLK+Lk777VcAflBFjjDSyJn4yYmxm0Fhh
	/qiUnamZHeHnKCkwV6M7L36TBmAcDt7NbVEzEFWtGGk2Ri98eU78dBZa6DADQMMnyWL4
	Fo/zQjnX4tmFZz4PKrEowyh5D/RWmo1XN82hgLa0Z3JxIdArmnRbZ9qd7tsDSEzCsOn2
	fbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rNCYMrTTvq1uS1l8ysoMvBy3BwFJQugzs1cYOe/9QUc=;
	b=X9b6ZRPqIcazhCbgZglgp91kTldiMjNrDosnAUamtkPri5AWVWD0VWT0hDLHEvOrXv
	KoAVC0qIMwXPJeYMXqpwrzM6T7wvfpGs0u+K5jPMON3sO2nwn77DVVubO2oRTsSnEcPx
	eDOVH+5rMbNiZ9Y9DrNXQRI5OuLvQ9C1uL746Vh5gl90PUMeBo1cwBgQdF1BPAyG6J5J
	kEjmfROmlfy+fZE7w2MPiz/IyKZ77vcW1OXJV5qYzLFzxHSCDu4ySaSbOQ/4dqX/O+dT
	HKxoKZ9ruabNw1BDX7BAhHETsQcxMrV+QG0ZY/ROfEi9SMNrpZ9pzyaX2sVMLPL2ESLL
	d7GQ==
X-Gm-Message-State: AN3rC/7QyPejc9rm4YCneYL7OVTGZBFL8oizwbxTgMrBTDXGqdlrpIyW
	bUV1q+EdbexuIIDFFH7WSYzvOAHO4Gcv
X-Received: by 10.223.136.66 with SMTP id e2mr8988461wre.14.1492198489421;
	Fri, 14 Apr 2017 12:34:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.148.54 with HTTP; Fri, 14 Apr 2017 12:34:48 -0700 (PDT)
In-Reply-To: <bf96e067-c766-c7be-3d62-1223bfc8a678@gmail.com>
References: <1492052192-31483-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spTR2br7gEAEYSX0S77M=evuNQQ8s67RfHxwfxzx5VC-A@mail.gmail.com>
	<bf96e067-c766-c7be-3d62-1223bfc8a678@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 14 Apr 2017 21:34:48 +0200
Message-ID: <CA+chaQeTR9OonQir-rXo7N_LnSqx=ghGxTn0khGKhm6B-ZA3ig@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] netmap: Update to tip and fix misc build issues
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
X-List-Received-Date: Fri, 14 Apr 2017 19:34:49 -0000
Content-Type: text/plain; charset=UTF-8

I'm seeing similar issue here:
http://errors.yoctoproject.org/Errors/Details/140438/

On Fri, Apr 14, 2017 at 5:42 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 04/14/2017 08:34 AM, Khem Raj wrote:
>
>> Armin
>>
>> Seeing the below failure for turbot
>>
>> | depmod: FATAL: could not load /boot/System.map-4.4.0-72-generic:
>>
> Ooo, its trying to touch your host files.
>
> thanks for the info.
>
> - armin
>
> Permission denied
>> | make[1]: *** [install] Error 1
>> | make[1]: Leaving directory
>> `/mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7
>> _64-oe-linux/netmap-modules/master+gitAUTOINC+86312f0662-
>> r0/git/LINUX/ixgbevf-4.0.3/src'
>> | make: *** [install-ixgbevf] Error 2
>> | make: *** Waiting for unfinished jobs....
>> |   DEPMOD  4.9.15-yocto-standard
>> | make[2]: Leaving directory
>> `/mnt/oe/openembedded-core/build/tmp-glibc/work-shared/intel
>> -corei7-64/kernel-build-artifacts'
>> | Running depmod...
>> | depmod: FATAL: could not load /boot/System.map-4.4.0-72-generic:
>> Permission denied
>> | make[1]: *** [install] Error 1
>> | make[1]: Leaving directory
>> `/mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7
>> _64-oe-linux/netmap-modules/master+gitAUTOINC+86312f0662-
>> r0/git/LINUX/ixgbe-5.0.4/src'
>> | make: *** [install-ixgbe] Error 2
>> |   INSTALL /mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7_
>> 64-oe-linux/netmap-modules/master+gitAUTOINC+86312f0662-
>> r0/git/LINUX/i40e-2.0.19/src/i40e-netmap.ko
>> |   DEPMOD  4.9.15-yocto-standard
>> | make[2]: Leaving directory
>> `/mnt/oe/openembedded-core/build/tmp-glibc/work-shared/intel
>> -corei7-64/kernel-build-artifacts'
>> | Running depmod...
>> | depmod: FATAL: could not load /boot/System.map-4.4.0-72-generic:
>> Permission denied
>> | make[1]: *** [install] Error 1
>> | make[1]: Leaving directory
>> `/mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7
>> _64-oe-linux/netmap-modules/master+gitAUTOINC+86312f0662-
>> r0/git/LINUX/i40e-2.0.19/src'
>> | make: *** [install-i40e] Error 2
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_install (log file is located at
>> /mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7_
>> 64-oe-linux/netmap-modules/master+gitAUTOINC+86312f0662-
>> r0/temp/log.do_install.29966)
>>
>> On Wed, Apr 12, 2017 at 7:56 PM, Armin Kuster <akuster808@gmail.com>
>> wrote:
>>
>>> Update to pick up 4.10 and below kernel patches.
>>> Change LICENSE to reflect changes noted by the maintainer
>>> adapt to makefile changes for module install dest location
>>> fix compile issues do to gcc 6.x
>>> remove unneeded patches
>>>
>>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> ---
>>>   .../recipes-kernel/netmap/files/gcc_6_fix.patch    | 170
>>> +++++++++++++++++++++
>>>   .../recipes-kernel/netmap/netmap-modules_git.bb    |   9 +-
>>>   meta-networking/recipes-kernel/netmap/netmap.inc   |   8 +-
>>>   .../recipes-kernel/netmap/netmap_git.bb            |   8 +-
>>>   4 files changed, 182 insertions(+), 13 deletions(-)
>>>   create mode 100644 meta-networking/recipes-kernel
>>> /netmap/files/gcc_6_fix.patch
>>>
>>> diff --git a/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
>>> b/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
>>> new file mode 100644
>>> index 0000000..5065225
>>> --- /dev/null
>>> +++ b/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
>>> @@ -0,0 +1,170 @@
>>> +Fix build issues do to gcc 6.x
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +loads of error: format '%lu' expects argument of type 'long unsigned
>>> int', but argument 7 has type 'long long unsigned int'
>>> +
>>> +and  error: left shift count >= width of type
>>> [-Werror=shift-count-overflow]
>>> +
>>> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
>>> +
>>> +Index: git/apps/lb/lb.c
>>> +===================================================================
>>> +--- git.orig/apps/lb/lb.c
>>> ++++ git/apps/lb/lb.c
>>> +@@ -935,7 +935,7 @@ run:
>>> +                               if (hash == 0) {
>>> +                                       non_ip++; // XXX ??
>>> +                               }
>>> +-                              rs->ptr = hash | (1UL << 32);
>>> ++                              rs->ptr = hash | (1ULL << 32);
>>> +                               // prefetch the buffer for the next round
>>> +                               next_cur = nm_ring_next(rxring,
>>> next_cur);
>>> +                               next_slot = &rxring->slot[next_cur];
>>> +Index: git/apps/tlem/tlem.c
>>> +===================================================================
>>> +--- git.orig/apps/tlem/tlem.c
>>> ++++ git/apps/tlem/tlem.c
>>> +@@ -513,7 +513,7 @@ no_room(struct _qs *q)
>>> +       q_reclaim(q);
>>> +       if (q->prod_queued > q->qsize) {
>>> +           q->prod_drop++;
>>> +-          RD(1, "too many bytes queued %lu, drop %lu",
>>> ++          RD(1, "too many bytes queued %llu, drop %llu",
>>> +               (_P64)q->prod_queued, (_P64)q->prod_drop);
>>> +           return 1;
>>> +       }
>>> +@@ -523,7 +523,7 @@ no_room(struct _qs *q)
>>> +       h = q->prod_head = q->head; /* re-read head, just in case */
>>> +       /* repeat the test */
>>> +       if ((h <= t && new_t == 0 && h == 0) || (h > t && (new_t == 0 ||
>>> new_t >= h)) ) {
>>> +-          ND(1, "no room for insert h %ld t %ld new_t %ld",
>>> ++          ND(1, "no room for insert h %lld t %lld new_t %lld",
>>> +               (_P64)h, (_P64)t, (_P64)new_t);
>>> +           return 1; /* no room for insert */
>>> +       }
>>> +@@ -906,14 +906,14 @@ tlem_main(void *_a)
>>> +
>>> +     q->buf = calloc(1, need);
>>> +     if (q->buf == NULL) {
>>> +-      ED("alloc %ld bytes for queue failed, exiting", (_P64)need);
>>> ++      ED("alloc %lld bytes for queue failed, exiting", (_P64)need);
>>> +       nm_close(a->pa);
>>> +       nm_close(a->pb);
>>> +       return(NULL);
>>> +     }
>>> +     q->buflen = need;
>>> +-    ED("----\n\t%s -> %s :  bps %ld delay %s loss %s queue %ld bytes"
>>> +-      "\n\tbuffer %lu bytes",
>>> ++    ED("----\n\t%s -> %s :  bps %lld delay %s loss %s queue %lld bytes"
>>> ++      "\n\tbuffer %llu bytes",
>>> +       q->prod_ifname, q->cons_ifname,
>>> +       (_P64)q->max_bps, q->c_delay.optarg, q->c_loss.optarg,
>>> (_P64)q->qsize,
>>> +       (_P64)q->buflen);
>>> +@@ -1258,7 +1258,7 @@ main(int argc, char **argv)
>>> +           struct _qs *q0 = &bp[0].q, *q1 = &bp[1].q;
>>> +
>>> +           sleep(1);
>>> +-          ED("%ld -> %ld maxq %d round %ld, %ld <- %ld maxq %d round
>>> %ld",
>>> ++          ED("%lld -> %lld maxq %d round %lld, %lld <- %lld maxq %d
>>> round %lld",
>>> +               (_P64)(q0->rx - olda.rx), (_P64)(q0->tx - olda.tx),
>>> +               q0->rx_qmax, (_P64)q0->prod_max_gap,
>>> +               (_P64)(q1->rx - oldb.rx), (_P64)(q1->tx - oldb.tx),
>>> +@@ -1553,7 +1553,7 @@ uniform_delay_parse(struct _qs *q, struc
>>> +       dmax = parse_time(av[2]);
>>> +       if (dmin == U_PARSE_ERR || dmax == U_PARSE_ERR || dmin > dmax)
>>> +               return 1;
>>> +-      D("dmin %ld dmax %ld", (_P64)dmin, (_P64)dmax);
>>> ++      D("dmin %lld dmax %lld", (_P64)dmin, (_P64)dmax);
>>> +       dst->d[0] = dmin;
>>> +       dst->d[1] = dmax;
>>> +       dst->d[2] = dmax - dmin;
>>> +@@ -1618,7 +1618,7 @@ exp_delay_run(struct _qs *q, struct _cfg
>>> + {
>>> +       uint64_t *t = (uint64_t *)arg->arg;
>>> +         q->cur_delay = t[my_random24() & (PTS_D_EXP - 1)];
>>> +-      RD(5, "delay %lu", (_P64)q->cur_delay);
>>> ++      RD(5, "delay %llu", (_P64)q->cur_delay);
>>> +         return 0;
>>> + }
>>> +
>>> +@@ -1777,7 +1777,7 @@ const_ber_parse(struct _qs *q, struct _c
>>> +                       plr[i] = mask;
>>> + #if 0
>>> +               if (i>= 60) //  && plr[i] < mask/2)
>>> +-                      RD(50,"%4d: %le %ld", i, 1.0 - cur,
>>> (_P64)plr[i]);
>>> ++                      RD(50,"%4d: %le %lld", i, 1.0 - cur,
>>> (_P64)plr[i]);
>>> + #endif
>>> +       }
>>> +       dst->d[0] = ber * (mask + 1);
>>> +Index: git/apps/nmreplay/nmreplay.c
>>> +===================================================================
>>> +--- git.orig/apps/nmreplay/nmreplay.c
>>> ++++ git/apps/nmreplay/nmreplay.c
>>> +@@ -771,7 +771,7 @@ pcap_prod(void *_pa)
>>> +     need = loops * pf->tot_bytes_rounded + sizeof(struct q_pkt);
>>> +     q->buf = calloc(1, need);
>>> +     if (q->buf == NULL) {
>>> +-      D("alloc %ld bytes for queue failed, exiting",(_P64)need);
>>> ++      D("alloc %lld bytes for queue failed, exiting",(_P64)need);
>>> +       goto fail;
>>> +     }
>>> +     q->prod_head = q->prod_tail = 0;
>>> +@@ -1261,7 +1261,7 @@ main(int argc, char **argv)
>>> +           struct _qs *q0 = &bp[0].q;
>>> +
>>> +           sleep(1);
>>> +-          ED("%ld -> %ld maxq %d round %ld",
>>> ++          ED("%lld -> %lld maxq %d round %lld",
>>> +               (_P64)(q0->rx - olda.rx), (_P64)(q0->tx - olda.tx),
>>> +               q0->rx_qmax, (_P64)q0->prod_max_gap
>>> +               );
>>> +@@ -1529,7 +1529,7 @@ uniform_delay_parse(struct _qs *q, struc
>>> +       dmax = parse_time(av[2]);
>>> +       if (dmin == U_PARSE_ERR || dmax == U_PARSE_ERR || dmin > dmax)
>>> +               return 1;
>>> +-      D("dmin %ld dmax %ld", (_P64)dmin, (_P64)dmax);
>>> ++      D("dmin %lld dmax %lld", (_P64)dmin, (_P64)dmax);
>>> +       dst->d[0] = dmin;
>>> +       dst->d[1] = dmax;
>>> +       dst->d[2] = dmax - dmin;
>>> +@@ -1592,7 +1592,7 @@ exp_delay_run(struct _qs *q, struct _cfg
>>> + {
>>> +       uint64_t *t = (uint64_t *)arg->arg;
>>> +         q->cur_delay = t[my_random24() & (PTS_D_EXP - 1)];
>>> +-      RD(5, "delay %lu", (_P64)q->cur_delay);
>>> ++      RD(5, "delay %llu", (_P64)q->cur_delay);
>>> +         return 0;
>>> + }
>>> +
>>> +@@ -1783,7 +1783,7 @@ const_ber_parse(struct _qs *q, struct _c
>>> +                       plr[i] = mask;
>>> + #if 0
>>> +               if (i>= 60) //  && plr[i] < mask/2)
>>> +-                      RD(50,"%4d: %le %ld", i, 1.0 - cur,
>>> (_P64)plr[i]);
>>> ++                      RD(50,"%4d: %le %lld", i, 1.0 - cur,
>>> (_P64)plr[i]);
>>> + #endif
>>> +       }
>>> +       dst->d[0] = ber * (mask + 1);
>>> +Index: git/apps/pkt-gen/pkt-gen.c
>>> +===================================================================
>>> +--- git.orig/apps/pkt-gen/pkt-gen.c
>>> ++++ git/apps/pkt-gen/pkt-gen.c
>>> +@@ -1319,7 +1319,7 @@ ping_body(void *data)
>>> +                                       ts.tv_nsec += 1000000000;
>>> +                                       ts.tv_sec--;
>>> +                               }
>>> +-                              if (0) D("seq %d/%lu delta %d.%09d",
>>> seq, sent,
>>> ++                              if (0) D("seq %d/%llu delta %d.%09d",
>>> seq, sent,
>>> +                                       (int)ts.tv_sec, (int)ts.tv_nsec);
>>> +                               t_cur = ts.tv_sec * 1000000000UL +
>>> ts.tv_nsec;
>>> +                               if (t_cur < t_min)
>>> +@@ -1401,7 +1401,7 @@ pong_body(void *data)
>>> +               return NULL;
>>> +       }
>>> +       if (n > 0)
>>> +-              D("understood ponger %lu but don't know how to do it",
>>> n);
>>> ++              D("understood ponger %llu but don't know how to do it",
>>> n);
>>> +       while (!targ->cancel && (n == 0 || sent < n)) {
>>> +               uint32_t txcur, txavail;
>>> + //#define BUSYWAIT
>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> index 82b9b05..6f05ac7 100644
>>> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>>> @@ -13,6 +13,9 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR}
>>> \
>>>                   --kernel-sources=${STAGING_KERNEL_DIR} \
>>>                   --install-mod-path=${D} \
>>>                   --driver-suffix="-netmap" \
>>> +                --cc='${CC}' \
>>> +                --ld='${LD}' \
>>> +                --no-apps \
>>>                   "
>>>
>>>   # The driver builds are optional, but for deterministic builds,
>>> @@ -85,8 +88,8 @@ do_compile () {
>>>
>>>   do_install () {
>>>       cd ${S}/LINUX
>>> -    oe_runmake install
>>> +    oe_runmake install DESTDIR=${D}
>>>   }
>>>
>>> -# http://errors.yoctoproject.org/Errors/Details/83335/
>>> -PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default
>>> kernel version 4.8"
>>> +FILES_${PN}-doc += "${prefix}/local/share"
>>> +FILES_${PN}-dev += "${prefix}/local/include"
>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc
>>> b/meta-networking/recipes-kernel/netmap/netmap.inc
>>> index ab33e76..665c11d 100644
>>> --- a/meta-networking/recipes-kernel/netmap/netmap.inc
>>> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
>>> @@ -2,15 +2,15 @@ SUMMARY = "netmap and VALE - very fast packet I/O from
>>> userspace (FreeBSD/Linux)
>>>   DESCRIPTION= "NETMAP is a framework for very fast packet I/O from
>>> userspace.  VALE is an equally fast in-kernel software switch using the
>>> netmap API.  Both are implemented as a single kernel module for FreeBSD and
>>> Linux, and can deal with line rate on real or emulated 10 Gbit ports."
>>>   SECTION = "networking"
>>>   HOMEPAGE = "http://code.google.com/p/netmap/"
>>> -LICENSE = "GPLv2+"
>>> +LICENSE = "BSD-2-Clause"
>>>
>>> -LIC_FILES_CHKSUM = "file://README;beginline=13;en
>>> dline=14;md5=56ae0b9c7ba0476ab9098de94c2714d6"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=388c13686f
>>> c84f281413c82fa325965f"
>>>
>>> -SRCREV = "da9e19e69b84e4f6f8ae125f8d01b42a4abade6a"
>>> +SRCREV = "86312f06626f33f150514eaab42a2d2a8432c4ed"
>>>   PV = "master+git${SRCPV}"
>>>
>>>   SRC_URI = "git://github.com/luigirizzo/netmap.git"
>>> -SRC_URI += "file://makefile_fixup.patch"
>>> +SRC_URI += "file://gcc_6_fix.patch"
>>>
>>>   S = "${WORKDIR}/git"
>>>
>>> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb
>>> b/meta-networking/recipes-kernel/netmap/netmap_git.bb
>>> index 667e7cc..7eb5148 100644
>>> --- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
>>> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
>>> @@ -7,12 +7,10 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR}
>>> \
>>>                   --kernel-sources=${STAGING_KERNEL_DIR} \
>>>                   --no-drivers \
>>>                   --disable-generic \
>>> -                --prefix=${prefix} \
>>>                   --destdir=${D} \
>>>                   --cc='${CC}' \
>>>                   --ld='${LD}' \
>>>                   "
>>> -SRC_URI += "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.patch"
>>>
>>>   do_configure () {
>>>       cd ${S}/LINUX
>>> @@ -29,9 +27,7 @@ do_install () {
>>>       make install-apps DESTDIR=${D}
>>>   }
>>>
>>> -FILES_${PN} += "${bindir}"
>>> +FILES_${PN} += "${prefix}/local/bin"
>>> +FILES_${PN}-doc  += "${prefix}/local/share"
>>>   RDEPENDS_${PN} = "kernel-module-netmap"
>>>   RRECOMMENDS_${PN} = "kernel-module-netmap"
>>> -
>>> -# http://errors.yoctoproject.org/Errors/Details/69733/
>>> -PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails,
>>> either it should be disabled or there should be dependency on kernel like
>>> in netmap-modules"
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

