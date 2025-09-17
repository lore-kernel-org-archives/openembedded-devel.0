Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D274CA0EE8
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 05:35:10 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15575.1758087296450584849
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 22:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oCV5lI2y;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13552fbee1=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58H3eMfP3666639
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 22:34:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9n45F23ZVf7J+95Kpjcr
	iBxinTWh1wGWkhL9ofXwiPQ=; b=oCV5lI2yGai6GP/B3hsg04C2N9Gh7jxXYGIO
	FXDM5RfRG6IArtTnmmV6PtiI6J3859vJgmQ0hDHznoVwntGxwmmeySpTwuxU610l
	3PivqMiSDofj9uAHSaHx//sNE2FrSHan9qSO8qoCIX7W33gi0ve3r80mqEOh4w/v
	Usi4wlQQ9ZWtMQ+6+XjRVOOPdLP1e9oN9B1RX0eNDXAkaOCR0wcTgFqFZ9L5qYcM
	vDACCL3HQTup/rpyd4AcASYFGM88gQ+wkwyVq7q/qD0KamaWixPRH5LovAOKj/Rg
	z4uF+Vvnh6R3fXEFTMfjjCBI7sIRmVrRb/1YYYA2KSVUnmbj5g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr092v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 22:34:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Tue, 16 Sep 2025 22:34:54 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.59 via Frontend Transport; Tue, 16 Sep 2025 22:34:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] pahole: fix a Segmentation fault error
Date: Wed, 17 Sep 2025 13:34:53 +0800
Message-ID: <20250917053453.240604-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Jay8rVKV c=1 sm=1 tr=0 ts=68ca487f cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8
 a=yPCof4ZbAAAA:8 a=A3996BbDtkUT-4H0xFYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDA1MiBTYWx0ZWRfX9CNHDvXZzKyF
 FyLIid1nb1gaVF95NmsJzT3HHlIvUvm+zudT569mtKR7xBzo3BMmOmtpNxBeXYO8lIZx4ooSwGg
 qytSN8aJFUx5b0Fk4gd6tRxawN2Vy625mD6fVnrfHSQS8ppFHZvsr05nmQJfYlZWURGQeyvn6Z1
 EJKoxDOGK+nBVv96UbutGR4c1Lc/WDSkyTgnCrK1Asp84TwHLid8i0jyCaxmYR6Tw+7RuO8MoCn
 BnqJ/eYqeJVLQAU1N80NoSOx4zjrq9vjTpubqr3cTRRcY6RBtigccN3YGfL0QV4SQIGKX3feryN
 dQXDGMQ0I4aOyrihgoi4900UtFjf1kWb21G7g2WxdkqCnjRGdcRpXyl+LjKF+M=
X-Proofpoint-GUID: cY5qf0l_LzuwM-lkPfS5KRRRSz_M3lQe
X-Proofpoint-ORIG-GUID: cY5qf0l_LzuwM-lkPfS5KRRRSz_M3lQe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 05:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119477

From: Changqing Li <changqing.li@windriver.com>

Command "pahole --btf_features=default -J" will segmentation fault when
kernel-dbg package is also installed.

$pahole --btf_features=default -J
pahole[599]: segfault at 8 ip 00007f7c92d819e2 sp 00007f7c799febe0
error 6 in libdwarves.so.1.0.0[189e2,7f7c92d72000+1c000] likely on CPU 0
(core 0, socket 0)
Code: 74 19 ff ff 48 39 dd 75 ef 4c 89 ef e8 67 19 ff ff 49 8b 7c 24 18
e8 8d 13 ff ff 49 8b 14 24 49 8b 44 24 08 4c 89 e7 45 31 e4 <48> 89 42
08 48 89 10 e8 42 19 ff ff e9 30 ff ff ff e8 58 0a ff ff
Segmentation fault (core dumped)

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...r-Fix-elf_functions-cleanup-on-error.patch | 54 +++++++++++++++++++
 .../recipes-devtools/pahole/pahole_1.29.bb    |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch

diff --git a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
new file mode 100644
index 0000000000..dad5a9646a
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
@@ -0,0 +1,54 @@
+From 6fa2b7de3e647e64c5d693aea7f3bacbfa964f53 Mon Sep 17 00:00:00 2001
+From: Ihor Solodari <ihor.solodrai@linux.dev>
+Date: Wed, 20 Aug 2025 09:00:03 +0100
+Subject: [PATCH] btf_encoder: Fix elf_functions cleanup on error
+
+When elf_functions__new() errors out and jumps to
+elf_functions__delete(), pahole segfaults on attempt to list_del() the
+elf_functions instance from a list, to which it was never added.
+
+Fix this by moving list_del() call out of elf_functions__delete().
+Remove from the list only on normal cleanup in
+elf_functions_list__clear().
+
+v1:
+https://lore.kernel.org/dwarves/979a1ac4-21d3-4384-8ce4-d10f41887088@linux.dev/
+
+Closes:
+https://lore.kernel.org/dwarves/24bcc853-533c-42ab-bc37-0c13e0baa217@windriver.com/
+Reported-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
+Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Link: https://lore.kernel.org/dwarves/acef4a0e-7d3b-4e05-b3ca-1007580f2754@linux.dev/
+Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?h=next&id=fe6738f4b46b63dcdc5b15b252a014b3eaba16a4]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ btf_encoder.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/btf_encoder.c b/btf_encoder.c
+index 511c1ea..2f8c6bb 100644
+--- a/btf_encoder.c
++++ b/btf_encoder.c
+@@ -162,7 +162,6 @@ static inline void elf_functions__delete(struct elf_functions *funcs)
+ 		free(funcs->entries[i].alias);
+ 	free(funcs->entries);
+ 	elf_symtab__delete(funcs->symtab);
+-	list_del(&funcs->node);
+ 	free(funcs);
+ }
+ 
+@@ -204,6 +203,7 @@ static inline void elf_functions_list__clear(struct list_head *elf_functions_lis
+ 
+ 	list_for_each_safe(pos, tmp, elf_functions_list) {
+ 		funcs = list_entry(pos, struct elf_functions, node);
++		list_del(&funcs->node);
+ 		elf_functions__delete(funcs);
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
index aca915bf32..4f2737767b 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
@@ -11,7 +11,8 @@ COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-
 
 SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
 SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
-           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch"
+           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
+           file://0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch"
 
 
 inherit cmake pkgconfig
-- 
2.34.1


