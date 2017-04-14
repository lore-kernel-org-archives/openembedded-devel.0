Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id F1755719DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 15:35:25 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id o81so18323557wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Apr 2017 08:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LAaxn1Hvhy9koEe0g52lHBQzmJ9RweMzGzoFdDme/pQ=;
	b=I6HWHPY4c8NWor6VDw3aOZFRB9N84Lf0X1f1+kaNQWb0t0/BFwJ2XIoJUfi5RH2qPs
	purxBDf+N/DzzbHwOyl3zDeQujapBv7vQQQnTiKr1iNYI83F3BQ8qQsBcSsbyzWu4oPN
	/wDXdDlyvXfkQ/NYG0Svi6JetJHrzTZHeRgz8GXKB//Z1ZatmE7WMzl4QJ6h1+Mr7sGU
	Rpw9prhGTEudUumKxFPQxMGC+/IS/O70M5wzai0/qqK/GaaCaC0BX4phx3F2Tg9SdarC
	qodliRPETd/KbpS70rOEcfk7zp5GVxk2KqqIOoJK9gteql0rGHC+v8VS3D38qR0lvjni
	awdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LAaxn1Hvhy9koEe0g52lHBQzmJ9RweMzGzoFdDme/pQ=;
	b=EU1OM2u/+pGqNAtxKSCN6lhDBwugQLY4RpQX+ftm35E3jSsb3Lq9C/u7374vZRi/FT
	N8g5/j4ikPy9J7RnqVTtFAzv5f2+Y+uYH/46QxrrbNrrsXrDnucRnLu7p1CbYOznvC71
	Y0zlTEzkKzUdTdVMm6VYiDk0oY9p6ohRPdEhjuBkWjwGp+3I4YA+PjKsiiK+RXf+vluA
	esUbagHkyGcy2as8CVLoqapz7JcrQRtU2bwER6zFP1QrCf/pYbfs8PJBYbZuIKVZD/qr
	5uDMxp33+3dFVQIzQelz+tGOswRkWds3RIxH/1hNs0F2NDYZYZnp8f1J3V+wrOiSj/Ad
	1iEA==
X-Gm-Message-State: AN3rC/5YC/f6XMhtAbE4T9cq7zm9MqDQndwfkaTVD/JgHe3v3eSIw1ei
	GfEXpALBM4u02PrKlgMfL0d3yrJLhg==
X-Received: by 10.28.234.205 with SMTP id g74mr30594149wmi.13.1492184126240;
	Fri, 14 Apr 2017 08:35:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Fri, 14 Apr 2017 08:34:55 -0700 (PDT)
In-Reply-To: <1492052192-31483-1-git-send-email-akuster808@gmail.com>
References: <1492052192-31483-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Apr 2017 08:34:55 -0700
Message-ID: <CAMKF1spTR2br7gEAEYSX0S77M=evuNQQ8s67RfHxwfxzx5VC-A@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Fri, 14 Apr 2017 15:35:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Armin

Seeing the below failure for turbot

