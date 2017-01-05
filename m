Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E4B2571A8D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Jan 2017 17:11:47 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id u144so97698605wmu.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Jan 2017 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WvI2jWrTcR21CE6aMhgZhAzsW05/sB1w+xpBsiGI32Y=;
	b=SHet4shM7YrBLAn0mt6lfGEFXQctEo9vQ6GdH3ee0UKcg6XuJ27JBWVx5aCeRxdusw
	0R0+Ih4uf5rbR9qjIRoPung5VZCW6k5H45khohiFFfB4bF7ZY33gfTBGjsyRxyDyfeeM
	8u5C15OS8wFPCP/1I7A2YZcbeRD/wzS1o57p/jzAzU4j8h0FEF0LxagundTFsh9JlUYp
	fRH4p0boqdvvBcWh+s6YpocAxziWxDYeXMCXorFi4uGs3pcD2euAgIj8ndGU9wrdyiy1
	WlvghOxexxLqYBgWqiizADmhMoOrH4DvxOeNqCoTkZGLCUSqjaa+LL2PYrJMetysFNfu
	CMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WvI2jWrTcR21CE6aMhgZhAzsW05/sB1w+xpBsiGI32Y=;
	b=gVgojydC9fOXBxUb2uvs3atK/Ec3O1tvp7eOSuJDQ354RG1ityIgKaSsf1CckQO2pM
	qUGhmKk4coIeSV/Hbj/+tUqzo/OFi3Hfe6g9y3vV3gQvnYPhc09ExCZEZ8TA59L88xeg
	PUqBpDtXsaHcbEYFHRot4KgbtoAbZdQqUn6oXfN+bVkb6+SsGquEJszGTNvmKzPgTUnH
	1ienF/970DEf8eVWrOCW+IeBDJoD9lzYCnfQq1NL62f7rKGF8vG+0F1alaVSP5VUdkK8
	F2+saMR3gnJ4WMixryiZEhj8tGQCpU+KMMNqASEQ/ahgp0yQsGu7B4v0qeK/BapRncj1
	ECNw==
X-Gm-Message-State: AIkVDXJBz7bFJX0jXvOBYn8pGcbEiS/XnrWvvQwfYjPKxlyo/HBCAiszwCb2z5PDyc2gfg==
X-Received: by 10.28.142.16 with SMTP id q16mr58393609wmd.35.1483636307980;
	Thu, 05 Jan 2017 09:11:47 -0800 (PST)
Received: from localhost.localdomain (p579F79CC.dip0.t-ipconnect.de.
	[87.159.121.204]) by smtp.googlemail.com with ESMTPSA id
	81sm101153107wmw.7.2017.01.05.09.11.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jan 2017 09:11:47 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Jan 2017 18:11:24 +0100
Message-Id: <1483636284-6351-8-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
References: <1483636284-6351-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] gnome-system-monitor: fix build after update of gnome c++ bindings
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
X-List-Received-Date: Thu, 05 Jan 2017 17:11:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In file included from <staging>/usr/include/c++/6.2.0/type_traits:35:0,
                 from <staging>/usr/include/sigc++-2.0/sigc++/visit_each.h:22,
                 from <staging>/usr/include/sigc++-2.0/sigc++/functors/slot.h:6,
                 from <staging>/usr/include/sigc++-2.0/sigc++/signal_base.h:27,
                 from <staging>/usr/include/sigc++-2.0/sigc++/signal.h:8,
                 from <staging>/usr/include/sigc++-2.0/sigc++/sigc++.h:104,
                 from <staging>/usr/include/glibmm-2.4/glibmm/thread.h:50,
                 from <staging>/usr/include/glibmm-2.4/glibmm.h:89,
                 from <staging>/usr/include/gtkmm-2.4/gtkmm.h:87,
                 from ../../gnome-system-monitor-2.28.2/src/procman.cpp:26:
<staging>/usr/include/c++/6.2.0/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
 #error This file requires compiler and library support \
  ^~~~~

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
index d5fab62..7518bbb 100644
--- a/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-system-monitor/gnome-system-monitor_2.28.2.bb
@@ -20,6 +20,8 @@ do_configure_prepend() {
     sed -i -e s:help::g ${S}/Makefile.am
 }
 
+CXXFLAGS += "--std=c++11"
+
 RRECOMMENDS_${PN} = "adwaita-icon-theme"
 
 FILES_${PN} += "${datadir}/icons \
-- 
2.5.5


