Return-Path: <mbc@koumoul.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id BF983770C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  3 Oct 2015 21:18:09 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so69330819wic.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Oct 2015 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=lRNKPI/tNINQp87zYT4wNQ4Pz0YGnr1IcsRWQJ1fwtk=;
	b=E5KxyxJkxW8csbD2ubfZhtsSUKhQj//XcHxRDzBnilIxPvnCFhtjybUMgvl4wXAd8g
	NhX+HNidMDLuEpY5/uj/tlc65i4p8jUQUeM8WClMW2nivj0zU92xCqurSRMF3PkcBpSw
	ZVUB79fkQb7QP3mJSNMBK8QnIRHStwuamVBP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=lRNKPI/tNINQp87zYT4wNQ4Pz0YGnr1IcsRWQJ1fwtk=;
	b=CPUkVhKE6FweRtzjcp7rQ5H47b2TvjkH4dBvkiPBYlTg2CpiKZpsofhItPz/9oGihv
	YrobvDVwanCFvquQmbW7BmszYi9BiL862Q8TK7GnCKhf+MbsJTV+v7YwTbLHjhAAqa+t
	LvChrJsOvjiG+i4bH/3/rF1wc6OuTrEZ2dC+YYP14FVj5bdPLK1j436gNXsTTBSb5yKc
	sUfgutptzmNvnb9Ul2THg53/xLsD0Ji8JofaiANtaRo/xCQb9XseLBt0Z6o435A2CKTG
	BDrPmH+2mslPzylQLpPAsAgRxStWTMKCAfBeJvET5UDui9xRB7q4SugoGZTjoit5p1CK
	abXw==
X-Gm-Message-State: ALoCoQmhpEYWMsMmFIIQ9nh8dPUHGFAKu12xn4lK+Cdsdnb6a9koSGhvlsIFqsOwBXBsHdvyAlRi
X-Received: by 10.180.211.10 with SMTP id my10mr4107180wic.84.1443907089050;
	Sat, 03 Oct 2015 14:18:09 -0700 (PDT)
Received: from localhost.localdomain
	(ARennes-655-1-187-70.w2-13.abo.wanadoo.fr. [2.13.130.70])
	by smtp.gmail.com with ESMTPSA id
	bk4sm18227657wjc.1.2015.10.03.14.18.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Oct 2015 14:18:08 -0700 (PDT)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  3 Oct 2015 23:22:39 +0200
Message-Id: <1443907359-22569-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v3][meta-multimedia] mkvtoolnix: fix Boost 1.58 build, update to 7.9.0
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
X-List-Received-Date: Sat, 03 Oct 2015 21:18:12 -0000

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
+SRCREV_libebml = "04b34b0dbded40e0cec93cafa6a4f4c8e90c3206"
+SRCREV_libmatroska = "db5d627b5bf48516c9e0b540254c0d36595760c3"
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


