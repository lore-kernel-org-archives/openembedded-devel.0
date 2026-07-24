Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BEA3C531D0
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 01:08:05 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10434.1784855277187112304
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2026 18:07:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@qualcomm.com header.s=qcppdkim1 header.b=IIDnTljV;
 dkim=fail reason="dkim: body hash did not verify" header.i=@oss.qualcomm.com header.s=google header.b=C+K44wZA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NLeZOq1237342
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySq2rMXdCqXfJ2Ci4S3LhewsOg3F+ht58O91MUDVOLM=; b=IIDnTljVRkCe7fF0
	SIRIwRSAgDGhtAvEMLZCKxFbsPSVFu7Ehvvt2JvKKuFVQHnU1cvKvRgI1izoZE3a
	S3yU4McROqcXgDmUAdicpesbBFpTfiVzoX9MbdNDc9N3y8GjZvvCMgjW3TAleLQr
	vofTqRR0pfig/RitxCqOpkhhnV/3R+sKYCEV7u0iQ+Zl5ce3tDnR7biHJueyrA9M
	DU8umHMVd66YWRAjYmP0Ycny091otfE7hDf3DTb+4xQ0VZB+u1bucMrvN9k5Nkfr
	mZZonKVY9EZgGY3uEcC6ZjkD4n1fLmUQ81IX8TrQiUEUSY0kHRFOxyFCMoyAyyVS
	jb1+pg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vhuyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:07:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso1752893a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2026 18:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784855275; x=1785460075; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySq2rMXdCqXfJ2Ci4S3LhewsOg3F+ht58O91MUDVOLM=;
        b=C+K44wZAytu6Hfqm+PpP1KZ6BFa1Dxh8sT73e4MgJTe+u4p+Ddg86LMnykVlcUtcQ1
         tG64GiOZwFp9sirJznIfkUjGDObCq/qT+WdWfBYzlIDvzMjA+LCZg9qJHSi+Bgm3YSqW
         BPgivRwt4OGwyaUXbbYxo3yI4sYKqZH+6ZyWP3Im+PCmo/EffRajZ12IVVC+CR+49suJ
         FVMC+kAuweqioSpE9qvmlxUDD3KkwiSeSRbjL5ZAx22FwYraIaQ6v5bQimJSYaVCiP5N
         75RlYFqolSRhTpV17W8LPg9lex/fRzNJ6CN0TZ2f98XQOdh3jpEzVQFqDZTcn1++FFeC
         CFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784855275; x=1785460075;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySq2rMXdCqXfJ2Ci4S3LhewsOg3F+ht58O91MUDVOLM=;
        b=MSf7WBiXuFZE1ir+KbqtxdHNOcAtdtw0WeTJgRLyxBbSJTzXSZ3+4TCZAANHhFwANb
         GN5csXuctHvQhBXqb4Xw5QLiT0+1YfvTmEWRfqLyk36kl/6QOUar+GVGgO7fM8mgBiEz
         OikN3oPleHXrugwBbVT56ewhYZxb6C1zwdA/FDuHCGCiPLqANFbbt/BFBNnxVy7u4dy1
         3pMBdSgdLsSI8Wxsmsemg9u7J+D/4YUOq6+t2h05iUqcjOWh/AvT10OFTpXuruzyuc7v
         Zj3t4KAOk83p2jTKjCulAr8m6hxzON6T7u07nocgT+1rIWTQ+ONsTRTjusgjo4mkEHG0
         OEQQ==
X-Gm-Message-State: AOJu0YxmIXOWCh6Fa0POOxeZ7YhxvRsZ9Z3TEHGS2Uy5LxvCf7mazQ10
	KVBS6nrcBS2b2LKFhws9UP33eMT9oe2q+NA8nxh/lHY5+AJAt+q2BjAp4rR3KCacoqznnrvprrl
	8kMj9xmI0Eh9pRwIcvG2+N07GFzsohTUOQdiqVB5wosp8PxolLjCVQTn32If/8qXMiIeTpoYf1n
	BS73AMkSYitODSVgunVbw/xQ==
