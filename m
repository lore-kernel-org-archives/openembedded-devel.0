Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3p-0001fb-EU
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:37 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=X/QxQ3F/dlLqPcSQepTJB6+1t6udKG9p/4XXoYiDKx8=;
	b=TQc8RTImVfyV9FuGnYSXaUTvfzdbH1B9tEgQeUCELC8+tR4WDb21T6HAKDl75MJ3zD
	fCZKRZZTZL14soVyEPU4dGAvIJLEyqJBF6FGwDlezcUEH9Du5NzcIgWjJv8QHi4CavjY
	8xBjMd4ve0uJ3V7jXDnndvUfyTbECv8oCxC3vo28Y5o7cKlIp/Q8TbLuNyF6WRGA0DGk
	xWWZ+ElAYnxfkWOA654a25xBHPhTGmbOs7Zs7Ovc/+9p4I4c9I47gPtjIVgOkLSysm2H
	u0SCVNuMDcHbIzMZeI8vulYOijfnjqIkA3zfR+NHExMG4A+TDgTO9zPkLPCueynWN2e+
	br0w==
Received: by 10.180.82.198 with SMTP id k6mr15813728wiy.20.1339364525781;
	Sun, 10 Jun 2012 14:42:05 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.42.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:42:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:56 +0200
Message-Id: <1339364820-2880-24-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 23/27] dropbear: move systemd support to meta-systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Jun 2012 21:52:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-core/dropbear/dropbear/dropbear.socket |    0
 .../dropbear/dropbear/dropbear@.service            |    0
 .../dropbear/dropbear/dropbearkey.service          |    0
 .../dropbear/dropbear_2012.55.bbappend             |    2 +-
 4 files changed, 1 insertions(+), 1 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbear.socket (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbear@.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear/dropbearkey.service (100%)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-core/dropbear/dropbear_2012.55.bbappend (92%)

diff --git a/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
rename to meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear.socket
diff --git a/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
rename to meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbear@.service
diff --git a/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
similarity index 100%
rename from meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
rename to meta-systemd/meta-oe/recipes-core/dropbear/dropbear/dropbearkey.service
diff --git a/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
similarity index 92%
rename from meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
rename to meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
index fc5d047..05651c8 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/dropbear/dropbear_2012.55.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
-- 
1.7.4.4



