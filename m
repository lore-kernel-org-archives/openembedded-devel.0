Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC246CC7F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 13:48:14 +0000 (UTC)
Received: by mail-wg0-f41.google.com with SMTP id f12so988444wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Oct 2013 06:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PWeV9OPU27sYUIshD7MJM5HtHQ/DEg9Cv3yhOdloOjk=;
	b=GUpllqQqvOstwgyRp1g3eRfCO3qAf0HDVchqx2dssMxGxl/uvh2IShbU6jkes4mDmA
	CApHpZ0SX9VYikBZ0wli1Sj1l6MPLgA3spLTq4e5ryocBD94p1vkryluKmT1HVc503e1
	ioUPNPRC018CfB+Q8Ew9JLPKFnTLYx3w5edD+cJRXON4Mzq1CLeADa8p7/VoMwTG+hNN
	AEftvMXRalvOpPCNO4QoUqxOrhNUn/Ym/Zb/g2OKsi+c4nahT2NYvsHqA1YJLKtYc0R0
	T/tDxhZyYP8hZQTxT/rRSHBkmwtcGfC29J/At13KlRWRFHINg+T4C5F+fChTioXLAWqf
	mqaQ==
X-Gm-Message-State: ALoCoQm8YDYY5T5fmt2JqoJeMQXgAp52G41G5zIinjXp2o761LzOWdIk589xbF3aQ88aOGTBe/2l
X-Received: by 10.194.143.18 with SMTP id sa18mr399748wjb.70.1381499295571;
	Fri, 11 Oct 2013 06:48:15 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPSA id k4sm5919578wic.0.2013.10.11.06.48.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2013 06:48:14 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Oct 2013 15:48:09 +0200
Message-Id: <1381499289-10706-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1381499289-10706-1-git-send-email-koen@dominion.thruhere.net>
References: <1381499289-10706-1-git-send-email-koen@dominion.thruhere.net>
Subject: [meta-gnome][PATCH 2/2] gdm 2.32.2: don't install broken gdm-autologin PAM file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Oct 2013 13:48:14 -0000

It references pam-plugin-console which isn't available. Deleting the PAM file makes autologin work.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
index 65e0826..b341c8a 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "xinput gnome-panel tcp-wrappers libcanberra libxklavier grep consolekit libpam gnome-doc-utils gtk+ xrdb"
 
-PR = "r17"
+PR = "r18"
 
 inherit gnome update-rc.d systemd useradd
 
@@ -49,6 +49,7 @@ do_install_append() {
 
     install -d ${D}/${sysconfdir}/pam.d
     install -m 0755 ${WORKDIR}/gdm-pam       ${D}/${sysconfdir}/pam.d/gdm
+    rm -f ${D}/${sysconfdir}/pam.d/gdm-autologin
 
     install -d ${D}/${sysconfdir}/gdm/Init
     install -m 0755 ${WORKDIR}/Default ${D}/${sysconfdir}/gdm/Init
-- 
1.8.3.1


