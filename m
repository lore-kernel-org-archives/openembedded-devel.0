Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87193736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 19:41:24 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c133so291183wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Aug 2016 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ePGqQjRy+r1XRxgBLnm4Mj5ujIsxyzVhJoS6LAbjq6k=;
	b=gggI9OS3UjVs14mdwn3Ei0x/hPqRM47hCbEzUZMWfk1f0Y2zK2dRb/7QRJ2h7980nR
	y+U2eRQ50nOitq19N5bZbGXNmNy7Gdj8W7KCG6aVpTiCKyEdsjz6pSJvGxNH3iUH2Gz9
	JoAxQOdKiHk8oIh4+DPsBjohGK5pW020zx81RJebommfnmtznVF908y+XktAWYQJSYT/
	yTlj5jC5orEbwdVurmGlx+9HSHJmQXfT/ZDMQZbnK0sRfA5SQ5NV7cNsZNxNyxIGPumI
	vpooks6v9X9HtX/tOTrHV/GOY2SD9D+8MAaYGdmBXhH6HgI7waMROmGr/YiSSkVn2jWq
	WJow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ePGqQjRy+r1XRxgBLnm4Mj5ujIsxyzVhJoS6LAbjq6k=;
	b=lcy9YQGC0wfj5Qwaq6CD3ZtIHtoENcS9ld5CSFRv3Bxg9I0VU3dr7qJRPUo/Jbrcc7
	PlQjSkMVlHSuSBJU/TnPsG7mvL2EeJpwFUDmsPUvYFTpW1LkGaTKQIgBFxJZU8gBb32x
	BQlSQouTYl4rPFmMPe1u7lHqad8N5ivcTrS5BOsASqfveqY0moH0DyyBlsywfE8Zam7+
	a+Knzc6tCQUZqlQpC7xbcY1YQJs97bwW8VCFqIUOEtYQGzFTo/CyW8cYYhI7EAnNpLf1
	3pV80XbsDXdOzv3J4UzZ85ZDAGxviFtNFOh6OTw9Gnnl7f8WrGpUASj7LQveT+MGfr0y
	GWZQ==
X-Gm-Message-State: AE9vXwNpbdDwVrvXtaAzR1TT8MDJTlj8kW7e+WbeqNelhQlqPj9BLn4vjnsAy8xC3zRs/w==
X-Received: by 10.194.82.99 with SMTP id h3mr10596192wjy.9.1472672484699;
	Wed, 31 Aug 2016 12:41:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	z18sm25175672wmz.6.2016.08.31.12.41.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 12:41:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 31 Aug 2016 21:41:02 +0200
Message-Id: <20160831194106.14065-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160831194106.14065-1-Martin.Jansa@gmail.com>
References: <20160831194106.14065-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/11] samba: blacklist, fails to build with new binutils-2.27
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
X-List-Received-Date: Wed, 31 Aug 2016 19:41:24 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index e35d527..042203e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -317,3 +317,8 @@ FILES_${PN}-python-dbg = "${libdir}/python${PYTHON_BASEVERSION}/site-packages/.d
 
 RDEPENDS_${PN}-pidl_append = " perl"
 FILES_${PN}-pidl = "${bindir}/pidl ${datadir}/perl5/Parse"
+
+# http://errors.yoctoproject.org/Errors/Details/81004/
+# before this issue it was also failing in do_package and
+# autodetecting libpam dependency
+PNBLACKLIST[samba] ?= "BROKEN: fails to build with new binutils-2.27"
-- 
2.9.2


