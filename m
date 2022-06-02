Return-Path: <marcel@ziswiler.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F72EC43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 09:42:19 +0000 (UTC)
Received: from mout.perfora.net (mout.perfora.net [74.208.4.194])
 by mx.groups.io with SMTP id smtpd.web09.4679.1654162936983592352
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jun 2022 02:42:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: ziswiler.com, ip: 74.208.4.194,
 mailfrom: marcel@ziswiler.com)
Received: from toolbox.int.toradex.com ([81.221.243.92]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0MPn4m-1nsrrI0ZIg-0054Zf;
 Thu, 02 Jun 2022 11:42:06 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	Max Krummenacher <max.oss.09@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Peter Bergin <peter@berginkonsult.se>,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: [oe][PATCH v4] libavtp: add recipe for audio video transport protocol
 (avtp)
Date: Thu,  2 Jun 2022 11:40:55 +0200
Message-Id: <20220602094056.303118-1-marcel@ziswiler.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mMV20Ds2Qe+gfgmsJbd3Mo+blsGgH2DKFGT9cjAmkulphokqK22
 SC81s4j+toLatbmvCr2V8V+QHI7cQSOC/5iO1gADZEmVhNZMtRqx2mpo9CTdjWVPpMZTYD0
 4KVwXs4WqlyiJOeF7pLnQiyj3mSdVn6Z0cvfXSHqcRmbrPGmj91sDhSMtQXAcWuTQ7is/40
 YPukBPRtxpSLWqVnV5+oQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:W9mJiu5Rj6g=:/BJ0OLTO6vwEhazb71fbt/
 n7pYpo7pM14XhWs4Fa9S19y3LxQH+eaGhFX/NYP4OvasF8mHxDAu2AE/tA6yQGVm6Ryn/mFV9
 itrwFhLx0l891P64nrvWZRWLnOfIEePVCsSdmPKbRFpMYwfSbHFmhLDudU2daYv71Pu1TE0i8
 tzYyWp/ArKCsqaJiGmknLB/gpH+JkcrNrOax/tZJGpZFxRZkYlleYubN503jXyk8CHYOvl1e8
 WzX/IqIZQQp46FSLwiyLnpoczBF97OcNSc5h/Tu/BxoMQsFTl/QX3NQRPQB5kBThBuh5dMpGe
 ChlL1zd0/6X9kfuN+uYedzrJp5nBaRkqOoIqfvQWFWRf7Ztkpjc/WZCWQAWu8R1RyTKFxBAZw
 5PVfuMuhZehEKiFPgoAS8zCLLesvnYHrcjFXSy0NYKfZojqhshEgbUUStxVFIPcyH6H9qztbC
 nN5ECssZfgdsheGVzjembUSPOArQw77aeOpBKHoT5bXKZl0YrAkU5b4M89E7qOHDG+d4sZ1q3
 N50VDI4wh9Ym2F0WBc+Wjh/1UKdEKoDzrAo9dBFU8TwvFUKzK57Zd4ABS6kdprHiPD7PRweqI
 QRWi5e0HY22tXJ3EaDkT+uolriO3Qbvh6WnbpXZuXyTrnRCUEbVXqBSWd7UwOHyKILbjShBVf
 IolAEBO360ryCFqH42VoNf2q8DHQ+zGeORfW4PWZzuvHCA5pwaLd7uOCNDeD/arBCil09kNOw
 MEVRf5IB5IanpVXMECkQOXvxWfwPAHyzav46rw==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 09:42:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97384

From: Marcel Ziswiler <marcel.ziswiler@toradex.com>

This is Avnu's implementation of the Audio Video Transport Protocol
(AVTP). It may be used in order to enable the configuration option aaf
(AVTP Audio Format) for the alsa-plugins. While the library libavtp is a
dependency no recipe for this library was present. The aaf support for
the alsa-plugins was introduced in the openembedded-core commit
ddf542133118 ("alsa-plugins: 1.1.6 -> 1.1.8"). It may further be used in
order to enable the configuration option avtp for the
gstreamer1.0-plugins-bad once a separate patch enabling such
PACKAGECONFIG makes it into openembedded-core.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---
Resurrect from mailing list [1] as this is still not upstream.
End-to-end tested on Verdin iMX8M Plus.
Will talk about it at the Embedded World Conference in the TSN & Linux
track next month [2].

[1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
[2] https://events.weka-fachmedien.de/embedded-world-conference/program/
[3] https://lore.kernel.org/all/20220531213206.7119-2-marcel@ziswiler.com/

Changes in v4:
- Moved from openembedded-core as suggested by Alex [3].
- Relying on git hash instead of tag as suggested by Quentin.
- Fixing musl build issue as reported by Luca curtsey Max.

Changes in v3:
- Rename recipe to officially released PV of 0.2.0.
- Drop PROVIDES of avtp which just works around alsa-plugins referring
  to it as such instead of libavtp. Will update PACKAGECONFIG in
  alsa-plugins instead.

Changes in v2:
- Updated SRC_URI specifying mandatory protocol as https.
- Updated SRCREV to latest.

 ...it-host-to-network-conversion-macros.patch | 43 +++++++++++++++++++
 .../libavtp/libavtp_0.2.0.bb                  | 16 +++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libavtp/libavtp/0001-provide-64bit-host-to-network-conversion-macros.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb

diff --git a/meta-multimedia/recipes-multimedia/libavtp/libavtp/0001-provide-64bit-host-to-network-conversion-macros.patch b/meta-multimedia/recipes-multimedia/libavtp/libavtp/0001-provide-64bit-host-to-network-conversion-macros.patch
new file mode 100644
index 000000000..e432ccca4
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavtp/libavtp/0001-provide-64bit-host-to-network-conversion-macros.patch
@@ -0,0 +1,43 @@
+From cdbbe227594665145e9309a9ecb7d90aad070aab Mon Sep 17 00:00:00 2001
+From: Max Krummenacher <max.krummenacher@toradex.com>
+Date: Wed, 1 Jun 2022 15:53:55 +0000
+Subject: [PATCH] provide 64bit host to network conversion macros
+
+musl dosn't include the macros which convert 64-bit integers
+between host and network endianness from arpa/inet.h as glibc does.
+
+Use this patch to include endian.h in util.h if compiling for musl.
+
+Prevents:
+| [2/8] aarch64-tdx-linux-musl-gcc ... -o libavtp.so.0.2.0.p/src_avtp_stream.c.o -c ../git/src/avtp_stream.c
+| ../git/src/avtp_stream.c: In function 'avtp_stream_pdu_get':
+| ../git/src/avtp_stream.c:116:24: warning: implicit declaration of function 'be64toh' [-Wimplicit-function-declaration]
+|   116 |                 *val = be64toh(pdu->stream_id);
+|       |                        ^~~~~~~
+| ../git/src/avtp_stream.c: In function 'avtp_stream_pdu_set':
+| ../git/src/avtp_stream.c:199:34: warning: implicit declaration of function 'htobe64' [-Wimplicit-function-declaration]
+|   199 |                 pdu->stream_id = htobe64(value);
+
+Upstream-Status: Inappropriate [musl specific]
+
+Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
+---
+ src/util.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/util.h b/src/util.h
+index 8b50625..e6fd2ef 100644
+--- a/src/util.h
++++ b/src/util.h
+@@ -27,6 +27,8 @@
+ 
+ #pragma once
+ 
++#include <endian.h>
++
+ #define BIT(n)				(1ULL << n)
+ 
+ #define BITMASK(len)			(BIT(len) - 1)
+-- 
+2.20.1
+
diff --git a/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
new file mode 100644
index 000000000..98f8e5b84
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavtp/libavtp_0.2.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Implements Audio Video Transport Protocol (AVTP)"
+DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
+               specified in IEEE 1722-2016 spec."
+HOMEPAGE = "https://github.com/Avnu/libavtp"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
+
+SRC_URI = "git://github.com/Avnu/libavtp.git;branch=master;protocol=https"
+SRC_URI:append:libc-musl = " file://0001-provide-64bit-host-to-network-conversion-macros.patch"
+SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
+
+S = "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = "-Dtests=disabled"
-- 
2.36.1


