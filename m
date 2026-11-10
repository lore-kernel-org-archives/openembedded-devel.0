Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14797.1794293758097007539
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2026 22:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@mailbox.org header.s=mail20150812 header.b=rlBZ1zWv;
 spf=pass (domain: mailbox.org, ip: 80.241.56.161, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jNy965wJ4zKnGf;
	Tue, 10 Nov 2026 07:55:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794293754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mt3lCVNa7IsvJJ/IQs3NV7Ev6pfq8L7OoocFnAwBjxA=;
	b=rlBZ1zWvOrSCQ94SZxZA+0AxYMv91uVTKmFYxT9DGfdHke2eRldHF9XBkiAc1mM8/j+Ant
	sdmi6N5jWdgd0dM8E7MzJxjUbg4LZEaYDCHS3C1zm8jaY2Qc4S3ObC65YwukhSj0QbkNxk
	QZ4PAnY/Vhr5gQdR9dY1dSmeb4gVWQEtipzRgUnNepfNTaxXij/rJ1BeWjxydGxnf9ZEdt
	CoTWrkrp93vyjnyELnSeLcUNXPlJvFKE0sbsB4B90iAMI78tDqKQnoKEOO3780hl9EYCA2
	244XuYbVnB7Fe/aGLyacGfBX9rfU/fVbm48NFID0p0g0cQoa0FrQsCA68f4B0g==
From: Marek Vasut <marek.vasut@mailbox.org>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][wrynose][PATCH] overlayfs-tools: Inhibit tests on configure
Date: Tue, 10 Nov 2026 07:55:35 +0100
Message-ID: <20261110065549.833291-1-marek.vasut@mailbox.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-MBO-RS-ID: 7198d639f45081cce23
X-MBO-RS-META: qeqexnkcti154486eco4qix1i48wd77r
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 06:56:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132067
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
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 784c75a3a04478ec5362655aa8b2102ac4b05667)
---
 .../recipes-utils/overlayfs/overlayfs-tools_v2025.01.bb       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v20=
25.01.bb b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025=
.01.bb
index c83233a9a0..29facea323 100644
--- a/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025.01.b=
b
+++ b/meta-filesystems/recipes-utils/overlayfs/overlayfs-tools_v2025.01.b=
b
@@ -12,3 +12,7 @@ SRCREV =3D "6e925bbbe747fbb58bc4a95a646907a2101741f6"
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

