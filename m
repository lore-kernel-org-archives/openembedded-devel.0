Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id AC37E6C3B2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 23:38:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id x26so1348819wmk.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Nov 2019 15:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=EfHYsnAjzdZOdTDJ5ARKhFFlNSimrItMyiMF1Pt9Kh0=;
	b=ccw69g8pZvIixW/h7KNMBzP4iesh0n/NR6SP6e0dldUXpl7xN1/xfiiilZ0bKUcaao
	sWpjAdlRWbw2Wml8mbAcwKk/wwj0xyeGqkyPJOhIb1NZVaMiMbOArzYwFqCSqTN5oo98
	Muq4JvqMiaz3V732gwzGcgrU9XK9wCquLjZMMljCMsYDgWRhLugLb2Xqb2+6cLQM1u4X
	yBjCJfabgPv47SQUcDZeBVMwfVdupdLXteMZKZMgmRObEWzKRFPMgQfDTajFQQOSDpk+
	6zrsXbnYYpaumBxyg4xVxumMpShdnHuRzKEVQSJc7RLFkzvcKY3djeCLdU+ojtVPogkq
	d5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EfHYsnAjzdZOdTDJ5ARKhFFlNSimrItMyiMF1Pt9Kh0=;
	b=XkbJJFo+HfL49r1jCLyqrrwo9Gka14wiftqcsLXaUXwDTUUoBrrrOqZMLQZqG8iISn
	LtVruaXxp5ctQapBXqGLNRJhdA7uHfJd/fT+ZRjzRqtfhFMvpgb2laz0noPiZaHQQ94F
	xlIJEs8nQQHGE5er2L9B9jhyDvwVApZh9i0AGNsnhYayq05h3nKlw4BppDTbow6BQq0+
	FKn/S/TS2ICNiDofHIKAW5grfnA03ndhgBYtr1Q7MXSabNAUMEZw0GL53gioW/0Ir57L
	t/aBbqFwskWX94Buhy5xjNp3DcCcRtBYRxkCMLmtN8Mx+wnfIU5UBXZMiD7YdscBVJv8
	309A==
X-Gm-Message-State: APjAAAWvUnsNE9BXG5XwvWFVYtCRjowL0GOvD+JHVdp1pP2/5mlcgd3U
	o7yCB1y1eEga5bwbCq5PZD88w6um
X-Google-Smtp-Source: APXvYqxV7MTMhMx7ScPo7F0XsFWANAZ+zlWbynzBFAWzu95u3ghfJ1SqJbQ2ORAZJqBrKBUTUYxqKA==
X-Received: by 2002:a7b:ce92:: with SMTP id q18mr6408221wmj.164.1574293096263; 
	Wed, 20 Nov 2019 15:38:16 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB687FD2CB83E858114E3.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b687:fd2c:b83e:8581:14e3])
	by smtp.gmail.com with ESMTPSA id
	x10sm1014074wrv.60.2019.11.20.15.38.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 15:38:15 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 21 Nov 2019 00:38:06 +0100
Message-Id: <20191120233806.31207-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191120233806.31207-1-schnitzeltony@gmail.com>
References: <20191120233806.31207-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 2/2] parole: upgrade 1.0.4 -> 1.0.5
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
X-List-Received-Date: Wed, 20 Nov 2019 23:38:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.0.5
=======================
Bug Fixes:
- Fix creation and cleanup of thumbnails (Xfce #16026)
- Fix volume hotkeys in fullscreen (Xfce #16005)
- Fix compiler warnings

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../parole/{parole_1.0.4.bb => parole_1.0.5.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-multimedia/parole/{parole_1.0.4.bb => parole_1.0.5.bb} (84%)

diff --git a/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb b/meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb
similarity index 84%
rename from meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
rename to meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb
index 68556a2ab..efee1aa93 100644
--- a/meta-xfce/recipes-multimedia/parole/parole_1.0.4.bb
+++ b/meta-xfce/recipes-multimedia/parole/parole_1.0.5.bb
@@ -16,8 +16,8 @@ DEPENDS += " \
     taglib \
 "
 
-SRC_URI[md5sum] = "c23621eb44df292f828e86074d4e719d"
-SRC_URI[sha256sum] = "e92b8ec369e53d921b47d2473c2e2a1e9e04d3c5d536d419abdff40e5e136dc1"
+SRC_URI[md5sum] = "74fcde5da018c011e5febd9649817c05"
+SRC_URI[sha256sum] = "1adb4bd96c4cc4b4a79eeafe1316e170f506426e3737e8ba8898f7ea6bec572a"
 
 RDEPENDS_${PN} += "gstreamer1.0-plugins-good"
 
-- 
2.21.0


