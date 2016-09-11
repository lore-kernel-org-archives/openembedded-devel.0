Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8E695771DC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 07:37:21 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b187so8968022wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 00:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=fbBDy3kneGe84+59eZZfsptSu0VO86T/EAyH106MwZI=;
	b=zkvZKW5KwTsLdIj+S422BFu3Yxqtye4keQF/AtkvkBjz3q0UmYaqr/04WF+dulxJs5
	NxCtSLMSMVB0VQmyBYzC9BWOUodKN9BrQSufXA1ZWgySrz0azbVWaI5fM/7t3MeqnuCU
	qc08zFzKxgqBuluomSoFWnhunk113qU/iRLWJiae+JvNT/WkY4KyuT4yS7vv3gFbaDtf
	jy7E9BB762xAuvP4s109cnDGESF8Rr5Xep+aQdCq3PvVnD5CD5sDoicZ9gYESbkdy2In
	YaNn0u+XqXHoWq/G8d0gVegwe+Zk0ZRNWFn6PdKhgo/cimZY11u+fyIhkFnSoZXxfK7M
	9YzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fbBDy3kneGe84+59eZZfsptSu0VO86T/EAyH106MwZI=;
	b=F++kRzKfa1nzmwTJahh2xEjlrCy4A8LHRxAZa6cKcNlMf+f2mQVDCVGgH4FRU8AFI4
	pUbTkC7y+nUwpyhv8TKgcTPckExMFNy1fYiazFZQt0eXZ5eA7MP405MFpX2z8RpTcWSO
	anilvoEAu948PQXBT9BZHSMrUtlK6Affm8g3ICTRzyMZEvJVU6KvMYA96Hok7I4W0Lyz
	+KsS2lNlcA8uVaM9P+nwkW/uaXwPakpBWW6geeKmN2ljuF4gjnwxwEvUSZW/MDRU4zyD
	KWBqxUpEZKeBSutrF7MXTE6xnqg9OehN/EKJz8bnYc+CjHnOOXIxw/fsBgQs1V455SnM
	s+jw==
X-Gm-Message-State: AE9vXwP3VuQk5bb3wRSbWWXfttoUoVQukHNg6C2LFlmb6xNDNtG0djMLQCmhC0emoP2UWg==
X-Received: by 10.28.61.87 with SMTP id k84mr5665182wma.98.1473579442369;
	Sun, 11 Sep 2016 00:37:22 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a18sm11719840wma.5.2016.09.11.00.37.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Sep 2016 00:37:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Sep 2016 09:37:20 +0200
Message-Id: <20160911073720.15288-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [meta-oe][PATCH] xfsprogs: blacklist, needs upgrade to stay compatible with default kernel
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
X-List-Received-Date: Sun, 11 Sep 2016 07:37:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
index f38239c..460a898 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_3.2.3.bb
@@ -50,3 +50,6 @@ do_install () {
     # needed for xfsdump
     oe_runmake install-dev
 }
+
+# http://errors.yoctoproject.org/Errors/Details/83236/
+PNBLACKLIST[xfsprogs] ?= "BROKEN: Needs upgrade to 4.5.0 version to be compatible with Kernel uapi changes from 4.5"
-- 
2.10.0


