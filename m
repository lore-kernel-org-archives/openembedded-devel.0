Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A333770E3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:20:54 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q128so10340877wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=or7kLzBOeiLIxnI21TSf1wlXnPjVPRq9+hsty4VGkjo=;
	b=vRHuKQ5W+JMW9ytfIvIZLfeVCj6HfSs/1njazGqgwxufhUgGFENBmlLwU4qxW7vsap
	6uGBCNdwsTOHKmekqUs6U+pZkhFhLfUBA2SO3C4kxhNzvsLWdHTAGfISSjGvK4PCYwvN
	Z304+E/SSJxyqDOZ8OHVNUzKp6kQu1kIBV+i0msDxuf8nO0MG7mRnq831rJ88L0+/aNg
	7b/OOH7oRSD06MgIK6SkvStZGfB3UP80uud8B6mQLXPU4i0tSwgA6Osi+LFIMPppoyWy
	wiaIhsb5UwaM9t5JOri7I1c+Vfjh9eBAgifsjzrUSk1dp3Sye8RY16fBLp+l5g7tKmrW
	Xk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=or7kLzBOeiLIxnI21TSf1wlXnPjVPRq9+hsty4VGkjo=;
	b=IkhJKhS59HzWatO+NaQW/u4NbBMPbcWvDFtE/u8gyi2TXLcuMhtTb0n1MBMRkKWo1m
	sHWb6ZHed6oRYTsoJtn4iP5GKetGOU9UHICaTi7HOuWgYelStCIQFQyOxIxGpPJZFL6O
	tUk7BPQhGM+904zgbHSjnXyB646Qrbd5nbKNGWF6j8DcZRmuGeYYTJVrqhtYEWGdXTGZ
	9TqqlMcobriZd3fBNoXwoPIouL8fe3kTqZrV2HYt3UJgBB2glAtcv1Vufk4VwYtvo4iE
	f2rw+SgEHYOUPHiaLKFp9ZcOqifsBwHHAzJ0GYpkEJzZLpDXszUTvVzSb1m1WKexUzKs
	PETA==
X-Gm-Message-State: AEkoous2DqzVO7C6l9QFe3c9i8mPaOkK1Og63XpkphvS6JCu19llvWrVl+UMWImFVrUDig==
X-Received: by 10.28.134.14 with SMTP id i14mr13253669wmd.59.1471256454573;
	Mon, 15 Aug 2016 03:20:54 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	a9sm20795575wjf.16.2016.08.15.03.20.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:20:53 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:41 +0200
Message-Id: <20160815102049.3291-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/11] gtksourceview2: add intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:20:54 -0000

* fixes:
  | ../gtksourceview-2.10.5/configure: line 12665: syntax error near unexpected token `0.40'
  | ../gtksourceview-2.10.5/configure: line 12665: `IT_PROG_INTLTOOL(0.40)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
index 8d935b8..ebd2955 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "gtk+ libxml2"
+DEPENDS = "gtk+ libxml2 intltool-native"
 
 PNAME = "gtksourceview"
 
-- 
2.9.2


