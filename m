Return-Path: <mbc@koumoul.net>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id C97BB7719B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2015 05:11:43 +0000 (UTC)
Received: by wmww144 with SMTP id w144so185383666wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2015 21:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Xnf69g16wQaoCEf+ZtJ/DFNM0WYXvMng2dngWpkrDxg=;
	b=X/zZKF0ZtBH9yYYF6nxoyzcP4eDEzIitlljqLQ1uJZR1EtKVWiNRDnJXwmM7FM3bCa
	SYStnXCQJdZw2WfJYlUeRgtvaObwgIbLD37GL36/xSnKj0ozgKEVR92dg8GDW/huGUNl
	bZN/LsrGLxJhz63uIVsCT0WmUDCVymfAc/Cos=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot_bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id;
	bh=Xnf69g16wQaoCEf+ZtJ/DFNM0WYXvMng2dngWpkrDxg=;
	b=rSgdhDKGihn781TBqVq2HlxX6sz1rF4//wJ5i7X6ytjjURAGIav/RVJLUDmSQJnEe7
	oGvwCrWaw/8zFj05XG0o6lScL/T3ZPMF/MVul4vNmXVPN5NYeraZmdj89x7wUIXK4CcG
	DcdMbtM7kdPcIuWcphh1KrdDGKpXwjf32ACSTT8Ytv2dUTEvsstnNBFuR0mFN5m86NpC
	fY0yMRwE97bKOusNnhZ6B8vbiG2TmxztYgjXzregnBIQSsnBfV3ovLFpXL7XD2XMDWtU
	jj1iIbQ+3OpJPBzKyV/3gFNju/GBXEyf6Ax7eVpBzdiSwKEm1+BSU9Oft5yvn1rwGZzr
	q18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=Xnf69g16wQaoCEf+ZtJ/DFNM0WYXvMng2dngWpkrDxg=;
	b=Zck8OBMBrDgS71cYAASeAulCYHvCDsa5g+47TUDbCTi/n/LSTY8BhBn5nJw5jErDE1
	4tqq0/T1/QfFrL0WbBCfdzu9XO3ihZbBdIWJnvwNoyklCIjs08wNY1CEtGpKMp1Ox43G
	JADE5c+ysrofeTYlYcwjgA1zwilNWqdHwcnWFi4yRMKun0eXy0UUrJR32fFcn8ydE1so
	AXaMkpU1T+2Iq/kGL1q2Hs8Z78rpLeVBQp/Iyvwew2IZxMOMvLbeAgZbMvWtxpp4g05V
	vqcFEHEM/hss5QQdqaYqSrdukKwYFu0HkWI7H8t/SLvW/8+xrocSuaqLkG9K2pZsHuTp
	XqMQ==
X-Gm-Message-State: ALoCoQlSrGBIYZuB3m2EKEIKYiaLOXkDjSBc48U97OfmKoKRtjmxdq1zfTFDuyKSC5S8bkplYMDd
X-Received: by 10.194.222.137 with SMTP id qm9mr15840594wjc.30.1447305103481; 
	Wed, 11 Nov 2015 21:11:43 -0800 (PST)
Received: from localhost.localdomain
	(ARennes-655-1-234-219.w86-214.abo.wanadoo.fr. [86.214.17.219])
	by smtp.gmail.com with ESMTPSA id
	w66sm12965775wme.11.2015.11.11.21.11.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Nov 2015 21:11:43 -0800 (PST)
Sender: "Manuel Bachmann [ IoT.bzh ]" <mbc@koumoul.net>
From: Manuel Bachmann <manuel.bachmann@iot.bzh>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 12 Nov 2015 06:15:24 +0100
Message-Id: <1447305324-4827-1-git-send-email-manuel.bachmann@iot.bzh>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-multimedia][PATCH 3/4] dleyna-server: Add recipe
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
X-List-Received-Date: Thu, 12 Nov 2015 05:11:44 -0000

dleyna-server is a library for implementing Digital Media
(DLNA) Servers, and also provides a sample implementation
of such a server.

"dleyna-server-service" is designed to be started and
consumed using D-Bus.

Signed-off-by: Manuel Bachmann <manuel.bachmann@iot.bzh>
---
 .../dleyna/dleyna-server_0.6.0.bb                   | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb

diff --git a/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
new file mode 100644
index 0000000..ae16765
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/dleyna/dleyna-server_0.6.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "DLNA server libraries"
+DESCRIPTION = "dleyna-server is a library for implementing services that \
+allow clients to discover, browse and manipulate Digital Media Servers. \
+An implementation of such a service for linux is also included."
+HOMEPAGE = "https://01.org/dleyna/"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
+                    file://libdleyna/server/server.c;endline=22;md5=dfa6dc3f914206c2408c0510c234f8c8"
+
+DEPENDS = "glib-2.0 gssdp gupnp gupnp-av gupnp-dlna libsoup-2.4 libxml2 dleyna-core"
+RDEPENDS_${PN} = "dleyna-connector-dbus"
+
+SRC_URI = "git://github.com/01org/${BPN}.git"
+SRCREV = "38651783914c76bd861f7fe8651b25e3986d7be8"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig
+
+FILES_${PN} += "${datadir}/dbus-1"
+FILES_${PN}-dev += "${libdir}/${PN}/*.so"
-- 
1.8.3.1


