Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 759177CE5F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 07:17:48 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id c22so2199742wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 23:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=50PdqbetXPThelNo+hEkATlbYLO93y6kf/K0slr8De4=;
	b=IRn1n7qx1mvMcsp6/BfMQw7c7sbd0oWAKNB0PgbqjOsKyVchQSv8YNMLoLMUMRVgFm
	gvvM/0luUXKk0d7HZPR49FdG6No2LBZqJH0ed2xvmY7EWjQSCCRJeaagrAN7qdqadEKT
	OsEWq2VZ/YmgvOZHZQ75fA1rMPP74oIH/xtxYXwL4ZED5XTzhgtCtXYayxX3Q/qePxMs
	wh2qvMxzZoMrBJ6eCg/ElaNWv/gcbW2RZDkHul8wQs7J8FS9lhuXOizDPN8+/SwKxZUK
	eKe9tzjxhLM0gwSSx81zYJ4yVK2MRDvHpvAcPSu7q5QyDXpYZAYf6uuzRHhkBs/MI3bO
	Cy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=50PdqbetXPThelNo+hEkATlbYLO93y6kf/K0slr8De4=;
	b=Tuvadp66yfPZNHGL3mja46WmqegY3OzgLvcmy7AscnFZKQfySMsHdOOxFi8+6XHsZA
	6enl371SDgi7qGd+u/DASnlGKQlrEBSlcV/q8J8//u+67/MgDiVLj1dKiINt/6MUmpN7
	gve617G2HBDYVw6Vw8cAPMkHU8WWrBrUp8XAa5YH1FOA/c4FSp1kGEXrxx+K8hJNskCJ
	TxDirM8z4VhTP/H5ldJss8CmKjLTWvX40S5gE/DihMdP2emWYd9XHOwMjxEiP3QkoMFD
	OeZXIzG6Mc0Mpn4m16+FSh7iP82FyMdvc5wfrfehj5Lkcnr8c4kgGA+HaGAIAX/ZsMKz
	aQWA==
X-Gm-Message-State: APjAAAX/Tn9Ajf/wHjql9af+n93PKPkwm96ElNlWYSgXfWvmvnZ9m+Ea
	IvBLCRAqAV6TFGyNJGPpq67JODNX
X-Google-Smtp-Source: APXvYqxIT/1uEhxf7PKqYoQ45zAe2ulqk/kp0dA8qgyw5pTmpHMMFkj/VnNdGUC0a6GRzEJJNZMPGw==
X-Received: by 2002:a7b:c7c7:: with SMTP id z7mr3454779wmk.133.1574147868942; 
	Mon, 18 Nov 2019 23:17:48 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F0CB657F29A81DEDF319DFC.dip0.t-ipconnect.de.
	[2003:f0:7f0c:b657:f29a:81de:df31:9dfc])
	by smtp.gmail.com with ESMTPSA id
	b1sm24480182wrs.74.2019.11.18.23.17.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 23:17:48 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Nov 2019 08:17:30 +0100
Message-Id: <20191119071730.2682-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191119071730.2682-1-schnitzeltony@gmail.com>
References: <20191119071730.2682-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 9/9] gedit: add gsettings to inherit
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
X-List-Received-Date: Tue, 19 Nov 2019 07:17:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb b/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb
index 9679a1ce6..a4a863962 100644
--- a/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/gedit/gedit_3.34.0.bb
@@ -19,7 +19,7 @@ DEPENDS = " \
     gtksourceview4 \
 "
 
-inherit gnomebase itstool gnome-help gobject-introspection gtk-doc vala gettext distro_features_check upstream-version-is-even
+inherit gnomebase gsettings itstool gnome-help gobject-introspection gtk-doc vala gettext distro_features_check upstream-version-is-even
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-- 
2.21.0


