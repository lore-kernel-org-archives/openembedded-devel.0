Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6682E60721
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 15:23:19 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a66so2234762wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 08:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=TxPSjssNczRiXGnbPVUl4Xfotho6mPJN25l0baIZbIM=;
	b=G7f4iUfYVhjQhBbUulWY4cihHtjr2dFSm0+dxOmP73KCrWXL3/WPDQENwoIioylosq
	JuFw0oKQhYZ4oHBGNM3F+nAcHx6dXI+6w/hMXefUSeB2WDbGg70Kck7zKAAATEjvKKpv
	NPKPRdRK1kDgpkhGWzYClZeHDkC1sUMojnv7zjVZuPPJdCAofZYjsmr/6nxdlz2Ef6Sz
	KE03zn7IFY8iu4oucOKjODQgpIfoAHwUmM3igI8WFYMu1mgjvc+L6L51UEz0ipVFmHcY
	t3loktZEtlexNUXkuSFY0E6B79Fn3A3pWOYL2TaakHN8bZqH6FFrq/1py2YPSvZKS1gW
	hpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=TxPSjssNczRiXGnbPVUl4Xfotho6mPJN25l0baIZbIM=;
	b=AWE00o4cZF2JsqojLu5Lwb2WKqvQiZVHJBzzQw2OSa1zAfP0Y4R9N3PqzhuIo6vQ5i
	FeKUKUC7Bmwfx86WxyEiTbMlTqNGiaFRk1rPgVZRMvVHDg/CcSda/sbVaxnoo5Cb89ys
	1nNkqjNUOWBGMlO1T9OEHi+jnvNEgOPfqUe8YS3RP9L2z9GeWm5jKdEcjoJEMmUV8s65
	CqJeSLW753wAKW8qsaPO9z1bGoQRMTW0dyxyNSsWDUCg610PGCE42sGmg1oatPflA2Sf
	T4fBgNYC39w6Aau2EFB8EiKXhkyxDBFUQTVwlS/WjGiB+Z5V10aC/gvORydem/EetzSh
	71Pw==
X-Gm-Message-State: ALyK8tJpAZkw5h2YkKoiGibzGmitULg6EnPt0AOI/WlHvBjXjUNUiykZf8VdVmszuE99kw==
X-Received: by 10.28.91.202 with SMTP id p193mr8983847wmb.15.1466608999995;
	Wed, 22 Jun 2016 08:23:19 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	z14sm73029164wjw.6.2016.06.22.08.23.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 Jun 2016 08:23:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Jun 2016 17:23:37 +0200
Message-Id: <20160622152337.437-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.0
Subject: [meta-oe][meta-xfce][PATCH] toscoterm, xfce4-terminal: blacklist because of vte
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
X-List-Received-Date: Wed, 22 Jun 2016 15:23:21 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb            | 3 +++
 meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
index 24f813b..a7cc463 100644
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
@@ -25,3 +25,6 @@ do_install() {
 }
 
 RDEPENDS_${PN}_append_libc-glibc += "glibc-gconv-ibm437"
+
+# http://lists.openembedded.org/pipermail/openembedded-core/2016-June/122916.html
+PNBLACKLIST[toscoterm] ?= "BROKEN: not compatible with vte 0.44.1, needs 0.28.2"
diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
index 1049b27..39e8c59 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_0.6.3.bb
@@ -10,3 +10,6 @@ FILES_${PN} += "${datadir}/xfce4 \
 
 SRC_URI[md5sum] = "6a2816d8b0933cd707ed456ceb731399"
 SRC_URI[sha256sum] = "912f4716c2395a14a80620ef982b4af1e2a67a8df9a1ef0b802ecae826057e08"
+
+# http://lists.openembedded.org/pipermail/openembedded-core/2016-June/122916.html
+PNBLACKLIST[xfce4-terminal] ?= "BROKEN: not compatible with vte 0.44.1, needs 0.28.2"
-- 
2.9.0