| depmod: FATAL: could not load /boot/System.map-4.4.0-72-generic:
Permission denied
| make[1]: *** [install] Error 1
| make[1]: Leaving directory
`/mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7_64-oe-linux/ne=
tmap-modules/master+gitAUTOINC+86312f0662-r0/git/LINUX/ixgbevf-4.0.3/src'
| make: *** [install-ixgbevf] Error 2
| make: *** Waiting for unfinished jobs....
|   DEPMOD  4.9.15-yocto-standard
| make[2]: Leaving directory
`/mnt/oe/openembedded-core/build/tmp-glibc/work-shared/intel-corei7-64/kern=
el-build-artifacts'
| Running depmod...
| depmod: FATAL: could not load /boot/System.map-4.4.0-72-generic:
Permission denied
| make[1]: *** [install] Error 1
| make[1]: Leaving directory
`/mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7_64-oe-linux/ne=
tmap-modules/master+gitAUTOINC+86312f0662-r0/git/LINUX/ixgbe-5.0.4/src'
| make: *** [install-ixgbe] Error 2
|   INSTALL /mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7_64-=
oe-linux/netmap-modules/master+gitAUTOINC+86312f0662-r0/git/LINUX/i40e-2.0.=
19/src/i40e-netmap.ko
|   DEPMOD  4.9.15-yocto-standard
| make[2]: Leaving directory
`/mnt/oe/openembedded-core/build/tmp-glibc/work-shared/intel-corei7-64/kern=
el-build-artifacts'
| Running depmod...
| depmod: FATAL: could not load /boot/System.map-4.4.0-72-generic:
Permission denied
| make[1]: *** [install] Error 1
| make[1]: Leaving directory
`/mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7_64-oe-linux/ne=
tmap-modules/master+gitAUTOINC+86312f0662-r0/git/LINUX/i40e-2.0.19/src'
| make: *** [install-i40e] Error 2
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_install (log file is located at
/mnt/oe/openembedded-core/build/tmp-glibc/work/intel_corei7_64-oe-linux/net=
map-modules/master+gitAUTOINC+86312f0662-r0/temp/log.do_install.29966)

On Wed, Apr 12, 2017 at 7:56 PM, Armin Kuster <akuster808@gmail.com> wrote:
> Update to pick up 4.10 and below kernel patches.
> Change LICENSE to reflect changes noted by the maintainer
> adapt to makefile changes for module install dest location
> fix compile issues do to gcc 6.x
> remove unneeded patches
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-kernel/netmap/files/gcc_6_fix.patch    | 170 +++++++++++++++=
++++++
>  .../recipes-kernel/netmap/netmap-modules_git.bb    |   9 +-
>  meta-networking/recipes-kernel/netmap/netmap.inc   |   8 +-
>  .../recipes-kernel/netmap/netmap_git.bb            |   8 +-
>  4 files changed, 182 insertions(+), 13 deletions(-)
>  create mode 100644 meta-networking/recipes-kernel/netmap/files/gcc_6_fix=
.patch
>
> diff --git a/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch =
b/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
> new file mode 100644
> index 0000000..5065225
> --- /dev/null
> +++ b/meta-networking/recipes-kernel/netmap/files/gcc_6_fix.patch
> @@ -0,0 +1,170 @@
> +Fix build issues do to gcc 6.x
> +
> +Upstream-Status: Pending
> +
> +loads of error: format '%lu' expects argument of type 'long unsigned int=
', but argument 7 has type 'long long unsigned int'
> +
> +and  error: left shift count >=3D width of type [-Werror=3Dshift-count-o=
verflow]
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +Index: git/apps/lb/lb.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/apps/lb/lb.c
> ++++ git/apps/lb/lb.c
> +@@ -935,7 +935,7 @@ run:
> +                               if (hash =3D=3D 0) {
> +                                       non_ip++; // XXX ??
> +                               }
> +-                              rs->ptr =3D hash | (1UL << 32);
> ++                              rs->ptr =3D hash | (1ULL << 32);
> +                               // prefetch the buffer for the next round
> +                               next_cur =3D nm_ring_next(rxring, next_cu=
r);
> +                               next_slot =3D &rxring->slot[next_cur];
> +Index: git/apps/tlem/tlem.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/apps/tlem/tlem.c
> ++++ git/apps/tlem/tlem.c
> +@@ -513,7 +513,7 @@ no_room(struct _qs *q)
> +       q_reclaim(q);
> +       if (q->prod_queued > q->qsize) {
> +           q->prod_drop++;
> +-          RD(1, "too many bytes queued %lu, drop %lu",
> ++          RD(1, "too many bytes queued %llu, drop %llu",
> +               (_P64)q->prod_queued, (_P64)q->prod_drop);
> +           return 1;
> +       }
> +@@ -523,7 +523,7 @@ no_room(struct _qs *q)
> +       h =3D q->prod_head =3D q->head; /* re-read head, just in case */
> +       /* repeat the test */
> +       if ((h <=3D t && new_t =3D=3D 0 && h =3D=3D 0) || (h > t && (new_=
t =3D=3D 0 || new_t >=3D h)) ) {
> +-          ND(1, "no room for insert h %ld t %ld new_t %ld",
> ++          ND(1, "no room for insert h %lld t %lld new_t %lld",
> +               (_P64)h, (_P64)t, (_P64)new_t);
> +           return 1; /* no room for insert */
> +       }
> +@@ -906,14 +906,14 @@ tlem_main(void *_a)
> +
> +     q->buf =3D calloc(1, need);
> +     if (q->buf =3D=3D NULL) {
> +-      ED("alloc %ld bytes for queue failed, exiting", (_P64)need);
> ++      ED("alloc %lld bytes for queue failed, exiting", (_P64)need);
> +       nm_close(a->pa);
> +       nm_close(a->pb);
> +       return(NULL);
> +     }
> +     q->buflen =3D need;
> +-    ED("----\n\t%s -> %s :  bps %ld delay %s loss %s queue %ld bytes"
> +-      "\n\tbuffer %lu bytes",
> ++    ED("----\n\t%s -> %s :  bps %lld delay %s loss %s queue %lld bytes"
> ++      "\n\tbuffer %llu bytes",
> +       q->prod_ifname, q->cons_ifname,
> +       (_P64)q->max_bps, q->c_delay.optarg, q->c_loss.optarg, (_P64)q->q=
size,
> +       (_P64)q->buflen);
> +@@ -1258,7 +1258,7 @@ main(int argc, char **argv)
> +           struct _qs *q0 =3D &bp[0].q, *q1 =3D &bp[1].q;
> +
> +           sleep(1);
> +-          ED("%ld -> %ld maxq %d round %ld, %ld <- %ld maxq %d round %l=
d",
> ++          ED("%lld -> %lld maxq %d round %lld, %lld <- %lld maxq %d rou=
nd %lld",
> +               (_P64)(q0->rx - olda.rx), (_P64)(q0->tx - olda.tx),
> +               q0->rx_qmax, (_P64)q0->prod_max_gap,
> +               (_P64)(q1->rx - oldb.rx), (_P64)(q1->tx - oldb.tx),
> +@@ -1553,7 +1553,7 @@ uniform_delay_parse(struct _qs *q, struc
> +       dmax =3D parse_time(av[2]);
> +       if (dmin =3D=3D U_PARSE_ERR || dmax =3D=3D U_PARSE_ERR || dmin > =
dmax)
> +               return 1;
> +-      D("dmin %ld dmax %ld", (_P64)dmin, (_P64)dmax);
> ++      D("dmin %lld dmax %lld", (_P64)dmin, (_P64)dmax);
> +       dst->d[0] =3D dmin;
> +       dst->d[1] =3D dmax;
> +       dst->d[2] =3D dmax - dmin;
> +@@ -1618,7 +1618,7 @@ exp_delay_run(struct _qs *q, struct _cfg
> + {
> +       uint64_t *t =3D (uint64_t *)arg->arg;
> +         q->cur_delay =3D t[my_random24() & (PTS_D_EXP - 1)];
> +-      RD(5, "delay %lu", (_P64)q->cur_delay);
> ++      RD(5, "delay %llu", (_P64)q->cur_delay);
> +         return 0;
> + }
> +
> +@@ -1777,7 +1777,7 @@ const_ber_parse(struct _qs *q, struct _c
> +                       plr[i] =3D mask;
> + #if 0
> +               if (i>=3D 60) //  && plr[i] < mask/2)
> +-                      RD(50,"%4d: %le %ld", i, 1.0 - cur, (_P64)plr[i])=
;
> ++                      RD(50,"%4d: %le %lld", i, 1.0 - cur, (_P64)plr[i]=
);
> + #endif
> +       }
> +       dst->d[0] =3D ber * (mask + 1);
> +Index: git/apps/nmreplay/nmreplay.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/apps/nmreplay/nmreplay.c
> ++++ git/apps/nmreplay/nmreplay.c
> +@@ -771,7 +771,7 @@ pcap_prod(void *_pa)
> +     need =3D loops * pf->tot_bytes_rounded + sizeof(struct q_pkt);
> +     q->buf =3D calloc(1, need);
> +     if (q->buf =3D=3D NULL) {
> +-      D("alloc %ld bytes for queue failed, exiting",(_P64)need);
> ++      D("alloc %lld bytes for queue failed, exiting",(_P64)need);
> +       goto fail;
> +     }
> +     q->prod_head =3D q->prod_tail =3D 0;
> +@@ -1261,7 +1261,7 @@ main(int argc, char **argv)
> +           struct _qs *q0 =3D &bp[0].q;
> +
> +           sleep(1);
> +-          ED("%ld -> %ld maxq %d round %ld",
> ++          ED("%lld -> %lld maxq %d round %lld",
> +               (_P64)(q0->rx - olda.rx), (_P64)(q0->tx - olda.tx),
> +               q0->rx_qmax, (_P64)q0->prod_max_gap
> +               );
> +@@ -1529,7 +1529,7 @@ uniform_delay_parse(struct _qs *q, struc
> +       dmax =3D parse_time(av[2]);
> +       if (dmin =3D=3D U_PARSE_ERR || dmax =3D=3D U_PARSE_ERR || dmin > =
dmax)
> +               return 1;
> +-      D("dmin %ld dmax %ld", (_P64)dmin, (_P64)dmax);
> ++      D("dmin %lld dmax %lld", (_P64)dmin, (_P64)dmax);
> +       dst->d[0] =3D dmin;
> +       dst->d[1] =3D dmax;
> +       dst->d[2] =3D dmax - dmin;
> +@@ -1592,7 +1592,7 @@ exp_delay_run(struct _qs *q, struct _cfg
> + {
> +       uint64_t *t =3D (uint64_t *)arg->arg;
> +         q->cur_delay =3D t[my_random24() & (PTS_D_EXP - 1)];
> +-      RD(5, "delay %lu", (_P64)q->cur_delay);
> ++      RD(5, "delay %llu", (_P64)q->cur_delay);
> +         return 0;
> + }
> +
> +@@ -1783,7 +1783,7 @@ const_ber_parse(struct _qs *q, struct _c
> +                       plr[i] =3D mask;
> + #if 0
> +               if (i>=3D 60) //  && plr[i] < mask/2)
> +-                      RD(50,"%4d: %le %ld", i, 1.0 - cur, (_P64)plr[i])=
;
> ++                      RD(50,"%4d: %le %lld", i, 1.0 - cur, (_P64)plr[i]=
);
> + #endif
> +       }
> +       dst->d[0] =3D ber * (mask + 1);
> +Index: git/apps/pkt-gen/pkt-gen.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- git.orig/apps/pkt-gen/pkt-gen.c
> ++++ git/apps/pkt-gen/pkt-gen.c
> +@@ -1319,7 +1319,7 @@ ping_body(void *data)
> +                                       ts.tv_nsec +=3D 1000000000;
> +                                       ts.tv_sec--;
> +                               }
> +-                              if (0) D("seq %d/%lu delta %d.%09d", seq,=
 sent,
> ++                              if (0) D("seq %d/%llu delta %d.%09d", seq=
, sent,
> +                                       (int)ts.tv_sec, (int)ts.tv_nsec);
> +                               t_cur =3D ts.tv_sec * 1000000000UL + ts.t=
v_nsec;
> +                               if (t_cur < t_min)
> +@@ -1401,7 +1401,7 @@ pong_body(void *data)
> +               return NULL;
> +       }
> +       if (n > 0)
> +-              D("understood ponger %lu but don't know how to do it", n)=
;
> ++              D("understood ponger %llu but don't know how to do it", n=
);
> +       while (!targ->cancel && (n =3D=3D 0 || sent < n)) {
> +               uint32_t txcur, txavail;
> + //#define BUSYWAIT
> diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb =
b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> index 82b9b05..6f05ac7 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
> @@ -13,6 +13,9 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILD=
DIR} \
>                  --kernel-sources=3D${STAGING_KERNEL_DIR} \
>                  --install-mod-path=3D${D} \
>                  --driver-suffix=3D"-netmap" \
> +                --cc=3D'${CC}' \
> +                --ld=3D'${LD}' \
> +                --no-apps \
>                  "
>
>  # The driver builds are optional, but for deterministic builds,
> @@ -85,8 +88,8 @@ do_compile () {
>
>  do_install () {
>      cd ${S}/LINUX
> -    oe_runmake install
> +    oe_runmake install DESTDIR=3D${D}
>  }
>
> -# http://errors.yoctoproject.org/Errors/Details/83335/
> -PNBLACKLIST[netmap-modules] ?=3D "BROKEN: not compatible with default ke=
rnel version 4.8"
> +FILES_${PN}-doc +=3D "${prefix}/local/share"
> +FILES_${PN}-dev +=3D "${prefix}/local/include"
> diff --git a/meta-networking/recipes-kernel/netmap/netmap.inc b/meta-netw=
orking/recipes-kernel/netmap/netmap.inc
> index ab33e76..665c11d 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap.inc
> +++ b/meta-networking/recipes-kernel/netmap/netmap.inc
> @@ -2,15 +2,15 @@ SUMMARY =3D "netmap and VALE - very fast packet I/O fro=
m userspace (FreeBSD/Linux)
>  DESCRIPTION=3D "NETMAP is a framework for very fast packet I/O from user=
space.  VALE is an equally fast in-kernel software switch using the netmap =
API.  Both are implemented as a single kernel module for FreeBSD and Linux,=
 and can deal with line rate on real or emulated 10 Gbit ports."
>  SECTION =3D "networking"
>  HOMEPAGE =3D "http://code.google.com/p/netmap/"
> -LICENSE =3D "GPLv2+"
> +LICENSE =3D "BSD-2-Clause"
>
> -LIC_FILES_CHKSUM =3D "file://README;beginline=3D13;endline=3D14;md5=3D56=
ae0b9c7ba0476ab9098de94c2714d6"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D388c13686fc84f281413c82fa3259=
65f"
>
> -SRCREV =3D "da9e19e69b84e4f6f8ae125f8d01b42a4abade6a"
> +SRCREV =3D "86312f06626f33f150514eaab42a2d2a8432c4ed"
>  PV =3D "master+git${SRCPV}"
>
>  SRC_URI =3D "git://github.com/luigirizzo/netmap.git"
> -SRC_URI +=3D "file://makefile_fixup.patch"
> +SRC_URI +=3D "file://gcc_6_fix.patch"
>
>  S =3D "${WORKDIR}/git"
>
> diff --git a/meta-networking/recipes-kernel/netmap/netmap_git.bb b/meta-n=
etworking/recipes-kernel/netmap/netmap_git.bb
> index 667e7cc..7eb5148 100644
> --- a/meta-networking/recipes-kernel/netmap/netmap_git.bb
> +++ b/meta-networking/recipes-kernel/netmap/netmap_git.bb
> @@ -7,12 +7,10 @@ EXTRA_OECONF =3D "--kernel-dir=3D${STAGING_KERNEL_BUILD=
DIR} \
>                  --kernel-sources=3D${STAGING_KERNEL_DIR} \
>                  --no-drivers \
>                  --disable-generic \
> -                --prefix=3D${prefix} \
>                  --destdir=3D${D} \
>                  --cc=3D'${CC}' \
>                  --ld=3D'${LD}' \
>                  "
> -SRC_URI +=3D "file://0001-testmmap-fix-compile-issue-with-gcc-5.x.patch"
>
>  do_configure () {
>      cd ${S}/LINUX
> @@ -29,9 +27,7 @@ do_install () {
>      make install-apps DESTDIR=3D${D}
>  }
>
> -FILES_${PN} +=3D "${bindir}"
> +FILES_${PN} +=3D "${prefix}/local/bin"
> +FILES_${PN}-doc  +=3D "${prefix}/local/share"
>  RDEPENDS_${PN} =3D "kernel-module-netmap"
>  RRECOMMENDS_${PN} =3D "kernel-module-netmap"
> -
> -# http://errors.yoctoproject.org/Errors/Details/69733/
> -PNBLACKLIST[netmap] ?=3D "BROKEN: Tries to build kernel module and fails=
, either it should be disabled or there should be dependency on kernel like=
 in netmap-modules"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

