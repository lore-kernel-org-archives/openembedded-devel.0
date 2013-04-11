Received: from mail-wi0-f174.google.com ([209.85.212.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ndec@linaro.org>) id 1UQDbY-0005HD-GA
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Apr 2013 11:15:44 +0200
Received: by mail-wi0-f174.google.com with SMTP id hj8so301240wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Apr 2013 01:58:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=YbuliQymBATLxODvVm0sdRhXzZdgZYcxrUplFa3+ZIA=;
	b=G3Z+qI8ojj/KhDep2eCsKWzqxP6dhONKDaAJ7MXFfTUuWuWAOWg8WNcDVeH63AU3xU
	Kf1W+03k9hTKpiezjDvUg8OIK8OZG6eeHs9d8xv7y5iU2fUajWVVkL/GIQMZoiDzecwL
	tBbgBC8i6IhnFxxCnkDqPK7+tX1/IwRpFFtqu9y5cq01ZAcrUQucR9Qd27BXs8g0JGlK
	2rC8Dhol/rXYwht6/VUW2Lg4WXbFoZliae0Ds7Zm0JWn2Q6h4BcsHf57XJ9VlZAL1/dS
	hCDhItzWzSkCiNQ6Jxfgre5DDk4HN9zrKNW2EzpEa1LlRPA8XXJQbtQxvEfpikiSF44l
	6VEQ==
X-Received: by 10.180.87.193 with SMTP id ba1mr8778117wib.10.1365670697944;
	Thu, 11 Apr 2013 01:58:17 -0700 (PDT)
Received: from localhost.localdomain (gau06-1-78-243-126-63.fbx.proxad.net.
	[78.243.126.63])
	by mx.google.com with ESMTPS id ed6sm1970084wib.9.2013.04.11.01.58.16
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 11 Apr 2013 01:58:17 -0700 (PDT)
From: Nicolas Dechesne <ndec@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 11 Apr 2013 10:57:06 +0200
Message-Id: <1365670626-18585-3-git-send-email-ndec@linaro.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1365670626-18585-1-git-send-email-ndec@linaro.org>
References: <1365670626-18585-1-git-send-email-ndec@linaro.org>
X-Gm-Message-State: ALoCoQn08x0f2RekWPoctCVr1wyTi8ttymrpAjB31ol56yKhb5UWHA0fYfRshE7DAva1OQjpYwO1
Cc: Nicolas Dechesne <ndec@linaro.org>
Subject: [meta-multimedia][PATCH v2 2/2] gupnp: remove dependency on gnome-icon-theme
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 09:16:00 -0000

As discussed in [1], let's remove the dependency on gnome-icon-theme,
since it's not required, and it brings additional unwanted dependency,
such as the whole gtk+...

[1] http://article.gmane.org/gmane.comp.handhelds.openembedded/57483

It is build-tested with
 - core-image-minimal
 - IMAGE_INSTALL += 'gupnp'
 - directfb in DISTRO_FEATURES

The build was failing before (GTK failed to build with directfb, which
is expected).

Signed-off-by: Nicolas Dechesne <ndec@linaro.org>
---
 meta-multimedia/recipes-connectivity/gupnp/gupnp.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
index 31dd407..99bffc0 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp.inc
@@ -2,9 +2,9 @@ SUMMARY = "UPnP framework"
 DESCRIPTION = "GUPnP is an elegant, object-oriented open source framework for creating UPnP  devices and control points, written in C using GObject and libsoup. The GUPnP API is intended to be easy to use, efficient and flexible. It provides the same set of features as libupnp, but shields the developer from most of UPnP's internals."
 LICENSE = "LGPLv2+"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
-DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gnome-icon-theme gobject-introspection-stub"
+DEPENDS = "e2fsprogs gssdp libsoup-2.4 libxml2 gobject-introspection-stub"
 
 require no-vala.inc
 
-- 
1.8.1.2



