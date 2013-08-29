Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id EB7616BD4F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:50:54 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so339491eaj.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=obcw7W2FdvcXEdPzQhZUYf93ANSQjVgNszk52FVwPWI=;
	b=ZnWhm2z3/QYgUeZIdEqqo9u+1lVSCsDDZgFgTXHrr5W7u44EAXvEmPSekZn8u0NdSv
	iPax+Mo8Y8adwXCR5OwYjjRNivAfBXAr/S9cu9anI5YVb7qfCL+AY9pzSgtFIJDJ/qdd
	w+11d+dsOvOtaXZ00LBxmJgSX3Cvix8Zcp6VZYyLZcINttGznIlT91uBgypk/1mE2emU
	FYnjeXbSx0s4R5POH6TxxrSig3H5eMR99cL3DGooSPfLkw5FD8xFEJNuZ/4/Aw4Kb7mO
	g6fFlrDyP/M/1qgDmkMPSoLPn0t3lVj1ZybqIdgWyZCP3m2YSw05uTfsq9f8KT2wjqkB
	BM1w==
X-Received: by 10.15.48.67 with SMTP id g43mr5424572eew.17.1377791455335;
	Thu, 29 Aug 2013 08:50:55 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	x47sm47199304eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:50:54 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:50:58 +0200
Message-Id: <658edd05c2582f553c08fc4c515db4a5f8865289.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 05/66] gnome-settings-daemon: add PACKAGECONFIG for pulseaudio
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
X-List-Received-Date: Thu, 29 Aug 2013 15:50:55 -0000

* libcanberra is autodetected and dependency on it wasn't deterministic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb              | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
index 47baea6..a178185 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb
@@ -13,6 +13,9 @@ SRCREV = "0160f6725cfb872e017f3958f108792c3b882872"
 
 S = "${WORKDIR}/git"
 
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)"
+PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio glib-2.0 libcanberra"
+
 EXTRA_OECONF = "--disable-esd \
                 --x-includes=${STAGING_INCDIR} \
                 --x-libraries=${STAGING_LIBDIR} \
-- 
1.8.3.2


