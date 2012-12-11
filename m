Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1TiXze-0003Pd-MI
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Dec 2012 23:08:06 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2531457eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Dec 2012 13:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=rvW/bhTlfVU9nyj3/StKAzP+nQCOK1e84r5nt2R2NOg=;
	b=NUQIZ/35vXujmL4aYqoP5PbW44O0JM3UlINV3A20AkUIjPiENfSoSiMKRiU4eMuzW1
	xz95pxzSfqAMhQ459tt8FBKpVaQ5m3yMWCbsDepZgAtoV+R2/VYQC6unJk//lNnfvWWn
	QU7Ff8fEyOF6BWc6wk5Z+PWkW43oLQAvecMm2+he2ydisYoBPdTh+8LlbdBxKB9ipj4W
	2ku4Q6fJlta+qnYvTHN3T+jCy+FfisJFMtjOSKH4Ypp21nb550oijrFXuCm8aIu+ADzY
	0wcfvg7nwkyyp/MlxedTXbIx8hik7xa5N92DS2xrgAG5N1stAXgYF1NkTZyU89FHYSLZ
	/CdA==
Received: by 10.14.204.198 with SMTP id h46mr55814817eeo.1.1355262810155;
	Tue, 11 Dec 2012 13:53:30 -0800 (PST)
Received: from mizar.localdomain
	(host85-229-dynamic.1-79-r.retail.telecomitalia.it. [79.1.229.85])
	by mx.google.com with ESMTPS id b2sm52258386eep.9.2012.12.11.13.53.28
	(version=SSLv3 cipher=OTHER); Tue, 11 Dec 2012 13:53:29 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Dec 2012 22:53:24 +0100
Message-Id: <1355262804-2872-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH] linux-yocto_3.4.bbappend: restrict DEFAULT_PREFERENCE to Zaurus only
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
X-List-Received-Date: Tue, 11 Dec 2012 22:08:06 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 recipes-kernel/linux/linux-yocto_3.4.bbappend |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto_3.4.bbappend b/recipes-kernel/linux/linux-yocto_3.4.bbappend
index 59e0fb4..7772dde 100644
--- a/recipes-kernel/linux/linux-yocto_3.4.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.4.bbappend
@@ -2,7 +2,12 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.4:${THISDIR}/${PN}:${THISDIR}/fil
 
 COMPATIBLE_MACHINE .= "|akita|c7x0|collie|poodle|spitz|tosa"
 
-DEFAULT_PREFERENCE = "-1"
+DEFAULT_PREFERENCE_akita = "-1"
+DEFAULT_PREFERENCE_c7x0 = "-1"
+DEFAULT_PREFERENCE_collie = "-1"
+DEFAULT_PREFERENCE_poodle = "-1"
+DEFAULT_PREFERENCE_spitz = "-1"
+DEFAULT_PREFERENCE_tosa = "-1"
 
 KMACHINE_akita = "akita"
 KMACHINE_c7x0 = "c7x0"
-- 
1.7.8.6



