Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 500497808D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 20:47:03 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id 33so21731086qtv.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Dec 2017 12:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4vBrt49JmZvS0NRBq393z71Tz2tZAuYJ3lTm8Dg88po=;
	b=IB+EALdmXQbdRD/okUShfs5QISb39XP34ExQoP++I+lxiLiS7AHwYMtZRlGzxfXDsf
	jMoVb192ezt7485Yj+9AFuUJAmyrBowysRZ8oiVVR2yKyBsQ2VSTwRk8RSS8IHcHLDAT
	7uZTz7tVCHEwCgnyecNzkbsPKeQAy341/86jRsU3zSZx4l2YJIYR+htZ5BOuQIgjzkRN
	4C3ZSZjAHrS3btnBvurwZzgOqr9dU8PJDiJGg+Wz5kUD1VHH2DPLIHJ7Iw+iuZBRmwrp
	UUo1EbrBygcTKxDtcOGbgh7V4TNOUmeXm6P4HLOB+mUN3KXaJtsRTobgls4TIpCikPsd
	9Dqw==
X-Gm-Message-State: AKGB3mLbB3hvAcNLhxaEQGz960/QaivThxdTIdAk120sj0OUzg/TycMa
	ce57LvqPV94MRKxLI70KLIpKjlRb
X-Google-Smtp-Source: ACJfBovDMNH7zE05CRzvnhjxWiNVhoT4ydw3eswfq322XeqOeT8Z2hQP4X6+spdcFmzz7OpVzMlkow==
X-Received: by 10.237.56.197 with SMTP id k63mr1528598qte.308.1513630024830;
	Mon, 18 Dec 2017 12:47:04 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id
	b75sm1295967qkj.10.2017.12.18.12.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Dec 2017 12:47:04 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Dec 2017 15:46:57 -0500
Message-Id: <1513630017-3742-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-webserver][PATCH] nginx: update to version 1.13.7
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
X-List-Received-Date: Mon, 18 Dec 2017 20:47:04 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-httpd/nginx/{nginx_1.13.6.bb => nginx_1.13.7.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.13.6.bb => nginx_1.13.7.bb} (64%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.13.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.13.7.bb
similarity index 64%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.13.6.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.13.7.bb
index d255f1f..23e7846 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.13.6.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.13.7.bb
@@ -6,5 +6,5 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903753de5f86a1ee0341fd2f9491b282"
 
-SRC_URI[md5sum] = "f84d3f782c168bfdfb734700e51a929f"
-SRC_URI[sha256sum] = "8512fc6f986a20af293b61f33b0e72f64a72ea5b1acbcc790c4c4e2d6f63f8f8"
+SRC_URI[md5sum] = "5fcd056b40cb5c47b053fb14a2a89e7d"
+SRC_URI[sha256sum] = "beb732bc7da80948c43fd0bf94940a21a21b1c1ddfba0bd99a4b88e026220f5c"
-- 
2.7.4


