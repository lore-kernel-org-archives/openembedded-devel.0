Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S0tq3-0008Vh-BW
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 13:01:27 +0100
Received: by eaal10 with SMTP id l10so1081511eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2012 03:53:04 -0800 (PST)
Received-SPF: pass (google.com: domain of schnitzeltony@googlemail.com
	designates 10.14.100.80 as permitted sender)
	client-ip=10.14.100.80; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	schnitzeltony@googlemail.com designates 10.14.100.80 as
	permitted sender) smtp.mail=schnitzeltony@googlemail.com;
	dkim=pass header.i=schnitzeltony@googlemail.com
Received: from mr.google.com ([10.14.100.80])
	by 10.14.100.80 with SMTP id y56mr1298291eef.68.1330084384972 (num_hops
	= 1); Fri, 24 Feb 2012 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=fRoM28smMTfScCgPn0VCF1bmkMm0hP3IkAsvs506AQY=;
	b=l8xBGYBGGk7WHDk1HZ0TEPK1/9RqwUrbTJhxnSWqO+O2uvaKLaN4NG6ENml45Ji9rB
	tcbNmfqOF2pS1Cx0C2c2PaO9B4RJZCjotmmYTCC53y+GLCVTgoPwqk6Itxq/B9QBw4W9
	L65YdQ3DYYEfU1ieV+if85Vkj9pg3hh3eJ81E=
Received: by 10.14.100.80 with SMTP id y56mr982655eef.68.1330084384873;
	Fri, 24 Feb 2012 03:53:04 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id r5sm4985013eef.6.2012.02.24.03.53.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Feb 2012 03:53:04 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 12:53:04 +0100
Message-Id: <1330084384-1267-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1330084384-1267-1-git-send-email-schnitzeltony@googlemail.com>
References: <1330084384-1267-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-mozilla 2/2] firefox: add virtual/libgl to DEPENDS
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
X-List-Received-Date: Fri, 24 Feb 2012 12:01:27 -0000
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
1.7.6.4



