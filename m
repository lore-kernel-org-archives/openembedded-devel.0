Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EFCF55458
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 04:59:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39109.1771995564439835453
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 20:59:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aV9zbVIj;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ca7149ml;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OMGt7M2432646
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 04:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gThILxCSo+ZqzboL67MDzveVSy4dlQIpTLOD7N//1Gk=; b=aV9zbVIjImlp25h8
	0u50ELeys0S0aDoejFphT+CjWf0qVQ9EwlgJ+5hjYlFclEZz5JdEEh+2CgRnLV9L
	IdTtBzEQbCOBQvjadEhnBH+ZQfkfeWLGEbDBHM2lOxBzkaykpnidZfizzbxr2Efe
	cn3B9Vnbjkz3Y66nOtvH3f5x03AxlHRsLF8Kc1LR5ZRelRiAZx/gVlyOJu5s7ybU
	39M8BcLaEg5DWFoy9POsQGVP/Qr1iclELCJsn379qpi8yxs7LoQ0pgbx9IeUE/nx
	xpuvfftbK+Ad2l5bjuwt5WXBRZ/DUmMQtwKHUh5Sz0s7P1oi387h/zfYgyYhDOkU
	E6A4Eg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chekjac88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 04:59:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89463017976so618227776d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 20:59:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771995562; cv=none;
        d=google.com; s=arc-20240605;
        b=HZbXuoB+Ua1HVWA815AellpcQFQZIQTP9kSEnQPBbkAD1QCw3nx1dt9vG3DwWmwyGl
         PKYcc+GJXd6xwt0rtY06o5+p7Y8vCcSTbUEFoJzy7UKELkbcVmSIL+/Zseqoc1dpp7Hz
         c8r9EkzFSqkS4XBBOPzXLHsndHmzxBp0FTXo+MzBQXY4Ggp5Egsc2Ed63WSkjFth3SkV
         +GXA0vnb+wsXZW3zXnmDohzYuZCq2UEHqRhL6OMvxf0ltDMRWONYxBlBUkGwqbrgxCd7
         J/6oWgbfzct5zlGMN4yMaY6urNCRuyIn4sEfUfNYxkwjYIhnWt4XDf/EOuNC0oVxI3EI
         6OZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gThILxCSo+ZqzboL67MDzveVSy4dlQIpTLOD7N//1Gk=;
        fh=wdyfhQFKEdUhMLSwWhxJB0pu2ENL3MgbBe5ZJN0nCIo=;
        b=NGAVzD0wYRGpYSAjIbo3DJAgawNKyRkX2uae9OCYWqYLveidX6UolQwxY3wV3EvbHt
         K3RNgSd2znB0I+LmcwJay7fVl/YDg+6dwQLgHrtO/tgmqUSC3p4p9fd5/b7tT0MNzD0B
         FbJjQPotgmjOccJkGEAqIc/k2V8294MUQh+CRcUCoHJoh/Trjpmj4Pk9XzR5qmuSrPlc
         5VOUSqGPsLElsLOfgUvWMKoAE1se/RPaog7V0FZ9zHELm1AF+vbwF9trZEmNE+K5zsOi
         mOhaZRohCuFUsiN7zWqRn7RdVomXdwUxEGA1s+aDzbe8dHM3X/gJphP7OuiB0oKqFqCQ
         RI0g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771995562; x=1772600362; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gThILxCSo+ZqzboL67MDzveVSy4dlQIpTLOD7N//1Gk=;
        b=ca7149mlCZmmncXrVkTKZDoiCv5xkCdYrY7oMKF6/PtuVlI6D0mMS3a+T9rtBw1MMO
         wR0VQEFwRKRW6oVUs88/bDT9I15D9kZA+5h3YfVDdkGCrAvl6dA8+tid5TPRwE0rq5lz
         pbbOJhZzIeRpnXx6TmuL3ic+xl1pZg3m8uGEPvzdugAEDNEh24/c89dsTsHXn10jUhYs
         M6B7CuN98ZyM74749jL2ymJij51M9ATQsv+Hv07Vl1f6UGd3aPsU87H3QLywWuYD0viY
         3In7renjBgmbcC15PwLkjJ4f1mcMtvBiCnwIgjicMAGWHzWWgDmHW85Ajc4kABB18884
         ESDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771995562; x=1772600362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gThILxCSo+ZqzboL67MDzveVSy4dlQIpTLOD7N//1Gk=;
        b=sHioDQMDNoIJ9aHb+xq7gL82WgqjatMC72Ig5cnnLKNRqm6/JLtnYa784uI/j0lFcf
         kn3PSXL7impa/Ul2kQrUIlvj0stwV4XxLmgmtx4dwJXy1VROwVN/HOn7G8WpTzRqxUyw
         hHg3kIebpgsPmCeFY4G+Z6FPPJ25X3mFElIWc+ak+SukLuhbb9TLIJf8IzCcZoP8gIpV
         MSGyxCOnj4mjseJsfNtxmnTQCApEmCUKGsvQocP/3wxvwoipSGv4feH/RsrXNKFyz2uS
         4SxOlnEJbk+jFK7xB+qikP5D0rRdu9deKqVyFH3EA/ZsJ8My81Jg4wOXuZf6/3fsURWA
         CRYQ==
