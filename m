Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7EB0E77183
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:37 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id b205so154814635wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=J+38t9+fQpk6KZMONimzoOMO/nXSMHw3cZURigjAoWU=;
	b=E6AmWnvbKxBLkXdY+73YK7+8zzbdyGdbr9TFOnjFTZR3VbzuFMI3uqtlVdviirE8Re
	YFw78sNW5wm5CIGqqC0wT+jumNVysaN/wWK3+SJz1ICMk6Ddgxeqb8loYophK18o6NG6
	hqZsZ6kV/dYBAaVN2h2+Z9q+ZL6oSk7CbVF8GNuMlZtg9JZ4Oi/bHWAepWqiInv/b7MR
	ZkV544klzpjdS47wS+lATGDNlSmaT+GEJ43iSVomqoR0rQ+NHaPC6vQixRhw3g4t3+Ry
	FO5K5G9VWkL7GBhRB7WRLzAjGBdiiltLfShU1ULut3WF24KGaXxcqD3zcLQtY7Nrh20k
	UrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=J+38t9+fQpk6KZMONimzoOMO/nXSMHw3cZURigjAoWU=;
	b=feC07Ikm1ntnP7nxfgH6ex0bGMObDrGu7n7ZT3wH2H6CGhtVzxQFyWhE7NQIeAZbod
	ql0kACePlitguA+BgWtm3oCQ1NeP1FPfVuh6LTobKQ8/QDD1Dq/+zvEWdnSckGnSQ6mW
	P+0Ac0Ms76lHKU6BSGImAZcMKJKzTouzyaJskj25+AuWQ6GB9/VsP1NbhFlqM1ui4Doz
	Xs1fd1GKad0cbT5Q0VYVIak9BJSF1KFIplly+V7BYloN0B1v65U7xmzDBdQfp08iYJrK
	NcCZDfnsds7R58ImB1FyorB4QuUBZz1KdvJOuHRE6nUOchRvRYy/r0WPuqrakcYda0Zs
	ef6Q==
X-Gm-Message-State: AG10YORcrcjosZTHIUVWgtRF3dSlRigR7MzjNZNy1yV5qFRK3Kq8KwGMN8UwzAu25KDeTw==
X-Received: by 10.194.87.1 with SMTP id t1mr27284820wjz.170.1456146577814;
	Mon, 22 Feb 2016 05:09:37 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	74sm21145739wmn.17.2016.02.22.05.09.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:10:23 +0100
Message-Id: <1456146625-10100-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-networking 3/5] znc: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:38 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-irc/znc/znc_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-irc/znc/znc_git.bb b/meta-networking/recipes-irc/znc/znc_git.bb
index a7a44e2..6603c77 100644
--- a/meta-networking/recipes-irc/znc/znc_git.bb
+++ b/meta-networking/recipes-irc/znc/znc_git.bb
@@ -25,3 +25,6 @@ inherit autotools-brokensep pkgconfig
 do_configure_prepend() {
     automake --add-missing || true
 }
+
+# http://errors.yoctoproject.org/Errors/Details/35142/
+PNBLACKLIST[znc] ?= "BROKEN: QA Issue: znc.pc failed sanity test"
-- 
2.7.1


