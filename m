Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11829.1792590843887451987
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 06:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=LZob6hHJ;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j8rNl4zgTzMlj5;
	Wed, 21 Oct 2026 15:53:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792590839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lQaeOQvsk57pkhRpC62OPuZeSpjlergd/5AvqC+8QCs=;
	b=LZob6hHJmrKYpa1sTJ4e7fgjQOWlyV/CGYaOP0aXOHMdbyX4RySP3u546YmuIEMi6PMM4j
	cnp750RniOHzg7ZMsnIkBOJw3hzwmwq/kh+O0BIEnMtIo6Xv2jBt2Y9t62mGby1WOkqc6K
	FWnzRaYfkFmRuEMZzjA0Nqyky1poieNeaXlGrW0EPcHWnT9+h16gMKHsAW990gaLAY/TN2
	IWUa6GCCr0wcLQsjWtf9AkBA0PHSHnkqVI3sUvZ15jikAu0QMs4Yv7V+U2IaJfe9ps2NYU
	Vm85/fRbrf0XdIkGjeUqjhWSbR+OdpDjPzVk3Xk1AR9CIE1i/05EiN+FR+qLrw==
From: Marek Vasut <marek.vasut@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Alexander Kanavin <alex@linutronix.de>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: [meta-filesystems][PATCH] overlayfs-tools: Inhibit tests on configure
Date: Wed, 21 Oct 2026 15:53:27 +0200
Message-ID: <20261021135357.14928-1-marek.vasut@mailbox.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-MBO-RS-ID: 1383de7c1726fb51a91
X-MBO-RS-META: pp7e8os4kdqijb61q8k8s7otqxtd13oo
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 13:54:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131300
Content-Type: text/plain; charset="utf-8"

In case the overlayfs-tools are built using meson, a test triggers
during meson setup phase during do_configure task. The test invokes
"sudo", which may not be present on the build machine. Skip the test
at meson setup phase. Tests should be executed separately on demand
using "meson test" command instead, and invoking "sudo" and expecting
it to work during do_configure is unusual.

"
ERROR: overlayfs-tools-v2025.01-r0 do_configure: meson setup failed
...
| Run-time dependency musl-fts found: NO (tried pkgconfig)
| Library m found: YES
| Program test_cases/run_tests.py found: YES (/home/oe/build-some-target/=
tmp/work/arm64-distro-linux/overlayfs-tools/v2025.01/sources/overlayfs-to=
ols-v2025.01/test_cases/run_tests.py)
|
| ../sources/overlayfs-tools-v2025.01/meson.build:94:0: ERROR: Program 's=
udo' not found or not executable
|
| A full log can be found at /home/oe/build-some-target/tmp/work/arm64-di=
stro-linux/overlayfs-tools/v2025.01/build/meson-logs/meson-log.txt
|
| Last 10 lines of meson-log.txt:
| Code:
| int main(void) { return 0; }
"

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Alexander Kanavin <alex@linutronix.de>
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Cc: Vyacheslav Yurkov <uvv.mail@gmail.com>
---
 .../recipes-utils/overlayfs/overlayfs-tools_2025.01.bb        | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_202=
5.01.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.0=
1.bb
index 8583a0e2cb..3b5963bb26 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_2025.01.bb
@@ -14,3 +14,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
 inherit meson pkgconfig
=20
 DEPENDS:append:libc-musl =3D " fts"
+
+do_configure:prepend() {
+	sed -i '/Custom targets for testing overlay function/,/command : .*perm=
anent...changes/ d' ${S}/meson.build
+}
--=20
2.53.0

