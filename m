Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 207C36FFCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 17:59:02 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id x189so4011470qkd.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Aug 2016 10:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qPGgBg6zw6mxXBgQzFlAoOwzGEbHj428aftaQk2a7Ng=;
	b=BmTw0Pvtf0sTyDecAnjr9bH8Mj4QgmX259Z/NzApiJql5eBnhBbJO1dRaA6nzhybCp
	+htVvEnQNfBNrWm5/lm9TmvriFyh+TZEM1Rwie6leHgUxRZnsU8DWofEg6ItyAWw9l4S
	97tqeGVzIoM1ZtDcnVaTxnjbIkxKxEvG6kMdlUD4tzALiupwJg6IgSkfY30lq2Xrt72X
	k72lqQII5eNLy8z5+h+c1pY74ayfTLexF3Lf16oujHxvn6jxPyW7C0we9Oq7Ovdhy6Pw
	naxLp1+GkIyIAR+wGCmuZ3b0EfqP+x3n65j0vKNC47R2vfs3U5nW0irB5S/V9YOguxQw
	9AaQ==
X-Gm-Message-State: AEkoouul1J9Z6GVJ5GLDVA8S7zQOZ7sV73c9TebcON8gz6cf6qYDLV3zHwWDlvuH4y/lgA==
X-Received: by 10.55.207.87 with SMTP id e84mr6504478qkj.266.1470851943163;
	Wed, 10 Aug 2016 10:59:03 -0700 (PDT)
Received: from localhost.localdomain ([96.91.222.230])
	by smtp.gmail.com with ESMTPSA id
	j62sm23912493qtd.37.2016.08.10.10.59.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Aug 2016 10:59:02 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Aug 2016 13:58:53 -0400
Message-Id: <1470851934-20960-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-webserver][PATCH 1/2] hiawatha-init: create log directory during init
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
X-List-Received-Date: Wed, 10 Aug 2016 17:59:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init b/meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init
index 47fc087..7427fcb 100644
--- a/meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init
+++ b/meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init
@@ -19,6 +19,7 @@ OPTS=""
 case "$1" in
   start)
 	echo -n "Starting $DESC: "
+	mkdir -p /var/log/hiawatha &> /dev/null
 	start-stop-daemon --start -x "$DAEMON" -- $OPTS
 	echo "$NAME."
 	;;
-- 
1.9.1


