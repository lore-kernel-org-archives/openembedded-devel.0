Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
	[209.85.210.179])
	by mail.openembedded.org (Postfix) with ESMTP id DFB257FF35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2020 06:38:32 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x184so2862674pfb.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 22:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NyYBWkw7uLd5G21mwN9XZ/Y5V2sXypRWw1FvGMVtPkY=;
	b=bIxUG1JlBFx9e2aMH0OWnln28Q5D1hqr0yUUZ7pjhn6y8cyY4CkERGTXrS7ilN+Ovo
	V3yjOKM7IhKXUGOeX1b3YcOaVCHHhZxyQFwLYMTWk9W7Yb0RMGwUsj+RO4DDz4PkGM9C
	J9dvJ077YBKrZsnCX1HbyVjFfwZ1ejnYECFTOT+W9QpoP3yFvY/0IMEgRfqC+sbW74rx
	YlA/gTPjfcf7WFVmM4uZPdMubYlXPhItbjMQutU3iYDtpRNU6+ryguITWm0ClV3wucOU
	jbGgRCRsk1m/376WaMxtP2EU4Iy2FL+sFJmxkpun5OvZODCuqVP9K4bKrXEP2/V7kj6P
	tmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NyYBWkw7uLd5G21mwN9XZ/Y5V2sXypRWw1FvGMVtPkY=;
	b=LsaI+YYJVaDlxGGkpCzcuxUJB3Cbwmsi80dHHPNqaa4sQBb6+T+U0+Hgspdxr/eeLs
	zMaMYV1wvMiaLM//QnWHhTmdy/7Iyo0ABoOmEemP0PdCi+ilRx/ep3BrYCMCq2+3LbnZ
	Py3D8zlPFptBZOaAniA5yBh63OA/2fRRULXDUruXIMIx9n7CUmQhlsIKtc1XYchEji+L
	8e5kNToEutsuKqiSuYm+p0Zu/VrOUisBISMKQRMi24qoq9OP31iUTOJh76Ioq9jwkypc
	B60hn7RUFbmc3zCz+KRWn9RfNt3BtD2oe4ggtt1gxfawI8yGkI9BmjmiYt0VMFh2NXQt
	JQZQ==
X-Gm-Message-State: APjAAAWsHlrKpxLzXPG7oEfjdYnTFHdIjAYQEduVBfUP6Ln/itFL7HWi
	0mTZOj+Jv9QHwvKyHPySyWDLsddHcQw=
X-Google-Smtp-Source: APXvYqwlwqjfslLDATqJ/pVnE0yTZbs6ScMVRWOyn2leEw29x2dLvlEvf1SgdDGWw8p/2vyK9CnAvw==
X-Received: by 2002:a05:6a00:2ae:: with SMTP id
	q14mr1225468pfs.155.1579675113233; 
	Tue, 21 Jan 2020 22:38:33 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::cab1])
	by smtp.gmail.com with ESMTPSA id
	100sm1600283pjo.17.2020.01.21.22.38.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 22:38:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Jan 2020 22:38:22 -0800
Message-Id: <20200122063823.242098-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122063823.242098-1-raj.khem@gmail.com>
References: <20200122063823.242098-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 11/12] cherokee: Only build with meta-py2 is in layermix
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
X-List-Received-Date: Wed, 22 Jan 2020 06:38:33 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../packagesgroups/packagegroup-meta-webserver.bb          | 3 ++-
 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb      | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
index fc117850b4..089c325252 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserver.bb
@@ -19,8 +19,9 @@ RDEPENDS_packagegroup-meta-webserver = "\
 "
 
 RDEPENDS_packagegroup-meta-webserver-http = "\
-    nginx monkey cherokee hiawatha nostromo apache-websocket \
+    nginx monkey hiawatha nostromo apache-websocket \
     apache2 sthttpd \
+    ${@bb.utils.contains("BBPATH", "meta-python2", "cherokee", "", d)} \
     "
 
 RDEPENDS_packagegroup-meta-webserver-php = "\
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
index d16e04e6b1..81805891a4 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
@@ -20,7 +20,7 @@ SRC_URI = "git://github.com/cherokee/webserver \
 
 S = "${WORKDIR}/git"
 
-inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd python3native
+inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd pythonnative
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ffmpeg] = "--with-ffmpeg,--without-ffmpeg,libav"
@@ -70,3 +70,8 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "cherokee.service"
+
+python() {
+    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
+        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
+}
-- 
2.25.0


