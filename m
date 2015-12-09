Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id CE2B56E665
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 17:41:42 +0000 (UTC)
Received: by wmec201 with SMTP id c201so84566716wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Dec 2015 09:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=AmbNyVM90DwHWqCD3s2DbghMQMQvTrgQcpgAwOowhto=;
	b=L0lWGFJfnmn26lwgl9hLrpYlAOj4pFoYaeeFwm+fC8TRfHE5LvgCRk86MMvWi3oIY0
	MhfooIktdM+ib9+zSToSpojDL+WIybWgb3EXpt4ynmdY9sIg7xZGT06p23xjuiD1iU/I
	GfxbmGb+jeLK7XwqqC+fOs14rd6t+LlX6yZOUHgH5bq8917MFE5ClaDGIbQx1RbpGaca
	gyfjeuyXXpz98d/AaKNWRBN3eEdJdLYiXjQl9wnWIRpRdcOROZ/5YHbQzyd6i0Iy44TE
	yWI5YAs2Shq9dbW1ZwPzctxdJU2902e2LKUj2Zi/XvfSE/yY+n/lVCPMKugVcWhMY2X3
	7/8g==
X-Received: by 10.194.93.6 with SMTP id cq6mr7441593wjb.165.1449682902745;
	Wed, 09 Dec 2015 09:41:42 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id h5sm8660241wjz.21.2015.12.09.09.41.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Dec 2015 09:41:41 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Dec 2015 10:41:20 -0700
Message-Id: <1449682880-21963-3-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
References: <1449682880-21963-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2][RESEND 3/3] gpsd: also support bluez5
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
X-List-Received-Date: Wed, 09 Dec 2015 17:41:44 -0000

From: Christopher Larson <chris_larson@mentor.com>

gpsd uses libbluetooth, not the dbus interface, so it can work with bluez5 as
well, as the library is compatible.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
index dae39c2..6ae2f30 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
@@ -34,8 +34,8 @@ SYSTEMD_OESCONS = "${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-PACKAGECONFIG ??= "qt ${@base_contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)}"
-PACKAGECONFIG[bluez4] = "bluez='true',bluez='false',bluez4"
+PACKAGECONFIG ??= "qt ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
+PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
 PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
 EXTRA_OESCONS = " \
     sysroot=${STAGING_DIR_TARGET} \
-- 
2.2.1


