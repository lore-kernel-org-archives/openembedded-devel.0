Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id F12AB77BD3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:46 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id v203so16926999wmg.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HSTggRacDyVTNc8hjyDyKxkC3wtMVfA9eVmPTGIo5gM=;
	b=lS2k7pPsG+Lw5eIN/mhiDx4xxYD+2j5fB8BXerCh3H3bHRJN9qPtTkzMgn5Idn002U
	XSHerNCKB5wUFx8fJGBoQs6mLvAKlDHurVfdjDHg6KLInwcTt9eAuKQ8FjdkNrXORuN1
	8A/glYJIPRc3im3qMf/AlmHtPBqM00rogf8eFQUZIvNxw6dAp7VRWmwo8YP9bFqMUOc0
	63NE6seAYLt4CiFROEMPm1JhwnfbsDMUcecSBEZy6oDf49k9rHwt3WKyoTu3G0qUHkci
	6g4xPS+rQaT1nYAgFdb2mGzqDs2HFAKN6fI0ugsRHqNSLHrlchVQ/krCaA5Nzssu7iwz
	Il2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HSTggRacDyVTNc8hjyDyKxkC3wtMVfA9eVmPTGIo5gM=;
	b=Txsj6fqb/DtsfkfRLfunyUmDacLi4Z1NGWPnF7LXHtiWnUQT7X+AT+h305iB/Uvm5Z
	o01PRS+z24H0wYxQZmLN4vJ0NQ/JJExwk45dYfOuyQnRJKUOC4u5wIcn5zVroRO3A/xs
	cArNRrqy73F22Q16WX+BWsEr8Pyvo69gbuHqFrC8qxO/2/y8aE1nP4JEvAgP73mQZstF
	Pymznfg7m9fzzC2krl7qN3XNi+PDISVC+EKzAdMMNmsqn1zqqhi1kjRHRB3mxTwGIUlY
	YHe/NQd0U6VdS788dmsUtJQX44HW2YHAbtrT9UC7/aFgFLQMflwSp3qhhzOlV4EhdIWy
	S6ig==
X-Gm-Message-State: AFeK/H0NDEL+ArMOe9oT4N8V6mWghH3eFXJbDJbWvyjO/v95lNr5sFmjoKFWiDbTeIs+Yg==
X-Received: by 10.28.11.69 with SMTP id 66mr365913wml.38.1490779007804;
	Wed, 29 Mar 2017 02:16:47 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	m21sm2111221wma.19.2017.03.29.02.16.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:36 +0200
Message-Id: <20170329091643.32180-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170329091643.32180-1-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 2/9] mailcap: use pagure.org instead of retired fedorahosted.org
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:47 -0000

* https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
index 7d87a5f1d..58b8f029e 100644
--- a/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
+++ b/meta-oe/recipes-support/mailcap/mailcap_2.1.46.bb
@@ -12,12 +12,14 @@ by several applications e.g. to determine MIME types for filenames."
 
 SECTION = "System Environment/Base"
 
-SRC_URI = "https://git.fedorahosted.org/cgit/${BPN}.git/snapshot/${BPN}-r2-1-46.tar.gz"
-SRC_URI[md5sum] = "eee03824bf86480dc1db20be4f78237f"
-SRC_URI[sha256sum] = "309059163fa3ef368f8a43fc38f7a45d9345fd725970d5b437ba175a0ee7ebc9"
 LICENSE = "PD & MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=100fcfb84512ccc03ffc7d89ac391305"
-S = "${WORKDIR}/${BPN}-r2-1-46"
+
+SRC_URI = "https://releases.pagure.org/${BPN}/${BP}.tar.xz"
+
+SRC_URI[md5sum] = "d865a1baf574ae5d309f5c1f79315800"
+SRC_URI[sha256sum] = "c68eb3b531d731476d5980c9b7cc287bd64c2a13bec5a537009a2c4af63f9bb0"
+
 do_install() {
     oe_runmake install DESTDIR=${D} sysconfdir=${sysconfdir} mandir=${mandir}
 }
-- 
2.12.2


