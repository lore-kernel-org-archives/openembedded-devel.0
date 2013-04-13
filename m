Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0nW-0007Tl-Ew
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:18 +0200
Received: by mail-ee0-f50.google.com with SMTP id e53so1657569eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=d3O8MVb5dirZvCE/CnKUnE3YBkOu55L/gybmRw6Z6YM=;
	b=oqQSLpqsoQXxPwp8IBX7oqoeyGZtn/A0t9iBFij4iL1MTR6igLsbK6gkkUJ60+lsWN
	Qqj446OVNIXrFvmk9Bfq8OqPwCBhL2GLvCwUpkQJ+Oqfj62Po825+uA2Qo3T9OMpJrZw
	mlG0YML81eeKOpdyogFXRfoodnAkktcH/YHhdY7mvsFYue5IhW24g+wJwSBsUHqSb3Si
	gGGZGMacOC6JnzMUhvKDijHpthRQk5IJUEZmnnf4+zgMceyN97iSoye5FqRk957GT2VK
	fU/b0dz77PTEmhNnAwUO0k9EOq5bbSrNuR/HM0Rh/XQOF1HMgmdH5UYtsf3dSaBvuzqJ
	5LkQ==
X-Received: by 10.15.76.132 with SMTP id n4mr39467085eey.16.1365859792549;
	Sat, 13 Apr 2013 06:29:52 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id r48sm11807811eeg.2.2013.04.13.06.29.51
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:29:52 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:20 +0200
Message-Id: <1365859790-20947-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 03/33] busybox: move bbappend to oe-core subdirectory
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
X-List-Received-Date: Sat, 13 Apr 2013 13:47:23 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-core/busybox/busybox/busybox-klogd.service.in                 | 0
 .../recipes-core/busybox/busybox/busybox-syslog.service.in                | 0
 .../{meta-oe => oe-core}/recipes-core/busybox/busybox_1.20.2.bbappend     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/busybox/busybox/busybox-klogd.service.in (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/busybox/busybox/busybox-syslog.service.in (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-core/busybox/busybox_1.20.2.bbappend (100%)

diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in b/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-klogd.service.in
rename to meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-klogd.service.in
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in b/meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/busybox/busybox/busybox-syslog.service.in
rename to meta-systemd/oe-core/recipes-core/busybox/busybox/busybox-syslog.service.in
diff --git a/meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-core/busybox/busybox_1.20.2.bbappend
rename to meta-systemd/oe-core/recipes-core/busybox/busybox_1.20.2.bbappend
-- 
1.8.1.5



