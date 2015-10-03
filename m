Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id D278A77080
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 16:36:27 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so65202161wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=G+tm6Cp5PMZ1quCYjAaK3F6jDr6mylzRXf64Y1A3TNg=;
	b=kiB1pB8+KfpCX+mB6eiLqRLok+4qjbonitycU4H4d3HM5yiL0AewvLaBPr+sIIBsea
	ULSLNXfygiFJsmrBfSF1VDMWE5QnVTdqDP4PR09VaE9SbLvpehn+wi9pzkWDtMajQePj
	X8RZyIN2ZNJacGQ9ioFakFAwVdFZxKwHQXypI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=G+tm6Cp5PMZ1quCYjAaK3F6jDr6mylzRXf64Y1A3TNg=;
	b=ATbCpPoZi98W6LGciFg4doDi3SykY9y73Hbz14Bjs8r1XqvXiUmtzxZGszcKr2/sGC
	fu07sju/aR2aT/BQyt/r3UtZ01k/IHbxNW7HVM5yxKVf9uwBj0so/b9P7UjBJOjlyXXU
	hliONovYvmcyOQM2z/htjRNhjQcfsZuLFSUeOaf5l1gIGvBOb3Lz9KgiMa906oMnGZhU
	+3xd5VIetJbNLRNTdfyg9q2brDGV96+FCScNfOIuR5hcyX3+o9ATtSc4j9YBUbMyxRxp
	QCbdPV40bt7hISA7kirNvIiBXJggamvCpd46E8tAoCueXcqzwFwFiDbe/A+201slROuz
	qbLw==
X-Gm-Message-State: ALoCoQnMgaFVV96fCiSk0yKFvox4mZ3GoIFKlLVxnOENqxh636ijtGRr9GZzrLfvrajYkzfzcrf/
X-Received: by 10.180.188.33 with SMTP id fx1mr3324847wic.31.1443890187817;
	Sat, 03 Oct 2015 09:36:27 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id
	pb4sm17223005wjb.8.2015.10.03.09.36.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Oct 2015 09:36:27 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Oct 2015 18:40:51 +0200
Message-Id: <1443890451-20749-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Oct 2015 16:36:31 -0000

mkvtoolnix does not compile with newest Boost 1.58, mostly
due to the following bugs :
https://github.com/mbunkus/mkvtoolnix/issues/1172
https://github.com/mbunkus/mkvtoolnix/issues/1176

Update to the version immediately subsequent to their
fixes, and adapt configure steps accordingly.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
index dd613b3..223b4ed 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis bzip2 lzo file ruby-native"
 
-PV = "7.1.0+git${SRCPV}"
-SRCREV = "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
+PV = "7.9.0+git${SRCPV}"
+SRCREV = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
 SRC_URI = "git://github.com/mbunkus/mkvtoolnix.git"
 
 S = "${WORKDIR}/git"
@@ -28,7 +28,9 @@ EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
 
 # remove some hardcoded searchpaths
 do_configure_prepend() {
-    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
+    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
+    git submodule init
+    git submodule update
 }
 
 # Yeah, no makefile
-- 
1.8.3.1


