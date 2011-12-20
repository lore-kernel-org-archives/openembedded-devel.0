Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rd0NL-00044O-Ec
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 15:09:03 +0100
Received: by mail-ee0-f47.google.com with SMTP id t10so2604639eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kKthtHHJ6OaWCcSkTR2/FfBQfWYmrE4X9TovpawFAO8=;
	b=TlMRbO8q0hUag48MtLiBL79K+QxUDJc2is7hABRZPFiX1iGuuw5EA5F9VpovmiFMT3
	EjMaS5F3FWydeDprYa8jhXCYVaqiDu+5bCZqe+7o6cb/3fsDSKTeUUsfmxEu9fKwdDYr
	dDcoowcPDWBez4mV0aFXNMMUyWnz/dLe0STgg=
Received: by 10.14.52.2 with SMTP id d2mr1028191eec.60.1324389721923;
	Tue, 20 Dec 2011 06:02:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s16sm7199622eef.2.2011.12.20.06.02.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 06:02:00 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Dec 2011 15:01:15 +0100
Message-Id: <18b6e66d1db5faead7400b21c4a6222157dbaf92.1324389403.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
References: <458f724d9bdb716b6907ea797a92fe0f67f1f72b.1324389403.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1324389403.git.Martin.Jansa@gmail.com>
References: <cover.1324389403.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 6/7] navit: bump PR after gpsd upgrade (.so name change)
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
X-List-Received-Date: Tue, 20 Dec 2011 14:09:03 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/navit/navit_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-navigation/navit/navit_svn.bb b/meta-oe/recipes-navigation/navit/navit_svn.bb
index 67da7a9..1aee3c7 100644
--- a/meta-oe/recipes-navigation/navit/navit_svn.bb
+++ b/meta-oe/recipes-navigation/navit/navit_svn.bb
@@ -2,7 +2,7 @@ require navit.inc
 
 SRCREV = "4841"
 PV = "0.2.0+svnr${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/${PN}"
 SRC_URI += "svn://anonymous@navit.svn.sourceforge.net/svnroot/navit/trunk;module=navit;proto=http "
-- 
1.7.8



