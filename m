Return-Path: <patrick.wicki@subset.ch>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80802D72A1F
	for <webhook@archiver.kernel.org>; Fri, 29 Nov 2024 21:39:17 +0000 (UTC)
Received: from qs51p00im-qukt01072701.me.com (qs51p00im-qukt01072701.me.com [17.57.155.16])
 by mx.groups.io with SMTP id smtpd.web10.123494.1732916355623225841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Nov 2024 13:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@subset.ch header.s=sig1 header.b=VkXZKGlB;
 spf=pass (domain: subset.ch, ip: 17.57.155.16, mailfrom: patrick@subset.ch)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=subset.ch; s=sig1;
	t=1732916354; bh=OUwwaFERKKR0IydwoU2FnjjVChDNqzQuzGhWNyGyicw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=VkXZKGlBp7XPBpEBsGiKJ8p3/RPukk88eFLDbvx5APz6L4WD7dC5Qms1PzlAznKNE
	 +guKFbGSwX7nQeC/swfcaZa+h/QhnCt4230N3LrUyaeHKW7uoZWhYiwy2+xFTUoMId
	 PqRZgK2fOuEggDxUNlq0Cnf9CAQGpcYEwsEtHSCRb1df8OAOpDw4NY/Gmjr81ZBEbO
	 CcewEYeu65YTZySMnh3mZlvzsRR2finBHn1Pj0NxaWb23VorNcV5yYv1wvpQFG0e6y
	 KUH5MI/FNjSlDcMI5FNRgVSPB5RqB9iEOPGzcw8Xo21zsj9INMrQ8GeuGZHB5ExJ0A
	 8fh8mk+ZowPdA==
Received: from localhost.localdomain (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
	by qs51p00im-qukt01072701.me.com (Postfix) with ESMTPSA id CE3F315C061E;
	Fri, 29 Nov 2024 21:39:13 +0000 (UTC)
From: patrick@subset.ch
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Wicki <patrick.wicki@siemens.com>
Subject: [meta-oe][PATCH 2/2] fluentbit: use system libs instead of vendored ones
Date: Fri, 29 Nov 2024 22:38:37 +0100
Message-ID: <20241129213837.523955-2-patrick@subset.ch>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241129213837.523955-1-patrick@subset.ch>
References: <20241129213837.523955-1-patrick@subset.ch>
MIME-Version: 1.0
X-Proofpoint-GUID: _3dInhWSxDxTYJhM_GB6AEenz3k9A7m_
X-Proofpoint-ORIG-GUID: _3dInhWSxDxTYJhM_GB6AEenz3k9A7m_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-29_18,2024-11-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0
 clxscore=1030 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2411290174
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Nov 2024 21:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114123

From: Patrick Wicki <patrick.wicki@siemens.com>

Make use of the new build option to unbundle some vendored dependencies.
Currently supported are libbacktrace, c-ares, jemalloc, luajit and
nghttp, all of which have Yocto recipes. librdkafka is currently below
the required version (>=3D2.3.0) so for that it will fall back to the
vendored version.

Signed-off-by: Patrick Wicki <patrick.wicki@siemens.com>
---
 meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb b/meta=
-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
index 54fa9b277..b895c7da0 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_3.2.1.bb
@@ -43,6 +43,7 @@ PACKAGECONFIG ??=3D "\
     ipo \
     metrics \
     parser \
+    prefer-system-libs \
     proxy-go \
     record-accessor \
     regex \
@@ -56,6 +57,12 @@ PACKAGECONFIG ??=3D "\
 # See https://github.com/fluent/fluent-bit/issues/7248#issuecomment-1631=
280496
 PACKAGECONFIG:remove:toolchain-clang =3D "ipo"
=20
+# Use system libs
+PACKAGECONFIG[prefer-system-libs] =3D "-DFLB_PREFER_SYSTEM_LIBS=3DYes,-D=
FLB_PREFER_SYSTEM_LIBS=3DNo, nghttp2 c-ares"
+DEPENDS +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'prefer-system-libs=
 backtrace', 'libbacktrace', '', d)}"
+DEPENDS +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'prefer-system-libs=
 jemalloc', 'jemalloc', '', d)}"
+DEPENDS +=3D " ${@bb.utils.contains('PACKAGECONFIG', 'prefer-system-libs=
 luajit', 'luajit', '', d)}"
+
 PACKAGECONFIG[all] =3D "-DFLB_ALL=3DYes,-DFLB_ALL=3DNo"
 PACKAGECONFIG[arrow] =3D "-DFLB_ARROW=3DYes,-DFLB_ARROW=3DNo"
 PACKAGECONFIG[avro-encoder] =3D "-DFLB_AVRO_ENCODER=3DYes,-DFLB_AVRO_ENC=
ODER=3DNo"
@@ -105,8 +112,8 @@ PACKAGECONFIG[windows-defaults] =3D "-DFLB_WINDOWS_DE=
FAULTS=3DYes,-DFLB_WINDOWS_DEFA
 PACKAGECONFIG[minimal] =3D "-DFLB_MINIMAL=3DYes,-DFLB_MINIMAL=3DNo"
=20
 # Without zstd dependency, kafka plugin build fails at link attempt agai=
nst native libzstd.so
-PACKAGECONFIG[in-kafka] =3D "-DFLB_IN_KAFKA=3DON,-DFLB_IN_KAFKA=3DOFF,li=
brdkafka zstd"
-PACKAGECONFIG[out-kafka] =3D "-DFLB_OUT_KAFKA=3DON,-DFLB_OUT_KAFKA=3DOFF=
,librdkafka zstd"
+PACKAGECONFIG[in-kafka] =3D "-DFLB_IN_KAFKA=3DON,-DFLB_IN_KAFKA=3DOFF,li=
brdkafka zstd curl"
+PACKAGECONFIG[out-kafka] =3D "-DFLB_OUT_KAFKA=3DON,-DFLB_OUT_KAFKA=3DOFF=
,librdkafka zstd curl"
=20
 SYSTEMD_SERVICE:${PN} =3D "fluent-bit.service"
=20
--=20
2.47.1


