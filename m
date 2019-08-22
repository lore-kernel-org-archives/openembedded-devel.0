Return-Path: <ja.kaisrlik@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9EEDB6BCDC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 12:23:21 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r3so5229624wrt.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Aug 2019 05:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jBtk7FBdQnqNQmODcZHrUueCUVlf8b4cFxh1UPmnAr8=;
	b=PS3wgUdwM6iyjwcl6HnOXQS+glRGCZXRaFBk+bfgOPJ8RwWlaqUlcw2I2f8MUBVl7Y
	dHBYGnkpgY+TxJK8HsHghVMJXmKzgyVEfI9LaDl6sMqFlLo7iVhapgDVseNGvHbSDPO9
	Chz5zwh6aDpzMO8MuwiYSTG0mWu5a/cOeFLaNVd6g9Ux/VEBiG/BR0BjPpJpzmuN0k4m
	fPH+UOqqHmBuBMrxv7CE01NSzUrZ7QWY62o8p7UhqCOWFVf56HygBbErFzK4Uk9Bl8Fs
	T1yYhuVJqtsH5g89boloKaMhUPtzs+ihPIICrSFrkkn6GZ9qj6ntVc/1ixRd9Poob+lO
	q4+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jBtk7FBdQnqNQmODcZHrUueCUVlf8b4cFxh1UPmnAr8=;
	b=WugUsefweZniK9NwINhAgrRRfG7CFGL19OpR2LVBJKWLNfg1aMPXDq0munRYcawz+E
	8oploC13e93cr4VzuU2POnWbmgEEcq81Yf0pQzSrggVLnjWM80d0y16KLgwvzVwlqkhE
	vjJwNNpDqwuJse6IgY4qq4Qt/ivOsttl23HeZPZkxsoKqQ43FCK7nogwxdS6MO+ZZaHU
	vqGflnMIhW6BaK/K/TvWBPJPBjpMxRRvJ9dMS2BjHZmtJyLUO/wKkWWbU0rcw86+CyH1
	PvS8xd3x3A0d6XoK+NZabpdCwgA+8daZeBGWqHQPdPr2a2CKDl41is0oApH7Be91WWyI
	xAKg==
X-Gm-Message-State: APjAAAWkJnDx+gT0w2Ix/cEsdg97vSKUzbmql4WCXY0b0PLpt3Nkaf8T
	HPq+B0THAE5Qcwz71OlnPM6gJVzCvqA=
X-Google-Smtp-Source: APXvYqyjfjnv1awkEdS8N4ewL3UmPVURqFgMfkJnCbPYzprSQjR68xzLpPB843JG+WTra5vh4vRvKQ==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr10647502wrl.331.1566476602278; 
	Thu, 22 Aug 2019 05:23:22 -0700 (PDT)
Received: from xeri-steel.it.int.avast.com
	([2001:67c:284:64:5646:bb87:150a:dd53])
	by smtp.gmail.com with ESMTPSA id
	q20sm79177596wrc.79.2019.08.22.05.23.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 05:23:21 -0700 (PDT)
From: ja.kaisrlik@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Aug 2019 14:22:58 +0200
Message-Id: <20190822122258.30801-1-ja.kaisrlik@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2] networkd-dispatcher: service file is using different location of binary
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
X-List-Received-Date: Thu, 22 Aug 2019 12:23:21 -0000
Content-Transfer-Encoding: 8bit

From: Jan Kaisrlik <ja.kaisrlik@gmail.com>

Signed-off-by: Jan Kaisrlik <ja.kaisrlik@gmail.com>
---
 .../recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
index affd0aa..008a7ac 100644
--- a/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
+++ b/meta-networking/recipes-daemons/networkd-dispatcher/networkd-dispatcher_2.0.1.bb
@@ -24,7 +24,7 @@ do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 
 do_install() {
-    install -D -m 0755 ${S}/networkd-dispatcher ${D}${sbindir}/networkd-dispatcher
+    install -D -m 0755 ${S}/networkd-dispatcher ${D}${bindir}/networkd-dispatcher
     install -D -m 0644 ${S}/networkd-dispatcher.service ${D}/${systemd_system_unitdir}/networkd-dispatcher.service
     install -D -m 0644 ${S}/networkd-dispatcher.conf ${D}/${sysconfdir}/conf.d/networkd-dispatcher.conf
 }
-- 
1.8.3.1