X-Gm-Message-State: AOJu0Yw4EaYhuaVB5HpqrAqAdAaBE8pNWQPbkiex4TbvcEjz1aT5yQQ4
	n7y2VKcxPaSbLH3MvcxTZt67G6iSG2nrjR6yfAi8uvztm1PwlihNvvUbWDnJOC4zntjc22qkxHR
	KMtqx3uX+KDcDNNSsR8l5mAF9jz2lL5IIiIquIJg39ewfmejZQWWurXd1glZFhy51krNUvps1m5
	+Vl9jQjmFbg94urv2cdxyn1Cl2GPH0siBNZq0LKrf+Ap5ygbc1glAp2PYwsBvoNZ7ODCMzAQ==
X-Gm-Gg: ATEYQzyI3JXg5JHjywrekKp3wcIJYiEUOMtxCIqH0KdlbBldIgPd/GvlVSCMU7SoyTK
	jvWE418e4OpLE80rHu1qjU+Iv1C5R6vr3ERqg4yzeUuo6Yym6SH0imyC2/ZVU06/2fX2Li+RA0Z
	kDxDeISt3tU7N9YzGXsy4uB6KQLsowSYuf/UCTKWN9O75wePVvbAsP/uqQYJdpkKCQeEVGSupLP
	a1T
X-Received: by 2002:a05:6214:5295:b0:894:2cb3:d11f with SMTP id 6a1803df08f44-899b897517bmr14219026d6.18.1771995561605;
        Tue, 24 Feb 2026 20:59:21 -0800 (PST)
X-Received: by 2002:a05:6214:5295:b0:894:2cb3:d11f with SMTP id
 6a1803df08f44-899b897517bmr14218806d6.18.1771995561031; Tue, 24 Feb 2026
 20:59:21 -0800 (PST)
MIME-Version: 1.0
References: <20260223140204.808434-1-daniel.klauer@gin.de>
In-Reply-To: <20260223140204.808434-1-daniel.klauer@gin.de>
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:59:09 +0800
X-Gm-Features: AaiRm53Gsrw-0K5RL9RUsF7N0KUUptOo3UESgWl2tDsWHEyZrX3XXeb6gXLCnTs
Message-ID: <CA+s=J=y+U0D51q_6n9FHMKXLb7m4Ub62cAG7ArHe+vzsCnaAvQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][scarthgap][PATCH] nbench-byte: Fix sysinfo
 generation in parallel build
