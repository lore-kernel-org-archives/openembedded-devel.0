Received: from mail-ea0-f177.google.com ([209.85.215.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlR1-0004bt-Ou
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:17:47 +0100
Received: by mail-ea0-f177.google.com with SMTP id c10so2505325eaa.36
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=WRdP9PeT2wxwk8SGmG3feRBCwPcawQsaaueJ12nGiLE=;
	b=ueIuyj9gh89zMd4nQAGCYFzfZCSbNQg5SLdaSPc1HElEOFtzqde8EVQv6LFUKOqCjn
	8a/omlGiVXp4V7O+E/DabepKq089bKvVbfJxXFmFWh/V8hGZcq9a6Yr2kpFIDNABRN20
	DPchVv1LL3ZxGkzoImSvW4p5F9LtZ2a9IsDFi0qQXBBC4QlOBcbNtN/eW2FPLNC52Xmx
	SFWL0SrpV4aEzQcIsf4EeUI825ikyNkm91A4R5BML21h6IMzMCApTQl48QdBGg9aHatV
	w0Mp8+4u/JUF0DUgYC5F0Ins2x7ZI1W+joxuwsVF7w20ekHVZMXjbg6Nwn87EChy1G1m
	I4SQ==
X-Received: by 10.14.225.4 with SMTP id y4mr47649448eep.6.1356267775460;
	Sun, 23 Dec 2012 05:02:55 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.02.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:02:54 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:31 +0100
Message-Id: <1356267761-15152-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 02/12] xcursorgen: initial add 1.0.5
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
X-List-Received-Date: Sun, 23 Dec 2012 13:17:49 -0000
X-List-Received-Date: Sun, 23 Dec 2012 13:17:49 -0000
X-List-Received-Date: Sun, 23 Dec 2012 13:17:49 -0000
X-List-Received-Date: Sun, 23 Dec 2012 13:17:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xcursorgen/xcursorgen_1.0.5.bb                 |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb

diff --git a/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
new file mode 100644
index 0000000..e5ece21
--- /dev/null
+++ b/meta-oe/recipes-graphics/xcursorgen/xcursorgen_1.0.5.bb
@@ -0,0 +1,12 @@
+LICENSE = "ManishSingh"
+LIC_FILES_CHKSUM = "file://COPYING;md5=bd1fb9ee90eead85f7b171807b3ab4f2"
+
+DEPENDS = "libpng libxcursor"
+
+SRC_URI = "http://xorg.freedesktop.org/archive/individual/app/${BPN}-${PV}.tar.bz2"
+SRC_URI[md5sum] = "09f56978a62854534deacc8aa8ff3031"
+SRC_URI[sha256sum] = "bc7171a0fa212da866fca2301241630e2009aea8c4ddb75f21b51a31c2e4c581"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
-- 
1.7.4.4



