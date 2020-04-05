Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web12.18746.1586098608258476911
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 07:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=iAVNKANA;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 81A9A603D2;
	Sun,  5 Apr 2020 16:56:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586098606;
	bh=IbOdyCgZR1TYS17LmcnWFniufVrdSS3M8tZUWC45GDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iAVNKANA3Aqgn/yGBr4/33XnWRdg2ycHF6kP3BUuxJxUnENcnccmfQIotcHm5efnP
	 5L3hNo8hRaFxglOZ+xLBlLnZi5lgFsljBhxBfAB9WQRHC83zWCkfmEwBK8FUhdwTVK
	 zxAPAOGYTP4SfynZA5qnyPrAao7EHlYQSIooCCxwL5H5oC0I/B2uz6l4GRKOgFOrR3
	 Iimpla8UWDeJ//X6smGCKlPWprmo5A0LoOIcImJCvQGOjKL7n6IUmv2SlL7elZkI6/
	 BYchO6BsO2gh/ZvAdu0F15Ws/7mApKcVurbQUt9TZGVq7+wa/PxBrHa1wQ7H1I0WyS
	 hmnoRS7s7A3vg==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-oe][PATCH 3/6] libinih: use UPSTREAM_CHECK_COMMITS
Date: Sun,  5 Apr 2020 16:56:37 +0200
Message-Id: <1586098600-13571-3-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>
References: <1586098600-13571-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status libinih
<...>

INFO: libinih                   0.0             UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-oe/recipes-support/inih/libinih_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/inih/libinih_git.bb b/meta-oe/recipes-support/inih/libinih_git.bb
index 87b1142..227e2a7 100644
--- a/meta-oe/recipes-support/inih/libinih_git.bb
+++ b/meta-oe/recipes-support/inih/libinih_git.bb
@@ -12,6 +12,8 @@ SRCREV = "c858aff8c31fa63ef4d1e0176c10e5928cde9a23"
 SRC_URI = "git://github.com/OSSystems/inih.git \
           "
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 S = "${WORKDIR}/git"
 
 inherit gitpkgv cmake
-- 
2.7.4