To: daniel.klauer@gin.de
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=699e81aa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=mDV3o1hIAAAA:8 a=sC37DgyHAAAA:8 a=Q4-j1AaZAAAA:8
 a=EUspDBNiAAAA:8 a=l5Ng3RPLJl9RK3BYgM4A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=NJKfJZhtuoG9hi9TxVfU:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: aHqpRsWTIeFL4jcPlfAjYj7EEqarV4yQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA0NiBTYWx0ZWRfX8b6JhV0MqTaT
 XofVfMBitoxTxKyRUe+E7rRry4+AlEzDuFadYQCMQ4rWabzROHIafLGBg9IL6qlRoIJHNh2A+x+
 +3nVzGK9b8+l19PsIOqkMkctsMDxR43iiHq3YMwmDRah74TUjEcGvyV/LdXXEZGCTMEtstuQxb2
 IgzKi3ht7ECBKZZn0rEK3F6v92A94fZVz6+3BmtFS6VKqqMHgbinJ4Z8EwQss3nAkHGwVPM2aU5
 TZ56WQCZp2eH6SWhMguHF9WRLELT3aFbQ45rKElBZGa3JiVTk1bISQs9mCGF5n7n/avMAMS4ra9
 wKlvx/Y3F3BkDaFzxApopd01Bha2yufgqKTlwTL3th8vg1VMRAY2kEwiUkyUq5nqdDinm5nookz
 aGZ9efKU5m5byUdsw+0v9uhjUHbk9kTpzloqGOz8C6RpuY4lrOngDVb8nzLdG8Wc36CiMFhoDs5
 ZJcLtzUgcP5s/2EBf6A==
X-Proofpoint-GUID: aHqpRsWTIeFL4jcPlfAjYj7EEqarV4yQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250046
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 04:59:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124605

Thank you, I've cherry-picked this from master. Would you please send
a cherry-pick for whinlatter as well so it's not missed there?

On Mon, Feb 23, 2026 at 10:02=E2=80=AFPM Daniel Klauer via
lists.openembedded.org <daniel.klauer=3Dgin.de@lists.openembedded.org>
wrote:
>
> The project Makefile uses a script (sysinfo.sh) to non-atomically generat=
e
> two .c files (sysinfo.c, sysinfoc.c) which are then included in the build=
.
> Since the script always overwrites both .c files, the Makefile should onl=
y
> invoke it once, not twice in parallel. Otherwise the .c files may be
> corrupted and cause random build failures in parallel builds.
>
> Requires at least GNU make 4.3, for Grouped Targets support [1].
>
> [1] https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00004.html
>
> Reviewed-by: Silvio Fricke <silvio.fricke@gin.de>
> Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
> ---
>  ...sysinfo-generation-in-parallel-build.patch | 69 +++++++++++++++++++
>  .../sysinfo.sh-Fix-typo-in-rm-command.patch   | 27 ++++++++
>  .../nbench-byte/nbench-byte_2.2.3.bb          |  4 +-
>  3 files changed, 99 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Mak=
efile-Fix-sysinfo-generation-in-parallel-build.patch
>  create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sys=
info.sh-Fix-typo-in-rm-command.patch
>
> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-F=
ix-sysinfo-generation-in-parallel-build.patch b/meta-oe/recipes-benchmark/n=
bench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.pa=
tch
> new file mode 100644
> index 0000000000..b5f60b1c87
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysi=
nfo-generation-in-parallel-build.patch
> @@ -0,0 +1,69 @@
> +From 26e13ce45ffeb2f233d1dd7e4321cb65ab10b0fb Mon Sep 17 00:00:00 2001
> +From: Daniel Klauer <daniel.klauer@gin.de>
> +Date: Fri, 6 Feb 2026 17:13:49 +0100
> +Subject: [PATCH] Makefile: Fix sysinfo generation in parallel build
> +
> +sysinfo.sh non-atomically overwrites both sysinfo.c and sysinfoc.c,
> +so it should only be invoked once, not twice in parallel.
> +
> +Requires at least GNU make 4.3, for Grouped Targets support [1].
> +
> +Should fix random build failures like this one:
> +
> +| NOTE: make -j 20 -e MAKEFLAGS=3D
> +[...]
> +| ./sysinfo.sh x86_64-gin-linux-gcc [...]
> +| ./sysinfo.sh x86_64-gin-linux-gcc [...]
> +[...]
> +| x86_64-gin-linux-gcc [...] \
> +|      -c nbench0.c
> +| In file included from nbench0.c:219:
> +| sysinfo.c: In function 'main':
> +| sysinfo.c:11:1: error: 'fer' undeclared (first use in this function)
> +|    11 | fer);
> +|       | ^~~
> +| sysinfo.c:11:1: note: each undeclared identifier is reported only once=
 for each function it appears in
