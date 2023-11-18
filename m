Return-Path: <jan.claussen10@web.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B8BC2BB3F
	for <webhook@archiver.kernel.org>; Sat, 18 Nov 2023 18:26:35 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.4])
 by mx.groups.io with SMTP id smtpd.web11.13762.1700331989681254546
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Nov 2023 10:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=jan.claussen10@web.de header.s=s29768273 header.b=RdubGWsA;
 spf=pass (domain: web.de, ip: 212.227.15.4, mailfrom: jan.claussen10@web.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1700331988; x=1700936788; i=jan.claussen10@web.de;
	bh=/9gPPbu0gsqS8HAHGcx2uMMe7arPwHiFTnGnDQTISWI=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=RdubGWsA2tb6jrkxCt/GB4bQFa/r1WBn96NHeyKrwkJPI37MSQFn9h4UkjAwDbaP
	 vPigEAeXVL6pr8gpw56S0cCyE629w+bcULUN0OFjT6Rp8xiJ3x+ZMc5rB6TzH4nM8
	 YaOCoQUsuXjZ0CgzVTOLvT1bBO46KTAYsdxv4k7qj2zeiwL4gyab5MXpizyliNayz
	 ux8PTRj2cCOzp3SHvk7jJ4aWFq509+z2cjl7GN7DaPFXCUpTnnYZkWBeV+8bNtAs2
	 mR6Kh9rREzk2W/CvFdr37U/rj+uxfumgypock6RwF73Tr/PI+5TzQbtV8CueOxnLa
	 RlVH0oiH6qmyD+f1zA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from localhost ([195.123.103.85]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N9cLR-1rRVDi3s0r-015Q1q; Sat, 18
 Nov 2023 19:26:27 +0100
From: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Jan=20Clau=C3=9Fen?= <jan.claussen10@web.de>
Subject: [[oe] [meta-oe]] meta-oe: recipes-support: Add btop
Date: Sat, 18 Nov 2023 19:26:25 +0100
Message-ID: <20231118182625.3237489-1-jan.claussen10@web.de>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Jj3JeUu6bfNjp9Splmo7YTgoOeJ6L1SiNzeTkjjFhpr9+84IP4I
 lh/yOWVkj0skH/ujOPQ+VYppcJ4FGZSaS301OebEZhdfjhCZObMjy6wjqnL9+aJsJZa04Tl
 nKjv79TUQBvIxIeVrSiI/5FjeNBimsWKXSaHV9JRDzVjF8WdbLCiLB4dngZI67BKgHpV8s3
 6hm5L81zN8BulBm+tYj+g==
UI-OutboundReport: notjunk:1;M01:P0:iXWBvfsiAeI=;zRsacHeAX+V51kwCZ0b0Me5eWpt
 aGXpy9aYZrK4QB5jfjfTnE4DLk6PYmhdWL00cz5HFARPoU5ZxZotCXURNX2uMhD8aXY8hPl00
 nhbSqU0SBwWWknFXN39Lk7c4cGvHFXUn2CBaT3MF28lONnJTnmDsZovaakP2P7cutJpQsguwy
 10I+xWDb2KlKwWbX4zweYhmPqe371NwGJch2SpOCtMXdf/53FE0M3o6PsXA+bB7QDSMh9bvXI
 Y4GWVnYdl241JGg3oYGKwqWgWruOkkoB9uE7ojjHpGTVcFCrHOkKHdJQ5f+BNMM/Z2LVT97uV
 RKgewsPEi7Q0JgA3hNQHUNqOldQ9nLh4gQs73zQTg6OR2ipKvCV3YYsiVEFhKF2kUzdOjjBzo
 S/HlqtK3fQ72TVijD+uIWLbIbxLGVrOHCKOZ8PeRD0jU0LYEn3+7grgWYkN24KcCnCtBCJe2B
 sFA5PmXxVEmKOeo1icrlpOsfQAAwYhQQshAtvxkQtlGlAuPqodf2ZeSBRtEIHbOUw5mGllMpb
 Abb3yfB9epB9szzgaBMH1Kq2Czoly+gbbDX5EmcUotQJilxbM6PK3oc409awBynkH/RruNbHT
 6Rbk+DH6ULsaBszM73FlbqZm0Mkii84mx6Jq4dFQOnAQZfVO8arPHXeQ8EyGFO1btYepbZVWt
 kMyT1NuF8f+x5BulsbwtnHAdPcsoHvYf+rBjJ1by/OENPUE2u1/a6XNylLfe28SCERtpECeaP
 38z9a1tCB8e4U2K3Ig3nAu6G0r3tkm4pMXd4ssROMQ+Cg2Jf/KNi4VO/cE0ODKbhVqJNnu2CG
 60j2pzspLzsGEj0dXPwJF7iUk5sB+2V/Zhm5qPFXud85uqRDQkHZS6CMcaxLFJUMFdAdQk+eS
 3RGq7RW/DgmE4xwJVo78Bv8yAkn2Ef9LGMvE+HUXmECRfDGpamiOJkM5uY0FAiU0WrWbfwlP8
 7a9xW84yxeHuDCOvO7FXgVOFqnw=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Nov 2023 18:26:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106890

Adds btop, the shell-based resource monitor that shows usage and stats for=
 processor, memory, disks, network and processes.

Signed-off-by: Jan Clau=C3=9Fen <jan.claussen10@web.de>
=2D--
 meta-oe/recipes-support/btop/btop_1.2.13.bb | 23 +++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-oe/recipes-support/btop/btop_1.2.13.bb

diff --git a/meta-oe/recipes-support/btop/btop_1.2.13.bb b/meta-oe/recipes=
-support/btop/btop_1.2.13.bb
new file mode 100644
index 000000000..a944fe7b5
=2D-- /dev/null
+++ b/meta-oe/recipes-support/btop/btop_1.2.13.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "Resource monitor that shows usage and stats for processor, m=
emory, disks, network and processes."
+HOMEPAGE =3D "https://github.com/aristocratos/btop"
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc3c6bd=
57"
+SECTION =3D "console/utils"
+
+SRC_URI =3D "git://github.com/aristocratos/btop.git;protocol=3Dhttps;bran=
ch=3Dmain"
+SRCREV =3D "9edbf27f1b6d5844a97325fcda732762ba086a99"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+FILES:${PN} +=3D " \
+    ${datadir}/icons \
+    ${datadir}/icons/hicolor \
+    ${datadir}/icons/hicolor/48x48 \
+    ${datadir}/icons/hicolor/scalable \
+    ${datadir}/icons/hicolor/48x48/apps \
+    ${datadir}/icons/hicolor/48x48/apps/btop.png \
+    ${datadir}/icons/hicolor/scalable/apps \
+    ${datadir}/icons/hicolor/scalable/apps/btop.svg \
+"
=2D-
2.42.1


