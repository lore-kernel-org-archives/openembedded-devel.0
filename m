Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.18577.1586098609266342272
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 07:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=KblMVXUy;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id CED1260487;
	Sun,  5 Apr 2020 16:56:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586098607;
	bh=1koHJyUfE0fyAT+lmfoyDz+J8wH8V9fxTN65JQDpd00=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KblMVXUy1qQd4YM3DDvXaLFXtj/HTUDYwjYV+lOMJwamtawEK/wTyjCbwsTZbsJWM
	 2Rvjf3i+o0DMPJa3BH8zcV15+9/lQihuphEFRyTh9RK9SCSY1BFanUEix4J/42pvEX
	 hGuWpQqPsrT4XlnvSHymaatAeTf6HxhedKHsZgVlBvGndBT47Bo90gsDZl0g55we+/
	 /b4rMs+m3LAUwYpdR3LGJHsdYsBB9d9wC1gcIWBK2WS6c8xcP9qmCOq61RXExsYM2E
	 lrGaCUVQbShwCHg4wG9wsc6VkCURBAdybO+yOb9wVQRiXu161a3hfVOz9Gi1UIpJY8
	 dpVf2qLa+X3tg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 5/6] libmimetic: use UPSTREAM_CHECK_COMMITS
Date: Sun,  5 Apr 2020 16:56:39 +0200
Message-Id: <1586098600-13571-5-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>
References: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status libmimetic
<...>

INFO: libmimetic                0.9.8           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
index d0fe498..590c4eb 100644
--- a/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
+++ b/meta-oe/recipes-support/libmimetic/libmimetic_0.9.8.bb
@@ -15,6 +15,8 @@ SRC_URI += "git://github.com/LadislavSopko/mimetic/ \
             file://0001-mimetic-Check-for-MMAP_FAILED-return-from-mmap.patch \
            "
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${WORKDIR}/git"
 
 CXXFLAGS += "-Wno-narrowing"
-- 
2.7.4

