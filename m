Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 197A277385
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 16:17:45 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so143799147wmv.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Nov 2015 08:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=x+qufuAe9tVassyj2A18KEwWAZDfKMhJVzb7dcl8yT8=;
	b=eHrpGoqrU+VVFao/5EwWyxg0oI1QfiLHdZ3t123N0SLYZzkT4c9lfKjgPWf5rDv7wi
	w3i+No7mRhzCvY4+KQEULmRc8GjCGHAT5HuFefuvGhiby8Yuf3+/Nnz/dlVMtb5seq+Y
	z8TZezfrRZq58k41vQxhqWmyms2LLjwxgetKGHlCqlOXgfoLCyyATqu0X5wFHET4SKKd
	CYNG4Lqv6VRH2/8cJdFNH2s9dnyxWO5aG0bDv0Ssp58AiAqsW1Tlwl332mwqMslTQgkm
	Creel6y519cmdEHIDzKvF/pRfzydQpORnOi2MgEITZyempuXjtUBzdadfLiofK0v/u2u
	icTA==
X-Received: by 10.28.141.204 with SMTP id p195mr14177699wmd.40.1447604265731; 
	Sun, 15 Nov 2015 08:17:45 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	hu2sm30024906wjb.21.2015.11.15.08.17.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Nov 2015 08:17:45 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Nov 2015 17:17:36 +0100
Message-Id: <1447604260-5460-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
References: <1447604260-5460-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 4/8] imsettings: add xfconf dependency and xfce-layer to LAYERDEPENDS
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
X-List-Received-Date: Sun, 15 Nov 2015 16:17:46 -0000

* this isn't optimal, but this issue was ignored by recipe author for too long:
  http://lists.openembedded.org/pipermail/openembedded-devel/2015-July/102253.html
  http://patchwork.openembedded.org/patch/86091/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-ruby/conf/layer.conf                                 | 2 +-
 meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ruby/conf/layer.conf b/meta-ruby/conf/layer.conf
index b526a5d..b053450 100644
--- a/meta-ruby/conf/layer.conf
+++ b/meta-ruby/conf/layer.conf
@@ -12,4 +12,4 @@ BBFILE_PRIORITY_ruby-layer = "7"
 # cause compatibility issues with other layers
 LAYERVERSION_ruby-layer = "1"
 
-LAYERDEPENDS_ruby-layer = "core openembedded-layer"
+LAYERDEPENDS_ruby-layer = "core openembedded-layer xfce-layer"
diff --git a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
index 64a229b..699547d 100644
--- a/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
+++ b/meta-ruby/recipes-extended/imsettings/imsettings_1.6.8.bb
@@ -23,7 +23,7 @@ EXTRA_OECONF = "--with-xinputsh=50-xinput.sh \
                 --disable-static \
                "
 
-DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim"
+DEPENDS = "gtk+ gconf libnotify dbus-glib libgxim xfconf"
 
 RDEPENDS_${PN} += "bash"
 
-- 
2.6.3


