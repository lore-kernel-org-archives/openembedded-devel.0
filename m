Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 823587F3DB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Oct 2019 05:44:25 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id r17so3901341wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2019 22:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=tHSGY4LH1RFLkeoMhBI/YWqzWEmECwGpF+HLTqRw5FM=;
	b=JcDD0DEMTjYvsRFHbeqQRXWQf4rbFlRBrpcMi8n6c+suHgFHZ6Zi+xsO0sOMw+g3fV
	fypGUqOvD/gUrQoc/lRMFN+SkegVvVV7cGkD6lr9jLsODs5I/jpXOp6XK3XM/c3P4V+f
	BUIUQZhO44LIy0CVPcYiK41+qarZNXH/DHb/wqcGe/remCV/ui/ZsRuZucoybdQP9Qv4
	KNt73rPyXeBxWy1xCKj2HKzm9J1HMAI7cmkhcXVXaUDjDM8EDJe4fNQ+WMzhFLhAge6+
	I0fBI141UERegDKI9Bpsm5EIvJfRSM8d46jtn6f8RxwsN6k2GEK0sBzXpUMUYOo1ntBN
	N/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tHSGY4LH1RFLkeoMhBI/YWqzWEmECwGpF+HLTqRw5FM=;
	b=Sbni43BhA0iluTeMlgMMSyYf0+kpA55Opi2RPZfB4x0fL7vZqLlCRtJjfOmUiF30Xg
	R1k5Bifbfp4pdpx/dzfd14hQx8BR7AYt8XiLO2Z529ateAUUZZ1wRv4ZHSmu19S3PeSF
	M8OwCyGmXbV5oosz+qY5A3lSD7ySXnPqTGdzhjdtP8NCmIUpylcvEk6NgGX6coswwc57
	9/zdG78jmI0deWS8osgqCXVLNrxlpPH5M+ljVHl6wUHdk6RHRroHbiTC7W5Y+XelGv+O
	7g8UbGwN4CSQ6/JE5Y2S6MP4m+Q84sCvldCDOrDqOS/3mBgKo1UveJRyr6TXa5b7DPbh
	1TbQ==
X-Gm-Message-State: APjAAAX5FkhJHXOwgRZh6V4zeGRwAmg9Z4QY6r+cH7EVPERh+BjUy0nw
	nvULTI1FBmS74up9Ikq5+GidIG+D3PY=
X-Google-Smtp-Source: APXvYqzaTIt+ba8jI82PmP+hMp7QgRZisEMgmtawYNITK49FUqJFOe8TdYbOm9MpmMjLtJ3VTi3u0Q==
X-Received: by 2002:a05:600c:2201:: with SMTP id
	z1mr1123935wml.169.1570599865785; 
	Tue, 08 Oct 2019 22:44:25 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	q66sm2056801wme.39.2019.10.08.22.44.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 08 Oct 2019 22:44:25 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2019 06:44:22 +0100
Message-Id: <20191009054422.130384-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] ostree: Upgrade 2019.3 -> 2019.4
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
X-List-Received-Date: Wed, 09 Oct 2019 05:44:26 -0000

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../ostree/{ostree_2019.3.bb => ostree_2019.4.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2019.3.bb => ostree_2019.4.bb} (99%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2019.3.bb b/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
similarity index 99%
rename from meta-oe/recipes-extended/ostree/ostree_2019.3.bb
rename to meta-oe/recipes-extended/ostree/ostree_2019.4.bb
index 1fe7dcf212cf..505c9fcccc59 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2019.3.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2019.4.bb
@@ -28,7 +28,7 @@ SRC_URI = " \
     file://0001-Always-enable-trivial-httpd-for-tests.patch \
     file://0002-Gate-ostree-trivial-httpd-on-BUILDOPT_TRIVIAL_HTTPD.patch \
 "
-SRCREV = "5c1697da78ebf6250a7130b8b9e6cbfbeaa34296"
+SRCREV = "9d39e7d91e8497987cad69a3fbed5c5fc91eebdc"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
-- 
2.17.1


