Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwHnb-0001CH-IY
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Jul 2012 21:08:07 +0200
Received: by pbbrq2 with SMTP id rq2so10617160pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Jul 2012 11:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=fgRCVT1/0dvBXx19uMxpj6ugx+p5jGOcotSvv1ms8NA=;
	b=FTc1gUf6s5t9Z8sSeyz4wOVYYwRh58yS9vP2UpdedFJVehW7BjNHIaOy3zQ9GtV/lU
	rdDzSU4Iqm8GjRaffmJ/8fw/2XwZ3F+NMmIexK6HbOQ0h1cBzTx644aePY/3bphJqPfj
	7h/fYTeTh7AbzLhjaCVm/aYOKKgyQRVMaIRxitK/qD/iq9fjmOb+sh4wCqm2pVDfr9Ey
	jjBqLTRlTSp62Egks2IqRKcYBiMPjLRZz1yEKRdRWzMSBw3wuDqNbHfp/xMEdEkptOCd
	WtY5K/pp0WncQyRSP5EsetZWrPDPEr2DhspvlFcZaypi+1BV7o4m/C9sGpRZPePTv99g
	iLAQ==
Received: by 10.68.221.41 with SMTP id qb9mr45455431pbc.147.1343760989635;
	Tue, 31 Jul 2012 11:56:29 -0700 (PDT)
Received: from kraj-lnx.juniper.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id hw6sm798801pbc.73.2012.07.31.11.56.27
	(version=SSLv3 cipher=OTHER); Tue, 31 Jul 2012 11:56:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 31 Jul 2012 11:56:13 -0700
Message-Id: <1343760977-3290-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
References: <1343760977-3290-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 3/7] busybox-syslog.service.in: Create alias for syslog.service
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
X-List-Received-Date: Tue, 31 Jul 2012 19:08:08 -0000

The default syslog implementation should make syslog.service a
symlink to itself, so that this socket activates the right actual
syslog service.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../busybox/busybox/busybox-syslog.service.in      |    1 +
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
index c6c625e..2e04321 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
@@ -10,3 +10,4 @@ Sockets=syslog.socket
 [Install]
 WantedBy=multi-user.target
 Also=busybox-klogd.service
+Alias=syslog.service
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
index 915a50e..bb11550 100644
--- a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 2}"
+PRINC := "${@int(PRINC) + 3}"
 
 # look for files in the layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-- 
1.7.5.4



