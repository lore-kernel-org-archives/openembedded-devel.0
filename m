Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD277718A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 10:20:59 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i5so10344249wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B/dTQ25XiTpjA4TNjVplFhYgDm7hgImvnpUPlhhRSnQ=;
	b=a0VPrH0sA78pRA11fXboz6Cqxp62vOhW9qylR8b75fRw2MHqxlCensTpx1GEUXm8de
	ebNuBAiIt2VGrNIV4I8caS0aMfaqjT9lgIZu8oMjrgwmEP6n4CYowInuViwq8kBoUo4z
	gEPdOtKOz3FMg2rxwC6owVcxzs60MmmKReF8+EavdfNRJZM1DMfSRWzZAzoGswhYWIG/
	d2H72qdIO9PjdWwT9J94AolENbrHsLkZjenAGjowxe64W7p5qmBFriGGEta1rcmkgxNB
	2dKeyg1t5FfXKuufAt2TXCtpVApL9i0iExGLU6SBfYxen2EsZmq6pvrwFwOX1O7gfgQ1
	359g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B/dTQ25XiTpjA4TNjVplFhYgDm7hgImvnpUPlhhRSnQ=;
	b=QUyurpYAz49MLqFteXPx2+ImjCFAhmqB6VYSHT37/8ep+vWjraGMbkUDzaObP3HmEq
	+3x3Ush2UtpowCwyJclMlUFv3QBByEjP56vr7FRUg93TnxKMzKVeL6rP9WNXewf28soe
	jKq09oQaWjbP2fHqGYIBLo/Hv/fHkC2eR+VfmOMDm8ZVHHEb9b94lFGE/ML4kQhevCQh
	1iXlkVDPFLeFzSPh1ymqrBWv4Dy3LWgrRkP+CylC5Gn0L+NuQCBFVsEQk6sB5/i21U85
	KWG2qH1CQe9+yzvUUn0Pq1Uzl7LVyAzoL/mQ/MnHNWI/oLSnHEWWlHDVTwDava58z8Ik
	Ba+Q==
X-Gm-Message-State: AEkoouuPCoOH0oVBwe3rWnmv3+B54xJ7pzJzIh4Q2zL4gXe38j7DeGe5uTYoLiJnJn2DpQ==
X-Received: by 10.28.153.202 with SMTP id b193mr14887652wme.62.1471256459378; 
	Mon, 15 Aug 2016 03:20:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	bj8sm20722675wjc.49.2016.08.15.03.20.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Aug 2016 03:20:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Aug 2016 12:20:44 +0200
Message-Id: <20160815102049.3291-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20160815102049.3291-1-Martin.Jansa@gmail.com>
References: <20160815102049.3291-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 06/11] dconf: add intltool-native dependency
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
X-List-Received-Date: Mon, 15 Aug 2016 10:21:01 -0000

* fixes:
  | ../dconf-0.18.0/configure: line 6430: syntax error near unexpected token `0.50.0'
  | ../dconf-0.18.0/configure: line 6430: `IT_PROG_INTLTOOL(0.50.0)'

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
index 2b6f15e..c3fae1d 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.18.0.bb
@@ -9,7 +9,7 @@ SRC_URI[archive.md5sum] = "69a12ed68893f2e1e81ac4e531bc1515"
 SRC_URI[archive.sha256sum] = "109b1bc6078690af1ed88cb144ef5c5aee7304769d8bdc82ed48c3696f10c955"
 GNOME_COMPRESS_TYPE = "xz"
 
-DEPENDS = "glib-2.0 gtk+3 libxml2"
+DEPENDS = "glib-2.0 gtk+3 libxml2 intltool-native"
 
 inherit vala gtk-doc
 
-- 
2.9.2


