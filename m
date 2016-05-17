Return-Path: <kergoth@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3F6847325A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 16:10:30 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y7so2352840pfb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 May 2016 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=FzfbL9ZWlCmVTm+3pygOtkRlbhKcLyaJl8zhxGmWhJ0=;
	b=0/KHEbvmd/ChWHxk1vl13Y9cD5RPk7oteHELxziw2StIAUmS6MA3VveM3ELNXZRN1T
	TnqQ+trZa2q1CrQUVlmAN+LnR3CAotfy8hWy0hgYxE3uSqkeJaYs45XsKFbZSuxR8rM0
	d5uGPkxOWPcecQ5nDA+6gKeHzr1PIvdRhMHFk3pSZhV4NlRmm9leFizIAR2VqmwR55NK
	PFtq97+i7+ug5VteTb8q+s0H2IZpXalrc+gV5/xsh+QeTWu7pHto0T2FcQ4B/L8KIpR2
	RLW7pPzUaYUVxl2a+YE9LBeCMV9w/ca0zFe4uDeQZwN/GJ9XDr4RU4mEJA93bCMOeTxx
	xigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=FzfbL9ZWlCmVTm+3pygOtkRlbhKcLyaJl8zhxGmWhJ0=;
	b=Lf1WcpeqsNGfzgnYAV8CFSyf+GCIshR2hQgeGPftRkVgBvx5sXW+MhIsndLsfnlUse
	qcb0WhrdipnEZKl3G8TG9ZgcvaF9sPTbRQi4MwA4tKkJf1qHK7w/ypSKl6BnmFeoyq8c
	65S8xQ0CekYsEyOLhBACOena0hJ/YvdaHxZ1TlT6jk755KFbNod1vxD1bqH6/DRMBf7x
	YGP++7hD69+rEtzhSZtHNatNvvraRbhUPuM6Y3DdlmzM6rAQrOgQPHi0Q2z9v9LWpBmz
	QTO1ylDMZuHBv8bN7FZfImXK9CFTQoHr351fR2V2AyhQEJSra2cFw/mOZn4CPnn6wUZm
	4qxQ==
X-Gm-Message-State: AOPr4FWQRDyLRcbHHVDX74zNT0ZCfG3junaHOMugARgx0m4g+BZsWYlhF0O3BchP3a6yMw==
X-Received: by 10.98.11.7 with SMTP id t7mr3221130pfi.159.1463501431831;
	Tue, 17 May 2016 09:10:31 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm5868665pab.30.2016.05.17.09.10.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 May 2016 09:10:30 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 May 2016 09:10:18 -0700
Message-Id: <da57aeee4d9973ad6976db106e8f03ca3e56c014.1463501350.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
References: <3ab55100823a114a701c63eaa703d0352bca5513.1463501350.git.chris_larson@mentor.com>
In-Reply-To: <cover.1463501350.git.chris_larson@mentor.com>
References: <cover.1463501350.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [meta-oe][PATCH 4/6] networkmanager: add missing dep on intltool-native
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
X-List-Received-Date: Tue, 17 May 2016 16:10:31 -0000

From: Christopher Larson <chris_larson@mentor.com>

Recipes using intltool need this dependency.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
index 831ddf0..c8447e6 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://docs/api/html/license.html;md5=51d7fb67bde992e58533a8481cee070b \
 "
 
-DEPENDS = "libnl dbus dbus-glib libgudev util-linux libndp libnewt polkit"
+DEPENDS = "intltool-native libnl dbus dbus-glib libgudev util-linux libndp libnewt polkit"
 
 inherit gnomebase gettext systemd bluetooth bash-completion vala gobject-introspection
 
-- 
2.8.0