X-Gm-Gg: AR+sD10p082BxcRf1xVKIJLWj4NChZcJwa+ce2JJrTkOSiBVYRG+53dcRmsmtql196a
	JID+/p1Gzq8+xG4sf3aqjfdYNF6/T2l64fN+2fwEISujZfJNIxBTegFpo6+qRxy/EBjww4cIpAn
	cVLvU5RUqeFK6gJ85ujTWVRaWwnE5/9Kdxxk5tJYd27J9VA59AWkgN8Vk/opAE8aml9Ew2Gag6p
	y+CeJzHLhwzQlsllY4SEB26lO6m6DqCW3MfyVtj+gyO9nsHINjnYkhuuYTbGqNynNyvQ20p3qGq
	E3Wz48mquQDcqqoleNmgAMPKl/M5YBBThDYEYwiICGtRSF7GAyU07upbXbyyBooE990GhRk/vKu
	sVj2RN+ecTTGntMZxUY/GSj2ZUKCMNyc=
X-Received: by 2002:a05:6a21:683:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3c44afe7510mr6040958637.21.1784855274784;
        Thu, 23 Jul 2026 18:07:54 -0700 (PDT)
X-Received: by 2002:a05:6a21:683:b0:3c4:397a:69b8 with SMTP id adf61e73a8af0-3c44afe7510mr6040923637.21.1784855274370;
        Thu, 23 Jul 2026 18:07:54 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm44906934eec.21.2026.07.23.18.07.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 18:07:54 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 2/4] bpftool-native: Fix -Wdiscarded-qualifiers errors for glibc 2.42+
Date: Fri, 24 Jul 2026 06:37:44 +0530
Message-ID: <20260724010746.2638347-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260724010746.2638347-1-anuj.mittal@oss.qualcomm.com>
References: <20260724010746.2638347-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX/s1pEiMDYKKF
 qcCOh3xfvapDjewdhe6NopFZ019cYIHwTSYaJFJOY+drbIbcYpkJfD2Pv6hhR5MCalJfRQv1OJk
 3wqyOcUFMFfQ4x9YMQDTyRsSDn9y/7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDAwNyBTYWx0ZWRfX5yLRhlagHLQf
 UM4XkYAY+9VPO6fCCE8yYWrV6LYCGeuypXGKU7XRfKW2XsLub91Il05uC2yfCDNG6wAYLcyXy4t
 00gfFnqNaXhWoS1cbdXgMID4p7cyDpPYcorCTroYJy7shvHjshLV4tDlZcm7hXjCbtSLIW1TRK/
 VVKTtOCQ9pmHap55Q0pxam5KkIAt2yAd4grvqUvo6mJrC0IXrPualuy2mddVdCAOcjnUYA2Gntq
 57zfaaJ7b6PYRtRDd3esREi1tXxAKkLV6/PA8brrGs9AYoLP5SDxpTip2/TKfxuiN9ZRXOPr99T
 4KwSqYErVLheT/9MRuxuPl5JZ4CzuINvI9PlEvHI9Lx4JYrhCbktv/ZsvFoQbGUrbuM625b3QHa
 tNnaaJ677yHyiyY2nOR5OTNmE+Qa4NCicyU/uAxDYz8qySi4TM3P64AB7S+AAmLfUuEKIrB0JYc
 Dr7RMQwmynozAjw63AA==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a62baeb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8
 a=20KFwNOVAAAA:8 a=iox4zFpeAAAA:8 a=ag1SF4gXAAAA:8 a=U-vipH0GeQgctoQbMLAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: 7Q0LnunnQB1mGPRcUCBuUvVywGcJ2HcN
X-Proofpoint-ORIG-GUID: 7Q0LnunnQB1mGPRcUCBuUvVywGcJ2HcN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_07,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240007
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0031df01.pphosted.com id 66NLeZOq1237342
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Jul 2026 01:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128420

From: He Zhe <zhe.he@windriver.com>

Backport a patch from kernel to fix the following build errors.

bbpf.c: In function =E2=80=98kallsyms_cb=E2=80=99:
| libbpf.c:8192:13: error: assignment discards =E2=80=98const=E2=80=99 qu=
alifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
|  8192 |         res =3D strstr(sym_name, ".llvm.");
|       |             ^
| libbpf.c: In function =E2=80=98avail_kallsyms_cb=E2=80=99:
| libbpf.c:11497:31: error: assignment discards =E2=80=98const=E2=80=99 q=
ualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
| 11497 |                 if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
|       |                               ^
| libbpf.c: In function =E2=80=98resolve_full_path=E2=80=99:
| libbpf.c:12085:35: error: assignment discards =E2=80=98const=E2=80=99 q=
ualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
| 12085 |                         next_path =3D strchr(s, ':');
|       |

