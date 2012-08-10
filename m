Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Szpm9-0005H1-Jw
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Aug 2012 16:01:17 +0200
Received: by mail-we0-f175.google.com with SMTP id r6so930135wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Aug 2012 06:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=y07GaWn5iAwACup7B5oZLgZxFrW7RRtmcRTbAy5YD5Q=;
	b=fGclL2wMPPOq07jUUeMA5okdsrcniHPy4x5Of4qscjaOxreSDcsSAfI6IeTg03aQVD
	NlZN5yfDfjbNEfejPwgnyNUtgzyk5vpBJKL8GYyZFAnaFRUQ8YRA4layLkpI2pn8opOr
	cW2/D2zu3OgUAChirjDjEBrMsH7eLQOcNkZNnYzQ/eaq4t3hTJKENqi1JbmqI4LumDLS
	pHIL24HmJix8Dld/0pfPvxS3UuYx0c0HnMmT0kfZ8t31L+e5MozRMBbXxPQMhqLqtOZG
	CIENkF2VQeRK+7HwOLfN/+l4DW345J67Cra/R2Q6NPg5eaFL84SdwvlIaTQdtb4q+uRj
	onZA==
Received: by 10.216.123.130 with SMTP id v2mr1667639weh.117.1344606570218;
	Fri, 10 Aug 2012 06:49:30 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm11651256wid.7.2012.08.10.06.49.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Aug 2012 06:49:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Aug 2012 15:43:38 +0200
Message-Id: <b385e10e57f6283edd0a31cd6adc7d7122d49b1a.1344601517.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1342645937.git.Martin.Jansa@gmail.com>
	<cover.1344601517.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1344601517.git.Martin.Jansa@gmail.com>
References: <cover.1344601517.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][PATCH 43/46] meta-systemd: elsa: rename to entrance
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
X-List-Received-Date: Fri, 10 Aug 2012 14:01:17 -0000

* elsa was killed in r75060 and reintroduced in r75061 with old name - entrance
* also use Alias=display-manager.service like gdm does now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../efl/{elsa => entrance}/xserver-nodm.service    |    4 ++--
 .../{elsa_svn.bbappend => entrance_svn.bbappend}   |    0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-systemd/meta-efl/recipes-efl/efl/{elsa => entrance}/xserver-nodm.service (55%)
 rename meta-systemd/meta-efl/recipes-efl/efl/{elsa_svn.bbappend => entrance_svn.bbappend} (100%)

diff --git a/meta-systemd/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service b/meta-systemd/meta-efl/recipes-efl/efl/entrance/xserver-nodm.service
similarity index 55%
rename from meta-systemd/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service
rename to meta-systemd/meta-efl/recipes-efl/efl/entrance/xserver-nodm.service
index 0b9c0f5..4828686 100644
--- a/meta-systemd/meta-efl/recipes-efl/efl/elsa/xserver-nodm.service
+++ b/meta-systemd/meta-efl/recipes-efl/efl/entrance/xserver-nodm.service
@@ -2,7 +2,7 @@
 Description=Login manager for Enlightenment
 
 [Service]
-ExecStart=/usr/sbin/elsa
+ExecStart=/usr/sbin/entrance
 
 [Install]
-WantedBy=multi-user.target
+Alias=display-manager.service
diff --git a/meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend b/meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
similarity index 100%
rename from meta-systemd/meta-efl/recipes-efl/efl/elsa_svn.bbappend
rename to meta-systemd/meta-efl/recipes-efl/efl/entrance_svn.bbappend
-- 
1.7.8.6



