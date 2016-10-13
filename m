Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6D078719D9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 18:41:22 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id b75so13904304lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Oct 2016 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mbrSVGgOfGIwFzP6+2n9VN/Rm1okPYUVRtN+bEehzws=;
	b=J0h3sMjik/CDk2XHnlua66VMMZS8kBvJsyFhPObAGK0VCDqMmdq4uTWyQTrBNrT1nb
	Z7sjXW35oB1DAIT2jGEKEiZNjMaoEMD9jS2VGgVi8ROOgWxrykJO4oU/LhJzUU98mWNp
	Ii7G6jKEP0/I/alnH92rR6qlQpT6mQo0Cgt21DTcjkKyvY/MRjJYeS6XSkvgdn2vzm/6
	ReJLiTMunELf5oxHrnpxbU6xaumAMzegeHIzzNlEXtuinGr2ti1nWk9I6OYPqOBr0nmW
	FKHkpoUnjyrYqHSuR3K67x/40Nti8ad8UNRBOdbgnvAflDx54bUlzhsKYXkEe24QqC8e
	jdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mbrSVGgOfGIwFzP6+2n9VN/Rm1okPYUVRtN+bEehzws=;
	b=WwpYLRFBpVQ8MRB/VcEKVLZ7iZfap4QQR9umlXhwNB3CdjsSbRJZwxPuEevm8+Wwwy
	MePbC2dZCpUq7XdICAUowgl5w5fMkrP8c4veevsGzWnSZoD43eil5idZNhv2GDjAoWK6
	OoXgp9iwOYqNII094RHkuIN1u/pIQJOm9x/M/qszXKOfWPavZPSRy5qfh8pIWIQFNSoa
	FGRMeWliZzCt731wJWEXhrW84U/JQL58wO3D+Phv2pddhwIQrLiHQZNBg9v8yvejjXN3
	LpRPJDfT2WKPlMeECwXgqMHeKnbvPJkY5enYE0cUsb/p70ZQo0pMGnA7+UjASHdlHSWv
	i5ig==
X-Gm-Message-State: AA6/9RmTQ0RXNVjWTLod/dh4QGQklLOF/izefMDi+ilr/8bpQfJP8E6CqWthf8Z5Ydzugg==
X-Received: by 10.28.199.207 with SMTP id x198mr3065887wmf.34.1476384084058;
	Thu, 13 Oct 2016 11:41:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	ct1sm24611423wjd.13.2016.10.13.11.41.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Oct 2016 11:41:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Oct 2016 20:41:21 +0200
Message-Id: <20161013184121.18637-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <20161013183247.GE2924@jama>
References: <20161013183247.GE2924@jama>
Subject: [meta-browser][PATCHv2] chromium-wayland: skip when CHROMIUM_ENABLE_WAYLAND isn't enabled
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
X-List-Received-Date: Thu, 13 Oct 2016 18:41:24 -0000

* otherwise chromium-wayland recipe might build with CHROMIUM_ENABLE_WAYLAND 0 and then
  autodetect couple of x11 libraries
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on atk, but it isn't a build dependency, missing atk in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gdk-pixbuf, but it isn't a build dependency, missing gdk-pixbuf in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on gtk+, but it isn't a build dependency, missing gtk+ in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcomposite, but it isn't a build dependency, missing libxcomposite in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxcursor, but it isn't a build dependency, missing libxcursor in DEPENDS or PACKAGECONFIG? [build-deps]
  chromium-wayland-48.0.2548.0: chromium-wayland rdepends on libxscrnsaver, but it isn't a build dependency, missing libxscrnsaver in DEPENDS or PACKAGECONFIG? [build-deps]

* reported a while ago in:
  http://lists.openembedded.org/pipermail/openembedded-devel/2016-September/109131.html

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
index f7ad2ce..bbba147 100644
--- a/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
+++ b/recipes-browser/chromium/chromium-wayland_48.0.2548.0.bb
@@ -28,6 +28,8 @@ python() {
     if (d.getVar('CHROMIUM_ENABLE_WAYLAND', True) == '1'):
         if bb.utils.contains('PACKAGECONFIG', 'component-build', True, False, d):
             bb.fatal("Chromium 48 Wayland version cannot be built in component-mode")
+    else:
+        raise bb.parse.SkipPackage("CHROMIUM_ENABLE_WAYLAND isn't enabled")
 }
 
 CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
-- 
2.10.1


