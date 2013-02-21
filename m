Received: from mail-da0-f42.google.com ([209.85.210.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1U8QuX-0001jf-4k
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Feb 2013 08:49:45 +0100
Received: by mail-da0-f42.google.com with SMTP id z17so3995911dal.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Feb 2013 23:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=bfGFJkhpO9WgGeeuu+dc7etjMfCNx/ZpggHt3oRzXQw=;
	b=kcLSLikSkgH1PyZzyoGn/wJJ6NAizocmwJmeTrwSHBeX47kuoRZcrbg5noIS5cMOAo
	+uX2C+/JPymSLEqoTiNGNzGjIqXgYVinIUTg/f+vJY1EZvr6S31K7Tt+46bfuO0yPL6k
	W0V0SdNv9FOv2l5LSTJArwy+czMrezKc5UoFgCWUK0JCjPoyEUolAmRzPbGY3F9spw4t
	EKfNxGXKpQkbLA3aT4e1Y+oT6HIg6xcXXlnNHDsjzYkoAuOGiHL9KyrGHKxVo93/P6DZ
	DfBgrtv1KXhlthVCBaD9m7kWZH/+URczGUcBiM207J8qEA3v3MUOcwd6sibeoEnkqOtH
	C+2Q==
X-Received: by 10.66.5.138 with SMTP id s10mr9631502pas.52.1361432011994;
	Wed, 20 Feb 2013 23:33:31 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168]) by mx.google.com with ESMTPS id
	bi2sm114089782pab.18.2013.02.20.23.33.30
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 20 Feb 2013 23:33:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Feb 2013 23:33:20 -0800
Message-Id: <1361432001-14607-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-kde][PATCH 1/2] packagegroup-kde-apps.bb: Fix multiline comment
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
X-List-Received-Date: Thu, 21 Feb 2013 07:49:46 -0000
X-List-Received-Date: Thu, 21 Feb 2013 07:49:46 -0000

bitbake does not parse the recipe otherwise

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes-packagegroups/packagegroup-kde-apps.bb |    1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-packagegroups/packagegroup-kde-apps.bb b/recipes-packagegroups/packagegroup-kde-apps.bb
index 4258c4f..d681754 100644
--- a/recipes-packagegroups/packagegroup-kde-apps.bb
+++ b/recipes-packagegroups/packagegroup-kde-apps.bb
@@ -9,6 +9,7 @@
 #calligra-sheets \
 #calligra-stage \
 #calligra-words \
+#
 DESCRIPTION = "KDE packagegroup for applications"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
-- 
1.7.9.5



