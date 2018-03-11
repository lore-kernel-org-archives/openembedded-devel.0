Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id CF50278898
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 21:38:35 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id v90so16809953qte.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2018 14:38:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=mSJBd+IeS07XKfBQTQ5X/dv9LxDovY79ZvWiZdsebGQ=;
	b=SD+/KAi+jVQriUo8N5KKU/Y6KwZRZt/ZNAwdoJVa5IXLZta3yeKir9JjBIq8nQ35bF
	9fQrKR7fC0tf7kGYDnOIyfZweJN+XEEJ9IrWIzMnmG2eqqwMrf1e8qGTe27q0mJxkQpV
	pQJzS2A0NLqLjHA/ANNLHR+vvnqCVZvmYaj2SogouS9LxpCbs26nRvityiowiPZc4fgX
	x2hKF6GirZ08NM7u8RLoj2CkLSHr6RlvzIy/13sLS/XU46m+1VBvoyTYZIL/np8ZoE4t
	pWt8lkhRxoGa4v6lBkxcj8fuBGl7WbkIHGnkrP0q5wzn1QSliBL60cf1i2GH4EQzky/S
	i1vA==
X-Gm-Message-State: AElRT7F5JbTgnhrxJWkIUbHaWtZZp6ZjFO3TaXNadSaygr/AJNs+oqqR
	TFfQsDZiNxlxkUsFeaDO8pi9WjF7
X-Google-Smtp-Source: AG47ELtA6ZIFZmo2CEE7nBbE9EsnV9Y3juG2b0nD+R1dUAsVcj+3l+D++c2n9mFIfOH1Y11DqwDDbw==
X-Received: by 10.200.24.46 with SMTP id q43mr9159360qtj.309.1520804316439;
	Sun, 11 Mar 2018 14:38:36 -0700 (PDT)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id n4sm4321937qtc.0.2018.03.11.14.38.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Mar 2018 14:38:36 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Mar 2018 17:38:29 -0400
Message-Id: <1520804309-26938-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] webmin: add a valid upstream check uri and regex
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
X-List-Received-Date: Sun, 11 Mar 2018 21:38:36 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
index ae88eb6..ce9bc92 100644
--- a/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
+++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.850.bb
@@ -24,6 +24,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \
 SRC_URI[md5sum] = "cd6ee98f73f9418562197675b952d81b"
 SRC_URI[sha256sum] = "c66caa9e4cb50d5447bc8aceb7989d2284dde060278f404b13e171c7ce1690e1"
 
+UPSTREAM_CHECK_URI = "http://www.webmin.com/download.html"
+UPSTREAM_CHECK_REGEX = "webmin-(?P<pver>\d+(\.\d+)+).tar.gz"
+
 inherit perlnative update-rc.d systemd
 
 do_configure() {
-- 
2.7.4


