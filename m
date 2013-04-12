Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQlFf-0000eo-W2
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Apr 2013 23:11:25 +0200
Received: by mail-pa0-f48.google.com with SMTP id lj1so1640771pab.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2013 13:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KFEkCQI/7h8XkILCaHRMsHOc796qjy1ta9a3nvkoHUc=;
	b=B4Jms0LP25DQDiRmJQZBMSZ3IfYO8XqMYjD5ejODFcc4gSujLlj8OkpF+YZ6mGIA24
	UAQ2HSyUmQAmeE/DbCALjIOBJC8b1NdyCHvf7j/r7P9bGeLLswusCnuo8QTagn2U8YLN
	WMDaa9Bg27oICgjPbx/4in4e9TQ0XRNDfnP60TdXcZhfTYtWmwxV6gCz+oR9a2XnR6w3
	cpCKXf3ZNF4v+YlHXzODzRx4JYuBvCr6KTWygIHhKRWL31zfZwNQMRLF+xC/NSoRzO85
	mMFs446s05xnqQOt6ZDitqErW+keALYCCiTfm0zLjt/NcfzO/jlyLCJkj3FkUbD7wUEx
	lMqQ==
X-Received: by 10.66.144.69 with SMTP id sk5mr17880500pab.69.1365800034399;
	Fri, 12 Apr 2013 13:53:54 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vk7sm9816096pbc.41.2013.04.12.13.53.51
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 13:53:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Apr 2013 22:50:11 +0200
Message-Id: <1365799812-5676-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365799812-5676-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365799812-5676-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-systemd][meta-gpe][PATCH 3/4] gpsd: fix warning about overwritting keys
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
X-List-Received-Date: Fri, 12 Apr 2013 21:11:29 -0000

* WARNING: Variable key FILES_${PN}-dev (${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la ${libdir}/*.o ${libdir}/pkgconfig ${datadir}/pkgconfig ${datadir}/aclocal ${base_libdir}/*.o ${libdir}/${BPN}/*.la ${base_libdir}/*.la) replaces original key FILES_gpsd-dev ( ${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc).

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index e98d795..ceb700a 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -91,7 +91,7 @@ pkg_postrm_${PN}-conf() {
 
 PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
 
-FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
+FILES_${PN}-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
 
 FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
 
-- 
1.8.1.5



