Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0417571AEF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 01:24:55 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d79so2320408wmi.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Apr 2017 18:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eFxw2b0DYJccAe/2Biox29CiiHuh/ZFYkJEqG1ABnVg=;
	b=f7OurvaVS7kpfivJIOesw+p9xzNWzw5cuNFHkeK6wIKR6fVd6BWqiHDD6Sh3P2lT6Q
	A0R7Cy0mFSi3kE4Oatx4xR+n1y7ywT8ee79rK8yIWV5hI/ev7zCv8klSeim+NvSse+kA
	DO+4zLvezCVxMIodqoiwOQjd1k6Ee8b4qQeFOzBlYsBVhKVHemdLOxDs8ukq7VnDGO4Y
	yxKBbt1IpVNe3ltXPEgeWBKfpKi1JpTZKktXCOsm3/HP7Xhz18zJS+oY8JRw6uk8p4MF
	lk236fOtGt/YPI8Sv0zBsTiDfQpGu0po1wWBurHrvTX4ep78z9k0/OsjHvs8QfCFl5jz
	r9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eFxw2b0DYJccAe/2Biox29CiiHuh/ZFYkJEqG1ABnVg=;
	b=ijKtwFrlY5yer7zTvRQJRbUGcuQaxx/AmxM1OYr56tT65QJGWtcObAdzk4l/NExWn+
	r/8Z+b9v71/Xv3C1xE/WeX3FTIV6mEnm35OOTlp4Dyknzy01T83xsa1qqwHJlPfbUG3H
	reVoKGNG3kvGZ7jIqhHSeq0kCvDmJ57QVEorOD9RpYV6N04Wq8Bui+18Knqg1/9UuMd1
	FBL8eozH2b+XBFw+JnkhsWN18+8+0ReDdew6dAAvrP3C/bXJ+/Nqv5s3pYAr221ugAXH
	QqY34nkOoiivpfRLfGQw+Q5R9tR2K6W9tXqHu6QGU3fE1Fvss/QNdNIG3hgn2LM8Rqz0
	VskQ==
X-Gm-Message-State: AN3rC/7wEnCtWiz00eJYBlsTCWeRLp0bpgjNtmDN6rJMfQdsMJGQ88ux
	IWE4gih0bjO6f77h5aEH6jPgGk/WEA==
X-Received: by 10.28.87.70 with SMTP id l67mr14549010wmb.37.1492565096347;
	Tue, 18 Apr 2017 18:24:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Tue, 18 Apr 2017 18:24:25 -0700 (PDT)
In-Reply-To: <9261637f-e3ec-7d7c-902f-03a4a7aef5dc@gmail.com>
References: <20170418182142.27253-1-raj.khem@gmail.com>
	<9261637f-e3ec-7d7c-902f-03a4a7aef5dc@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Apr 2017 18:24:25 -0700
Message-ID: <CAMKF1sp4SFxu_W-YWqYiavY0h_HStat3c1F=cvzsqEyFoV9=ow@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][ 01/32] netmap: Update to tip and fix misc build issues
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
X-List-Received-Date: Wed, 19 Apr 2017 01:24:56 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 18, 2017 at 5:39 PM, akuster808 <akuster808@gmail.com> wrote:
> Khem,
>
>
> Why is this being included? I thought you and Martin saw issues?
>

ignore it. I just rebased my tree on master-next and this slipped
through

