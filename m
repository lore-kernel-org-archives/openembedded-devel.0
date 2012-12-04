Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfrOr-0004lN-A5
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 13:14:57 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so2148097eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FvfD9hkMJlmU/Fk2wPqmmfmtlKjFAYRwsmETusTZXv8=;
	b=gJKXnqOpU9bX/9s6auq2Wy19+pd5xabMMO2tOJ+TZQwZuxNCbi2DEaJzGL5LLaeaw+
	VPHfCHlME14B+xTv3dQLcXND0pr255X8h/aualfxpNpL9wgvXF60aXwp4Dw+OFwFOke9
	Vex2uGnSzjZ4hwIl7TCNKNkXuuX/FOUAMFOlY+AqLP1x2xeirb1ud9JXK7DW1+yGTe+T
	crUmS3H5SbtIvYnXjN5jWEJUqBYzCVsbi8ma27Iezz2gccuRGd8ex9tpmGlsn0b3a6Je
	O8q1/MHehClvtlWMEITl6Zw4R1PTfjtm8efZ7LQTZ1Y3EI+uTrpfBiZx04EcFPtAznCf
	W1Ww==
Received: by 10.14.3.195 with SMTP id 43mr47778981eeh.36.1354622437160;
	Tue, 04 Dec 2012 04:00:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b2sm2206495eep.9.2012.12.04.04.00.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Dec 2012 04:00:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Dec 2012 12:59:56 +0100
Message-Id: <3628afcc5eb78935b7ed8915badc1a0f2b7e9c1f.1354622319.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354622319.git.Martin.Jansa@gmail.com>
References: <cover.1354622319.git.Martin.Jansa@gmail.com>
Subject: [PATCH 5/5] meta-systemd: ntp: update for server config improvements
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
X-List-Received-Date: Tue, 04 Dec 2012 12:14:57 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This makes the service use the ntpdate-sync command which reads the
servers set in /etc/default/ntpdate; if nothing is set then no error is
produced on startup.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
index b2bc632..10cbd70 100644
--- a/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
+++ b/meta-systemd/meta-networking/recipes-support/ntp/ntp/ntpdate.service
@@ -4,7 +4,7 @@ Before=ntpd.service
 
 [Service]
 Type=oneshot
-ExecStart=/usr/bin/ntpd -q -g -x
+ExecStart=/usr/bin/ntpdate-sync silent
 RemainAfterExit=yes
 
 [Install]
-- 
1.8.0



