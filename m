Return-Path: <thc.fr13nd@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 37A6B7BD94
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jan 2019 16:42:18 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id d15so1660880wmb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 08:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YafjmsWVtzQIH6nhkRC0ryDgEZAk0OOJxYKq9MMs2Bg=;
	b=HDhTBu2x2mI4fCJNlHhWHKjQm7r7VLuKFMNw5It8WMhMXrSj8KBTkLjiFyXdZSI4mt
	K+i7NSnAMRDunEr+cKpi8LCjgjvcnuh/zE/Z6zzUjily+vRfggfQu7NKfhCMYObcy7hv
	HwjnB5sHL2Zqf3Zr+CWr6G+GNB9zr7W82BEqYWxANbFRGOrDFHTkUf/ilLU3QKbABa1A
	KiCXCNSc5xAz5pgJWWkiQTOxqD0RfAffiRbufJLuv2F6j6vYaAsoLQA1fXAUO2nNZYAv
	n+BYiq8nE+dQizRiSC5bqXsLnzIHBHadP1Rz6Xn38cBRI7eSVKV26Xyjf2ouVWgzZ52v
	T6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YafjmsWVtzQIH6nhkRC0ryDgEZAk0OOJxYKq9MMs2Bg=;
	b=PSqWdQ37n1FkkW47xdiqXPWjxp0dXDbsxsqKnXS9TvQQgHLIxHT+yOBgC5qbGc414D
	Dt52My1he8B/BYJJQ0BEzwozxImnp2kY590CZnKnlgIxI85+a68529EuJT5l6/mt4zSI
	+UlxTOETQ2xtAPu4mig6egZqObSlW/7w7iPZQ81f/5gLgxxXtHnEPuzgmkiGWOdG4Hqo
	axvoEJ80CvOKVCa9VbNSFwQDqtlrkVZjpBfn2cqh6oBfuYD/eKj5CsvqWe2fE1ga9saZ
	zmLzWP3lFikLTL7q0dD+OJUM34fkE0DSL9r6aXeduPETDnMvOnkNocpVhb3CMmLg42lO
	FChQ==
X-Gm-Message-State: AJcUukf0du9O3gxGnXJatJX66JiuXtdLw1nyHUki4jM50z6FP+5uMUzn
	mBGueVB6GjL6KTeV1j9xb+XwX12P
X-Google-Smtp-Source: ALg8bN5KKGMUQoW4o2gXnrTsBEuD/TCvDk7sCX2Hy6V4PR4rGzgmcZM9T5Kqx1PBbP02wCLx7vowzw==
X-Received: by 2002:a7b:c399:: with SMTP id s25mr1927186wmj.90.1546620138579; 
	Fri, 04 Jan 2019 08:42:18 -0800 (PST)
Received: from pc-lx-hgc-002.peiker-cee.de ([82.119.189.133])
	by smtp.gmail.com with ESMTPSA id
	e9sm39658126wro.16.2019.01.04.08.42.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jan 2019 08:42:18 -0800 (PST)
From: thc <thc.fr13nd@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2019 17:42:10 +0100
Message-Id: <20190104164210.20675-1-thc.fr13nd@gmail.com>
X-Mailer: git-send-email 2.11.0
Subject: [meta-gnome][PATCH] fix networkmanager apppend
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
X-List-Received-Date: Fri, 04 Jan 2019 16:42:18 -0000

Fix following warning:
  WARNING:
   networkmanager-1.14.4-r0 do_configure:
   QA Issue: networkmanager:
     invalid PACKAGECONFIG: bluez5glib [invalid-packageconfig]

  if conf/local.conf:
   PACKAGECONFIG_append_pn-networkmanager = " ifupdown wifi bluez5"
  bluez5 is not compiled into nm

  appending variable should use a prepending space, see
  https://www.yoctoproject.org/docs/2.0/ref-manual/ref-manual.html
---
 .../recipes-connectivity/networkmanager/networkmanager_%.bbappend       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend b/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
index 291a61605..1abb5bbcd 100644
--- a/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
+++ b/meta-gnome/recipes-connectivity/networkmanager/networkmanager_%.bbappend
@@ -1,3 +1,3 @@
 # networkmanager-applet requires glib support
-PACKAGECONFIG_append = "glib"
+PACKAGECONFIG_append = " glib"
 
-- 
2.11.0


