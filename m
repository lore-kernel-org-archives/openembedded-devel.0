Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F2CC00140
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 02:57:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11198.1660618615919573534
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 19:56:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com
 header.s=pps06212021 header.b=f6HEPdCE;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5227603c90=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27G2mcGr019910
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 19:56:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=PPS06212021;
 bh=rCI6RZP/8DpSvKgxyRTFKVDlG75zcT07ZBqoTcWlRhU=;
 b=f6HEPdCEuxx1kgtIKXfKy6Higr5msOpxhVQvrDAQpZcB/BSaKHxfxnTPG611B+BTs6rp
 wYOtNW6PjK+otAN/Ry651JBVfXRHz9s3qCJYE0fSa/1xmrAIVPRIHxcJjYQLIoR83r53
 hEFXCkHxOYTn31vVefPOYoxsq2yHpitq5QHTE0NxvYXt+qDpdzDXkKatFTP21eEXA3xf
 422tSxGkDKVSezF4+gqG4p1sm00UXrd+gy9PZJ/+ujeGPqjF8egqZytKSgfoi5s4p/mu
 KXVOl0K7PE1UkAkUYsu5bdDhCqFPc7Z1qRsg28638huQG72p2cV3tT8/CGACJCD8rQrC rQ==
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com
 [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hx783a369-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Aug 2022 19:56:54 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 15 Aug 2022 19:56:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 15 Aug 2022 19:56:53 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Mon, 15 Aug 2022 19:56:53 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-filesystems][PATCH] fuse3: fix ptest
 test_passthrough_hp failure
Date: Tue, 16 Aug 2022 10:56:52 +0800
Message-ID: <20220816025652.1860171-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 4UyUIVcDWLlQmNoclCUR538hvrAoRNzq
X-Proofpoint-GUID: 4UyUIVcDWLlQmNoclCUR538hvrAoRNzq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-15_08,2022-08-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=867 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208160011
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0a-0064b401.pphosted.com id 27G2mcGr019910
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Aug 2022 02:57:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98260

From: Changqing Li <changqing.li@windriver.com>

fix test_passthrough_hp failure with error:
21 unlinked testfile checks failed

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...lls.c-allow-EBADF-in-fcheck_stat-631.patch | 45 +++++++++++++++++++
 .../recipes-support/fuse/fuse3_3.10.5.bb      |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-filesystems/recipes-support/fuse/fuse3/0001-test=
-test_syscalls.c-allow-EBADF-in-fcheck_stat-631.patch

diff --git a/meta-filesystems/recipes-support/fuse/fuse3/0001-test-test_s=
yscalls.c-allow-EBADF-in-fcheck_stat-631.patch b/meta-filesystems/recipes=
-support/fuse/fuse3/0001-test-test_syscalls.c-allow-EBADF-in-fcheck_stat-=
631.patch
new file mode 100644
index 0000000000..2207408bd2
--- /dev/null
+++ b/meta-filesystems/recipes-support/fuse/fuse3/0001-test-test_syscalls=
.c-allow-EBADF-in-fcheck_stat-631.patch
@@ -0,0 +1,45 @@
+From cee6de8d6619aeeb70f3318dfd35f2fdf5e43848 Mon Sep 17 00:00:00 2001
+From: Luis Henriques <luis-henrix@users.noreply.github.com>
+Date: Sat, 20 Nov 2021 10:09:25 +0000
+Subject: [PATCH] test/test_syscalls.c: allow EBADF in fcheck_stat() (#63=
1)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Test test/test_examples.py::test_passthrough_hp[False] fails because, on
+kernels >=3D 5.14, fstat() will return -EBADF:
+
+3 [check_unlinked_testfile] fcheck_stat() - fstat: Bad file descriptor
+4 [check_unlinked_testfile] fcheck_stat() - fstat: Bad file descriptor
+5 [check_unlinked_testfile] fcheck_stat() - fstat: Bad file descriptor
+9 [check_unlinked_testfile] fcheck_stat() - fstat: Bad file descriptor
+...
+
+This patch simply whitelists the EBADF errno code.
+
+Signed-off-by: Lu=C3=ADs Henriques <lhenriques@suse.de>
+Co-authored-by: Lu=C3=ADs Henriques <lhenriques@suse.de>
+
+Upstream-Status: Backport [https://github.com/libfuse/libfuse/commit/cee=
6de8d6619aeeb70f3318dfd35f2fdf5e43848]
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ test/test_syscalls.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/test/test_syscalls.c b/test/test_syscalls.c
+index 160a2ac..65292ed 100644
+--- a/test/test_syscalls.c
++++ b/test/test_syscalls.c
+@@ -277,7 +277,8 @@ static int fcheck_stat(int fd, int flags, struct sta=
t *st)
+ 		if (flags & O_PATH) {
+ 			// With O_PATH fd, the server does not have to keep
+ 			// the inode alive so FUSE inode may be stale or bad
+-			if (errno =3D=3D ESTALE || errno =3D=3D EIO || errno =3D=3D ENOENT)
++			if (errno =3D=3D ESTALE || errno =3D=3D EIO ||
++			    errno =3D=3D ENOENT || errno =3D=3D EBADF)
+ 				return 0;
+ 		}
+ 		PERROR("fstat");
+--=20
+2.25.1
+
diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb b/meta=
-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
index 8b0d8ecab8..0f379afb92 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.10.5.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM =3D "file://GPL2.txt;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263 \
                     file://LICENSE;md5=3Da55c12a2d7d742ecb41ca9ae0a6ddc6=
6"
=20
 SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.xz \
+           file://0001-test-test_syscalls.c-allow-EBADF-in-fcheck_stat-6=
31.patch \
 "
 SRC_URI[sha256sum] =3D "b2e283485d47404ac896dd0bb7f7ba81e1470838e677e45f=
659804c3a3b69666"
=20
--=20
2.25.1


