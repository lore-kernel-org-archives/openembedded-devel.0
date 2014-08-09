Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 25F7D70A78
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:08:54 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id n12so6897259wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mDCdodZcHwT9vx2ini+pN96mvMANCA8BA5h3k2z8bvc=;
	b=H+M1Te4i3P1Mj7s06SEcG1r08F3fg/LL8Z1PYOVgMQYOQlvpLjXWAdUd6tOfVFHGB6
	F/rmht6zFNMotP4B9n1D4ZA1G/Rzcwel7qkiuSdP4i3wdemwAAKJXfiX1veIx2vRRT6d
	RrzRlqjlZnpMCdTQ9I/FmdBfLzjyoBRCKm3fe9omu0cwTaJf5F/S4XJZFKLYIZOYWhOU
	AOMVVlZIjFCIR0WkHxlyBKKp4uPe1kAGKCjLxGFqnDggm6TmQBmvBrqhGUmMkqchV9G+
	n6LZfZQuir0v5QLH1rpLQ+1RbUNKAvq2OIaZASpfD+C5xhInpeWH+N+EZN+zl/le5Q+7
	7RMQ==
X-Received: by 10.194.158.101 with SMTP id wt5mr2054544wjb.136.1407600535668; 
	Sat, 09 Aug 2014 09:08:55 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	j5sm25518248wjf.35.2014.08.09.09.08.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:08:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:44 +0200
Message-Id: <1407600537-10857-23-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600537-10857-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 23/36] metacity: remove unrecognized configure option
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
X-List-Received-Date: Sat, 09 Aug 2014 16:08:55 -0000

* fixes following QA warnings:
  metacity-2.34.13: metacity: configure was passed unrecognised options:
    --disable-verbose [unknown-configure-option]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
index fc0a977..9c48238 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_2.34.13.bb
@@ -19,8 +19,7 @@ ALTERNATIVE_${PN} = "x-window-manager"
 ALTERNATIVE_TARGET[x-window-manager] = "${bindir}/metacity"
 ALTERNATIVE_PRIORITY = "10"
 
-EXTRA_OECONF += "--disable-verbose \
-             --disable-xinerama"
+EXTRA_OECONF += "--disable-xinerama"
 
 do_configure_prepend() {
     sed -i -e 's:$ZENITY:$NOZENITY:g' -e 's:-Werror::g' ${S}/configure.in
-- 
2.0.4


