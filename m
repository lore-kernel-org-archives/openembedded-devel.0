Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5B57C7A3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 22:36:55 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id z9so5130840wrl.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Oct 2019 15:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O/HGIorms9TIPcUKJ5xImjRynTmESe4q3dm6kpTSkiI=;
	b=gL98UnqiPF8rmF3FUSj7S9xRb9Qb2kpQ/FXXgsumvt2QgFm/NpJoyfgvjVoTVkWTX0
	yAGT8bu15Sn9WbRg+vceK95uWjjclX4N4lf1NxP85OJC97Zo+i7NMINrWXHXVoQIGBmZ
	/cFGAQZhjvxhEWjYAZ8uwnK0YLn4CDx3rnswLnVEpY0QjydTVFRos0ECNm7jipx+j537
	7eRyGLaDj9FCwOPpm2awvqrhm0doB2A+3L/JGxfLpuqBaO65XKYXUC+zG+LMxWlMq22W
	BFVS1Gpqxd2Pupu9DW6dpXkUTBUVyiFMwann26fcsvA3mG32qkuKr8OBMocvAyEV7udI
	9wrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=O/HGIorms9TIPcUKJ5xImjRynTmESe4q3dm6kpTSkiI=;
	b=GBrLRPIP3XfsRBzkLoBzAhoPsyUgRMDGH20rkfva7Xiyi0723IIsvOoPupW9xpNSTk
	CNdrqXGRjEYUNCzaQz3Ej/dhFbs2HOPbewfNFqeheEoGTvytkF64GC2oy8676UPaxQz3
	D84N+3MfME91JLO/2WMcDYGzNOGRTKNKQ154+TZrhjyUf3nwztf/T7ZAEKQYUP/eOL2i
	r0NhMsT2h3CC0Jd1JF0W5Tvhgd3e7MYiy/maLYJpVvjXo7qbLEHcaa+OOMD2/F9jYvVa
	BTLFWkqx8ybIt9nCoQHbrD83jZs3P1VwI+Q1dupT1AblqAr8p+XIrpUEoBpia5xDAwu3
	o7hg==
X-Gm-Message-State: APjAAAW5o4JANxV0kMorjIUT3u5j8T1kqAudXnyMlfJ1bqJ1Furh/VxK
	xS0u8MQQssB5FnpzwNgR1kt0qCTq
X-Google-Smtp-Source: APXvYqy9aT0TH/UrT25RhdkZw2ijLn44HNpZ/gq+CCDT8OgN5izAQr29JivLJS7+P7GNjciGtm0Vpg==
X-Received: by 2002:a5d:4108:: with SMTP id l8mr4679866wrp.391.1570660615923; 
	Wed, 09 Oct 2019 15:36:55 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F066E38CA93A84B6081E965.dip0.t-ipconnect.de.
	[2003:f0:7f06:6e38:ca93:a84b:6081:e965])
	by smtp.gmail.com with ESMTPSA id w18sm3952236wmc.9.2019.10.09.15.36.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 15:36:55 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Oct 2019 00:36:45 +0200
Message-Id: <20191009223646.4581-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/2] jack: upgrade 1.9.12 -> 1.9.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2019 22:36:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This release contains various fixes / enhancements - from release announcement:

* Meta-data API implementation. (and a few tools updated with support for it)
* Correct GPL licence to LGPL for files needed to build libjack.
* Remove FreeBoB backend (superseded by FFADO).
* define JACK_LIB_EXPORT, useful for internal clients.
* Mark jack_midi_reset_buffer as deprecated.
* Add example systemd unit file
* Signal to systemd when jackd is ready.
* Set "seq" alsa midi driver to maximum resolution possible.
* Fix loading internal clients from another internal client.
* Code cleanup and various fixes. (too many to mention here, see git log for details)

Backported patches can go.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../jack/jack/0001-Fix-OSX-build.patch        | 27 -------------------
 .../jack/0001-Python-3.7-fixes-2126.patch     | 26 ------------------
 meta-oe/recipes-multimedia/jack/jack_git.bb   |  9 +++----
 3 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Fix-OSX-build.patch
 delete mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-Python-3.7-fixes-2126.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Fix-OSX-build.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Fix-OSX-build.patch
deleted file mode 100644
index d9a3ab7cc..000000000
--- a/meta-oe/recipes-multimedia/jack/jack/0001-Fix-OSX-build.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From dd65685c24bb25a800ed42388ed0a1e8792b2ed2 Mon Sep 17 00:00:00 2001
-From: falkTX <falktx@gmail.com>
-Date: Sat, 24 Nov 2018 14:29:58 +0100
-Subject: [PATCH] Fix OSX build
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Backport [https://github.com/jackaudio/jack2/commit/d851fada460d42508a6f82b19867f63853062583]
----
- posix/JackNetUnixSocket.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/posix/JackNetUnixSocket.cpp b/posix/JackNetUnixSocket.cpp
-index 7a5585ef..a4cb5036 100644
---- a/posix/JackNetUnixSocket.cpp
-+++ b/posix/JackNetUnixSocket.cpp
-@@ -169,7 +169,7 @@ namespace Jack
- 
-     int JackNetUnixSocket::Bind()
-     {
--        return bind(fSockfd, reinterpret_cast<socket_address_t*>(&fRecvAddr), sizeof(socket_address_t));
-+        return ::bind(fSockfd, reinterpret_cast<socket_address_t*>(&fRecvAddr), sizeof(socket_address_t));
-     }
- 
-     int JackNetUnixSocket::BindWith(const char* ip)
--- 
-2.20.1
-
diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-Python-3.7-fixes-2126.patch b/meta-oe/recipes-multimedia/jack/jack/0001-Python-3.7-fixes-2126.patch
deleted file mode 100644
index e6021cd70..000000000
--- a/meta-oe/recipes-multimedia/jack/jack/0001-Python-3.7-fixes-2126.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 72564b04151b61fa8d954bbb43afc58108ee50ec Mon Sep 17 00:00:00 2001
-From: Thomas Nagy <tnagy@waf.io>
-Date: Mon, 12 Mar 2018 20:42:55 +0100
-Subject: [PATCH] Python 3.7 fixes #2126
-
-Upstream-Status: Backport
-[https://gitlab.com/ita1024/waf/commit/facdc0b173d933073832c768ec1917c553cb369c]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- waflib/Node.py | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/waflib/Node.py b/waflib/Node.py
-index fb3cd273..405a6fec 100644
---- a/waflib/Node.py
-+++ b/waflib/Node.py
-@@ -537,8 +537,6 @@ class Node(object):
- 					if maxdepth:
- 						for k in node.ant_iter(accept=accept, maxdepth=maxdepth - 1, pats=npats, dir=dir, src=src, remove=remove):
- 							yield k
--		raise StopIteration
--
- 	def ant_glob(self, *k, **kw):
- 		"""
- 		This method is used for finding files across folders. It behaves like ant patterns:
diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb b/meta-oe/recipes-multimedia/jack/jack_git.bb
index 477af8ced..9f7d5b0b6 100644
--- a/meta-oe/recipes-multimedia/jack/jack_git.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
@@ -14,12 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git \
-           file://0001-Python-3.7-fixes-2126.patch \
-           file://0001-Fix-OSX-build.patch \
-           "
-SRCREV = "c1647819eed6d11f94b21981d9c869629299f357"
-PV = "1.9.12"
+SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRCREV = "37250ff470277f9947fbf3ba738f943053e30525"
+PV = "1.9.13"
 S = "${WORKDIR}/git"
 
 inherit waf pkgconfig
-- 
2.21.0


