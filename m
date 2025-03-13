Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6C0DC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 14:25:01 +0000 (UTC)
Received: from mta-03.yadro.com (mta-03.yadro.com [89.207.88.253])
 by mx.groups.io with SMTP id smtpd.web10.15976.1741875339933045882
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 07:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=MAAvgRZe;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=ODDFlynN;
 spf=pass (domain: yadro.com, ip: 89.207.88.253, mailfrom: d.makhnin@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-03.yadro.com 55685E0010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1741875337; bh=STjL5FsrX5yBm7Czw7VKg9zbmD/tdNim/aUfNdyIbD4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=MAAvgRZem1tsTsa9KQGWKhEbtaYBLXVUhhzawpwOxmE+mdAgO2em994t4OSveQQyI
	 NtLvUluA40ZfpUKqjWdlR4O+YGYNH9xlkxI7dmAE9VdBrgCyKSv92rRPEXX5GAZ+yd
	 PoRijpxuZxZHUuivyF4CHwzB15UFYtq2LBM9MoKmjy8t3HWa/4XHdsj9Xg0yQ6xCdW
	 enl65LM5Kw1mFtGeO5ahwX+lytPIKsndjBDfpO4CPwxBNwcuxBhymY6MdwB46CkOhy
	 cDKhtc6dKtal9WPB4/Dz3Gb64/ad7N7BmuXJxLf/vAsBFJ+ZSYVCEopB2smbKZuU9e
	 kbODSOKEJrGMg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1741875337; bh=STjL5FsrX5yBm7Czw7VKg9zbmD/tdNim/aUfNdyIbD4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=ODDFlynNc+hliXWNO29zpO6cdy6uTu72VCxCLzzF0dY+RGe3yVGlXh5uiJxgUoNPE
	 c/aJOqlhsrnvdrAFM/mn+Lmi5cml6BID+ZNuvom9V3/+MrcdLIh1iTshil7EmoCRS1
	 Uc4Kzw+8deBGkk0lYnIYAJN59IT+86AYzNECm76JKGukY3GIjoAL3vL8TxA0I+aoYy
	 UldzWEC7gmrDvB/08gbPUIWVVpgDmd1CV2o6Kozj3q7Wv1j/XKBPD2Dxz/ofm25VYp
	 tDO5uct66G77/DkrEHSUkn5h8BoOZnYZxZCUjzLKGBk0J6Nr1gEKdOEUFeVPWNAhIH
	 aTy0vFaauaPkA==
From: "Dmitriy Makhnin" <d.makhnin@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Dmitry Makhnin <d.makhnin@yadro.com>
Subject: [PATCH] waf-samba: using python variable from python3native.bbclass
Date: Thu, 13 Mar 2025 17:14:33 +0300
Message-ID: <20250313141433.944594-1-d.makhnin@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-ClientProxiedBy: T-EXCH-09.corp.yadro.com (172.17.11.59) To
 T-EXCH-12.corp.yadro.com (172.17.11.143)
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 14:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115974

Waf-samba.bbclass inherits python3native.bbclass
which has the variable PYTHON=3D"${STAGING_BINDIR_NATIVE}/python3-native/=
python3".
This allows this variable to be used in do_compile instead of python3.

Signed-off-by: Dmitry Makhnin <d.makhnin@yadro.com>
---
 meta-networking/classes/waf-samba.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/classes/waf-samba.bbclass b/meta-networking/=
classes/waf-samba.bbclass
index 79acacc989..cb78ce6b0d 100644
--- a/meta-networking/classes/waf-samba.bbclass
+++ b/meta-networking/classes/waf-samba.bbclass
@@ -113,7 +113,7 @@ do_configure() {
=20
 do_compile[progress] =3D "outof:^\[\s*(\d+)/\s*(\d+)\]\s+"
 do_compile () {
-    python3 ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d, '=
-j%d', limit=3D64)}
+    $PYTHON ./buildtools/bin/waf ${@oe.utils.parallel_make_argument(d, '=
-j%d', limit=3D64)}
 }
=20
 do_install() {
--=20
2.30.2


