Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6B677183
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:18 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c200so170340899wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mON0JKRnb3yXRf9lBUaLIKY4hiRXI9sdvzO1f9o3PvU=;
	b=w5J8TleuOoyojzQeAuCesMCDJeV4XoWOtZKzy0xn+SJUzp67KfP8Ia9wA9oukuPc12
	ypoK6RNYb2eEvGB1Qgd+eDU0oMGqHl6UKOqx0w83Lh74xc5kn1gHEyISqQ4aWoxy7CsL
	x5FQfHY308EKxDD7G4plLqrEhPzbgI37i0/wNCjIsqFS0uU9yMJyuBfahYJHH0hcS2o5
	GJhDhnJBtU8rFSYTQve7EZK1peePzIahQRu/aDqHQkbFJWGWYmxI527bxJZdQKoA3jK9
	D79WCd7LyEnLP7OR8eTiiW/tyeqwct9w7d9lMW+q8ajfAAMyeTWbfAsF9Ki0zpS4mbwD
	XhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mON0JKRnb3yXRf9lBUaLIKY4hiRXI9sdvzO1f9o3PvU=;
	b=czI0jFwcaf9BVRAWnUHRpymGML8mlMEgid310jdvJ6+CzUjrDQaPldH79FUuHqYXlS
	InN2FTdeP7ehNBjI64YCPcNmsXN3kx2Nteak8EigfqkuGjZexctekKPVv2Q+Ng71D+zw
	wuIctp6Qcqust3f6kFfFG0rRXGlygBF9bkMG0zhUosSTMCYKmgoo6ntAPV1Zrpkf33Co
	jCqWicuQs9wshd+GEk4Oxq09/8eQlPvUp4on5C+GUnXw5sN+SYqG9zS0B5xLCzNXyMml
	kfT4DPHZ7ciHw1RJArCS9rv0qKkh9S1GmYtCTDZUi6r8FsHQxhI7d0MsXQF8ylOwMB3P
	C8Mg==
X-Gm-Message-State: AG10YOQq+YpsnYys+7dlf34ZDsrSG8Cxct4Qn9qyWGMCNLf0RGh+U9MTcstm9ElKMVbJlg==
X-Received: by 10.194.88.195 with SMTP id bi3mr27015781wjb.34.1456146558634;
	Mon, 22 Feb 2016 05:09:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gb9sm24638397wjb.26.2016.02.22.05.09.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:56 +0100
Message-Id: <1456146596-6976-10-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 10/10] gtkmathview, abiword: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:18 -0000

* http://errors.yoctoproject.org/Errors/Details/35122/

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb        | 2 ++
 meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index 962a56c..89ba736 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -122,3 +122,5 @@ python populate_packages_prepend () {
 }
 
 FILES_${PN}-plugin-openxml += "${datadir}/${PN}-${SHRT_VER}/omml_xslt"
+
+PNBLACKLIST[abiword] ?= "Depends on broken gtkmathview"
diff --git a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
index 2dbec7d..58eac37 100644
--- a/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
+++ b/meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb
@@ -20,3 +20,6 @@ inherit autotools pkgconfig
 do_configure_prepend() {
     sed -i -e s:AM_BINRELOC::g ${S}/configure.ac
 }
+
+# http://errors.yoctoproject.org/Errors/Details/35122/
+PNBLACKLIST[gtkmathview] ?= "BROKEN: ERROR: QA Issue: mathview-frontend-libxml2.pc, mathview-frontend-libxml2-reader.pc failed sanity test (tmpdir)
-- 
2.7.1


