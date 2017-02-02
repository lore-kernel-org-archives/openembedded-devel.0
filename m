Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B8499605B3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Feb 2017 23:54:07 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c85so430419wmi.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Feb 2017 15:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HQClPtsq8I/5jm5eFW0Lmn8RH9YeAwellLJPEMhXUII=;
	b=SVWXW6oqg+C/H1MwFSGdc1tbiF4YlRa9FFRMnvl01ksobdHKUHkgiqMPvyXlMxFfA2
	Y+HHwt8xF1VjFQZV0kZRQ5QYMn+DlFiG8BIxrtWk7zfIOscZB9sXamzDVpCEeO+OQmrN
	6qBNw05mCQ1fSu03X5NPPwmRmsXCo5O0WhgeShdY+VPJb8t2lzrupWsERZwaC6MA50J/
	lj7qJX3NU+UZxGH7vCTQZ9aRQ4oLcovcdYhTnybcnT6QGdOVYIyqwBvvXsDNFkZHTwmJ
	vr944NW/z17q/ecwCnMGfd6k9yRm849MP7kM+1QM24gb0/DFAY9mwn11tlp1oZ9aL0V9
	4m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HQClPtsq8I/5jm5eFW0Lmn8RH9YeAwellLJPEMhXUII=;
	b=dsxgIQf9+3gBgng9a+RJ4x3cqaz6AUvDDNKl4LXnuNV/lGXrvbvjZeW5v1FMNQ0FiK
	nSnmHH3Dz+ASILoV+YaL6jpBbGb2P+99+kYyrz8KrXBk5i+xKX3AEkp+evwHVP8xnV6Y
	lu9Xevwl/W3h9dhFprbwYzs4xBrimlxz7emXN7i8dC7YuhDA1UKOLQzvt/GjPhMbW7/y
	U2sUlqjw4n6gOsfPZyo73XDuUo228MiMz5u0vndq6K6xdXqek4IrK+nOK1w529EQgrkD
	Ixi5lOT8GSnPMrpVeWUhhj+YlKADXF/k4+lbraTPlCiZhww88+TvIjjADS4MJz//e80y
	jnhg==
X-Gm-Message-State: AMke39lqPuVSGGmlarVgNB4amonSQFvvw9EAHg5ipzH2Bgm5fQTQ69POiO+aHFfeTUF2qA==
X-Received: by 10.28.105.68 with SMTP id e65mr108136wmc.44.1486079647083;
	Thu, 02 Feb 2017 15:54:07 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id e14sm143469wmd.14.2017.02.02.15.54.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Feb 2017 15:54:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Feb 2017 00:53:58 +0100
Message-Id: <20170202235401.10297-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH][meta-qt5 1/4] qtbase: create empty oe-device-extra.pri
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
X-List-Received-Date: Thu, 02 Feb 2017 23:54:09 -0000

From: Herve Jourdain <herve.jourdain@neuf.fr>

During configure, it complains it can't find oe-device-extra.pri,
but it doesn't result in any error. Fix it, though, just in case.

Signed-off-by: Herve Jourdain <herve.jourdain@neuf.fr>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-qt/qt5/qtbase_git.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
index 354a01c..5db9aad 100644
--- a/recipes-qt/qt5/qtbase_git.bb
+++ b/recipes-qt/qt5/qtbase_git.bb
@@ -130,6 +130,9 @@ QT_CONFIG_FLAGS += " \
 "
 
 do_configure() {
+    # Avoid qmake error "Cannot read [...]/usr/lib/qt5/mkspecs/oe-device-extra.pri: No such file or directory" during configuration
+    touch ${S}/mkspecs/oe-device-extra.pri
+
     ${S}/configure -v \
         -opensource -confirm-license \
         -sysroot ${STAGING_DIR_TARGET} \
-- 
2.10.2


