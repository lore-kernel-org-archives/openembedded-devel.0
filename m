Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFB0EDF17C
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 15:42:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74625.1770997353835292743
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Feb 2026 07:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yvb3fx3F;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-436e8758b91so852003f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 07:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770997352; x=1771602152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUnDPqYYmxishZSgbEK4MttbvIgun0nrchMsBNzKxGc=;
        b=Yvb3fx3FMMbybOY7FikXIPd+0zo3Qjju/Zd9aCDMgUdHwM6+OAKyyFn5+uKDdLsttF
         lgX1NzOV30BTU4bN5sY49AJE2NGLo4JfegDB0Yahak7c49tPGm1+BFmqF0D7PyqhUx5P
         ymJ8LYCnztCF3NOdSWlBx2HMKqZsR7dd0RI7xdQ7VA2yAZzsA6MspJtK7LXFioWdn8cq
         Uhhsm0g8s95+UERPE3AlYsHtqbnWDOlI6LymUth9K0WNeLIVLzZ5YTJhLy+IuZXFZ0Dt
         YM7Uyvmc0EVEuvMiBjFdyszTjU7E7/XEXPnp36ZdoGVYpbunuY4C87+Kghz22KmkARDX
         kzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770997352; x=1771602152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IUnDPqYYmxishZSgbEK4MttbvIgun0nrchMsBNzKxGc=;
        b=M5KsC/YPVnOl5Sgcm5LJlt9Bxzo2rJysk4Cixz4GWH07rmzy6MNjUUqJ1q37YNKnRA
         ZDq41+NGcahcBHT51P/vSf0bGj8CoSAXpvfPsAxpu3oAp7+fInvWMen4p3l3lKXpnsyt
         73BDSiIm+aJ2SmI63ZMwzwPi1HfcsG1SfZR8/AnZpCPNFmDfz9bgWyVWIuBBdrPKNPO3
         wZ77crCGbu6n9d7rSlehHxEF+zZ/zdHD1PMsW31s7VNB7KZehU/JpLh2yUu2ztuldM72
         CD74mPALryANUrr8cfOx16dCtJyRYJHQL9lLoOLHjWi4DB9aPuvxqnHPpmJRdQuDneG5
         oxIQ==
X-Gm-Message-State: AOJu0YzZv5NsAXeCU2ynFngPyoVj3EhUNuu3iHwARDcFjC9BRjnO/vYi
	0DxNqoG2hu0LTD52ElxxRTyuu0eyfYDei3D7GsUXcZYZBciwliWnJdyXYggniw==
X-Gm-Gg: AZuq6aJtSdso5JnDSs+bMRYdkK07jrTDUx0jh7jLh5W9xc0x9P60EzrCZ0kJ/iPBjn2
	jG6pXRE/d84ogl5jf/7zURH6swgyZANIT69wIJXxJmPgPOtRCp96GwdHdD3xHOZQjtras0mlCHn
	caeyi1Ubi6lFGni7aV/qjqJY6c4g3p9JFQQL9LrjfyxmJ4YEdDAcMnzQ2Jqu7T3rw0gncV+Yzjg
	RhGV+RBfjmN7/3+WJ6P7eheRQeHQRHo8hw8R/6cI2inXDpvASKRAx/wV9xyYIadVglhWzO3rBRC
	PjnmmAwaYjLu5Z5skpbFkmGA2c1c53HSC1O1zctH5ha88xHceWXhv9jG83EhMWzUl5hGgOmOg4S
	vIIPecQywLEti7gF7jN+bB7OxFj7zpg2xn0warTHzigzfI3jHh+XidocBC6KVmuWOTv0lMcW4Zi
	tg1TN1itBIRJ+Vel2kqu32
X-Received: by 2002:a5d:67c9:0:b0:437:9d2f:8bf1 with SMTP id ffacd0b85a97d-4379d2f8c30mr1418540f8f.38.1770997352156;
        Fri, 13 Feb 2026 07:42:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6c1b4sm5807957f8f.14.2026.02.13.07.42.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 07:42:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/5] mercurial: ignore CVE-2022-43410
Date: Fri, 13 Feb 2026 16:42:27 +0100
Message-ID: <20260213154229.1329476-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213154229.1329476-1-skandigraun@gmail.com>
References: <20260213154229.1329476-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Feb 2026 15:42:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124392

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-43410

The vulnerability affects only the Mercurial Jenkins plugin, which
is a different project. This CVE can be ignored in this recipe.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb b/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
index 3abecc3054..d118fed6ad 100644
--- a/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
+++ b/meta-oe/recipes-devtools/mercurial/mercurial_6.1.bb
@@ -35,3 +35,5 @@ FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
 
 FILES:${PN}-python = "${nonarch_libdir}/${PYTHON_DIR}"
 
+# The CVE is for Jenkins plugin, not the SCM
+CVE_CHECK_IGNORE = "CVE-2022-43410"

