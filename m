Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2E7C3ABD8
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 11:34:54 +0000 (UTC)
Received: from outbound4.mail.transip.nl (outbound4.mail.transip.nl [136.144.136.2])
 by mx.groups.io with SMTP id smtpd.web11.9781.1747390546220899833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 16 May 2025 03:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=Sj3puycD;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.2, mailfrom: jeroen@myspectrum.nl)
Received: from submission8.mail.transip.nl (unknown [10.103.8.159])
	by outbound4.mail.transip.nl (Postfix) with ESMTP id 4ZzNJH0Zbgz7w3q;
	Fri, 16 May 2025 12:15:43 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission8.mail.transip.nl (Postfix) with ESMTPSA id 4ZzNJF6Zhhz2npc8w;
	Fri, 16 May 2025 12:15:41 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 9CB8520012;
	Fri, 16 May 2025 10:15:39 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Fri, 16 May 2025 12:15:38 +0200
From: jeroen@myspectrum.nl
To: openembedded-devel@lists.openembedded.org
Cc: Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [oe][meta-oe][scarthgap][PATCH] can-utils: handle CAN_ERR_CNT correctly
Date: Fri, 16 May 2025 12:15:10 +0200
Message-ID: <20250516101509.1359113-2-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission8.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1747390541; h=from:subject:to:cc:date:
 mime-version; bh=PUD3wdX7SD8xJ6ptDs82zVRp0yJVeCN/FJ5oFKIeFzU=;
 b=Sj3puycDY7dTG7PC9EbZBx2QhtNWO1vgIeFJcggEIkemwwQeET1VbGczhHiVHRjLmlTOvm
 uSR+SdM/PbokeMLyqwy6gLVSk4stDQgU3bNjt5dQmFVrN9+RHTO3MF77eXybcN3CnMU4xg
 Uw0zpGp64JJbzGZFJz9Ll9oBn/QhKluhE3Ph/7pRpha4ElttzgDdSfQ3Kt0nrfnx/4mede
 N5BuMhMRN7i2z1bL/84D0L+ls1AIihf+B1CLEFO8r5TIGM52WKAAzT5zS1oO8CPU/+IVSt
 +kE3Tx5PZSobvGDZ1tMycLfqmGHEUpycvyhUHR4kbCngdTI9XbAL7huNzZOpDw==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 May 2025 11:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117427

From: Jeroen Hofstee <jhofstee@victronenergy.com>

If CAN_ERR_CNT is set, the snprintf_can_error_frame() bails out, as it
cannot decode CAN_ERR_CNT.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>

---
note: this applies afer https://patchwork.yoctoproject.org/project/oe/pat=
ch/20250430114132.3275544-1-jeroen@myspectrum.nl/
---
 ..._error_frame-don-t-bail-out-if-CAN_E.patch | 70 +++++++++++++++++++
 .../socketcan/can-utils_2023.03.bb            |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta-oe/recipes-extended/socketcan/can-utils/0001-lib=
-snprintf_can_error_frame-don-t-bail-out-if-CAN_E.patch

diff --git a/meta-oe/recipes-extended/socketcan/can-utils/0001-lib-snprin=
tf_can_error_frame-don-t-bail-out-if-CAN_E.patch b/meta-oe/recipes-extend=
ed/socketcan/can-utils/0001-lib-snprintf_can_error_frame-don-t-bail-out-i=
f-CAN_E.patch
new file mode 100644
index 0000000000..f393cce091
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/can-utils/0001-lib-snprintf_can_=
error_frame-don-t-bail-out-if-CAN_E.patch
@@ -0,0 +1,70 @@
+From 7d59157d4d570ba994f7dd07243ac5fb1c541410 Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@pengutronix.de>
+Date: Wed, 27 Sep 2023 16:15:52 +0200
+Subject: [PATCH] lib: snprintf_can_error_frame(): don't bail out if
+ CAN_ERR_CNT is set
+
+If CAN_ERR_CNT is set, the snprintf_can_error_frame() bails out, as it
+cannot decode CAN_ERR_CNT.
+
+Fixes: 21fb43532e80 ("lib: snprintf_can_error_frame: print counter error=
s if CAN_ERR_CNT is set")
+
+Upstream-Status: Backport [https://github.com/linux-can/can-utils/commit=
/7d59157d4d570ba994f7dd07243ac5fb1c541410]
+---
+ lib.c | 23 +++++++++++++++++++----
+ 1 file changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/lib.c b/lib.c
+index d665c69..0201e94 100644
+--- a/lib.c
++++ b/lib.c
+@@ -499,6 +499,7 @@ static const char *error_classes[] =3D {
+ 	"bus-off",
+ 	"bus-error",
+ 	"restarted-after-bus-off",
++	"error-counter-tx-rx",
+ };
+=20
+ static const char *controller_problems[] =3D {
+@@ -636,6 +637,19 @@ static int snprintf_error_prot(char *buf, size_t le=
n, const struct canfd_frame *
+ 	return n;
+ }
+=20
++static int snprintf_error_cnt(char *buf, size_t len, const struct canfd=
_frame *cf)
++{
++	int n =3D 0;
++
++	if (len <=3D 0)
++		return 0;
++
++	n +=3D snprintf(buf + n, len - n, "{{%d}{%d}}",
++		      cf->data[6], cf->data[7]);
++
++	return n;
++}
++
+ void snprintf_can_error_frame(char *buf, size_t len, const struct canfd=
_frame *cf,
+                   const char* sep)
+ {
+@@ -679,13 +693,14 @@ void snprintf_can_error_frame(char *buf, size_t le=
n, const struct canfd_frame *c
+ 				n +=3D snprintf_error_ctrl(buf + n, len - n, cf);
+ 			if (mask =3D=3D CAN_ERR_PROT)
+ 				n +=3D snprintf_error_prot(buf + n, len - n, cf);
++			if (mask =3D=3D CAN_ERR_CNT)
++				n +=3D snprintf_error_cnt(buf + n, len - n, cf);
+ 			classes++;
+ 		}
+ 	}
+=20
+-	if (cf->can_id & CAN_ERR_CNT || cf->data[6] || cf->data[7]) {
+-		n +=3D snprintf(buf + n, len - n, "%s", sep);
+-		n +=3D snprintf(buf + n, len - n, "error-counter-tx-rx{{%d}{%d}}",
+-			      cf->data[6], cf->data[7]);
++	if (!(cf->can_id & CAN_ERR_CNT) && (cf->data[6] || cf->data[7])) {
++		n +=3D snprintf(buf + n, len - n, "%serror-counter-tx-rx", sep);
++		n +=3D snprintf_error_cnt(buf + n, len - n, cf);
+ 	}
+ }
+--=20
+2.43.0
+
diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb b/me=
ta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
index 5a7beb978a..0804b514a9 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2023.03.bb
@@ -6,6 +6,7 @@ DEPENDS =3D "libsocketcan"
=20
 SRC_URI =3D "git://github.com/linux-can/${BPN}.git;protocol=3Dhttps;bran=
ch=3Dmaster \
            file://0001-timestamp-formatting-always-use-64-bit-for-timest=
amp.patch \
+           file://0001-lib-snprintf_can_error_frame-don-t-bail-out-if-CA=
N_E.patch \
 "
=20
 SRCREV =3D "cfe41963f3425e9adb01a70cfaddedf5e5982720"
--=20
2.43.0


