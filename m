Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UQFIJ-0007jZ-Nk
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 13:03:56 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so688688eaj.23
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 03:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=PT8T6tsLmg1Q8qolOgvqQMOYK5OPAY+hptxui/wZILg=;
	b=lm6zLhgmjHC/3cxYaIbL2xp80XRPVZ+sKOf1RDFDr/oFIgvFhIFuvY0Xq5Ya7B55Bk
	BKuO8XKPkm3XpkYOIMOB7dBRqsBQrmzB1sWJ4F7bVRf9kf8kMzX/DQKLRXKbNBnt3Fos
	Ao9u9AiZbq2WjBaXbBPZ60yORZ5rZqxCYgcsfYHRGlK57p0FrRkecZIJ7rQEW8ttfDGv
	LSHDSwi9uHexhoKzT4XNAvLvq4WkzxxP1kizilvJ+tuEBbeBgzlMyBszQCtyO9DaIb6N
	ytcwP6g/K28CzeUnCjCEceJqecoVrYTOTkyeQ07hetJiY1EhjJZEMKkjpzGpeI4z3d9m
	er9g==
X-Received: by 10.14.210.132 with SMTP id u4mr15728841eeo.19.1365677192591;
	Thu, 11 Apr 2013 03:46:32 -0700 (PDT)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id a41sm4946895eei.4.2013.04.11.03.46.30
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 03:46:31 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 12:46:04 +0200
Message-Id: <1365677165-9296-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
References: <1365677165-9296-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkxrHREqUSDxQ37ZLbAFkbzlqU5orjU9gmbVbhxbFwXg7y/1hEnbvJIODqwcE3s5vTZeaGQ
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCHv2 7/8] cloud9: add autorestart on crash
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
X-List-Received-Date: Thu, 11 Apr 2013 11:04:00 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service | 1 +
 meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
index 714b465..f805ea9 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9/cloud9.service
@@ -3,6 +3,7 @@ Description=Cloud9 IDE
 ConditionPathExists=|/var/lib/cloud9
 
 [Service]
+Restart=always
 ExecStart=/usr/bin/node4 /usr/share/cloud9/bin/cloud9.js -l 0.0.0.0 -w /var/lib/cloud9 -p 3000
 
 [Install]
diff --git a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
index 777d2f4..afa85bf 100644
--- a/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
+++ b/meta-systemd/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bbappend
@@ -1,6 +1,6 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 inherit systemd
 
-- 
1.8.1.4



