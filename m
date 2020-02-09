Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id 738CF60CDA
	for <openembedded-devel@openembedded.org>;
	Sun,  9 Feb 2020 16:17:23 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id n96so3094944pjc.3
	for <openembedded-devel@openembedded.org>;
	Sun, 09 Feb 2020 08:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Y7W1NNN1vCVkc1k9Sw9Kggto0Cuw8RTpupaNQv+hJMk=;
	b=XKYDCYsRMj3EH2YyGq8HnydGHuNnOyh5E6SjKnZlW2o3OioplJzbq1UfyDEKIenhXT
	umBeBIv42wkwZEGMmIF4BiXE69riqWiWd15TDns3swVKn9rzpDfMNWQ4bpVS/T3iYk6B
	f5riVisJXT9s5Vml4f7VRcCH6YqM88nCUKnM4bS5pOukpYmLhph/rZ8XB9s+uEJSFUYZ
	ZzooRed+/wGSZO8Io4En3IjFVeiqVPSYxVNrvnj9SJJQcXxlhkb07LXnTkJk5Q7D8856
	qMTeZpZ5Nav8UK+c6aV0q6LBLxJSgZpqiyagOaWeC0dJHWr8xck8u6fl78lZmky60qMk
	0msw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Y7W1NNN1vCVkc1k9Sw9Kggto0Cuw8RTpupaNQv+hJMk=;
	b=I88nZVuovSlJBVBPFeBBoH94O//WBaGS8q+DWknJmtR3qwg2itFeCUjgNky/pSHeyD
	1nV8YevT5sy0KslWXqutNwiZrZZZwjdo6TQWzeDDV3DLersqK+Exw0ekbFNIyQxP3MQR
	fZPS2DnbJ/gjQKqiW7hEK8iFSC6d7JHqmLnJKLcaPydTBUzPj3IzVhA/U4ojjFdsEJTB
	b5B3Slhfi0MATRTkaQIYg0fbKg5m8K5beLjhpONei4jPYmH7qmGRtR24WAwnXGqVEjed
	UeBz+B+a5/XyFEQu1eXzH4vmUaaGwswC9qvg6sXBnu4hL0jI/kuEDTtHUd0tBaktlkoN
	JmQQ==
X-Gm-Message-State: APjAAAXYZOPXv9eQDKhhE6Mb2eyOg/1D10hzHyq128FnSSx6zNuL+Jp4
	xqKKu9lbmjFQkQih1kVPxpRjVRc6
X-Google-Smtp-Source: APXvYqyTrXhSgTwzcBKLex2ASs+1NQMCBWUZ5JfY/e8JHWZomhZdjNIr7w0Ek4SNEJaKapImdsUVIQ==
X-Received: by 2002:a17:902:bb8d:: with SMTP id
	m13mr8630807pls.157.1581265044232; 
	Sun, 09 Feb 2020 08:17:24 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	a19sm8831737pju.11.2020.02.09.08.17.23
	for <openembedded-devel@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:17:23 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@openembedded.org
Date: Sun,  9 Feb 2020 08:17:09 -0800
Message-Id: <f64c2d691ea597aa6221e3d7706a4d022e07bfea.1581264950.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264950.git.akuster808@gmail.com>
References: <cover.1581264950.git.akuster808@gmail.com>
Subject: [zeus 01/11] libldb: upgrade 1.5.5 -> 1.5.6
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
X-List-Received-Date: Sun, 09 Feb 2020 16:17:23 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 2b3fd534874aee125a6c79c70c93b1aa498fda3f)
[Samba's update via ee5aa6911b2e93b89e67ae6167ee7d9a029b9262  required
 libldb upgrade to 1.5.6 Yocto # 13750]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/libldb/{libldb_1.5.5.bb => libldb_1.5.6.bb} (95%)

diff --git a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
similarity index 95%
rename from meta-networking/recipes-support/libldb/libldb_1.5.5.bb
rename to meta-networking/recipes-support/libldb/libldb_1.5.6.bb
index b19c964d85..99eb6f9ce8 100644
--- a/meta-networking/recipes-support/libldb/libldb_1.5.5.bb
+++ b/meta-networking/recipes-support/libldb/libldb_1.5.6.bb
@@ -33,8 +33,8 @@ LIC_FILES_CHKSUM = "file://pyldb.h;endline=24;md5=dfbd238cecad76957f7f860fbe9ada
                     file://man/ldb.3.xml;beginline=261;endline=262;md5=137f9fd61040c1505d1aa1019663fd08 \
                     file://tools/ldbdump.c;endline=19;md5=a7d4fc5d1f75676b49df491575a86a42"
 
-SRC_URI[md5sum] = "339a41ac9efaec680e6d1469dd9aa35b"
-SRC_URI[sha256sum] = "199f5861aa863f538ec66d5fa95ecc13254a2030c53daf0e47363fa9ba235c68"
+SRC_URI[md5sum] = "fc58ef432c1fcb03fc3bb6cccce08977"
+SRC_URI[sha256sum] = "ff82474d0bf109e415a2d50334bde5715f486a53ff4bb8c7f74459dd229e975b"
 
 inherit waf-samba distro_features_check
 REQUIRED_DISTRO_FEATURES = "pam"
-- 
2.17.1


