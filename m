Return-Path: <narmstrong@baylibre.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED1977459D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 13:45:28 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id s14-v6so6514209wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2018 06:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baylibre-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=hLIuu8PTiOhcRvY7Ptb1p+MCpQztDEhR94JaP2flk+A=;
	b=nqHd8kIE+yymjpwyvWb1BcyJ551CBOZu9Ydt3KpRiRIBUu4UhjwH4hE/MChNg5uhzt
	c9oMnzR0KaYdqMZjWi0zfi9Z9+9/ICCbkNRCRunlDe0zdX7WTIU4e5DaI8mxIXudJdy8
	L0vJoyPTk2D+awbDx9GCUhCJzIO7Ze+Cj30X5aiEdJhvZau9ZuInaQEPAj+ljMNXrfHZ
	w0NFZGYsVONuggitw6PFNslezmOMlpwRXSdlQOp0g83ei7nqZPLLs3CMMKWq9+dT9qTa
	RDGU0XG9sZ0i6P6d6f/GxJ8nSB5N0EiSRhMb6wzOuCzL5/6JmC4HVLNTww1IJQVcRUEw
	+5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hLIuu8PTiOhcRvY7Ptb1p+MCpQztDEhR94JaP2flk+A=;
	b=e0tkCMIIt0+VYG8bd6g+qLO+QxNwhThs56xpwot0J5m8peNklvtNeXUfHlqWNBik9H
	9MXZxKmz9Ea+ual9zX0Aivo/q9wn0F/ya0dpB799yE4Wo+venIovq6u/vGaTWIiqkhqb
	1QqUdJpDKtGWLQaoHjET5k8GhoOs+MppAWX97N2fc3sjdzrPmTUhOlpBXlJ8SaDdI5KU
	TsO26DKaN8Gk2I6pETq8RAyQmDR4EuM+OIpDejOo6y0A5T62dZJHwcB+ifkQLUGLNmHa
	U2hZ3xCyif7QpQfFAXbCMDvFCSAcwHd/H4AGbrDTSIeJRLfDhD/qiopoUl2gSmA+NOHu
	WbZQ==
X-Gm-Message-State: AOUpUlGqkYpVQVckU6qMGSY8pu7WBs8dEnA6KMAMdrO9bmc2uoqffTRS
	XATaG4VMmeMB8HNsYq0lQ2W4tvIxq94Gwg==
X-Google-Smtp-Source: AAOMgpfb53GbQdk9HM1n8JlfWgrT4buLTpPRH6lYJ1z2dbPld+Rq6qUG1vl90HN6bBD9TYjvhnzODA==
X-Received: by 2002:a1c:7408:: with SMTP id
	p8-v6mr4166949wmc.118.1532007929164; 
	Thu, 19 Jul 2018 06:45:29 -0700 (PDT)
Received: from bender.home (LFbn-MAR-1-570-38.w90-118.abo.wanadoo.fr.
	[90.118.15.38]) by smtp.gmail.com with ESMTPSA id
	v1-v6sm17106035wrs.34.2018.07.19.06.45.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Jul 2018 06:45:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2018 15:45:25 +0200
Message-Id: <1532007925-9057-1-git-send-email-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.7.4
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: [meta-oe] [PATCH] libiio: fix build of python bindins
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
X-List-Received-Date: Thu, 19 Jul 2018 13:45:29 -0000

In the actual form, the python bindings are never built since the
recipe does not depend on python, thus he cmake script does not
detect python and does not build the bindings.

Add a summy PACKAGECONFIG for the python bindings to make it simpler
to disable.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 meta-oe/recipes-support/libiio/libiio_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes-support/libiio/libiio_git.bb
index ba380ed..fa6f4c2 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -24,10 +24,11 @@ EXTRA_OECMAKE = " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '-DWITH_SYSTEMD=ON -DSYSTEMD_UNIT_INSTALL_DIR=${systemd_system_unitdir}', '', d)} \
 "
 
-PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND"
+PACKAGECONFIG ??= "USB_BACKEND NETWORK_BACKEND PYTHON_BINDINGS"
 
 PACKAGECONFIG[USB_BACKEND] = "-DWITH_USB_BACKEND=ON,-DWITH_USB_BACKEND=OFF,libusb1,libxml2"
 PACKAGECONFIG[NETWORK_BACKEND] = "-DWITH_NETWORK_BACKEND=ON,-DWITH_NETWORK_BACKEND=OFF,libxml2"
+PACKAGECONFIG[PYTHON_BINDINGS] = ",,python"
 
 PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
 
-- 
2.7.4


