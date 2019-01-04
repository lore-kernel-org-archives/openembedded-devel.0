Return-Path: <thc.fr13nd@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7C36C6BD4E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Jan 2019 17:24:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id g67so1885321wmd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jan 2019 09:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q6RVS1nHs5h04IiQhizqkzcgHUWC6LwvNO0ot7PyWiI=;
	b=GzH2RJOf6z5N9/NMYylpPscLEFNcDCSLMvT3EJIBHYRAw3+zNeG+djkDSW/V59wCuv
	wX1DUOYRZiqPG2zK1Hn0kh5JYctBjgvU7BpdKwQIRKOP5ZtOPJFqdGXfofkjuWrSJmO8
	z+v0kSjo3Csj2jtUEeIM+VPfxXGfh6o6qaWE9CBojWBwlKWEY6XruRYLn5IOQN+jWURB
	7IprzdXLZR6ot/8x4T/9y5IQFNJopAj2ed6skYt0w2orefd8cwyBmOtFv0UYqZVUC36w
	T5c+Kkvqu+TGlTcgC28WMLmq1sW8naJsqCEJJNUABvBjWuZzVPpRGhz5+TQJFmVTEd6H
	Jnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q6RVS1nHs5h04IiQhizqkzcgHUWC6LwvNO0ot7PyWiI=;
	b=dJw6suVk6OrcpwXedVir/PHHNiyAVxoPzQcZg2uf4pW3+1Yly5/6yEFO1vZb/LcZRq
	rvr0HelvOsCHmZrvwYZ0qD4rRB8B4GgosCh3K91CV3Z+I8dl0tXJ0F7YnQQ2vfLWdHpv
	HUeAPymzzCW5w61orzrLH6UIEn8duXOEfNeobpJqEKUlk1IL7cqG9DXVB6TdnbplQkgl
	/Y8sFZP8evBPHQutoK+XP0Br5BpzjEl9U080eqZBsu67hra4tv2KUxpCl+tKtoCvaTpS
	ZBrbfOZ0/Vn2EhWc7YgRrI2fZyEG61YR3cZqhCQKSTnkvopUrEYz2qKx/1Cfs8IyOiSb
	hdvg==
X-Gm-Message-State: AJcUukfJErwhLiyaoHWMq59x1XXz0SQrN+0OEXVdVsq4okfNHcJU8gIU
	KM9xoWOIWtQRdeDoJ1Y4g+vFkdVp
X-Google-Smtp-Source: ALg8bN42oFxsOWGQ4Nf6ISn7C/LlhqgKeoq8zhgpE9QdwsIQgUiUIvHf8V3+AG0Nsd8yk730pFS+vQ==
X-Received: by 2002:a1c:868a:: with SMTP id i132mr1888043wmd.49.1546622677875; 
	Fri, 04 Jan 2019 09:24:37 -0800 (PST)
Received: from pc-lx-hgc-002.peiker-cee.de ([82.119.189.133])
	by smtp.gmail.com with ESMTPSA id j3sm1553303wmb.39.2019.01.04.09.24.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Jan 2019 09:24:37 -0800 (PST)
From: Thomas <thc.fr13nd@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jan 2019 18:24:31 +0100
Message-Id: <20190104172431.24771-1-thc.fr13nd@gmail.com>
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
X-List-Received-Date: Fri, 04 Jan 2019 17:24:37 -0000

From: thc <thc.fr13nd@gmail.com>

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

Signed-off-by: Thomas Csovcsity <thc.fr13nd@gmail.com>
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


