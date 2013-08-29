Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC156BE7D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:52:15 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so343318eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=1plEHTaryN4ua28novaZQc385hThpab6hqsVa74bMck=;
	b=TFp9ZdfI9uehEC9VwQvTTTphP4ScZsL7mDcyt6KHfc0c3N0VooS5LXCo5xOxFfRR29
	QV6fH9Ik23ze6L2SpaTesNRwcxuTtSFjMh78ujJE2PiNLoslosaGr6FIynS4h7IxAdLa
	HWEbKDOfDMkk0yp/ePODCS0A3+4Ox9lndn+kF+hECQf5AcrvAx9447M26WOG0uGOnsKf
	lr/yv5T+mqm6DaIV+3vSLcGte3fqThV4ftJKyAch3DlVfzPp9+iQM8EvZ35XdBP0SPUI
	k8IJ1Jf0TjMESNeLuv+e/ESLBclInA53VLDJcCtKosrUu/8PBuQawDfXAyzVzqJprAOK
	yKJw==
X-Received: by 10.14.9.72 with SMTP id 48mr5290816ees.42.1377791535896;
	Thu, 29 Aug 2013 08:52:15 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n48sm47243080eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:52:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:58 +0200
Message-Id: <334457b5ce147213dbfbf75c6e37e4bf01619f57.1377791378.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 65/66] xbmc: Add libmad dependency
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
X-List-Received-Date: Thu, 29 Aug 2013 15:52:15 -0000

* fails without it:
  | checking mad.h usability... no
  | checking mad.h presence... no
  | checking for mad.h... no
  | configure: error: Could not find a required library. Please see the README for your platform.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
index 0b4d696..0bb09b1 100644
--- a/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
+++ b/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "XBMC Media Center"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL;md5=6eb631b6da7fdb01508a80213ffc35ff"
 
-DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml"
+DEPENDS = "libusb1 libcec libplist expat yajl gperf-native libxmu fribidi mpeg2dec ffmpeg samba fontconfig curl python libass libmodplug libmicrohttpd wavpack libmms cmake-native libsdl-image libsdl-mixer virtual/egl mysql5 sqlite3 libmms faad2 libcdio libpcre boost lzo enca avahi libsamplerate0 libxinerama libxrandr libxtst bzip2 virtual/libsdl jasper zip-native zlib libtinyxml libmad"
 #require recipes/egl/egl.inc
 
 
-- 
1.8.3.2


