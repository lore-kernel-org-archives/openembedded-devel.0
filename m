Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PElgy-0005uT-AG
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 17:32:38 +0100
Received: by ewy2 with SMTP id 2so2172499ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=sTTaEJmYMS1GF/RpXDdctpol/eTU7/Uz8uBQI82k3kE=;
	b=fd+eKdo3IB+vbkVkVd2Wr1WCVGtxPxJX1BEZhfdbzVrrzeVhzx3H1sRMONayS4prc+
	vFc5RrWPmK7Y2muW4f737ePlgoijYVJWae7gr6NQGKX27L3FZjTywxgwSPSrdmrnKd2b
	E83xVQoBB3KXtYQHbPIlxwmR6p68t9AF4+vck=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=r3/4J8PEVuZgoMap6XnoxGfH8alblYLHUjWSXOkkvt+bXO+3149fya3/7EoSEVnxf6
	1g1Od8echV3l7wi5Gdn3s1WWp2kKbFMqIgjrTP/LsUsHEZbGxSKdwKgI7Qx+bqfslFM3
	c7xZDQGu+pqC4uF1oe9RJNS8F/wqkYaWWMkNQ=
Received: by 10.14.53.69 with SMTP id f45mr1838114eec.17.1289061100264;
	Sat, 06 Nov 2010 09:31:40 -0700 (PDT)
Received: from localhost.localdomain ([93.182.199.230])
	by mx.google.com with ESMTPS id b52sm2275628eei.13.2010.11.06.09.31.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 09:31:37 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 16:31:24 +0000
Message-Id: <1289061084-19901-1-git-send-email-moncelier@devlife.org>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: [PATCH 01/11] parted: Added parted-native
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
X-List-Received-Date: Sat, 06 Nov 2010 16:32:38 -0000

Signed-off-by: Camille Moncelier <moncelier@devlife.org>
---
 recipes/parted/parted_2.3.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes/parted/parted_2.3.bb b/recipes/parted/parted_2.3.bb
index d2ac303..6efb398 100644
--- a/recipes/parted/parted_2.3.bb
+++ b/recipes/parted/parted_2.3.bb
@@ -3,14 +3,18 @@ HOMEPAGE = "http://www.gnu.org/software/parted/parted.html"
 LICENSE = "GPLv3"
 SECTION = "console/tools"
 DEPENDS = "readline util-linux-ng lvm2"
+DEPENDS_virtclass-native = "readline-native util-linux-ng-native"
 
 SRC_URI = "${GNU_MIRROR}/parted/parted-${PV}.tar.gz \
            file://use_llseek_syscall.patch \
           "
            
 EXTRA_OECONF = "--disable-Werror ac_cv_func_calloc_0_nonnull=yes"
+EXTRA_OECONF_virtclass-native = "--disable-device-mapper"
 
 inherit autotools pkgconfig
 
 SRC_URI[md5sum] = "30ceb6df7e8681891e865e2fe5a7903d"
 SRC_URI[sha256sum] = "e81fa140805b5cd029ff6dda5cfa94d223e83ac182ebcae94f841d62ce468829"
+
+BBCLASSEXTEND = "native"
-- 
1.7.3.1



