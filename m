Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web11.7740.1586003792423362075
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 05:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Wdj5xYlk;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 01586603D2;
	Sat,  4 Apr 2020 14:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586003791;
	bh=Mwh04haEpR3XX7NZXhPvcCUSfAJBDgJSU0jx+Otqrbo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wdj5xYlkamVoX09r8D+dnTIfmOaIzgUz1aXtUFItXr817gzAz2owqqBw8FGBqc7yH
	 JHmTZNwuIghKbsUEYBdXV3abJS0VjfM9B1mncO+OsvO6sQmM5PzTHHpOAxwj6B52iv
	 Diomi8cGtbwFFMS/7iGGUR/qSs2eLSG015Cv0NTfng7WBJJQmDf7k4L8o+wf8TrA7P
	 Nnx0Nc0Np1ue0YaKeBk6ZpDbG/JXLlLdKxxEW+g+TWO35EBSK7QXXvBCEOxICjfx+i
	 8Wx0wLiWB5PUJnLcj9FBaNyWHg1zQxK+heteQYSPcPET02UrEOAYaf2EKVty5NfLRq
	 9SypI/wxmkuQw==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 4/5] usrsctp: use UPSTREAM_CHECK_COMMITS
Date: Sat,  4 Apr 2020 14:36:00 +0200
Message-Id: <1586003761-12873-4-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>
References: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status usrsctp
<...>

INFO: usrsctp                   git             UNKNOWN_BROKEN  None f4e14ab5e12187cb2cf1ddbdc0ee5555aead3f72

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
index a5a5605..4f8e4d4 100644
--- a/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
+++ b/meta-networking/recipes-protocols/usrsctp/usrsctp_git.bb
@@ -8,6 +8,8 @@ SRC_URI = "git://github.com/sctplab/usrsctp;protocol=https;branch=master \
 
 S = "${WORKDIR}/git"
 
+UPSTREAM_CHECK_COMMITS = "1"
+
 inherit autotools pkgconfig
 
 DEPENDS += "openssl"
-- 
2.7.4

