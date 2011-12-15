Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RbAKv-0005b5-SU
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Dec 2011 13:22:58 +0100
Received: by mail-ee0-f47.google.com with SMTP id b15so1718019eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Dec 2011 04:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=egfRU3HEDCFiu8FskwMeNOwd8tjVfpMlp9L5KgJsl8s=;
	b=YSIhNkdFIA86UCfBNezN25lHAFvE4eC4+jU3UkQqlupYPrRUZ+1wfa0ByPJP6g7bvC
	mdyQjucUbkUDl7zTSJU8IbSVHjMKvsGMZMVLdEbrq3TCX+NjbHdP7MXMzKh9IlMDmsg2
	yiAxqcbYFi0Yfjo+p8Uv3C/T0XtsnXswK3E7s=
Received: by 10.14.123.16 with SMTP id u16mr1326866eeh.30.1323951361730;
	Thu, 15 Dec 2011 04:16:01 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z43sm23488132eef.7.2011.12.15.04.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Dec 2011 04:16:01 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Dec 2011 13:15:48 +0100
Message-Id: <14695ed754963f85a601e945e21179c00199661a.1323951062.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8
In-Reply-To: <cover.1323951062.git.Martin.Jansa@gmail.com>
References: <cover.1323951062.git.Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-efl 1/6] epdfview: disable cups
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
X-List-Received-Date: Thu, 15 Dec 2011 12:22:58 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

* we usually don't want cups in target images, but cups was sometimes
  autodetected and compilation failed
* | PrintPter.cxx:19:23: fatal error: cups/cups.h: No such file or directory
  Under the SHR distribution for the nokia900 machine(and maybe all other machines)

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/epdfview_0.1.8.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
index 5351733..5f6bbf4 100644
--- a/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
+++ b/meta-efl/recipes-efl/efl/epdfview_0.1.8.bb
@@ -5,6 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 SECTION = "x11/applications"
 DEPENDS = "gtk+ poppler"
 
+PR = "r1"
+
+EXTRA_OECONF += "--without-cups"
+
 inherit autotools gettext
 
 SRC_URI = "http://www.emma-soft.com/projects/epdfview/chrome/site/releases/epdfview-${PV}.tar.bz2"
-- 
1.7.8