> +| sysinfo.c:11:4: error: expected ';' before ')' token
> +|    11 | fer);
> +|       |    ^
> +|       |    ;
> +| sysinfo.c:11:4: error: expected statement before ')' token
> +| In file included from nbench0.c:317:
> +| sysinfoc.c:5:4: error: expected ';' before ')' token
> +|     5 | fer);
> +|       |    ^
> +|       |    ;
> +| sysinfoc.c:5:4: error: expected statement before ')' token
> +| make: *** [Makefile:115: nbench0.o] Error 1
> +| make: *** Waiting for unfinished jobs....
> +| ERROR: oe_runmake failed
> +| WARNING: exit code 1 from a shell command.
> +NOTE: recipe nbench-byte-2.2.3-r0: task do_compile: Failed
> +
> +[1] https://lists.gnu.org/archive/html/info-gnu/2020-01/msg00004.html
> +Upstream-Status: Inactive-Upstream [lastrelease 2003, no vcs]
> +Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
> +---
> + Makefile | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index edd9ea2..66b2ddc 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -95,10 +95,8 @@ DEFINES=3D -DLINUX $(NO_UNAME)
> +
> + #######################################################################=
###
> + # For LINUX-like systems with gcc
> +-sysinfoc.c: Makefile
> +-      ./sysinfo.sh $(CC) $(MACHINE) $(DEFINES) $(CFLAGS)
> +-
> +-sysinfo.c: Makefile
> ++# sysinfo.sh generates both sysinfo.c and sysinfoc.c
> ++sysinfo.c sysinfoc.c &: Makefile
> +       ./sysinfo.sh $(CC) $(MACHINE) $(DEFINES) $(CFLAGS)
> +
> + #######################################################################=
###
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh=
-Fix-typo-in-rm-command.patch b/meta-oe/recipes-benchmark/nbench-byte/nbenc=
h-byte/sysinfo.sh-Fix-typo-in-rm-command.patch
> new file mode 100644
> index 0000000000..c6a37c3e56
> --- /dev/null
> +++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-ty=
po-in-rm-command.patch
> @@ -0,0 +1,27 @@
> +From 0019af6eb5188f5111a0f2008c0002b545382b67 Mon Sep 17 00:00:00 2001
> +From: Daniel Klauer <daniel.klauer@gin.de>
> +Date: Fri, 6 Feb 2026 17:14:53 +0100
> +Subject: [PATCH] sysinfo.sh: Fix typo in rm command
> +
> +Upstream-Status: Inactive-Upstream [lastrelease 2003, no vcs]
> +Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
> +---
> + sysinfo.sh | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/sysinfo.sh b/sysinfo.sh
> +index 57754fe..1373699 100755
> +--- a/sysinfo.sh
> ++++ b/sysinfo.sh
> +@@ -61,7 +61,7 @@ if ($* hello.c -o hello) >/dev/null 2>&1; then
> +   fi
> + fi
> +
> +-rm -f sysinfo.crm sysinfoc.c hello
> ++rm -f sysinfo.c sysinfoc.c hello
> +
> + # this bombs out on Ultrix which expect "cut -d"
> +
> +--
> +2.43.0
> +
> diff --git a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb b=
/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> index b4d55be1b0..2f53890aa0 100644
> --- a/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> +++ b/meta-oe/recipes-benchmark/nbench-byte/nbench-byte_2.2.3.bb
> @@ -9,7 +9,9 @@ SECTION =3D "console/utils"
>
>  SRC_URI =3D "https://fossies.org/linux/misc/old/${BP}.tar.gz \
>             file://nbench_32bits.patch \
> -           file://Makefile-add-more-dependencies-to-pointer.h.patch"
> +           file://Makefile-add-more-dependencies-to-pointer.h.patch \
> +           file://Makefile-Fix-sysinfo-generation-in-parallel-build.patc=
h \
> +           file://sysinfo.sh-Fix-typo-in-rm-command.patch"
>
>  SRC_URI[md5sum] =3D "285dfab361080759d477ea1fe7d3093a"
>  SRC_URI[sha256sum] =3D "723dd073f80e9969639eb577d2af4b540fc29716b6eafdac=
488d8f5aed9101ac"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124548): https://lists.openembedded.org/g/openembedde=
d-devel/message/124548
> Mute This Topic: https://lists.openembedded.org/mt/117957011/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
nuj.mittal@oss.qualcomm.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

