Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id A230C72F8B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2017 11:56:10 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 25so693272pgy.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 Feb 2017 03:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=VTCrlKrpoUGpJ4gEiA+lxhmdB90b7dp5BIzgPcOfgyk=;
	b=JnV1rq6ojqcm/ql1Kipk2E1lMAIyuvt95+Udl7lMqW5YHJdSY93TvWEUlOaydauJfY
	Nx8BhXrBg/A6WD2s0O59bY+ocVJpb36WiXoTQzDpw2GYuEeFyzjTL59qNSMDh6sY968a
	ZWKdpYXhlTl70xVW1c1W4kDzRJCyG2d4YSP7Tk4PJCGfNXBFZdPKXcAFm5oIUu/rYFYJ
	kjmVf85B71akudazqaZecxob/FDnA++SuVfl/CrUCUPa+dUgqF93qwF1vYJwuEBPjucH
	V1KVAiSh5h54m0UkRSmXAc9JSTaiyaXv08+fhhufOk/Mi8UGWck7Pqt02LGpBqHeaVNf
	B/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VTCrlKrpoUGpJ4gEiA+lxhmdB90b7dp5BIzgPcOfgyk=;
	b=ONoR83kAoGrQf2piQH4oTj+AZgTlKcKbb/+vBVrbbM2myoDHif1of2ItM8zjuHbe0Y
	tvCSRc0cv/FgxZHC8TLkvUq3eJbEu5s63Vb2UkVXvZ1ngiUS1FG97pYlNUa6Dk75paHl
	s8tTWvhao7MotgxgLaghclHKBzPt9mf0vTeJX48Ag+tBJ6FLKLA5fa0FHb8DogKawZCY
	fyyT0Q34kxnwXLiic3Ef238kNxii6paIHJHYdRYk2P+4Xmhz3VcBcTvTslGXW40urFzi
	sZzB3P7B+q93hF0+vZAAzzJTMcbDNk2ig5JeqW7kNW3R/oph2HD7qS9y4ly6QPnK06WV
	IUUA==
X-Gm-Message-State: AMke39m3P2jUFJJTxrRWC3oAF9cZtbY9tGRsng8kNXPV5YDgMIi+4MPAOgy3Up4JHeeqPQ==
X-Received: by 10.98.66.155 with SMTP id h27mr13358740pfd.182.1488110172123;
	Sun, 26 Feb 2017 03:56:12 -0800 (PST)
Received: from localhost.localdomain ([180.151.205.36])
	by smtp.gmail.com with ESMTPSA id
	g87sm24574699pfj.20.2017.02.26.03.56.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Feb 2017 03:56:11 -0800 (PST)
From: Ankit Navik <ankit.tarot@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 26 Feb 2017 17:29:21 +0530
Message-Id: <1488110361-3562-1-git-send-email-ankit.tarot@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] ell: Initial recipe for Embedded Linux Library
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2017 11:56:15 -0000

Add generic recipe for ELL.

Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
---
 meta-oe/recipes-connectivity/ell/ell_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/ell/ell_git.bb

diff --git a/meta-oe/recipes-connectivity/ell/ell_git.bb b/meta-oe/recipes-connectivity/ell/ell_git.bb
new file mode 100644
index 0000000..d259f52
--- /dev/null
+++ b/meta-oe/recipes-connectivity/ell/ell_git.bb
@@ -0,0 +1,17 @@
+SUMMARY  = "Embedded Linux Library"
+DESCRIPTION = "ELL is a DBUS library which provides DBUS bindings."
+LICENSE  = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
+SECTION = "libs"
+
+inherit autotools pkgconfig
+
+S = "${WORKDIR}/git"
+SRCREV = "399099946abaeb2f3718a0667cc11436a7c0be14"
+SRC_URI = "git://git.kernel.org/pub/scm/libs/ell/ell.git"
+
+do_configure_prepend () {
+    mkdir ${S}/build-aux
+}
+
+DEPENDS = "dbus"
-- 
1.9.1


