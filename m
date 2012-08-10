Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szplm-0003Mh-Mu
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:00:54 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so1221497wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=5sfRODee499MkQclbOpAneTwNP8IkBG93NVrWp1E9zo=;
	b=KShkMvlieTJ9dZjf1gmASaSpNbFmm0ysYm3iRnitkXaNNAFvAsKvgZ2xkXdu3dfpxN
	0oZHKH7w5Udl6uUNVErB1yw6SygWB70mZgS17ybSzCZKB/Uj9jDNFtUR1YRtuALqfjKD
	yMzwsyd8W+9/5kTAVwS3HrH+IrrA+pvF9qcLgMwRqaXVISFyHKiyhzpTa1Bhj4xdwhwz
	VSZtw0TXStQ0LNDFWNYGQNXyyPUrQKGj+l/Zy2sUqomK84O2+6PretUF+q4qdvgZsDo9
	UwXsMGkWEptIAi4VBUr93j8m6R/kuUbh7k6DV4/JqtyH5nyJlYK7PwiyoDMQ6zgJB1VR
	2RPQ==
Received: by 10.180.105.163 with SMTP id gn3mr6327780wib.2.1344606547255;
	Fri, 10 Aug 2012 06:49:07 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm11648733wiz.9.2012.08.10.06.49.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:49:06 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:35 +0200
Message-Id: <8c75c4f24427daeff410daff450a57e3caced20d.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 40/46] e-wm: illume2 profile was renamed to mobile
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
X-List-Received-Date: Fri, 10 Aug 2012 14:00:54 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/e-wm_svn.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-efl/recipes-efl/e17/e-wm_svn.bb b/meta-efl/recipes-efl/e17/e-wm_svn.bb
index bbe5ef9..8e70507 100644
--- a/meta-efl/recipes-efl/e17/e-wm_svn.bb
+++ b/meta-efl/recipes-efl/e17/e-wm_svn.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=76de290eb3fdda12121830191c152a7d"
 SRCNAME = "e"
 PV = "0.16.999.060+svnr${SRCPV}"
-PR = "r4"
+PR = "r5"
 SRCREV = "${EFL_SRCREV}"
 
 inherit e update-alternatives gettext
@@ -66,9 +66,13 @@ RDEPENDS_${PN}_append_libc-glibc = " glibc-utils "
 # The systray module used to be external, but is part of e-wm now
 RREPLACES_${PN} = "systray"
 
+RREPLACES_${PN}-config-mobile = "${PN}-config-illume2"
+RCONFLICTS_${PN}-config-mobile = "${PN}-config-illume2"
+RPROVIDES_${PN}-config-mobile = "${PN}-config-illume2"
+
 PACKAGES =+ "\
   ${PN}-config-default \
-  ${PN}-config-illume2 \
+  ${PN}-config-mobile \
   ${PN}-config-minimalist \
   ${PN}-config-netbook \
   ${PN}-config-scaleable \
@@ -120,7 +124,7 @@ FILES_${PN} = "\
 "
 
 FILES_${PN}-config-default = "${datadir}/enlightenment/data/config/default"
-FILES_${PN}-config-illume2 = "${datadir}/enlightenment/data/config/illume"
+FILES_${PN}-config-mobile = "${datadir}/enlightenment/data/config/mobile"
 FILES_${PN}-config-minimalist = "${datadir}/enlightenment/data/config/minimalist"
 FILES_${PN}-config-netbook = "${datadir}/enlightenment/data/config/netbook"
 FILES_${PN}-config-scaleable = "${datadir}/enlightenment/data/config/scaleable"
-- 
1.7.8.6



