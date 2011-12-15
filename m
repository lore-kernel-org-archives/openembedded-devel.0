Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbAL9-0005b5-Oe
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 13:23:11 +0100
Received: by mail-ee0-f47.google.com with SMTP id b15so1718019eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 04:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FBYn8HrGGeq0zL6Q14/L6gCRcKuuafFr9bOtgU+K/DQ=;
	b=dCsgvP8knVe1Lnc+8SPjgmcVDV+zZEEeu4u7rWJGmuDTBDHvONjeKzZjy8nKQPxeN6
	PaLuFseoUW2pjnsRfAJbzVNnztYNzQde0QgilHEO6dLAHZJFOdkzl2EdRnC9oryqBq5Z
	XyVg3zqN8fRNoPD4hYVBWGb2eIsociM4V4nf0=
Received: by 10.14.2.136 with SMTP id 8mr1392287eef.13.1323951376232;
	Thu, 15 Dec 2011 04:16:16 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j20sm23479743eej.8.2011.12.15.04.16.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 04:16:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 13:15:50 +0100
Message-Id: <c1e91f1503386bc6a0ceeaae0b7fcc8213489704.1323951062.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
References: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1323951062.git.Martin.Jansa@gmail.com>
References: <cover.1323951062.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 3/6] samba: Force python disabled for now to avoid host contamination
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
X-List-Received-Date: Thu, 15 Dec 2011 12:23:11 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-connectivity/samba/samba_3.5.6.bb |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba_3.5.6.bb b/meta-oe/recipes-connectivity/samba/samba_3.5.6.bb
index d5945f9..6885235 100644
--- a/meta-oe/recipes-connectivity/samba/samba_3.5.6.bb
+++ b/meta-oe/recipes-connectivity/samba/samba_3.5.6.bb
@@ -3,6 +3,8 @@ require samba-basic.inc
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://../COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+PR = "r1"
+
 SRC_URI += "file://config-h.patch \
             file://tdbheaderfix.patch;patchdir=.."
 
@@ -12,6 +14,7 @@ SRC_URI[sha256sum] = "466410868375d19a286ac3fc5d9f3c267ce359189f8e0d76e72ec10bd5
 S = "${WORKDIR}/samba-${PV}/source3"
 
 EXTRA_OECONF += "\
+	ac_cv_path_PYTHON=/not/exist \
 	SMB_BUILD_CC_NEGATIVE_ENUM_VALUES=yes \
 	samba_cv_CC_NEGATIVE_ENUM_VALUES=yes \
 	linux_getgrouplist_ok=no \
-- 
1.7.8