> - armin
>
>
>
> On 04/18/2017 11:21 AM, Khem Raj wrote:
>>
>> From: Armin Kuster <akuster808@gmail.com>
>>
>> Update to pick up 4.10 and below kernel patches.
>> Change LICENSE to reflect changes noted by the maintainer
>> adapt to makefile changes for module install dest location
>> fix compile issues do to gcc 6.x
>> remove unneeded patches
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   .../recipes-kernel/netmap/files/gcc_6_fix.patch    | 170
>> +++++++++++++++++++++
>>   .../recipes-kernel/netmap/netmap-modules_git.bb    |   9 +-
>>   meta-networking/recipes-kernel/netmap/netmap.inc   |   8 +-
>>   .../recipes-kernel/netmap/netmap_git.bb            |   8 +-
>>   4 files changed, 182 insertions(+), 13 deletions(-)
>>   create mode 100644
>> meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
>>
>> diff --git a/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
>> b/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
>> new file mode 100644
>> index 000000000..50652254e
>> --- /dev/null
>> +++ b/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
>> @@ -0,0 +1,170 @@
>> +Fix build issues do to gcc 6.x
>> +
>> +Upstream-Status: Pending
>> +
>> +loads of error: format '%lu' expects argument of type 'long unsigned
>> int', but argument 7 has type 'long long unsigned int'
>> +
>> +and  error: left shift count >= width of type
>> [-Werror=shift-count-overflow]
>> +
>> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> +
>> +Index: git/apps/lb/lb.c
>> +===================================================================
>> +--- git.orig/apps/lb/lb.c
>> ++++ git/apps/lb/lb.c
>> +@@ -935,7 +935,7 @@ run:
>> +                               if (hash == 0) {
>> +                                       non_ip++; // XXX ??
>> +                               }
>> +-                              rs->ptr = hash | (1UL << 32);
>> ++                              rs->ptr = hash | (1ULL << 32);
>> +                               // prefetch the buffer for the next round
>> +                               next_cur = nm_ring_next(rxring, next_cur);
>> +                               next_slot = &rxring->slot[next_cur];
>> +Index: git/apps/tlem/tlem.c
>> +===================================================================
>> +--- git.orig/apps/tlem/tlem.c
>> ++++ git/apps/tlem/tlem.c
>> +@@ -513,7 +513,7 @@ no_room(struct _qs *q)
>> +       q_reclaim(q);
>> +       if (q->prod_queued > q->qsize) {
>> +           q->prod_drop++;
>> +-          RD(1, "too many bytes queued %lu, drop %lu",
>> ++          RD(1, "too many bytes queued %llu, drop %llu",
>> +               (_P64)q->prod_queued, (_P64)q->prod_drop);
>> +           return 1;
>> +       }
>> +@@ -523,7 +523,7 @@ no_room(struct _qs *q)
>> +       h = q->prod_head = q->head; /* re-read head, just in case */
>> +       /* repeat the test */
>> +       if ((h <= t && new_t == 0 && h == 0) || (h > t && (new_t == 0 ||
>> new_t >= h)) ) {
>> +-          ND(1, "no room for insert h %ld t %ld new_t %ld",
>> ++          ND(1, "no room for insert h %lld t %lld new_t %lld",
>> +               (_P64)h, (_P64)t, (_P64)new_t);
>> +           return 1; /* no room for insert */
>> +       }
>> +@@ -906,14 +906,14 @@ tlem_main(void *_a)
>> +
>> +     q->buf = calloc(1, need);
>> +     if (q->buf == NULL) {
>> +-      ED("alloc %ld bytes for queue failed, exiting", (_P64)need);
>> ++      ED("alloc %lld bytes for queue failed, exiting", (_P64)need);
>> +       nm_close(a->pa);
>> +       nm_close(a->pb);
>> +       return(NULL);
>> +     }
>> +     q->buflen = need;
>> +-    ED("----\n\t%s -> %s :  bps %ld delay %s loss %s queue %ld bytes"
>> +-      "\n\tbuffer %lu bytes",
>> ++    ED("----\n\t%s -> %s :  bps %lld delay %s loss %s queue %lld bytes"
>> ++      "\n\tbuffer %llu bytes",
>> +       q->prod_ifname, q->cons_ifname,
>> +       (_P64)q->max_bps, q->c_delay.optarg, q->c_loss.optarg,
>> (_P64)q->qsize,
>> +       (_P64)q->buflen);
>> +@@ -1258,7 +1258,7 @@ main(int argc, char **argv)
>> +           struct _qs *q0 = &bp[0].q, *q1 = &bp[1].q;
>> +
>> +           sleep(1);
>> +-          ED("%ld -> %ld maxq %d round %ld, %ld <- %ld maxq %d round
>> %ld",
>> ++          ED("%lld -> %lld maxq %d round %lld, %lld <- %lld maxq %d
>> round %lld",
>> +               (_P64)(q0->rx - olda.rx), (_P64)(q0->tx - olda.tx),
>> +               q0->rx_qmax, (_P64)q0->prod_max_gap,
>> +               (_P64)(q1->rx - oldb.rx), (_P64)(q1->tx - oldb.tx),
>> +@@ -1553,7 +1553,7 @@ uniform_delay_parse(struct _qs *q, struc
>> +       dmax = parse_time(av[2]);
>> +       if (dmin == U_PARSE_ERR || dmax == U_PARSE_ERR || dmin > dmax)
>> +               return 1;
>> +-      D("dmin %ld dmax %ld", (_P64)dmin, (_P64)dmax);
>> ++      D("dmin %lld dmax %lld", (_P64)dmin, (_P64)dmax);
>> +       dst->d[0] = dmin;
>> +       dst->d[1] = dmax;
>> +       dst->d[2] = dmax - dmin;
>> +@@ -1618,7 +1618,7 @@ exp_delay_run(struct _qs *q, struct _cfg
>> + {
>> +       uint64_t *t = (uint64_t *)arg->arg;
>> +         q->cur_delay = t[my_random24() & (PTS_D_EXP - 1)];
>> +-      RD(5, "delay %lu", (_P64)q->cur_delay);
>> ++      RD(5, "delay %llu", (_P64)q->cur_delay);
>> +         return 0;
>> + }
>> +
>> +@@ -1777,7 +1777,7 @@ const_ber_parse(struct _qs *q, struct _c
>> +                       plr[i] = mask;
>> + #if 0
>> +               if (i>= 60) //  && plr[i] < mask/2)
>> +-                      RD(50,"%4d: %le %ld", i, 1.0 - cur, (_P64)plr[i]);
>> ++                      RD(50,"%4d: %le %lld", i, 1.0 - cur,
>> (_P64)plr[i]);
>> + #endif
>> +       }
>> +       dst->d[0] = ber * (mask + 1);
>> +Index: git/apps/nmreplay/nmreplay.c
>> +===================================================================
>> +--- git.orig/apps/nmreplay/nmreplay.c
>> ++++ git/apps/nmreplay/nmreplay.c
>> +@@ -771,7 +771,7 @@ pcap_prod(void *_pa)
>> +     need = loops * pf->tot_bytes_rounded + sizeof(struct q_pkt);
>> +     q->buf = calloc(1, need);
>> +     if (q->buf == NULL) {
>> +-      D("alloc %ld bytes for queue failed, exiting",(_P64)need);
>> ++      D("alloc %lld bytes for queue failed, exiting",(_P64)need);
>> +       goto fail;
>> +     }
>> +     q->prod_head = q->prod_tail = 0;
>> +@@ -1261,7 +1261,7 @@ main(int argc, char **argv)
>> +           struct _qs *q0 = &bp[0].q;
>> +
>> +           sleep(1);
>> +-          ED("%ld -> %ld maxq %d round %ld",
>> ++          ED("%lld -> %lld maxq %d round %lld",
>> +               (_P64)(q0->rx - olda.rx), (_P64)(q0->tx - olda.tx),
>> +               q0->rx_qmax, (_P64)q0->prod_max_gap
>> +               );
>> +@@ -1529,7 +1529,7 @@ uniform_delay_parse(struct _qs *q, struc
>> +       dmax = parse_time(av[2]);
>> +       if (dmin == U_PARSE_ERR || dmax == U_PARSE_ERR || dmin > dmax)
>> +               return 1;
>> +-      D("dmin %ld dmax %ld", (_P64)dmin, (_P64)dmax);
>> ++      D("dmin %lld dmax %lld", (_P64)dmin, (_P64)dmax);
>> +       dst->d[0] = dmin;
>> +       dst->d[1] = dmax;
>> +       dst->d[2] = dmax - dmin;
>> +@@ -1592,7 +1592,7 @@ exp_delay_run(struct _qs *q, struct _cfg
>> + {
>> +       uint64_t *t = (uint64_t *)arg->arg;
>> +         q->cur_delay = t[my_random24() & (PTS_D_EXP - 1)];
>> +-      RD(5, "delay %lu", (_P64)q->cur_delay);
>> ++      RD(5, "delay %llu", (_P64)q->cur_delay);
>> +         return 0;
>> + }
>> +
>> +@@ -1783,7 +1783,7 @@ const_ber_parse(struct _qs *q, struct _c
>> +                       plr[i] = mask;
>> + #if 0
>> +               if (i>= 60) //  && plr[i] < mask/2)
>> +-                      RD(50,"%4d: %le %ld", i, 1.0 - cur, (_P64)plr[i]);
>> ++                      RD(50,"%4d: %le %lld", i, 1.0 - cur,
>> (_P64)plr[i]);
>> + #endif
>> +       }
>> +       dst->d[0] = ber * (mask + 1);
>> +Index: git/apps/pkt-gen/pkt-gen.c
>> +===================================================================
>> +--- git.orig/apps/pkt-gen/pkt-gen.c
>> ++++ git/apps/pkt-gen/pkt-gen.c
>> +@@ -1319,7 +1319,7 @@ ping_body(void *data)
>> +                                       ts.tv_nsec += 1000000000;
>> +                                       ts.tv_sec--;
>> +                               }
>> +-                              if (0) D("seq %d/%lu delta %d.%09d", seq,
>> sent,
>> ++                              if (0) D("seq %d/%llu delta %d.%09d", seq,
>> sent,
>> +                                       (int)ts.tv_sec, (int)ts.tv_nsec);
>> +                               t_cur = ts.tv_sec * 1000000000UL +
>> ts.tv_nsec;
>> +                               if (t_cur < t_min)
>> +@@ -1401,7 +1401,7 @@ pong_body(void *data)
>> +               return NULL;
>> +       }
>> +       if (n > 0)
>> +-              D("understood ponger %lu but don't know how to do it", n);
>> ++              D("understood ponger %llu but don't know how to do it",
>> n);
>> +       while (!targ->cancel && (n == 0 || sent < n)) {
>> +               uint32_t txcur, txavail;
>> + //#define BUSYWAIT
>> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> index 192ece0e9..6f05ac76c 100644
>> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
>> @@ -13,6 +13,9 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR}
>> \
>>                   --kernel-sources=${STAGING_KERNEL_DIR} \
>>                   --install-mod-path=${D} \
>>                   --driver-suffix="-netmap" \
>> +                --cc='${CC}' \
>> +                --ld='${LD}' \
>> +                --no-apps \
>>                   "
>>     # The driver builds are optional, but for deterministic builds,
>> @@ -85,8 +88,8 @@ do_compile () {
>>     do_install () {
>>       cd ${S}/LINUX
>> -    oe_runmake install
>> +    oe_runmake install DESTDIR=${D}
>>   }
>>   -# http://errors.yoctoproject.org/Errors/Details/83335/
>> -PNBLACKLIST[netmap-modules] ?= "BROKEN: not compatible with default
>> kernel version 4.8 - the recipe will be removed on 2017-09-01 unless the
>> issue is fixed"
>> +FILES_${PN}-doc += "${prefix}/local/share"
>> +FILES_${PN}-dev += "${prefix}/local/include"
>> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc
>> b/meta-networking/recipes-kernel/netmap/netmap.inc
>> index ab33e765d..665c11d6c 100644
>> --- a/meta-networking/recipes-kernel/netmap/netmap.inc
>> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
>> @@ -2,15 +2,15 @@ SUMMARY = "netmap and VALE - very fast packet I/O from
>> userspace (FreeBSD/Linux)
>>   DESCRIPTION= "NETMAP is a framework for very fast packet I/O from
>> userspace.  VALE is an equally fast in-kernel software switch using the
>> netmap API.  Both are implemented as a single kernel module for FreeBSD and
>> Linux, and can deal with line rate on real or emulated 10 Gbit ports."
>>   SECTION = "networking"
>>   HOMEPAGE = "http://code.google.com/p/netmap/"
>> -LICENSE = "GPLv2+"
>> +LICENSE = "BSD-2-Clause"
>>   -LIC_FILES_CHKSUM =
>> "file://README;beginline=13;endline=14;md5=56ae0b9c7ba0476ab9098de94c2714d6"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=388c13686fc84f281413c82fa325965f"
>>   -SRCREV = "da9e19e69b84e4f6f8ae125f8d01b42a4abade6a"
>> +SRCREV = "86312f06626f33f150514eaab42a2d2a8432c4ed"
>>   PV = "master+git${SRCPV}"
>>     SRC_URI = "git://github.com/luigirizzo/netmap.git"
>> -SRC_URI += "file://makefile_fixup.patch"
>> +SRC_URI += "file://gcc_6_fix.patch"
>>     S = "${WORKDIR}/git"
>>   diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb
>> b/meta-networking/recipes-kernel/netmap/netmap_git.bb
>> index 2d8509c74..7eb5148f6 100644
>> --- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
>> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
>> @@ -7,12 +7,10 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR}
>> \
>>                   --kernel-sources=${STAGING_KERNEL_DIR} \
>>                   --no-drivers \
>>                   --disable-generic \
>> -                --prefix=${prefix} \
>>                   --destdir=${D} \
>>                   --cc='${CC}' \
>>                   --ld='${LD}' \
>>                   "
>> -SRC_URI += "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.patch"
>>     do_configure () {
>>       cd ${S}/LINUX
>> @@ -29,9 +27,7 @@ do_install () {
>>       make install-apps DESTDIR=${D}
>>   }
>>   -FILES_${PN} += "${bindir}"
>> +FILES_${PN} += "${prefix}/local/bin"
>> +FILES_${PN}-doc  += "${prefix}/local/share"
>>   RDEPENDS_${PN} = "kernel-module-netmap"
>>   RRECOMMENDS_${PN} = "kernel-module-netmap"
>> -
>> -# http://errors.yoctoproject.org/Errors/Details/69733/
>> -PNBLACKLIST[netmap] ?= "BROKEN: Tries to build kernel module and fails,
>> either it should be disabled or there should be dependency on kernel like in
>> netmap-modules - the recipe will be removed on 2017-09-01 unless the issue
>> is fixed"
>
>

