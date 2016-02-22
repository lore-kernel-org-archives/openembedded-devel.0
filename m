Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4CC67771BC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:40 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id c200so170356580wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jtZ1n/Gk4G4VYqPrk1rQqY6a8tH+VvRvt+cGTgXbpiI=;
	b=xNhzC8nUk18dgslJD4lFXfVlrIMryOyTSeREPkYw4wdlbEwDkvsJZX8mUq/lAJ/8Bx
	KzgovAYgS0Nni1EUM8G4MfroGz3DCDegHEp5jlxbfgWyMVtbZ4V3oF7C1R9sVmGV4Ygg
	RUWtbq1a5heKgFWqflqQVRLjjAouFovjpeAHG8h03BwxXPK/jCoh5937jq5cOdqL3q9/
	0EE4v8iQwikdLcGSmdIz979fHOLBRr3/21Gi3TJk31+yFdxx06aQG8hcJUw8savve/mG
	dQKeU0JWXmyNHdi5B0EKbLUxgUHAfE9FdnVvuMGXO5/2R17EW+4MynYwvttIV+Ckmzme
	T5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jtZ1n/Gk4G4VYqPrk1rQqY6a8tH+VvRvt+cGTgXbpiI=;
	b=RudLGD93e/6mmX/YyAUm+rX8jme+kPGRUgN9o6uJYOHNLMWxBjUlR+7/h4hL9L84SW
	CghH4GQkROqz1Hm/gofu/xSgKghZuAJS/x2o8dHKLzkkOpLpOymx36n9EgT7eDK/7jYP
	y3/qGPqR3joMWdzVZ9D5ThdopKBIsviwb5lCIktGYzXGMtEcoCDcaJy1QGpY3/j9egKk
	Ob/+LIfSQHO2GZ3Vztm5uABcVN2H3ERAFrUyp53ZfAmZswMV6WVWDMN0Fw8qxErzP8IF
	sYS8VNLrPpwaQRhnTkj5TY/zaiNfAazhGMCoJ7jZMj19RJvMUiVZpI8GmtX6Cy8LyD1c
	lX/Q==
X-Gm-Message-State: AG10YOQQBCejPmtaDj+lPcQmlOWgdUkhv1OReD2/NjU1bbaaLJBu4Que+hSSA4tmmCnkBw==
X-Received: by 10.28.224.87 with SMTP id x84mr12954215wmg.32.1456146580564;
	Mon, 22 Feb 2016 05:09:40 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	t3sm24696662wjz.11.2016.02.22.05.09.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:39 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:10:25 +0100
Message-Id: <1456146625-10100-5-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146625-10100-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-networking 5/5] dovecot: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
index 7fb8b44..f297dff 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.2.21.bb
@@ -63,3 +63,5 @@ FILES_${PN}-staticdev += "${libdir}/dovecot/*/*.a"
 FILES_${PN}-dev += "${libdir}/dovecot/*.so"
 FILES_${PN}-dbg += "${libdir}/dovecot/*/.debug"
 
+# http://errors.yoctoproject.org/Errors/Details/35133/
+PNBLACKLIST[dovecot] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so""
-- 
2.7.1


