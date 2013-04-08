Received: from mail-qe0-f52.google.com ([209.85.128.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1UP7ES-0000Gj-RW
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Apr 2013 10:15:24 +0200
Received: by mail-qe0-f52.google.com with SMTP id jy17so2902593qeb.39
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Apr 2013 00:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=q0XqFbjcTe1n3SrCWBtXDwE3nr4ZswlxGXkaqdVv7Bs=;
	b=juvkNa3wuL+P8GocqIXlL09RfKbKOH/MRLfiCclh25iR91i1zE3GLzDOUpfg9sZwzf
	2JgYLZwNUO0EaPfw9tiFd04L3h4dQouEflK8wtR2TXbe+UPfcAJ/c7JjzMTA/7knQZBB
	sbaYPsiSaCZO0FtMB5IXGGKiBAPCPlLQ1//2EaTlnU9MXda4sZ3EfTLOEwZky8d0QltX
	fu5tMBJsKPIlJTZY6kq7IEq213FUyaKvuN9htPmT4ZDoGozrWZe6v2XkTEmibAcQhGyZ
	D8OlXc7wirGzeTVXK1qJmkzdvBozTUlDhthLjwdN2jal67Hos0t9oLeXzWk9mmAuSteM
	MSeQ==
X-Received: by 10.224.184.204 with SMTP id cl12mr1994901qab.17.1365407878332; 
	Mon, 08 Apr 2013 00:57:58 -0700 (PDT)
Received: from domU-12-31-38-01-BD-05.compute-1.internal
	(ec2-75-101-156-174.compute-1.amazonaws.com. [75.101.156.174])
	by mx.google.com with ESMTPS id u13sm10015974qac.7.2013.04.08.00.57.57
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 00:57:57 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  8 Apr 2013 07:57:43 +0000
Message-Id: <1365407863-23360-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.8.6
X-Gm-Message-State: ALoCoQkVmMSAitcHnhyabXxrI6JQ0HKToFQgj3nvCrwWHAqFZkbKGSiErV6lcOqme0sxvXrvwjJB
Subject: [meta-oe][meta-systemd][danny][PATCH] cloud9: add EnvironmentFile
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
X-List-Received-Date: Mon, 08 Apr 2013 08:15:46 -0000

* Allows specification of NODE_PATH

Signed-off-by: Jason Kridner <jdk@ti.com>
---
 .../recipes-devtools/cloud9/cloud9/cloud9.service  |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
index 714b465..54a9db0 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
@@ -3,6 +3,7 @@ Description=Cloud9 IDE
 ConditionPathExists=|/var/lib/cloud9
 
 [Service]
+EnvironmentFile=-/etc/conf.d/node
 ExecStart=/usr/bin/node4 /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
 
 [Install]
-- 
1.7.8.6



