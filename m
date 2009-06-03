Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MBsg6-0000eP-7Q
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Jun 2009 17:46:58 +0200
Received: by mail-bw0-f219.google.com with SMTP id 19so72910bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jun 2009 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=ymgI8mwEPHmNDwGv+AUg434kffVm21tU6UxSI1ALFc0=;
	b=cARXOD/svR08dtU2V6k0kkYWduLbAJ2tSmXr4b9V5Gvx4wp3yiMQvUuTRX1Eq9nhga
	01DiBuXz1vjKO91QrVN56xCKkiPQaweM5y5pONYIE4StZyG4YOFMMMU4qe4398aD/oJ5
	9EWuJvO4HkPbokBao8VBU0Aj8I7pN5dEbMRg8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=tpxfQ8LiJ2spIeHZT89Bbw/Wbqmv88pjTvZZDcK82bnudxMaaDnAzkhK6tdsu/D7Dd
	lFsbl2KWCJQ7XcX6HBzP7NBzgxbMn1x8zIs8crYAaYDDKCRxD9VDdXD2v6cXXpq8uFFw
	MTDK3sRbTHBIuDzW3BRvMc+nh3UuiAVdavYXI=
Received: by 10.103.243.9 with SMTP id v9mr728795mur.5.1244043481182;
	Wed, 03 Jun 2009 08:38:01 -0700 (PDT)
Received: from localhost (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id g1sm753112muf.26.2009.06.03.08.38.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 03 Jun 2009 08:38:00 -0700 (PDT)
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  3 Jun 2009 18:37:19 +0300
Message-Id: <1244043442-3868-10-git-send-email-ihar.hrachyshka@gmail.com>
X-Mailer: git-send-email 1.6.3.1
In-Reply-To: <1244043442-3868-9-git-send-email-ihar.hrachyshka@gmail.com>
References: <20090603151754.GI26065@smtp.west.cox.net>
	<1244043442-3868-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-5-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-6-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-7-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-8-git-send-email-ihar.hrachyshka@gmail.com>
	<1244043442-3868-9-git-send-email-ihar.hrachyshka@gmail.com>
Subject: [PATCH 09/12] qt4: fixed pkgconfig for qt4-embedded
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
X-List-Received-Date: Wed, 03 Jun 2009 15:46:58 -0000

Added ${QT_LIBINFIX} for pkgconfig dependencies.

Signed-off-by: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
---
 recipes/qt4/qt4.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes/qt4/qt4.inc b/recipes/qt4/qt4.inc
index a6a2bfc..de7ae15 100644
--- a/recipes/qt4/qt4.inc
+++ b/recipes/qt4/qt4.inc
@@ -222,6 +222,9 @@ do_install() {
     sed -i -e s#"moc_location=.*$"#"moc_location=${bindir}/moc4"# \
            -e s#"uic_location=.*$"#"uic_location=${bindir}/uic4"# \
            ${D}${libdir}/pkgconfig/*.pc
+    for name in ${QT_LIB_NAMES}; do
+           sed -i -e /Requires/s#"${name}"#"${name}${QT_LIBINFIX}"#g ${D}${libdir}/pkgconfig/*.pc
+    done
 
     install -d ${D}/${libdir}/fonts
     touch ${D}/${libdir}/fonts/fontdir
@@ -244,6 +247,9 @@ do_stage() {
     sed -i -e s#"moc_location=.*$"## \
            -e s#"uic_location=.*$"## \
            ${STAGE_TEMP}/${libdir}/pkgconfig/*.pc
+    for name in ${QT_LIB_NAMES}; do
+           sed -i -e "/Requires/s#${name}#${name}${QT_LIBINFIX}#"g ${D}${libdir}/pkgconfig/*.pc
+    done
 
     # fix libtool files
     sed -i -e s#installed=yes#installed=no#g ${STAGE_TEMP}/${libdir}/*.la
-- 
1.6.3.1



