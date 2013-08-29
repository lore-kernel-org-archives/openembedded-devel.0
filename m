Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 1CC706BDD5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:19 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so344042eek.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=VLOWZ2RsBxcgAd14MqgUBfRGcnpvImIl+8J6q5qts+c=;
	b=NICzwCWkyIrKhL3InT7ZmRENfn33gQMRcKgXI6ibQhaqvUbK9P8ok26XLMCB4zBF0b
	ARiyTUZgr4pRmo+ZG8UPK+FPCgeDdXjOWirI/eS4cnmdVxWY84SxUnC4o3az7/SGR+rt
	CnOHbx7G4HF4R7fKLeywlvsUSC2cfLgZUxXH6bXdNti9wtPff8mIXFlDapW9g+OynUhJ
	iRfVfF3juj2gyxMovk95kC9Z71gLOrOMmF5WXq8I3vxQe1YC96T98f+e1cevLcVHqNX3
	glGijZzsUDOGzgpU0XuJkbyXu7IFoQ6IhbngkDPcKmFETrftGVCaWMpw8gTdPkTNpV28
	U+4g==
X-Received: by 10.15.83.2 with SMTP id b2mr5412996eez.28.1377791480564;
	Thu, 29 Aug 2013 08:51:20 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a6sm47158513eei.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:16 +0200
Message-Id: <802bd2bc63792faa95ef7fbe2a70d559f980595f.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 23/66] mpd: Add PACKAGECONFIG for undeterministic dependencies
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
index 6f2a912..1e93928 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.17.1.bb
@@ -23,6 +23,14 @@ EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemds
 PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
 PACKAGECONFIG[id3tag] = "--enable-id3,--disable-id3,libid3tag"
 PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
+PACKAGECONFIG[audiofile] = "--enable-audiofile,--disable-audiofile,audiofile"
+PACKAGECONFIG[cdio] = "--enable-cdio-paranoia,--disable-cdio-paranoia,libcdio"
+PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack"
+PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
+PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
+PACKAGECONFIG[soup] = "--enable-soup,--disable-soup,libsoup-2.4"
+PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
+PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
 
 do_install_append() {
     install -d ${D}/${localstatedir}/lib/mpd/music
-- 
1.8.3.2


