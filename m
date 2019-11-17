Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 889C57F959
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 21:13:18 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id s5so17137798wrw.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Nov 2019 13:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KWKjgYG3jSKGII3lVqxi8jitlVkcJn055XyaLuw1iHE=;
	b=Oe6WPeXxexbiyDI8vOEPfAZm26jyR+bM2GAvK5Tb3fh+pFo+b1umTUuyAgkhRKHJvj
	5zbTooBCXqAh5O4cjnehIYNEvGok15WQc+nHfk7OVYnszDp4jqekHP/91ToK44KWd1zZ
	rWp6WOtJ950Rtuj7iMZVdVVXbtCthueYlLy/f0MYuTFib5h3YRBm1nZ5UdFX/OiD/p5b
	aOIqudQBYJHyVMOTt/b4PrioQcCwIcSX6+fb7xNWGbA3UznT9Gi8EWerwesCf0qtRoem
	PVdHt+ZuU7liLqdr1nQUPv9IrmccHgbd75/MddNcyA7Wzk8XWeWXulto9RAiHlTS0tw1
	FQsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KWKjgYG3jSKGII3lVqxi8jitlVkcJn055XyaLuw1iHE=;
	b=YINqHmtRFtePnxpxM8XgkFZySPtDy6sySrtN/6guSk84sTfQGNE4/tqHZRGA+cuu0T
	abw1zJK1A9cZ1rImZnOqH2Chn2qdl7vaBU895BEyRdivOVT4rLAK6f21dZmupH+j+lfV
	jTdJHqrqMAlBrbwtTHzCUGyeXfgwBDlJFd86/eZy6529vX6WmKm1HqmmkjxoLvY1lFWG
	4p+qmSVVSsE9kb38ZHh3K58/BM7hm4U5E/HTB7UVWjHpeZmujPv33LawqQ00CwVm8HWo
	Koh+ctySmxEc6o8wpuCsiG/3v+zajwbmSCjpH4OMPMAQcP25r/dX57P/xanzUrGFhV59
	avNA==
X-Gm-Message-State: APjAAAU+WXpkGZhGxkw55SpXw/GDF4ICCQZEpmJ+FUUYz5ee/6+pFK3B
	kOE6RelkR0wvSii8q3VlGABhnB0N
X-Google-Smtp-Source: APXvYqyvwxeR4ny+j16FC0JnYbIPbpGx+R6W/ZsMKM4cfhQcDZVRCc4kKlOJPa1U4J9ayMRjqMED+g==
X-Received: by 2002:adf:f987:: with SMTP id f7mr26435508wrr.284.1574025199073; 
	Sun, 17 Nov 2019 13:13:19 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F081983E6CF71012ACD6C9A.dip0.t-ipconnect.de.
	[2003:f0:7f08:1983:e6cf:7101:2acd:6c9a])
	by smtp.gmail.com with ESMTPSA id
	g5sm18564687wma.43.2019.11.17.13.13.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 17 Nov 2019 13:13:18 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Nov 2019 22:13:05 +0100
Message-Id: <20191117211306.27233-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191117211306.27233-1-schnitzeltony@gmail.com>
References: <20191117211306.27233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] gmime: upgrade 3.2.4 -> 3.2.5
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
X-List-Received-Date: Sun, 17 Nov 2019 21:13:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From gmime-3.2.5.news [1]:
*  Modified GMimeParser to prevent stack overflows when parsing deeply nested messages.

     GMimeParser now has a limit on how deep multipart and/or message/rfc822 MIME part
     nesting is allowed to go before the parser will take action to prevent a stack
     overflow. If the max level is reached at a message/rfc822 part, then that part
     will be consumed by the parser as a generic GMimePart rather than a
     GMimeMessagePart. Likewise, if the max level is reached at any type of multipart,
     then the content of said multipart will be packed into the GMimeMultipart's
     preface and not parsed any further.

* g_mime_multipart_foreach has been rewritten to avoid recursion, thereby avoiding potential
  stack overflows.

* The gmime-port-2-6-to-3-0.sh script has been fixed to use proper sed syntax.

[1] http://ftp.gnome.org/pub/gnome/sources/gmime/3.2/gmime-3.2.5.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gmime/{gmime_3.2.4.bb => gmime_3.2.5.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/gmime/{gmime_3.2.4.bb => gmime_3.2.5.bb} (72%)

diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.4.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.5.bb
similarity index 72%
rename from meta-oe/recipes-gnome/gmime/gmime_3.2.4.bb
rename to meta-oe/recipes-gnome/gmime/gmime_3.2.5.bb
index 205868eec..568083bf3 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.4.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.5.bb
@@ -9,8 +9,8 @@ inherit gnomebase gobject-introspection
 SRC_URI += "file://iconv-detect.h \
             file://nodolt.patch"
 
-SRC_URI[archive.md5sum] = "b6b4e9fdc8f3336551d23872c83b539a"
-SRC_URI[archive.sha256sum] = "249ea7c0e080b067aa9669162c36b181b402f6cf6cebc4999d838c6f1e81d024"
+SRC_URI[archive.md5sum] = "98970e3995e67ac3f23827ff52308f9e"
+SRC_URI[archive.sha256sum] = "fb7556501f85c3bf3e65fdd82697cbc4fa4b55dccd33ad14239ce0197e78ba59"
 
 export ac_cv_have_iconv_detect_h="yes"
 do_configure_append = "cp ${WORKDIR}/iconv-detect.h ${S}"
-- 
2.21.0


