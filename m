Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B229373204
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 20:45:48 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 199so3123395wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Sep 2016 13:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VnfJjrLG1nGLDXSyQzTDooo1L/zAxQuGI9RKQVT3Vf8=;
	b=WRgmRZ6t91HXNFQs1+8rTPQ7CfdQczKjXW9U/CRI7iWumqdIYvWgEmeQowNn9BvsXp
	nvg6kuWCwub726ku2eV1k/zG4eodcSrV+wJK0BlQVjQr6oWbD4EZXmN6kpn+JuM+mRw4
	DhQH73bwAA6z7gZhsDUFrapcvfnafNDYRBFBaho4jypzK82ZQ1uKCiK09tWhpm61vjap
	fXU/p2f0yC7VtOcO80+w/w+RxpJllSkI9HovcoxStIVQkN9vuFGmIjUH5VUqacQsx+P4
	neymhcjWeCKJEtnQGZ0Fhj9i/SuNXo7LK+wxGGV91JwQgdWLvm23bEMaXF7BEVC9lP3q
	G/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=VnfJjrLG1nGLDXSyQzTDooo1L/zAxQuGI9RKQVT3Vf8=;
	b=ZOCFFNQmx6msE60k1sjZVzO6wClPkso3KXPYJbPvYZ3zXs4TB9EOEQUVHQiD6rJ5mx
	NwuWyv7ovad4q4K0/ApksCO9EHDhdLXgyGSeMmSNQO9bAAAqnQLjnVj9T9G2nsU6h0BT
	n2yfdXSw62umNGQtUDaqIz+kuU8Ji40Xiuw+NM7vV6jmdzTsdJoSpY8nWTuS89QbYXMb
	/vjvWO838Jj1aKaWibktaqUvJxVOqvDg/Qi2CbHeHASaz5VH54ptZ3gEgiV8mqvn2KVk
	DBfWPoNXet2C713jqE6qBwGfU+r3i5ihI9RRpyKO97WM33Qc+KEwJqQIZQOqlOh2sV1z
	V3jg==
X-Gm-Message-State: AE9vXwMs8rS7Lu5dew6G592RlkFg55Gi70i08RQMXJhViSC992X1cm6CckL+M0AYCAWoEg==
X-Received: by 10.28.15.3 with SMTP id 3mr7136057wmp.31.1473626748267;
	Sun, 11 Sep 2016 13:45:48 -0700 (PDT)
Received: from localhost.localdomain (p4FDF0450.dip0.t-ipconnect.de.
	[79.223.4.80]) by smtp.googlemail.com with ESMTPSA id
	ub8sm14486591wjc.39.2016.09.11.13.45.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 11 Sep 2016 13:45:47 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 11 Sep 2016 22:45:38 +0200
Message-Id: <1473626738-28188-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] packagegroup-xfce-base: add librsvg-gtk
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
X-List-Received-Date: Sun, 11 Sep 2016 20:45:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In elder environments this was dragged in by something else. Images without
librsvg-gtk look really ugly and many icons are missing. Many xfce-packages
ship svg icons. Instead of adding RRECOMMENDS on each of them add librsvg-gtk
to packagegroup-xfce-base.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
index a182458..14ea4b4 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-base.bb
@@ -14,6 +14,7 @@ RDEPENDS_${PN} = " \
     xfce4-panel \
     \
     gtk-xfce-engine \
+    librsvg-gtk \
     \
     xfce4-panel-plugin-actions \
     xfce4-panel-plugin-applicationsmenu \
-- 
2.5.5