Signed-off-by: He Zhe <zhe.he@windriver.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 0a3798eaed3f45a93463414c0f4752b54e8978de)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../bpftool/bpftool-native_6.16.bb            |  5 +-
 ...-Fix-Wdiscarded-qualifiers-under-C23.patch | 69 +++++++++++++++++++
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fi=
x-Wdiscarded-qualifiers-under-C23.patch

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb b/meta=
-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
index fe3ad6138e..edc635517a 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool-native_6.16.bb
@@ -9,7 +9,10 @@ DEPENDS =3D "binutils-native elfutils-native"
=20
 inherit native bash-completion
=20
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz"
+SRC_URI =3D "\
+    ${KERNELORG_MIRROR}/linux/kernel/v6.x/linux-${PV}.tar.xz \
+    file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch \
+"
 SRC_URI[sha256sum] =3D "1a4be2fe6b5246aa4ac8987a8a4af34c42a8dd7d08b46ab4=
8516bcc1befbcd83"
=20
 S =3D "${UNPACKDIR}/linux-${PV}"
diff --git a/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdisc=
arded-qualifiers-under-C23.patch b/meta-oe/recipes-kernel/bpftool/bpftool=
/0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch
new file mode 100644
index 0000000000..4726727c3d
--- /dev/null
+++ b/meta-oe/recipes-kernel/bpftool/bpftool/0001-libbpf-Fix-Wdiscarded-q=
ualifiers-under-C23.patch
@@ -0,0 +1,69 @@
+From ab21cf885fb2af179c44d8beeabd716133b9385d Mon Sep 17 00:00:00 2001
+From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Date: Sat, 6 Dec 2025 14:28:25 +0500
+Subject: [PATCH] libbpf: Fix -Wdiscarded-qualifiers under C23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+commit d70f79fef65810faf64dbae1f3a1b5623cdb2345 upstream.
+
+glibc =E2=89=A5 2.42 (GCC 15) defaults to -std=3Dgnu23, which promotes
+-Wdiscarded-qualifiers to an error.
+
+In C23, strstr() and strchr() return "const char *".
+
+Change variable types to const char * where the pointers are never
+modified (res, sym_sfx, next_path).
+
+Suggested-by: Florian Weimer <fweimer@redhat.com>
+Suggested-by: Andrii Nakryiko <andrii@kernel.org>
+Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
+Link: https://lore.kernel.org/r/20251206092825.1471385-1-mikhail.v.gavri=
lov@gmail.com
+Signed-off-by: Alexei Starovoitov <ast@kernel.org>
+[ shung-hsi.yu: needed to fix kernel build failure due to libbpf since g=
libc
+  2.43+ (which adds 'const' qualifier to strstr) ]
+Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/g=
it/stable/linux.git/commit/?h=3Dlinux-6.18.y&id=3Dab21cf885fb2af179c44d8b=
eeabd716133b9385d]
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ tools/lib/bpf/libbpf.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
+index dd3b2f57082d..9c98c6adb6d0 100644
+--- a/tools/lib/bpf/libbpf.c
++++ b/tools/lib/bpf/libbpf.c
+@@ -8245,7 +8245,7 @@ static int kallsyms_cb(unsigned long long sym_addr=
, char sym_type,
+ 	struct bpf_object *obj =3D ctx;
+ 	const struct btf_type *t;
+ 	struct extern_desc *ext;
+-	char *res;
++	const char *res;
+=20
+ 	res =3D strstr(sym_name, ".llvm.");
+ 	if (sym_type =3D=3D 'd' && res)
+@@ -11574,7 +11574,8 @@ static int avail_kallsyms_cb(unsigned long long =
sym_addr, char sym_type,
+ 		 *
+ 		 *   [0] fb6a421fb615 ("kallsyms: Match symbols exactly with CONFIG_L=
TO_CLANG")
+ 		 */
+-		char sym_trim[256], *psym_trim =3D sym_trim, *sym_sfx;
++		char sym_trim[256], *psym_trim =3D sym_trim;
++		const char *sym_sfx;
+=20
+ 		if (!(sym_sfx =3D strstr(sym_name, ".llvm.")))
+ 			return 0;
+@@ -12159,7 +12160,7 @@ static int resolve_full_path(const char *file, c=
har *result, size_t result_sz)
+ 		if (!search_paths[i])
+ 			continue;
+ 		for (s =3D search_paths[i]; s !=3D NULL; s =3D strchr(s, ':')) {
+-			char *next_path;
++			const char *next_path;
+ 			int seg_len;
+=20
+ 			if (s[0] =3D=3D ':')
+--=20
+2.34.1
+
--=20
2.54.0


