Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id CFC2173196
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 02:44:49 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id c13so153399ywh.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jul 2016 19:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zVDVAf4W5YHu4hKjCRUBFCtbxXjmJMlBP4NJSz0fRWw=;
	b=O6+rHUu7k1gKCVaTfeDDvwiWwwqlr9hoPhTsHBWAxKkmXYsKXD6B2NH+22Tik4T6FX
	JtNtq9A0aPCGDJXAnEToa4WRnSMbdtakJKSfAteasQgJW2W5XwlgiRbgkqdOu3pDZhKl
	Thdg5OCX+iwzx34CkaO5ixtLDAzZaNKClcQ1k1dTP4e5NBkfzwu4sW74sxeVjJNbbAIO
	C8dJrp0pT2HG3zj07HcyH1PNN0s4Bw5eav2fms90AHctOON+UnM8B3Fcw42fpF+YqzvM
	RUwhQ4oJzwdS0EzCDOhjGSmpZ4MM3lLxStoqHlT+2QQFw+wpjV81CUKl+YnNFLUmnLht
	NoJQ==
X-Gm-Message-State: ALyK8tIsax/pi3XuSgEKdfXnODajmUGrvAKyuUpgkbJLyHV65ztr8DYZm0xlGkfGVOUB7A==
X-Received: by 10.37.66.65 with SMTP id p62mr14608546yba.13.1468291490165;
	Mon, 11 Jul 2016 19:44:50 -0700 (PDT)
Received: from lnx-dereks-laptop.star.lab
	(ip-64-134-183-30.public.wayport.net. [64.134.183.30])
	by smtp.gmail.com with ESMTPSA id
	n18sm6631437ywn.36.2016.07.11.19.44.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Jul 2016 19:44:49 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Jul 2016 22:44:42 -0400
Message-Id: <1468291482-9845-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Subject: [meta-python][PATCH] python-six: update RDEPENDS to work on both python2.7 and python3
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
X-List-Received-Date: Tue, 12 Jul 2016 02:44:50 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-python/recipes-devtools/python/python-six.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-python/recipes-devtools/python/python-six.inc
index 625cbad..e54c0e8 100644
--- a/meta-python/recipes-devtools/python/python-six.inc
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -12,4 +12,4 @@ do_install_append() {
     install -m 0644 ${S}/*.egg ${D}/${PYTHON_SITEPACKAGES_DIR}/
 }
 
-RDEPENDS_${PN} += "python-io"
+RDEPENDS_${PN} += "${PYTHON_PN}-io"
-- 
1.9.1


