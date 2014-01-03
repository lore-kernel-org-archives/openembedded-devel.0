Return-Path: <andrei@gherzan.ro>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id D56BA6BD75
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2014 20:59:31 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id t10so7039966eei.28
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Jan 2014 12:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=79Wu8Qeu9A9/B85cWhSXKwiuCQlr3ATJsVU9hSG5iy4=;
	b=faBWQKCQeM5Gk0t0Bu3bVWdhox3ABf/AkvqGVoNRPBKbUNlfiv3JTdgSwX8X+JASgL
	Z4w+1xw7TN8LW8w8GLRXJhBm2aM4iP5I0fJtIVvzsItHQn007uR86rvbMFVdhF9zv5dH
	X87Xls42/XgWvKdjOhIqkQVE42MSV+yDU1132Hdb9h0U3eFBGPVe7i5JeHnc4cATusuS
	ec/4yWDyv17tUF4ju6NY+YEEza+WhBczw+wA+XLZd2rbauv4gu7uv+U31d+XMKnRr/hy
	KX/BEOTJWjjGhQxQsBuKM9o+RlUh+uiHNKxftvgKoQ64j5ol7fddk5WxjJvegODYJ+CJ
	+dZw==
X-Gm-Message-State: ALoCoQliSYuhXUfKLGO3ppG2parkcNv7n8YuBf9vFRVCQB58r6SL6PeX5gdEDA4TJh4m0nIIcJu+
X-Received: by 10.15.53.200 with SMTP id r48mr241549eew.111.1388782772661;
	Fri, 03 Jan 2014 12:59:32 -0800 (PST)
Received: from localhost.localdomain (5-13-221-193.residential.rdsnet.ro.
	[5.13.221.193]) by mx.google.com with ESMTPSA id
	p45sm148062011eeg.1.2014.01.03.12.59.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 Jan 2014 12:59:32 -0800 (PST)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Jan 2014 22:59:24 +0200
Message-Id: <1388782765-16266-2-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1388782765-16266-1-git-send-email-andrei@gherzan.ro>
References: <1388782765-16266-1-git-send-email-andrei@gherzan.ro>
Subject: [meta-oe][PATCH 2/3] samba: Fix unrecognised with-libdir options
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jan 2014 20:59:32 -0000

Remove with-libdir as there is no such option and set libdir with --libdir.

Change-Id: Ida67c0c92d19ccc339f16c504055daa8c0d7208a
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta-oe/recipes-connectivity/samba/samba.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/samba/samba.inc b/meta-oe/recipes-connectivity/samba/samba.inc
index 7391bbf..87352a1 100644
--- a/meta-oe/recipes-connectivity/samba/samba.inc
+++ b/meta-oe/recipes-connectivity/samba/samba.inc
@@ -29,7 +29,7 @@ EXTRA_OECONF='--disable-cups \
               --with-lockdir=${localstatedir}/lock \
               --with-piddir=${localstatedir}/run \
               --with-logfilebase=${localstatedir}/log \
-              --with-libdir=${libdir} \
+              --libdir=${libdir} \
               --with-mandir=${mandir} \
               --with-swatdir=${datadir}/swat \
               --with-aio-support \
-- 
1.8.1.4


