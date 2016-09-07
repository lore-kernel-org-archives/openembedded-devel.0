Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4654577713
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2016 05:57:07 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id w207so1178930wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 22:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Zagpak69P5tw2bCmXaT8BXkwu2RXsKVx89QrfnM0FEo=;
	b=KMVzDUSPpEjfTAalTxy62a9tL7SLRGX9X3cjcP73g/1P3rOX97PfyOyldPHGA6vcal
	kaKVw+BBPwNpQJ3sDlbjiUQhQmPkzM9mC1wTTFQKPYGvHyO2tdkD+T0C3XeKKoc2x/eQ
	lBCFhuhD88Dx8Erm8J/eJF1uX0e7BIpdCvbOJOgvTfiw+4LH1ZF2rKpR49Hvfjx+vgN9
	n+hseIUfE8SIecddrGJLqW50BWWs2KyWcOR/8swlt9UJ9lIS0qHD/pk/EFhIATtqPlG/
	Y5UYDGkiDe7k7wpHLG3QAS8lCg+uD0TKuNxiGI6eibRNkCuKAvK/SnlQZlLceUJYYcME
	KXUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Zagpak69P5tw2bCmXaT8BXkwu2RXsKVx89QrfnM0FEo=;
	b=i60LVozlFdumtSM4cwZgrESH9g2i9Op7tIWphNpOGkUTetTmbCVSTT2UkxwH4RUr+d
	VHjdSycyVXmWrAxhj1e/Ud6CX4bDmNs3Sf1cNLVxgAbPH5a+HSLYuSf89H2Ws5pN3bPb
	CbtKMlafKQeVi++4EXlvuN+uRs8xATh3EeYjg+lVRVXOflX3wJsjpke9M52MQC98YzJ5
	EMg3kY0CMgozFvRjeNYq62nK6/9DQB2qaDEaKGDgzZhitLV7ExjI6a6/nT6Hh3b55GW6
	qhTBcmcOGvU+QppXGYC+ti+7UYGT9bKfQO8xsNNZC2q/0JtBqrfFCitn4IKP2iG1MAcG
	HlzQ==
X-Gm-Message-State: AE9vXwPJHqIy8KYnD7GFvasOzR+e6JB6z0oV5WlroLi6VxD7ofD8pxVQ+9yOnQphR654Xw==
X-Received: by 10.194.94.138 with SMTP id dc10mr44697499wjb.40.1473227827983; 
	Tue, 06 Sep 2016 22:57:07 -0700 (PDT)
Received: from localhost.localdomain (p5B0A28FA.dip0.t-ipconnect.de.
	[91.10.40.250]) by smtp.googlemail.com with ESMTPSA id
	p71sm2324552wmf.9.2016.09.06.22.57.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 22:57:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2016 07:56:55 +0200
Message-Id: <1473227815-5512-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH] libqmi: fix floating dependencies
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
X-List-Received-Date: Wed, 07 Sep 2016 05:57:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

libgudev:
* Is not configurable -> DEPENDS
* fixes
| WARNING: libqmi-1.16.0-r0 do_package_qa: QA Issue: libqmi rdepends on libgudev, but it isn't a build dependency, missing libgudev in DEPENDS or PACKAGECONFIG? [build-deps]
| WARNING: libqmi-1.16.0-r0 do_package_qa: QA Issue: libqmi rdepends on libudev, but it isn't a build dependency, missing systemd in DEPENDS or PACKAGECONFIG? [build-deps]
| WARNING: libqmi-1.16.0-r0 do_package_qa: QA Issue: libqmi rdepends on libcap, but it isn't a build dependency, missing libcap in DEPENDS or PACKAGECONFIG? [build-deps]

libmbim:
* tested
  PACKAGECONFIG ??= ""
  PACKAGECONFIG[libmbim] = "--enable-mbim-qmux, --disable-mbim-qmux, libmbim"

  configure reported correct "QMUX over MBIM:       no" but still
  | WARNING: libqmi-1.16.0-r0 do_package_qa: QA Issue: libqmi rdepends on libmbim, but it isn't a build dependency, missing libmbim in DEPENDS or PACKAGECONFIG? [build-deps]
  => libmbim -> DEPENDS

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
index 4e15c56..5ac889f 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.16.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
-DEPENDS = "glib-2.0"
+DEPENDS = "glib-2.0 libgudev libmbim"
 
 inherit autotools pkgconfig bash-completion
 
-- 
2.5.5


