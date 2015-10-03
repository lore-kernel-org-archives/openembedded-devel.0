Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f171.google.com (mail-wi0-f171.google.com
	[209.85.212.171])
	by mail.openembedded.org (Postfix) with ESMTP id 84CE477084
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 21:04:50 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so72936411wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 14:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=owHvt6x/Go9MYPBdm2UAhLbxwTfu8RX5sfzaC9xMrYU=;
	b=Qb83Xd/FrWImEAC2MUFGUHj865v6BAtupF4w01v0NxS+jppoHP3bO2dgWhUFMBGJeG
	hOtkw+LmyrDXI10WLiz4E2MIixViCW0fxmm+KS/EZsWWI7PZRQF9UY7Auhz7OMvSNrnH
	1MiFkad5vUF07Y3783the71a+ObLhux6RANyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=owHvt6x/Go9MYPBdm2UAhLbxwTfu8RX5sfzaC9xMrYU=;
	b=fyIz4E5hml3AWsHsVwGpz23dLTOgbTNsDDFPo99tAqgfl2eZvxEGPBnq5m7As29uPc
	Aw9lxsHz7yPcT+Ug+b3FmUSgxYIs/6rwLpifj67IlYmwEu2iO8rH+fmbQhPm4N6zMy8I
	UeyW+lFy5dL5TdLO8DJARD8J7qaIpGlqZETgqUaBVtLfW+dcTX96kzxwUxzAosW8umqn
	A7W9+2S9+apauYw27Qb+nnoyoSxOHDv6Z3sZM5dgj1bhxG8uZhYQmO4ptq5kN+gu4YqK
	/qyBE4Jfj3uov/+52Bc2GI8+/rN+P+SVuU7/iQq6cWsPuu+qb1lCFO1i/1yL6WwjXT4m
	rBzQ==
X-Gm-Message-State: ALoCoQngtG7jatR4V7a22nsgEFocaPWfi1hFpNImDogNHu4RBuOiB01kvoCF4Y2n3cYoz6AeSEjj
X-Received: by 10.194.112.162 with SMTP id ir2mr25499243wjb.40.1443906290039; 
	Sat, 03 Oct 2015 14:04:50 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id
	fs9sm5863042wic.24.2015.10.03.14.04.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Oct 2015 14:04:49 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Oct 2015 23:09:20 +0200
Message-Id: <1443906560-22202-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
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
X-List-Received-Date: Sat, 03 Oct 2015 21:04:53 -0000

mkvtoolnix does not compile with newest Boost 1.58, mostly
due to the following bugs :
https://github.com/mbunkus/mkvtoolnix/issues/1172
https://github.com/mbunkus/mkvtoolnix/issues/1176

Update to the version immediately subsequent to their
fixes, and adapt configure steps accordingly.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
index dd613b3..da10153 100644
--- a/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
+++ b/meta-multimedia/recipes-mkv/mkvtoolnix/mkvtoolnix_git.bb
@@ -6,9 +6,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "curl boost expat zlib libebml libmatroska libogg libvorbis bzip2 lzo file ruby-native"
 
-PV = "7.1.0+git${SRCPV}"
-SRCREV = "0c89ff941bfdd9f3378312f293a84f13cf3e2a96"
-SRC_URI = "git://github.com/mbunkus/mkvtoolnix.git"
+PV = "7.9.0+git${SRCPV}"
+SRCREV_mkvtoolnix = "1a8b23b1e82ed180a5aaeb43537f2426be252985"
+SRCREV_libebml = "${AUTOREV}"
+SRCREV_libmatroska = "${AUTOREV}"
+SRCREV_FORMAT = "mkvtoolnix"
+SRC_URI = " \
+           git://github.com/mbunkus/mkvtoolnix.git;name=mkvtoolnix \
+           git://github.com/Matroska-Org/libebml.git;name=libebml;destsuffix=git/lib/libebml \
+           git://github.com/Matroska-Org/libmatroska.git;name=libmatroska;destsuffix=git/lib/libmatroska \
+          "
 
 S = "${WORKDIR}/git"
 
@@ -28,7 +35,7 @@ EXTRA_OECONF = " --with-boost-libdir=${STAGING_LIBDIR} \
 
 # remove some hardcoded searchpaths
 do_configure_prepend() {
-    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/ebml.m4
+    sed -i -e s:/usr/local/lib:${STAGING_LIBDIR}:g -e s:/usr/local/include:${STAGING_INCDIR}:g ${S}/ac/qt5.m4
 }
 
 # Yeah, no makefile
-- 
1.8.3.1


