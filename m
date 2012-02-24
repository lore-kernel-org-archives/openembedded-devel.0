Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S14na-0005Jp-6h
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Feb 2012 00:43:38 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1368621eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 15:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.213.22.146 as permitted sender)
	client-ip=10.213.22.146; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.213.22.146 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.213.22.146])
	by 10.213.22.146 with SMTP id n18mr1330017ebb.0.1330126517478 (num_hops
	= 1); Fri, 24 Feb 2012 15:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=bOjjL12scp1CSMMQZk1td+P8MgMdu68fDXE/9B/GvH8=;
	b=V3brEmVjVgI1QjcLmUsb5Vdr/rPCWrSHqyymNJuWgsVZmSza2tSw8ed1Fu/e+KfnZ1
	uKomGi/1OvpJ9Wp91Jhs35G+oDUs5mHyka33xdcnsU86ydrA3BIJyZp7niJ2ru/4UAUj
	OOZfk9RyausCI6qKJNgwYEQSktLeFZ7s0cFR0=
Received: by 10.213.22.146 with SMTP id n18mr993707ebb.0.1330126517110;
	Fri, 24 Feb 2012 15:35:17 -0800 (PST)
Received: from localhost.localdomain (p5B0A1464.dip.t-dialin.net.
	[91.10.20.100])
	by mx.google.com with ESMTPS id u11sm16588122eeb.1.2012.02.24.15.35.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 15:35:16 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 25 Feb 2012 00:38:16 +0100
Message-Id: <1330126696-4716-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1330126696-4716-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330126696-4716-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-mozilla,v2 3/3] firefox: add virtual/libgl to DEPENDS
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
X-List-Received-Date: Fri, 24 Feb 2012 23:43:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Build from scratch error message was:

| configure: error: Can't find header GL/glx.h for WebGL (install mesa-common-dev (Ubuntu), mesa-libGL-devel (Fedora), or Mesa-devel (openSUSE))
| *** Fix above errors and then restart with               "make -f client.mk build"
| make[2]: *** [configure] Error 1

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 recipes-mozilla/firefox/firefox_10.0.2.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-mozilla/firefox/firefox_10.0.2.bb b/recipes-mozilla/firefox/firefox_10.0.2.bb
index fe66f45..5e5de05 100644
--- a/recipes-mozilla/firefox/firefox_10.0.2.bb
+++ b/recipes-mozilla/firefox/firefox_10.0.2.bb
@@ -1,5 +1,5 @@
 DESCRIPTION ?= "Browser made by mozilla"
-DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx"
+DEPENDS += "alsa-lib curl startup-notification libevent cairo libnotify libvpx virtual/libgl"
 
 LICENSE = "MPLv1 | GPLv2+ | LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://toolkit/content/license.html;endline=39;md5=9cb02f27e77e702043b827c9418bfbf8"
-- 
1.7.4.4



