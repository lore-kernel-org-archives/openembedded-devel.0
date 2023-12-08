Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F5EC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 05:48:30 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.14169.1702014507352688888
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 21:48:28 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-04 header.b=WuQR3Hcl;
 dkim=fail reason="dkim: body hash did not verify" header.i=@yadro.com header.s=mta-03 header.b=pKpkdHJ7;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 8304FC0003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1702014503; bh=9QP4et5Tf/D2LweZJ4SwNBhHWvZwFcF9G+gELq1pnrw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=WuQR3HclLnnOXNYimlmKIOrEjv+W6P8n6KmOjW3RvtnEeuEkAEVsCDXUr1jDHdTzW
	 ZYX/OinJdvqRWqU9ns5E56WnxZa1F7JyI8VMVOZuHtnu9aA+58W/F2FLbUGUAcfdFo
	 xUzJ6orRyPZbvcAQRV3xVIyw/vTg1XKrgQZxUIT01gVGPSaKMXl1agLn6/rJZw2xCV
	 pTY84ev1FPjct6faaKuN2ga9VE9iFXLJdWPkoI5S2XGy6ybKNztjk/xL6wQmHK/0Rx
	 18bIzPD3Jwmyj6r4eLbHwVjUhZQNuyvCYmfH0KzIgE87yJhjtk5+s3LQYVnHcSCMgK
	 aW9yTtzBjpQ+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1702014503; bh=9QP4et5Tf/D2LweZJ4SwNBhHWvZwFcF9G+gELq1pnrw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=pKpkdHJ7eLMJjna7Wp815SXPJPT2BB53qoNQmB/dkKL8nSrzwrzvR04VCsDqC0SmK
	 /p+RSMYo+wBpqHe8Cx/dW4rG2z+ZZZvYyGLcTJUIRlGoXtG3KZbe7cIFjyI/5r8pmQ
	 R7Cjznz+dhnPvstVttZrAwaLe6S0St4juqs9tuW7e7mFAKZ3ogsw1XUaInqPOuP7fz
	 txk2uoO9L6AeeCtGANidimQHn+12d7B8r4wz11WHB7DLuKlsSM5yMAGACRyq5MGQ3O
	 W9UQTFpidm7N9tAw3xPf+znp49rE/Gcbtj0vE0sMnZOneJnYH1OhK/086DiYTgvqo1
	 gcBGTh1wHM0vw==
From: Petr Chernikov <p.chernikov@yadro.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Petr Chernikov <p.chernikov@yadro.com>
Subject: [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from extra_oecmake
Date: Fri, 8 Dec 2023 08:47:57 +0300
Message-ID: <20231208054757.1466187-1-p.chernikov@yadro.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: T-EXCH-08.corp.yadro.com (172.17.11.58) To
 T-EXCH-10.corp.yadro.com (172.17.11.60)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 05:48:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107302

Old versions of abseil-cpp could not be compiled using C++ Standard 17.
For now this cmake flag is not needed.
Mosh compilation fixed by specifying c++17 standard.

Signed-off-by: Petr Chernikov <p.chernikov@yadro.com>

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta=
-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index f847ebf15..4705b6f8c 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -26,7 +26,6 @@ inherit cmake
=20
 EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
                  -DBUILD_TESTING=3DOFF    \
-                 -DCMAKE_CXX_STANDARD=3D14 \
                  -DABSL_ENABLE_INSTALL=3DON \
                 "
=20
diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb b/meta-oe/re=
cipes-connectivity/mosh/mosh_1.4.0.bb
index 0ee050da9..693ec12d3 100644
--- a/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.4.0.bb
@@ -46,3 +46,5 @@ RDEPENDS:${PN}-server +=3D "openssh-sshd"
 #| {standard input}:2103: Error: instruction not supported in Thumb16 mo=
de -- `adcs r7,r7,r7'
 #| {standard input}:2104: Error: selected processor does not support Thu=
mb mode `it cs'
 ARM_INSTRUCTION_SET =3D "arm"
+
+CXXFLAGS:append =3D " -std=3Dc++17"

